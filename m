Return-Path: <linux-arm-msm+bounces-75708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 091FCBB18C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 21:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8226019C0E2F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 19:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AAD2EAB8E;
	Wed,  1 Oct 2025 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVqwTQ6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48752E11DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759345222; cv=none; b=FVqSOd0kNyDvpdAzDl+CuAKbmo3B2vy0B62LVMt31ZTyvBIfekA5h9PKXsoqepcR2uuguPISObxFehN0n3W2ZEAf5Pk22sKUUd26sQ+f1rSdEPCpPeoVdROwhBp9gnJ+IH68ij0jCKG2pR2gVLqvK1Zc/W4CPiFbZgiWBeJpYYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759345222; c=relaxed/simple;
	bh=cbFzklju0t/aOVK5k/0N5wnkX1i8mrIAk81GbJ2UUBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BjjTZCTGPkOiShSGq3gmppoEaBbc6tmiknNMncGta5crGgMaIQ3Iq7xQQvBt1YRmxV4o9H4VLxzoNki9IBTHnI/Psv76v9o9Dc4TB/HEoZdzofVtMpthkYG8ZobVQ5DAlQJOeonqnDuFnu7+KvPIkeihp958daKNftKXOFozBQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVqwTQ6d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcEH4000929
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 19:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fzbb6D7Bmwkuw9nm4Qwnfa0A+U7kuzPysVdaz5i1AsA=; b=LVqwTQ6dah5qT0J7
	iu1gnf/4ZqD0yvmZOm90gnFKMhVicCryWeB/FDOJ9J2AI7YK3l373qjzBaLGuKKk
	E21wnmShjN5ULj2MA89qKq0aNQVpIZz5ORWGXGHdQC69OFGTks5mr6fqBcaKwl4s
	H3DVY+i6vWzKPbhZlafs1MIro47EB4tq2gG9aKmxrsFdU4Y4qRb8cFzroGO5C1yA
	FH1TBbi1TScTpmS1o9UR/FvWnY2j5vUBydSXEtqDP3r4hn6tywWKIFcyotFsUsRA
	QzGNtphmrwSTWfdp2T97caOL5yHstxrVWH+by/QjeCTxqWKvHIe3x9+AVUsjszg6
	GOOc5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5wre3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 19:00:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-335279648e3so45458a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 12:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759345213; x=1759950013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fzbb6D7Bmwkuw9nm4Qwnfa0A+U7kuzPysVdaz5i1AsA=;
        b=Z2yVHWqNJJMgAuyHXRqC/CFHl/KG8kqJjImUN9pGVzOG797O2lhyyoByofkN4FAA73
         8d9RFlfSQBTA+WxDF9jtVE9Wq/PXA3fCNHOYfxsbEjbppCHinzCNk4TRszCo4+2lmeX5
         9+2BeMf4MGS2Ywldo+BxnnfOMPFEjLz2nKxUleF9GHbDAfJ6C6bOR9M2Wg2qefvRHOLV
         KU5met/6x1qTc7Z6kuycjvlLHbgw3uOYeqN3ZoRfIeO5JeHq6nGV6lTpBlfwVylj0ozq
         PTZhw4q6mF4l4dkb8kwfYC4ucZ7lledUq05kCLKfzhtIqLKTXoKNC/FoYi/5VzHiu8AM
         EZBA==
X-Forwarded-Encrypted: i=1; AJvYcCU00S/klczW07FKVlSiRiAGiRLIIdM/x5y5wa8puobZCW99JCa/HWiOQdZD5NeuSoUQVmUey5WAh/9v5y3f@vger.kernel.org
X-Gm-Message-State: AOJu0YyMeCzkAcYbZrMVLteYo3ThnC7HgRs3Qrsd9X7bgbXlQJvaE1Pl
	HgR2BneKN1MohldbYyNGeZdd8mGo1OMMjfeocgq8fN8y+CO0LUAub4Qtp/jZGjiiJ9IX6SbBzpg
	zcNXuyGvz3WckT4GBU5SbOGFspsyJzrhjF1aYHn9XTgKDnWxHiqUMVYWVW0rkBM0U9ZWg
X-Gm-Gg: ASbGncvjAEcLjv6xM6rqPUX5UJzuRaZkxc8NnVrgrjAXIqCP3+yzwDYXnuZpdaSXwVF
	xpe5fgdUhAx4R5pUhIIGWhZDFkLgQBUInvMJPL/EA/BEFscTR1stLHJjAp5ZNbYa0+x/AJ2mhQa
	b/ok6OsnyoCfJT3j2WKhIYbtWUyZXeu7uKqGcfWWa3V7hk19cM+T+dHOeCMwSXasi7RbhHJM1iD
	tSvvpaSs370R7tDbUBjgaak7XYAvSFlokNGfkp071m4z4BMVJUp8hsGuPZRQ5KQLUo+y8TOak3k
	Wgh+NVSh4EdJNf0IAZ5d80Y9NvFsd14KmtjVgj7AR6ZWTxBFNEayBh5AJoGa3Zg33Xd4nDstMMt
	Qnm1IvPcgJVghCrpIYFGogLRSHYyGCA==
X-Received: by 2002:a17:90b:3b8f:b0:330:3fb7:d874 with SMTP id 98e67ed59e1d1-339a6f9bf1bmr2810438a91.8.1759345212615;
        Wed, 01 Oct 2025 12:00:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU0c19fNY/PyxVHOgSgPEi+CF8xRjUV83am/qs0geCdBh4+DtSYFpaDP7KREYcLbWT9Ez2mw==
X-Received: by 2002:a17:90b:3b8f:b0:330:3fb7:d874 with SMTP id 98e67ed59e1d1-339a6f9bf1bmr2810405a91.8.1759345212108;
        Wed, 01 Oct 2025 12:00:12 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701cbffsm2950074a91.21.2025.10.01.12.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 12:00:11 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 01 Oct 2025 12:00:05 -0700
Subject: [PATCH 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1 in
 v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-av1_irisdecoder-v1-2-9fb08f3b96a0@oss.qualcomm.com>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
In-Reply-To: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759345209; l=1143;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=cbFzklju0t/aOVK5k/0N5wnkX1i8mrIAk81GbJ2UUBs=;
 b=gi+ywM+w0EdQ3OS8oxXQgqMEfOBg8jKv02Tn24SC664SL8J0QfJWrjPb/rz0K4Bj0WwgE79WE
 BkKL8HZfsjEAjncShaEcdrUN66HSq83Vcqf2ALeEn2oUQew0yG9HIV+
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: i0TiVDWkMEmVWpjXVb6AwOrb5IJ-KafP
X-Proofpoint-ORIG-GUID: i0TiVDWkMEmVWpjXVb6AwOrb5IJ-KafP
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dd7a43 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX/iIP42keOcjx
 Z+0AP91/Z6lwShmRV2R7Vd9y2zjjqWKcxyo7e7f6bvcaNx3LoHBaa5CRdqawaEZvSWyP8pULill
 1ke+f3ghIb5nyP9vYtrqKdby1cQUNSxkB3xuxRc9XVOoIcvakwp8ZoFsLmE9IhIYxh5jYsbSu1q
 tPwZDr4EjIb/rfSJtIIymhX2Gq3Iuw81ejknG0+SHRMKlzPGKeZ9mD4QVk6CgFkKrqqLOB9O+1c
 4e6ofn+V68aSCo02gvzF7jMCx9ZiydAcX31Lhd2Z5m817wirYhRz2oVUZ6/BkmBAxam4XmoZZIg
 14TPrDwc+oFy4BSpo79b86Q5MAcoIWZClv1If//8jRwb8l6eqmagH/JD9X0GKM/DbX4lbSe8BjP
 SjrAK/VBYxjyS+dms3qg/sf9lqSiKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..d3ee7736b74b0f277d3208782e3ac3282eca1e6b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


