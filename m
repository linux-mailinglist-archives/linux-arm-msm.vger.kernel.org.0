Return-Path: <linux-arm-msm+bounces-30255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF8196630D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1FA01C23733
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 13:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0545A1AD5F6;
	Fri, 30 Aug 2024 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SPHrjCWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3781AD417;
	Fri, 30 Aug 2024 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725025175; cv=none; b=CpagKU9X9tMnqc1m+ycaIYOvTr/JdvvKPF90YXi+Ew4KE2K4ChGKI2z3ZC9TQ4CSFXYcLbBXWE5fsJP2BFD9jEqAGfWiqdRbNqq9aYHokBJuxG3GQ7Q4DyT2KEz0MW/VN1DmvZPYLYSqnxp8fAzBTd8L2whXS6U0MzOZ2ZYbm6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725025175; c=relaxed/simple;
	bh=0/U/Bu+zOnQLAhL/T7RnTo2korB4XLSYHTcuH5Wk9So=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pI1P/aRUW0RiDPWcSDueYNA5AVqKI/+HO0Ap1i3/dJOVkwFE8lUK72+Zm76/Lx4FqzHoAmK1fzBo3BrfJidSscxV5FcYg5xpcMlq2cy5yQoH0VqQ3KP44+T2ZCuV2X8ZOeANuo0CJK8959kHIo5si7YV4mu898554mMvpb+VdHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SPHrjCWS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UAACtp025957;
	Fri, 30 Aug 2024 13:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJMQAHkfajua+LW4bUHx/O3tHQ5nAUmKjgurZsgHtbQ=; b=SPHrjCWSpHXzjKMd
	RaMG1XvMELdvHLQximNTfa706zQjNkvLwFwnG514KD4zesTP8bfNBuFi3ZncJfWF
	M2Yfcni/uhcd0+ktFFsn/BVm5XxtWBRm1gOK1bSkaxCgS6ctGpNG7AYlZ14OhWxt
	xbcG4/f7VhTnqcFWeMqKu42yMSXN0hTwBPT6Gr6rytS7mFRGR3MXacLMzCXBz2Z4
	X5YvLRRbA8RsObEW1sg77WVAFGmVE5G1LfSMvX3N3dQ0YUKspi4Vx0nGAE6Imsc0
	syCGgTsGF3gkoATtZXTMxRhfQ4ncaUtfCzG0Y4ot4fQR9WeluBsC9fVqhgssBlfp
	6bDYUg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41arax3xm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 13:39:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UDdT4A010457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 13:39:29 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 Aug 2024 06:39:26 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <konradybcio@kernel.org>, <andersson@kernel.org>, <lee@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>,
        "Elliot
 Berman" <quic_eberman@quicinc.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Add TCSR halt register space
Date: Fri, 30 Aug 2024 19:09:08 +0530
Message-ID: <20240830133908.2246139-2-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830133908.2246139-1-quic_mojha@quicinc.com>
References: <20240830133908.2246139-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RvCTlc2o1J23cGKuIxHaH61_YytioJb_
X-Proofpoint-GUID: RvCTlc2o1J23cGKuIxHaH61_YytioJb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_08,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=789 malwarescore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300104

Enable download mode for sa8775p which can help collect
ramdump for this SoC.

Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
Changes in v2:
 - Added R-by tag and rebased it.

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index e8dbc8d820a6..fa057073ee2d 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -281,6 +281,7 @@ eud_in: endpoint {
 	firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x13000>;
 			memory-region = <&tz_ffi_mem>;
 		};
 	};
@@ -3072,6 +3073,11 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1fc0000 {
+			compatible = "qcom,sa8775p-tcsr", "syscon";
+			reg = <0x0 0x1fc0000 0x0 0x30000>;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sa8775p-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;
-- 
2.34.1


