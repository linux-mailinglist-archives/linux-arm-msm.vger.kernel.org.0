Return-Path: <linux-arm-msm+bounces-76119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1915BBFA92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 00:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AEF674EB27E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 22:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D081D219A89;
	Mon,  6 Oct 2025 22:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOZwfOCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84962B9A7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789217; cv=none; b=Qawa6A2Mcy9JZl8zJDnoZ7waul8K9TVCk/7+qWswCxHwiAbpWo2xpwYqLhLg+x0bmPLEWPg73O5DKG86DV9JhiPq4MecSMPFc9GK0UjZvONbsgGkjLjOd9aUUKMSGFlx0upPpEFrIOO+3e1/Tu+67wAzEOZnBYh4wYbF9okX0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789217; c=relaxed/simple;
	bh=cfM3s21T8CQ3sOfi9Dc1sx2mJ27UuKxMJmEc0kjDpws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qvgjEvhqfcidkALVGPxMJW+qDZJ59yYHGD0rO7Wm6VpnBxgEODaX43xikGH2OL13PJTErQB2FuQrcKIYO6bv322daK9ujxZLUwnm8I6mA2KgAlZ+LVEDlkh6Tzfck8tHjBBarfz01RnkoLPKIDty+k3iHqYZcZAiBmB54jn191w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOZwfOCB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596G93HJ007214
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 22:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaQd3cF9DM3
	ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=; b=oOZwfOCBwgDoryc4mTe3JY8fHqi
	y5LqzEC/ozhIgi3WVGovhl/N8dTil69mpmCsP8FhRydMymbvvth1/C2JAuIr5cnh
	iQle4YBINg08PIQSkjyC5XJ+9EUUrNi6jJkw47wYmQrEcbdj/ymDIwxUj9tEiZFC
	Ry4jNI4Pkc2USTQkQEOThPEKiCkUJpbu8LJHZNMGsr6pQhU7wIfpbRqvkKrRc6PP
	DztODVrdpzUeWPx8IMdIBFDRTH+o4upmZNqRc1nJUghL//exiRcpZJTYsJ/Ay4xI
	9UwNem4aN59CH/hXCTFMCsCm3QANu+/kHtc5c1QO3/FgQGSxteu0QKPMQlQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1n9y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:20:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78106e63bc9so5264651b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 15:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789211; x=1760394011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaQd3cF9DM3ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=;
        b=Yvp66uDHA76iwCy7kkCEoqdMdWDHuvQyX8r52mMzg88JIEpEe6+Xmtb+ALwAyuiBnw
         FXxlQg+j2DdzHYct1ZmJRZgKw3DP5cMsJfeeLdgB9UO1xioBcHviK249Ki3tC8p0SusS
         Ydas9/9faazUsE/vFk6Pw1wUEgMBfS+3K1/vl6iQZbqibf0+L4eVtmeszKvu7MbgAbvF
         1zk2R4M82vVOofsXleZi83gbn+WLdaxvt6RWhSuFADme5FZSLg9bkUP9AMo95Wsn+OJp
         AojJspv0F5Dq1nl44j8NnyNuwQnt0kR1K80iTxY/d99tpEXjiVvKfTJAcgA+a54uemcb
         +a+w==
X-Gm-Message-State: AOJu0Yy86sHfb2v01aaDM3WqsVD8UssPQ6g/zPPMIe3lgOd1aD4GB6SF
	7N8WbQA1qJ1L2koibkV/Mpa78En6Q9hLlJiYYp4F404pmOYVf1iLLdX0WmTYUHC0z6duvwXiNuD
	ueaMj+auLu04rBKp+puJ3IhWG37J4FI0xPtk+qDvr+haSUzMSWnoNVECwrdQRMMx+7GwE
X-Gm-Gg: ASbGncvStxPRtyT0w5vllu81P8rKzIBvE0FoGXZWdeIo4ex9sri1RTkpI4hyandp+tv
	XKHC7EvHSSU4pQMwsHIORVqeLzk9/V1VIJIPiA0s4ZgJF156wEUa6HHj8+lEXSifGuS/X2Uv3T4
	XZajDqnvfaqC9oyKP9V1oKe2xuc1epv9VsKxHs48nUQryB4iglAXZ4LikxQh5PysXhZVlb8824F
	hXdHANoltafAGduHmknTtpNSTLMk5Ip6ddwJ7DYkoyUUfHFateFJKPqk543u9Waq0CGt/m6AqkR
	GLEy/0lDz0ohqqyDhHiBrH/IMtGEau6fOM72YFVJcbRvfckrJ33vfbV6AgVTx5Z4yNEzb6Ej0gc
	6bQdWijzh2BbxMrmgquXyYg==
X-Received: by 2002:a05:6a00:2304:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-78c98d5d579mr15544429b3a.11.1759789211235;
        Mon, 06 Oct 2025 15:20:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIm8mI+7X+Hd2BCDb5Dl4LJU7yRAMUsvYgqVVINq5kq0s+hlHcmFW7vgYhMca0ppEpo7MuMA==
X-Received: by 2002:a05:6a00:2304:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-78c98d5d579mr15544404b3a.11.1759789210762;
        Mon, 06 Oct 2025 15:20:10 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:10 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 03/10] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Mon,  6 Oct 2025 15:19:55 -0700
Message-Id: <20251006222002.2182777-4-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qT1LRrVoR-1i_WS16IJ9ARiT8jmU-OZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX8klv3Hc04rXf
 NuPPyZo9NdOt2YveYUyeLw+i2q3a3qyw8ga9wB/oqGQeRy1mMSo1OqTgKyXnTPlxV8JJHPnJjMQ
 zI4CCvIZWSeIF7b+uTRdl6/MMeuSQSgmAoZ6sLn67HNO9RIYqZeUNhhgSzHL9YiCTl+8rWAQw/h
 TGHTOYdoxtya3+6t+5pLsmxFV8xP8uVk6PcBcv0BeCmJxgtGg98wLXNtlhDmA1iGMmerdU7xgEa
 BowwNFslv8wKrfDdsKcOVDe4O0ftd1QOg14ZF26Kvi7ebEDPgz5+mX5T+Mw9BMzxKs97PSuhRyr
 Z6gsvAsgX04dljQSxmPoXtoSzOt/zFts2AZcDALfAxIBfNt0AQ1GSxEG50++dsjTfecuPXH9mk0
 0knKtAZVAqPKLRucqIv7/4iZk2hUcA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e4409f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=dJG6SERxbJy7wEyxA2sA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: qT1LRrVoR-1i_WS16IJ9ARiT8jmU-OZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

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

