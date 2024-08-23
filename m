Return-Path: <linux-arm-msm+bounces-29376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8613495D2F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 18:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EF3E1F22B41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 16:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCD5189BB2;
	Fri, 23 Aug 2024 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMVOYl//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704D3189539
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429666; cv=none; b=ts+8d+IHRG152Xb0QZwQErRHXWTFpa2cXldp9NAtcN3M5ZJfAPwKbw450AeX1qAQngZ35jZTnGhD70G2GgYBsKpVZmsfPUOAS9wI+fweXKi1FdS0byONBjBwVHHVevQMtCFr2UCUBYy5j8CUn+qvZjnoUIk6pxspfioX2YdZbVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429666; c=relaxed/simple;
	bh=mkK9OpIlp+rC5+8SuvVSTiaZiUn8xekgkAN2PDqZa98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUsiNErcyWsBh3I4ysjWOHvmPRyyvDkmb4IxnUD7yFvUzgg0RZrAxBlZ+X0Db918ZGNgpTrI8Hq2HA5WTZ7Zf9q7xYu32WQLLk1Uw9b9P1mBMfBntX67VaE+ECpmIHBFvSssU2DtX/nDPiYjp3ChbVbkRjHJVwLm4fEqfXwq444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OMVOYl//; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5334a8a1af7so2116745e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 09:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429663; x=1725034463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkK9OpIlp+rC5+8SuvVSTiaZiUn8xekgkAN2PDqZa98=;
        b=OMVOYl//1AEprFgoo69NCNiFCe6wu88vrEG6x0WIRZeqNtZZlknzC1EB6mhI/PmvgF
         FU1FFNud3FxHadF0b0mFlUBFmwGDEIjWo4i4RfQ6KMq7ResI7L2RD3UOV+WWJ0JPobs4
         tZa7tyPFc7hLVfXATqCVeqs33/RqJ/x8NPzXKrg8AB8sePqXnjPWY+EyXlZLgs8wYpXW
         CQXG8aaAccvhTK2OILFc1vF9EE9/wI5JR87hY9HkoKQctIT+JL3VVq+PFaOquXEZc7Av
         UlZs7dAUpKlCj/0Bd6G2ArlBTxzvENxUb7LFh+GJomwdHMU0QUsLnsJDr/trw4LmqmfL
         U6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429663; x=1725034463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkK9OpIlp+rC5+8SuvVSTiaZiUn8xekgkAN2PDqZa98=;
        b=ahu5qd/4fypF3Ytf1/T0BmBUU3Q6DRN44XfF0502HCD+MfI7iI+ycxYCGZXV3Rok2t
         TrsZSIU58Uj7jokFchga/642Js3RXKL2hOLIips8k+4DDfIRp09y51zcrG9p+dBOxaV6
         3UTozSA6NQweSgMfTg7BmhDkgBedcGNUkPqDYrcvQ3bkztD2ztiYl507z9I/cltY69sT
         kaEvHpIp/gTGuXDvbe/1ZP1f0JY6IpQ0QJgfgXZDjPJXJrsvzetXhQpSGpPhAn2g3T44
         XW5ZqjdhtSLlvGBGtUXwzWMUGLubctnEShOyfWxo79o+VDdlPGXHDifBUoy+RE+CBfr/
         RkqA==
X-Forwarded-Encrypted: i=1; AJvYcCXJLF+bcyXWlEdTqb9+oZbAYDvj3TEt9GSp39XHCID9fdMKUvpGYY6nImQzeWISL+PnVNkgJ9+f2OATu4Zp@vger.kernel.org
X-Gm-Message-State: AOJu0YxJLWDQxJ3/GKsxJbjjnI3/hH5/zgMVtknEWbnk8PBbJKigFb3G
	zR9/NRkm2HY0JdWKKYEoeAGRbLFgIAuc4KLJuXaB/LUC82fD7TqnGw7FElgKx6iKV/PFvN2zqt9
	eydDH2hitl54QlGS8uyEpEaNQj95CMChkX2z1ww==
X-Google-Smtp-Source: AGHT+IEsfcnzPgsQoJ771YERWp2GUiap4p2oaV1CMBOAbsvMhAWazYNU+D6IzPIgm3rXTmstOlX2PpANC4vujmG4rUc=
X-Received: by 2002:a05:6512:3c87:b0:52c:dc57:868b with SMTP id
 2adb3069b0e04-53438779988mr1859108e87.13.1724429662127; Fri, 23 Aug 2024
 09:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809-topic-h_sdc-v1-1-bb421532c531@quicinc.com>
In-Reply-To: <20240809-topic-h_sdc-v1-1-bb421532c531@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:14:11 +0200
Message-ID: <CACRpkdZPO=3RUAjMjB8hekn4s469d6LdCAiRhBYHh5ix5Z5_7g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Fix special pin offsets
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 2:22=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:

> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
>
> Remove the erroneus 0x100000 offset to prevent the boards from crashing
> on pin state setting, as well as for the intended state changes to take
> effect.
>
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>

Patch applied, sorry for the delay!

Yours,
Linus Walleij

