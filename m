Return-Path: <linux-arm-msm+bounces-99434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FJeGUrGwWlTWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:01:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDA02FEB77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECC4A30C11C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4445E384234;
	Mon, 23 Mar 2026 22:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvEsgamH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMs8MKQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D1A37FF66
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306613; cv=none; b=kuktuWC7GgaQS2Uc8vh/FT5DlI8e4nRxZjsOroS6Fmgqt+i4CAp/aop0qfxYvDkbYaPQD2YwHfza3jD2usGAFbaUdTAlz82ddWWdjHFugQY+bbQxzhNLMgxjRvpZPCpHc5e8hSoOXaxRE2CT4hQ+enI5zai1mW6WbaQQANWA1rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306613; c=relaxed/simple;
	bh=DvPJs4paEzKp90KWrdtN4xdrXL6yB+AnGKH2S8yofHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EftrZe6W8XGCPtVDEKErz76/qAew/GGWXU1Fy8oVNudQLTiTqFfg8QptJiPXk6qKjCdO+YOug9GDD1iUIn96DakZorDpX6XpSdA3fpL0Ebb85omGk0i+iLvFg4H4ZtcJetfvvD4w01kwXF1vL/V805shq4LrgNCORxZ1V3XyE0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvEsgamH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMs8MKQg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqVIf943490
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omnRmyUQg5dIWgAiljjvcZxQHMNx7Y0vRQtYTvOpk/4=; b=TvEsgamHgDw38zJB
	hrRkgc6tquHZaQWijZjf3jQiRxOtZ9RO28qBGDQ3ZjNtgDXLz+cGbe2sfdarjJ2y
	E2pI7O5vT9m4XAZB7xu0ToQ+BaBVg047SK4bDGKi4yL+5+skDP6dEkPxPqmq103o
	Q49U7AiGKHft6rr5L2ltwrvhnf0BE1Rri4Okgt5w7UM59UamHRFIvhmcXWFRO/G2
	sat+Jq+cRUwokanmNkguXL1Z9dqcBwmBWOCTwHv4VrtE5FXPpWntjUpUgjDeprwg
	zth/NW/0THE1qFjBK2YzEOuXEpgtocpvKlDFPHqjri1+4RFCakWsXHgZy8fy5pny
	Vxun5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkt6kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:56:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso39331171cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774306610; x=1774911410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omnRmyUQg5dIWgAiljjvcZxQHMNx7Y0vRQtYTvOpk/4=;
        b=hMs8MKQgUL3j5p0opNZiT77xuYBwix9t3sEnl6FpC5g8oVHBbPqo0Wnk7D4Xe/uQZp
         IUsuY++aihStvJ8RhgsDQV9WKoiWh0apWX6KeJSYEVBM9w61umuHB255wMWNnGjbZAZH
         7g4mFYWskmYzPJ663DkKGFSS4yUatn6dKy7lEVlN8UUPmUEQIOa3X15Z5U/BQ2BgCHGp
         NOUx3tJLE7PXYL+465Pqf+7ktUUPzG/53zNhJmuSWbcAvYZDkYEtzzr/uXSC7J2DFaDE
         w602zl3SZwnshQfGBlSdV3WlESpzWGPGG8jG1oUe3/+hDv1TWvXH0PP+35/3Pi/gvcCE
         Vr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306610; x=1774911410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=omnRmyUQg5dIWgAiljjvcZxQHMNx7Y0vRQtYTvOpk/4=;
        b=PzK/nPOcusKmjLZVGV2TXJdIuFLABlKFsrFAPO8lf03097K8qbVPAEJzimgxjkrM8R
         8c5Holbjy5QTyiZzcqYDRG1YJ9O6Rk1rXDIJ99qnMKk44H2ZcAA1aC8kyjc4xL5xD0my
         OxzfvOC2RJT1qPKFYs+IqLKjVzGlJeOxrQHb+oTZsMqPRNU9lzIZ0ylYU/ntp3op8p9p
         KPUJ3+tX/TE0cZzW2Ac62GFL32J9mQfJ5z+FfkrbqLe6PqinabSsv1YvwnaFYU1ENhK9
         wTair8aXlH8G1pdHDpqr0iS+4EBnQTegxfRE1YnD2xzeF0mV0xqIN8EZO3WhOGlrLem4
         1FBw==
X-Forwarded-Encrypted: i=1; AJvYcCU2QxpDjgnpVfd5vd/HUD+aeYR4jhdYhDGvuyXrP5XerohKQ6oFPMxvEm5PlSTV8p01cIslvNKKyV72Hxky@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbr2stWqUSbcSzUvzUEcocSRoBTLHd9FEQ+0ofPWVeVTdS0yIH
	qhU3Blo34GJFsc7eaBYAbwNGEvzdYNSSN+B6BLA3GodkV6tbOBQ5V5oTN1hVeZuVFE9Ec7X/lDO
	r4pzfB8VY7n48C++zKtAnT9Zh91h50wDS3Oup5iLVGXMFoMWxB0zZcA67mIB80wlY2XjNgbwr8i
	E1
X-Gm-Gg: ATEYQzwV56OJBzP1JeYf5lMwk7uD8rHo/x8B9WzRltv2K/bpj7NjuZXCI+hjR337/Wu
	0/bcTzAAGRfuLRnbcq+hrJKAkECgwcwDBCQpWUIdWtTDMcY4CAcOV7g+aNZvGzU1gQ8s2/Lz9aO
	2XXlsPjLicZtfVbwACNqMCW3eCXFRjTl9A7IkTk8EM1cS6UQUQMwhxn66c8lnw0ahCRAFuEiVDG
	/XegBNEJCOmcoYDNZ+3cquQRrtG5nCqdPMIOJ8W1Rpy2c8fqBJrfLNtScGTkTPc7Cus3FgHyujh
	iKoOYc4W93LSzS76XsmKvW2L4xl5utNrw0YaL89qtvyd9PqsIyM1roeEQSxxUQxENkwzDXgTj8u
	/SQZHWuHC0zD3osKTk+sUmu55gCoLq9OqwWHbi1J6cRH8sNrQPR1t3dxEwFXfAGfgZRQ5LsFlUZ
	okK5LpCGIl7nJwfT710ikHyHO6dxGKPw7ZX0Q=
X-Received: by 2002:a05:622a:480f:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50b3d9f3a40mr216687951cf.44.1774306610112;
        Mon, 23 Mar 2026 15:56:50 -0700 (PDT)
X-Received: by 2002:a05:622a:480f:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50b3d9f3a40mr216687601cf.44.1774306609661;
        Mon, 23 Mar 2026 15:56:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2963fa304sm156489e87.27.2026.03.23.15.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:56:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 00:56:35 +0200
Subject: [PATCH v7 2/4] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-fd-hdmi-phy-v7-2-b41dde8d83b8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3165;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ouscQfS7cqU8c/8/Fh7An6AeO5MKx3nAag0yIE0xM6c=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+bBo2pJwa6LfvUzxd9IeFTd6NSv7/Nu2v0F0939LSztZ
 b+Xu//pZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEFF9wMEw5syHQdV2j8wzx
 VnnJ/3f8FnnmJAYITdkl9/HRD9GIN0+C2pvkFH5W3u66XluleTRV3/+RQF2WSIlniPux4BusjwQ
 DmvbcDv6YeNzq2JNzqz/JfjJ3/3tNbnNMb3SU3oLzquf0hcq1TxgXf76+ZVuHfsk1Rkdn04qgzU
 l5h/Rb/X5+51Sa5sSRrhk/S8Dp793Zq7USIzc8V1h7pIxPfesPH0U5zSfeElGnot8+lRO/93Fdz
 1T7bVLiQmvY81RZu5jbjt6bE1Nu92br9Gqnud8M6/8X7PVk2aw89Xkj8+93Fnneuu//ZtRet8p/
 286VEco2qXdHd3bvf9NfDRza5i0b1x98NYnpsuwyg+AoAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2OSBTYWx0ZWRfX5oL1xT/8qFx+
 LmwV06ffak33JAS0W7MTO7EbJSjFeiu+ChSMVlROQZL0w2kXoRZALmTIIqe9M7qQ8l/aAsET5Lg
 vLXz5KwhhNFrq4L4ft4disUTxVAHqbVCWdSzj6Ex4nr1gCcLOt3LycKgsmHX6cG/DlasSe3zrZY
 nerSx9I/Est8FWtYeKD4a2ExIRAQpdksQC8mVaXwF3cudJEnqX28Uq8gyB6EJfhT2/LgsA3rZaE
 pcps7jtcdXrnfFWUUOG+YX2eNCD0aXBCgOT082Nd9U3rwvYwi808ifdZ8oiMMH5XQyK/hGiEAvN
 jFTFbLHEHSuLR3wx7jB9OY1eON+ESkuVQzvLX2HjIe302fmc0tCbEa62/ifu123mPMLlke5ubZZ
 2vmQtlXJApDTFEAog3bZ7VS4rDxtg9EmqwJaoPM/YL+PnWo4sERdfzeaD045+B3sVa1FeuwcRHR
 JK9v0slc65O7J3ad4TA==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c1c532 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=_xNQ4P_HJxdd5osA_owA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -8J4Y4Nw8qzdj4V8z29qBatuBahmStuQ
X-Proofpoint-ORIG-GUID: -8J4Y4Nw8qzdj4V8z29qBatuBahmStuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
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
	TAGGED_FROM(0.00)[bounces-99434-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
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
X-Rspamd-Queue-Id: BFDA02FEB77
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


