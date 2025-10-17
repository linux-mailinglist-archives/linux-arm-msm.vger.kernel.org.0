Return-Path: <linux-arm-msm+bounces-77819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB15BEB3CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 20:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 667F44ECF21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 18:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4274233291D;
	Fri, 17 Oct 2025 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lz1xY2u9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E632E15B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760726133; cv=none; b=jdTvt264pqCyhuVCmB5OMvH9Ihy55bFemhW7lOMJ8dYpnpENQPHXpuWU3qkKPK4J4FlVj29mpW/qcUoij94VS4JzIluRYmfBOCI8cBe+OQ4v4WlqH05j4JC3iC6d1LR2gBaSzO1CqCzojsMrUgbYU+SYg8W1Jf4M3LZtQ/8N8y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760726133; c=relaxed/simple;
	bh=DSP0RYR4BmXibqx7IUSmnSQ47NHXteY7yJtMQO88UP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJzHoGkdDhBSsynMaF2FXCFLzFdLc5MDD7HaUzRjYO5cPJv6LP2ESpY0GHHWoDg809IWzDLR5ul/wOYZljKm62E3uRSN8MkW92aQTzpj16FynrVmvpRnmCV/B6f2BRzL1LmmUIH7rHVP7h6wFED1tufubKzkeS1D3B/BC3vSIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lz1xY2u9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HIS2Mc025406
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUBZezXctNZUTvhj4jU3CP7PPArzUZna/FMnzKRKs/c=; b=lz1xY2u9tWLZbsp8
	CMttYA1PCfiGOdBDBqb210sQNgvttsBAq8sIJ/pwgHkjXi2St4w8hxgMB4aGmfNt
	H8nuCGou1Z4RLulv5zth3Zg0/lAd7+JOlt+Hs7kk6eg8JtPFzxWlDtcyg2SAVbrB
	vTtpXDazV4r/lEWzyOMqrGdXYX26ELvrcnZxVREInqrRKFRIT2hAudS6e5zb+fWJ
	aHmeRkbJpW8ysYxQcf413EbcCg6Ry8FNSwyXCbUTnUqzUVzf7OlSHNBmFl2bfubb
	S7GJmR7upYEhleAUnexIDzq1J6nnMWPFkgu6GDgC4UkYPjBRD6/myIIJ9xznX2Ar
	krMBUQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvppr9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:35:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3383d1ce439so954949a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 11:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760726128; x=1761330928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUBZezXctNZUTvhj4jU3CP7PPArzUZna/FMnzKRKs/c=;
        b=Da+oUeBe8SBwKq/38+Pajdl4/kDFiJajj0asqYE0aCmRx1WbQy/80T5e3r/PgSB21A
         jCWN2kuA7l4cOCWSTUxho8QuqhmADlXO6Q7KiXyq7gQWFavcEYRqB7fl6ZEN2SUMEMJj
         jVcPyVmQQyLkSo+hfjVvrEuOLBk4RXdgyVXzz2mu6Sb9qQTFJ1fpPBRvCFhFR3T7dO7R
         vuOIP2Uams00kiK1+zm7EfBF95ls4WpU3FkF1sex5pQSnxn6WVAF10I/awO0Htn6rEO9
         yoWtmUrq4YzQguHOYzkfqUOn6jr72F1K0OGFGqg+LMH7IT2p3lpqcPTxe1Nx8vJUln4Q
         5ZBA==
X-Forwarded-Encrypted: i=1; AJvYcCVD3m74alqcqUN6Rm/8GTV65qa12nH/EG57bbHCkafuX+NA4ganagGPYMQME0rskpW8JXO0IzVMLnaJZ5CM@vger.kernel.org
X-Gm-Message-State: AOJu0YwSToFgG37p6BRzYChrOLpnfed0zs6ZeCLlxXVXWp+vhBVxdFcl
	wivKtq8XP6ktyPK54daKXFpNC3yNTto0YyQ44FwEagoEzT/IryP8hf9L9CbmUqrTKCb9jo+Px6T
	GkSvsynd+y4uTJcblisiKeBsScOUeWvFlQVGXltQ8+YPrUGh/emlCGRN2q/17RyJMpk+y
X-Gm-Gg: ASbGncuxJ17pRpS/czkZBNieE/kPcJaKw6t7TR+lNbvsXZziF/yXYnxh7eFo5x1pSF8
	vUfo3ByWuFpiiVJAvb2Sb2+JKhzwnlOFruNUEcHqIRnNDaZnpFm2aKnelmCN7Bah+9Za6/34rUB
	jNeYmcaNyBOUp4WweqTcLCrj/6dBqbcU/Bw+GgBaR4Z6xRluAS0cH4oZBeYVT8K59AyAmLLnPpL
	cfoTM05LZCxRX+4JPoCzs1NzAraBRWotqXjOFE8gUHPLGsRFBOlT+k/CDRRYEuQ7eHRfS9oVAIS
	39vNrG5JRMb7kT3+L9pPhPcWuEa01jmhInYmm4K4oqOsDMnROo2HnyRnoUZkxAODsB0XOt1IMIX
	NxslGRPCmySYD10QFdHVpejmvtPVw6IGtlP6zOF6iCa1ezZ1qbH0qn9zN+T0=
X-Received: by 2002:a05:6a21:a4a:b0:2f9:74d6:440e with SMTP id adf61e73a8af0-334a8650b5dmr3500582637.8.1760726127504;
        Fri, 17 Oct 2025 11:35:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjJuTka6aOUn/1+EvQOCTb/dd0QIHgH8nimjW8CSejnnxGUfAzi2PlSDzmmpz9xhF6KHcOHg==
X-Received: by 2002:a05:6a21:a4a:b0:2f9:74d6:440e with SMTP id adf61e73a8af0-334a8650b5dmr3500569637.8.1760726127094;
        Fri, 17 Oct 2025 11:35:27 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f24fasm245487b3a.42.2025.10.17.11.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:35:26 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 11:35:16 -0700
Subject: [PATCH v2 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-av1_irisdecoder-v2-2-964a5478139e@oss.qualcomm.com>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
In-Reply-To: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760726124; l=1154;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=DSP0RYR4BmXibqx7IUSmnSQ47NHXteY7yJtMQO88UP0=;
 b=YVIU3uQVT3vY83tryQM79WMBy7kN0qCmcc0tjWdsuQWcGktAsfLoI1hVWsGqL0UcNdUsif0LA
 G7i0qkFf0MzCJrlXhhvqoyFpXgm3pyTr/W80ykD0q0ME4GK06tirg7i
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f28c71 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX1EVIa+uIEvKT
 zQosv0Aqv13MeKeQh/W2Nk1RvdfwJV+dfcChaC489Xjllu8WHcPKCsdcfuRIVnuAKvEGRZW6IkF
 py8LYjsydqmRkuuq5h0pJlfv/07Ex2F1D9XCZ2a/H94Pfzz7ejkwS6N3uWayH0tXfvy02Lz/k/9
 8TTE0DoUD6Eu/yqE7vAYSPesI2ACIA/UpW3n7C6XeN7cAvnbLYu0kPGDXOoyHff4y+hjJP3DR5o
 ftPqyPhXARjf45zhRAc6wg8EBvIY8TzaGpA2OBw2luXTBmzBOlJQ8ySZcVQ1s0eJCTs7DK9L5A8
 7DPtxaUIL5rLxnSBwR7+BRpuDnGOlWvmFc8WaZMiSkxbl5sLPioeUetPrTEbelmqDrNzdma8NFQ
 PBamDxxbXnNLWYAAbdLCo+kZmrWhTw==
X-Proofpoint-ORIG-GUID: mti6E8Osnf4XCHadnqMU2Chh6GBWxZw3
X-Proofpoint-GUID: mti6E8Osnf4XCHadnqMU2Chh6GBWxZw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

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


