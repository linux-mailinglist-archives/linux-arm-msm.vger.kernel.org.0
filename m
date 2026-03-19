Return-Path: <linux-arm-msm+bounces-98602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CArOMyRyu2nSkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:48:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 366942C5AFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C6C130ABD55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A693242D9;
	Thu, 19 Mar 2026 03:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNmEnLY3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMC3mu6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22E22EFDA2
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773892112; cv=none; b=O6rMdFn+7VjhgUQ76ryIKWt3KNsGxLK69w2Id9YxTx3lMmCIMu9+/45LtUMsuuQFDtyRsp3r1GBVn3bWekPY+cdqFSSNqG8syeVU3uFCrj2wMXCN2MwPN2WMot5GN34DAvpBDgwLC28PHCOg1nfrI0YloI8fUBedEAG0lTK6X0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773892112; c=relaxed/simple;
	bh=DvPJs4paEzKp90KWrdtN4xdrXL6yB+AnGKH2S8yofHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnIknWE3+ZRLOyWRnOsUzj/bX8qcWi4qfICgm3ZUReECG6HJjd6lOqii/ag1nmodUxWmdpMD98kXl+V/5XWzzlQwDRaa7nN2BLciUBvaPgC6kula5uWc+vTGmC9mqKreNbZp3C2Sxg6bNP89OpBrVm7RwTRrg9aXycH/ToLI1tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNmEnLY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMC3mu6v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J3A69f3228017
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omnRmyUQg5dIWgAiljjvcZxQHMNx7Y0vRQtYTvOpk/4=; b=BNmEnLY3GIBW4LUT
	qu7tTWdpaA1C/APSaGUKAz+99326cWQmMl63Nkjoupy9RRLWLLxnt0VvJKl+KtuB
	wSf+JYQbVGP/GX2KcVErAKZwIwHIz9EQe1dZZpOGu3dH/Gj3YYRtZJUgFIDaFaO2
	c3SbYGgVPRVUcYLR8+x2OgLp/9R29qLns1DDPtITSKshhDXY2fDHaHYPFAN4ym7v
	te3Ep1oUq2oI7R1g2pBKdtA2NJJXAYyY9BDmEU/bemWLsS9yQ24Vq5G/GFJ+hREe
	LF7ykL2InouxOGjum33qwzq2o+skhyJ+w6a/HdawNCqe8MA86abHBE3xC2YiCVzA
	4ZFXdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00eg9n65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:48:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso71025191cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 20:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773892109; x=1774496909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omnRmyUQg5dIWgAiljjvcZxQHMNx7Y0vRQtYTvOpk/4=;
        b=HMC3mu6vqE3CLPJdhTaqqsX17O3nHEhUAr35oizMM+2Nmm+eIsyqysNnw/JEm07s/X
         9B2OpMtNFeZgRzN4n6P/FxLtfmP8FGMuS26rZCqQUHPf6EzH/yP4faYSy3ZYkrVhsfV/
         OSQpWbPdAF9kstsk+sHd+NA61YHeOFdLIV0athgTru2QWRZSRodJTobuKlW+MFD0dZ8H
         BhDaQqdN9OcI8yfdAJm8HeJdv5mA8z/CpC7uicsmvYRufciH/1npC72JhwuvsfT16d9O
         CFKRPOSsZxshdp0Y2rL7GM1+OGqr3ndyXg/1PRyQEnKI+MC0UE8wX7Q9bSnorZSfhfkZ
         lA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892109; x=1774496909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=omnRmyUQg5dIWgAiljjvcZxQHMNx7Y0vRQtYTvOpk/4=;
        b=LXTUa6MuNS7BLn5oArnYHHwoC5Ixbv91v83/EMUp38Wz0AflIVUQJXdRAwLZTyeSnS
         YqnLjPdXBYf9YoWTe0bYoOGZfieWUVZ7pF9kZqanzElypo2AFVItmOPt7y5ybbDaWOxo
         uoLcfuu2XG95Spyqp2k73hycclcYYgl+91rP/t16vsj/6meqAWAm7RdBWkHWuOiAkEf0
         LkXTeZIPKmZCx9fASDtHqbkncQVywd4cqLZoh5GDA6W3OXDItrBxLMFY4gIkx2ysVjl0
         7UmMa15oQQVkOC65oVBJqu36S2a7meK5T3widnEuQap7UkI7ZGFBM4ynHeVYBd7snxul
         L1MA==
X-Forwarded-Encrypted: i=1; AJvYcCXwMJTYe9kvX28N6DIZ6BFrDtCm+K4NuJ89KV841WY7QilB4V7QchwUlQ82CRw+YycY+Myf8bWCRJFRpsvr@vger.kernel.org
X-Gm-Message-State: AOJu0YwZImMOTjdXfonlMOLHv0B6IRaD45jxi7hjpqOtKq2VK3MjnD6J
	RwQOLyQ+VY9QMnLzD1Ivov5zZiDqZJrdMoHa3TW+94Mlz2/RdXR51iTwmhPWDExcbVDpmmhIlKS
	wY2zDOvYCjM3RxkyePXVT+9alY8hfXzviWvebz+wQH0fPBzthM3C3FgIW/dgqnnzvoUhP
X-Gm-Gg: ATEYQzyAcgc0YnUQ5qI9MoFN0T59ViUXy+/GQxbFiQSDl8pG9676Y5ZRWEsMJC0kyAD
	Nh4XpaSJYye//DDrL+ne5c1kGxym6qupHc+Y60/1FAP5t0RNNfKpApAFyC4y0cGAdddy+/v0KwC
	Qu+p8Nf4VKBlk81L5qqRjLl2/zbk4+jy21rEzDNE5itJeCeYFyj/CKtY8KXpoAUVAKUhAjdvqKi
	iJezwtRzXPNZn0ey3BK94AFjyd8ghSzISf49ZC9uLHkVHWc8zBncVBj2kfK621IEGooU8FVwEnP
	raDnnkwsM3zbxhqqoYV5tY0z/jXXsusvv2ZMI3t5P4R6gDLY83Hr4jqe7OIodsUOC1prqW2cdrN
	g2xar1qpPckDccAGa6IClzNIdS7RrH7JsKMQq8OVfDzSrbX80QQmZ+D6Ym5CpxWXa1D8yIxWjZO
	yRi7GimNSaakBB4LIa/YLqhutZfw+f3pdfLU0=
X-Received: by 2002:a05:622a:191f:b0:509:211e:3624 with SMTP id d75a77b69052e-50b147459a3mr71590341cf.4.1773892108977;
        Wed, 18 Mar 2026 20:48:28 -0700 (PDT)
X-Received: by 2002:a05:622a:191f:b0:509:211e:3624 with SMTP id d75a77b69052e-50b147459a3mr71590081cf.4.1773892108505;
        Wed, 18 Mar 2026 20:48:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c79442sm907649e87.70.2026.03.18.20.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:48:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 05:48:19 +0200
Subject: [PATCH v6 2/4] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fd-hdmi-phy-v6-2-cefc08a55470@oss.qualcomm.com>
References: <20260319-fd-hdmi-phy-v6-0-cefc08a55470@oss.qualcomm.com>
In-Reply-To: <20260319-fd-hdmi-phy-v6-0-cefc08a55470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3165;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ouscQfS7cqU8c/8/Fh7An6AeO5MKx3nAag0yIE0xM6c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu3IDDi645peGptL7/F79A71XAhmb6MVeBqCUx
 Bssp3LIXqWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabtyAwAKCRCLPIo+Aiko
 1RkLB/95cspi3AcyS1PADLsVFrzCyg/JkttSiEFW1tZnkZVnuslG2tzA8avFg7mtLAnlq1Gd3UA
 3uIn997wVGIos/XKYO/rSnehYJNNfFg2G6lg6mYKN05p6icobqPm6Tmy7q5C2y2q58aLoKTPlEA
 F+IHvwRc+T7QIk7JIzWUpSDsmYU/7DLcRupggEGXbmAf8McKFBBMYl6JONqQCkbSuWksYMPrJeQ
 lT1I9j8lkxj3jB2oS9tJY3ZMXmyGLzMps4TzZlDVkqgepOQURu3SMnPXKgijYnJvVjlek3HaJMM
 TFABjZlk5a4QYpQLhHrUA/GjZG1gR7uSN8i675OyJ/xcY15S
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bb720e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=_xNQ4P_HJxdd5osA_owA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TmjcrjdQVuJbHwwN8ZKIO-KfbNqwFCUs
X-Proofpoint-GUID: TmjcrjdQVuJbHwwN8ZKIO-KfbNqwFCUs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAyNiBTYWx0ZWRfX86saUSHCHsyw
 HYjYLFqTvMzQ5Lm+zlc/Px3wR2kimclD5T8PRzvYnwxg6vIQ9w1MLud70A9l2JzvnkWCCKjabgW
 GlebUjD01azjEam60SW/3GJxp/MbbKzCkHqUe6cPAIHpYCfXTPlzGtyGE2dgseNT1DMftH9GyLa
 m1ry+wLknHkMxdXxG/Ju7WDILlWWZojx0reIzZfkHRPcULay43EcNUql3mmv9E3rFpWuMN/Kq/d
 VkqU9LSPx6WMqC/EZX66KNQqiOTL5gWfgSbsL5Jr6VAcIMdnMEb1iwbJ9cmky5/Zb/mFCJkSARa
 k/yZgp94tZnnWXy83647artx5WWppotizvkxiSEzvFXB2Wji+ksTJhcYEHc8lYKXSj45vlKRd3V
 F4143bBuuSYgxu8ViB7XUIaV4YdaIiWG7TDYk/Oc9BWWbX73axOL+jJT4p5v9HgWf0cQlJQ0tIa
 I1AFn0Lrl2gqgBgywiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98602-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 366942C5AFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The "uni" PLL is shared between several PHYS: APQ8064's SATA,
MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI. Extract the
common register names to a separate header with the hope of later having
the common code to handle PLL in those PHYs.

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


