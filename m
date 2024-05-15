Return-Path: <linux-arm-msm+bounces-19896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA58C6CB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 21:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5523F1C20CDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 19:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B674159575;
	Wed, 15 May 2024 19:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VaVjYqTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B6D446AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 19:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715800646; cv=none; b=nBBH14W1nG67t5h0qmVxw1CHXgykAvuIdRbud/SfPAXA+2Z3bCEdih4It86mxZLIzWNz75DCjKfz6cBvmWWvmNhAFdv9E9iPbb9ZlthOQd5XcLRy6iv2z/kRj+SdKWLKkC4iGNv/5iITkb7VUma/ykUz7104/3o59J6eAJbXxNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715800646; c=relaxed/simple;
	bh=2wOSUNfTJLFeeO8pVhd+GkVyVWXNaK2KlYom7vpA//o=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhH7V6PJwiSbwtPiEPOMBSJ0wWzwLo4gOvSDPA3qRFPZY+UiJooivylNbCdQko/vm7VPQaLV3kl9INSKRpFG3ZfgIRDL/+vO60UPjReyx+aZ3YH6DQ5gdLM424JXRz9jlHKoUV/SHb+EoctMYRZG0BteNmSAv5WHehXxWfLWj0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VaVjYqTa; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-deb5f006019so7757434276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715800644; x=1716405444; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wOSUNfTJLFeeO8pVhd+GkVyVWXNaK2KlYom7vpA//o=;
        b=VaVjYqTaqag5ahciEsniuQeiaaM1+WmSRLj7IXRyvHoUt2DH50yTedQ5Y+ummo9hEn
         8ibYsnVWXPkJrxQEpwQXEaVs7XGLeZFLK7BqoePSkso/7QRO87sDMaieV3dLy3HJfPil
         NCPGqIv2fz2hMHLsN1IVkdzj3PL341mKrhO2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715800644; x=1716405444;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wOSUNfTJLFeeO8pVhd+GkVyVWXNaK2KlYom7vpA//o=;
        b=bXBOrhheTTPx/3xHe0I9zztx/NbYJPRUaIblLrVYYzoOI1E3VJq1d6Sa/CAE4VoZOK
         NkBmPLVobSJvaBfK1Z4MsIzWsZrbrZhvdwuLWjDWM3xQrnf95HFrekHA3aW+fv655XQf
         H89BhbQbR0EScHRQQxrcvaNDSX6vOJbK/xeXYdIxKJvnf5aRdtlektSTjhjTrAfZwqDN
         GhIP+SVbplIQtlizxS/A4R0tCGulwWS/B8UJqyiUVX/fwhyZN6QtaR5VnYOHiw6rBc7M
         OsLiCB2nLAjkEr40O7k8mmycAamGsIuNDWJnbCbr5Y44GD2DN/SXcRsdFZ+kR/d39DOl
         vudA==
X-Gm-Message-State: AOJu0Yx5ty8j5Ytuy7kkb9dfykuhiSm8vor78KriIwEbQCv4egGHTY4x
	1sUYk7ZwkkSRYnwtsUsd55vBM/C5seyM+t2yIYRjqP906SMccctdwaSU0F8V49/6W8IqgsOxoVQ
	qLc1Vssau1/5cCDo7y0vHmBXoSG5WB6xzAT1y
X-Google-Smtp-Source: AGHT+IGovPGHDhP22BqWNaDOxfm72F+WXpO5BaZMtM00OAugcjSUU6eQQoWzKsASpiWzzblUTpSndz6EgU420El/kfY=
X-Received: by 2002:a25:2e0b:0:b0:dcf:3ef5:4d30 with SMTP id
 3f1490d57ef6-dee4f2c71dfmr15357241276.17.1715800643992; Wed, 15 May 2024
 12:17:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 May 2024 12:17:23 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240514-ufs-nodename-fix-v1-1-4c55483ac401@linaro.org>
References: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org> <20240514-ufs-nodename-fix-v1-1-4c55483ac401@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 15 May 2024 12:17:23 -0700
Message-ID: <CAE-0n52AYOgG7S3acMj4ZJOvAwNLvQnnv_P8=D+fMYZb0csoBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: ufs: qcom: Use 'ufshc' as the node name
 for UFS controller nodes
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

Quoting Manivannan Sadhasivam (2024-05-14 06:08:40)
> Devicetree binding has documented the node name for UFS controllers as
> 'ufshc'. So let's use it instead of 'ufs' which is for the UFS devices.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

