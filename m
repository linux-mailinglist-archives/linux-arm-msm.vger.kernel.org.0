Return-Path: <linux-arm-msm+bounces-99435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMsBHmPGwWlTWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:01:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB23C2FEB7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15D2330CCFB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C764936DA1A;
	Mon, 23 Mar 2026 22:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXc4F6jC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLlCfqAT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E435A384234
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306617; cv=none; b=e8Ffu+UR3wtL37JMZJb8OIb0SwN4DDa9chJk8oLi9zPFzTkgCy3aA6TYJTgo5tF4vMcz6JN3zWbmDyOFB+KbWIa+brq0vBgBYQLCXIXp7LlJkycGWfo7imxxYl0RoWRGn8N8xqHRJLFG6qzsPusRt5ZsLyZ5w1dqil/2B/zgHWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306617; c=relaxed/simple;
	bh=RRdFiNjgnPzCRkH1+W1J54NjjzrWTLFzh8czz6UBnnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obNc6jfamqijiVqe+er46dGTKTko7MurvPkfsCcNQTkO6XcNgeGcYuqgSCIAdrpO2xc4NYcG19pvkzVRmeyWpOx5IhQnSDNng9tcYbsrCtgQT2DIVuFlTp1eDk+Zhc5QkFnZCFcRQ71Bmu5WAEqOyINYupBonfh/+ZYXs1/Je5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXc4F6jC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLlCfqAT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqh0B3171033
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c58/Sfeclx1N64rZvnt6VYgoyb1/qdvgxUAhY/kc9dc=; b=WXc4F6jCyeX50i2q
	9vQZrUqXSHHdr1oyMCXOobR9IQplNrsd6ZBJU12Klp1jO6N9I9AzUkpSoOV2C9KY
	pC1M1QdM3EwwJsm4L21aFVIjPfkmyMn6mTIlPKWQfg4b2fOp1IBzvWMVw441NCa0
	+HYg2LNipTJ6lbEEVMnx2ji4t1/9RKjJ7O05Vgrhb/4VKKRZZ2gO/Lssz3+M+lXA
	zkYhdcIUgBY/KTA2hfsgMsIisG9i/Qx/q/RZ5l0gFgK2YI3yeOaan3Yrk2Gh2deb
	UhL2Et9VCmeBspLpoKFc1qs8mCjMkUJNaTVi26T/H/jYXROPrdPE9Mm95D0+TvWT
	vgnu4g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r220qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:56:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50911c94db1so35970931cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774306614; x=1774911414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c58/Sfeclx1N64rZvnt6VYgoyb1/qdvgxUAhY/kc9dc=;
        b=iLlCfqATX+0rj5bOnBIU8pwQuv1HiYsirXGzX/rShucCTGJCr8BD9eJirOTOoFEMxM
         htwST4szuYx2ItliE8Ebjo0QriubZIsRL8YEU2737yIaIwn0ieTHtFps9nVxbN7YVX3a
         thio9VjiRYny6e+8YGHs3PwutoVVFeKbVCs6+QROql0JD1927fHgmBOrysMaduQYL0jU
         k542ELuV+hI1qH38PyvnjAjnXKSRTjRpch/8y3O1eZ2vdq6ZqxYPQppgYGtm1ZI+LfFv
         ZVpkkvyIe8MXza68yBDG/sUUr6P1wWyQdCZq3euhV6Eoxgicnk2M1JsSbfv5QfJA+Jgu
         DZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306614; x=1774911414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c58/Sfeclx1N64rZvnt6VYgoyb1/qdvgxUAhY/kc9dc=;
        b=WtyhnfcoUBfrBxUqr5TdiloRiQjDEWrb0880AwUmkDgNCBUP9P56xGXKrc451fxaCA
         2+ZAfCx8rBJMFUvR6ZAP7GtkF5b8XkaIr0uy3Z3jMEWkNFoe6wv6gtBS6uQm1HPtN1s4
         hs9+luxn/inotyGYpjL4/bInC/x8Vg99O4uimuCLbA16gOV0rSJmNSlhTclpRlgEVnJ+
         Old34O2qoWE32J9cpNu/aGZ7FA3c4ZBCHvla+LuBJ3JeLB5v9QkK4Izs+pxS8khJMthr
         nGo5Zk2eHxW9y4+cTjZvem2FiVWRrHkaddJcjPjctbhQpWphP+5ykPvsZ+AN6E0BWwIR
         10Hg==
X-Forwarded-Encrypted: i=1; AJvYcCViN5gxh4AeVB33jhEbi6iCGDKdP0W2gLKINaN9N8sTA7w0YLkUwl9qKRttbQK8NLmaISRuaIFUnVR+Lro0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo9OygBnMcpCFWqZVDYT+hkn1JIHrI9m/onPhop4ipJBjawKG0
	673nePUSREqTqvmxQ3udArH3P2o9WIJz2/sJ6DQfDwap9ndYmE1ctIMjGEVkFwerBisGSXknyFN
	c5bsqW2AQJ+uFTJyJVem3NwK4Hi7gKdNhealdjVeBoCtu4nwCL1CyUM8IbAjWGifNWGdqLO/iDs
	FW
X-Gm-Gg: ATEYQzwI0ySM4NVRvMiiKvSc4lN+b85TJ7sFY2yOaBZsKdAOVBu4MDmF0bTfqolS0ZV
	mDn8cW0qJt0FF0cC0ZOZuz5laIOxMGxo2J03A8vmenIQkf2eKL1gnq94NSaPz8knmqZEFsvQ/uX
	abs7eqjJ4z2WGLU+PwY2GNbwjLN6LSHWCgVcgBuIKONLPnGcD9Utuh6LkF/r71LB3GSDy8QjVan
	Kl6KJkdA3oftbMJZDaW9NZBAbKKuMvRvpdLpz0dP/oU8PSV4dcsM8YnVeSBZj/pijSWQ+TYXUr8
	u3SMERIHZWdbIQHjri9GAqoH/lzVVlsny/mUW0/cK5tbGbYCGi438JzK2eTE4IFGEySpX1FW83F
	adBdHoYycoiAbnqqJYs0BlRvMo2iG2T1Mp6b4UzuDsPHZqkmQIlTXc0oDEVnx+eyi0X14gs+xYQ
	bo5h73Z+w+Y0TDHlr1DBCOBDk09OPNIooY4sU=
X-Received: by 2002:a05:622a:20d:b0:50b:4eb9:a97c with SMTP id d75a77b69052e-50b4eb9ade8mr133913991cf.15.1774306614027;
        Mon, 23 Mar 2026 15:56:54 -0700 (PDT)
X-Received: by 2002:a05:622a:20d:b0:50b:4eb9:a97c with SMTP id d75a77b69052e-50b4eb9ade8mr133913741cf.15.1774306613584;
        Mon, 23 Mar 2026 15:56:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2963fa304sm156489e87.27.2026.03.23.15.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:56:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 00:56:36 +0200
Subject: [PATCH v7 3/4] phy: qcom-uniphy: add more registers from display
 PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-fd-hdmi-phy-v7-3-b41dde8d83b8@oss.qualcomm.com>
References: <20260324-fd-hdmi-phy-v7-0-b41dde8d83b8@oss.qualcomm.com>
In-Reply-To: <20260324-fd-hdmi-phy-v7-0-b41dde8d83b8@oss.qualcomm.com>
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2885;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A0KQeSlhmmB1eMUUohCWtmSPla+2ZySmmRe5s7HDmyc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwcUmGLIzcnXBqY37D0iMQAO5l7qaw0cK45eJc
 860JogvHIeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHFJgAKCRCLPIo+Aiko
 1VbnB/4laU/pBpznNLavxzW1loPsnZHQsmSaicyVWUApoMv9SBYQnLRsgj89AuuxLwqxkf3dgnx
 Lxa1m6BoU32InHZ9A7rbvXDfgXv07vuVmqo8/pGh7GI2CUbxxVUF8Y/MjFkPYscIRI5kewNj+cE
 HGmS4RLGVBLQiE2Eu/gJH6BWJoCHfM8sG6ZcoBR/YvbhsGudI+gNFZ846Ui7ixbE81iAKbLad4V
 bkNw9sO1o0L6QvtismtTrxirwUTcLJH5ZDqcWq1M/S0fCLFLMm0iZvW55uSQm+GV9KLpA76LMN4
 s1kbyu7R0pfMeWzzVHws2EDbuGw1RTIXf42SMWmyWe57zDFs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1c536 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=NWzoLV28igjY6Ppe7YgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: b8BTWZ3A5rbCxd3cTB8bFECNwo_AYy3s
X-Proofpoint-ORIG-GUID: b8BTWZ3A5rbCxd3cTB8bFECNwo_AYy3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2OSBTYWx0ZWRfX5hXQzGkk+Izo
 KHpVlY+KciaC/yFf9CPDynagrQkCQ2HwrQzehwMiRH2afapgaxXgZuio8x1r3PA+5GyGgYlGFD0
 y6ETj1sc5JuxVtpyl8tfb6KUxR4ENyLG1Kgyx4seDMsY7nFEOR2yBrGaUEmdtU5Rvz1rY0Zz7cD
 mifrORVaJivxpvzYS5T+srseucIGJLDTbvNmvR0Xgb3IxopFY/4T6Q42CZqhcSyUOCO5OK6rT75
 0vBnWXAwGhGvllJ/ETTSCJ1Xsu9RYiVhZz6M4Br0p7Bhrn73xZuXEbd+Zebhlp74xVQoxDcgabZ
 e3Ur+07ThTRKhPsAXDQhQVcHBwrF6751EwNVq61l7Jpm/NwLl/kYgy6MYhqXdC1fGaTFzk6PIh/
 vT1q1MvkzITmtDJTOHyi9TYh52t+PmrMhFoEJy48DxhAIu1gjDkIeukmMx+RvYfusO4LoadSgHW
 f3t0zBx9yMUEGA2eRRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230169
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99435-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB23C2FEB7E
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


