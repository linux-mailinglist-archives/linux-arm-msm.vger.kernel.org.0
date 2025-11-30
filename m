Return-Path: <linux-arm-msm+bounces-83896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B71C94F64
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 13:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CCC483447CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 12:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DB0280035;
	Sun, 30 Nov 2025 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrxaUYnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXNiLCMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C46327F010
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764506183; cv=none; b=i1pUbQ6ZndMtPqS5iF6LrmH71PqjCp+gJIitXbVCe5XQiKjdD3YDJ9xw8WRHshQEyeO4PodRHRVwH0jqWLhkBFwS/+6hrdW72j1aRIAaWEEO2LzGRTtxlaU9c8TG0ixQsdbfqCL9kjLKdSOa/P80jNQeNJLwu3Vlx6tihp0JClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764506183; c=relaxed/simple;
	bh=Eijw7sfo1fHO3BdYpz8WwxXJjQps55VoXt7UFlcVMeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BetHJJcD+R/kollxFXX/2TSaaVwfk52073AULNaXmyz6VESYpRz/QC6abX/y9mUtSL+i0l3Bj1rOVK8BCsWaLEWVV7gRNcH6UlR5qLmH7VbLNcpxkunwqdr9gk3Hoty1M9MHfacYMX2baXlDubGvp3SHZlPzj7rigA7oBveVXDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrxaUYnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXNiLCMS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU6ScRm787391
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=; b=jrxaUYnkZ48+4tXG
	L5zTrwdQe57RIVJMUrVyOYz71g5LUm7bC38EOjg74csAk54YkXiPYWudHh7u1QEb
	MyLSXisaFMA8mtlrqggiTnFVQ7aBe+oXlZZaqBoGPb7kXZ1G1tPwUM0U2ZFx6efh
	a1Rb4XD58ifNmfA4N2JxTNEUNfhFrp2VFB//w2L2Y98YD5/KfKqBjf/xBJKdv9Zk
	eRR8uczq6iy6SYB4oAyrBdgJ/Cl2T18E71sB8XKmqnQBRAiKLfMi2cpzvNHXVw8e
	aRCDF3nRhkj0R4MUs3EQ9Dw7enofSYa6S1uatcX6Uv1kfBWVdM6yJRrD2URpl/Au
	V12LwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqskf2416-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b30b6abb7bso627119285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 04:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506180; x=1765110980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=;
        b=GXNiLCMSkCVACzw/+rEodUQs6rpbhPCBYV7M25HsIwSVGNG3pMUm5Hu6wjsib8Wloh
         Hl++GjHUzzbedYqdY5KLBNtWNILYFiadiskxpH8l5feou4ulkaBDilPgGeTai9LG87ib
         3dwY5HiCKADk8DTvhmpH9gyhFu14aLNMf74UPPKEM/vFjdkuNFEURnPc2m/VIJ6EskDT
         QOakoVAcZ0L346t9LxCjb9Cvqzxaq1g2BFfQ6ehCgfW/UYk3pIUzE1uZO98S9sK7ouz+
         8i2IZnkkY5bNS0/sYrfEZd6IpGN+jKCsSqeY1GZuCi1AI0xHVjClgeZdFA5yQnh92UFP
         qTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506180; x=1765110980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=;
        b=U++ggSw1V02upxnHRRcTMv1Tw+saDdPvT1BaZq0NdGLutotoSoPYTwVVq2BLTDN3Af
         p+08/7t0lRMVZso+Q+d000/4rcr/mc76Gkuk+kf1HMOEjMa2ogpvIyQzm//SI8iyOnat
         ZpNCOpfCqn0kj6vAWJMBymWyhYMlEMwx63e4ayjs1I/K8MyiX0zgsICxnccYytyHEbkG
         JeUpgtJeYPi7FxIIcTaexheoZktqUxn9Bx0z5IQlbwbbQTrXxs/9dhcFdrmxU9iPaHoz
         a6qG9Pn+5w9NdhpJiMfZXgxBQEYHjoeGTsIp4jKtliXjHi7i4x3/dadURQvmI0TqqyUm
         admg==
X-Forwarded-Encrypted: i=1; AJvYcCUGKvDgviUXat4oTYmv+McmCZuKs7dwqwbGWiPH9Z/9PznXWbD8L0oZiUBMlRJnFcJgN2XuRcj7gU8WTT6A@vger.kernel.org
X-Gm-Message-State: AOJu0YxbE0SEGO6HFXku6phckWkjtdUepiuCzggAOek4V7xb8IJLiEFU
	C6MojGTBUW+/Tp+bZMVX/iV6VBYAiYB2jDXN9piUFZ5LE5CeG+JzLiRANaWAZAsVT4Gbsqmp5RW
	pjkOTDOOhKdLubNKOf4bP3QL78b5rYGHKHdwulc7tzWKMjlwSy2uj/dcbTwAr2VXBTP+Q
X-Gm-Gg: ASbGncuzmdROB1zmEi6CTTxoGZx/m2I0dwL6Bp2UMHZeBHOhHJ6yiSJgf6CgExU1fnV
	7xPZU5Iz3DxVy4odVA9AnBH97lnZjbi8Wh3rYsWp3MiaZ8E51MZUoFyHdl4YQx82k1hK9fN9QI6
	crlxHk3b86zXBX++CkV/Zl9upO2kbRoGSdAIfmm96baI3uh+Qoo5p1ZU/K/JpLTpB9NrqXXUlZc
	dE4Oy7EFGZb84Sw8N7o0wVvFd1oLYBL/bbTbGEsqqwkaXyaMisImE4dYuvzpag3eCbCfBYHBhWp
	/DMyqoydpWGddstIgkPiD5DaSZiZagfqLS1HraLXrSH9hAWfy/vwGskryhme2vYyNMguSE5n6jR
	12xyJUeccEOx/3aw3cLBpZWezf9q6iTueTw==
X-Received: by 2002:a05:620a:4689:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8b33d2681e5mr4596737585a.33.1764506180087;
        Sun, 30 Nov 2025 04:36:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVjFnLmAKnKsu+rROI20IfRIbSvxnxGH2GJOLhlIiUqNW2ucVuPMKhRlB1OZpEhn+d7v9Qkw==
X-Received: by 2002:a05:620a:4689:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8b33d2681e5mr4596735785a.33.1764506179712;
        Sun, 30 Nov 2025 04:36:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:09 +0100
Subject: [PATCH 2/4] remoteproc: mtp_scp: Constify buffer passed to
 scp_send_ipi()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-2-cb11c7e0a024@oss.qualcomm.com>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Eijw7sfo1fHO3BdYpz8WwxXJjQps55VoXt7UFlcVMeA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo72TYdt6rx2Lc07XKkIkEPHnRGPcGuTpQIs
 bi/v4A8NCKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OwAKCRDBN2bmhouD
 1xtnD/oDgg43hK+yfYRQa5/OJIA2iP269kMbsXJJ+k0xaiWZ0X23n9yIREysBpFzzROhC6nrq+7
 RmwffS8bgzNPqAaonjTDi8g5SWVIgDLUG+jD8pKsr38ZenL58//aJwWUGK/4EvcvM3D997bpsIC
 t8qDt+saG84vnNGAu5A6r48Zj8DWVtjW3bHAwRMgn0ZX0dBc2tdTu3wYo7NbHZPXlJds+Evp1IB
 HWBvCGjOs63MVgvWUt+wsfNiKaT+7D8t9V0sJfTi37XMwMa+Rkp28buGEXUOnLSPHncl48ka8w7
 724pSPBcQvLcSicxYkCRFySGZ1xCnedG4gCn5go8HDonBdCwYrenEtYzvggjokzmR9tKVTMQBB7
 IhC6YwQKEal/n5gPTf/igMp640L9n4brJkDQtYRPlnEGifdQ67kAU2CY5IXiAdEKiGOrfW9mfHf
 b7dJ2gmAy19lOwvLiAUNHt5ii9QUUDwmTUPJulDGqx0IFtX8pJDh3CL7GS+NpDkCgbvUZJJLmqC
 1byTAKXNzxJiNrc0MlQmkLBnlINN0NGw1nC9P16GsRvoGgBvUcEjTBHMYzPcSE06HIaWHay2MU+
 cyu6McPojeS8IGB5HvrGSpoxLGWvgAzy8AFlR647pvtUVfdKsnv5dCC8X+7GhJ7PCFRUMmkZbtb
 fVgL16w38wuiO1A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=X7Nf6WTe c=1 sm=1 tr=0 ts=692c3a45 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bWW22GgIgZmb96Hp9REA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HGwBtP3uzjLgeTd-bRhRsNX8ZDIXXNJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfXz3PCBUDYRmRM
 4BzAARUFth9maPKLjFjcl+1l7rBO5MQCPAKl+dPyKvenkXHLdT+eST/WqjaHgDC4bS1ThRLf1pJ
 dtpTiU2kenyIowNuMPCuv0y9AQDzqFUm14+kYLCkY2j8v2e1tAI5vnrTxPHrSJDi7vyV3odyfy3
 +QsGMJhIoWVJSuMciBXAHi6nEVUd3e3w757PiAMC3DEfAlOgLEFdhZMfMuJCyaOEsx4ZdhZ8raH
 KchgRBIPH/y/57M/oqB2zKBoRH69gIio1qb0yNZDPxHUCKWx8yZAUvtI77hE/zKrfUwyx0AS7eY
 j+i1tTwQ1xxQvHYUlzkGcD0UHIVz8eBzgwMofFqfpXNtL/ZrgUiDtNcMkKiDlEHljcoOgZKDRWB
 cQiUPLQ7w4GCtgEcP+3AGYAawpS24g==
X-Proofpoint-ORIG-GUID: HGwBtP3uzjLgeTd-bRhRsNX8ZDIXXNJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300108

scp_send_ipi() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp.c    | 2 +-
 include/linux/rpmsg/mtk_rpmsg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index db8fd045468d..95d5e0138a15 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1061,7 +1061,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
 	scp_ipi_unregister(scp, id);
 }
 
-static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
+static int scp_send_ipi(struct platform_device *pdev, u32 id, const void *buf,
 			unsigned int len, unsigned int wait)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rpmsg.h
index 363b60178040..badcbc89917f 100644
--- a/include/linux/rpmsg/mtk_rpmsg.h
+++ b/include/linux/rpmsg/mtk_rpmsg.h
@@ -25,7 +25,7 @@ struct mtk_rpmsg_info {
 			    ipi_handler_t handler, void *priv);
 	void (*unregister_ipi)(struct platform_device *pdev, u32 id);
 	int (*send_ipi)(struct platform_device *pdev, u32 id,
-			void *buf, unsigned int len, unsigned int wait);
+			const void *buf, unsigned int len, unsigned int wait);
 	int ns_ipi_id;
 };
 

-- 
2.48.1


