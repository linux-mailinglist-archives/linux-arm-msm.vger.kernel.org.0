Return-Path: <linux-arm-msm+bounces-97226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJx+MDvAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:31:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8C272A46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 501613021D20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073383C73EA;
	Thu, 12 Mar 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bG521vMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1BKD1SF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E133C8720
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322185; cv=none; b=ZTJgBamhKrFvBA42sx8FLTa0TTduKvF/UbwrEPdzp9/IhXnUGhcWURg2uQnCV9oSQFOaeKQ3eESCax0tHQhYOUGgYSjLfDb9JkIQTwSfon/q56wTf1Jjd3ffMDsrQNX9jtLoKv6cWjWx07k7UiINRGXcydiL/MPzOMfGltgrXGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322185; c=relaxed/simple;
	bh=DQjdkhkQRL9h9cv0XC/AXKUXCFPEB+rX9LBo0dUvSGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZetLU28R1LilSQ62TN2tEXFa44gVsP+bVh3rzwWH5TLoL5IdyV0pok2p3ykcM6eMaY//BNrnDQ6+wmVQLPO8VRFGqPAlNq+A9/cyBYFfwANrH+aK4eF8V3aFWrEO6RnYTHH55dVgP0wIAs48/Ol2OqeZoXG7dzjqypPrFFx2tp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bG521vMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1BKD1SF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9nAQ7263530
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sHFCV47opCKmI6D1ocvZj16p1AvAwvvCv03JYIx/BSQ=; b=bG521vMv0yieGuBN
	dmFKWcfXKc9GMuUgr262oyG6+/HDAFMo5r4scp9GhFmmxsCzMTafIcsJu3HG/KbK
	Abl2i0iM9/cpax9yL/1Ld6jessyQr1w3xu6+EuMAZyRr6iXESoTzUe54++zgSfm2
	s1CpRHFnmbHP4ty+9/a8/37X7b7E6FaEAqXewmfz2EobEzYsfs2sWcLjX5Y2v5Lx
	WyVcB7G3ypXX+iDp4vjqtHb+2VjLOYWCDkWyxBHqaRJoCIC6PXKEWBdAzN0Q+z7x
	mx+KX0y+IkbtQdK9QOUlnbCsCoy+tfAoN/zMuzL8ri9JN1SDNt6eNsiQW0rCy7qp
	o7nQww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yj63q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7d66afceso641448285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322182; x=1773926982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHFCV47opCKmI6D1ocvZj16p1AvAwvvCv03JYIx/BSQ=;
        b=c1BKD1SFymQiXVRmVQUAwLBIgSPUQsvwXlDZ0MF1qM4RGRc8bbDoS3tLvb7d2m/nzP
         vYQoUDq1KK5kctPWYTcAaocNfHa2g06b5nANiHz2I7H84KykZxLUskub45xX2+R1lfB+
         WtVXUNXyaP3ttS1rRlM5j3ooNzA4R3rIjUYcQykwHayLnPioHS7dPXzQ/0IubulpZRcJ
         9lnoi/gN9CG0lr/SsdSJ52DRXrUi6OskDx6rmEHFSbtxs5kG+CDCfy33q9dlI4knawwZ
         my01sWVVLt3/9aIX8SVXP+L+9s0loWCi0bLhYtozFrNBFuRIUPWtwCGmDcUGF6IVmhk8
         Vj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322182; x=1773926982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sHFCV47opCKmI6D1ocvZj16p1AvAwvvCv03JYIx/BSQ=;
        b=NsIIWC7bRvlfXyOuONvSky/v3nYohIPR49B05h35MrmKGMmpF+g6cTLO2CEagM6g4s
         LQVIfQLBCgDSV3dzVXc3ANM0SawhIWRYmJ9yHPifJ27nkLNKwaEC/d9Wx8luj9866QXC
         g5cyIWZK7BUZ0gy/8y0cczWKgUaEUGxk2EMcIwHi7EDHtCcw7ymZwHqBlZpZ17U6xP3y
         nA5IXzWNgTrZsNA5z8QzPiDgeCblVgDZ7mrxVCujvYhScvg/LSqwvu8XBfxBi8o1KUcO
         l4/fMh8U4vV6mUUSZYhZnMu38F64LuCjBVbKvC60mT+KIf0xpJ4ukZmRqaWipp8Jmq39
         FrQw==
X-Gm-Message-State: AOJu0YygZUyYVYoatY0BeDUBewM54VG8Kpi5XVX/YR1EHw+GakBu5PFc
	XBB92LUsBnbVp5u8ozzV3d1XipFvGQrxe6hyEZppventrl/wz3VK7SE/rpy/Eh7cx6CpRU/d5ls
	yWJ2u42JJJSggv6ZVF/dbGAqpq8lpCXG0PZ0pBJceVK3WQ0alMTVdM/n/2E8AKDbdKNNn
X-Gm-Gg: ATEYQzyrhs1fesiXatcSnrFflMUqzuxtxElNnUZUfbTFNIZ+Ic6913GXaRBJ53acCpk
	L/HDwH5ywBLOcKYyvkvv761Dd5LPAlXKz0HEO1JR+MQtW4uzoEwTSNJSBulVZgYBQRrWgu13naR
	YhoTcmtqc059uc9lDlzu4NF+X5I9SCA398QCNvuHofG/ijud5qWafQ4vLojf9HvOfq9+v3gdp1G
	eXGimLvGPeoi1CI/3RrpBsi3t5NCSuIY+zvZ6Sy5LdYX5srBFaNP1XJhALA+B1sxrB5AjaffdEq
	plbLw0WlBaWIA6CNN52dB3D4tRBWvERs4IQmH+WFtLrdv6NF+f4IWulgowPyd2cx1++/12X0pf3
	BLf2Nt+J9UCSvYxsTLtldQHl3YaWscIS3dnV1DSHq2Xgzb+7atGX8iHhaduMQvgwpe1t8jzum4G
	sEz0AE4iTaAqJ7h+ThrILhkySAFx9KCFarlQk=
X-Received: by 2002:a05:620a:4153:b0:8ca:305b:748e with SMTP id af79cd13be357-8cda1a5595fmr745379785a.57.1773322182341;
        Thu, 12 Mar 2026 06:29:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:8ca:305b:748e with SMTP id af79cd13be357-8cda1a5595fmr745376285a.57.1773322181888;
        Thu, 12 Mar 2026 06:29:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:27 +0200
Subject: [PATCH v3 06/27] drm/msm/adreno: use qcom_ubwc_version_tag()
 helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-6-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DQjdkhkQRL9h9cv0XC/AXKUXCFPEB+rX9LBo0dUvSGs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+am/VtnHMnvvR96T/uUSHm4LvOX8pl3BBIeszYfPXB6o
 1XfovTZnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYyPF69r+ye1WtdxVsL73B
 /KGFXdA7oo3/dcjU0OC0FXfDtER5jqxbbPeiX/6EZekflc2C7w88zdlqeI+t1ijjqg1veUF84cN
 t67JnLJ7bHv9t0Ycgh4Kr75fkzZe3WPN/f9hEXavrzDplFb9yE5hO/su1vl577OzR5TcL7ttMEf
 KTD56Y/9VOsFw91PGydvrUB/LmibNu5UVdV5jSmGXzl6l24faF77YbPQzYuDjt7aYp4kXfXy06X
 XeuW7y+Y6nru6ajVgV3u1zPenBpcTkkbujSZTsqmNbL2WMe55UQKKy6+bGMilCwhRGX7c1eLoao
 hthbqS/T/4oHbV12vaKb6WamVX32gvpsidC+kGhmN3leAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfXxdqYMf10BniH
 ZaP64xvin9GM8aipV2eF9NP0h5U/H+RQuWLMPC88uCYONF26vyV5GFcUt3xiZj8ZvFsBg1htM3W
 5Nh6GR4PJADtuelIZLnxd3fhqN88dHK3IUUADJaElX70ewGMec65gK6ok2MT5RW8hJtC7EcQvEO
 4Z8vgFX9FlSWFk6H3+/opeaEOrRTSAjZ4Gf+mXsHeGbyJ9bqzYFwJnbeOf5RLHiV5WcOLK/T4pU
 MI1IItF8zKtk8mTHbfhgYpLRr8ecbD20G2kG81aSScELnaa/ZE6b5M2TYEP5tSdhBHvDYMx1kj5
 Cx9io3qYIGkZISAmTsLys1ETKNm483WGA6AujdcUhFwlUmlsotI2noSmrG6LgQRzaTOm9YmXh9W
 XwIWw+WDGrkrVusogQVp1yPN2VGukwuULBu0fjmaFCkuoSdgcQYvHMgJ+24KDqNIN2dJSG27paK
 KBlF+Rx7BgQ1gN8xSKA==
X-Proofpoint-ORIG-GUID: 3bs7RyCYPC96EHNhMTillGm3M1AQY-FH
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2bfc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=xoTxleRWwXRO4XdZWWkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3bs7RyCYPC96EHNhMTillGm3M1AQY-FH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97226-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39B8C272A46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use new helper defined to program UBWC version to the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index b1887e0cf698..6dc1d81fcaeb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -272,35 +272,33 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	bool rgb565_predicator = false, amsbc = false;
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	u32 ubwc_version = cfg->ubwc_enc_version;
-	u32 hbb, hbb_hi, hbb_lo, mode = 1;
+	u32 hbb, hbb_hi, hbb_lo, mode;
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
-		mode = 5;
 		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;
-		mode = 4;
 		break;
 	case UBWC_4_0:
 		amsbc = true;
 		rgb565_predicator = true;
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
-		mode = 2;
 		break;
 	case UBWC_3_0:
 		amsbc = true;
-		mode = 1;
 		break;
 	default:
 		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
 		break;
 	}
 
+	mode = qcom_ubwc_version_tag(cfg);
+
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value

-- 
2.47.3


