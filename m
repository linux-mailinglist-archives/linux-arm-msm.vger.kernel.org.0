Return-Path: <linux-arm-msm+bounces-95498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DQxIlQNqWk20wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:57:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15D20AEE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D0503012236
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 04:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102AB28030E;
	Thu,  5 Mar 2026 04:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClbDpE6T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eds56t5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11AB26F46E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 04:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772686668; cv=none; b=rdX62m2IdgK9WuJ5sEdQDhca67xX8Ilzv6JqqLimPjbXWFiiNWFdBzEPj27qNhnLZAyPD9JAu+vZ2aGutpwjTMOJXi8OmaG+qxG8J65UPykcafoGIMxICV2DgOxSHgJXeUiT1eh91Dk5a8UJ5qQ7OmTOQhElrcIgldg3Gi2Eacw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772686668; c=relaxed/simple;
	bh=cQxMEXOTDSY6aXRXvIRUS5pAJH15yAzyWCGScn/5Vyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBymJU7sH0bIbTrH+LL+ttxyboMnckWgfYgniGNSAwO+Qz5jp+Ju4PlfbnPlVVAngXXUuyRWfmp1MOP045xAau43THCjTmhSqej5MyhtYweF853BNoU6ti13kw41AO1HItD+LfFdZMfJz1E6mIrEqVXzifD4XMBZV+x7gGFKvvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClbDpE6T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eds56t5B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BgFP021019
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 04:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g9SohA056+54xULbQ3QTWZf7
	S/3inMkI7zc53tCPOWY=; b=ClbDpE6T4f+bRNN94enu93yrQR6DZmIzap1Qgrm+
	6eda5YnbHEUCMRL58BHBMw8z3FeY/L6oc3oCrTd9rFQcJ/8jPnl6f0U+/iRwK5dc
	P66jMlpo6I8MNog6taDESs1RVTXSoljoF8pyO/9XjVACiGoKVhmKXKjyqs8xvWtM
	m3iBbN02M65D3vW6sXdOi5+L2aBx+NI6W7bTkLC/yDaERSRExTD6rgKoG3rD/30h
	a/35kPf9VNH/wTDA0JNHgOdcfDYY1nhxXqKeTaIiRtYTLgrNkYE8irj0hIT605m7
	lC+gXlPTxBviDdUcKiIAXpY585uBM5u4JLq83dW17CVsIg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpupth76b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 04:57:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a15bb70easo81706146d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 20:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772686666; x=1773291466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g9SohA056+54xULbQ3QTWZf7S/3inMkI7zc53tCPOWY=;
        b=eds56t5BUdtLB8QmEETLUyepvcpfiNvGPvFbr+ADIwsy5BF354Qf805geIZd7h205L
         Hu8ReZlguEZPzxFGaF0hzlazGrRm0bQYwxxLfzjlpNiMeJFpJIAWLIUT8E+R3qawwYp/
         rJjfRKO4+S89rA28SjOXj1rDt8YTgG/NIUl+LVCtbkAbp87JaoyfUMJot+lHAgf88cfE
         dPcojJp9f4IH2DQle43qkb+nEp25TLc4aYfzjLMapaXjjdyJIHglbgT/AWH6fkhkZofY
         2k5AMPLEKRFGJN03BjC/5b0cn5X+/7a4GrjGiBYUTelrw7dulgizYnNzDUFH34p4Y7Fh
         kjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772686666; x=1773291466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9SohA056+54xULbQ3QTWZf7S/3inMkI7zc53tCPOWY=;
        b=Zb6kq+8vu8eW6KDRqZ3+G+sHo4RkER76y2yCqls10VNSzjPALZ5g6kcQuDWbKrJW18
         BoIKjOdN8/Mxc7I4gVY5QDwpHGs3ZjOYIY4jFmLRndi8oXF+cvjD3RC/7Q39bscFwAl6
         8k2RX4SNmKy4umWdLO83YoThJc2Rbo2x+YAqbjLJ2ejf0dcO7B+gLXTNwd48+zMzcPhK
         jdoET+reP1atATIEnmL8eAjqttAmUblz7WVWneWOlPPgIklfjSwhNJGISFzp31gukfw4
         fEV1lIuWuhpkmWKqqK9Kl21F/UCuFnFsbZ7ubbgwr1EBOIKTAViTo2PyzTgP6UKyDDGL
         +rtA==
X-Forwarded-Encrypted: i=1; AJvYcCU7+a2Ayyqv++29OTbIa+azOB71yjZY/0890T6pBz862MprIJ/qxElL6o3H4TExPuKAzVkFmzIaR4vTvUwS@vger.kernel.org
X-Gm-Message-State: AOJu0YyugkSqxyujPjpXjx3SaUNjeh6261uhcbhJb4M/sZIAhvq/6M1h
	tsP8od9ixP9cF1OYEyTcw8errAeu/AMI+qRY+aNOHU9JFJUFRqRtSW/rX5qPdR83KMlhLcLFEzP
	t/TOM/suSjVV3lJt3AbqqIhvXScyy9YirsVnDPMPzSB9JHYmeCU5tY+ZC9xuLzwQwByV4
X-Gm-Gg: ATEYQzy5PwMASgNDw8vHBzL552fZ+03IZGPCt2NVx3iickBdUWuRAO4R25cKI1y5zpH
	NsLF/YvZOIixAkdhJqhnv2O3q74KDefMCwH6jCNX8o1rqJji1jsQ2NkXL0stpr9HS8MstNYDqTR
	fTUrgU73h8xjLSJZfUmsXEsRUIjy2BH4dnB2oBEJfL/eR45rfbkBcfnLwhrT7VgsSye+l2rRjPI
	W9JtAZW7/E3zZZeLFBN/aYonttqBO+0ii3yZqEG4Uw+46cjzvQsDX+YNZ4EniAam8/JPzmmwZZ4
	9synxHeKh5OhqAz0Y0uapXa61X9Bst2SAdghLka4d+wilUVnYnakA5sMt8Dxr89DANbLOTUoTwX
	IUolpD4Wp4tAF0Jcc9SRuJPpEGNy5hqj0Kgd67UjDt37B8YJQslPVqInFbjE4lfTyWrSslUzIGf
	iBpVbMsmy6yzFPNyEormojymLwCzqHZK6Ro4s=
X-Received: by 2002:a05:620a:1918:b0:8cb:2c2f:90e with SMTP id af79cd13be357-8cd5af73b54mr533071885a.39.1772686665742;
        Wed, 04 Mar 2026 20:57:45 -0800 (PST)
X-Received: by 2002:a05:620a:1918:b0:8cb:2c2f:90e with SMTP id af79cd13be357-8cd5af73b54mr533070085a.39.1772686665192;
        Wed, 04 Mar 2026 20:57:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a337a930csm2523791fa.8.2026.03.04.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:57:43 -0800 (PST)
Date: Thu, 5 Mar 2026 06:57:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: iris: Add support for Gen2 firmware
 detection and loading on SC7280
Message-ID: <hzltrmeqf5oeh7o7xj7vtzhyaldyoep6ngmcwk6jqmiwdqszdp@raogozbh3iap>
References: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
 <20260227-iris_sc7280_gen2_support-v2-3-7e5b13d26542@oss.qualcomm.com>
 <yjtzeyjovbi3coyw4rblczokuki6t7oj5ni3exrzksdg4dwwd5@seuaf2tmrvub>
 <b6caaf35-2e41-9b76-aab8-0b8b6a8a8e67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6caaf35-2e41-9b76-aab8-0b8b6a8a8e67@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMyBTYWx0ZWRfX7paccHIfkwkW
 s3XSeULqdmUq4KY1CiXnS+kuRvCXZ4/p32AILdTTHMFFQCxNAVBDcJrmlrzlMWFtnY1N0PHMN4V
 UTp3qBc4gJjpOnQvr+qfXSvIh9qxTy0rCuQnai5cV1xrJcUWv/aGy8x20Pt7UfdF72kHa00rsmM
 s+tTxbh1leFO1LKkCZWPoGgUu5ELNX2IusZxQ0z51g2JNR5CO0mebLNQ21NVGiGnHIy47wDsNdM
 HViiH6auVD/HpPiS22slPSAFEcnOdOsFqkV2tuVBkk8Tqpm/Yh/tMBulZCbkQBLmPdoTbwmB4wK
 RhjrKjnNE1qHRFDSUZsJhKeYAMzMHVDZG99GAw/Z9Od1fn1wXAeWB9LlrBs13fAruSlhymOLbgi
 IPwcT37E2UzbN6Anv8QHHXM/Ga4JUfNRrmpVxEKmLg2xl60rgSQ50mi+505Q2SwS/Gi7p6i4Mce
 4F0JrAaX/Xjm1O+ZhPA==
X-Proofpoint-ORIG-GUID: h9rceInCrcJM2rk8RTEv2mtfEJ9ODeNH
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a90d4a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=vAhLNi6rj8_hoSnI:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vAeqaJklcl7F9IkrpN0A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: h9rceInCrcJM2rk8RTEv2mtfEJ9ODeNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050033
X-Rspamd-Queue-Id: 7B15D20AEE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95498-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:56:16PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/27/2026 5:48 PM, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 12:21:03PM +0530, Dikshita Agarwal wrote:
> >> SC7280 supports both Gen1 and Gen2 HFI firmware. To support both
> >> dynamically, update the firmware loading mechanism to prioritize
> >> Gen2 availability and detect the loaded firmware version at runtime.
> >>
> >> The firmware loading logic is updated with the following priority:
> >> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> >> 2. Gen2 Autodetect (SC7280 only): If no DT property exists, attempt to
> >>    load the specific Gen2 firmware image (`vpu20_p1_gen2_s6.mbn`).
> >> 3. Default Fallback: If Gen2 loading fails or is not applicable, use
> >>    the default firmware name defined in the default platform data.
> >>
> >> Additionally, introduce `iris_update_platform_data` to inspect the
> >> loaded firmware memory before authentication. This function scans for
> >> `QC_IMAGE_VERSION_STRING`. If the version string starts with "vfw" or
> >> matches "video-firmware.N.M" (where N >= 2), it identifies the
> >> firmware as Gen2.
> >>
> >> If Gen2 firmware is detected on SC7280, the driver switches the
> >> internal platform data pointer to the Gen2 configuration.
> >>
> >> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/iris_firmware.c   | 70 +++++++++++++++++-
> >>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
> >>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
> >>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
> >>  .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
> >>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 -
> >>  drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
> >>  7 files changed, 171 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >> index df8e6bf9430ed2a070e092edae9ef998d092cb5e..6dbdd0833dcdc7dfac6d7b35f99837c883e188e7 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >> @@ -414,8 +414,8 @@ const struct iris_platform_data sc7280_data = {
> >>  	.dma_mask = 0xe0000000 - 1,
> >>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
> >>  	.pas_id = IRIS_PAS_ID,
> >> -	.inst_iris_fmts = platform_fmts_sm8250_dec,
> >> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> >> +	.inst_iris_fmts = platform_fmts_sc7280_dec,
> >> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
> > 
> > Why?
> > 
> 
> SC7280 Gen2 platform data relies heavily on SM8550 data structures.
> However, unlike SM8550, SC7280 does not support AV1. To address this, I am
> defining a dedicated platform_fmts_sc7280_dec array that correctly lists
> the supported codecs (H264, HEVC, VP9) excluding AV1 and using for both
> gen1 and gen2 platform data for SC7280.

Why can't we continue using SM8250 data? Also please see the series I
posted few days ago, it might simplify this piece for you.

> 
> >>  	.inst_caps = &platform_inst_cap_sm8250,
> >>  	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> >>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..5f3be22a003fe5d80b683b43a1b2386497785fb1 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >> @@ -15,6 +15,7 @@
> >>  #include "iris_platform_qcs8300.h"
> >>  #include "iris_platform_sm8650.h"
> >>  #include "iris_platform_sm8750.h"
> >> +#include "iris_platform_sc7280.h"
> > 
> > Don't you end up with two copies of 7280 data in the object files?
> > 
> 
> You are right, there is a duplication.
> The header is needed majorly for above reason to exclude AV1, I can have
> only platform_fmts_sc7280_dec defined in gen1 file and extern and use in
> gen2 file, that will deviate from the design we are currently following for
> platform specific caps though.

Then the design needs to be changed. I've posted a proposal.

> 
> >>  
> >>  #define VIDEO_ARCH_LX 1
> >>  #define BITRATE_MAX				245000000

> >> @@ -257,8 +256,6 @@ static int iris_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	iris_session_init_caps(core);
> >> -
> > 
> > Why?
> 
> Movin iris_session_init_caps to iris_open because platform data this
> capabilities may change after firmware loading, which happens after probe.
> Initializing caps in probe would result in stale Gen1 capabilities if the
> driver later switches to Gen2.

Is there a window where devices already exist, but the params are not
yet initialized?


-- 
With best wishes
Dmitry

