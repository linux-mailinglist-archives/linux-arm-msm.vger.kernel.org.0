Return-Path: <linux-arm-msm+bounces-58302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51726ABAEAE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA1217A44B7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 08:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A5410F2;
	Sun, 18 May 2025 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJr77wnz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14AD1CCEE0
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555690; cv=none; b=GYkzdUKhb7t3HxYX7hEwxN+nK2jUB/MFnSj3lskU21WrPe/YHj7ocRz+ZU2klAG8lhD1hAaUPWsNI9JJ7/QeCt8veaNTo8nPqsafDFcbNr4KLjiDIyfBoNKS2u/7SFC10M47dR1luYurPVb5a7bMtNNR/izCjNfu6HwcOqOKutU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555690; c=relaxed/simple;
	bh=9lxwrOWfbax2+kM63M/fQr/Pth1Ioe9ywYrCz8dHTZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hu/ujFIGlZltrZi3VovIhVCopN3jHdeTqJwsF/OXVo7lE5CRvZs/Ql9VHhOfIi52Zfw8zBm97BQV1LBGpn9O750hiHN1zh/ie3p7qi2GmvAO+jTpBMJVv2mtjemOc4SYC1LNxluW4lF9wDnLTqrqJkgMEvj+Wk7LUrFjt56ph2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJr77wnz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I3ILIb002415
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 08:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9T1Sq+jbiLt4UBc77e9Zqsgk
	C62NbC+lR6wu7MU55SE=; b=XJr77wnz7A9TUAJsJGvsLK6JToMmjdmz4p+N1RPN
	ONbiNq/ATeLNHXG3+ezdNn9lmAcBMh090Wi8Xlq+B8yHIpMDyEuAsA8IuJ6yX7L9
	QEpP62IjD9kjeGikaRmDfnEOAkoj5Oo88Z6n/ZKUQJaoxfBUzVWL+PN1xc3YLHWN
	HApSdwKYGkdz5eB82CAoAUCKvO8FIIgCjF7wLSC1Wt6vQRSvGMMEGUiBj9sr3iPK
	CIPoo4T/9xw2Lju2vlJLH3eja4r7IKGQWQ5K/dC1UX1MJ5rTVFnEWjI6wmmSuwTt
	Np8S5YCTshatfxF9tq/Rg/3wOgvwZsomIP2HfLtCp0o46w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhqem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 08:08:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so769353785a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 01:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747555686; x=1748160486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9T1Sq+jbiLt4UBc77e9ZqsgkC62NbC+lR6wu7MU55SE=;
        b=phFqpRHTSIJxjAubnPg77dxBkr3/kHn9P2XWmcEMiSJzP+adpFza3YZQFwnaZKWR/u
         b6ljKXQSsSkyW11TBTXvEMG0oXQZLNjwmazGRo+dM7RaG0P0miuiRALk/8j4WXHwb4YG
         RL59IerHtEBVRMxRROTD55GW5SPmPwkkqKm8mYhOCaJECsL3V9HF4LrgG6QWTE6CPZyP
         CZQbN06hAI94kWOVVg59iliHXK5uHH14lO9Kfq3bzYeYT6tJdfXGDLcsH8PLBC77aRjG
         EHp8Gmz9cO3ykQ5YkvSXSIvVQXLqkG1/0B0Z/9+oto9nv/au+brWdOV2PIllqdbUHEgq
         X6/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMyhlcNZ2ZOVz6syOyRMOPRhQwuhOFXPwoHnN6bJxjHR8G/ubEyuAUjDdVMeJf84Ej9W2gnahr+GcBRVIJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3K+dkI0Sl3IPLiKzdjkmkBFabz2tLvTJ2NuLhFwdcIeq1cwQI
	kzTS2ABgHWbJIbcpRo7GAa7EvXJEdjVrK0wizRUdN0MqP9apu3u0k4g92xcBQIr40n835gglzqN
	uLJJ4VXEkAXEMzNUS+JGq0ryd+H6WjaZXhbLyVZy/Si9aJC3nUDj96oQAT65LHt3y1dBo
X-Gm-Gg: ASbGncvox5L2wsiENelVo3866cs26QJDlSd28SHb+wqr39wUPQdoC1v7a/lDHhyUhm0
	kwVBqPk0yJsDoVOXunxEkpjzc/hCdmCO8YCG7h3y/yxWuzfvCIVqCrBS7SAnDNHhaVTJsbO2ZVX
	8dZNrKYAKbjxbDOo7miRlaJgUiolI7WIIW0cdexEmn135BbB2mRi1RTgDuhHc4SaD7qN9nPW9iZ
	w3s6EdqLPyR4vPvhMkjzZV1If4oMidY59EGTzVoft2eFX1aMDkm8DX6438krpd5OtejMd/iijdn
	FCifckAy/lLjrdrxRN+eMHL23l+4pYBCvOP7D8gaJVay88yX2WGbxaZUpsVh9F+1by/v7WpYCSs
	=
X-Received: by 2002:a05:620a:3623:b0:7cd:4cee:cdb7 with SMTP id af79cd13be357-7cd4ceeceffmr1000003085a.44.1747555686077;
        Sun, 18 May 2025 01:08:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+W9hasLrXh4A9+IOM1z56fOGHemRC+8QC+0XkRMdCjoKIGzYYx4RXlQsKiYym0EqEaHxfjg==
X-Received: by 2002:a05:620a:3623:b0:7cd:4cee:cdb7 with SMTP id af79cd13be357-7cd4ceeceffmr1000001085a.44.1747555685677;
        Sun, 18 May 2025 01:08:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702e053sm1335524e87.198.2025.05.18.01.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 01:08:04 -0700 (PDT)
Date: Sun, 18 May 2025 11:08:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 01/14] soc: qcom: Add UBWC config provider
Message-ID: <ipuknjxczf3ysvmr3dfgv7qix3yeffsucmr3avnc4mi3nmeqbf@xkfrckkok32s>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-1-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-1-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: QoJmgg9VHgyDvFsgBZ5d3D-DvW666hK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA3NSBTYWx0ZWRfX0fCUU57LxBdk
 BVrIY93XhWHnJYxGyJsJAC6SrT4/3GfndYWJvM/jGWaBB8i659i2jFvAfIwhSwgSXa5g4hSY+bl
 dYvmkELulhFvdV0BoykKpkvlZHVBx0Wc5xJQi4tMYFFnK8aVV01YWL9knFPAe3+7Vf1SI0vZTim
 bJ1MvfOrnzsppSE5RJIHZf0ghQZHq8NAbhiLsVicB6GVKh9KfFwQSZokBvCmNAYvZNLnaSo6diT
 AilL+NspMLru5nZN9reQzcJau0eNaDlLJpYNkRKCivM6zJBtLUfu3WM+m2Nr/ZvZnht4TCDCBw2
 nyv8Ya2+EqHdjUq1Ggy0YjbMMvzrcjDzZDOTIj8HL9vndZ0Gc8QcKCh5mX8FmFiji1MiPiwiVOI
 MwulRxcpSeh1ZdghOMyt8qIvxkqDRqA6i8/Ih+jqajCARzNlc9ZDz1cG8cSVvqg/0OYsg0R+
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=68299567 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-rxDeAWS2p8p3NNeAW0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QoJmgg9VHgyDvFsgBZ5d3D-DvW666hK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180075

On Sat, May 17, 2025 at 07:32:35PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig       |   8 ++
>  drivers/soc/qcom/Makefile      |   1 +
>  drivers/soc/qcom/ubwc_config.c | 236 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/ubwc.h  |  57 ++++++++++
>  4 files changed, 302 insertions(+)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 58e63cf0036ba8554e4082da5184a620ca807a9e..2caadbbcf8307ff94f5afbdd1481e5e5e291749f 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -296,3 +296,11 @@ config QCOM_PBS
>  	  PBS trigger event to the PBS RAM.
>  
>  endmenu
> +
> +config QCOM_UBWC_CONFIG
> +	tristate
> +	help
> +	  Most Qualcomm SoCs feature a number of Universal Bandwidth Compression
> +	  (UBWC) engines across various IP blocks, which need to be initialized
> +	  with coherent configuration data. This module functions as a single
> +	  source of truth for that information.
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index acbca2ab5cc2a9ab3dce1ff38efd048ba2fab31e..b7f1d2a5736748b8772c090fd24462fa91f321c6 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -39,3 +39,4 @@ obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
>  qcom_ice-objs			+= ice.o
>  obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>  obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
> +obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..7d220259829f0e57268f30b323ae985cf44672f4
> --- /dev/null
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +#include <linux/soc/qcom/ubwc.h>
> +
> +static const struct qcom_ubwc_cfg_data msm8937_data = {
> +	.ubwc_enc_version = UBWC_1_0,
> +	.ubwc_dec_version = UBWC_1_0,
> +	.highest_bank_bit = 14,
> +};
> +
> +static const struct qcom_ubwc_cfg_data msm8998_data = {
> +	.ubwc_enc_version = UBWC_1_0,
> +	.ubwc_dec_version = UBWC_1_0,
> +	.highest_bank_bit = 15,
> +};
> +
> +static const struct qcom_ubwc_cfg_data qcm2290_data = {
> +	/* no UBWC */
> +	.highest_bank_bit = 15,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sa8775p_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 4,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 13,
> +	.macrotile_mode = true,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sar2130p_data = {
> +	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
> +	.ubwc_dec_version = UBWC_4_3,
> +	.ubwc_swizzle = 6,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 13,
> +	.macrotile_mode = true,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc7180_data = {
> +	.ubwc_enc_version = UBWC_2_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 14,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc7280_data = {
> +	.ubwc_enc_version = UBWC_3_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 14,
> +	.macrotile_mode = true,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc8180x_data = {
> +	.ubwc_enc_version = UBWC_3_0,
> +	.ubwc_dec_version = UBWC_3_0,
> +	.highest_bank_bit = 16,
> +	.macrotile_mode = true,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc8280xp_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 16,
> +	.macrotile_mode = true,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sdm670_data = {
> +	.ubwc_enc_version = UBWC_2_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.highest_bank_bit = 14,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sdm845_data = {
> +	.ubwc_enc_version = UBWC_2_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.highest_bank_bit = 15,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6115_data = {
> +	.ubwc_enc_version = UBWC_1_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = 7,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 14,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6125_data = {
> +	.ubwc_enc_version = UBWC_1_0,
> +	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = 1,
> +	.highest_bank_bit = 14,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6150_data = {
> +	.ubwc_enc_version = UBWC_2_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.highest_bank_bit = 14,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6350_data = {
> +	.ubwc_enc_version = UBWC_2_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 14,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm7150_data = {
> +	.ubwc_enc_version = UBWC_2_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.highest_bank_bit = 14,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8150_data = {
> +	.ubwc_enc_version = UBWC_3_0,
> +	.ubwc_dec_version = UBWC_3_0,
> +	.highest_bank_bit = 15,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8250_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_bank_spread = true,
> +	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> +	.highest_bank_bit = 16,
> +	.macrotile_mode = true,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8350_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_bank_spread = true,
> +	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> +	.highest_bank_bit = 16,
> +	.macrotile_mode = true,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8550_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_3,
> +	.ubwc_swizzle = 6,
> +	.ubwc_bank_spread = true,
> +	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> +	.highest_bank_bit = 16,
> +	.macrotile_mode = true,
> +};
> +
> +static const struct qcom_ubwc_cfg_data x1e80100_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_3,
> +	.ubwc_swizzle = 6,
> +	.ubwc_bank_spread = true,
> +	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> +	.highest_bank_bit = 16,
> +	.macrotile_mode = true,
> +};
> +
> +static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
> +	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
> +	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
> +	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
> +	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
> +	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
> +	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
> +	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
> +	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },
> +	{ .compatible = "qcom,sar2130p", .data = &sar2130p_data },
> +	{ .compatible = "qcom,sc7180", .data = &sc7180_data },
> +	{ .compatible = "qcom,sc7280", .data = &sc7280_data, },
> +	{ .compatible = "qcom,sc8180x", .data = &sc8180x_data, },
> +	{ .compatible = "qcom,sc8280xp", .data = &sc8280xp_data, },
> +	{ .compatible = "qcom,sdm630", .data = &msm8937_data },
> +	{ .compatible = "qcom,sdm636", .data = &msm8937_data },
> +	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
> +	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
> +	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
> +	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
> +	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
> +	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },
> +	{ .compatible = "qcom,sm6150", .data = &sm6150_data, },
> +	{ .compatible = "qcom,sm6350", .data = &sm6350_data, },
> +	{ .compatible = "qcom,sm6375", .data = &sm6350_data, },
> +	{ .compatible = "qcom,sm7125", .data = &sc7180_data },
> +	{ .compatible = "qcom,sm7150", .data = &sm7150_data, },
> +	{ .compatible = "qcom,sm8150", .data = &sm8150_data, },
> +	{ .compatible = "qcom,sm8250", .data = &sm8250_data, },
> +	{ .compatible = "qcom,sm8350", .data = &sm8350_data, },
> +	{ .compatible = "qcom,sm8450", .data = &sm8350_data, },
> +	{ .compatible = "qcom,sm8550", .data = &sm8550_data, },
> +	{ .compatible = "qcom,sm8650", .data = &sm8550_data, },
> +	{ .compatible = "qcom,x1e80100", .data = &x1e80100_data, },
> +	{ .compatible = "qcom,x1p42100", .data = &x1e80100_data, },
> +	{ }
> +};
> +
> +const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *root;
> +
> +	root = of_find_node_by_path("/");
> +	if (!root)
> +		return ERR_PTR(-ENODEV);
> +
> +	match = of_match_node(qcom_ubwc_configs, root);
> +	of_node_put(root);
> +	if (!match) {
> +		pr_err("Couldn't find UBWC config data for this platform!\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return match->data;
> +}
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..4309787f7b6c8df3bbc37c3abd1a3f900398c1e7
> --- /dev/null
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2018, The Linux Foundation
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QCOM_UBWC_H__
> +#define __QCOM_UBWC_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +struct qcom_ubwc_cfg_data {
> +	u32 ubwc_enc_version;
> +	/* Can be read from MDSS_BASE + 0x58 */
> +	u32 ubwc_dec_version;
> +
> +	/**
> +	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
> +	 *
> +	 * UBWC 1.0 always enables all three levels.
> +	 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
> +	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
> +	 *
> +	 * This is a bitmask where BIT(0) enables level 1, BIT(1)
> +	 * controls level 2, and BIT(2) enables level 3.
> +	 */
> +	u32 ubwc_swizzle;
> +
> +	/**
> +	 * @highest_bank_bit: Highest Bank Bit
> +	 *
> +	 * The Highest Bank Bit value represents the bit of the highest
> +	 * DDR bank.  This should ideally use DRAM type detection.
> +	 */
> +	int highest_bank_bit;
> +	bool ubwc_bank_spread;
> +
> +	/**
> +	 * @macrotile_mode: Macrotile Mode
> +	 *
> +	 * Whether to use 4-channel macrotiling mode or the newer
> +	 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
> +	 * 4-channel and 1 is 8-channel.
> +	 */
> +	bool macrotile_mode;
> +};
> +
> +#define UBWC_1_0 0x10000000
> +#define UBWC_2_0 0x20000000
> +#define UBWC_3_0 0x30000000
> +#define UBWC_4_0 0x40000000
> +#define UBWC_4_3 0x40030000
> +
> +const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);

Looking at the LKP report for the Adreno patch... Should we provide a
stub here for the platforms like iMX5 (it has a2xx, so it doesn't make
sense to pull this driver in, a stub will be enough).

> +
> +#endif /* __QCOM_UBWC_H__ */
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

