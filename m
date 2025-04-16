Return-Path: <linux-arm-msm+bounces-54489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F508A8B791
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 13:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C008189E007
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 11:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6881023C8AE;
	Wed, 16 Apr 2025 11:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="abgyc2Cv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758A2227E89
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744802647; cv=none; b=QE4Q27v3tP+5ZEbkvg3VflcZFnzN0FODO0rvO+tZY8sNVxGu/ZwLPkn1rs3NHcQ96YdEpUKbS/W1Etbr3W+/z6aSJyKirp9iG1q0MdfSDx20TXuHgOUVfmHbEOybCafPGTJPI17jX2Vh8FDRkc3RT+btfz4sgAIfo/w9vpZ4aD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744802647; c=relaxed/simple;
	bh=L3xiW7OFASaQrPX7HUHPQmKiHZe0ue+Bk0MFscC/I3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbJRIl6WMMVCr6ZFbm01s8eD1TzeVTocW/wlJ6EwwTF3qxs9MQ7YHqtjwPxQd5olcmI5ruz6ErzQ+9V5u5X4ClsNmZsAatr+mOeliVeyKVQqCgKpFTqTDvV/Bvr8XgkIG1uJkyNHnj6VEYNjIDSLaBTB1w+E5VSF/sxXhKWaUNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=abgyc2Cv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mJE0026274
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 11:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3D1a5NjFUGpMMJ2ECwG4uMU1
	Jk5bwW4EN61RcOaeaTU=; b=abgyc2CvgzfXN6hPsYiocNNvm371tkYwG8j8ydT+
	qBChJpfG7yrG5moH9tkjAUDBHXmyFK2LA/Mwv9VUfmZxOH3WiS3ZiQ9Mk0zE7cj+
	lGFvj9qJKVaDjHxw/OJO2GbyW3bKWFxW5hlLLulRSCf0ITTzk0LrMxmNhT8pXnEP
	sZRWuaDSoQR2iMxVxoq9vBOJkxEfpCnwfZca+H7Zx1hhqOYWt6TJcijMKZdXTvFR
	LdRTPpciipLyNyixZftMoz0Ye28izdr9+nn337fr8lLGxpgZzb1Y8/eGhQUrVfqr
	LxxQVG9oOEKG89801XxdM8RwQnox49eEpAW2lBiYa0opLg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1b98w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 11:24:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ec18a29aso70675996d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 04:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744802643; x=1745407443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D1a5NjFUGpMMJ2ECwG4uMU1Jk5bwW4EN61RcOaeaTU=;
        b=diAVBDTl7aX+G3V2KoBhL7aj+9aSoghwJcoLoKCGdgQ+wcjuwI+3XTed1LBR/PZiZz
         JoVVqVgCv0+bCbsQ5ansoT2f9LIKLvi4/XbIgIuCXGGtlrhee0hZVprh+CuZcEDghh46
         44sl4zVm9N6BefT/uLehzkGzYULxr49P8Vl9Sp9Kv8axVdzVoVVXX4T0SYLGb+NMa9+/
         0Mv08Cbz2XV+FqhoATAxDNGxQ8XCK9a6aEDvGezWLrmlVC1yy3R9k6So+mH3lZKCx+L4
         nhM8/PeRA9d64bVzMWbte/9ew9Be3czsHUJQp/MBVIVp9o1SPblQGwgkk8V2S+pHu1ak
         aRCA==
X-Forwarded-Encrypted: i=1; AJvYcCWx3xICmIPaCcOOIUDfYU5//tecGhB68sxj8fgVf+3aKIIwsiXlV0jNNCc6NTpCRQ2HsbKZse7myuT00LLd@vger.kernel.org
X-Gm-Message-State: AOJu0YzfvAl8GFK3mI1I6Nze7rExZZd3CllQPlmDrWMaaQR+aHXKvlJY
	TyeNNPmaJh8MDB67sPTk57jMjWFAYMhA6xoch2mfwU1rY++qulXhQup28k6OmWLGB5iJmgxKBXe
	KzgHWIEtncF2N9AQU83SwlGzRAjN4n22yP9b53E8LbG3dcCuf7jLpUTKJwcyoLVAm
X-Gm-Gg: ASbGncvDMjIbtLR8JpDdSX5LrE6YMpyJ8Acqkwf1HJrQY8YeOwbIIp3PRzTTloxc+gV
	u50ZfKCALOI9fLsAcBuREpuRShqdbDHDZ3R7twh0jxu+DjUF7W7AKE48A2sfn4Pa+p3qFfemioY
	jdO2PZvtr0KN7OyT0xtHRi30dS4cSB6YaNldE2YWetkn7VETnBwFVURSFwO+Hlx0ZWDt0MS1J0q
	PDfkwYtGE1Ob8D+iW7rcq2YOyc4FAxeabBRBdXNtWA/yVZkEEh/bzon5b/qWt005s5mVCdH9wJM
	y5STwmFV56h6SE/XOyDO3FZtWLx3M5/TGWLc96YQdd1U1Q2cbkgjkK/7dKgSSl4ZD4iExNIXwbs
	=
X-Received: by 2002:ad4:5b83:0:b0:6e8:9a55:824f with SMTP id 6a1803df08f44-6f2b2efa1ffmr18929066d6.6.1744802643202;
        Wed, 16 Apr 2025 04:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZBV0Xexr1gM35pEN9z1Z6VI4fD2Dum+sBzeR89TNCj5FG5on6G+p5JH1nBP1pGyz6WoWbjg==
X-Received: by 2002:ad4:5b83:0:b0:6e8:9a55:824f with SMTP id 6a1803df08f44-6f2b2efa1ffmr18928676d6.6.1744802642738;
        Wed, 16 Apr 2025 04:24:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238d5dsm1644275e87.93.2025.04.16.04.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:24:01 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:23:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 7/7] media: platform: qcom/iris: add sm8650 support
Message-ID: <opy25iocdw5i2go5male5rzwoxl2hd4jxxjqj77qjiyxz7vens@wmrnrfuakhjs>
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
 <20250415-topic-sm8x50-iris-v10-v6-7-8ad319094055@linaro.org>
 <085acdab-87b0-3a94-72fd-881d517d95cb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <085acdab-87b0-3a94-72fd-881d517d95cb@quicinc.com>
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67ff9354 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=C-jBNuSA4hYJbswlNoEA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RWwU83CG5wWwbN0kG49Pc_LyzGrBPrQ1
X-Proofpoint-ORIG-GUID: RWwU83CG5wWwbN0kG49Pc_LyzGrBPrQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160093

On Wed, Apr 16, 2025 at 03:55:35PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 4/15/2025 7:17 PM, Neil Armstrong wrote:
> > Add support for the SM8650 platform by re-using the SM8550
> > definitions and using the vpu33 ops.
> > 
> > Move the reset tables that diffes in a per-SoC platform
> > header, that will contain mode SoC specific data when
> > more codecs are introduced.
> > 
> > The SM8650/vpu33 requires more reset lines, but the H.264
> > decoder capabilities are identical.
> > 
> > Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  .../platform/qcom/iris/iris_platform_common.h      |  1 +
> >  .../media/platform/qcom/iris/iris_platform_gen2.c  | 65 +++++++++++++++++++++-
> >  .../platform/qcom/iris/iris_platform_sm8550.h      | 11 ++++
> >  .../platform/qcom/iris/iris_platform_sm8650.h      | 13 +++++
> >  drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
> >  5 files changed, 92 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > @@ -35,6 +35,7 @@ enum pipe_type {
> >  
> >  extern struct iris_platform_data sm8250_data;
> >  extern struct iris_platform_data sm8550_data;
> > +extern struct iris_platform_data sm8650_data;
> >  
> >  enum platform_clk_type {
> >  	IRIS_AXI_CLK,
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > index 35d278996c430f2856d0fe59586930061a271c3e..6d1771bd68689d96b5b9087b0ad32b934f7295ee 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > @@ -10,6 +10,9 @@
> >  #include "iris_platform_common.h"
> >  #include "iris_vpu_common.h"
> >  
> > +#include "iris_platform_sm8550.h"
> > +#include "iris_platform_sm8650.h"
> > +
> >  #define VIDEO_ARCH_LX 1
> >  
> >  static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
> > @@ -142,8 +145,6 @@ static const struct icc_info sm8550_icc_table[] = {
> >  	{ "video-mem",  1000, 15000000 },
> >  };
> >  
> > -static const char * const sm8550_clk_reset_table[] = { "bus" };
> > -
> >  static const struct bw_info sm8550_bw_table_dec[] = {
> >  	{ ((4096 * 2160) / 256) * 60, 1608000 },
> >  	{ ((4096 * 2160) / 256) * 30,  826000 },
> > @@ -264,3 +265,63 @@ struct iris_platform_data sm8550_data = {
> >  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> >  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> >  };
> > +
> > +/*
> > + * Shares most of SM8550 data except:
> > + * - vpu_ops to iris_vpu33_ops
> > + * - clk_rst_tbl to sm8650_clk_reset_table
> > + * - controller_rst_tbl to sm8650_controller_reset_table
> > + * - fwname to "qcom/vpu/vpu33_p4.mbn"
> > + */
> > +struct iris_platform_data sm8650_data = {
> > +	.get_instance = iris_hfi_gen2_get_instance,
> > +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> > +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> > +	.vpu_ops = &iris_vpu33_ops,
> > +	.set_preset_registers = iris_set_sm8550_preset_registers,
> > +	.icc_tbl = sm8550_icc_table,
> > +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> > +	.clk_rst_tbl = sm8650_clk_reset_table,
> > +	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
> > +	.controller_rst_tbl = sm8650_controller_reset_table,
> > +	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
> > +	.bw_tbl_dec = sm8550_bw_table_dec,
> > +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> > +	.pmdomain_tbl = sm8550_pmdomain_table,
> > +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> > +	.opp_pd_tbl = sm8550_opp_pd_table,
> > +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> > +	.clk_tbl = sm8550_clk_table,
> > +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> > +	/* Upper bound of DMA address range */
> > +	.dma_mask = 0xe0000000 - 1,
> > +	.fwname = "qcom/vpu/vpu33_p4.mbn",
> > +	.pas_id = IRIS_PAS_ID,
> > +	.inst_caps = &platform_inst_cap_sm8550,
> > +	.inst_fw_caps = inst_fw_cap_sm8550,
> > +	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
> > +	.tz_cp_config_data = &tz_cp_config_sm8550,
> > +	.core_arch = VIDEO_ARCH_LX,
> > +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> > +	.ubwc_config = &ubwc_config_sm8550,
> > +	.num_vpp_pipe = 4,
> > +	.max_session_count = 16,
> > +	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
> > +	.input_config_params =
> > +		sm8550_vdec_input_config_params,
> > +	.input_config_params_size =
> > +		ARRAY_SIZE(sm8550_vdec_input_config_params),
> > +	.output_config_params =
> > +		sm8550_vdec_output_config_params,
> > +	.output_config_params_size =
> > +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> > +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> > +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> > +	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
> > +	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
> > +
> > +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> > +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> > +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> > +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> > +};
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..ac8847edb585e4a9ce6b669a3a5988e7809972af
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#ifndef __IRIS_PLATFORM_SM8550_H__
> > +#define __IRIS_PLATFORM_SM8550_H__
> > +
> > +static const char * const sm8550_clk_reset_table[] = { "bus" };
> > +
> > +#endif
> There is no need of iris_platform_sm8550.h, you can keep this entry in
> gen2.c file itself. As we are making that our base.

That would make it unsymmetrical. I think having a separate header is a
better option.

> You can just have iris_platform_sm8650.h which overrides this entry with
> SOC specific reset requirements for SM8650.
> 
> Thanks,
> Dikshita
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8650.h b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..75e9d572e788de043a56cf85a4cb634bd02226b9
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#ifndef __IRIS_PLATFORM_SM8650_H__
> > +#define __IRIS_PLATFORM_SM8650_H__
> > +
> > +static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
> > +
> > +static const char * const sm8650_controller_reset_table[] = { "xo" };
> > +
> > +#endif
> > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > index 4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e..7cd8650fbe9c09598670530103e3d5edf32953e7 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > @@ -345,6 +345,10 @@ static const struct of_device_id iris_dt_match[] = {
> >  			.data = &sm8250_data,
> >  		},
> >  #endif
> > +	{
> > +		.compatible = "qcom,sm8650-iris",
> > +		.data = &sm8650_data,
> > +	},
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, iris_dt_match);
> > 

-- 
With best wishes
Dmitry

