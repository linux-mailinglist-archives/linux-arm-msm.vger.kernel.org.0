Return-Path: <linux-arm-msm+bounces-84132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A64AC9D4C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 00:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 14DF84E7070
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 23:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE6C329379;
	Tue,  2 Dec 2025 23:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlylHzgz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7CHiOQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C80C327C07
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 23:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764716638; cv=none; b=opXx0xSn2olB/LnaWwoZCwMdY1vofMdByAYC/ws63088h8xGZk5cqMlC6HkSKqgGdyT8/+sdR8mYCu/uMmAEsofP5gyO6BOcqT7fgPbq+riKnCs7V/lLnP/oMjnv4E5d6OGMHIpmSgeaR1Y+K+WPMGddPBSiQwx3Oy8TIaaT98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764716638; c=relaxed/simple;
	bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFgdr3TuL2wMXyyjWqyyM0lA+pTcfYqpedXciC7iVN9nT5pgIkHY9HgSrz0suWUNv7GjB6zz/Ws6COwYqXj7FTb3+qoP9ed242RCQVyz2lWhT3FIlx7GDc5nxklcq7D9E/R2xa1FYcQ1eujRBPX4r00VFMi7s3IdMa0PnL9PheE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlylHzgz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7CHiOQW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2JMbV0330638
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 23:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=; b=TlylHzgzKHYQUeja
	DbMYnSfYhBCFlpjoZHLlx0Y1E5G9OQIhnbMfcq89rS6JkAPIthU5s2VWL5os2++y
	nFZEVXwr4Z9KcT/hGGQGQoT7dk/fQ6yF7WDN9Nkl3CbtVPvVZnq+6PF4N7q0l8vC
	0y1dgCJD4eBfPBq+JmBwk1ebjkkFooqRgk7wYllAb9hQJx7z6jyrR0e4fI7bjpdT
	R4ZRWwSRJJyA272tHwQKpSwS1LTyPvL991lVi4zkJLa0xHXXc6WflFDM1U84SGZI
	AUsKjBatZPLCFi2Wx6YJ2ruFl4QMJHRYyd22D9KAqlLkWhWshZNm48IQcx7hKrcn
	NdZH4g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at67c0h34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 23:03:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29844d9e030so9172055ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 15:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764716633; x=1765321433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=Q7CHiOQWTy8Maj5nYzFbSygSGJMtk9rFO9htTbgwxD2d290p3Hs1ojc2Ju1MOnN4yB
         ewK+pTx0RkFuqhRTkazqpsLfKcMcJRnh7ZnqS0nrVmuV4EW8Gdeah7UWzwFq90xl/F6N
         yzxlYEWq5tPgC3YBqinX4wPRFOSXenv/YZ6O8wxxjtOF/iVrmWG9EEppv7S49EVz+d1L
         +hBewfObREb4aUDuPQ0oUl33CEYL5XHc6bGrK79L3OkfXceOfZDqvfb+iAMx6ab3JKnk
         TYx37M2RpJ17/F0r0eSh1XDourffjERM8wEGF00uAEkPXxi39YGfk1r/oJmqP4iVQKck
         yHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764716633; x=1765321433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=KPRqt/WJfaqQgTMNEb9WNc8cvsGL0OJhlVVttPH25iWqizXJ5QyfF2ZUl6PYdMFd6O
         13nd7hTeIBBPbpYyMS7tQo4wlzVGM8D7GzCe79pEmfyXo76ByE1BRl0JayytBrZ/cwDS
         f4fVK3aHaFp+wC0wtpdliXk1sTbkVK0+5r0plKy50PztQhV9LyhI3quNaHUWBZmfRjsz
         qH2JdySBZ1AtMkAnnnasZcmQh7OfxTrmJnMC4wBPOQGsVnbdKD1Ntbg8vsNcXt25JMCq
         Ov2KXE7hsNdFPyI4AbeAL9/Febb6hh0M+kZMc3cmmzj9wOLRQtaL43zoRozie711w8Ig
         jK0g==
X-Forwarded-Encrypted: i=1; AJvYcCXWsVuI1IVME3XzlPDc9Msq/1bGfy1/1M79Xi9BeX5xqNEY1aRWRnaD2350zt7PCxKxfj0AfKaGVQDK/Ktk@vger.kernel.org
X-Gm-Message-State: AOJu0YxQAFLWleQ69VplFcox1LNxi1QceD2l9xb95XkktwLg5IgypQJv
	h/sI87Vszl8es3vpxGBwj+/iSwguFpNqTYwIpLoxTTpVfDutAlxaQ6g9o4fVXiZiKtfR+zkfcPh
	SNzWU7qxFcJ4c145J3GDnDdAeCz895uz31ciOAF+u0Wk+rEx/wvHGzivEDkylKvVkWD2v
X-Gm-Gg: ASbGncu4oDzUO1p8wHBz1lQPgjNiCcGDFVKZGdZIpf3hKt8bsEu+I/AhcvLmhhYaCP2
	1iud9QGmMMpakP+GnRuzTn1Tc+lh5vQMWmmlvUcK7CwnVOoj0tvsZHzO78R4HaTHXHbsO0V64n5
	UAjozqlpV/2LuKQ8T5N0YhM0o2j8cVIYjdJihfTL0MDFt/QwHhD0Dt8Gm2rsWPp14h1ajn+if49
	QOph7r6lQQ9mvnup8NGGdcAGI5H5YjmYhRLEdmdF3DBjI5Fxv9RNCipUTIRuub77/qGBySdY6dU
	Zx7Ia11nBQAG2J4vzSB5yEacjPgkYJ0KmkaAiJA0I6Vrc222Etz+xiXgBAWVN14H85l1sK3toEf
	kgcczdqnRPxKxNsZvEFU9o1GF3yxJV4wdzLAph/pJP4uAoQ8TiRHOEiQl7CobwxM5u6MiRQ==
X-Received: by 2002:a05:7301:290a:b0:2a4:3593:5fc7 with SMTP id 5a478bee46e88-2ab92d4f166mr197738eec.1.1764716632986;
        Tue, 02 Dec 2025 15:03:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm9BSRNT1psz8NwizpSBICXbG+d9VaYkNWXco6LMik+r3f27uYkTXLR12y9Y0iXZ3zzWNFOw==
X-Received: by 2002:a05:7301:290a:b0:2a4:3593:5fc7 with SMTP id 5a478bee46e88-2ab92d4f166mr197714eec.1.1764716632432;
        Tue, 02 Dec 2025 15:03:52 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm59214149eec.4.2025.12.02.15.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 15:03:51 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:03:43 -0800
Subject: [PATCH v8 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-av1d_stateful_v3-v8-2-2f74a81773b4@oss.qualcomm.com>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
In-Reply-To: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764716630; l=1333;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
 b=0D+QFk6KZFBQle4kRKINuh1cqjd8MLcHEJ76GnMdyFAKL9vLnA4rbHmP8E+HMBxUmKNRw39a9
 pauq8KZ8fPiC2JA+JrwYxIIgBIWMgD6XVvTBPZ19n75RNpNsYgCdtg8
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: M6cSUEAm_cNxEzAAwqBEzO83jRYf19Jv
X-Authority-Analysis: v=2.4 cv=W/c1lBWk c=1 sm=1 tr=0 ts=692f705a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: M6cSUEAm_cNxEzAAwqBEzO83jRYf19Jv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE4MiBTYWx0ZWRfX30IhMZ/qwVGL
 JFrhoDamiEhHZFffF3kamKoer7Xb4adodNlAEt4mseBd4dwQ1DME4SM8HiLheixbpFYChOYlNsM
 CrCYCa0DBCcOb24PONAaQ9hYmJQiPm2Oovqu/4zOOmDQ9oDoh5mrFsWItUhXHFkKgT5ajHx5kPR
 BK1Ej0bdW3q2PPrTAylDm6DTGtth+XJmcpbJo7idkqEGudc4Nn7ZiS4NKSDJUpHgPT90hDbcqw5
 5E8rgbkFi+K8DUr1GiTEyNw9P5pMxe1vX5wKbr5gRrSldy4SEZE8W+5Lyu4RfpYPCpOxKQyJVaD
 g9ToXb6CTBVIi7YT/+P7ocCmwprBWO6N0cLJFIgbdwiy1AUPgMu6cXhKFQlNLtTm4UKClrTeFC1
 mYvCxwpSF/Co/yHHNLL4746msQKEuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020182

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


