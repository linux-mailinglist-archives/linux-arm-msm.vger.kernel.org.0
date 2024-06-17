Return-Path: <linux-arm-msm+bounces-22812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6454790A806
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 10:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11560281A22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 08:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977AE19006B;
	Mon, 17 Jun 2024 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ttu1Fob0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2D4962D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718611279; cv=none; b=NIzK7xh0UyHyTBf7Ao/ru9kUsD82XEMkuVxW/L7yvyYIJw/gofRTR4kEVz2qFpo3R1QC38FBThFwBolAyOJaMy/tSsxQe1cp3ICZf/3+2qzhPIM96m3TeyHxB3nJb36WYzpzPGSi7gsPjx3qh4VA9ruEz2XZwfVqiqHwYLGMkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718611279; c=relaxed/simple;
	bh=vuhA+mIQJ2RSX99AvGZDj+nJCxG/WKXFPdCWspBnQ4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1ygymD0Eg6A3edsh9KcjWEmIAqJpOpjIst8jxRTTNDQEeD4yvecUojoeZ/wfkQRHF1UNNsvpj2ESzEXQrGzq5KLyg/zhp3Th7jcE/4QpBvKA5kqJ8mVgqVhax+mTgo/8d1cONC3I/CxGBmvcs+8SIjxEhfX47RRgK4BNyq/Eak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ttu1Fob0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52bc335e49aso4664050e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718611275; x=1719216075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ/lnoLnxwCnySxytQb9nQ5xYtOeT14sXw+lATiwThw=;
        b=ttu1Fob0SogLsviZMpJWehzESO7MkINj54O/uV4UrjfKY8zGLixhccbCHK+XR4sTwU
         rsZajLUcTyLOnAS6tkrpzSF+znIIAiKlaFj1nHSjA8LBsimR97X2UqQuPwx2FYgf3JqC
         nbTJ4e/dbPS9disTbUOk3S/vLzeYdS3Aby+R5ye1VYw3KorYuLbvnGY7dYhBxyszE6/Z
         AxuYRvJm0Cm9fLtk50fEG8rElKX64aB6L8lgM9HU+5Iu06r3rGKwnoOPbWMAu+G8k+Ma
         S7TO+0V1ZsxSwxGSbFYvHrEFrCHsbsdLOXEgjDE5Y38spdDCgYrNhygA7kWij6O3vi7s
         KZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718611275; x=1719216075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ/lnoLnxwCnySxytQb9nQ5xYtOeT14sXw+lATiwThw=;
        b=upwd1JQPPlWJlh37XIYjnWDmNYwJinvevxZZOH9b1pnJLRDvrTaFZGTHU63knx4/av
         jAyIg4aTw6m0hE874LhVvwJlOghpSiKEeaKcO7mulDhuVMsSDxFpK/O9oan41ifa5ayy
         +Si+NTQGX/wzuYr8AZjaPLyaRebsyYjO4N2ZSMhXH00sl3Qcf4BakbT9c25vTr0cdgJK
         7yyriLYAiZalYb5jtcN7ouXmdXDQeqdsa8ebW6E/HAOb4vT9lj2/2EHjnpbveV5ml/nF
         mZQGRrtbTDHiynAXARujGFOQUsoiL4/pRdL+X8yr7m1h3ALE9IwWPhKDSJVw3hZd+Hbd
         g/Ew==
X-Gm-Message-State: AOJu0YyzCScoE15dwTvHOaoHzmmTGsOrn4ssnDZcnx9renrIeO4/jIle
	4JKWRluO4foXrnhwYBTQlmy7LOdzUFvRmjahod+ZUOJaOBaSsf7g//upnEGe8F0=
X-Google-Smtp-Source: AGHT+IG71054E0fvJQuGC+hqCqYraV8STNLzGUuueTN+wKbvGZ5vdciJje61F+fQ08XOpku4G9g32Q==
X-Received: by 2002:a19:f703:0:b0:51b:214c:5239 with SMTP id 2adb3069b0e04-52ca6e9f465mr5226032e87.62.1718611274876;
        Mon, 17 Jun 2024 01:01:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2826269sm1169293e87.61.2024.06.17.01.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 01:01:14 -0700 (PDT)
Date: Mon, 17 Jun 2024 11:01:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	andersson@kernel.org, ebiggers@google.com, neil.armstrong@linaro.org, 
	srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	kernel@quicinc.com, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_omprsing@quicinc.com, quic_nguyenb@quicinc.com, bartosz.golaszewski@linaro.org, 
	konrad.dybcio@linaro.org, ulf.hansson@linaro.org, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, mani@kernel.org, davem@davemloft.net, 
	herbert@gondor.apana.org.au, psodagud@quicinc.com, quic_apurupa@quicinc.com, 
	sonalg@quicinc.com
Subject: Re: [PATCH v5 07/15] ufs: core: support wrapped keys in ufs core
Message-ID: <dk4y53xrkn3jv46mpr4n62yl5yqbql5gwn3c2syyvai3simcph@s767oanivria>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-8-quic_gaurkash@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617005825.1443206-8-quic_gaurkash@quicinc.com>

On Sun, Jun 16, 2024 at 05:51:02PM GMT, Gaurav Kashyap wrote:
> Since wrapped keys are not part of the UFS specifications,
> it needs to be treated as a supported quirk of the UFS
> controller. This way, based on the quirk set during a host
> probe, UFS crypto can choose to register either standard or
> wrapped keys with block crypto profile.

No. It is the user who must be able to select whether to use HW-wrapped
keys or not. The hardware / driver can only specify whether HW-wrapped
keys are supported or not.

> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> ---
>  drivers/ufs/core/ufshcd-crypto.c | 24 ++++++++++++++++--------
>  include/ufs/ufshcd.h             |  6 ++++++
>  2 files changed, 22 insertions(+), 8 deletions(-)
> 


-- 
With best wishes
Dmitry

