Return-Path: <linux-arm-msm+bounces-75727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2563BB1EF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 00:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E1C72A5B9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 22:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D6C313E21;
	Wed,  1 Oct 2025 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzHbIRzT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A891313D75
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 22:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356355; cv=none; b=j+x4n5MrEN+modVYkiH3yvd2UN2Rj1LUxjsdYlPdGrC1gI2g1H96GNAMSoxva2OfXGKKDuRnq+3QCVAEEFni3bteIiuba4Yx/X/5bZLkrOCNGSaVzOY77sKvfAoGci+CsSncXxk+OHHwnXp1/1erg99DL5acmL9XTqBg7SiiaEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356355; c=relaxed/simple;
	bh=wwAOX22I0FMwc3Zh3TmwOoD6CIPx68eD+c21Q+iR4lk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F8tfu0n3bLCKJTtUYafefVlC40wwX1Qbh83AH7uXrMHCBmKkg27gWPsB9AJuKRUl9T4be6DABi2YsuON+kTzj9nlnUgCn62oCpDfbdeStxrbKH6p390KctA04kFSmtmRE0+L5hvWzPSU3QHCkFOcxB7NC4fIlO5h1nyKcYSzIys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzHbIRzT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ibvh7031946
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 22:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fV/4QT0VA9Y
	jNuWz+QmsYOyq2W7XTcB2wF0sRRRIIRY=; b=MzHbIRzTXcx0eDmkqISGNJMbVyY
	hTBgZTG7esS5c45IStBAEl3hkYcHKJk3gsznEEvUfhh2m0WCEUmoz2tAcLcWKkC+
	wcrR6u+noOJrNi0nraDv/acNAjVFFoIqiUgncMkKf3PJsTgEt2eDpuvixoXUUssh
	ZcpNJ/hkrlpp1ff8EQ3/d4WZ3kGQBGK5J0ddjCdUn63bRB/txEs3qhTMI49RpuMq
	Ud0VUHd9dVt/6YAUPiKVFMZRrvThXn8fmzlCDoGI1994JD7rQoBt5toyKyNDOXsw
	gf1DVUeKpPq/Izwgmusi1psKBhNa1GaAhRQ5GiBnNu7/nD2OCc8KkO3WCKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5x46k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 22:05:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so354230a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 15:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356351; x=1759961151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV/4QT0VA9YjNuWz+QmsYOyq2W7XTcB2wF0sRRRIIRY=;
        b=aMfr5bYNuMwmmC+yX8GHrhYbK6PpAqogwS4O9LmPYLdiGlLW6tj1dxjTMo8Zi8duE0
         aXdePFjPQRa20Bf9mg+Laq/fLpl9XBQCj8Ix4njyYEHdfQAoMmLCYTLiNWm4kk2r7qDC
         gAb71Y3K34rTkFPxqdwwsYta+5D7I8vPvYQAvCvxenj3HflcByspAVoh37Y2cideDaXL
         SZySxAzdF7SQS5wsGAi6ac4zviLataMjK+8rFVxbJ9kt21N1P5tklBWv7YH3F1y01dfc
         MgxgHFzalU/zhlzF75pj8jGqX+y0gPlRahF4u8wtiAmkiy4cePcMD3gy/rpNYo5ZhaJ+
         BqbA==
X-Gm-Message-State: AOJu0Yw1VMrjKXgwVS7QTX0svYw8779bIpjusAbGW0fXfuwxeEgywXDL
	7x2K7mxpsmb4O69Pjl4iN75ceqdSr1kqYs8ouRlj5VnczejreCOl6nTxyT146xx8/2lg4RaO7ix
	xtza4fFaHLOOQNE9xdQ2nlegohVdWiQIWhelje9XzmnHmG+ggf9EfBZJ+FEkP5degnglJ
X-Gm-Gg: ASbGnctA7ob1wm738stRM4pQ2/UtW2hY89pldS+KQN684koYMfJSnrSn2joPZ4wTRzD
	wJGccb3V+lEJaU/RwyacvGx1DdqW9Pa+WGRvxN6/bZVn+2EkFwHjU7zOJtSkZ+w2yG00RAP9fHl
	akSFhbpJO9Co1C+OGejh7GChYgfkie/AjQ3G7G38M3MapovqKOqHAXvZ1SKP+xr39BJZ/1aWOqe
	PNErZ411+999XAAJxQczH3Z4J8clYf+YdnX7FDmBEI+0GGdSTxZ3vZrZML63U2by4HTekBGj61K
	by1IYWyW+2smEvXDVV46Cckj9WuQlbl3l+c+JflXAqF2H1jyeX11Kp8qIt+z2jnVw92DbpMYS3q
	x5p1dOuz6Uj6Qc42ANEAymA==
X-Received: by 2002:a17:90b:3511:b0:32e:51dd:46dd with SMTP id 98e67ed59e1d1-339a6e97a92mr6634313a91.16.1759356350774;
        Wed, 01 Oct 2025 15:05:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmr7R5I47BoSxuFE5aidJ6MkJoBIZ2dG5PdBMeCR3hmk/q1hEeSZK08XFxZ/maDOfJEkItaw==
X-Received: by 2002:a17:90b:3511:b0:32e:51dd:46dd with SMTP id 98e67ed59e1d1-339a6e97a92mr6634278a91.16.1759356350296;
        Wed, 01 Oct 2025 15:05:50 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:49 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 09/10] phy: qualcomm: m31-eusb2: Make clkref an optional resource
Date: Wed,  1 Oct 2025 15:05:33 -0700
Message-Id: <20251001220534.3166401-10-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AhWUlxrlFyT8aVD0tvuYLwmVMNG7Zqnr
X-Proofpoint-ORIG-GUID: AhWUlxrlFyT8aVD0tvuYLwmVMNG7Zqnr
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dda5c0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=8inbgvmG2iPteTk8MkMA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX2VRz8LPZ7+2b
 DGg8olg6RlrMz6js2rt70w1YWdLxIQmVu2+TFs46MXQvXVwAhx1nCdygT1RsAGhOjc27eNPPdlO
 wMTrx6Jx7whzwr+kzGFbNnf5f6SHXdTTikt2X36no99qU0tSkGXuGws9MJXRmB1jk17DDifTNcw
 XHesISRCZpb3fsFnO0K+AD6JHH53Em4rymNeBdZIVAEK3xuq5DqwcnQuqu/HRz0RzNVE+OmO/LH
 bS+vQVY2PQIEGnuNNmCDMOm6ixa20WGhxiimxDZ6X+XNyCfZRVFY/7aroEHxfj2gkh7f8fQ5iva
 UsSEApazuPmwYkTMUC+RyWeb/wls82hsNVitCTZf/8neVxvzl3QqHvCjL2PATQG9dE/sKEos6pP
 Px//mCQlWrqsfcrI9TfPAhpll8MZ6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.
One example is the Glymur platform, which contains 4 USB controllers that
all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
and secondary controllers do not require a clkref resource.  Due to this,
mark this as an optional clock.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 95cd3175926d..f8a00962f937 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -267,7 +267,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->reset))
 		return PTR_ERR(phy->reset);
 
-	phy->clk = devm_clk_get(dev, NULL);
+	phy->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(phy->clk))
 		return dev_err_probe(dev, PTR_ERR(phy->clk),
 				     "failed to get clk\n");

