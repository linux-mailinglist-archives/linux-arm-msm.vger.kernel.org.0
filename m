Return-Path: <linux-arm-msm+bounces-49178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8443A421FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 14:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61C563A0F73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 13:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAFB221F3C;
	Mon, 24 Feb 2025 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GymbdWTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82182F4E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404737; cv=none; b=TIpmzgdm/cwbmerR+yIvKqTsxKA46yUC0bRqggbrOO2wIYWcaHG8z+4fWnJCofZyWrEfGDLkzdZNuVJ3R0FHnsQ3tWAxVU2c0XRw2irqgH76bq79G4pFYMm1zNZ7Skb/KP2R5C1E+lxjOnZLT/pL60HSxevPsvbu68KTJmRvrtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404737; c=relaxed/simple;
	bh=YxFGfTzbpsU2Ndkj72fW5M98h/iyMTLKmwsYCZh39AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAimaYYJSq4UTNx1YzeZae+UccpqNU5XxaSwFSGvAP7v1IR//ILKtGCeQX47NK+712GNWDuvOdwxCOfIVd//Rs1p/ob/1dHUp0g8XuhF9prdB0wKR1GHuywWlPohy58G2zKkuNOYtJe3am5TIGydDwINt67R8KmvYifHeTGdnlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GymbdWTY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54622940ef7so5051427e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 05:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740404734; x=1741009534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQtxIikjRYVU2YE1FfJsa2nPhFSgRqTZXI/yYof9sW8=;
        b=GymbdWTYsed/RydxRDc9aOdFhthWOBvWn+l0gJyIVc1Q45R3CyPuxj1Ir130IysQcN
         PwgLsuya/GkJfUu0PMIczUqPmVgR8N+Jk5UE1SbcaYXKxMtUCNVlToRKV0Yw0ZKr1g9G
         A7YhtjcjARi76uP9QYmZxe3akXY3bGjD2ZJkTt1x24b8Ld0xW49NPevgNnJpF4qnGR65
         pcFgTFAqz9KaIl/xwf32OJkhGQ00Uoi86alN3kddllPC4YUXygyOMJInNyfu3Qg8qhqJ
         8jPpc9dnB43AD5zZzP7edF7yEqCW2p3b6ACuVRtXVP3b01pMboaARIilGo+L/qTuB7EH
         vdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740404734; x=1741009534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQtxIikjRYVU2YE1FfJsa2nPhFSgRqTZXI/yYof9sW8=;
        b=tFMkqiN0HIEQPCUFmxB3pHl1G6no9rU9lLRQLnpMcM34aE24ADl92h1DSNm5R+GnrV
         MPEW6WfjcFleq/S2+xJySsql/tL9xHSfUWagXhxjoQy3/Yvqjz1m0SaXaeTxia9MYPa4
         jzwnWT9y5VMHPTB+gFLKQsvURdQJLVnN3VJtOuN6VKEjxIcS3MOqdjKKfNbEPKlnZRWJ
         sI1p+GIaXleBupbq3id1uVlC5yK4lSYkzKDnIX80+CGGQrNVMeY08271FuDV/su+9meN
         PzC/rS2p2Dzg3rzVXoP79uEGHTJmoUWrz+ptfxdwomC4nmLZx5DmGW2AV+UZo5WGek0v
         e3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUrEmh9J7EStNb5sBZfjCjdggwKmmrlYtdPjfzfSXLRL7OtSOAccoLEn5/V5RMyjCHqgpKe7xz4C1INvaaF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0pt1WNOGW2biGW4ADPSdcTYbdkwaK72HwgWncgRVD0Fy58dYK
	Wx6J8DWXYRCuWo7Ph2DJWqRltIV3MJSSIWPt+GAsUPVSXSUAjPGkl126ayvY/NE=
X-Gm-Gg: ASbGnctE1LmuKqiCSkoVpGjGULH3f1wxyVnSq9csclmGBVG8Sh904/uIwQn2EiOQTql
	SVvLYNSHoMlDkDAGH+B+Mg8GsMtB82f45cV7qTcuZhq3xwBQdmg32aJOFkG5PAGWfi+MshFPsJV
	4Qtf4Q3cQJ+ZiQZkQ2dZ2wclnADmopzaqm8FE4GqfPTVcpkYtZBFHa1cwXh2IE2rPAIRVmHn3yg
	+IWZktSlpnuhTwS2j5HOKminh+9crIwDqfNR2VK2WDPqwll8W9WVthRABR48XR2NVL965I8WKqw
	bA5wiVuk2m8VfUDxRf1AlnVnCv+AYxvvMaL1QeNloFriDOntfv10U9uIpFnKIXC2QhFOem0x5/C
	+KBxpBQ==
X-Google-Smtp-Source: AGHT+IEOHs/ggD9ekbq8Mt/oGjuToBiu/aq901Ne4MqUwh5GjjUsqmuKg0uvV17mLepWLhRrNwcWHw==
X-Received: by 2002:a05:6512:3ca5:b0:545:381:70a with SMTP id 2adb3069b0e04-54838ee8ae6mr5302777e87.15.1740404733603;
        Mon, 24 Feb 2025 05:45:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452eda31acsm2966821e87.119.2025.02.24.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:45:32 -0800 (PST)
Date: Mon, 24 Feb 2025 15:45:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: George Moussalem <george.moussalem@outlook.com>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	amitk@kernel.org, thara.gopinath@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	quic_srichara@quicinc.com
Subject: Re: [PATCH v6 3/5] thermal: drivers: qcom: Add new feat for soc
 without rpm
Message-ID: <n7twid3k2ykwjviidngxnl3tdy27uxx6uhfh6hj2tpztufagwn@6zd7vre6dnqt>
References: <20250224061224.3342-1-george.moussalem@outlook.com>
 <DS7PR19MB88837D7AE30CE306B8F71F3E9DC02@DS7PR19MB8883.namprd19.prod.outlook.com>
 <be872be1-dd0a-481b-abe0-57ed2bf50c22@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be872be1-dd0a-481b-abe0-57ed2bf50c22@quicinc.com>

On Mon, Feb 24, 2025 at 02:38:24PM +0530, Manikanta Mylavarapu wrote:
> 
> 
> On 2/24/2025 11:42 AM, George Moussalem wrote:
> > From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > 
> > In IPQ5018, Tsens IP doesn't have RPM. Hence the early init to
> > enable tsens would not be done. So add a flag for that in feat
> > and skip enable checks. Without this, tsens probe fails.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> > ---
> >  drivers/thermal/qcom/tsens.c | 2 +-
> >  drivers/thermal/qcom/tsens.h | 3 +++
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> > index 3aa3736181aa..a25ca17adf1a 100644
> > --- a/drivers/thermal/qcom/tsens.c
> > +++ b/drivers/thermal/qcom/tsens.c
> > @@ -975,7 +975,7 @@ int __init init_common(struct tsens_priv *priv)
> >  	ret = regmap_field_read(priv->rf[TSENS_EN], &enabled);
> >  	if (ret)
> >  		goto err_put_device;
> > -	if (!enabled) {
> > +	if (!enabled && !(priv->feat->ignore_enable)) {
> 
> Please drop 'ignore_enable' and use 'VER_2_X_NO_RPM' instead.

It is not possible, since IPQ5018 is 1.x. But I agree, a similar concept
should be used.

> 
> >  		dev_err(dev, "%s: device not enabled\n", __func__);
> >  		ret = -ENODEV;
> >  		goto err_put_device;

-- 
With best wishes
Dmitry

