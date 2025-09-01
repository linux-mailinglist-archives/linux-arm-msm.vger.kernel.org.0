Return-Path: <linux-arm-msm+bounces-71357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B193BB3DAB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EB0C1891B0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E275924418E;
	Mon,  1 Sep 2025 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJmMVV23"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAFE1DE8AD
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756710263; cv=none; b=WemwwFy3mlqwuZO/MUMLibPLuFp7+UGtnSvfufgLe1kIuHY6tCvz73+8ApB3YRhmqcjgQASAzBCNs5PoaqyqPUz50FSlPwQULcodXDtJnLH15uQ1+WHRZizJjGOKd0KFX4NZEIOH+bg+CgNviKPpw0yZkZWJiVdr6oDl/pR5UFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756710263; c=relaxed/simple;
	bh=YQQja4iUtJHXPXqCeYJ+scYMPKaUF31XRBIpLGv+MVo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgv5MJreVZ9twQx8ghwq5wXxSnsUF3MEePkBqlz0nbje/qhI6IQiMXKFj7nfbgBdwQdnXXWIJPMyAoDJgOn4bNq0UqXApdtSbe/hJ8V7HWxa4+zdws+jpu3VayvA2cq6ujRH8W1o8px2G/0Jy4iW/YecLYW5b+7dNG0Iy3i+B4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJmMVV23; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VLueFS018126
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 07:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uE/VNkcgGxZg4bxQlLZeMWOe
	wUFLCRZiFuXlOiXNv1U=; b=iJmMVV235PJ2DI5K/4eQ6JgpV3SSRnZyjitjk7cU
	2AZffpc036zKPFrgeAp5AL6If7/ui0xW9uER4orHBNFBV/PwMjEn8M+Vywct8Uk/
	1jdn/nQC44yFg7bj74WdpkBp1YL1/64fV7Jk3fmvvMinn3UVls8Ts+fTPlLCWp1h
	+35WSsZ/mpns9bHdJKXosfeHZn86qiUgpHs2nHjYCu/lJA6j8GEygHVcqmdsCWtz
	auZ70UOnHvghC1Vf1HJhVuTx/DtP5PHbQqHlSurqMBJ3xWMCzg26TMyywYjnrPAE
	tOYgHHU8v702HXmu6mATziJaA+E0vmiplNtGNzEMgQJEzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp3t8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 07:04:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b311db2c76so335401cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 00:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756710260; x=1757315060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uE/VNkcgGxZg4bxQlLZeMWOewUFLCRZiFuXlOiXNv1U=;
        b=GrV+hxvsETIlkVitQZ7M1JsRNe94bGl2NvCQhz954saszeXrujmsYz2c1gI/5691Lt
         Tzrk4O34R45t/Rn3IrhNK0DBBGIuCogsoJIi9Ydf6ZqW29oY2AS+y8tZaQ2FD646t1Pl
         BMSossMW2Z+VMCXbeo0o/OrOZGFSC/X7JGX8w7B2l0Ty0+r0AVvQ6inkfZpyJGWcD+XN
         6cqQmYff5uoVNCu0aApmoI9XbKokQVTnb+2tcIvlLK0kN5r6yvkwIB5ehE4z+ifCSSA7
         6gapknLIU7mFXElK3w+1qFgBk6uW+TssE1iOAcB7Y8yje7cPvJMKK0EvMcWAnik9Nt0j
         vD3g==
X-Forwarded-Encrypted: i=1; AJvYcCU6kDjA4AVZr3XBOjfVOGnnfiMPZ4d1zlHqHPVbHbkdATnRUKE8SJ2CdDpL/cATIT/+PghnDfogyjcRuhd6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8uZmaPn5KzFqk1Mh9TOi98IcnoTZhxPjlGvOStgxihNal/Bz
	zvz75ViRSGsfdig1TRHco5yQIYv0oCPa9KEE7adqBZTJz00FToR39+WDtvLY8WXiFCSMBOBg/iv
	K73W2WM7ydLvOqEUEzDoxrO7FjKLlcoxL5tYETfGdax+p+5oa0DEbM08/nl4JbbCeUuCw
X-Gm-Gg: ASbGncscikt3wTowzozWhuDrAjJSK5mAZyuIfi59HUJhPXKmyi+ijNQzBMFJJWhfnWT
	Y53rMs8joBFlVcCNyXE+ig6RWsBYWEvk95pK5SwatxP85IhqMS5Z4xQvmaRwJS8hE2COaDHLv/Q
	Aw9FDD5Ulnx6TFaGD/0it+yptQRhnpZj/Ang7L8Do9C112ehvt8eQOCl8mammXIQ/eD3oRhixGm
	lhX/PZQddlpXsenTkdK3z+pKZNnYIySKKRG0rlxCqUJEkMeAon9M6wk7S7OgINc2CXXmp5WRVsJ
	ksy+gYNYuLiVAtTpsOS08rLFIguke1cap2WMNmqrIFLHWgudU1H4NQ/mfeyMA/Ylb/wTLjRI
X-Received: by 2002:ac8:59d4:0:b0:4b3:105:dd0e with SMTP id d75a77b69052e-4b31dcdedb0mr80691081cf.84.1756710259928;
        Mon, 01 Sep 2025 00:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqvOZBx3Up1SuKrEC/9nId/pjz1oZkJwt75SFpF3nCz39S6DR/EG0bjfp1bmFvrrEdfYgIiw==
X-Received: by 2002:ac8:59d4:0:b0:4b3:105:dd0e with SMTP id d75a77b69052e-4b31dcdedb0mr80690791cf.84.1756710259236;
        Mon, 01 Sep 2025 00:04:19 -0700 (PDT)
Received: from trex (104.red-81-38-137.dynamicip.rima-tde.net. [81.38.137.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm2100837f8f.10.2025.09.01.00.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:04:18 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 1 Sep 2025 09:04:13 +0200
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/8] media: venus: Define minimum valid firmware
 version
Message-ID: <aLVFbbcqPBFJRrFO@trex>
References: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
 <20250814085248.2371130-3-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814085248.2371130-3-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-GUID: HVPjF_btulZhT8lCwNE70DA5DYlmK9TS
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b54575 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=b7LKs1oZe9YjeUNSp5ep0A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bUZi_dX1JFjbleUUZmwA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: HVPjF_btulZhT8lCwNE70DA5DYlmK9TS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX1WkDnfgtdQkO
 psRo9Zq1Q8AJeIUYhydOVL+cLvbqzQaDAVGjEUkjnWY8icQKXhWZkkjc/nGNuaRZHsALjEF49Wm
 khrij9fmNWr/pyimm2Rqs9r7nsrmq2JhT9hXh1jK/hTmZDkYZcX++4Fx2Iw9+vTd9qookIRFMgH
 bwdwAq4shtJ7vUFEwQjmnQ3nZy4BMp/fjtDb0kXiMqaSJWacoN2VmbjVhOr8WWgn3zbYFyD2c7S
 576wv84OrGNqs92FrdqO+mPSudwlDRHw0eaQ38lSH7hcEchLeoijEQ5ScjEKmGUliMm2kmVLYyQ
 gm+8Xhq86AMTicQR9lOy/PAPvByz+iEt/TCb9SaxIdriLaZSK/gP4wc4Ga6LxdCdYIm6YRTk81U
 BM6y5Pha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On 14/08/25 10:52:42, Jorge Ramirez-Ortiz wrote:
> Add support for specifying the minimum firmware version required for
> correct operation.
> 
> When set, the driver compares this value against the version reported by
> the firmware: if the firmware is older than required, driver
> initialization will fail.
> 
> The version check is performed before creating dynamic device tree
> nodes, to avoid the need for reverting nodes on failure.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.c     | 40 +++++++++++---------
>  drivers/media/platform/qcom/venus/core.h     | 13 ++++---
>  drivers/media/platform/qcom/venus/firmware.c | 20 ++++++++++
>  drivers/media/platform/qcom/venus/firmware.h |  1 +
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 11 +++++-
>  5 files changed, 61 insertions(+), 24 deletions(-)
>


could I get some feedback on this patch please ?

TIA


> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 90de29f166ad..5d76e50234f6 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -448,19 +448,9 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_runtime_disable;
>  
> -	if (core->res->dec_nodename || core->res->enc_nodename) {
> -		ret = venus_add_dynamic_nodes(core);
> -		if (ret)
> -			goto err_runtime_disable;
> -	}
> -
> -	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> -	if (ret)
> -		goto err_remove_dynamic_nodes;
> -
>  	ret = venus_firmware_init(core);
>  	if (ret)
> -		goto err_of_depopulate;
> +		goto err_runtime_disable;
>  
>  	ret = venus_boot(core);
>  	if (ret)
> @@ -474,34 +464,48 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_venus_shutdown;
>  
> -	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
> +	ret = venus_firmware_check(core);
>  	if (ret)
>  		goto err_core_deinit;
>  
> +	if (core->res->dec_nodename || core->res->enc_nodename) {
> +		ret = venus_add_dynamic_nodes(core);
> +		if (ret)
> +			goto err_core_deinit;
> +	}
> +
> +	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (ret)
> +		goto err_remove_dynamic_nodes;
> +
> +	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
> +	if (ret)
> +		goto err_of_depopulate;
> +
>  	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
>  	if (ret)
> -		goto err_core_deinit;
> +		goto err_of_depopulate;
>  
>  	ret = pm_runtime_put_sync(dev);
>  	if (ret) {
>  		pm_runtime_get_noresume(dev);
> -		goto err_core_deinit;
> +		goto err_of_depopulate;
>  	}
>  
>  	venus_dbgfs_init(core);
>  
>  	return 0;
>  
> +err_of_depopulate:
> +	of_platform_depopulate(dev);
> +err_remove_dynamic_nodes:
> +	venus_remove_dynamic_nodes(core);
>  err_core_deinit:
>  	hfi_core_deinit(core, false);
>  err_venus_shutdown:
>  	venus_shutdown(core);
>  err_firmware_deinit:
>  	venus_firmware_deinit(core);
> -err_of_depopulate:
> -	of_platform_depopulate(dev);
> -err_remove_dynamic_nodes:
> -	venus_remove_dynamic_nodes(core);
>  err_runtime_disable:
>  	pm_runtime_put_noidle(dev);
>  	pm_runtime_disable(dev);
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index db7b69b91db5..58da4752569a 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -58,6 +58,12 @@ enum vpu_version {
>  	VPU_VERSION_IRIS2_1,
>  };
>  
> +struct firmware_version {
> +	u32 major;
> +	u32 minor;
> +	u32 rev;
> +};
> +
>  struct venus_resources {
>  	u64 dma_mask;
>  	const struct freq_tbl *freq_tbl;
> @@ -94,6 +100,7 @@ struct venus_resources {
>  	const char *fwname;
>  	const char *enc_nodename;
>  	const char *dec_nodename;
> +	const struct firmware_version *min_fw;
>  };
>  
>  enum venus_fmt {
> @@ -231,11 +238,7 @@ struct venus_core {
>  	unsigned int core0_usage_count;
>  	unsigned int core1_usage_count;
>  	struct dentry *root;
> -	struct venus_img_version {
> -		u32 major;
> -		u32 minor;
> -		u32 rev;
> -	} venus_ver;
> +	struct firmware_version venus_ver;
>  	unsigned long dump_core;
>  	struct of_changeset *ocs;
>  	bool hwmode_dev;
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 66a18830e66d..3666675ae298 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -280,6 +280,26 @@ int venus_shutdown(struct venus_core *core)
>  	return ret;
>  }
>  
> +int venus_firmware_check(struct venus_core *core)
> +{
> +	const struct firmware_version *req = core->res->min_fw;
> +	const struct firmware_version *run = &core->venus_ver;
> +
> +	if (!req)
> +		return 0;
> +
> +	if (!is_fw_rev_or_newer(core, req->major, req->minor, req->rev))
> +		goto error;
> +
> +	return 0;
> +error:
> +	dev_err(core->dev, "Firmware v%d.%d.%d < v%d.%d.%d\n",
> +		run->major, run->minor, run->rev,
> +		req->major, req->minor, req->rev);
> +
> +	return -EINVAL;
> +}
> +
>  int venus_firmware_init(struct venus_core *core)
>  {
>  	struct platform_device_info info;
> diff --git a/drivers/media/platform/qcom/venus/firmware.h b/drivers/media/platform/qcom/venus/firmware.h
> index aaccd847fa30..ead39e3797f0 100644
> --- a/drivers/media/platform/qcom/venus/firmware.h
> +++ b/drivers/media/platform/qcom/venus/firmware.h
> @@ -9,6 +9,7 @@ struct device;
>  
>  int venus_firmware_init(struct venus_core *core);
>  void venus_firmware_deinit(struct venus_core *core);
> +int venus_firmware_check(struct venus_core *core);
>  int venus_boot(struct venus_core *core);
>  int venus_shutdown(struct venus_core *core);
>  int venus_set_hw_state(struct venus_core *core, bool suspend);
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
> index cf0d97cbc463..47b99d5b5af7 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -277,7 +277,12 @@ static void hfi_sys_init_done(struct venus_core *core, struct venus_inst *inst,
>  
>  done:
>  	core->error = error;
> -	complete(&core->done);
> +	/*
> +	 * Since core_init could ask for the firmware version to be validated,
> +	 * completion might have to wait until the version is retrieved.
> +	 */
> +	if (!core->res->min_fw)
> +		complete(&core->done);
>  }
>  
>  static void
> @@ -328,6 +333,10 @@ sys_get_prop_image_version(struct venus_core *core,
>  	if (!IS_ERR(smem_tbl_ptr) && smem_blk_sz >= SMEM_IMG_OFFSET_VENUS + VER_STR_SZ)
>  		memcpy(smem_tbl_ptr + SMEM_IMG_OFFSET_VENUS,
>  		       img_ver, VER_STR_SZ);
> +
> +	/* core_init could have had to wait for a version check */
> +	if (core->res->min_fw)
> +		complete(&core->done);
>  }
>  
>  static void hfi_sys_property_info(struct venus_core *core,
> -- 
> 2.34.1
> 

