Return-Path: <linux-arm-msm+bounces-73161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBDBB536AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 16:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 953BD5A1C3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED811345734;
	Thu, 11 Sep 2025 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aANXaWnH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CF5343205
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757602611; cv=none; b=Gy5pdJKyM9b4WH1FHYtR1WSMS7C0i+gqIMvdh3UFtK4MSoQbA+dShbTH/X8glCGz8mWFbKjOgGOVkdMBI8QvDwBV2c2jDG4fdWiOyxmGqyPHeP63ZKnJAqxBgIrWE8N9CcYOW6mK1CD24043ZBoMekjZstucARIhyODY0tpaEbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757602611; c=relaxed/simple;
	bh=g9Ir7Zqj4Q4z8+mdh4A2GkwyNH8GzAMmXDyXe7Z6swk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UD7CG0pgWvx2IZozyfF2uRu1cCX8Zwd65AXYY5lptQyctNm+2uFJMEUtVmCYVvBevi/unKoX+pdbe6r3q9f9udzFwigUPYx7H3hV+6zdHQINOeo4xlEbg66/e15ai0oFjcTyleKKv8zxEPZsBQ9wsxJ0uRHjDHDItUl9HW4N30o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aANXaWnH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAVrDk008859
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/i0u1DnuXxgdpameCKVEnYo7itVnONwyzPQHpKD6Jw=; b=aANXaWnHNd0bBEmx
	JolRBQNocvb9jYBXiwV4otosafTRSNJ+SDyPn+7SIte68TZ5NrVC+jE1oE0Qr7FJ
	1+rkjgls8i3AT7kGRrgYh4QpAn1HKyJ2TggJvrmxyVvBN8CkR7cWAwhfTO2wkAwc
	NJdY+hEet/ZFgJTqafSo8GrrwvTRB6Km26gwHGV4d9NZeBrivFbwGhxWLXqbHzYH
	KF6C6+ZL/3tPuQ4WFB7spG+nsk997ObF+Wp9zUQbxUTWNdgkKKoZHAUQqhDJ8Wi/
	rBMQyUUtdMwl7qahL4taoNUps1+DCMrU7B5IvuTetGrCrVHd+6iujvnA/xm0Y6K9
	ZP/H0A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapreug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5228e3fee5so38602a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 07:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757602608; x=1758207408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/i0u1DnuXxgdpameCKVEnYo7itVnONwyzPQHpKD6Jw=;
        b=FJeICM96fph+9v2yZivD2IGTSCP2vTJSpJmznZoe+juLWcEV3KhPBsybOZKQYA4ddr
         YDGoqM3wN5IUOd70S9chcEIngo3BMriLkFgsM5GB0KVKCHSMTk0fvyWbr/5ihWFPDmWO
         kLHGH9lKZi13+vbk0vOjd8u7E439IJWQ2PUOFZnKZVdRa0r/wV7/dFL5Jzm/gdLNa/k+
         17CFoaQAQzlG3q7veXcFTCaEWfoIX9Td4q1YhwEAamQ/PL0BAeKlt/a3EifvLdzs0G18
         P+5498VN7RninXLTjYqGL4YO+V+zQ1K4SAkmZgVS8C7DPtZcNbFPcP7jBhJW6+Bp0cz+
         1ZoQ==
X-Gm-Message-State: AOJu0YyLUmcgk87aoPd3HTymnol5LTV6BOERcdjFjDj1tDDisZp9A5j5
	GR4yHJ3mujNAmLZZUiXZrYMDVH7YwWYS7DjjjQp7j2tfrc5NVo2DiiVFWoNCuRUnS/X9/Vc7Sq+
	Z6/czWXeb+0ncwu+zf6Tdc4FDht53fNNbNI1r9WHfTYpepdN34bBqJ6EqFJFA9o8xtgYD
X-Gm-Gg: ASbGncvAZ2jdjPAgsuD6szZR5j2isOrf0aRq2obLn3yRGX/76IahJvXdosd4MEr7XDI
	mChqCJ1QwZpfwezzQ8jrlaGgGLu9D2BdYUMzd0MwQv1GnNyrx0LznCaUYLpBpCXXeX0sOorOE/j
	8616xrK1gmFMGfcQvzTlzEJ4paIkNHlYMyUgmocTeSK/9qjqzhAYimHa2uoPuAYUEVfXmFpbJvE
	9vS4GnXxhw/3Z+W8XDArlod6gQiV8iu/iYblG16VZtpgvw88lp96eHzmteHipFVL00DMo9U2wBX
	aQxGQlMVGialMGDmugBqm5BLxp/Yh+MxT92/KX5a/sSeO0luPGy9ZpELQof1tJzDc5/cH94jjVQ
	d6hWN2ibZbFVvucWvQ7Bcwk24TRwsGc7g1WD+Kwgm/G8X1+b+Tz9mOFlB
X-Received: by 2002:a05:6a20:4322:b0:24a:3b34:19cb with SMTP id adf61e73a8af0-2534441f6cdmr16687158637.3.1757602607846;
        Thu, 11 Sep 2025 07:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJdLqhTy32FV7HxAKLg0I05c1SykuXTMvfqc6IROeB1TisqANAWPSDFKILlfoT4H5LPXJ5uA==
X-Received: by 2002:a05:6a20:4322:b0:24a:3b34:19cb with SMTP id adf61e73a8af0-2534441f6cdmr16687125637.3.1757602607368;
        Thu, 11 Sep 2025 07:56:47 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 07:56:47 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:08 +0800
Subject: [PATCH v4 11/13] phy: qcom: qmp-usbc: Add USB/DP mutex handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602528; l=1610;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=g9Ir7Zqj4Q4z8+mdh4A2GkwyNH8GzAMmXDyXe7Z6swk=;
 b=zShFKpvyuFRXIRnT3yvPFCLUyh2L+HHbKIjDXahHxUeMEbq+jDSj/Gm5JVMNb7D6BthxSFcZI
 PDNrU61G8ZOC9dCZ8/sgo78JVqZE19eXdfvyh2YWG/Q9XQmAFkMAr1r
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c2e331 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_IuPrrw32zr4QVSE3DwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: O4W2b7b8NE4BVIPZp9SpNblmr-6NvUVP
X-Proofpoint-ORIG-GUID: O4W2b7b8NE4BVIPZp9SpNblmr-6NvUVP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX2BWxLHEkAtGb
 Gniyn0V8yjz7xRJ4N2ieLneXUDLTOvd4bJnyxFxRtiBbqm7Sr+aeYnOkYH3jILtN8iHOTeq9I1g
 Bie+vHLf0AiUr3hzYW9l1waRS5yoYd8p4u6Pg63BNwIFwjdJswSKDo5Oxqu6ygZROpkDhI4l7Te
 baffBL1A513Mf7fsIv6KYj8NlK7GqNvG69OCJOx6JzsmIniLy/o23u5uzklFnQUEmOCzMmUCXqn
 /zmMkj2PQKBYQXnmGZcj5WE9MNwznIV7+WEVR6cjdFlqbFmjRChgCji5MTP0bDHjxlkUEf00dbG
 yIDgjQ4/gQuoHVdyKYujP6ispnAVHMgBqPmwQbwGjHCewfj6/hYDpsj8/EZtvqFHnJuccJHKpbw
 pR6M7gVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

Introduce mutual exclusion between USB and DP PHY modes to prevent
simultaneous activation.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 613239d15a6a3bba47a647db4e663713f127c93e..866277036089c588cf0c63204efb91bbec5430ae 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1061,6 +1061,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
+{
+	if ((is_dp && qmp->usb_init_count) ||
+	    (!is_dp && qmp->dp_init_count)) {
+		dev_err(qmp->dev,
+			"PHY is configured for %s, can not enable %s\n",
+			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -1068,6 +1081,10 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_check_mutex_phy(qmp, false);
+	if (ret)
+		goto out_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto out_unlock;
@@ -1121,6 +1138,10 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_check_mutex_phy(qmp, true);
+	if (ret)
+		goto dp_init_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto dp_init_unlock;

-- 
2.34.1


