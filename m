Return-Path: <linux-arm-msm+bounces-66207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8FBB0ED83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F2CE16DF7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 08:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C43280330;
	Wed, 23 Jul 2025 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5fbrSFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE0D26C3A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753260243; cv=none; b=FynZi9Yy4WzBVZQf8YXvLcs29RJPv7DXbB1IVCqkvT/pQz6z/x/aEaIsIpbMWG+uUfeOyIX4JU5pAeZPocwvRvQFRMCBH+aLYvZny0txjO4ID+A8802X4+vZGF8V+gTdhXmPjYWm3TBsgR89GQlE9AfwB/dvPsTQ2H0dt32QD+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753260243; c=relaxed/simple;
	bh=XUasQFYoY490T8WsoG5vluLO+2GFii8wwDKUuvEBYbY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c1dEoXu/5UsN+cyDMh0x92JjCWZQa0wMi1njglENhG0bbLhGltU7InzdguhYFJeXewUYei9Feu7K7w9kUJyBIHGTTLTM5XDqj1nVx2uedHQaQqjIU7bHwNDX8AhRjsYDtyBWZ2l1dFTcSGi8Q2CIXXl0T/8ZwaeX471x1Eszdyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5fbrSFO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMNvsV020008
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 08:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=C81n/IdXv7ES+6R3S+HgxZx6XJbHygDB5cl
	Xpax9EVE=; b=Q5fbrSFON+NBCVlx4cQaAoXSoRk5Kfqds4QO0/GsECEK58+T5yg
	+dSo7cd0Bei1MV7cIOsKMOBOWFZ/53ebcjv7SkdWxdsfSF24ya4i6gUDDWh4tFf5
	xdZWMn+C3lkVJufdnJak6MdPoPSkDVIpno46hO3nn4DdPvcWkRWZmsXChnzj9XWr
	N5su4QsEZLLGg0ntD6cUUHhnwst8PevKWoNz/FNg63Tt+HTIPcz7WVGGwd0amVFQ
	/oB7OdtQZtveED7wEaZlh+HfkThOvd6bB2XEXWTO/M5W1zKkrhA4uSpZk+ZRjrie
	9x/VFJQ8mHHdR6fMSVkBiYNoohLbWwphb7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3eq8kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 08:44:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234f1acc707so60091845ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 01:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753260240; x=1753865040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C81n/IdXv7ES+6R3S+HgxZx6XJbHygDB5clXpax9EVE=;
        b=CVhS4Bn6Vd1SyqTgtwsjQfCBDp2YBxnmjhvJplbUaF7mlZyrzeJbJpvxHPoTjSHeWC
         goR4fmrglv+aiS6f6PfXLyYlMaLpZdNIB07NOVLBTmznPTXoQVIklm6CHfYN+M9UEL8d
         mKd3T1Nq0FcX1xxeU/r+F+D0BYiJb25o9aFll1u8i40O+kPOc8seyB7KGBNZn4u+lYHd
         QmRvLeoSWj1SXl3PumR3X/zPP4BXCNynHm2oAJS8IQC3RsGCm+IbVPz4UNfg84RKHf8K
         vT8GvjjzB6XsGm7B+oTTB4Dv5JjkI3UWmU4o+20AcXwXBi1CqpeHU08Q1Rh2CvroI00k
         y2OQ==
X-Gm-Message-State: AOJu0Yzw6NwiN4Emzs/jkUzcLjyvI1/qmu8/xPrl996CXNEdOjWDDYYj
	Mcb4pVMCMqjx2bGs//luTUy1BdZVDJm6LaG1C7NZxpgIBCH9kLXO6/CESkWyvU2Eiesb6jNJcC+
	VqCk/vY1W9GAYb6CVVODvqOh03atqkYKCVGO7U5CYguy4FMsm4xEWHjdU8yaYSWJSJxPD
X-Gm-Gg: ASbGncsBcldEhkQiJcNlua19ortTfObBzpJb8gXJB7HuqCLsMREHKif6gguzJKvi4h5
	yC5QFLeqE21MSsFyQ3lNo7k4YQ3idPaO7629KfpYqv374buHqPE3CqsjcjeO4I/maJdd79AXa3J
	vB125h0OH1t3qFXD0qHiJvWFHS4/Ebznf00ogbshYn+kAD3/03JZFF/v2QNokrMO5480I5CFplX
	O8lPjVFEe8HIB/7TSa/KFlQz4rYEoYSt/2vpb0RsSZaWip3Qti6GoXhcq4suZ3hXuT+oFRJLMqx
	g7A3cbmygWqwkItoRqtb1FRHfYMWutgfiQlJ3sctftjp/OWXJyexpHQmnyAMba69NhkHyShYKQe
	KlRNzVsSFZzR8BPc=
X-Received: by 2002:a17:902:cccd:b0:234:98eb:8eda with SMTP id d9443c01a7336-23f981b445cmr27163905ad.28.1753260240179;
        Wed, 23 Jul 2025 01:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtRsvM3+AQBUPzMzqkonNubNB+b5qEeLhTQ4cIhxEqCbs6BelcoQshzWdlOA/REzw7hsekzQ==
X-Received: by 2002:a17:902:cccd:b0:234:98eb:8eda with SMTP id d9443c01a7336-23f981b445cmr27163655ad.28.1753260239761;
        Wed, 23 Jul 2025 01:43:59 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3c95sm91696645ad.34.2025.07.23.01.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 01:43:59 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
        quic_yuanjiey@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: qcs615-ride: remove redundant gpio header file
Date: Wed, 23 Jul 2025 16:43:51 +0800
Message-Id: <20250723084351.4627-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9d5l7sH_2lgHU9FOfjN8ILW7mZrnekzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA3MyBTYWx0ZWRfX2kd/ImtTWAUb
 FgyLB30/tCh9HaNDo8oKzoHikBLD6VI25AB9a4vk+v54kp2pqdgveg+Nfa02WtJsFIl/nnxbcft
 oSnu3URZMZShYAvUO6cMYTUk34JzQgTqmh6gbXnRoqciSpVJcrUYOBTnpHYS+PX2Zz0eJ682hFi
 G5EWEKgfUqWqF6b+dO7qEMbP9nau2VFT9R0TrQhYXmEMV/QYXvISWz7EKI+ciQ6fISU+kEfuN5L
 Z2q4ylozlwu7Pk+Xy0jxRDVDMs2V2WyzHw01kKjtTl76OJRYIGSlxBCvmltpni6fLj+Pv8Z3SE9
 kXcqVXJ+0rF7BnAjMsjzTaleP1xPErpf3mXKNXvdyIsIyogqhnfglTuCAE36zz66t3BOw3zj5eg
 3ut4rDFGu+PrcBYtl3Ym88BhiIUrNwiMHNpv4IbVCN3vN0p437ROILNqtPvYUjscNpGb2hDD
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=6880a0d1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=EiXXGwTVnQMrs5tmZeoA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9d5l7sH_2lgHU9FOfjN8ILW7mZrnekzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=935 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230073

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Remove redundant gpio header file in QCS615 RIDE DTS.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index fdad6388f6f7..55b9a62cafae 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -6,7 +6,6 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-#include <dt-bindings/gpio/gpio.h>
 #include "sm6150.dtsi"
 #include "pm8150.dtsi"
 / {

base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
-- 
2.34.1


