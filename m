Return-Path: <linux-arm-msm+bounces-71691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA427B41079
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 01:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B56320630A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 23:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2C8283C82;
	Tue,  2 Sep 2025 23:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+r5uVgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D1A28002B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 23:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756854029; cv=none; b=lrmMJUQ8qSDYmy7bWFZu56l9DXCAWY6G9oxJ9j71mJTFULd/0lspaWNMpAI7Mo8KmilufeA0XLrjsDzBy+WYjg53ExrtDxeGatCQkD9rwRkGMEet9ybqLyH1eMk1h0wVfy90WkhApufWD0rCRe4LNQBKMD32v6gW39OURfhAQOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756854029; c=relaxed/simple;
	bh=9diWrH9N5RpjQbMIIxnIo3abYGeeRjuqJqXrS6LtQxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFc5vRjP3e39yI4s5SQJ1uMpzu4iGw61//6f2/ca973OUDS4xY4A0cGufdC6l9qFAIkfFLmsRjGZ0ZtyhgkdD82kOLPOAYDYQbjuAZWB0WMrdH9LZXv2q4QAun0NR8XaKInTHV+gTMfa4s20fpVKUnuHZVXObNaIgdWAa5JmjJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+r5uVgi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqALh001385
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 23:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CCw3ORap47qQKnFVauULRJUyOyxsuJlrDTo0PhDqr90=; b=S+r5uVgi8/MGFIe9
	aIX3D6umeEUtSwvA78zjyPJWOZEadCnC+CnZmRApeCKiwSeMAL8j61kPcEKryjpT
	MC+qYk80FqfCxrnIMF+9vWQyS9ZANYxnKf68rCZJ2bJzOcLyBzEkIjaxK9aNUjOq
	u2CRdSV/08uJQZmDZgc0c5WuQy2L4mKQSsJhH23noyBK3BuFnVg5rdWkHvPe0wBN
	3QDfOhmImmKgZ39IITDCkbqesU7bCOJJJXq7J+OqmABjmPScJnd7ADi+WK11apKP
	XRwjhRiraaxPMd1zpMFySX5/Dy3ZGp1YM1WpLpbHewciu5TVEDtvDyMGNRR+Wa0W
	MqafZQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy5bmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 23:00:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3252554d4c7so1693304a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756854025; x=1757458825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCw3ORap47qQKnFVauULRJUyOyxsuJlrDTo0PhDqr90=;
        b=c0H8RWGKPJPhsT4J7/1HNiHZI474IS/HpVPpv/VySrA0HK3fHv+1aNtUMxbSjGXKIp
         HWqIzrwtofN6tMHXy5Q2XP4tDAPAqeWsiK7BetKWjhJKSYNERElSO5GBcJwJI2dFPBEJ
         iEKWq/mlmFetXDSyH/XroQO2ISlht1LeCbPVYQupSq8yhzV/Md08X/5KyeeAFczuOVNA
         z4JwNwXsfkxM/a3Yk5sLpGMyfmBrXLikKgGdbEm5q66piZPXXceoTbI131mKg6FKvwov
         OUq7Qk/PYFu8VtSP0L9er5VPPhk9JWz+TiKX4glNEco/O+09YiAGubOCgDebhmDAzY7J
         TayA==
X-Forwarded-Encrypted: i=1; AJvYcCXB722A79bZ8UgIvUOoJPB+EM2EmoEMRZTygHMSDkGujYANq/TVdEDz2GqBG25vRQWeRGck/uioJK/VQgAE@vger.kernel.org
X-Gm-Message-State: AOJu0YzFq4505PFodTE8aabQXSoGuBJTlBYpPOYdPYFpB6Jf5iMIjVqH
	Ijp3dN5OYxMDZ+2gAvDCG8bFeM+o497oi2pIDhICBczCOdxQ3eh/Dtn9Y89nRsYH0XgLE+vAwTE
	oNvRSmkEVH41MdylSJuWmQ+6lr9spqVSHR8XOXsm2jb8bD4Dk0m2GlE8HseXKupXzXMV/
X-Gm-Gg: ASbGncsAUW+G2hT5D+tB8+7Q9vJHzqVALe1frcENbbF8njl180sJJR3LKxs3yLvch7F
	QjS5FAvQfRw0p5LPRWzSuefIWgfyJ9vVJrCf6ASe3vIQ0/SV4i6No/XSaOyXraQlNuZ7W+ZVrNo
	fQUbfgKI2p/LrXn8eerUwxZP2Nj63KlbizPZLN4RUddKmchiO0uSCu+nEVQswrh2qL93qonjGNC
	iNbhUckqLiCcVTBLV0FOs3q08mz3/RJ5hNSn3uQAU91JhWd8XdHYHQpq+pNACBO1vcN0907DciU
	II4X7rKkTo4Rk/6GpT8zUJwaizTKOoHbqPKHhgGzGuJilo9zJnnlqCy256dqqRXYqC34Pjlp090
	2/Z639lgYdQW4Ya2d1cN+UHcz
X-Received: by 2002:a17:90b:1d92:b0:327:e34e:eb01 with SMTP id 98e67ed59e1d1-327f5b87d56mr11825707a91.1.1756854025287;
        Tue, 02 Sep 2025 16:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLbK9GKHTqv4TSKj+0jyilk7UGtNTf6q1jyKulxJ8Dmky8WNPadxdsp3LF7sbj7bo7YIDVMw==
X-Received: by 2002:a17:90b:1d92:b0:327:e34e:eb01 with SMTP id 98e67ed59e1d1-327f5b87d56mr11825665a91.1.1756854024340;
        Tue, 02 Sep 2025 16:00:24 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32a698ad4c1sm1875866a91.5.2025.09.02.16.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 16:00:24 -0700 (PDT)
From: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 16:00:03 -0700
Subject: [PATCH RFC 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-rfc_split-v1-1-47307a70c061@oss.qualcomm.com>
References: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
In-Reply-To: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756854022; l=1406;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=9diWrH9N5RpjQbMIIxnIo3abYGeeRjuqJqXrS6LtQxo=;
 b=S/rVnIQnSXBlMIwhSoKVKh+SSJ4WhN7bPVyO4tyCvtJ4Azh5w/8zXTzmXk3tGKXHuL/BkdfTt
 y61Mczn9I3kA/7rjvUwC/91aBUTic5oT9aySCENvh2aFKeA0EjtrSJ7
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b7770a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=azbmn2n0SzSwlCbfrkoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: gL4JwFg0E314pGow_jfbtjuOiSOZUEot
X-Proofpoint-ORIG-GUID: gL4JwFg0E314pGow_jfbtjuOiSOZUEot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX4NS87RrBVLZt
 2ttEuB1tPbJXUUAa6/OxPUHIjb8MPXlhjdQhf8WhOylpIYEhazcnIAI/RCGtQU2QLS6WG2bWLW5
 nQFzwoEVSD8tR1sYMXUgBNrVCqabhgF4al2ZzwVIiudaZDxVf2Y7ZL5MXpUz+ISydZbROhR5w3C
 SSF+65P1YjGzOOBjYHwEYvsgTMwklUZAwZlJE3jQuKf5BwFTLvpUq+mlzYDgsRFPHtx8c4No3+K
 wnog4Yr9BgCAx7rK73lq7M4K0fJmNksr7Fakpncb+RzbKA7fJ+2Q9/X63aTQmjCfpC/GKUcUuvy
 HfGeEftUOjsDF4nYF2rZbcOD/wasslMgjojIpEgXqFY6QTI70xcRz5a2uHgIk9uATwx1M1onlq3
 9Xi2OxSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
Video4Linux2(V4L2) API. This format is intended for AV1
bitstreams in stateful decoding/encoding workflows.
The fourcc code 'AV10' is used to distinguish
this format from the existing V4L2_PIX_FMT_AV1_FRAME,
which is used for stateless AV1 decoder implementation.

Signed-off-by: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>
---
 include/uapi/linux/videodev2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3dd9fa45dde1066d52a68581625a39e7ec92c9b7..bff42a71c67b3f4b570dd6f3d250f1bb482ec8ae 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '1', '0') /* AV1 (stateful) */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

-- 
2.34.1


