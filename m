Return-Path: <linux-arm-msm+bounces-19897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC86F8C6CBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 21:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85BA5282466
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 19:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8297E15ADAC;
	Wed, 15 May 2024 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ugk4nfFu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09E715920F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715800681; cv=none; b=kvKyS/o9iHjyBHDjw3Sfyj3Hq3RuTud3kgL/h5PWygjC9v3pCta3adUKYKaMgSAR2mXM8bmpzds4/WNcA7E+HPbl0g1DRA7jI7WOGpNsowOPTfxFG7OIfQOUZoNmg5sQB+ZRHV5hkrIgT1/wV2lUc9DdLCUB562QgGFFiAlyEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715800681; c=relaxed/simple;
	bh=CPp/HTGSY2HiQLDatrLtpTGFshesDpce0Bi4vdjYKoA=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3R34VQBEC/qadkLeLeeyU/Wa+yXtjl4zdo422dQ+MlvoyFrxTLJPLfhVp8tFeDzv8gjevXT8pV6TMwtYXaq22tt8SCvSjCG8YXiTfCUDfd0lr7kEdJ7v4jaW2L7OuJ/bp+0Ukmu2CdoOScf2lm/MPFUNwLsjAfXPkNSgKASvDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ugk4nfFu; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-627788ce780so1029967b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 12:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715800678; x=1716405478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPp/HTGSY2HiQLDatrLtpTGFshesDpce0Bi4vdjYKoA=;
        b=Ugk4nfFudEGnmxbeMe3fqOScBd2csDTdrrIrc553IfAIMJtcBbrY9xyd11GfZa7zpq
         9g8MesNTlkcq5BNdZyJdbG2ltgjJ6HeQHjF1PMlhJQW/o8QhHDmrJmwal5UtP/BQ5K9a
         d/YRZnPsUJnZAGkfgFNMAcmo85SqcBJbmRw6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715800678; x=1716405478;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPp/HTGSY2HiQLDatrLtpTGFshesDpce0Bi4vdjYKoA=;
        b=RIIBwgWzZDFDrgqoaoT0sGdr8qnN/McNAe0f0PiRuAxf03EC5aJPTl6uZSOBS+OVSB
         lK0KRMNmv125FBs8gUQJdnw1TX9CB6DN2EtHC74hzFh9j2Zie4M8lqKiCA2G/GueAzI2
         YLfJlBITyTOb4Tl3fSWAazoARJb5SXRsa1yC9/NyX/XI/NP7BHrPrKqS8UafmS5buwCk
         rA4y+zVZz0SggxLuvQQrTD2hJV3KWrKX1PfeD6MixvuMCWkbhE5T/l92eI+TwJmLuKN4
         +JoHaUzPFkNcKOgWKnOyQd05HDihI1bcKSaGF158By/iw9rQBO0fAwhpkstnOMbLu3/i
         0ZSQ==
X-Gm-Message-State: AOJu0Yxj7l1n+Q4kclFpSyqMxtp4NwkK8awMxWRv6S+m7QIBWNQ2Ds5f
	TT8MHL0phNZ3Pc7k5AFQZaEeNKgDgF6m9nHcXMrk4EYFhbSYHb96wWK4Q1iOktZsB95whSAbVn7
	NS00Un665EeTiopeZRbkWMxKGajg9du47z7zt
X-Google-Smtp-Source: AGHT+IFwkFXVASVtHHXe54Bdbs+H/MUnSJ+K2O/gJn4A57/o9XwLM5LjW5jlvs0cYMn5hlnXOzinjk+dbmRrXQRVB6Q=
X-Received: by 2002:a25:900b:0:b0:dce:fd56:b213 with SMTP id
 3f1490d57ef6-dee4f324ab4mr16873966276.7.1715800677723; Wed, 15 May 2024
 12:17:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 May 2024 12:17:57 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240514-ufs-nodename-fix-v1-2-4c55483ac401@linaro.org>
References: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org> <20240514-ufs-nodename-fix-v1-2-4c55483ac401@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 15 May 2024 12:17:57 -0700
Message-ID: <CAE-0n50nygK8+0yVUx6MQPwG7+07J+MuGcN1vx77RPZOipffPw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Use 'ufshc' as the node name for
 UFS controller nodes
To: Alim Akhtar <alim.akhtar@samsung.com>, Andy Gross <agross@kernel.org>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Manivannan Sadhasivam (2024-05-14 06:08:41)
> Devicetree binding has documented the node name for UFS controllers as
> 'ufshc'. So let's use it instead of 'ufs' which is for the UFS devices.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

