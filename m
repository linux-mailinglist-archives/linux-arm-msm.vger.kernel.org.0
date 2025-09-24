Return-Path: <linux-arm-msm+bounces-74767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C549B9CA60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27AE21BC4827
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4442C0292;
	Wed, 24 Sep 2025 23:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pOr0Dt0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801452C026F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757085; cv=none; b=tLdmbIV94H0Z+UShUX1xnSWkmOxjZiJ/yTp3YYpuKOvnvtKPa3dtAbFs3JVX1lqkhuWn/y2+hevhric/+cHJVYNVgTyl6tFhZhFWKiQmOb4oMCwxVb+IOa0uN4phbq+OUbWyKnoR3YlYo3LCb8S7qlAiNqguv439G6vZkVgHUMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757085; c=relaxed/simple;
	bh=OFB2kgtpI3PnGziBr3bCuaYSbdpCfTaorjOb8O9HbBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tx5Pc2RCggMuq1QWkBe6UZ0BL1KLOZFo1H83ypSaKgQG4t/uZ5p1QNR4yK70WctryPCTJtOMUK453paLssIb90cRQ4S2cWLILj/BKcEfeipNS+WA5RBjDGTsbg4NVX430sh4Ys+TKgNvw23AEA7sbOCiwzyjLYOHJxhmWvqPMmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pOr0Dt0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCwa4P023773
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jQNLKc8P7ShPR+tJQHo9Yg
	BqIMp3zxSivxKyvL7307M=; b=pOr0Dt0y3R0mbJ+D6HCRVwUkuA9S9EYbwSMj41
	aLNf55Wj8s7bc7+tEGKiDqKGdNGGHPH/2/vUeHUw3kc5RRMK3PL77GpCBZdT3x/G
	SBOG7m8Tt4IpKPUEl7FX4o21joDFM/Xoj/9bv6746strXUi5ZA/8tkX3hV3jMOLD
	B+GCI/JOSCbQJBztKjRhLUHUZiNV1Fogp/1oLQFXHEhJeuDMluGhnjKn4XKBH3jK
	nYQTyYAgWdwXZmw9jh+IihuAnc7wvzzD1AODzzpQDgK1tulqsbUyfWhEKCPGH9S2
	msEDte79yfJVEnpWKub+jgxbVOksAB24YKVuig05K50oqwgQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d34m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:38:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780d26fb6b4so286728b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757081; x=1759361881;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQNLKc8P7ShPR+tJQHo9YgBqIMp3zxSivxKyvL7307M=;
        b=jEgguGJrcPwMAdbLKPlvNsGQRytLjgoPks8tuHry0EJNltTawlNPESseIPvmgYOvKS
         K86x6clOwZbP3dYluvNOsXc4faJvuA/wGsVEAKFks3ZZhY82S8lqJV8WT7toAEelpceE
         YJpFB3Ka+PnAp8/IFWmRzWraHjlpOZfkrcmMZMT9uQquCu6wM0MRkFML5eZDFdVA/IkI
         NQ2p1tNh5tpDmSMOO0FQxxWTvzumIjuoZrAxbMgB74dUVT/CKWG8SyU9vQM4OZr3LL2J
         uwMa5JatwZjfW8g+IgzxOBV7uloZ13dcivqvsEA+Wm6VAMjk5N6FQ4qE82x6cQs8grjb
         aWAg==
X-Forwarded-Encrypted: i=1; AJvYcCXLte0RUAYogzDEhGoJDwLTERM3zmowzq0oq2Bsw9LPrt0lIPUqW7nX3qAxUTn+pthAqC1ibk8Odp1XbrUC@vger.kernel.org
X-Gm-Message-State: AOJu0YyFCzgVT0O/LWAYyMM36a6kBOg7ehG4RXPX74XW0wInx+iQ6QOg
	GLoQjTkD/K8uKcYFDotPIceajqg5ckL7DIP4upWnbZ0eqIe6w/xfDKufqRQBIye0Vznm8DvhhFN
	3cc8faI1ROgYLAJ7AMBL4wacJltnS4Vz/QpR5uQ8dM9COZTqh6CDMw/VQgydW0b5x8UAU
X-Gm-Gg: ASbGncuo0UKQ13z/uahELabAWU43MnX1Cylb5LtSHKi2HkZomZHPIqoVHA+l9RTf9pj
	1KdCfi+fT6U81rx2pu3UOvnErWGr9eHXgq2oqc8ICgfsbWNcvRqSvLjHJOW6oUHjOHTqxdp/oEa
	a6yW2dNqKK7Aa7By2npKbISou7NITZDPpU8enchPFoOzFySimwM1ijSu7I2CpIz/allM8rlFi6T
	wSG2p9B29Ibu5LYdlMJXoN+X87xDvw7wxa4bAx3+w1TDr3jAKpfRE+cSLVwI/xir+Kmr6mPSt54
	pouxIULAUoiKIfJzD7nVHH+b/1otKoHIDG1yUuIYYgq83/VwZFWGAyxhKMiAiCKd3dFxykclp0A
	3IQA/p/vFYae2qmA=
X-Received: by 2002:a05:6a00:1890:b0:771:e2f7:5a12 with SMTP id d2e1a72fcca58-780fcdf6e16mr1803924b3a.6.1758757081183;
        Wed, 24 Sep 2025 16:38:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTt0k8qEwYpFMit4O4lQZpF8U6ST0hNEYG5mPDI3iYy2XxIpf11uYg4nFLgyyPdDE1rD249A==
X-Received: by 2002:a05:6a00:1890:b0:771:e2f7:5a12 with SMTP id d2e1a72fcca58-780fcdf6e16mr1803898b3a.6.1758757080734;
        Wed, 24 Sep 2025 16:38:00 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b23206sm192934b3a.58.2025.09.24.16.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:38:00 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:37:55 -0700
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: document the Kaanapali
 Temperature Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-tsens-v1-1-ad0cde4bd455@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANKA1GgC/x3MQQqDQAxA0atI1g2MSpnaq5QuMmOmBmkqiZSCe
 HfHLh98/gbOJuxwbzYw/orLRyvaSwN5In0xylgNXeiuYWgjzrrg6qyOtxJ6jjmFSAVqvxgX+f1
 fj2d1ImdMRpqn8/AmX9lg3w+BiYtHdAAAAA==
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757079; l=1046;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yySQ1biqwevpZU/HQKBUIuPzNC40vlyOA1bnmF3mVEg=;
 b=1mJCZizbdBM9OpkSofxKaUkUAzDIGmKyL4KQIQAlvkkEO+8zdO/d+lWKmmnAayEA//JW2bca6
 SB73l2C18kUDB56jbCZvDlSIr+zEHLMlm7GwFy92i/L+M4OP+1cMT9i
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d480da cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=PGq002HhRynx4w536vgA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Utiexws3ECacpB9YlEEvFWMhX518Y4Tx
X-Proofpoint-ORIG-GUID: Utiexws3ECacpB9YlEEvFWMhX518Y4Tx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX59+V+q8aVfMU
 CX5Cgftn1/6V4QTBffjdI/1vgAWuKzdlv1OB4obzu5FKMhx2r4L3nzPb25HZYKjrQPdIPAzkt68
 te0uGNmLd1kfW5Gy6k6EFpNErCwWFPAsa4aidl/W4GALENTymzumHXYBEuMun6ZcAnPBYCTCabS
 44FoTf08ASkb0xPYqvfcVsZIRXKSGQJrKFer/TDvARKP4YllgcQH32nurlOm5VUGw6d5CcIm8tc
 KDFFl8542XVC2qx40amB8fhCIHjYKF27RUNAZ5HVTSIQshL3N/zGfiuH3LkHVHvH2Yliqo96y5z
 mRXtcSe2YFqLA6dMn0rtj/5N8NQJv8xr/65PhSE+5l3XILkOokm+Kfb98ubWpCZHSLz0lWANlos
 pGv6+xnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Document the Temperature Sensor (TSENS) on the Kaanapali Platform.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f65dc829574c..20b9816754f2 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -49,6 +49,7 @@ properties:
       - description: v2 of TSENS
         items:
           - enum:
+              - qcom,kaanapali-tsens
               - qcom,milos-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-tsens-8f03e7cb07af

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


