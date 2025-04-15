Return-Path: <linux-arm-msm+bounces-54371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AE5A89A03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89FF172873
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A123291170;
	Tue, 15 Apr 2025 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJdS61TQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6828A1CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712813; cv=none; b=ZzK0lSYuwwhr6w4MGVm8e9SO4Ib+m40MKL7A8aJ7W/XCHC9SS3MNwgIX3CpTBqjrgw1EWl9GJ+AdRH8sIPFkVdNkeFhPA9/W7BIyK/W7QRh5Z1ALpS5AP8APDsfiYJV46aH0jebcXelcRts7IWQr+tlDPrO3PSLe9cj3+AenfLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712813; c=relaxed/simple;
	bh=8Mi7Ym8qf1D1IGcDGDh4NVCjNUD1fzbWSnDojIEx+l8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJL/hPbm3dBTBDDyX6ocfXkBRn+91FUng4/DR5tcSWHZZ2WQ/2rij18B8AQ82ZQm5WIb46SmjDIdeqZLRwXfATBz2hOxUFzzpE4Nj4DJL1YklDo7IracECbWId2WqVwTXe/UTiM4g5toqNqCPTFwbc89MUJ+5wxvZUgxEjilO2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJdS61TQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tEfl019565
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cjmdZWc5h9dxANlrR9cSZ1v7Q6KJ5cesPTJw90de2Ls=; b=ZJdS61TQ6bT+4B06
	jnyvp4C3eavVTf+IwjXqswNOPMIbOJoXT/ny36w85elIL9gtLrVal7fgg00NsOuN
	+Wcee9cxOTWOK3JQSMFovSTsPtXYWFtA+z8PYxUpjjXP1DFJ998qvmkUDPZg6Nv1
	3FR3yq1gEK0DsofBzGHduOCofkbhBD/BWi2pqTQu1kzrXRrJl2kPH/4NXuYsRrnS
	iBQ19KPz5QVk4UOHjop+iyrwbPsQdy28VXYSjdQtL/gz2zr0pCrip4DDuzAGp36h
	2Oqpmixd+MryBO/Hp4we4/Za8b2OdmtXtj07hX+zo7XZPgYLesx+bWzh3xBxZ7I/
	R2+G9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcyjfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e9f6e00so918956985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712809; x=1745317609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjmdZWc5h9dxANlrR9cSZ1v7Q6KJ5cesPTJw90de2Ls=;
        b=oGwOXWyKRKnwqlamIKEBxv/IzX1Y/K63+rAhy8KtBzuvcR1nzPelqKmkVKjQzZfaZm
         2ZoA2QQEgby4U6LjA77dR+QNNhGj9bQFMU4UDyf1GjgYVO9X37aWNbqUO3Ah0Vl7r8m5
         3cJnhZXzz8bn9ekjs7CmoXF2XHyAwmc4YbniZrx25b77a2nldZgPVm7oslkKpER+YpmV
         YoVEBTybPU3hm+Jf+kog53FQfp/iZLBq9CfvNMtB4zVv8ezEuZkTue6JLCzUp7hJ0Fno
         yFokFuQm5s5G9dFWuKIbQPcItgYO3/tHk4jHxEzinXOOrk8RkU9jyaUwMQjq6cxjKvQ8
         MTpQ==
X-Gm-Message-State: AOJu0YxbNVWxyBsGvWH+ajgC+1GLAxhmgMR/ivyj7LWScLmpKW6OMO1e
	uk8w1XfLtfPif5MOLge8Y9eOmJ3xgAyQS4AsV2QCVh/82bxPSVLVAELHVb6l5xnCUXWQiOaM7P2
	u7xt56TnVA50Ke6xpsb6nbqnl6dBTY0JMoQKk0Z+MjmQYYhdFz6DH7se8s8KGkZDPl/DlFKjYDt
	Zvdg==
X-Gm-Gg: ASbGncsGftjg8UmbatnUGBJDFBTAjHjjj9DxQJ93T2x8Bqgo431M5ToQKVK3RnnFjcd
	xJkK2qRfu3q6pTM9cpqN6D8x3VWlVdVAIATU0t7bU9rqwPXf5daWZcmYiNAHQOMPTYNkGaayfqb
	OwJJMtX7OvazPqFd+3CMLny5jtQw+IXFEOH2aaEwXxwSKLaTH3bZjo6O1pzzBg7ikLxxh/R2X98
	JUxr3IJLYKdtNzUpe44jsXZpLyYY/aosZn2jA+cnYAg847kyL5FToWJQ+KvMDaLy3i2enRdJLkr
	6J7+PUMN9HGNY4S6MF8OE1dWT8gRUpFoTaN1JfTidQjkFCTSfaI4Cvwtgm8IxyYUcI9C4mGyHDH
	/5/YLmbCXeaue850gRIrrwyDx
X-Received: by 2002:a05:620a:1aa3:b0:7c7:b513:ca6d with SMTP id af79cd13be357-7c81dfc37a5mr388684785a.14.1744712809071;
        Tue, 15 Apr 2025 03:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkM+bwvqNdL7w7Dl++B/hzjSVwEs0XQbT/DQ4+lO4dzFV7K1+2aMsgU0HDxfAxZ3KgooUYvQ==
X-Received: by 2002:a05:620a:1aa3:b0:7c7:b513:ca6d with SMTP id af79cd13be357-7c81dfc37a5mr388683785a.14.1744712808797;
        Tue, 15 Apr 2025 03:26:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:03 +0300
Subject: [PATCH 05/20] arm64: dts: qcom: sa8775p: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-5-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8Mi7Ym8qf1D1IGcDGDh4NVCjNUD1fzbWSnDojIEx+l8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRbLTxfNNdOKxb/0wbhrHjyJ1boyVcOPfm4Y
 rX/MJ8w+Q2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40WwAKCRCLPIo+Aiko
 1aGzB/9Z05kpQkUGnGxQsxw72G654XqjZITyoTBwTf+Is1scdR3/kB3jwfybgeZ+9rAYfcR8rd7
 kqpjrPGOKbUy9rR2J35IX9s+J27be7OghWZbmB9lFAKL89KPfLouwbey0DA8x+U4lx7quc9YJKJ
 MGOYUnMLS6w07Pb0kOxoa09ttKpItqs8w4ZL0W7AdPOKUVDeeTyE4eoP5y4UYXlPvG+zqClKNXY
 614nx0ZHmKCVtrIqyStGuZr5pXci7Hw5VxfJL92e4JXsjzjLiQShr6uooM6Ov2kPsrYD2n6DHyD
 ypyj2c4ZbVAV88+gMBnJofBfIvNQygsJ9rHmYT13ajIvL5gZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe346a cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=d33bsVFRY7PJn4_pey8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: RJCjgCYuQV4NC2_GOEz3oMEAv-O3a21U
X-Proofpoint-ORIG-GUID: RJCjgCYuQV4NC2_GOEz3oMEAv-O3a21U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=804 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 4da50c5ec612688a78b42543e23625b5a9801f2f..2e5f2ad8b92c94af488e7b4f060782dc96578606 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3992,7 +3992,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdss0_mdp: display-controller@ae01000 {
 				compatible = "qcom,sa8775p-dpu";
 				reg = <0x0 0x0ae01000 0x0 0x8f000>,
-				      <0x0 0x0aeb0000 0x0 0x2008>;
+				      <0x0 0x0aeb0000 0x0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,

-- 
2.39.5


