Return-Path: <linux-arm-msm+bounces-97672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NMlCfXstGm/uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:07:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CFF28BA9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A1443048EEB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC7134E767;
	Sat, 14 Mar 2026 05:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQZjx5vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu8td0Al"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1667E34E74F
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773464804; cv=none; b=SYkMTWCVuEgRGChGoyiJfP7dnPen8A6/mFoZxkCmvwg2/D0xqZmxngJLlG9V4sClMkWmDH8kfjTdW0YXK9vVTLQGD2wGTowwpTpVNd/1uUIAhk6YCq7JuTmSia7HSSsoC838Z1r0zwHd7BuC8Xhg/ew9HBTbhZV6N/pxgIzM6Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773464804; c=relaxed/simple;
	bh=IVjh89FIIzBpn3dl7OjquZS51tzBcHBvRQOGqFTKPeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5Q5hLdGzrgAB5G+KAhYBYgjpLcKUPf8ijyKOrGYzsdBzgzoyi1pLxik3nXlysRwKxfdHrcMWOZYpcfccDBVHeJBVFItRplIZSkmaXnApoRoKe8zK37mnctl8cfr9Or0XH80BDftNATp2RwMf4nZbeFI22PHqNrI6GGVSPCIg5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQZjx5vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu8td0Al; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E3ndTf2907461
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8AwSPheloTpUNoYn+5istaBSV5cxl2twt/OKxdGnStw=; b=lQZjx5vxbYVo39sE
	onPIbuvqFzbOqPXIoeXfPDeYECu9wpVTh4xxCTsf8qWcfX4Whyo+xnkiW1w0LGwk
	wASaA+DtyVWs5P1wG1/7O3Fq+1F3bXVgu80r9X6ael1P/CFLjbYZ+FZig8thtMUF
	iW4DhUbw+XYoZda0cZMkFlujPNWnuCO95+A/oCEyisTFdqy5tPt0MWdmCwg9WpLE
	M9XryWuabgUlANBQXWJzYZyjRK6Nj128lzcAyLugC0hX2c0VW/dRU7Wo+sPa4dCG
	z7VW7d/9/xMjq7COZ8lcLEMnTDsjNA0gELleRbhzv+wLfivdANSo62uG9eeUaTrr
	m958pQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043g3s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:06:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fec8d44so1879107585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 22:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773464800; x=1774069600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AwSPheloTpUNoYn+5istaBSV5cxl2twt/OKxdGnStw=;
        b=Hu8td0Alcsr5Ay6JrMiVdNEsUGjR1dk1157JBruGwdiY2OmBWCA2SHT7HOt8IVqaio
         im/GWoDyFHBd5lXCy5Ciqz7wDyZyP/LGIOWICxo7K4A8yzXEPwgAK87IIDX7YcJxrcYM
         KGGQa+uct7IaNPeCgtMsJHG7W5iAz1+zvXxrkrRmPsuR6sKPNcJaKDfPLlH0Bez4t+fv
         bJ0MJeHIhyoF3LL2R19ItJWK0j1tkgk3Ml76bzESbAkvi/WOAxyRcD5Qgs9wNrRTtz+Z
         bghDEB1Fpa3wC1j0gbXneMVTq4/txP0NiT03CFZs4TIqp7VYedL6Gh1PcCz4NifRS7Yc
         XDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773464800; x=1774069600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8AwSPheloTpUNoYn+5istaBSV5cxl2twt/OKxdGnStw=;
        b=BarZvyT2Odd3LWkobUuYg4KgrKlOb4jHZ41jA9q6kByxQjOn3W2IfAp4JwqJlyIRpX
         qapxC+Fj/PMPRM09+ylOocK5ECl/McvDlEYjLGPuPt7h/sYJLb9VrvDE0jXIVtB1sOTt
         6gheb1RJO3RfZEzuTEBzkwIqvg62aP6aSL5Mqbeo1hB+Ytk2HD2Wlui/61TKCjMQkTFa
         qASVeZ2VMZ5YPz8vxxqJah1I3QP3YGR2DSfUNijV5iGD1n4VjL7Ybw/Ngmhp+pu/z9te
         msWw3QgNUN7HNH6mFn2UClh6qj3LI2g6X2U+vAUh8WuNKMLmDuQywEF/2nqEUQK7crue
         cw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4wlLySUMaa7w0NqpH8/qGWKbLLFji1Pryg1Uz6GPwTgZH3K4Dk09kcB6cIXRotiBtRPoQ8bThdWqfHrZb@vger.kernel.org
X-Gm-Message-State: AOJu0YyCk4FkxD2VmuOduuM6+qBtahZaVu3RfwjyoGH+h6LABYy2xPZE
	KZVnwyqgwT220Bn1Fghd6+mGPsk/JkuopuxKg1KYzDsCeYDIYxZHGHMTXQe4iHsPRtxX0j5v0mj
	8viLJjetEacqoHMsXnlqy8SjZWRDorvcLHLrREaAg0SGGXzkot2P3NJ6wAC4RYQCOCOSP
X-Gm-Gg: ATEYQzxBzGcS0oijf2JKbjRzI191sFRI3w/CyAOHXHp99Ul1xzhJSiKUAKgSPiHQoDT
	SnvdijDvtv6qgJ0RpzSAXj6t8gcaXjJWHsESaEusJeREjHTTe2kgBIYe7zBkVQ2WunhyVUJBbZb
	dMGlJQawcri4IXRzceI70R01LE2F2CAgRQsVPbWJLgSyuTdDhpb9LRzbcT9WBVlz+Tpu4wWnjVH
	mic4b254OaQ6tANgEA6rYf7fj5Ce1itlqHujKzdYzIVB86ssarrECT0LmU6HCGi/6W3hcDdrCj2
	eeq04KXJmY5Sg6imzfRwrZwnxdu+b6t4P+2NIXFeQrsqOTqHHqwx/WbdV/hF7ShlTJExQ9oixtJ
	R+vfMZsZU7Z9f0hIRAl8VmOfpsaGX48G915AYqYzDJvp8aOVHcV3K88rKgk2TchyAFDMMBkktqn
	kdHqna+KNSN7ILkHs7sSFBJZwofFoSZx63pLA=
X-Received: by 2002:a05:620a:28c7:b0:8cb:3e86:d98b with SMTP id af79cd13be357-8cdb5b7cfe1mr760119285a.70.1773464800194;
        Fri, 13 Mar 2026 22:06:40 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:8cb:3e86:d98b with SMTP id af79cd13be357-8cdb5b7cfe1mr760117985a.70.1773464799747;
        Fri, 13 Mar 2026 22:06:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636206bsm1982771e87.67.2026.03.13.22.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:06:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 07:06:20 +0200
Subject: [PATCH v5 2/4] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-fd-hdmi-phy-v5-2-58122ae96d3b@oss.qualcomm.com>
References: <20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com>
In-Reply-To: <20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3033;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/2opfqPS0Z1wOkjLcsVaxdSxpYtXDoOpRdO9yoyCyhk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptOzV9dQ3IRR3dl2CePfQ3h2lOGFzcWFc5DwB/
 QC8aeToTeeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabTs1QAKCRCLPIo+Aiko
 1Rf2B/9IsNKOTt8CRhTBF2S1R2VxM1pu6ZXCj0A+LmADjJAZE8h8Ojxm566dhtlDA5iZ1tOyqD7
 S12ow6wqPrWtMM1Tc0/3t/YLscu3+YDuH5WvSPBfasreNVQjR2JYnREgN4YPioqAiZrWilkb2Yj
 oQYCDofTswSf0a+FHmRqKJg+AxJXpOcCyWJ9UTYJs6T6mhySlmBI0t5WcYyWBRu/mPxEB0py4jK
 9SpgR0GbWShMKaNfZ/FLcWfmmzRjeOO414ZnaDzODPK88kWOid6acA1TrdCJ6bLvsd/n8Y9WNgh
 qoiXAzxiNIuWKxUPu+do1DXWuIp1057kJvHKL2UaJf660A5V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAzNyBTYWx0ZWRfX7GY6gz/FbawS
 7xdXDvrulhUMKHh5cIZNtMzgqqOB7s6+TNKx1qIxFlR8WSR23gXkipyUDP2Q1Kb41S0WGLXoytj
 d4Y04fmARvF4AJZhqGbWFNRKXqnrY/jjjvxzuRfsWEu4bJdyHs1okX8LxX/jxIu4zSBjFYd6i67
 16AB8VPFs6owXtl5R5U82xl0gRuLkl705/yOc0fx5MAAXPut9NxaHc2h1NrBZ9ZMzU9kg4x3LoX
 PXYirOo+9rPkPqYCNEnG4TNma71V+dY+xrG2SxRV61dmdxuR5PcBbznUvrq8znP6pEGfFf39ewr
 6GWfQ/uROOhsa6Inq0lYk1ySuPxKltdxUjbNK7XIYQSzidPersNfXtjs0mOh6XONy4BC8r6ujox
 q4qa5Kwuq11mSXmTRw9ZhBNT3JvO9ELCcVaatb5fpKXaTuR6yyUj7DRvGxlx5iYsUMlWaaRKLit
 lAuJwnlq/PPtgR2FHCA==
X-Proofpoint-GUID: oxWJaJExKPrjrn0GLZ1tnMhzJq2rx1at
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b4ece1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=_xNQ4P_HJxdd5osA_owA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oxWJaJExKPrjrn0GLZ1tnMhzJq2rx1at
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603140037
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97672-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96CFF28BA9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The "uni" PLL is shared between several PHYS: APQ8064's SATA,
MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 23 +-------------------
 drivers/phy/qualcomm/phy-qcom-uniphy.h       | 32 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index cae290a6e19f..dd9929429f9a 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -15,28 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 
-/* PHY registers */
-#define UNIPHY_PLL_REFCLK_CFG		0x000
-#define UNIPHY_PLL_PWRGEN_CFG		0x014
-#define UNIPHY_PLL_GLB_CFG		0x020
-#define UNIPHY_PLL_SDM_CFG0		0x038
-#define UNIPHY_PLL_SDM_CFG1		0x03C
-#define UNIPHY_PLL_SDM_CFG2		0x040
-#define UNIPHY_PLL_SDM_CFG3		0x044
-#define UNIPHY_PLL_SDM_CFG4		0x048
-#define UNIPHY_PLL_SSC_CFG0		0x04C
-#define UNIPHY_PLL_SSC_CFG1		0x050
-#define UNIPHY_PLL_SSC_CFG2		0x054
-#define UNIPHY_PLL_SSC_CFG3		0x058
-#define UNIPHY_PLL_LKDET_CFG0		0x05C
-#define UNIPHY_PLL_LKDET_CFG1		0x060
-#define UNIPHY_PLL_LKDET_CFG2		0x064
-#define UNIPHY_PLL_CAL_CFG0		0x06C
-#define UNIPHY_PLL_CAL_CFG8		0x08C
-#define UNIPHY_PLL_CAL_CFG9		0x090
-#define UNIPHY_PLL_CAL_CFG10		0x094
-#define UNIPHY_PLL_CAL_CFG11		0x098
-#define UNIPHY_PLL_STATUS		0x0C0
+#include "phy-qcom-uniphy.h"
 
 #define SATA_PHY_SER_CTRL		0x100
 #define SATA_PHY_TX_DRIV_CTRL0		0x104
diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
new file mode 100644
index 000000000000..e5b79a4dc270
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef PHY_QCOM_UNIPHY_H
+#define PHY_QCOM_UNIPHY_H
+
+/* PHY registers */
+#define UNIPHY_PLL_REFCLK_CFG		0x000
+#define UNIPHY_PLL_PWRGEN_CFG		0x014
+#define UNIPHY_PLL_GLB_CFG		0x020
+#define UNIPHY_PLL_SDM_CFG0		0x038
+#define UNIPHY_PLL_SDM_CFG1		0x03c
+#define UNIPHY_PLL_SDM_CFG2		0x040
+#define UNIPHY_PLL_SDM_CFG3		0x044
+#define UNIPHY_PLL_SDM_CFG4		0x048
+#define UNIPHY_PLL_SSC_CFG0		0x04c
+#define UNIPHY_PLL_SSC_CFG1		0x050
+#define UNIPHY_PLL_SSC_CFG2		0x054
+#define UNIPHY_PLL_SSC_CFG3		0x058
+#define UNIPHY_PLL_LKDET_CFG0		0x05c
+#define UNIPHY_PLL_LKDET_CFG1		0x060
+#define UNIPHY_PLL_LKDET_CFG2		0x064
+#define UNIPHY_PLL_CAL_CFG0		0x06c
+#define UNIPHY_PLL_CAL_CFG8		0x08c
+#define UNIPHY_PLL_CAL_CFG9		0x090
+#define UNIPHY_PLL_CAL_CFG10		0x094
+#define UNIPHY_PLL_CAL_CFG11		0x098
+#define UNIPHY_PLL_STATUS		0x0c0
+
+#endif

-- 
2.47.3


