Return-Path: <linux-arm-msm+bounces-84832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D5510CB1849
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E3CF301DA70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A351DF755;
	Wed, 10 Dec 2025 00:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USRkOBjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HjoDq5Fm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B1D1D7E42
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327186; cv=none; b=R5q124CTfOJcTn/I8EBmAvyMJJUF/szhubxTqz+VFEX1WwMmw20sDZ0jyU460z6p5kvQCgP1z+oN/3WYlDHrhwk/aWyrVsV9TKO9Ix5HyY9b4AyuxeE079vVFPRMNPLsp0BrpO0H0JcTYa5e76giw1C4wmOl6e9XuiraL5B0cC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327186; c=relaxed/simple;
	bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mi/Y/eM/iZX5vgWIJTwoZub7ssNEvji0V2ELZw7pfLNfo7AtsB/2phlSGdxVp99VwpRkj1cooSkjG5YqSxOpdNHIAzzfzZ9WiB7OzfD24xfpb5YxKJLchMbpyTyA2cmNoHtTc9qsdv/K3SUoqfQU4ACf4p74+lKUmVwVMo317c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USRkOBjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HjoDq5Fm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0QYBZ1725806
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=; b=USRkOBjSuvXdpmf7
	jW/1jyjYYRfCg9zhRg8gB3Kh3zgtioc1L88z1Vzzc8U7x1pQ1ONe6l2LAk7PNc2I
	zulOGK2nfAZCyW159m5sTlsawfRp4XqbIlMAgNwwvvSRKYC44/SowHPwgmhd1feu
	kdo+adYpgQB8DWKyrY4s8Jvs4gY7wyQ76oh8Qtv4niWLQ+WdzYZMrHuVLyOA9oL8
	WggJoU2rOepgI+q/gRtxYp/Rjzkkzp2rxT/ZydR45TswA/QlySzeTq7wxWYu3qGi
	KgUPQ8Qlmq1KNbjNbIQF4YME1kJct6OjsjsLKUkl3cYuWWFhkt8vBKX9k2jADON5
	2O86IA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu596pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:39:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc42c249dbdso278545a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327181; x=1765931981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=HjoDq5FmWYP5hBG3FHN1Xe72M0gdiL0fTlQ9GQtqRgyvvd+78wCOWfeS9ZeeKraUSx
         qXJhih/SCdO/yS/dW6U68Fqjm/PgcEVPJCHY9PSFA4DKT0OdDmmG3OVwgRjnCl/1b9fX
         unrSHEC5ZVwsHWr/sk+4nwvXwr1f8Y/mPE0OShDRPs96IvA7nErwii1UHD5v6XFfmK75
         Eh5L+CYJ34t3h6RoP7aYzy8Y8yU4jMR7AoEqq27ZNdFTJChmZFXHlaw1Xsq3lS4792zb
         UWQyi6E93uPB2JzWvRrAT1c+iKHXe5gaUOQm8JNWb9u/AshGhykxZmPXJq/wHbqLhdXq
         Oo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327181; x=1765931981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=PnXnbOAthdwLb1G++Z1UJ7LvTgiSfGvCT7qM0hSlcXNmPOYvIzJjNbtmr22a8mU5rL
         LkMwnN186oIjuzBs1OcrycUqcgVlKh8fk8b0lXo7c/owovanGwgDfCVZ/e+cIQbMlS82
         SYZjNpSLjQtFlvTWZrOKLtv+VEgZBbzbFQI0gByW7uUlbCgfFZCZykr8wSYZQPz7FCI/
         kMDcKUmfRTqdm3clGr6ltgTrydzFXqcnluMjPhzsVthC8NKn8ZLcUkk2164ugoe4J7FI
         NfN+GyLukDmDMbVEEjIsIIn21HjLCVI+/dsXRDrNeD89yzGbddJIAV4+g1xd6pM/bj2J
         VfXA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Hg2f1hk5iCfV2sZQNlIdXEuR22RKy5+p8D+M40PCF6T1ofUunR0Jv6JIll/SLSTPJdpi+N2JSWBTNVlg@vger.kernel.org
X-Gm-Message-State: AOJu0YzipXI/qa2Cs7aBQkyj8hugrJsxLHs0ADavmaF8lHCAVfS0IkDO
	Dg1a3MbQ6paAkmx88VF7iwckUjaTw1aBjF4ipNd26Fbza96boNY+MxxzycSATCsJMU8YTqLyozC
	h6lPwVsJKDyoAvVmt+c895T9z1bzoTA8BM9Kd8AimrQ2X9JSqQVH5OGRpDQMfqq9ErA06
X-Gm-Gg: AY/fxX5hftlwGMQByFN+CBSEzzgP3aIdzI8pqFHyOdrqdYSfAGm44H7J8I07MhonNR0
	IBWnUAjpLkCRGEoUd4zaTh8/Tk1POfI7R6H6PdIJpHdW2SciWHtVFdAhXC/ZvOiv5GQX7aZFlD8
	2LORQR5js3vpnoAK5FZYiV3U+QCqoBsG2zaEMEe2PeXEL6/f31lccPGkO0tGqRK/1ROQfy9l8ZP
	eja4+5NNfem/xdhRgL8jQX3lVRv0644mXByh5DiYgS5kqrwCVmucqoY6n4PYRkKCecDnChoKfOC
	WXDBB5TwY78R1YkwswYrnOBrGbCocOSg0M4zeopiutdZ5ethtZUtDey9ghJOYhFg9VRWm7Crjdt
	pgdYZ5fdH5NRpvc4oGuHgEa75jIrBocKVAQn56uzKRaKxqUjYzyUl0swMW5dI3u863t/+Qw==
X-Received: by 2002:a05:7300:3e95:b0:2ab:ca55:8941 with SMTP id 5a478bee46e88-2ac05595d7fmr219228eec.8.1765327181328;
        Tue, 09 Dec 2025 16:39:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcxAzdJF0AG1CFaNadntreiFa5e6hauyRwJLN2Uz501RCUJncoCLxPRCWXIhm0/rWYAxNJzA==
X-Received: by 2002:a05:7300:3e95:b0:2ab:ca55:8941 with SMTP id 5a478bee46e88-2ac05595d7fmr219211eec.8.1765327180720;
        Tue, 09 Dec 2025 16:39:40 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba822b615sm46666784eec.0.2025.12.09.16.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:39:40 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 09 Dec 2025 16:39:35 -0800
Subject: [PATCH v9 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-av1d_stateful_v3-v9-2-718e3b3934b1@oss.qualcomm.com>
References: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
In-Reply-To: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765327177; l=1333;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
 b=fSzHx+/q/fjUJVPkfTCXZT3q4eqoyQyaVMklyUyCVBkpOFyU9HKezq7EWARCWcCJ8BADRsEAd
 RJdZrTBOLwrDhKI+InxPZICCA1cdK/hdIACWbROpqMSVNy3iUs9YwfH
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: mWmU0F7Fi15z2Pta_wk1T3fNQolMqDgp
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6938c14e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: mWmU0F7Fi15z2Pta_wk1T3fNQolMqDgp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwMyBTYWx0ZWRfX6oc8UhZPSTyP
 UvaugG+0yxdKYTf0udixdUugUmpX4Q6G/6XaU7XSbhifB2BORUsW44XJS837Jr1F7PTXMx5v+wd
 TSEMHEPBlg5xqVEYcvSuiz+oOXj8zcmlSPzZ+xeDHPqdfrAJhuvxuuiuwVyICIPkw4n1vZtKVrU
 B0Bdfm31XtVCPgwAWkWbOoay6EP2veO6KFg6DFJbokhYrZjc1pd/uAqeiFSF8LzSv/7ZuZ4vC8b
 NKthlApEFUNb+vW995zntpbrH2s61sxPVUNtVMe6CpRtL8xPVWHc402nAExljrFCWJDiU48h3se
 G2Dd/Jgx3l9DR7w8PDuxbqdAmfn/B7/p7n4Lbn2aPOcN2/TynJfg8Vh5WEFSLaeXfDwI5Wsecjn
 e5GouLu0l6dDWT1LPms4LlkRT0/7Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100003

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..37d33d4a363d7eb02119b84bf368dac8e7a8bd8e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1544,6 +1544,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU Stream"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


