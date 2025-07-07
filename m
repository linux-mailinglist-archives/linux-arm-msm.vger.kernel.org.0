Return-Path: <linux-arm-msm+bounces-63909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E42EAFB072
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02FEE7A588B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20032289E2A;
	Mon,  7 Jul 2025 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipRjMHMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198A27B4E5
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882222; cv=none; b=kBbOPD+iZ/cUX/3hH1aMwFZRVCswJEnQoy9yiCt2joEpcRERjN2MDU+uuinUL6CkZr+MAhJHTGWjKqwZj9HxSLUFW8maWmOeI3rqLkZYnTQCWj36ThENl/LGEPwit8yVGQEKaVsaDVgwxGj7iAsFF7+LJpmRAXfSe7t44iYOuzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882222; c=relaxed/simple;
	bh=18YR99uXCyEZk77ThDFqutW4vFM4pTkYue+/FBulMLg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Od7SQcyKTsHVEpYFnrKV5B2RFvCp1Gh0fRXSvTHe9s/Gc0aAircR/TuGk783+0BT+aBYakX2yj6jAT29HW7gVjGsRX7y/Y9oFQrO9Omp2PTqLnvAzmvyhO+6F/uGm/bm1rs9Cxk8H3hANzQRXXftTX78Vpf3WZuQ0rL5oalSBcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipRjMHMh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679kQRj014843
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 09:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EOkscAPglu6pNYZf/TxA87OL
	ergxaMCP9y55D8Mo79k=; b=ipRjMHMh7ptxXvwLj+25db+3re9z/kUJtcwn/MPk
	aYGp3b3xrQ63+vhrZLEwf3AsBL4rj8XyPdLEwwZHrqw+Zj1Nd3ifkdt2eY5HfVwj
	lwHSZYHMBo43JaYucfkXmYvz08yrKF3u3EHr131mXd7aiiEL74mHpsHEEO9dLs6z
	zvQhpWIQUbuiXI8OX1/g5aV+PTkIzMrIs2j+S3pjsPX1S10Y6yyTApV7TQSLDH7u
	YPg2CLgFalLCQN+PIhwjxS7kWScnrkmi+teHgVNKnPusKfdhnLSndUDIDCYacjuE
	OXBa88jBSmLh76xpiLjv5kETArloapFNAVPIdEz8XpKa1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkbx5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 09:56:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ceb5b5140eso405034285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882217; x=1752487017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOkscAPglu6pNYZf/TxA87OLergxaMCP9y55D8Mo79k=;
        b=QA+Zzth+p1f2Z6PrUBWvYkpFX7CFDp0x7UIB8Yb6FogBx9vjrAgUL6r55+AyR1ipM/
         oIVCCpFP7EOWbdqxyYimdQfWXtnUzGDEOGoktHmTXkKxM564RRCV4KfSUCKwq3dNVfIS
         Qo1LtiPt7yy+mpMJnaefjG1oe2WROVMx65GW9NKe73oRn1960emG/JTmG1GKM6+wzdyx
         DxBAcW42ms00WZVlmi1P7zOYf19jy1W4IM8iB/YZCVha5axiVl89jIIX9Gig4VlrO/mK
         UYRYpo+4F//WrpWtfPii+PiaaEMLNMs+Nu3Y7s4odlhxYWkw7XNTFCGDohJm2g5Ctfr5
         pP8A==
X-Forwarded-Encrypted: i=1; AJvYcCXxr7e/vU6mFcNowpIcL0Q2j5VG9L9TZCeC7MCzw0Q0BtfSglFhrwm3Z9mCt4aCaLtATbs0QnTP5n89ZRPC@vger.kernel.org
X-Gm-Message-State: AOJu0YygpBeE8fREuXgwtbvBylyr6HiBJ3Kp4JEu4dq8EYijI4y8iJO4
	U8IvuLCRD8jRNGA+LM2mzZALakS3m0tzr5KTOsAOOTKXrhv2oVh31xC0+pUYg0T0kFsTumKgTA4
	oSe9lkIPhgwu+lv5sWshcRgTMHnQJw5uHRzUxZjNnt30HqCyl13j2/8BQvp1nDYr/09cP
X-Gm-Gg: ASbGncudnQqcTddpXH8RzSj3BfPkbLmjLIgw87iEL3+nLu/d7Fn6fu/D9mDAoqffQSP
	8rZ028S4oRR71EqMv2CmcNVqJxJhN+wr2g+uyubQAXInmrBQ3B1IyX2NjdNr8Ql96QYrJs51fZi
	b9ETf1EFcI3irS1FtGhGwLpBC9vSh/p0seC/FIXgqp2T9r5bw4hxgjP+npbkPY01Hw3vKX15ty/
	u94LeWx+vfU3L8QPKYR6Vkk18Wgk4usOVqJZ+GbIhG/Pa84+pTqYk6XIFHySymPf9EjHQfz0TgN
	G/Mo5yRAhNRkYBpLL/ndI4q5bd3JdezX1zvK8VsOFDnbpEqkOiJQgmI=
X-Received: by 2002:a05:620a:8083:b0:7d2:15e:1f9d with SMTP id af79cd13be357-7d5f20b7efamr1156797485a.53.1751882217027;
        Mon, 07 Jul 2025 02:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8HJEkPslMRBZD2ONOEBO+PEUNCALtoyCPDK0CyJ4VcqyQXuJqvMV6aeF1c958pDPXhcvw3g==
X-Received: by 2002:a05:620a:8083:b0:7d2:15e:1f9d with SMTP id af79cd13be357-7d5f20b7efamr1156794685a.53.1751882216608;
        Mon, 07 Jul 2025 02:56:56 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16288b5sm108476705e9.9.2025.07.07.02.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:56:56 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:56:54 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] media: venus: hfi_plat_v6_lite: Populate decode
 capabilities
Message-ID: <aGuZ5h7LpPu5Pbnr@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-4-jorge.ramirez@oss.qualcomm.com>
 <bac6a881-90b6-4f33-d9a8-61aa8daea330@quicinc.com>
 <aGuPpzU0VCg45Plg@trex>
 <db7fbfb8-b0fe-58e2-4564-f24d6a551232@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db7fbfb8-b0fe-58e2-4564-f24d6a551232@quicinc.com>
X-Proofpoint-ORIG-GUID: Jtv5SQaaSTDj2Q7GYgLkfGgzCq15dRPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1NyBTYWx0ZWRfX6uzxdjsi2Az2
 seB/ioUbIdkcGSPM72dQ/N7mMhVIPOFiOaNKySXv9iJ0S/cXG/E1qogFekknUdeyoj3qcXFEL0F
 tE2TL/hPuXXzcSCGx/a17JoPLGhv32up+j7JvAuVXCJfvG3VActGKnjujK5DCah/Wx9X0VxszK4
 3iTlTh4dDaK2+jP9fG13aeDgutkWBQMwh1w6nehnhivXXe1iQaaYILNkOSa0CJ/JwtiiVmFiIwh
 9++tXRC0zKxUkUU8wH/6qWYjc3DaqnczlJBVRx60NRXyCVVFpMZ/4piKgZDFOdzIBDrHmFHia3G
 g55wUqdVgBigVT+bPfwtvdrX/8xzpZFB1Q3Fqw/r0DLIqhhqt/54kRc4LKIoi5x/L5KMA8j0AIg
 MDRrrpvdMaa8q34a81bPVImqmhi5rFZnu2xgBJFTHXqIA17JRS/x/ALWROcbTKZ4n0XO5y7O
X-Proofpoint-GUID: Jtv5SQaaSTDj2Q7GYgLkfGgzCq15dRPk
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686b99ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=nYNRSA1dgNPy7Ku2h68A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070057

On 07/07/25 14:59:05, Dikshita Agarwal wrote:
> 
> 
> On 7/7/2025 2:43 PM, Jorge Ramirez wrote:
> > On 27/06/25 19:02:13, Dikshita Agarwal wrote:
> >>
> >>
> >> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>> Add hfi platform file with decoding capabilities for hfi v6_lite.
> >>>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/venus/Makefile    |   2 +-
> >>>  .../media/platform/qcom/venus/hfi_platform.c  |   2 +
> >>>  .../media/platform/qcom/venus/hfi_platform.h  |   1 +
> >>>  .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
> >>>  4 files changed, 152 insertions(+), 1 deletion(-)
> >>>  create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
> >>> index 91ee6be10292..4a6a942db58b 100644
> >>> --- a/drivers/media/platform/qcom/venus/Makefile
> >>> +++ b/drivers/media/platform/qcom/venus/Makefile
> >>> @@ -5,7 +5,7 @@ venus-core-objs += core.o helpers.o firmware.o \
> >>>  		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
> >>>  		   hfi_parser.o pm_helpers.o dbgfs.o \
> >>>  		   hfi_platform.o hfi_platform_v4.o \
> >>> -		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
> >>> +		   hfi_platform_v6.o hfi_plat_bufs_v6.o hfi_platform_v6_lite.o \
> >> s/hfi_platform_v6_lite/hfi_platform_v4_lite
> > 
> > will remove, will use platform_v4 instead
> > 
> >>>  
> >>>  venus-dec-objs += vdec.o vdec_ctrls.o
> >>>  venus-enc-objs += venc.o venc_ctrls.o
> >>> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> >>> index 643e5aa138f5..f56b8f9946d7 100644
> >>> --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> >>> +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> >>> @@ -13,6 +13,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
> >>>  		return &hfi_plat_v4;
> >>>  	case HFI_VERSION_6XX:
> >>>  		return &hfi_plat_v6;
> >>> +	case HFI_VERSION_6XX_LITE:
> >>> +		return &hfi_plat_v6_lite;
> >> update here as well.
> > 
> > yes, this function wont get changed
> > 
> >>>  	default:
> >>>  		break;
> >>>  	}
> >>> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> >>> index ec89a90a8129..6356e4bd0de2 100644
> >>> --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> >>> +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> >>> @@ -58,6 +58,7 @@ struct hfi_platform {
> >>>  
> >>>  extern const struct hfi_platform hfi_plat_v4;
> >>>  extern const struct hfi_platform hfi_plat_v6;
> >>> +extern const struct hfi_platform hfi_plat_v6_lite;
> >> ditto
> > 
> > neither this one
> > 
> >>>  
> >>>  const struct hfi_platform *hfi_platform_get(enum hfi_version version);
> >>>  unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
> >>> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> >>> new file mode 100644
> >>> index 000000000000..41958a3e353b
> >>> --- /dev/null
> >>> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> >>> @@ -0,0 +1,148 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * Copyright (c) 2025, The Linux Foundation. All rights reserved.
> >>> + */
> >>> +#include "hfi_platform.h"
> >>> +
> >>> +static const struct hfi_plat_caps caps[] = {
> >>> +{
> >>> +	.codec = HFI_VIDEO_CODEC_H264,
> >>> +	.domain = VIDC_SESSION_TYPE_DEC,
> >>> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> >>> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> >>> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> >>> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> >>> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> >>> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> >>> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> >>> +	.num_caps = 7,
> >>> +	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_1},
> >>> +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_41},
> >>> +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> >>> +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_41},
> >>> +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_41},
> >> what is the reference for these values?
> > 
> > what do you mean? what should be the reference? I didnt see a downstream
> > equivalente to base on so based on the 4XX settings these seem
> > consistent.
> > 
> My question was regarding the profile and level mapping.
> The profiles added are consistent with 4xx, I agree. But the value of
> levels mapped with each profile is not matching with [1], hence the
> question about the reference used for this mapping.
> 
> [1]
> https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/media/platform/qcom/venus/hfi_platform_v4.c#L23


ah right, AR50_LITE does not support 52 (the highest is 5).
I see your point - you are right of course.
I was doing a quite a bit of testing with fluster and I left the wrong values. My fault.
will fix.

thanks!

