Return-Path: <linux-arm-msm+bounces-33113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F799019F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 12:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20391B24C3E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 10:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0ACF156F3F;
	Fri,  4 Oct 2024 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J8HdUDO5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7DA179BB;
	Fri,  4 Oct 2024 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728039175; cv=none; b=XqywJ/DrEE0NWGPEAmAYilYcfq7Dg3qnxVdAcJqGtztFIaOQR6DsWSU4AW2IjMt+g0JykFfxu6vRECffiGeHZGtGwrIOpgTPafjNz4PW1Y9JxK51Zs9RU1ZztHz5wFk4q85JQNtGwgYj3HrysK6jHhX3twXErMgI+cCw3nzX8bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728039175; c=relaxed/simple;
	bh=pIzOVuVkhc6kXYknrVsMeJOUS3LdK2O+DEcJWZ9sVxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=sRF6D9xEmZEhLE21HKpWsncyNuZmmWEI7rd0zAoP9tEy5RKHElOKO54ex33SoHC/NbDGWqJHWZEsFtol/GrJz6FgAWNwC8xt39PyN++OqqERf7TXWCPcAe92n71iYon8+Nt9mPHP3qkGnVsZkT7K9JVlknFuUqIo3IEOV3ko8JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J8HdUDO5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4940ANIJ030783;
	Fri, 4 Oct 2024 10:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o5StGxFF1dJTjqxaY/vycE
	WOR0pN7tlMnFVa5OPOTGI=; b=J8HdUDO5QeTbSmF76D8AdWkL5lG1d1KjRmPoKo
	luyZXQ0ph5Dsd5cYDb2ARP0rw1QEpz2kUzifDzKIRFJmhIw5X7YP30VAwnn7PfZs
	TFun3T0x1S3sPE6S7YGR9RSdUE+V1CFUaPZ7bgzyPzwH+fBzlBKt49RdmO9jaHCs
	RbOp7aKy1V8uG89DJvtQ+4PRUjdN/4tc6h9FGwEqqHG0AovRXNUjjVSNA0q96iOp
	s92QECZNQ9S5ZIb736wwWFC0VsyVPng/g1EChZtUQMpbRquSWmYuiW4/Piro33M+
	MGGAh9gS4qcscsAM1gPJjGR2ARGgK+lcmY5D5iLWFcQMIpCQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42207v1tsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 10:52:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494Aqm4Y015789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 10:52:48 GMT
Received: from [10.213.96.105] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 03:52:45 -0700
From: Vedang Nagar <quic_vnagar@quicinc.com>
Date: Fri, 4 Oct 2024 16:22:31 +0530
Subject: [PATCH] arm64: dts: qcom: sc7280: enable venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAO7I/2YC/0XMQQ6CMBCF4auQWTvJtEUErmKIaesUG7VAK8SEc
 HerLFz+L3nfComj5wRtsULkxSc/hBziUIC96dAz+mtukCRLQaRw4TCnS7InWRNWpdSVqYV2LCB
 fxsjOv3/cuds78jRn9bWPf7QtviQ1QuFkn1XZENrHYO9oh+B8n5Ckapwio405touAbts+qnQnK
 64AAAA=
X-Change-ID: 20241003-venus_sc7280-642a6b81afe1
To: <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728039165; l=1178;
 i=quic_vnagar@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=pIzOVuVkhc6kXYknrVsMeJOUS3LdK2O+DEcJWZ9sVxw=;
 b=KOHoooR36wnmJL8Y1riiFMamayZK1AvTbW0biugMb1sjHf0GZRig97I6xSop4n9H6i2HbSj7q
 bvqyOnHmnc0BesOVGBqQOegvk9bfczjI+lEqOST363j4+Zb7jCgD4ic
X-Developer-Key: i=quic_vnagar@quicinc.com; a=ed25519;
 pk=GHqLT8NPue4v+CDHbZork8Ps39CBHq345GQKvCZ1glE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c6tkVEw-SvAoFOS9x-evQZjBokLytgrM
X-Proofpoint-ORIG-GUID: c6tkVEw-SvAoFOS9x-evQZjBokLytgrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=4 mlxscore=4 clxscore=1011
 bulkscore=0 spamscore=4 adultscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=133
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040078

Enable the venus node on Qualcomm sc7280. It was made disabled
earlier to avoid bootup crash, which is fixed now with [1].

[1]
https://lore.kernel.org/linux-media/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402fd4c03c5c2951721938fff20fc77..59dafbeeab1dfd6e1b021335ba1b04767d6c24e5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4288,8 +4288,6 @@ venus: video-codec@aa00000 {
 			iommus = <&apps_smmu 0x2180 0x20>;
 			memory-region = <&video_mem>;
 
-			status = "disabled";
-
 			video-decoder {
 				compatible = "venus-decoder";
 			};

---
base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
change-id: 20241003-venus_sc7280-642a6b81afe1
prerequisite-change-id: 20240913-qcm6490-clock-configs-0239f30babb5:v1
prerequisite-patch-id: faac726ebdf08240ab0913132beb2c620e52a98a

Best regards,
-- 
Vedang Nagar <quic_vnagar@quicinc.com>


