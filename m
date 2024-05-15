Return-Path: <linux-arm-msm+bounces-19865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D03228C61EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 09:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C6F3282647
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 07:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE25D47F78;
	Wed, 15 May 2024 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1I2LBXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC26A4AEDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715759001; cv=none; b=BK18xuWsEtG4tJ8iPoTwvVdI9TiTY7Le3bc8S7XrM3So+Sz1fVASbU5O9v2TvAW2Xpk31yAwn76bvIKMgylzTycKOr7q600oyqI3gOqmn8BmL39xq3beEDRPUhWncPf51ck4sOleOp1+I8lYK21AkAh+xEnfA7OOhPUFXS5soXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715759001; c=relaxed/simple;
	bh=E0IGluC5+XgNT11xJ+RtB5dreOvQpxGunKXJku9jkWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COnwX0ijzdmZvOrpvpaVSSuIrylBxTwRB6wUtJutIXDxKHqGirMIL7WF8uiKgse8h8EeMwx+7q34TdmV+GKnH7asAoH3Qhkcoc91OeASgZxHGDksElnggJ/ZOl7UOD9+t/QbsxhHvkCOKk5XR9LA9QXtkH3hxupYh8Mt0TszrEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1I2LBXI; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2dfb4ea2bbfso76255211fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 00:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715758997; x=1716363797; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YjDBypUekJr0+IQ4Z+KTG8+Tk3A3MRsLN1U8VmTHyxE=;
        b=j1I2LBXIi07weseEa+p8Tap3GE9BH1ngr+X2gQ7np6VUSeX908xM6VptdoWcdsxOVN
         PSZNv4iQv3QqRbtSq/BP2zfBys+BI8nQ0aCnqNS7NouIYFLCW1FaJx7H1t4uezEkCoEH
         NVzwrS9unlmNkv/xGqwt4OtkafTOP3i3HfqFzqDOr8+SXFCto5VqvW83jJXAQLf4JcBt
         4cseiSkLazYn9z/zBZPIs3YabyfAhxeFiwPHZqUZ5yinrEVveqYvHOc500+FdVyEd8E+
         Ok8O2wWAUjagVmiv//uL8P/YrvQUh3b6mQ3H4Hc6wwF1nI5i/OH2gwJnc3kx2Zwynw/H
         KAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715758997; x=1716363797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjDBypUekJr0+IQ4Z+KTG8+Tk3A3MRsLN1U8VmTHyxE=;
        b=PUc0X/he8/heteRvQRztwagrK6apkclXNNK8Ggwl6JYanxRyYI4kqIQDGpJ28o6M4M
         2fRkNABbM46ORsCj2g00BGG1zmda4WLs5+WT7Q+JLSkVHOpmOlG/3j2Q5BF2s0VJ74To
         ICo6AZD54GDcgCBZhvpWhWOJu1ZarAfb9+Iv75a5Idjpbus+ut2Wl+YYcU2C4ACoVIic
         WsGBPhCKVV3vTbEGUMF4AYQLvK987bZWTRtD4Ut2JXMBng2iiP0fmGJ4S3VwOC5cHqr9
         BSlI5fv/gCPDYQjDSzfq9pFLBCOVqcaQ/DLUW0TIwpVHTeR8hU9H92jCCLh5BAOUDm5r
         r5cg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ4dJpi36w7jt2mcfkfgimVDksB12n30ogqymsYiiEmEoidiEsUPWxPAJ17du8JoUK1/JrmNG/KjXHvY5VWXyV8sjHkQKrsClEdg+xxg==
X-Gm-Message-State: AOJu0Ywqzdx6MJPofW/ATQ7XygFPC0xZFTgsO4Qk/TkwQRMv6csNMyc7
	NmWKG8hpJaJq3NRKDEWKGH6Rqzo1MLFeovNDUXDzLfxxh7nQtiYAZqls7i+cS4oCADTrCrcmaMC
	b2w==
X-Google-Smtp-Source: AGHT+IGNYhZGnS7whMi8D6i33kdHngdHjgTrOicH2QUT098ZecRQ2W92yX+Fz+KdJPd9cb5m4ij6hA==
X-Received: by 2002:a2e:8806:0:b0:2e1:afe7:4cd2 with SMTP id 38308e7fff4ca-2e51fe5273cmr87212431fa.11.1715758996952;
        Wed, 15 May 2024 00:43:16 -0700 (PDT)
Received: from thinkpad ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce73f5sm223704565e9.21.2024.05.15.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 00:43:16 -0700 (PDT)
Date: Wed, 15 May 2024 09:43:15 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re:Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <20240515074315.GB2445@thinkpad>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
 <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
 <fc42977.1ac5.18f79eb945a.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc42977.1ac5.18f79eb945a.Coremail.slark_xiao@163.com>

On Wed, May 15, 2024 at 09:43:53AM +0800, Slark Xiao wrote:
> 
> Send again with text mode.
> At 2024-05-15 09:29:20, "Slark Xiao" <slark_xiao@163.com> wrote:
> >At 2024-05-14 22:37:41, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >>On Fri, May 10, 2024 at 11:26:57AM +0800, Slark Xiao wrote:
> >>> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> >>> And also, add firehose support since SDX72.
> >>> 
> >>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >>> ---
> >>>  drivers/bus/mhi/host/pci_generic.c | 31 ++++++++++++++++++++++++++++++
> >>>  1 file changed, 31 insertions(+)
> >>> 
> >>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >>> index 08844ee79654..0fd94c193fc6 100644
> >>> --- a/drivers/bus/mhi/host/pci_generic.c
> >>> +++ b/drivers/bus/mhi/host/pci_generic.c
> >>> @@ -399,6 +399,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> >>>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> >>>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> >>>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> >>> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> >>> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> >>
> >>This means SDX55 is also supporting FIREHOSE channels, which is not true I
> >>believe.
> >Actually, I just verified it with my sdx55 and the answer is Yes. These channels
> >are common settings for Qcom device which support PCIe mode. BTW, the
> >default settings of Qcom and Quectel support firehose for their sdx55 products.
> >>
> >>>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> >>>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> >>>  };
> >>> @@ -419,6 +421,16 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
> >>>  	.event_cfg = mhi_foxconn_sdx55_events,
> >>>  };
> >>>  
> >>> +static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >>> +	.max_channels = 128,
> >>> +	.timeout_ms = 20000,
> >>> +	.ready_timeout_ms = 50000,
> >>> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> >>> +	.ch_cfg = mhi_foxconn_sdx55_channels,
> >>> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> >>> +	.event_cfg = mhi_foxconn_sdx55_events,
> >>> +};
> >>> +
> >>>  static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
> >>>  	.name = "foxconn-sdx24",
> >>>  	.config = &modem_foxconn_sdx55_config,
> >>> @@ -448,6 +460,16 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
> >>>  	.sideband_wake = false,
> >>>  };
> >>>  
> >>> +static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> >>> +	.name = "foxconn-sdx72",
> >>> +	.edl = "qcom/sdx72m/xbl_s_devprg_ns.melf",
> >>
> >>What is '.melf'? Is the firmware available somewhere? Did you plan to upstream
> >>it to linux-firmware?
> >>
> >This file similar with "edl.mbn". In SDX72 product, the default "edl" file name is
> >"xbl_s_devprg_ns.melf". Currently we don't plan to upstream it to linux-firmware
> >since 2 reasons: 1: we share the same fold name sdx72m with qcom or other vendors
> >2: this file may be changed since sdx72 product still under developing in our side. we
> >may change the base line according to QCOM release.
> >>- Mani
> >>
> And I want to say, the os or driver can't recover device with this "edl" file only. This file
> only used when device needs to be changed to firehose mode. After that, we need
> a tool and a complete firmware package to do the firehose download. Unfortunately,
> there is no open source tool to support this download. Even Qcom PCAT tool only
> supports their own VID/PID with their own driver. So the function of mhi driver is:
> Put device into firehose mode and enumerate the wwan0firehose0 port. The rest
> shall be done by enduser themselves. 

Can't you use QDL tool? https://github.com/linux-msm/qdl

- Mani

-- 
மணிவண்ணன் சதாசிவம்

