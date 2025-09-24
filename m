Return-Path: <linux-arm-msm+bounces-74655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7ACB9B9B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 21:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B8761B223D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 19:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB39156F20;
	Wed, 24 Sep 2025 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRuWZS8N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A782580F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758741061; cv=none; b=SFGOex2bYf+jmgiYANCKxMlx+pYpbiyiV53FCYoLl49yssu4rBDYQkM86Fgq0xnGYCdih5fwpcNSr285FsurDnQn2h5qHX5ryHBxI4FAKYcxCV/nGXI2YHj095tRp+2WXH3jyDlX4opltzoTdBZ2TElPiBpcTjRIeg3AqsKVVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758741061; c=relaxed/simple;
	bh=6m6czYpY+d/dx9feMOO9MhlLcLMSowru/MvPLbBglLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4T91klx6kYSORQw2EQmQhq/hywpowgiBvIheFeovD8t1TpgyhMbvov6pSA7MhzV0xXZQnvFcNqOOi9m7wTbzQvTHScNBQgPiEeQXqP4025AYdvDYNyociBbely2vOgxdYx7vouJ2A/bYAHH4R0zpCjtVe0V/CtJgu0TbZJrioU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRuWZS8N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD2eAt025120
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gStCkt/BoSYEmirqxpf4aupt
	Sr4no9aDnWgPhyHC9mc=; b=IRuWZS8NerPXaF9QsvZ4So1O+3CYZ/fEgZ44Z5O5
	IzATCWJ1GkG6Yc4QbClhAzV4sOpQ3gkFZpFOeE6SQjoIgOptProGW4h24U2FJ5I7
	9vM9kO1jfJYXgDi2X22VYV/L+MxHBJaq+b7DUmhTMVKQziNSZl1LGdNWMdQbdiFL
	RSOvRGwQnJYT8h4wjKLmgaHPPBDuk26Dd6PXjDqyFZW8VCDhMEYOuksaTe7lbFfB
	EOciyHZIDyIK26I+9iLOsNPsGVD6Sz6Wg8TYvSsogOkN3qEFlKQc/mjEAqco7r1k
	ovYZzorP012bnVTz7yULavERIdssV9BbA+NKTlwbs1qDTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv15hk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:10:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b7ad72bc9fso4154591cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758741057; x=1759345857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gStCkt/BoSYEmirqxpf4auptSr4no9aDnWgPhyHC9mc=;
        b=tKPMetqaTQXYhYDjrydnoCfJoCC25AL8FcFsF2fLn7H02A3uuPiRRMN1Q8ErRJ/EOI
         IlgVVqeUIL2waso7Ho2CFtZFnBynhgd6KRigk98SfNuYTS2bM6+ABpaY1uFTr0H7nyEa
         dWmwwq1uNTGBowYhkfEc/w3Pm7TK/h84DTMnCvyym6rTRLq6aw079f9v25xEfp+ocM2j
         e4/4vPwj2IdABALmrLp3mmqaGCOUCRvCDCAcKalCgJJYQn9TVokN6VMJ9mKjgx7/HJ/d
         gtlEgXLcJUDjOfYg41XG+jiWXvPIaO5hE3ssTCMPlda23n7WjOV7/96mZKdF4WirBMkS
         qyXw==
X-Forwarded-Encrypted: i=1; AJvYcCWDat40zqgWGMREjftkV3vyndx/3PDYIaa4rG/AuG3S/o6AAdRjpImeIZYcmVb0SRJIwGo2beM7YnBeUKhT@vger.kernel.org
X-Gm-Message-State: AOJu0YwLRjq8Lwwxbo4FE/0TKxOzpNoSajRBjsnzUlM3HHysfqbb4JaV
	2R/jxvWjILepTJTdAzsJKQvIXpPTMicticzMmwj9CMqjgI7v9Gl76YeEHrpERyqGT0xLtpuziaw
	Y45OkK7XaLLLa/Pts2HFMIZuUG4U8FNuBQ2+oZh7JtYntU6a3sWYqwQGtnAVc9xU9wN94
X-Gm-Gg: ASbGncvbYsLr8+Ab+NHJyCPwH383+AODptAUARfyHz0sJ5Qg8N1RC8+YON7Hn2rf4jg
	OlfSJTJPhu7sxUGFU74OYL29iF0Iq/3tmIU1nw+WjcMNIeAkK8txdHUrjvspSUNNvimXU8uHfKe
	1yXyeBPbd8WnSHF5y0o4Ymk01e4JWa6SJrwYsle4/kNSfz0d8mi7KrDVmOzZdcmMVqaIl5hGiBw
	recs6yj071/yjxwDFrjtw2xZsHGcOhmic/REtfwL1+XJXBoVqtHVXs6gV1JiPxQc/xhbZ8SeeIO
	j3fmduV23uxyb/fin/neNqwxWZXROcf5X4FFQlWHJOptU4w07TRPxUq40SAH7wyAbmzdYRa7P0n
	eCBH/wgKCbW0BH/ggMTnB2KvfjXdDyslqwJOhLfxYnjIcn7kDYWz8
X-Received: by 2002:a05:622a:610d:b0:4b5:d932:15d8 with SMTP id d75a77b69052e-4da481d8f8fmr12584651cf.14.1758741057084;
        Wed, 24 Sep 2025 12:10:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzNGVdhq6dBp/1CJfwzM4ALe/HzWywBrHP1da/RaRRmjp3ldIoFiEOTag9sj83H/4xzDV3xg==
X-Received: by 2002:a05:622a:610d:b0:4b5:d932:15d8 with SMTP id d75a77b69052e-4da481d8f8fmr12584151cf.14.1758741056530;
        Wed, 24 Sep 2025 12:10:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5790a9f0368sm5026655e87.55.2025.09.24.12.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:10:55 -0700 (PDT)
Date: Wed, 24 Sep 2025 22:10:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 1/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <5b75dckankcx55gbm734a23rvqxdbprlus3nkvqfry7lz5ksjf@jjmfsbiwqny6>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-1-6927284f1098@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-dsi-dual-panel-upstream-v3-1-6927284f1098@linaro.org>
X-Proofpoint-GUID: d7wSWrzXWPgEgftMdgVC0dYyZH3jMc1D
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d44243 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=RAbU-raeAAAA:8 a=KKAkSRfTAAAA:8 a=TDLR0dRR3mayGEnoOkYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=JiizpSU_mAIq9zsZDqn2:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX7wyL0JqCKJ1f
 QWrq4ecgndHMaKp8ylQn3R0/iud0XewI2EEyla6NxMMgBRmB8ktCEiH4m134sR+QEZtoZdTbaX5
 j+K7y1vJGcakkLKKXLtviW6RmqdYDJSdLOVna/DDtXMLkbIsknrR/5oPGSb6t0ZbpdfkCq7xNDw
 YC1x1yLjxZHS9TBROgqItbn94C670S/GfUNu3Hog7ELxe5lwPBtkna6vsytVXQ0JvgQJM3NJ2iG
 NKxl0abeDlx7Sp4r2ZtrB//wnlxgO6+6Yt0E2fO2HePBubX/UnvpR2zmHHJzNACCNTkvAYuDiho
 6MQtqw8Sxmq77OvlzZGxSCNLeGbfYQpSuFBTOSqyW43SuOMEkioetpo+/pvN5zh5g/WkI/4pP42
 GeZIGV6d
X-Proofpoint-ORIG-GUID: d7wSWrzXWPgEgftMdgVC0dYyZH3jMc1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On Wed, Sep 24, 2025 at 11:08:10PM +0800, Jun Nie wrote:
> Some panels support multiple slice to be sent in a single DSC packet. And

s/support/require/

If the panel supports something, then we can omit that and send 1 slice
as we currently do. If the panel requires multiple slices, it's
mandatory.

> this feature is a must for specific panels, such as JDI LPM026M648C. Add a

A panel driver which executes this API is appreciated. Otherwise in a
few months / years somebody will submit a patch 'field foo is not used
by the kernel drivers, drop it'.

> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
> feature in msm mdss driver.
> 
> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  include/drm/drm_mipi_dsi.h         |  2 ++
>  2 files changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index f297e3de8c3dc4e1326e70c78c046b5a19568cef..de51cb02f267205320c5a94fc4188413e05907e6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -157,6 +157,7 @@ struct msm_dsi_host {
>  
>  	struct drm_display_mode *mode;
>  	struct drm_dsc_config *dsc;
> +	unsigned int dsc_slice_per_pkt;
>  
>  	/* connected device info */
>  	unsigned int channel;
> @@ -849,17 +850,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	slice_per_intf = dsc->slice_count;
>  
>  	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> -	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
> +	bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
>  
>  	eol_byte_num = total_bytes_per_intf % 3;
> -
> -	/*
> -	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
> -	 *
> -	 * Since the current driver only supports slice_per_pkt = 1,
> -	 * pkt_per_line will be equal to slice per intf for now.
> -	 */
> -	pkt_per_line = slice_per_intf;
> +	pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
>  
>  	if (is_cmd_mode) /* packet data type */
>  		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> @@ -1008,12 +1002,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		else
>  			/*
>  			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
> -			 * Currently, the driver only supports default value of slice_per_pkt = 1
> -			 *
> -			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
> -			 *       and adjust DSC math to account for slice_per_pkt.
>  			 */
> -			wc = msm_host->dsc->slice_chunk_size + 1;
> +			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
>  
>  		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>  			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> @@ -1623,8 +1613,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>  	msm_host->lanes = dsi->lanes;
>  	msm_host->format = dsi->format;
>  	msm_host->mode_flags = dsi->mode_flags;
> -	if (dsi->dsc)
> +	if (dsi->dsc) {
>  		msm_host->dsc = dsi->dsc;
> +		msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
> +		/* for backwards compatibility, assume 1 if not set */
> +		if (!msm_host->dsc_slice_per_pkt)
> +			msm_host->dsc_slice_per_pkt = 1;

msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt ?: 1;

Yes, I think it's more ideomatic.

> +	}
>  
>  	ret = dsi_dev_attach(msm_host->pdev);
>  	if (ret)
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 6d2c08e8110151a97620389197f1ef79c058329d..5a85ba01f402a3866b70828391bb417bb8dd5956 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -182,6 +182,7 @@ struct mipi_dsi_device_info {
>   * be set to the real limits of the hardware, zero is only accepted for
>   * legacy drivers
>   * @dsc: panel/bridge DSC pps payload to be sent
> + * @dsc_slice_per_pkt: number of DSC slices to be sent as in a single packet

s/as //

>   */
>  struct mipi_dsi_device {
>  	struct mipi_dsi_host *host;
> @@ -196,6 +197,7 @@ struct mipi_dsi_device {
>  	unsigned long hs_rate;
>  	unsigned long lp_rate;
>  	struct drm_dsc_config *dsc;
> +	unsigned int dsc_slice_per_pkt;

Why is it a part of the DSI device config? What if a device specifies
dsc_slice_per_pkt, but not DSC config? What are the legit boundaries for
this field?

>  };
>  
>  /**
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

