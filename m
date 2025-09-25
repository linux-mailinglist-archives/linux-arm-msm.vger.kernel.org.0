Return-Path: <linux-arm-msm+bounces-74843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50FB9CF17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FAC13280D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6DD2DCF5D;
	Thu, 25 Sep 2025 00:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jG0gFhdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBA02DC77B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761563; cv=none; b=pc8XKEm8qSYw7Dwo0sgPz/3aoc1y2fpy5xhOZwAv4Tm4olc2MeTdpyPIukni1SKnUAS4BVcXyw7I3kc0WmxiyJIIIbj/8TrACSVhE0gTUyEx0F/KaibTu1s4rMCJtVyz2Ht1gqPECImMKThnp+M43zOmJPp8r5PCT7YXYHzVUgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761563; c=relaxed/simple;
	bh=hda2Xd4Mz5OnSn10548Jx0ge0zF0dKZ+ZJ+uSDZXASE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QT67K/+OorDvKODipLp2y36X+DjpQgDCyhb5PE4zaciGcz8Fs/o0uxJd3SLnI2FQjT/WZ8MBwUNjfy5zmTC6vkK2bGZOKvE9Emk8CmPZKMUJcqN/cMwNyweno0kFOOWXsJJS0/I6Vok++oTVsPNEEjLBARr/2w6xSARJCaxJQ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jG0gFhdT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0MCU8002079
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DQ/0YD5xMRw
	3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=; b=jG0gFhdT1ZR4yFW1qAdyqzM5cwE
	23kn9L+vW4x5gSgFe4Y7tl1FAvNV2bIZFbJ9qDbY4VSLxRhdeVzCMTrscGjVqWGH
	d68AcVYKAFRltB4xOeSokbcpZ9mduO4i0PDQLFfDcl1ooXjQrN2edb7uuLnhtStP
	zFLeOY6g0GLT5NH0CgjaUOXXTCjUzIkzDFOUczUcE2lXkRfj8a1ys0S6qRimOQEY
	sfn9lQUEjuTqSxIAqbf6mu1BMSj1Jz8wH8GbMqyrb1tkqnHA8P2GF0DtS0cWhiBY
	HEpCx1stZyN7QZEKULDZaDVW9ztT7APV2tq0/W9DTpP1/mf3fIuJm79M09w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p7qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-268149e1c28so3808895ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761559; x=1759366359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ/0YD5xMRw3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=;
        b=hBLixpHLYo8POwQceOPPTQlhAb2SHLnK3iHZp0FNOC/pNeJ7Hv96/IOY2QIA0/H/r/
         fVOeXDrnWnIriIZEM3VCWKwQxIQ1rhuHVIHTfAf4aGHlJHruT4VBiCuS5xAwEXW6B8Vu
         fZrf8mqy4oBXx1+6cukWhNvYiRzZKHfFmv8hMIgaTGZcpeT5V0tePk4MssdzGgikZAGf
         SxDbd0EGyxJyBSNhZHosIoyDFZ8hL4weyjtou4kO6onOv86lUjozxWUVHe+HgmTq6rDe
         hiPHgAlUHXuKaVkoffiG1TnsQ6ln2CKvrfADvD9tRr9FjxLgklRRsLPh7jcHAKsk+JHz
         8AfA==
X-Gm-Message-State: AOJu0YxtfZL76qzoP63g3quB37ZybkNZjtEvMHdDpsB+NUc0tDcPRaYz
	MzmY8Ay3weEs0IGSkfaxllWe7PnEM24F7BfxpU2t502cUdgWeF5DG/MkT6qA93gsRU/Q5ZC5mcc
	4JVJUZXx1MnqiuIzGKRycuZd9EhswIiGVeObqzmdiGT8bcokGXEFqupios0vTcfsetbPR
X-Gm-Gg: ASbGncuoWdqaVVi5k7IKOlQROZONPIluVB+L4VW4pFWnO85uiWdYIAP6CSS7YUbfA4Y
	+aTsPAIhIpL0/hFe3xGurXq+jVyqiX4zP7lg/Y/WKxoHYNh/cPezP8/RzAjGKHv9BfpQMUrDIBS
	QBb6XpssjaEQVgll5PScRFvGJsTMOW36nMFP1ygT+2Krzj6cyL4FpbyGNW0WnKIDvXlGVqJ/vPN
	7BiLrKtZzhkS7COexis8DQaTgtrmKV0o79yRwy2Ev/ojREspBWUUdm9ZNY+v4T1qHmmAOKy/E1+
	ry+/JtbobYn2ZbnA+4qQwRNFaHGh7XZ/ZJnc3s8h+jiKfW4ehML5I+KjGJS72D9621dy7X3eRGH
	YJnXymnhfsSZCm96v
X-Received: by 2002:a17:903:234f:b0:276:76e1:2e87 with SMTP id d9443c01a7336-27ed4a4979amr14745705ad.44.1758761559479;
        Wed, 24 Sep 2025 17:52:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0jZvBnlaKAnoEHEDtefVGK6gSjoyOxioVO1pqTLEeDQPqNMOS8vsAsk+dAfSSAhP0dvVSfg==
X-Received: by 2002:a17:903:234f:b0:276:76e1:2e87 with SMTP id d9443c01a7336-27ed4a4979amr14745545ad.44.1758761559093;
        Wed, 24 Sep 2025 17:52:39 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:38 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 05/10] dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
Date: Wed, 24 Sep 2025 17:52:23 -0700
Message-Id: <20250925005228.4035927-6-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 85q6rrD3nhfTnsWsU536ikv9GvNII4Kd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXwmwZK8tYB/fS
 WINfbo9W9c9QYtqtWWA0l2vQEg3yqrbDkvPrTvXjT8gdRdUWFNSTGZ3sLqv9knyYnD0DnOdBXTR
 xPwA3zq5hwjrcN8ldKWFVQjxxL2deFH6lq+ZRzP2/zMrdwvdlkISfM/Pg7ZPfnuiNA2sdlBa7RZ
 LNVlZGyYPOc4X4M45vX24reqQvVqb2wAvY909g3DbaJIK6VKZgSWy2gH7m2YdDSTI/rfNIleqyO
 PwKxPGHQUDHGpbvR9jq2L+u/AcN2rty0LS+bgUXo05VXh+F/XVoya0UPhl9H42t4C+pUWdPn3eN
 mKrzA4v6Nfwpu1aIhZ6S9Ry/KYkVMCQCT5IaV9r+wzwQ2+KNGXC13uemqEebbv626kPXhgE7ODD
 Binn3XqW
X-Proofpoint-ORIG-GUID: 85q6rrD3nhfTnsWsU536ikv9GvNII4Kd
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d49258 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9ZGL9VZrYHwIVTkvpzsA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Add the compatible string for identifying a SMB2370 USB repeater device.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 5bf0d6c9c025..0f015a4c2342 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,pm8550b-eusb2-repeater
           - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
+          - qcom,smb2370-eusb2-repeater
 
   reg:
     maxItems: 1

