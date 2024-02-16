Return-Path: <linux-arm-msm+bounces-11356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7679B857E19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 14:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19DA228460E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 13:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E0F12BF11;
	Fri, 16 Feb 2024 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VB1e4192"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201F129A74
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708091575; cv=none; b=D8w1FkNMMRZr1Rb/pPv9A46Uutu99hwJQBwU4iHyjAKqvMkjnFG8WeOROq7MVWmIcTicedVBcIyZDa/cJ9lulaW46XpO4b9jdk1hxZFPQi8mKvVueLuRWV6giIVcpvyF4oROCB9DjmFCJ0zuw5hD8r+KwwCH61LZ82aEZxKN4yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708091575; c=relaxed/simple;
	bh=xNpXVvKRPsTrj/Mzz8I8ejGA4UCfRcdLu0H+70btQTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsmdNWeXexjSeDkLxPift4peQR9Ec4t8MJFyBz4M7AEfXqFQY2AHxCghiWiUTiXvtGGYVVb30kX9IkqNURrlRkJUqUcwn9sxspHfrt67/NSZ/vwo6DGILBSVWi3WWyY5LOCIxyRoge7DWp+0tUzTUe3ynHcGL8CiZOTZccsd+ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VB1e4192; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-59f80e1e259so1082303eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 05:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708091572; x=1708696372; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=txRJIv35R09tUN5MfiS2GVQlI2ntTTEw/eVgWdiZrzQ=;
        b=VB1e4192DhHmjWHMmAwglNGGolZVlxlUQr5OXTTZQEApPow8ftWl4DDNG13LNDrxqX
         KRdQtp9kB0BMa+47bVxPjJbJzH9mNIvftz/vHjby7MEvDutnrmcYWcmrZGfeWVQEF+Is
         vqZ2FYgsvbCZ5GSZDnCSIHGyMkmLNqrZEWQBmrLREZhl6JFj0qU1F9FFXMK1RKMFSc3B
         BYuL/Mzy3WYwbIn3aBsNlHTiOkGTT8825RSYR4N8AuvA/xLzQWujuoh6gCpj+swJsW6M
         +MV+dw3rn0PqmgKf1Zy7RxowZT+NBtIT+AOikLDPrmOX2GxkNuTVSWNzVuyp5gR3ekQW
         uJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091572; x=1708696372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txRJIv35R09tUN5MfiS2GVQlI2ntTTEw/eVgWdiZrzQ=;
        b=sKKSt9Tv3kNHvBTxXU+TEanUj3VW+9OJTeTADIWBndMSlA9SDnnDGGC46TI0PluYTP
         89o94xXjZRfTWuukyrunzu8GrXQS/eaA0NVT8CfDyeW5NnerNd8KvQHzge47OZcreZ7T
         58X2/aEu/1OAEME1F33X7lcrSrMIwfLvDjpcQ9FiFP/R+W/lE8VNKhEt/jaCGcKqUUOH
         9IB0U5k/u7kVPy0c5E+i/9SfMz1r9aS3WWZKJxmwL1lQsGth5YhxcHpSvuiCgbYDXtzT
         2zzhmHYPEanHxXG01+mVLb2ie7I0DYAp918q85D75J2wkxHNQmARgojT+wt6jIuFibtW
         PWAw==
X-Forwarded-Encrypted: i=1; AJvYcCWlD6TwwEqT39KCaKPO8XpNx4B4hUjy/rGIa9nSRGvqUN1WzSX50XsUgNmaRkhcYALo9Ep7haGaj2LV8rzrmBCANgSFA3RvFhM86zm1yg==
X-Gm-Message-State: AOJu0YzfjX63qqb+OR5juPJJn5AyFLl5DWS+3dmf1hPHPcq3R/9WZncq
	/FCkS7PZ2MeLuNSUcMzoYR0c9ic3dJHIv7oh+dRITahlsFNI7xG8UB7VJjfCSg==
X-Google-Smtp-Source: AGHT+IHLmVvUWapv7oUFnRXFU043RYMQhKVtctMXsXagpqJTQfV8kTfz5kOQItDz9MAbIRUab45aoQ==
X-Received: by 2002:a05:6358:9213:b0:179:ff:2486 with SMTP id d19-20020a056358921300b0017900ff2486mr5607719rwb.29.1708091572498;
        Fri, 16 Feb 2024 05:52:52 -0800 (PST)
Received: from thinkpad ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id p29-20020a63951d000000b005cfbdf71baasm3262550pgd.47.2024.02.16.05.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:52:52 -0800 (PST)
Date: Fri, 16 Feb 2024 19:22:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Can Guo <quic_cang@quicinc.com>,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] scsi: ufs: qcom: provide default cycles_in_1us
 value
Message-ID: <20240216135245.GI2559@thinkpad>
References: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
 <20240213-msm8996-fix-ufs-v2-1-650758c26458@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213-msm8996-fix-ufs-v2-1-650758c26458@linaro.org>

On Tue, Feb 13, 2024 at 01:22:17PM +0200, Dmitry Baryshkov wrote:
> The MSM8996 DT doesn't provide frequency limits for the core_clk_unipro
> clock, which results in miscalculation of the cycles_in_1us value.
> Provide the backwards-compatible default to support existing MSM8996
> DT files.
> 
> Fixes: b4e13e1ae95e ("scsi: ufs: qcom: Add multiple frequency support for MAX_CORE_CLK_1US_CYCLES")
> Cc: Nitin Rawat <quic_nitirawa@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

CC stable list?

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 0aeaee1c564c..79f8cb377710 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1210,8 +1210,10 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
>  
>  	list_for_each_entry(clki, head, list) {
>  		if (!IS_ERR_OR_NULL(clki->clk) &&
> -			!strcmp(clki->name, "core_clk_unipro")) {
> -			if (is_scale_up)
> +		    !strcmp(clki->name, "core_clk_unipro")) {
> +			if (!clki->max_freq)
> +				cycles_in_1us = 150; /* default for backwards compatibility */
> +			else if (is_scale_up)
>  				cycles_in_1us = ceil(clki->max_freq, (1000 * 1000));
>  			else
>  				cycles_in_1us = ceil(clk_get_rate(clki->clk), (1000 * 1000));
> 
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

