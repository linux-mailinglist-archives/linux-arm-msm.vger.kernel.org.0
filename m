Return-Path: <linux-arm-msm+bounces-76697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681DBC99B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D22D4FC9F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991742EBDD6;
	Thu,  9 Oct 2025 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HrprFLza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9702EBBAD
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021177; cv=none; b=gRLrwwOQkE8NMIkcaOkHTYHF1yXnvS+iJbFC9PZ9I0pLPWrDnaqpx0R76k9dc7bkzQ5wn+IpXgngGsCD5f+tCVhOhvOO+dVhnDDg/eHpRcMz3etjONvIlykCmXGpedqF7378+TZfqCEY53bUXjIbKruiY2TY7WQsdOt1BsVWL/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021177; c=relaxed/simple;
	bh=nwjcbBaiiTf2J4foMfqVWn3BiEvDZ5VJQ3jGYfZiF+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeL7ukZlME/4bdgcBD6Z2hfTBhVo+5rS1li1OD3qTCGrWdg5gD1YgcikhH4UqZPwHEww9VhztVhErNoFEKjwrrK2cQ45euDegMZm2Oc6XL6eoVf4AUaFX7U/GhqVjsgOGgvrnYTa2EYaZFzBHnWZRm0SjU6iFooXEWS8jDa8gos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HrprFLza; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJVp019131
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=itq5GS1V2SFj6HnQBxfJ4bes
	84aSZbpWkCoiZzGZOCU=; b=HrprFLzawEmQcL8X35Dd+BLr/TB6HSlX3sxUWSXk
	UBmCsmH5uV91cBXfYKXxMtDfeWMqpXF7FuRTDYdoiQQ7O3xv4UXZ1HDNhn2TmZpm
	JZQGIIobACsXnz8LbNt6l5o+m8mgfeakrrS5sUQ2No+p23Sgf5ANI2FvUUG6aN3j
	HmISQVQeAUe7soMEcg4xT3wELw+2G00dgZ8KeM0d5p1a3efD8/yJ36zmops6eFJA
	1bYXgfJ0GDQb7vd629WEiDgjg5lNVmEMbiUwfvLEA5VHdI57FGEAkahYjlrAASnx
	T1XqfCRniO73d6iI/E0fsfzhlRftWPuo1lZDirDlkUY7JQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nu70r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:46:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dfe8dafd18so58550441cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021172; x=1760625972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itq5GS1V2SFj6HnQBxfJ4bes84aSZbpWkCoiZzGZOCU=;
        b=gFEi5D6r6u0HnVPdQfuzbUzB10wwZGZmSfCJw96JsNLza5ilOsaIIUpI2M7LrKi/La
         MMeSq1VR7ftqE+INd31f15NqCU6BiiLzcSyElKPFgjBEddyi9SW7Hq22M8FA2SCL2XlL
         j6d4YIRyzrhrXdy201VYWssndyBE8UcomLain8X39QXKbtCK8laUGujYSos8nPxpZKXs
         HXow7wNwjVmmiFI4roHDa4ZscQGfvw1/EApWIkjkmgJys6hPcymcUNzJQVeAtUdbj8/R
         A/l+3+ttqNQaU/m9h77r2jpsRYt1ZobHPvaOCmdiSkOSWmrB7jdPOv/Me0j+/3DLXMpi
         inmg==
X-Forwarded-Encrypted: i=1; AJvYcCVBmoyCt4lBRCSprz3dK7/xwlg2Ymd/JyhL27+e4UCgeCaM6jGAVxebni36i3J0vialkzehU7QkIFwDlJJ0@vger.kernel.org
X-Gm-Message-State: AOJu0YyGLwRMeDy2l8V6k3NR9ZKQFKa38h387Wfa+oOuYHvFhviSMPBA
	8pfWOdiY0Y2xHNky+7RM4ESx7MYuRLRbE11af4YNyvrnyAKkGZRdBIYJ0tO+r72XHYdIh9XmgEX
	Re+jQVTkE1drlqj233vr95efStSYkrF2QHsNUZEGmKaoRD2BwRDZa5xkTTocYQOf/6U4PHE05ta
	Sg
X-Gm-Gg: ASbGncvn5PwkNSROESHvtk7QImLUK6OL7wFyzUHiDlrmaLc0CyHzij4WQafbl5lJ4Vf
	xBISPL1HcdssUV9ZmOjwKP++dcQtToNvk2enn43o3tfXsJjRdKJrij2csIIBF1F9Q//4MGHFm3s
	NRHursfMdFK4GD6OTa5iSybCyMgBOuE2z6Z9Nb71LR8rBRDAjzddNyOShxt5AwGNKaXo5CEqTjD
	bACwIvGon2ISbhUKURWNAtgwYl919Pf0TvEl4NRL3c/zeRnqHtI0whZOKYRH3cYNZXUMpaqp415
	L+5J/oF3sU7Wb9LpPIL65BbdPc9htn1ky8ZQ8w99vzUje0XvdDVZHTlPQYPCh4XDNhR9Eqoqn+1
	MEZkkv/tS7e6BovrVYzvY4E6HLaFDQSoj8g1JmEORWrWN6/zPgF1wO0iN9A==
X-Received: by 2002:a05:622a:19a5:b0:4e0:5918:a476 with SMTP id d75a77b69052e-4e6ead6b52dmr106977491cf.79.1760021171416;
        Thu, 09 Oct 2025 07:46:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO7IxG0S1sU85Mw6KiHYlqrTFqzU7SbnpoBH3WmlFOcEqbgy36qns8njmCe3DRwYL5/+HJ4w==
X-Received: by 2002:a05:622a:19a5:b0:4e0:5918:a476 with SMTP id d75a77b69052e-4e6ead6b52dmr106976331cf.79.1760021169827;
        Thu, 09 Oct 2025 07:46:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3bfa243sm29975471fa.62.2025.10.09.07.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:46:09 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:46:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] media: iris: remove duplicateion between generic
 gen2 data and qcs8300
Message-ID: <5poz4rrym6jmpuo3sormchsjev4ssycd4cxk5ctgksa2ata44q@lx6xltp35zw7>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-5-def050ba5e1f@oss.qualcomm.com>
 <f622da01-3eb3-1aae-f788-d4dc6c22617f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f622da01-3eb3-1aae-f788-d4dc6c22617f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SB_yKiV7UX2iw0Jtik31z6Yd-_0J7QB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8t9PSY5nrKjD
 WZlz74yupRtRXreaT48WKoHUn+0H8g2FZL5zKcR3JunUVKCC5/1roUaOHPIr3xdAXpl81lRMMnx
 qgYSO6+UmIHhgb7Bck2JFOJHKp8SHWVc/QNwmS3KHmxf9Xc5Za2cC0+tOvFE5kbhEvgE2zHC0w2
 Vs2bo3sNRCUhPKT9MIk3WpclM4vs2qHBLxQKpMKBhduL74Dcvbwn5dvJ+Z/5+WAMZXIudwtz2U5
 HtwRCw6cZKu2i/I4FPd3qLhMsJcWPJaHmbUIfqy+01shozvVojQbdmS61KCa+wMGlMukbadkITe
 ERkKX5Q/qwY6C+YxG5Iw3FpEhvSYCSJ2SHAxRwlyoxUK+3EefrKAnWriSxYhpr7fHiZB5JSFSuz
 wF+HsKjbi0pZ281M7ZZkrZdtKqXjzA==
X-Proofpoint-GUID: SB_yKiV7UX2iw0Jtik31z6Yd-_0J7QB_
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7cab5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=v4sJ261x21Q0oYHOEEEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:40:00AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
> > Now as we have removed PIPE value from inst_fw_caps_dec there should be
> > no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
> > QCS8300-specific tables and use generic one instead.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../media/platform/qcom/iris/iris_platform_gen2.c  |  28 +-
> >  .../platform/qcom/iris/iris_platform_qcs8300.h     | 550 ---------------------
> >  2 files changed, 18 insertions(+), 560 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > index 7ad03a800356ae9fb73bdbd6d09928d0b500cb3c..5ddc579a73bbc75e3bfca5881d6eee4aa40f09c9 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > @@ -12,7 +12,6 @@
> >  #include "iris_vpu_buffer.h"
> >  #include "iris_vpu_common.h"
> >  
> > -#include "iris_platform_qcs8300.h"
> >  #include "iris_platform_sm8650.h"
> >  #include "iris_platform_sm8750.h"
> >  
> > @@ -993,11 +992,20 @@ const struct iris_platform_data sm8750_data = {
> >  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
> >  };
> >  
> > -/*
> > - * Shares most of SM8550 data except:
> > - * - inst_caps to platform_inst_cap_qcs8300
> > - * - inst_fw_caps to inst_fw_cap_qcs8300
> > - */
> > +static struct platform_inst_caps platform_inst_cap_qcs8300 = {
> > +	.min_frame_width = 96,
> > +	.max_frame_width = 4096,
> > +	.min_frame_height = 96,
> > +	.max_frame_height = 4096,
> > +	.max_mbpf = (4096 * 2176) / 256,
> > +	.mb_cycles_vpp = 200,
> > +	.mb_cycles_fw = 326389,
> > +	.mb_cycles_fw_vpp = 44156,
> > +	.num_comv = 0,
> > +	.max_frame_rate = MAXIMUM_FPS,
> > +	.max_operating_rate = MAXIMUM_FPS,
> > +};
> > +
> Agree with removing the fw_caps and using the generic ones.
> 
> But inst_caps should still be in separate header file for qcs8300, to keep
> design consistent across SOCs.

Ack, I will modify it accordinfly. Should the platform data be a part of
a separate header too? What is the expected split between the files?

> 
> Thanks,
> Dikshita
> 
> >  const struct iris_platform_data qcs8300_data = {
> >  	.get_instance = iris_hfi_gen2_get_instance,
> >  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> > @@ -1022,10 +1030,10 @@ const struct iris_platform_data qcs8300_data = {
> >  	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
> >  	.pas_id = IRIS_PAS_ID,
> >  	.inst_caps = &platform_inst_cap_qcs8300,
> > -	.inst_fw_caps_dec = inst_fw_cap_qcs8300_dec,
> > -	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
> > -	.inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
> > -	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
> > +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
> > +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> > +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> > +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> >  	.tz_cp_config_data = &tz_cp_config_sm8550,
> >  	.core_arch = VIDEO_ARCH_LX,
> >  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> > deleted file mode 100644
> > index 612526a938eed0554fc0da99e12c26d22e04bb6e..0000000000000000000000000000000000000000
> > --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> > +++ /dev/null
> > @@ -1,550 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> > - */
> > -
> > -#define BITRATE_MAX				245000000
> > -
> > -static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
> > -	{
> > -		.cap_id = PROFILE_H264,
> > -		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> > -		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
> > -		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > -		.hfi_id = HFI_PROP_PROFILE,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -		.set = iris_set_u32_enum,
> > -	},
> > -	{
> > -		.cap_id = PROFILE_HEVC,
> > -		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > -		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > -		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > -		.hfi_id = HFI_PROP_PROFILE,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -		.set = iris_set_u32_enum,
> > -	},
> > -	{
> > -		.cap_id = PROFILE_VP9,
> > -		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> > -		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
> > -		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> > -		.hfi_id = HFI_PROP_PROFILE,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -		.set = iris_set_u32_enum,
> > -	},
> > -	{
> > -		.cap_id = LEVEL_H264,
> > -		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> > -		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
> > -		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
> > -		.hfi_id = HFI_PROP_LEVEL,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -		.set = iris_set_u32_enum,
> > -	},
> > -	{
> > -		.cap_id = LEVEL_HEVC,
> > -		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> > -		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
> > -		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
> > -		.hfi_id = HFI_PROP_LEVEL,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -		.set = iris_set_u32_enum,
> > -	},
> > -	{
> > -		.cap_id = LEVEL_VP9,
> > -		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
> > -		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
> > -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
> > -		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
> > -		.hfi_id = HFI_PROP_LEVEL,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -		.set = iris_set_u32_enum,
> > -	},
> > -	{
> > -		.cap_id = TIER,
> > -		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
> > -		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
> > -		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> > -		.hfi_id = HFI_PROP_TIER,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -		.set = iris_set_u32_enum,
> > -	},
> > -	{
> > -		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
> > -		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> > -		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> > -		.step_or_mask = 1,
> > -		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> > -		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> > -		.flags = CAP_FLAG_INPUT_PORT,
> > -		.set = iris_set_u32,
> > -	},
> > -	{
> > -		.cap_id = STAGE,
> > -		.min = STAGE_1,
> > -		.max = STAGE_2,
> > -		.step_or_mask = 1,
> > -		.value = STAGE_2,
> > -		.hfi_id = HFI_PROP_STAGE,
> > -		.set = iris_set_stage,
> > -	},
> > -	{
> > -		.cap_id = PIPE,
> > -		.min = PIPE_1,
> > -		/* .max is set via platform data */
> > -		.step_or_mask = 1,
> > -		/* .value is set via platform data */
> > -		.hfi_id = HFI_PROP_PIPE,
> > -		.set = iris_set_pipe,
> > -	},
> > -	{
> > -		.cap_id = POC,
> > -		.min = 0,
> > -		.max = 2,
> > -		.step_or_mask = 1,
> > -		.value = 1,
> > -		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
> > -	},
> > -	{
> > -		.cap_id = CODED_FRAMES,
> > -		.min = CODED_FRAMES_PROGRESSIVE,
> > -		.max = CODED_FRAMES_PROGRESSIVE,
> > -		.step_or_mask = 0,
> > -		.value = CODED_FRAMES_PROGRESSIVE,
> > -		.hfi_id = HFI_PROP_CODED_FRAMES,
> > -	},
> > -	{
> > -		.cap_id = BIT_DEPTH,
> > -		.min = BIT_DEPTH_8,
> > -		.max = BIT_DEPTH_8,
> > -		.step_or_mask = 1,
> > -		.value = BIT_DEPTH_8,
> > -		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> > -	},
> > -	{
> > -		.cap_id = RAP_FRAME,
> > -		.min = 0,
> > -		.max = 1,
> > -		.step_or_mask = 1,
> > -		.value = 1,
> > -		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
> > -		.flags = CAP_FLAG_INPUT_PORT,
> > -		.set = iris_set_u32,
> > -	},
> > -};
> > -
> > -static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
> > -	{
> > -		.cap_id = PROFILE_H264,
> > -		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> > -		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
> > -		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > -		.hfi_id = HFI_PROP_PROFILE,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -	},
> > -	{
> > -		.cap_id = PROFILE_HEVC,
> > -		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > -		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
> > -		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > -		.hfi_id = HFI_PROP_PROFILE,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -	},
> > -	{
> > -		.cap_id = LEVEL_H264,
> > -		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> > -		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0),
> > -		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
> > -		.hfi_id = HFI_PROP_LEVEL,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -	},
> > -	{
> > -		.cap_id = LEVEL_HEVC,
> > -		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> > -		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
> > -		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> > -		.hfi_id = HFI_PROP_LEVEL,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -	},
> > -	{
> > -		.cap_id = STAGE,
> > -		.min = STAGE_1,
> > -		.max = STAGE_2,
> > -		.step_or_mask = 1,
> > -		.value = STAGE_2,
> > -		.hfi_id = HFI_PROP_STAGE,
> > -	},
> > -	{
> > -		.cap_id = HEADER_MODE,
> > -		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
> > -		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
> > -				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
> > -		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> > -		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -	},
> > -	{
> > -		.cap_id = PREPEND_SPSPPS_TO_IDR,
> > -		.min = 0,
> > -		.max = 1,
> > -		.step_or_mask = 1,
> > -		.value = 0,
> > -	},
> > -	{
> > -		.cap_id = BITRATE,
> > -		.min = 1,
> > -		.max = BITRATE_MAX,
> > -		.step_or_mask = 1,
> > -		.value = BITRATE_DEFAULT,
> > -		.hfi_id = HFI_PROP_TOTAL_BITRATE,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > -			CAP_FLAG_DYNAMIC_ALLOWED,
> > -	},
> > -	{
> > -		.cap_id = BITRATE_PEAK,
> > -		.min = 1,
> > -		.max = BITRATE_MAX,
> > -		.step_or_mask = 1,
> > -		.value = BITRATE_DEFAULT,
> > -		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > -			CAP_FLAG_DYNAMIC_ALLOWED,
> > -	},
> > -	{
> > -		.cap_id = BITRATE_MODE,
> > -		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> > -		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
> > -				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
> > -		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> > -		.hfi_id = HFI_PROP_RATE_CONTROL,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -	},
> > -	{
> > -		.cap_id = FRAME_SKIP_MODE,
> > -		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> > -		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
> > -				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
> > -				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
> > -		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -	},
> > -	{
> > -		.cap_id = FRAME_RC_ENABLE,
> > -		.min = 0,
> > -		.max = 1,
> > -		.step_or_mask = 1,
> > -		.value = 1,
> > -	},
> > -	{
> > -		.cap_id = GOP_SIZE,
> > -		.min = 0,
> > -		.max = INT_MAX,
> > -		.step_or_mask = 1,
> > -		.value = 2 * DEFAULT_FPS - 1,
> > -		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > -			CAP_FLAG_DYNAMIC_ALLOWED,
> > -	},
> > -	{
> > -		.cap_id = ENTROPY_MODE,
> > -		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> > -		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> > -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
> > -				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
> > -		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> > -		.hfi_id = HFI_PROP_CABAC_SESSION,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > -	},
> > -	{
> > -		.cap_id = MIN_FRAME_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MIN_QP_8BIT,
> > -		.hfi_id = HFI_PROP_MIN_QP_PACKED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT,
> > -	},
> > -	{
> > -		.cap_id = MIN_FRAME_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MIN_QP_8BIT,
> > -		.hfi_id = HFI_PROP_MIN_QP_PACKED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT,
> > -	},
> > -	{
> > -		.cap_id = MAX_FRAME_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MAX_QP,
> > -		.hfi_id = HFI_PROP_MAX_QP_PACKED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT,
> > -	},
> > -	{
> > -		.cap_id = MAX_FRAME_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MAX_QP,
> > -		.hfi_id = HFI_PROP_MAX_QP_PACKED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT,
> > -	},
> > -	{
> > -		.cap_id = I_FRAME_MIN_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MIN_QP_8BIT,
> > -	},
> > -	{
> > -		.cap_id = I_FRAME_MIN_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MIN_QP_8BIT,
> > -	},
> > -	{
> > -		.cap_id = P_FRAME_MIN_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MIN_QP_8BIT,
> > -	},
> > -	{
> > -		.cap_id = P_FRAME_MIN_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MIN_QP_8BIT,
> > -	},
> > -	{
> > -		.cap_id = B_FRAME_MIN_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MIN_QP_8BIT,
> > -	},
> > -	{
> > -		.cap_id = B_FRAME_MIN_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MIN_QP_8BIT,
> > -	},
> > -	{
> > -		.cap_id = I_FRAME_MAX_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MAX_QP,
> > -	},
> > -	{
> > -		.cap_id = I_FRAME_MAX_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MAX_QP,
> > -	},
> > -	{
> > -		.cap_id = P_FRAME_MAX_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MAX_QP,
> > -	},
> > -	{
> > -		.cap_id = P_FRAME_MAX_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MAX_QP,
> > -	},
> > -	{
> > -		.cap_id = B_FRAME_MAX_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MAX_QP,
> > -	},
> > -	{
> > -		.cap_id = B_FRAME_MAX_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = MAX_QP,
> > -	},
> > -	{
> > -		.cap_id = I_FRAME_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = DEFAULT_QP,
> > -		.hfi_id = HFI_PROP_QP_PACKED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > -			CAP_FLAG_DYNAMIC_ALLOWED,
> > -	},
> > -	{
> > -		.cap_id = I_FRAME_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = DEFAULT_QP,
> > -		.hfi_id = HFI_PROP_QP_PACKED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > -			CAP_FLAG_DYNAMIC_ALLOWED,
> > -	},
> > -	{
> > -		.cap_id = P_FRAME_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = DEFAULT_QP,
> > -		.hfi_id = HFI_PROP_QP_PACKED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > -			CAP_FLAG_DYNAMIC_ALLOWED,
> > -	},
> > -	{
> > -		.cap_id = P_FRAME_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = DEFAULT_QP,
> > -		.hfi_id = HFI_PROP_QP_PACKED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > -			CAP_FLAG_DYNAMIC_ALLOWED,
> > -	},
> > -	{
> > -		.cap_id = B_FRAME_QP_H264,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = DEFAULT_QP,
> > -		.hfi_id = HFI_PROP_QP_PACKED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > -			CAP_FLAG_DYNAMIC_ALLOWED,
> > -	},
> > -	{
> > -		.cap_id = B_FRAME_QP_HEVC,
> > -		.min = MIN_QP_8BIT,
> > -		.max = MAX_QP,
> > -		.step_or_mask = 1,
> > -		.value = DEFAULT_QP,
> > -		.hfi_id = HFI_PROP_QP_PACKED,
> > -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > -			CAP_FLAG_DYNAMIC_ALLOWED,
> > -	},
> > -};
> > -
> > -static struct platform_inst_caps platform_inst_cap_qcs8300 = {
> > -	.min_frame_width = 96,
> > -	.max_frame_width = 4096,
> > -	.min_frame_height = 96,
> > -	.max_frame_height = 4096,
> > -	.max_mbpf = (4096 * 2176) / 256,
> > -	.mb_cycles_vpp = 200,
> > -	.mb_cycles_fw = 326389,
> > -	.mb_cycles_fw_vpp = 44156,
> > -	.num_comv = 0,
> > -	.max_frame_rate = MAXIMUM_FPS,
> > -	.max_operating_rate = MAXIMUM_FPS,
> > -};
> > 

-- 
With best wishes
Dmitry

