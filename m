Return-Path: <linux-arm-msm+bounces-74874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF5B9D2A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 212443BD9A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEF52E8DEA;
	Thu, 25 Sep 2025 02:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLEuSDg2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409A52E7F2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767342; cv=none; b=iPBS8JUX/ZfIZ1Cd+m8gBAIJjGgkDKQLpbPG93T2qnZyC7nehCo0XMw+SqTQlfir8gw/iXEoKEi2RIVO4nmhxcoU2F74XrCmC+twUF6mMZcKrX0rAQF154qWwDReU0PPVKDhTcZzms7KsLZ0nZZ50RCSkhRoU70sF0atK7u94aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767342; c=relaxed/simple;
	bh=cfM3s21T8CQ3sOfi9Dc1sx2mJ27UuKxMJmEc0kjDpws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JSPJ+/gz2uoB0NZLuJ4wcnV1kpjRwxrICA4TxUuBc+QrIrvdEG4sANRMPECHhqMVltlJVKIyIq1VzkKZeuFQzX0s6v3Dmm3GXXtXI1WO6J6oWCbrozg8xQhXvByjo4BWMG0Pcao06Xs5W3Wl9Da08TtO6I5MYzFwQL1y0lC4kIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLEuSDg2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0XAqu027477
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaQd3cF9DM3
	ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=; b=GLEuSDg2D2l2imPwwOKxcHG5RCf
	3pvFxukmFNL9hd7KvDTHqNF5rvMqKSneewhFuCGoEvdofpScpn0xgwi1HPt35xdM
	/Lvro7fTaE1qGDcUn7Yd95xSjuUIbr2k5ZLLEKm7RPgW7+eQPPqN/dr2AHQ8Bcet
	C8FuvmI8Q55mqm5WH5BPflPw4y7YBjcPLpN8R3cY2bh7XfcSm9Jy7QnKvIJb5NJ0
	hB9S357t1Etab66DQWHl50BrYvfyTZ5iVRuCDdT9trV2psxZldWnGmAXctWe7nQn
	WLXNDeto6/SFWUsFm6x1wHIuJx5wns5z5bAfNgtokAtu5ceFQzF5ExeDyFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv16fdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-252afdfafe1so5038335ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767339; x=1759372139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaQd3cF9DM3ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=;
        b=Me0E9Mf4Ns5P/nRyfKYmYo8gT9tduvZSkYDXwF6WcS7zfuZR31VmY5a3ye19aq4/zk
         aR1ZUbsuiWa/gI1d0kGUOsWjzrA/z0fKVX0jNXh920hcMhVwRWF8QMBMvqQPAIhFsszL
         rA1e39iblYYQUbvAPCxVGY2bdlf/E0gO8G5LCAzOEae0qW7DWvl5crqsomoi6NQ5WKWl
         X93Nf0W7Zh5AJ/tiaImwJFLBrzG79h8UhiCxE2aaBRcQ1VhVPW3DgzicMfqgXCeY35PW
         iIHiLT1TNKusK/agntKmvPKJX+7U7ZUsG0fwrDxfjfJ3wcqha7jfEic7m4Ji7PScNIrc
         LiJA==
X-Gm-Message-State: AOJu0Yy9uTb7LzMT/VmsJXwVl2Hoe+dhXZFGVEaulIulkujL1/ReX5e8
	OI+8ouwMZ9oU3hL+ZY263SxG2bHiJxU91MQANvzJPNxjo0hi4R5yu4SROyftqTz7KYs6epDkfr2
	QXGtPL3ZMydc5ZQEc59T2wRBqR986FsCvIeNnuQwZVbBnNkxO8NJvvB6graCphn6oambe
X-Gm-Gg: ASbGncuVHZQvRPyb5xKoyUikhTXd0uU8e8t4vkyqHfRG9ZrhRvv7tL7PqWeCIehyCod
	Uce+C+9MGGdJYI3TGqjPjfnoG4JKP40I+vsx7kjHikwsEIF93bWQw/p8PX7vKgggo/CP6+xgj34
	ENoq/AMSRrbZq515r8hIWUiQPcCUQtukf0vSaHfEk5R9C/Zyr1da5CmXtF8tRxpUfyDRngd/NOj
	lg2MqRpCRob7NtGbY5EqSOFB0kd+ptwo/wMLlfs4v7simNiYcoLWi2J6snzIZXT46axY8H1iEYd
	s+p3uFYUtcCWJmMJx6EVhUbP1WzcQut/42KN4j/rP51DDUc3BJSkXBWqgsRC07kCXpdSufjKkHF
	//Ck4FzZba/P/2WCB
X-Received: by 2002:a17:903:4b27:b0:269:603f:420a with SMTP id d9443c01a7336-27ed49b3138mr20415735ad.5.1758767338557;
        Wed, 24 Sep 2025 19:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbOCf6eNz+virCFfRlfopKZjO6IPzC0hVd3s5Sj34qU3xiaSgJy3D0qcDZ+fhYb/Vg25O31Q==
X-Received: by 2002:a17:903:4b27:b0:269:603f:420a with SMTP id d9443c01a7336-27ed49b3138mr20415285ad.5.1758767338063;
        Wed, 24 Sep 2025 19:28:58 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:28:57 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 03/10] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Wed, 24 Sep 2025 19:28:43 -0700
Message-Id: <20250925022850.4133013-4-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Oq5ZxIV4FtX8HVJWflshkd4vRc6sok3I
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4a8eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dJG6SERxbJy7wEyxA2sA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX96f0U3h/0M2O
 0m1c+++Mq+npniTAc6R6q8tZ9KLO/qjqLwE0gq0KcyMMb4vkvQUkt4gPDqFLHFWLWBXTEHrj0Uz
 9zlxx41o0raChRgB12ugTVUfCyoagfrr9xOq2kGyxrc4G0GpM/ob4m89K9E1Lv1ZqwOe9Znpj+3
 vzAjp0lSoC6jXFZGVaOj/eZQ+3xogi8zH7hsIim2FzrqecXCrcvTi3TdCxKn4bOb08KJcwMrbEN
 NSljj2pEHeIkvuoWNLBex2J7QB25yP2qjDwdvpgR5e0UkPI1sK2J8Ka3IXp9IEKT3Wf5bxR+uhe
 2OsFXTUNecT9tZd3avDMs5kVIY36QlNn3HUqXYbCds4w7qzUbMU5Ap4cn4A3ixFSITL5uEafyC/
 3z1gCtip
X-Proofpoint-ORIG-GUID: Oq5ZxIV4FtX8HVJWflshkd4vRc6sok3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
the fallback.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml      | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..0d5db71e0ad8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,sm8750-m31-eusb2-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-m31-eusb2-phy
+          - const: qcom,sm8750-m31-eusb2-phy
+      - const: qcom,sm8750-m31-eusb2-phy
 
   reg:
     maxItems: 1
@@ -53,12 +56,20 @@ required:
   - compatible
   - reg
   - "#phy-cells"
-  - clocks
-  - clock-names
   - resets
   - vdd-supply
   - vdda12-supply
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm8750-m31-eusb2-phy
+    then:
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:

