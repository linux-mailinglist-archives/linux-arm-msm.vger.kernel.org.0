Return-Path: <linux-arm-msm+bounces-80116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A0DC2C155
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 14:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 372D83BA4F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 13:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D61226A08A;
	Mon,  3 Nov 2025 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSYQASGm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7aD4hgI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80367261B6D
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176264; cv=none; b=cIxISS69XXF4W4QbLCK4yROZvF+rwe01uQ6l0p7S45lJF5nuBdYiSj9XNgJmweLLBtheiUvPPDgufY2FyV6RTuLwsAeAo4yEdT4JrjfIOBuyDRtl3pXs2pmJHEC5rwB8a0pfiSByKAiKcr33UrlDgRfFxw+QRr5Yx7I4F5wUqd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176264; c=relaxed/simple;
	bh=lQvghmf454Nrr1HSejyrgphE01hNnR8XL04TB97Hm0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i2KA1t8mCyY037rPfztHAlh/Tt80CI9VBqeVe1sR26ndTn8l2054ZfjeJu7iihFY/LMPkQaCPvb3gRLK/Q8ffvFQFy51FXf9+9T3KW3Pna8FZmr8KoDrO9lscLMhXkF0hrFgQePk+QGkK3aGRIQDnE+nNpeH8XNEZGqqbCfz7Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSYQASGm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7aD4hgI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3AVXTs1941278
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 13:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ridrxwGEIpXOZ0gdsUYBH2J8aRIkpNMjp2cQPKRYlLE=; b=cSYQASGmZSVwRO+C
	b4MN4upha8xMMs6t+LuSlHOFIzMJ/9GharfKPyGNAQ1SxWIbq9YJi539TmEjm5UJ
	VXINVCfVhsD/t/A4M9ti94wTb67G9CCAhAC8By9/zN118f31x3gNmJ3eXtNrsPNN
	T1N1l2SDIntHXHuuiYIXMgFrsZS96RkdmP3kv7uXooY1h3UembyWl3PG2Nt1DgXF
	A/moGPjwjky5FtEAaU+fQpos83xPmjylJkz4twAg9zTQ60xwDT60vahtavaTd0A5
	TWf2FQsA3X3InRfytZet8zPHTv6GOWZOxaw3w9NdU86tdN9tv40dqg8FLgc+LMsQ
	GDhyhQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6m9w9jps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 13:24:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340b12796d5so1000913a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 05:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762176260; x=1762781060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ridrxwGEIpXOZ0gdsUYBH2J8aRIkpNMjp2cQPKRYlLE=;
        b=U7aD4hgIOgQPYJvbFelFqZGhEIs2XopnTJbCoGfNm+SRLe8v3baMrO5D7cfnfjmCTT
         GNU9gVg7otqLjXEyUAF/vQBavszAkA0dM2NTuQWf5p0m5BIN6hsmNJpwmLWkW44VuoIm
         xFcFK+4ZY8dpAI3SC0V+6KgftalnTqsQwt0uaXHx6C2QNG0ysi6oZkHZLDy3gOCAXFNM
         x5LVuQOGMalgB2aU/tvu/QZjJnG0ow1pjH/85/CM0amp6BsKOo/UA40TF0LShs1XJpfy
         GSO1dNfM9HeWFz1UhYAGarjeTENwbWFovb326eBxcKTLmB2iK0kcTpQfBc7wz7hI3Imr
         eV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176260; x=1762781060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ridrxwGEIpXOZ0gdsUYBH2J8aRIkpNMjp2cQPKRYlLE=;
        b=iP9PSUBPBuWoqQQxeTDwAdcP0QjOEYu5wYxmROfG4dKvePU1tRdpfCiBGtUAt3pFJJ
         b3D8euDCSc92Y1S7h/SlVb/vx/RghnvAtUTr7guTyN2u07Z71D/YTdV+/k780U7IS1kX
         jIsP+Xy8ewLZekg/EkeLKW9CsX16Ib0+K2IMo5NwV+UnyNi10/NtdolsyZwcqbQ1m7GK
         7Hu5G4ggN50DTLNoj/05Kg0hzQLMOvaqA7qQ3QFLAeqbT37efa/I1+zJuCFMFyWQFhFR
         2LYkxxwM9Q3odbA1EE2+x9Uya926W4xSR2h8YVtZr4GRDvm5NN5NFKMdJgmeMOEt5+mg
         yOGA==
X-Forwarded-Encrypted: i=1; AJvYcCW7LIWSl0YyX5NtCdFK72e9WgY2A+d79l7rZt9pXkW81k82ZEEnMGrWe3qupj2PcJYNSDU92h5y1yS4tKV6@vger.kernel.org
X-Gm-Message-State: AOJu0YwV6z23OizBiyWhknNbZ6pIc+la3ooPGeVLF/4o4FUhVg+BA5v6
	2V3pYZlwupWncORmRPZfHGKR1ujgAzJETtXp8LPZC2Dz9GERznkcUmb02Y0Pz4up87HD/f8xlS4
	PQAWk5Lb+q1sOIJRt2jR+ZE9l6axR9/gYwcd6C4/z8ax6HUP7M6EJ0HjLLszgxkdSzXo4
X-Gm-Gg: ASbGnctopHZcaIeiVyI3VISrgKEzoJA1uxy/5qsAfqMVMr/tV3QdyDmD/k13fGwSKIg
	wShOTq6Bi0RAi8GgwRQD287qBtFtPvOD+fTpoX0JUqYrAoXCBNnU2JWByHN/Q6JMWnDCGEIFx/V
	e+ROSNA5gQbLlKux17BFZ+u5Hn5UDFeFRRRrD2Tfw0yqrQLEXYwwWa389PBWcWS/YhGGZb9nkBv
	LOeHzD3bJyePDgS9hZA47zmTiIlKDzXx+4ep7U0jXxw0gzNwp3fBjWlcG1GYUUxImUQbLGuOMK8
	QnNZ+VPukULlY8Z2yGB/2toNFJ2qoaMBpjrej1GPwVQLwbuhBArjOvHhBQcVd4lTvs6uU/GxjGd
	eQJiuDfufM44A47r/kPbE1y2+lEB4fxhGK9hxAKCa4msGsvKO/RommP5vxzM=
X-Received: by 2002:a17:90b:2243:b0:340:be2e:9884 with SMTP id 98e67ed59e1d1-340be2e9c84mr5431669a91.1.1762176259947;
        Mon, 03 Nov 2025 05:24:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbQpnGgNePOdLV6tgr44laSI5gUkCBQFkvptxvt0UkB+hMtzVUugM1w2gY/N5KHOo3c0JxpQ==
X-Received: by 2002:a17:90b:2243:b0:340:be2e:9884 with SMTP id 98e67ed59e1d1-340be2e9c84mr5431641a91.1.1762176259404;
        Mon, 03 Nov 2025 05:24:19 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ec24330sm6614812a91.2.2025.11.03.05.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 05:24:19 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 05:24:06 -0800
Subject: [PATCH v4 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-av1d_stateful_v3-v4-2-33cc1eaa83f2@oss.qualcomm.com>
References: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
In-Reply-To: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762176256; l=1278;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=lQvghmf454Nrr1HSejyrgphE01hNnR8XL04TB97Hm0k=;
 b=unlrN9so8n+4P8zp+QLkA173F6rkQITUlMylEac1SYvbehQz+RJBjiL7McxP42G+mHUm4n3H5
 shaCNn7X1JAD1R2D0zQypHAc217TS7/uCURfrZR3pwqcaQrtXpJ6f1q
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=P7Q3RyAu c=1 sm=1 tr=0 ts=6908ad05 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: jSN84-ZS-D2kfBNsDVg3_oKjmJoTqTXk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEyMSBTYWx0ZWRfX6vBr5HH5/k8d
 SzTvqYSYSdlB1+w8vgibgwk9PcBGGXc5UaY5xkPowlWYwtDYIFlwMxjQzaQlLvBBh302IBR6VGk
 zX/SpNfMJI4da8WGAl2k06Lj0BwV2gSZ3mCzsCZJq8aJhIYImek3BtqWUiY1ar1c+KcF0u96UWo
 uqm0RGpSoX3uUG6u5rWq1+dACyCknlrXhE8ZOeJ5F42gM7k746eGsq5fjf6IlIHhKzP4A6aBUSN
 yu8fq93Hs1wK/t62AZZ5ZsZ5Qcr3GCcKgSajeemU1ak/RcQTbrU2Vahirp9jaVhvRFVnS1jvJGi
 TOmEdANrKMRvEjNnbGRT4Ce1lbM/51CjX4Qs7C0IadfYx4EMGz43Bg/GeTojILDYhYqOeytS9Mx
 pxYXIXUpBW+ub4nUgnE9ZkHWDJgWVg==
X-Proofpoint-ORIG-GUID: jSN84-ZS-D2kfBNsDVg3_oKjmJoTqTXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030121

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bdfdf45c5de2f2ce885f219007718a54b5c86251 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU stream"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


