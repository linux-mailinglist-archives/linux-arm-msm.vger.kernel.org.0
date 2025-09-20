Return-Path: <linux-arm-msm+bounces-74270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B5B8BE34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 05:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D69B31BC813D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EC9248878;
	Sat, 20 Sep 2025 03:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISlggu6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E23244679
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338490; cv=none; b=qE/ruJrNoHGfV+PPteKwa4BQ7KtLwWNBo1Dx9d4SLyAuEqWFb7pnYCF/yA3Oxf7Kf//kYzJXkXU0YW+4djhh+YI2qdFcMnudE8fpD24ZdR4pxv6JUrcFpYow7FqvLMVJPZSdTgruRtrbcoaPo6WY2PzDPkJXyG0Gf/ReRyfvtck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338490; c=relaxed/simple;
	bh=Ftt/PftF28xTllTsZoRGsGveRUaR2bB0qq13ptSWTkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KPrUzUiHN9LoMT0cyxOCslzPepUKdnLQuYeZCflMOfCkmCrV05LOz3wc7x9oaawXBDX+CHrNeVH0gLtJGpdMzefISlXjMzREAkbVmoavWJV5wXqOAVdRMQ1ET5i9NphbJz4wGOGmQN1elWBXbDZK7iVjQ6dTPNQEhWJ8wCB6JpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISlggu6M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3GAOV006554
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kuxKL1PStAu
	Jvwvz2BevRvoak3D7tba15DUzjzxEF+c=; b=ISlggu6MdmJwRtUsXG3GMk/se0O
	tAYwmI438qLshGkuxDTl+CcYaiYGvRjbybK7wZdkWxNhJ/VfzFyME9XYEN/wdxYY
	YNmcD1OpM6ETsSZwXSO3ui7AEcXsIEHTFBBw5XXWK52moZfV2aPp6FGPu7RO0TkW
	ad4t5bxL78cmTlDTyHvQq6HRVk2rBRqHubnNG2XW0iBp3L+60/chun5trfCQ91uV
	FjhqvPdQUlTydnpvDQA/Cj2etFmmMBYKavfWUMkKQlY7hxcV8Vdu7Dq6GIPwYvgG
	odo22MiEfCnsrJbTbi1MejVfM/Dq2RBxjuIOEyUG5mkBGJaoQeOKdwWJi1Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhg22m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7725c995dd0so2642477b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338486; x=1758943286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuxKL1PStAuJvwvz2BevRvoak3D7tba15DUzjzxEF+c=;
        b=QzweUu2MdvyiCZtew5LL9N9FM+FbIkl1IkznqkPwvsFbVnw+g8UyW7mGAJyIygRGWJ
         tJ1hTim0pnowLH5HoJX1Pic56QQiD/Ox1tsUYwbDF5cCS3RqYEzMdeIasyh4VcBLTIw9
         uAtqjsY45Xsk2JIzp2GoHgqF43lYLr/1A/X8Ts0PxwSRQcflJDhps+u3i2sMZAPNXciW
         akjmIYeK7NYv1V2vfHGC4QnxSi+QUjI//j73s+iJXdpq9RQiGE4EmGVbJD7Q0K6f21/6
         x44e/GZoJbaHJkGWiFiIcNoKKKeCOSHgDFrQJhyXaXIynUZqpViBxdCfxLM1LHc5HUWg
         2fsw==
X-Forwarded-Encrypted: i=1; AJvYcCW2cRL2VD7tOhGJUZC43WlhyLStKLk5QvMzJ7XV5oKKnpQmnrppDSGfpxSHg+L+Oh3Rc/U95HSSI+bUZTh4@vger.kernel.org
X-Gm-Message-State: AOJu0YxHMdQNQqndlhoVp/vkVhhPH+XNkQXV6Vrrew5isPUUQ3tKpS8G
	Vy7WshONpmEgu4s0zhGV1Yz+pN72lu4RQjnSCFMVqSkGDEMGq4Y4CjoV+4cGBifUbY9M8TQdSmv
	XkhP1lMjjcp8CBAhLehcChOktMt5rKkShG7Y0GjC2WWBSfiz+sh4stJmi7ChTOvT+D1Gn
X-Gm-Gg: ASbGncsot9L8NA8kpCdfz8wGNnLoSZY72mlThhKZZnOQrn2zv4345B5pxaCiDm0RtZK
	rfLiSDEHT4Gl5jkGlBwQ95wV/+HFEVtMHIt9TxX8qjiRiSzGE4PwqeKGs+A8ReEC1yr9w2NDnnk
	smE01XVYXEM9LJcgo5oxMRsV29wMpwhvu1vIfJCXRDSaeDsbK4ee51OTLE5sFewa5JuwUit4E1c
	IjfzaOkFPycnda1OBR+oJoo0g6IUwBPSuwyp8v16QEtoGn59HZqDMbl65YRSK9VoUOHcehUmwJq
	vnsD5pMy5GEWL3NWOLXkOKpqzRsDYQfL71rLJfThq4sVcQ86lWBWj8169Q9SGN3rjYB21Pmp4G8
	9dMEUQC6LvwjAw2pI
X-Received: by 2002:a05:6a20:19a3:b0:24c:c33e:8df0 with SMTP id adf61e73a8af0-292727771abmr6193881637.45.1758338485854;
        Fri, 19 Sep 2025 20:21:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmf7ZyY4Qi299dDqNQLCxEkdP0noay2XXf8NGY+wawk7nSpEhPzEhHKehKKQ4CvBpbINH57w==
X-Received: by 2002:a05:6a20:19a3:b0:24c:c33e:8df0 with SMTP id adf61e73a8af0-292727771abmr6193859637.45.1758338485422;
        Fri, 19 Sep 2025 20:21:25 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:24 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 8/9] phy: qualcomm: m31-eusb2: Make clkref an optional resource
Date: Fri, 19 Sep 2025 20:21:07 -0700
Message-Id: <20250920032108.242643-9-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JS8IuzqGEHtcfrb7m3CkW8U9UPj8FdU9
X-Proofpoint-GUID: JS8IuzqGEHtcfrb7m3CkW8U9UPj8FdU9
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68ce1db7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8inbgvmG2iPteTk8MkMA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfXwRHRMEQAsCrI
 jkOmejSU5+MVRFBvapS4UK+g6TyIoiT2+r15EyEGGyko7PGTzzEDsB1nj7heIqmUmmvjSCxv8Pi
 iELdHHWSalSd4+ucFW/OY7rUIcmt7H+Ov6zUOgBoV2PkUK0bqmkcQGpO+braW/oOnFPh0UslkMt
 umaLid4+XK+4PyCkIZmuW93PoMlHIe2YwIAhNORaid8WGnzs9pShpPN5p/z+L8w+PvF3eVk1yyx
 bmOEzrzRcBKWLDfe0n0ga+uPUah65uMRH49z4bXyLkLKpVLSBjmQd9/mJG1kiM0TZVgoQF5zkeK
 /fYDdpPKeqcNySjKxuJf813M9Vyy+RIRbcLyg+sdeuaizGkgeySzx4pwbGXcVKG8Jmz/6Y1tne2
 3HUhfe0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022

Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.
One example is the Glymur platform, which contains 4 USB controllers that
all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
and secondary controllers do not require a clkref resource.  Due to this,
mark this as an optional clock.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index fbf5e999ca7a..f4355d38aad9 100644
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

