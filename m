Return-Path: <linux-arm-msm+bounces-97619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIeDLzlktGngnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:23:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA02289408
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D354301B870
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 19:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC693DA7F8;
	Fri, 13 Mar 2026 19:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ns6sFikx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FypY9igp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A1833F5A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773429810; cv=none; b=W/K6BXrB/oNWS1bU309gd3JQlRIGsDGGMCeveDZNGvaY2Ze6a+JhCo0CUF9u9XkHwNArNkbcxtRVlCiXivVOJm1WNjhkMRL26BulrMCvCreYV9YOnF/Hy/gq/2b4SexENE8zctX3X/24bwCiTvMgyaklKnxJVGzWB8kZuzFT0Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773429810; c=relaxed/simple;
	bh=NxDeSncN8ipuLqU9iMmqA//zFOEb/a6K8G10m3Y1Hi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkP59trbdjsSL8yfa0MRZfujzHShPvXFIRHimt7OZAdIUgYFblhdtu/IQPC3juzPxP6Bx87Jel6mlWL9Lbr29WpWhhsxIRgE5lJjhGQFiQoqt3ZMGcNOkuXSy8cm7f9VW17hX2PHCz5UoIIPw4CeX8PuW6uvMVvS4IVH5a/OvlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ns6sFikx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FypY9igp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXTKp437983
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o26czNIiazs9YgW3L7EzklFW
	chkE3b7SFTv5gZrXOV0=; b=Ns6sFikxLFQpiBX60sk/G3AEee5J4XkxV03UUB58
	miHnIh7JBP0RJU3cUXhI+S/c5zxlfxCrIlph6SGHb+EdlhJaFvbCVnn0lrdRa+h1
	sF6ZtY3szWX6rOwXI91WmcEoNkecgacYX6lb58RBv0z6Bkvc0Q2c5mwlgCW7E/d+
	48JFWxhvaKRXsut0L3f6dza177uSb70JfOsGZYi/rlTIfGGZ7T7qjvtbia1P3N7q
	2m3yrmi6r9M6hSXyJCrotD/fPXGbVFev7I8eJ1X2j+EHnuuiMzwErdBKWOu60NUM
	f/HtqIxwG+JOHaKdtCXZS5eJ+DDYZv0cJXHVmW3u+076Zg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax8sb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:23:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffad14cd7aso3643019137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773429806; x=1774034606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o26czNIiazs9YgW3L7EzklFWchkE3b7SFTv5gZrXOV0=;
        b=FypY9igppF+YNX911bCPJrflD2t3bmf0/9oGTExctkMqpgIBjHDcB3gbkiETRhEKIj
         LRR0gEV2GGQJ60k8vY+sxyU24bRTGG2vI38ww5ght+Ci/+6vVJKWz6xlmlDeWbjgYTQC
         ny/ldjYdYDlb2YNGSXWREExShDFCuSJ6H+9pK8GqOytMyTYKxGld4Bq7Kk1aM3jU0BhS
         hE5sET8B9A3p4z1oSTI0uS1OAss3jVaZa/uK6sRQgLDanSQaeiKtooLMfBffmqDgEyWy
         Q2HQR3Kt7AA3AUjLXQpaW4yu6HarFUldDKRal3e1R/2v3Gsw7vC3xcFxnFf49SHxOLx1
         XA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773429806; x=1774034606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o26czNIiazs9YgW3L7EzklFWchkE3b7SFTv5gZrXOV0=;
        b=DYb8LNG4rt+WAQehQ6QZUkA3DprjxAGBS814IyOPyflXrZ4vcmzBPgUsB+z6L41eEm
         4uNz8SXh8AmcRI0fQZVVEFdJAyZyWoiRFKVaKrUB6kwN/aQVWu4P5Ojnz4FIDiXd7W2/
         MaL0DasRoWbCaDjiv/DdPt43rA8SoNQbLAf2M4fTnzmAmF2RcAj7fy27qVS5CzE2s/cq
         VkXoiV9jVZ3hdVmMolWSAkT9xUeKI7u3HDrgWfU2rYlR7mQJNLJEsPglgjcQLjeNzM5x
         K1vJdWccTcqo6RJZ9jYMkLZeh0n2NoDjnwZsYawN/JjBf0wq7hiR8/yr9zmJzSBvJssm
         0fQg==
X-Forwarded-Encrypted: i=1; AJvYcCVcsOcgBG2PPYGfAejToZR2P1SVqAsfldWseiDm1BZi8DpYfGhTwE25/zHL+ESOIxNDy3p981b6F9KQi+rj@vger.kernel.org
X-Gm-Message-State: AOJu0YxPqNDMRjBEAuOOWCAJ5qSkJa28tlW1mQV4q6KSgiyQkHcKgZle
	zhUS2hFYaqlGFnz3DwJTEFxhRtFtEKEzZlokYGovqAp0XVBZ4PCKM3Q9FE8qSTOWSOa8m1J/N1q
	A6xK7b2cQDNN/clGZS8Y0YnBctdKQTMHK76myC+svFrj2L48kvUb3S6yweRaRT4NNfiZn
X-Gm-Gg: ATEYQzyIdWlx7BZOX7mLRps1QJc+IKbnjHoZM0w786A/YQetTwRQFBAUeAQp/7XHaQt
	5RvqhgFuNzARFBFQmx2tlEed5GidIRMwSS6kfgeW1KlRQSJtaQuWnOYhCy5gs1jB9SVKjmMMY0S
	VpwDWY7HMa5hwaiwftkvlziF/UO8i6Ssr/1Qr1IZiCbx/JALjTJEVGHU4xAQd7UgjhmsoJ+wAKV
	2nkpim4YNtTeAlwsGWNZ4xJa16IsjJLtI21Bf34wCyTvZMQ7S5ivp2f3PFp5p2ng5YSTa0z30g6
	rJDMdNPioyvZh28a3+0rXlujIaFZDW4Qg/qeTV8svDFpq6FOiNhp44uR+xiyM83NjnSYWbmep1W
	hw0jPp1qXt0bRCTAePLklnA7wFmn7jiFmqqlto7HAC7v3xTJcmgR+TwqkUTAK2XraTl1p3IN/+t
	cO1D0OV7LrbozZAtB3SNrP0awh4CftsGk+e8U=
X-Received: by 2002:a05:6102:510e:b0:5ff:a4e0:1938 with SMTP id ada2fe7eead31-6020e1ea44amr1791679137.8.1773429806069;
        Fri, 13 Mar 2026 12:23:26 -0700 (PDT)
X-Received: by 2002:a05:6102:510e:b0:5ff:a4e0:1938 with SMTP id ada2fe7eead31-6020e1ea44amr1791664137.8.1773429805385;
        Fri, 13 Mar 2026 12:23:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d61f25sm17161611fa.7.2026.03.13.12.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:23:24 -0700 (PDT)
Date: Fri, 13 Mar 2026 21:23:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 8/8] media: qcom: iris: split platform data from
 firmware data
Message-ID: <3vquo7j5perqak3lqpe6p3hutsyidw76d7qwbj2lj3nhgjtelq@xqbdaycdzhzu>
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-8-14927df4906d@oss.qualcomm.com>
 <2f233008-cdf6-5999-d703-73f58cc0f5ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f233008-cdf6-5999-d703-73f58cc0f5ed@oss.qualcomm.com>
X-Proofpoint-GUID: NkVTGgDnU0OisOZrOAnOEvdmHFyfwLYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE1NCBTYWx0ZWRfX9hCAVdkrsoLJ
 EravXWH7V3qKchmQb4fbvpWz7d2bvzuUUMoTOFc7ywzlHJ258GGeQOoj97VwBjrz7rCIRCzQgBq
 79qoEHNK0p3wMTRmHvOW5U3Lij6eaQ0NzIcGIAReJzIzM9r0h2knzDJygyojCpderkKRMOt9mDB
 fh0ZSAqj1PHK9NBTr5Psrv+qR/kSjJuYYXV6i2AbDCj8pthe787LFeUVNUUy3cGzXI3HO3hFwZX
 J4VsEVncd5ddr6WL6HIOiLpL2mQ6rN0NK3zZDFIOcUpc0oJEfIE1KXA5m4ESznzH6ZaDlWtJEE1
 i6xfHQ1ihT6elGbBNwWdb/YjaHM/8/FXGfp8hxB4jXbUwH6jtre5IWf5GEVI2ZRIfdQTEHBw6SB
 pn6l0BhBvm9VhPJMrMAFyWLRqcjnSnbUP1rlePxY/CGWslELPLd/pRqok0gBP3Ou6Sx+rW/ChZx
 KYWbYs4LeWkxTYMiVvQ==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b4642f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=tnUKyc083-Wg47zORF8A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: NkVTGgDnU0OisOZrOAnOEvdmHFyfwLYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130154
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97619-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,60fps:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FA02289408
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 01:37:42PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> > Finalize the logical separation of the software and hardware interface
> > descriptions by moving hardware properties to the files specific to the
> > particular VPU version.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/Makefile          |   6 +-
> >  .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 133 -------------
> >  .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 218 ---------------------
> >  .../platform/qcom/iris/iris_platform_common.h      |   4 +
> >  .../platform/qcom/iris/iris_platform_sm8250.h      |  29 +++
> >  .../platform/qcom/iris/iris_platform_sm8550.h      |  31 +++
> >  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 124 ++++++++++++
> >  .../media/platform/qcom/iris/iris_platform_vpu3.c  | 210 ++++++++++++++++++++
> >  8 files changed, 402 insertions(+), 353 deletions(-)
> > 
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > new file mode 100644
> > index 000000000000..74c8f38e849b
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > @@ -0,0 +1,124 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#include "iris_core.h"
> > +#include "iris_ctrls.h"
> > +#include "iris_platform_common.h"
> > +#include "iris_resources.h"
> > +#include "iris_hfi_gen1.h"
> > +#include "iris_hfi_gen1_defines.h"
> > +#include "iris_vpu_buffer.h"
> > +#include "iris_vpu_common.h"
> > +#include "iris_instance.h"
> > +
> > +#include "iris_platform_sc7280.h"
> > +#include "iris_platform_sm8250.h"
> > +
> > +static struct iris_fmt platform_fmts_sm8250_dec[] = {
> 
> How about naming this as platform_fmts_vpu2_dec ?

Ack

> 
> > +	[IRIS_FMT_H264] = {
> > +		.pixfmt = V4L2_PIX_FMT_H264,
> > +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> > +	},
> > +	[IRIS_FMT_HEVC] = {
> > +		.pixfmt = V4L2_PIX_FMT_HEVC,
> > +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> > +	},
> > +	[IRIS_FMT_VP9] = {
> > +		.pixfmt = V4L2_PIX_FMT_VP9,
> > +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> > +	},
> > +};
> > +
> > +static struct platform_inst_caps platform_inst_cap_sm8250 = {
> 
> platform_inst_cap_vpu2 ?

I thought that these params might change from platform to platform.
IIRC, SM8350 supported smaller frames in some cases.

> 
> > +	.min_frame_width = 128,
> > +	.max_frame_width = 8192,
> > +	.min_frame_height = 128,
> > +	.max_frame_height = 8192,
> > +	.max_mbpf = 138240,
> > +	.mb_cycles_vsp = 25,
> > +	.mb_cycles_vpp = 200,
> > +	.max_frame_rate = MAXIMUM_FPS,
> > +	.max_operating_rate = MAXIMUM_FPS,
> > +};
> > +
> > +static const struct icc_info sm8250_icc_table[] = {
> 
> icc_table_vpu2 ?

Aren't the limits generally platform-dependent?

> 
> > +	{ "cpu-cfg",    1000, 1000     },
> > +	{ "video-mem",  1000, 15000000 },
> > +};
> > +
> > +static const char * const sm8250_clk_reset_table[] = { "bus", "core" };
> 
> clk_reset_table_vpu2 ? and so on.

Ack.

> 
> > +
> > +static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> > +
> > +static const struct tz_cp_config tz_cp_config_sm8250[] = {
> > +	{
> > +		.cp_start = 0,
> > +		.cp_size = 0x25800000,
> > +		.cp_nonpixel_start = 0x01000000,
> > +		.cp_nonpixel_size = 0x24800000,
> > +	},
> > +};
> > +
> > +const struct iris_platform_data sc7280_data = {
> > +	.firmware_data = &iris_hfi_gen1_data,
> > +	.vpu_ops = &iris_vpu2_ops,
> > +	.icc_tbl = sm8250_icc_table,
> > +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> > +	.bw_tbl_dec = sc7280_bw_table_dec,
> > +	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
> > +	.pmdomain_tbl = sm8250_pmdomain_table,
> > +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> > +	.opp_pd_tbl = sc7280_opp_pd_table,
> > +	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
> > +	.clk_tbl = sc7280_clk_table,
> > +	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
> > +	.opp_clk_tbl = sc7280_opp_clk_table,
> > +	/* Upper bound of DMA address range */
> > +	.dma_mask = 0xe0000000 - 1,
> > +	.fwname = "qcom/vpu/vpu20_p1.mbn",
> > +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> > +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> > +	.inst_caps = &platform_inst_cap_sm8250,
> > +	.tz_cp_config_data = tz_cp_config_sm8250,
> > +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> > +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> > +	.num_vpp_pipe = 1,
> > +	.no_aon = true,
> > +	.max_session_count = 16,
> > +	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
> > +	/* max spec for SC7280 is 4096x2176@60fps */
> > +	.max_core_mbps = 4096 * 2176 / 256 * 60,
> > +};
> > +
> > +const struct iris_platform_data sm8250_data = {
> > +	.firmware_data = &iris_hfi_gen1_data,
> > +	.vpu_ops = &iris_vpu2_ops,
> > +	.icc_tbl = sm8250_icc_table,
> > +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> > +	.clk_rst_tbl = sm8250_clk_reset_table,
> > +	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
> > +	.bw_tbl_dec = sm8250_bw_table_dec,
> > +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> > +	.pmdomain_tbl = sm8250_pmdomain_table,
> > +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> > +	.opp_pd_tbl = sm8250_opp_pd_table,
> > +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> > +	.clk_tbl = sm8250_clk_table,
> > +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> > +	.opp_clk_tbl = sm8250_opp_clk_table,
> > +	/* Upper bound of DMA address range */
> > +	.dma_mask = 0xe0000000 - 1,
> > +	.fwname = "qcom/vpu-1.0/venus.mbn",
> > +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> > +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> > +	.inst_caps = &platform_inst_cap_sm8250,
> > +	.tz_cp_config_data = tz_cp_config_sm8250,
> > +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> > +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> > +	.num_vpp_pipe = 4,
> > +	.max_session_count = 16,
> > +	.max_core_mbpf = NUM_MBS_8K,
> > +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> > +};
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3.c
> > new file mode 100644
> > index 000000000000..2c0e5be72920
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3.c
> 
> iris_platform_vpu3x.c ?
> 
> > @@ -0,0 +1,210 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> > + * Copyright (c) 2025 Linaro Ltd
> > + */
> > +
> > +#include "iris_core.h"
> > +#include "iris_ctrls.h"
> > +#include "iris_hfi_gen2.h"
> > +#include "iris_hfi_gen2_defines.h"
> > +#include "iris_platform_common.h"
> > +#include "iris_vpu_buffer.h"
> > +#include "iris_vpu_common.h"
> > +
> > +#include "iris_platform_qcs8300.h"
> > +#include "iris_platform_sm8550.h"
> > +#include "iris_platform_sm8650.h"
> > +#include "iris_platform_sm8750.h"
> > +
> > +#define VIDEO_ARCH_LX 1
> > +
> > +static struct iris_fmt platform_fmts_sm8550_dec[] = {
> 
> platform_fmts_vpu3x_dec ?

Ack

> 
> > +	[IRIS_FMT_H264] = {
> > +		.pixfmt = V4L2_PIX_FMT_H264,
> > +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> > +	},
> > +	[IRIS_FMT_HEVC] = {
> > +		.pixfmt = V4L2_PIX_FMT_HEVC,
> > +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> > +	},
> > +	[IRIS_FMT_VP9] = {
> > +		.pixfmt = V4L2_PIX_FMT_VP9,
> > +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> > +	},
> > +	[IRIS_FMT_AV1] = {
> > +		.pixfmt = V4L2_PIX_FMT_AV1,
> > +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> > +	},
> > +};
> > +
> > +static const struct icc_info sm8550_icc_table[] = {
> 
> icc_table_vpu3x ? and so on.
> 
> Thanks,
> Dikshita
> 
> > +	{ "cpu-cfg",    1000, 1000     },
> > +	{ "video-mem",  1000, 15000000 },
> > +};
> > +
> > +static const struct bw_info sm8550_bw_table_dec[] = {
> > +	{ ((4096 * 2160) / 256) * 60, 1608000 },
> > +	{ ((4096 * 2160) / 256) * 30,  826000 },
> > +	{ ((1920 * 1080) / 256) * 60,  567000 },
> > +	{ ((1920 * 1080) / 256) * 30,  294000 },
> > +};
> > +
> > +static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
> > +
> > +static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
> > +
> > +static const char * const sm8550_opp_clk_table[] = {
> > +	"vcodec0_core",
> > +	NULL,
> > +};
> > +
> > +static const struct tz_cp_config tz_cp_config_sm8550[] = {
> > +	{
> > +		.cp_start = 0,
> > +		.cp_size = 0x25800000,
> > +		.cp_nonpixel_start = 0x01000000,
> > +		.cp_nonpixel_size = 0x24800000,
> > +	},
> > +};
> 

-- 
With best wishes
Dmitry

