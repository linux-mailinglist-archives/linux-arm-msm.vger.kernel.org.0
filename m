Return-Path: <linux-arm-msm+bounces-107414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CqGJjjABGoeNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:17:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C06E538C08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB8F33093BBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC274DBD6F;
	Wed, 13 May 2026 18:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGuYv31N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgdVtD0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CD04DD6F8
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696056; cv=none; b=ZlL8d+JwEsctVNjUiSoo0YTj0dogZNRwKf8BetznJ/v12j3KJf/JiZLl6blOjavHPHJ3WvSPvE5/PNHeV5VlvxF/47icn7LTuwlIK/THoMTQv4CDhAvIT7U5HYqBdGeEOsWcxLHgFy625yvRNghsgYWYt+Qq70Cs0icFrsWlS/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696056; c=relaxed/simple;
	bh=IoIExoNsCI7F0rJKyOfjFp9IzVsJ0t/UC6Pro/GQZyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AfAOeugFtAHGP5d8wG1u6TK46SiQFR0CKnRLM8tKNGb0OqvOfugDsJGDAVD5XncL7dfwQXmNcSj4L0x4Ru25ZfgNwgpMo1BAsYI8Xwu108d8kH7Ko+saHj5jhUsdGMIp8/wgAFcfLLO9t2wOZScmNsqP5dnLQGbYqgaU5kAXByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGuYv31N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgdVtD0c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEd5TU3474786
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/zVPSIIUWKZIXl9Pgp6/Eie1lp8Tnk+2GrtmbNvXeno=; b=OGuYv31NAgMi70jX
	sb07jsqMpvjddqFhCaI9Lsi1KVHPbuyo0+LDz1E1EHLTOnAHNjd5I4c5lRv2rmCT
	SmspIkjRIcAmqDZlHVl13K8sF63vRDPXnAao2YmtSrvz57BR1FkWjo6tMLcewSfr
	v/5DP46+gKZhb26zBSNP/SHAzo/DZM/vGr3OzA52gm1OBUHWVCfuRpjfVYZDqCMS
	LeRuHfRdDVcyMlFksMhlWB0G/hVX/9BEBxaxlYVSYtzsbmPeuMB5XKiP27UT/M57
	mB6xoHXYYWchvzNn3w5/zwyEFZ6vFvhBIlFrUUhUrpzCgdf41pqlsz+a7kFGZJu3
	V2Af6g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p41a7r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95df04c5136so8546890241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696053; x=1779300853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zVPSIIUWKZIXl9Pgp6/Eie1lp8Tnk+2GrtmbNvXeno=;
        b=YgdVtD0corv04eW7SxtS0R2KLwpYXbxSp5jYqJSHNBlsSpQtX0oBRGY720Y5/2IY6P
         HVZ7mU7g5SwniVs8pagPFKTeO01xsMaMQI3Z/tEkKJTjsVBPms1/GgPsGkKJab/qVYqA
         ewFKfVl2SKX6kglMiiSuIf++I2eQjYQ5kQrpDtXWOg34Y/De+BY8nhACqn4OTk7N9U6h
         WWgOHAI8FkbVefAyyeNtSZXhGGm4VDexUK96wnAQyGwxF+itEzypsmbRctc0k+uMLvUI
         +PDCBId62/lA7zFDv2PNoDQEPLUP2yDVjTP3TEIxUmf19tJQ+pk8CoWy0EgcA7FtULIw
         soOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696053; x=1779300853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/zVPSIIUWKZIXl9Pgp6/Eie1lp8Tnk+2GrtmbNvXeno=;
        b=hxF4lH1m64QklSL9B12FemdEnzEAa58h7HylW0RLsIYj4HGPkR3uS0sQMpINnO60kk
         Et33ml0yFLvgKh5HcDaT913Q2T8WLUuSCDbmUEdlsQ2RUTZFXaUzpEhn5YbYphiAosSE
         MG26+DMkLNFfuybfyAKt3D8Au9tvVzhPsl5pD35X14JOt8MOAtlgdgBVPuhxwfJQ1GGx
         g/Fq2+JfPjTpFWyiJ1Oihm50IZrq4SqEb/nWFI1aH3tpauTD3wGU4dpfpLpNyJzwRhaE
         di8QFZisgXI/KILg5etQmEFRnYnJZm9SX5FFzkss61cGIeBl2+izy+kMddV7VWQ2xcs0
         gx7A==
X-Forwarded-Encrypted: i=1; AFNElJ+7DWybF9aNg00oibYWiUA4pB4QiZCLd6a1oZhLsUHsXmBAGqDbMZq2neiPEAMPnefci0i/EYCiC5O1Yh/l@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJEx0XS2nNojvtSY48/cwvGy6ByUF/XvAm2uakhroWk5txrYS
	bDo5e7dr9298Vnw+N3Jgq5LX8dCPEy1f6W9Oupafi/IadLeJZphgifkfoCkAX7NtF7H94DdVX9n
	9/m9NFQY7rGkNw/kT2TgbpQ4qxmeV18+E07MtSHvLtKkkZr/Lz1j62lrTeLmsKnvF25tHq6upRy
	SL
X-Gm-Gg: Acq92OFboRqkkesjdaDEK+qG0Zy8wMOeMjtZyxF0s7q/8evIjVggHGACT5HXNHhnpym
	3sgLa0hU2tke6p/vk8gfSnXCCGgLMtTDKhgfJMsxRV7BolvrjVWKPD9HE95ZeCn+xlgrFrllfR3
	3SUx0GFS88S9C9H8qB0nH85bQYlwWFAuxHF7bMdoQ/gRCNS2y3l99iJeMjBbW1rpnmdsHfLHLiR
	1US5apYMckBMacZCS+Y9q+qb8eYCp8FQnhiUAnD2YbTvHzK7gX8//Olc08k2LLAQr0qz/SG+pd4
	jvu3YrlUpK7XICHNUXNdezd+8wt65ZtHyHB0+q3Ff88Eda4SHVD846xM68RehLp9vmClsbw3LwL
	p5+xscaVGjpS/XMFHCsO63DswOL7EK8JGYXh2hO8KRrJOO+pBVAl+Uyz+oOqx9iKmJvB/ruzUhh
	/e5FvL68pN0BjimlHeU277OWp/oNKICi4uYG4=
X-Received: by 2002:a05:6102:3581:b0:631:4e9a:ba3 with SMTP id ada2fe7eead31-63775d35309mr2383180137.21.1778696052932;
        Wed, 13 May 2026 11:14:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3581:b0:631:4e9a:ba3 with SMTP id ada2fe7eead31-63775d35309mr2383166137.21.1778696052465;
        Wed, 13 May 2026 11:14:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bd7d8974sm3174770e87.64.2026.05.13.11.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:14:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:14:06 +0300
Subject: [PATCH v9 3/5] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-fd-hdmi-phy-v9-3-ca98c72f1f9f@oss.qualcomm.com>
References: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
In-Reply-To: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3408;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HsnaYsV5sY0OkAw5eu/o4daj/nHtfAshF8JWidON18Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBL9tjLrY83UXLmEunVYGYLAM+Hg0YNzJYpfrq
 96k9e4FlDeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagS/bQAKCRCLPIo+Aiko
 1VZzB/9B2E/N1NfXzdEpQOpWpJYaqJ4JY4cFaruTvIQuvIIOydYHm/rnl4TPJ+Dzk0xu/XU3C4h
 kgKr8ffT+PaJ2nzpHU8ccDCD+GVLpY1N6+UhPNRcLQ0DLgSG/9kMZXe1G80EGO4+gAOjaMEhP3I
 Zo1w635FY2rocR/XSEOL26z9fv68ZtKLRKQQ2QBfwqnQbGO7y/mtKRsECKPdiSF7kJLXBfQi1lU
 yCz5JUFTY+s6XL/VHZUk5S+4CZ9VD6kqhjXKFwWNBXmjORys4v87YpGQxsPceXilHESDLF9BdMP
 ob7h0vrDH5CXPlsNO5fzEnWbqwbpnUn8u90DPvj5SzPxgdxQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04bf75 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=_xNQ4P_HJxdd5osA_owA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MiBTYWx0ZWRfX3YKvoJt2jNpq
 fa7dQFMYKXC2CtFNVOj6XFjKKTJQNjOJsxjbCRZLxUNZByE6+/NUX34Myosfv4yj35eh7bPrj+n
 /5g64R138oBEOoVRzbCzhDv83ibtjUIxCbeITnBKaM0jk0YZ6LwO96fXcy5hU1fN+yam2lQruzX
 raA5Jn8lAavnJPFChkJPhddQKycGYNjWm1RTYWBYn8M9c/rRWvu5iKUhsDhN5T1PTAkXMPpm19N
 iyuf8PhwXwB12qHIHfMCjNAcDYvIaVMasbdPqET+eCU3OzCMpE0bAi1efLRygCuruSfno7aGion
 nWiZj34VFoNjS40Gt9fkbhCOrF6ZdybAf3eDO5xyooRjt3Mb1jPCt/235MjIgHO6DOROFm0C4j3
 Wh9Wx6a9KibrGntV4g/qay8N2C5JIh0I/qhyFUynpMZGFaXJoMj5zmACx6PfYiEJjaDfQjJeEDI
 u1p9rsYGe9nUyJ5EJNg==
X-Proofpoint-GUID: Lw30Uthm_WzRiBYXX31ftIPyHQI-x_fx
X-Proofpoint-ORIG-GUID: Lw30Uthm_WzRiBYXX31ftIPyHQI-x_fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130182
X-Rspamd-Queue-Id: 1C06E538C08
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107414-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
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
X-Rspamd-Action: no action

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The "uni" PLL is shared between several PHYS: APQ8064's SATA,
MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI. Extract the
common register names to a separate header with the hope of later having
the common code to handle PLL in those PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 24 +-------------------
 drivers/phy/qualcomm/phy-qcom-uniphy.h       | 33 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index cae290a6e19f..52f180e0cfb4 100644
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
@@ -58,7 +37,6 @@
 #define SATA_PHY_TX_IMCAL_STAT		0x1E4
 #define SATA_PHY_RX_IMCAL_STAT		0x1E8
 
-#define UNIPHY_PLL_LOCK		BIT(0)
 #define SATA_PHY_TX_CAL		BIT(0)
 #define SATA_PHY_RX_CAL		BIT(0)
 
diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
new file mode 100644
index 000000000000..5f18f9593cda
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
@@ -0,0 +1,33 @@
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
+#define UNIPHY_PLL_LOCK				BIT(0)
+
+#endif

-- 
2.47.3


