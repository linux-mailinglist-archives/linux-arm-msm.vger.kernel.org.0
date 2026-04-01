Return-Path: <linux-arm-msm+bounces-101226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLP1G+OTzGmbUAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:41:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FA23747C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BF5A308D7FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E115337F00B;
	Wed,  1 Apr 2026 03:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWyMSHBX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMX2eX1f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E4137F748
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775014749; cv=none; b=Q3mgp8AcZ/SYOkIcZ4pv0GOl3ZwGbUxBD2X0Twc6wrGi+mnFJMpAUIKzhMbWtYWXfU2Rlu8EyZGZ5d1/ff8AABsFwu4g1YLfWp6AJgXmGCAdD42TVGORVi10z6gcTmrAd/yQO8As3pl1CW1u5KtSAmOQkoe45aJWLNJXdTWq2mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775014749; c=relaxed/simple;
	bh=RRdFiNjgnPzCRkH1+W1J54NjjzrWTLFzh8czz6UBnnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+e9nIXaU7daG7Kc1DdA1uvsYYrsZKWYnNn57yftb9HjdBRLcXmYqmtLxJEcExCD0D2Y9h+z+WRRe9VRZeCW6tztruDWxyZUOydfUHZo0UGgPIUmtWbnunfHDWC2KF67m1TOtyDU0ze+I4A8z4eJx3wfFxk4GMdK8yOvnd1oSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWyMSHBX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMX2eX1f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6311WU4R3103964
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 03:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c58/Sfeclx1N64rZvnt6VYgoyb1/qdvgxUAhY/kc9dc=; b=kWyMSHBXruavV91s
	r4KBfh3/2zQYc3tYcuA/aXXFlELxdSDQdKEPyzYpA2uWm9pg3DDpjNRnMLMZmUps
	Y3jv0h3proTQYSFpRQ8measxcesyFKqTqMXIE19XTGeD19mk/xfYL3wPp3aPlOXL
	UzQrC3ZCmZuLJAXWfVimoGLjAwTbKNV9lzzsWhaBPNHxSWy10Dp2aiQSAbhSAcY+
	xckn5WR+lVZkoJTFgwTsWHJBKI9i4ooMkAMuqzdBEAc1Wl+HZ/P0xk1w6KSzQBL8
	pG+tk6Xepa5aBRGvQwoDi5psr8nX/Rf2BOgU7LbPcxpOVZkuvtvszct8axI5JqZZ
	EA+BaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js228hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:39:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2cbe7223so209544391cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775014747; x=1775619547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c58/Sfeclx1N64rZvnt6VYgoyb1/qdvgxUAhY/kc9dc=;
        b=RMX2eX1fVh4FzaM6VLdi63heIt0lwnK3w46CgLgppgHOjFuie0y0QWutRQpFCn5LRp
         BDuUlmUaNvmunncNPw1wjORp2shTEvMd97IWJdvqh8Ni5DOkk1ZX08ZRSf3PeQJ5Q6Kz
         2T4jORYRsW+mIkJaDCM3B10SAecDWH2qtlkyPUjvNv5Hk9gdLbG8o0ccnfE9ELdw2Vdj
         SrpaRXVenQokWtkU77hpHD/ZWR4mKfVNbyl0Vg0FojGcwsqOtcGlmtwfSN4bspXuRfxS
         GQSL/ZzJ+dBeII98qNxK3OKNXABlP7laGxMH+Qd8SrHuaPPVb7nIYObOs2RIgZuOnFTd
         6xfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775014747; x=1775619547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c58/Sfeclx1N64rZvnt6VYgoyb1/qdvgxUAhY/kc9dc=;
        b=eYGEpGt1CdljcqqJWRPl0JUCqHLaH8fNQkWaeh7PMKmJ1NfxYfrs88S4NJlED1X+ES
         mhXN90xpT1eYf74CwbwDH7CcegPDLP5n4GiGufXbqZ6yzcdQoIRrV8NaI+d4O4qqsm+S
         blMuQC4F+r7OTTjDHEsJ2WI/vtzWiV1qAfRHdtDJPb/Mw8tpJYXMnkWeTQA/sZEiGPE4
         vzICRyhJJQZXNLkOG0/T67P603mGFtF7+P05zyqNhdnXiHNeN0PsWwp28lm/4OXMuK7s
         bFj0Ygq/L0g14fSLfTNKAFLeyKVivV0YJ1KNVhbvHyRRCudhbp50aHA6oQF2RmHAU0Oa
         4ZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtGGsWI6wPsRn057lTndcAPnprF07JLwXFUNEqj/YGD1AalR632QwNnja70cdtSz30lg+hlMl1ro/6ARyd@vger.kernel.org
X-Gm-Message-State: AOJu0YzeaQv26caPVJDztxGQe/KRDSJATBwdWULAbMPaYl+txLTVeFiE
	3FL/RXbnYPP4c8b4VxneaH5fimKzrncWNipcK9Zi6FgCLiH7qo9EJedmguPYxjLpmivDtTPAVkD
	eT07l0iI5krod3zNs3JN10MPXOmQxDX0W8HYIupmyzeQHO1eyVK4I/QBJma7DiykwRyiG
X-Gm-Gg: ATEYQzywIsRs/ChdWlqGwXhkY1OHmPWXNuimOQPZZwsPku9z6i6mQve/GH+RRUdXyb3
	Je9etaRpmNhRI9eLOx4el/xR4V/TVh/b9bXOOUwf2ydWTOC8Sjs3+dh2JJcKPH0bmhLCfvzu6xn
	q0Mvf9z0StP/2I2NCFBvH4UQ0dRtrEMJtP/8qMs2D4rD5dS7VjYDjrCVx3QidJrq9Der/rV3OJi
	cA85CrRJVOWOdv+kYH8QzH0YbTcIPUrIHACn6SQYqG9wlNFr5Hz1TlnIlkOSWNbw9urAOisnSJd
	LXPlwawIUp91VSJldmOGAwLegVJmwDKxFl51F+/s40kpYNdMguOExdAq8m6P7i8iykH6d6eVxZe
	aTm2/csOQwS/uD8lxFgiPrXVI+DGdWT2pUaH0lwexjkyKZdsXLA23NBk0yV0ZhAskM3bEzjwhXy
	pfurRb5lyVrFx6lKgsTsDCtzUSVQL3sZKK3MM=
X-Received: by 2002:a05:622a:a13:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50d3bd78c0amr32199611cf.52.1775014746737;
        Tue, 31 Mar 2026 20:39:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a13:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50d3bd78c0amr32199311cf.52.1775014746284;
        Tue, 31 Mar 2026 20:39:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83730f7csm24404851fa.16.2026.03.31.20.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:39:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 06:38:48 +0300
Subject: [PATCH v8 3/4] phy: qcom-uniphy: add more registers from display
 PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-fd-hdmi-phy-v8-3-51b0e98edf6c@oss.qualcomm.com>
References: <20260401-fd-hdmi-phy-v8-0-51b0e98edf6c@oss.qualcomm.com>
In-Reply-To: <20260401-fd-hdmi-phy-v8-0-51b0e98edf6c@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2885;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A0KQeSlhmmB1eMUUohCWtmSPla+2ZySmmRe5s7HDmyc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzJNL5iRXqp1OJirSlIM8YMCd0J2GckN/Wf64w
 2wMeVZ3OgOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacyTSwAKCRCLPIo+Aiko
 1fJ7CACbeqEUhDFAb4uFedgJ/xy0En4l0uW2mMQAwEyXkpazQdH3Kwe1d4IjF66qerc3o+mv1vy
 JyMuGdrTEljp3Jz+MF9L6MWLIDlf/xO1BYyUl0k/g3v//fAXD/pJ8rUr+o3LfY1Sqx0w9bC85Ea
 FR/z+rMWgZNfZWHM+x0z6YUkilODx25BcC8PQc/B38yfXpAjQNJcmz1NoMxlO5xE/aYw7xKHfWT
 uKlCPpb9jBL3k3AysVZCmoSwBUXlEfkzQwv6x0gjd4cavJX+KrtaRVB4J7PgsQGyr/yIjTZutH6
 qKD4wp5b/gg7PK3uMZZVD7Ige9qteLlOvz+HjGUVbO06fSnq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: QJ-QZjlpcf1Cqgfvq5IA3mkLqY-WS97I
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cc935b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=NWzoLV28igjY6Ppe7YgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNiBTYWx0ZWRfX5U19zd2AQiS+
 +cl5/PK8d9vTt1fHafM3xBSrHnB3QQGK0gVCfNJ3hwCZUoyJXmjhXG5tvru0afi/xcKkZhv4i3K
 7bt6a5R4+NpAs1mOI0MP+v9EAoFZoYaTrjcFiujP+rYPnFVMw68W40ycawrFEPVp1NX8s60NZ5d
 5zQ391z5i499tYz42vX1JJHBp1uGLsx11y7mj3hpY2CpvnWPo/vNvPUGUWIVDTOLwtqlHU+zH4U
 yOEOHt7baHtU1VVo4LYhEeRg+QNX05cAruVupVZcvebducOFXoI1c7kJJ2sa4O+gFalZq1Lde2J
 2mjpPFVDQpiFE9pO5vTqZ3e31kIk4HwbYJTRPtjv1SJjT16zKqs9h+mnUNtnttkR7LwVrKrn+kn
 Jqu6vHfx/mjFKyBUvDf/xVmqAm+F7XURCjCnS2q0rfjmU5T6Bhyl/jB8wL2pdBuHBCw/YNUPUWI
 AJzNc4OtiXJbYslJ1CA==
X-Proofpoint-GUID: QJ-QZjlpcf1Cqgfvq5IA3mkLqY-WS97I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101226-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3FA23747C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Import register definitions from 28nm DSI and HDMI PHYs, adding more UNI
PHY registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-uniphy.h | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
index e5b79a4dc270..ba9d14aae682 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy.h
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
@@ -8,10 +8,30 @@
 
 /* PHY registers */
 #define UNIPHY_PLL_REFCLK_CFG		0x000
+#define UNIPHY_PLL_REFCLK_DBLR			BIT(0)
+#define UNIPHY_PLL_REFCLK_DIV			GENMASK(3, 2)
+
+#define UNIPHY_PLL_POSTDIV1_CFG		0x004
+#define UNIPHY_PLL_CHGPUMP_CFG		0x008
+#define UNIPHY_PLL_VCOLPF_CFG		0x00c
+#define UNIPHY_PLL_VREG_CFG		0x010
 #define UNIPHY_PLL_PWRGEN_CFG		0x014
+#define UNIPHY_PLL_DMUX_CFG		0x018
+#define UNIPHY_PLL_AMUX_CFG		0x01c
 #define UNIPHY_PLL_GLB_CFG		0x020
+#define UNIPHY_PLL_POSTDIV2_CFG		0x024
+#define UNIPHY_PLL_POSTDIV3_CFG		0x028
+#define UNIPHY_PLL_LPFR_CFG		0x02c
+#define UNIPHY_PLL_LPFC1_CFG		0x030
+#define UNIPHY_PLL_LPFC2_CFG		0x034
 #define UNIPHY_PLL_SDM_CFG0		0x038
+#define UNIPHY_PLL_SDM_BYP			BIT(6)
+#define UNIPHY_PLL_SDM_BYP_DIV			GENMASK(5, 0)
+
 #define UNIPHY_PLL_SDM_CFG1		0x03c
+#define UNIPHY_PLL_SDM_DITHER_EN		BIT(6)
+#define UNIPHY_PLL_SDM_DC_OFFSET		GENMASK(5, 0)
+
 #define UNIPHY_PLL_SDM_CFG2		0x040
 #define UNIPHY_PLL_SDM_CFG3		0x044
 #define UNIPHY_PLL_SDM_CFG4		0x048
@@ -22,11 +42,33 @@
 #define UNIPHY_PLL_LKDET_CFG0		0x05c
 #define UNIPHY_PLL_LKDET_CFG1		0x060
 #define UNIPHY_PLL_LKDET_CFG2		0x064
+#define UNIPHY_PLL_TEST_CFG		0x068
 #define UNIPHY_PLL_CAL_CFG0		0x06c
+#define UNIPHY_PLL_CAL_CFG1		0x070
+#define UNIPHY_PLL_CAL_CFG2		0x074
+#define UNIPHY_PLL_CAL_CFG3		0x078
+#define UNIPHY_PLL_CAL_CFG4		0x07c
+#define UNIPHY_PLL_CAL_CFG5		0x080
+#define UNIPHY_PLL_CAL_CFG6		0x084
+#define UNIPHY_PLL_CAL_CFG7		0x088
 #define UNIPHY_PLL_CAL_CFG8		0x08c
 #define UNIPHY_PLL_CAL_CFG9		0x090
 #define UNIPHY_PLL_CAL_CFG10		0x094
 #define UNIPHY_PLL_CAL_CFG11		0x098
+#define UNIPHY_PLL_EFUSE_CFG		0x09c
+#define UNIPHY_PLL_DEBUG_BUS_SEL	0x0a0
+#define UNIPHY_PLL_CTRL_42		0x0a4
+#define UNIPHY_PLL_CTRL_43		0x0a8
+#define UNIPHY_PLL_CTRL_44		0x0ac
+#define UNIPHY_PLL_CTRL_45		0x0b0
+#define UNIPHY_PLL_CTRL_46		0x0b4
+#define UNIPHY_PLL_CTRL_47		0x0b8
+#define UNIPHY_PLL_CTRL_48		0x0bc
 #define UNIPHY_PLL_STATUS		0x0c0
+#define UNIPHY_PLL_DEBUG_BUS0		0x0c4
+#define UNIPHY_PLL_DEBUG_BUS1		0x0c8
+#define UNIPHY_PLL_DEBUG_BUS2		0x0cc
+#define UNIPHY_PLL_DEBUG_BUS3		0x0d0
+#define UNIPHY_PLL_CTRL_54		0x0d4
 
 #endif

-- 
2.47.3


