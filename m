Return-Path: <linux-arm-msm+bounces-74250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E95EB8B2B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 22:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F6CB166A62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BE32D3727;
	Fri, 19 Sep 2025 20:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VaJ8arMt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789342D24BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758312062; cv=none; b=e5Rz0E+nEoyfS68Jz5wnrm+7AL29MMdD/7qpqMD1NEAftUeHUKsjfEgWrn5QJ0MmGdyDwwb7+4RTHnMhR/WojQk24tfkrvV+fdYvDuR1umGp+hLj6Az1/MfGP1L67hrkvcp6IOAGjHQ4IqkucDPFDZ0gDtFfVkdxBiM88yfM1Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758312062; c=relaxed/simple;
	bh=/aCT6AMn+DEBAszM+FafwAQnaRRZOfmB16zLDUBpxGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOvYPzxhx+DDMNfLWm7N8wayhRrwBfw1a8gULJO/0BigTk5jrUkqjDcddjUG72ymTFLEquBRJiGQGP2/wLVzFjkZEpY0iBZAsAwZbJHJbRySO27TVJro9STl+Rj4KA3sHA005eVEt74nEtYSpUEk9+LXtTnFdwVXT7SnB9o7Iqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VaJ8arMt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JHVaMM013743
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K94gZNJCyxLLjXcq/8C3d4M0HAtuU0U9u9rzRHmSpBg=; b=VaJ8arMt0sXK/vvc
	WuySYrcuoPxGJJCb1R1P0X1NmCc3yuBq49+DLeO0euViY2TQBRYRQw7k850Xy2i3
	rOFs13rCv/2ZagvX0IgUtUgieuotIPAibSqEF+F9KFTNt4BPjLwK59da5mDtH5iU
	8sMcAG0A6WrXS+wOJm+3WpRJ3Ehwot2dT7euNYxUXlBsTjkSzxuK+BV8MfbvXTjb
	uOr6QZ3+NPOVP5KiKw93SYHUy7BQPAWxW9SDFyozD9+SLWJt4Jz41XXPbSpqXWT6
	RLz3wv56yjSD9k8QnuY0mjlt9beP99935OBs0YlYHGlzNAfjMQCUux0JjX9xZGsR
	x6j1FQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499bmy0dtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:00:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458345f5dso32406035ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 13:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758312058; x=1758916858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K94gZNJCyxLLjXcq/8C3d4M0HAtuU0U9u9rzRHmSpBg=;
        b=CRFrqnmldcK7BXJNHRd5s94SLAoG0kOp8HH315+js6X2574xm3mnTi/FTgDPcjTF3D
         caX9mDb9CSeO7zt0Q98iXfQhfkVspvw7Gwm6HYMHRe6FdYj2/w32kDhONB2DHkVDH2xS
         JdKmCskaS99SKu+f1pSe8xmiBUTUYpaUErhJEsKvbxYArmL+QuTUbqq/Bv6AJ1tIu1Cq
         9YptvZUhuVT15z6spsn6JBi4TGuFhxOu/1myKiG+2dvnhIFzB1YnBVNiJ2jWtDaSTX/P
         5Igkh/8a2Zm7iXzJdURQpruJj/EvXDw9V0vV6BPxlY60wkoCRNLri5Li2nhgPFx4C4ux
         VfDw==
X-Forwarded-Encrypted: i=1; AJvYcCUJO58ltobJ3xpYeWxpJAaSVCV4jN745KiaXJEXaiBOZw6XYyL8Fz9MAWEzkq1Jt5On8Mkv3seibIJmfl2d@vger.kernel.org
X-Gm-Message-State: AOJu0YxlhyFTVuM2oPZw6U/gFbvjKrbJFkUYIUg63MmCi/kC82/3tWMO
	rwfTAfVBO1N+66OQragCeBQFRV0soeh/6tMO0vhNc8lK6iBYlCNd5cCSy7UWnGETkPXCt8vZS+n
	pxrc5wUnXsiQrsctbgpVhOTmBl9IQ3qTRpI10AWFSjiyuNk1fwkZ41/5mEoe0I2VuTKtP
X-Gm-Gg: ASbGncv+P8YarAJJTnzNqY14ocNoyWovvplX5/bSSXUbIvvBXjNRKymbk5wC4/MlzJy
	7MGsc3q9CaWM+OCUiNWQoW8qqeXOTRevtWC7R4fObC4xjF/6lw/0VdvtQxMM97MH+YDdTsg7u4C
	N9woRE/oZ2Is441bp8syAxYEEp4YMbc1mwrQ7TR47u1EkplPPZFrEgFUm2Q+wIiGPOl8ZP3zqQz
	A3l7jPcm6Xm50NJN+/6mv8P69kCfUwnGwFSi6DPfcwhVWuDPF1EFa1lK3qN5vMjeAYV7LLSQCpt
	8BL5L5MXLHKDe9uuRZwlgXMUEH7D1yO0NGBj9wguX4Mf+uMxGjxbm+ky/J2S5CIqSaWL1Z2ZkCb
	WsyLyriD1vSetFLiYFnY8P+162Q==
X-Received: by 2002:a17:903:2ace:b0:26c:bcb5:1573 with SMTP id d9443c01a7336-26cbcb51803mr27453835ad.53.1758312057967;
        Fri, 19 Sep 2025 13:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqRMuKYms0JN+AnMSRPMr6bwLIE6pahTEbvacteRwGgkGEd+6lWHLIQ8iRIIeo2zWClmYa9Q==
X-Received: by 2002:a17:903:2ace:b0:26c:bcb5:1573 with SMTP id d9443c01a7336-26cbcb51803mr27453585ad.53.1758312057420;
        Fri, 19 Sep 2025 13:00:57 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698030ee20sm63053905ad.109.2025.09.19.13.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 13:00:57 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Sat, 20 Sep 2025 01:30:11 +0530
Subject: [PATCH 3/3] pinctrl: qcom: spmi-gpio: add support for {LV_VIN2,
 MV_VIN3}_CLK subtypes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-glymur-spmi-v8-gpio-driver-v1-3-23df93b7818a@oss.qualcomm.com>
References: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
In-Reply-To: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758312044; l=1502;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=CiPyfA3fDFL/yWTIk0JCWKj4mCCnWYx7OMCyiFzL4yM=;
 b=vo+kuP/Xa2OvNsoMoxwqxQFsPysvdPfhVd51JJgJuNtTZukkJyMaY/f1cuqegwm6AyIdjsir8
 UXFGdIxN1wQB/CjSgADfVbjao/uan0KuM/qJ2gFdrRmCMofjXkol4xT
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: PDx_mgKQMXNbc1Zt9ExspaXD63MJobB8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDE2NCBTYWx0ZWRfXznbEWCBS9Ou9
 fmFk6g0W7/J0mxCZMp7aWM5hNuV7kV1WEhnhcaeceZU6ZT/yOHhy7QOSTuhdqh3BOO2ZNXVk1uL
 d+V8tUnbB8IlUe50nSEzKZE9Xmw+UOBt3DZE8BExubPZF7sW5VhrzWpxTkwFPVzrs70xiRwRwWm
 k3ihKUgal7nrvbfrZCHne+yXFG25HvumfjFlNHwZ3d/e4feEzmOHeUdMFfb073NdyHuL6ypETNq
 oILALt5TCsFvleey1iPL0ckmNA2VexUfQS4NWVAy2AwqEd7NU1G+wACr0AO0kcWBRUyiqe2u33R
 QnKQhmsvm6AZe18TKMxyMGnf1jID65Z5OTyqktPjSsgUoKjxp1yEHlnubgnWmdOs8WMfmdVXX3c
 E5pasJsl
X-Proofpoint-ORIG-GUID: PDx_mgKQMXNbc1Zt9ExspaXD63MJobB8
X-Authority-Analysis: v=2.4 cv=ftncZE4f c=1 sm=1 tr=0 ts=68cdb67b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_LkKalIgBaL7gH2Y5XQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509190164

From: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>

Add support for SPMI PMIC GPIO subtypes GPIO_LV_VIN2_CLK and
GPIO_MV_VIN3_CLK.

Signed-off-by: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index c4f7d2d7a017684cd9c0d0850cb8d998668b543e..83f940fe30b26ae06373860616c54955c3b2253e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -42,6 +42,8 @@
 #define PMIC_GPIO_SUBTYPE_GPIO_MV		0x11
 #define PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2		0x12
 #define PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3		0x13
+#define PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2_CLK	0x14
+#define PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3_CLK	0x15
 
 #define PMIC_MPP_REG_RT_STS			0x10
 #define PMIC_MPP_REG_RT_STS_VAL_MASK		0x1
@@ -852,11 +854,13 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 		pad->lv_mv_type = true;
 		break;
 	case PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2:
+	case PMIC_GPIO_SUBTYPE_GPIO_LV_VIN2_CLK:
 		pad->num_sources = 2;
 		pad->have_buffer = true;
 		pad->lv_mv_type = true;
 		break;
 	case PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3:
+	case PMIC_GPIO_SUBTYPE_GPIO_MV_VIN3_CLK:
 		pad->num_sources = 3;
 		pad->have_buffer = true;
 		pad->lv_mv_type = true;

-- 
2.25.1


