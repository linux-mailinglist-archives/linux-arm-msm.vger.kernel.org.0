Return-Path: <linux-arm-msm+bounces-101225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGokB8OTzGmbUAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:40:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CA3747B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE8DE3070485
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2776E30DD2A;
	Wed,  1 Apr 2026 03:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pElYl/Hc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6pCcuh5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25A137F00D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775014747; cv=none; b=uSK0JZqlqXv1CDwOXNGAVrIE0QpP73cT1iC+Iz8IfRheL8HZWhJcvdvlCX19KeZyX2YEoTvMFEwqf1nB9x5SrVyQ4BkfpxSgjNB32/cm76/gonGIRYXSWN7aRB8lTRi2ysn+4NUjh9x8sXy/e+SYZra8msRJB4tZmS8gHmpOa5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775014747; c=relaxed/simple;
	bh=DvPJs4paEzKp90KWrdtN4xdrXL6yB+AnGKH2S8yofHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIw0rqopQ8jIvkpa0T3aIjpHa2IHXUhA9/vsC8U1MIdm/NfulgBsvnMNd5K0+iLjMqX9cBCspdFOGTVHYh9V/BnjombWyoPucyhz44j2JyWE7OCt2wfn7n5qTh6xYAwz1gDnLK2vU8K2HpD/13inGhRkxQrnmZAlT+wj4Rcl+bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pElYl/Hc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6pCcuh5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6310Baog639203
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 03:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omnRmyUQg5dIWgAiljjvcZxQHMNx7Y0vRQtYTvOpk/4=; b=pElYl/Hc3H1CCT8y
	mZ3LDc/acK820bG1wLb5+OAoRCygFovt+Nrpq5KmiMEGut/832L16uQDnOgYfut0
	HpYS8Rk8+bpSAMWdtTXRU0s33DiBdWlGFPgMwnL0ima3tyL+yUyxATRlxHAIz/iT
	7NNVtS7YEvoFfwmB5YTKDVHIdpxX0pdT1rPy0nlY5uFMf7kNJ8qWRk8CC0WQclrC
	V9RkLm8IUi5AD/vvwRcRmJoSLvuRtD22h7Yppc6B+a5woapNNrmISwth1KcfytXm
	drx9/E7eGX5Wcmm/JkjclzSxGt0rUbyRa86uhdPUulikphdiMFt/q3wFqfoXxNaU
	weofqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2au35p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:39:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b317c40acso60967871cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775014744; x=1775619544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omnRmyUQg5dIWgAiljjvcZxQHMNx7Y0vRQtYTvOpk/4=;
        b=b6pCcuh5Vk5F0p0H1nGvaJq/FA3fUKeJ1+z0aH5sflKsGgR6wrV462EM5J94o9OnYy
         iuacUw7W8QmJWLMFcjTV8xKWnlfuR11u1be8jvprg6HbdQorNoypMJqVgq5v1ff9WWVZ
         /WxpWLuLCTlf85dH8qdipx5Qwf+YJT1kPUoNY9Gj5kpmo54Fc0KQm/U6zS5BjGOOFiT2
         +RxU8sXtw0Oow/HjcQQlkfr3svMKdJB92amP4OWNhJhus/SWR6QJ1XUV+8hgWdPYwKRd
         SmdZl9iJWVpR1ALemvjZqk/L14suDoS3aOF3mOGkncnn0T1RgIbq+KW/cESEqJ1D6gxI
         ht2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775014744; x=1775619544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=omnRmyUQg5dIWgAiljjvcZxQHMNx7Y0vRQtYTvOpk/4=;
        b=dmbOxQtR4tIUZbFqXKUwZCCgmbQspkBXqOFmmBvu7HSKq2eI7awa0RX5BeRLvKAtly
         VUmoQV2IGu4fhSRfAJJ5APCBWpb5YbG38jjF7inrfJO82WFHixRaOxSuf7EnYr/Vq60r
         ZI4iYXC9BTSd2T6efWytbKl+TkDcIewTr34/L6Am3HLvQz6nCQIrQAy8O8qBQJ0xq7ud
         sTdmoKVrkM5i9zSuIynMXP/X7ercBdztMuiVk22L2u6Hru1Fd5eODzw1ctsxQjpl/Ag2
         XrVIF0SnGBvllMIAciOO4y3lXVZnR3RVvHi/8YsqXoxFYs9sci8D1FMX3YfWVYWlP1na
         uRcw==
X-Forwarded-Encrypted: i=1; AJvYcCXcnOdAJH+KPy4KQlpbrl5/lZIAWtKQ+LEprBUoPQH/jepGfZIXUCEA+g02TEVV75Kc8xO6ukp43lI5i8Nv@vger.kernel.org
X-Gm-Message-State: AOJu0YzUcUr7CGNa2wXyxwzjYqTZBMbzT5l0YRZBp4dSFvFNEPP4qyBp
	8EEajJYpfE+oBZKmx4lxKjStWXdKCmSdgh0FiMqdqpIDjI3Z+POBFyE6Pc89yvNVegeymcO+XaJ
	Z57MF3WH4+j2Tb0VGT+hNPXxOLl88ZEE16lotW8gJZPTWPXBZYyVB8hAQ/47xK7/ItA7M
X-Gm-Gg: ATEYQzyFIabSkZJ3J5a+QiOqouc6r7x8da3wM7Qnsg2xOz1fhTSII2+oXvP30erSh2x
	CKslQoLbudnQRqsX6YRhkIm5o403NBW1g6eA3xwVoBkz55fYB8HMydIHi4dtvtZzx35E9dAcBTI
	4SjwqA3STk29c0Iqkh6+gl24Zw/cCU3qXkEpqlK28BnQYJZT+F5RKU+Otf5+hhkKMLvNaEYVwAl
	8n8Kh63fvqZNgBRbcrpF4buwTa27SueedFbbkENv2l8VJ1clM+QGKaT/Nhu6qiNFjQBhX1eSGXn
	Y6mI4ApPz6xbNgLeeQ/N7PTd6y5i5HUL6vEB1qdqDiEV/7PR8HJy2Wa7KV9vnD0nsC2phDw/072
	pQRNpQ+Nc/2cBw6lJSvtUdLrTVXuT9iFzZ5lFF8Z2hW0ZvMQAY8xTAGJX5fAc6GF34N0IarRYfk
	Zb6Zwz3GdxL8gIJ8CI6qiK8fOlx/ZWAxwNnuE=
X-Received: by 2002:a05:622a:208:b0:50b:3e64:9b2a with SMTP id d75a77b69052e-50d3bbba0e5mr30945711cf.20.1775014744015;
        Tue, 31 Mar 2026 20:39:04 -0700 (PDT)
X-Received: by 2002:a05:622a:208:b0:50b:3e64:9b2a with SMTP id d75a77b69052e-50d3bbba0e5mr30945391cf.20.1775014743505;
        Tue, 31 Mar 2026 20:39:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83730f7csm24404851fa.16.2026.03.31.20.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:39:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 06:38:47 +0300
Subject: [PATCH v8 2/4] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-fd-hdmi-phy-v8-2-51b0e98edf6c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3165;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ouscQfS7cqU8c/8/Fh7An6AeO5MKx3nAag0yIE0xM6c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzJNLmOEeHDlMQsEi8WfV2M/FU+7jv6unYshVp
 BRBShnAhbeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacyTSwAKCRCLPIo+Aiko
 1WXBB/0YQwCQumGtJGpmrCgUNvTNsMRnD8+VpK4wTT4nxIRaWiJmMASu4yQFBjrJLDlFTRmeM1E
 FmF19X7t3V+1yLDgx4SQ8pBLXFRTzph7z1R7CUgKDizPxyowFBwNBpMivdXhuYCQgidC/ykiA8W
 PGyqv9YPnSwC5MCSij2RAADe8Z+jWFXLNJH7YsADl5ukdE1+QYZbPo+8i/XKWTPROuM8HYf1vyl
 iKla8x0FpYpg28/JCXnoOktQwMggiYPTk4tU/GU0ewQ2YTpBQ9uSU+ztMJkXGrqaQeTIEL/k+EE
 4k+DNJmwRkT5lpkiDn+3qHtlJ13eDT8Pi5ZGsGCTSqsIw52O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNiBTYWx0ZWRfXwp5wGQBT/2AR
 ougGpbNvuXeW/qMfKe+fjtTQC1YCTzFL2sWkvCVJA0jRwecPCvSkB9vX84RmkGNpDE7U7fDlJpc
 zBPx7aE5TNZfPa/xD0FBrLW9yg8I6IHP9rBR1rrbntFtGcm4T8D/+FmxTnbkGPu9PyrkU7+nZ87
 49CqtkmX8umrqlI03U/AtjXV1tiQGCpqat87Q6iQcYcrFcYQTfBfsQ1TNO1ro3tBAymDAGJXcMb
 1G+/2sofS1Tj4Mb5kSxJgLmf7YeG6zptmGXA/4pOuYoRakV/qk4Ak2QBffuZP2o1Fm5eDTjWgfV
 OC+cDh8nle6WcDWRW36XnXNeZCyEtOKlbzW8jyjBcv+66/A3BYr5h39jD21ZcU0zSFweyv9Bpra
 lZBceJjB6Re5Y+bTufziYTNuz8vdIiDBcPBdVQCgAl47g/RyDlIxP5YwcXKGRrdt39joko0Wp0H
 fAwdAglZxYM3lwPQa1Q==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69cc9359 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=_xNQ4P_HJxdd5osA_owA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CCUyvBEJtqcTL0ZYML2H9LakMXnR1OsT
X-Proofpoint-ORIG-GUID: CCUyvBEJtqcTL0ZYML2H9LakMXnR1OsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101225-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 876CA3747B1
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


