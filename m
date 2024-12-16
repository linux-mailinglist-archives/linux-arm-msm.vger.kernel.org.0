Return-Path: <linux-arm-msm+bounces-42323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AD59F2D71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 10:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B22CF165342
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C7E2036E9;
	Mon, 16 Dec 2024 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FRuf6/+X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13344202F8C;
	Mon, 16 Dec 2024 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342934; cv=none; b=SoYy2DD7e4/Np4sWF8laY9A1h56HA4ijTIp4AglMrNl0njt2+yMSBzLo/XDk9bDJ77+JdqmCjpxLqHrVqo9ng5k4+GIEmxijrurDlDF7XViCmHjJ2zTHe8hW3WoJ10yazDhBGRDVgBeiIW3srfi8RjgGzsyaJn4H+mcMVV+Bhlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342934; c=relaxed/simple;
	bh=eYFJz/GPJLIYUjxck/4wycaMJnjHGngHxm6V0sAA7Ts=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=slYESBtR4zxNRT/aJrkSsIm+Y6hK7bMzsbtIy5LzUDjbmVY1K+U6hJUgvz9RxoWfeFB8xzfeFsngElQNTCQA6YDo2DwywX60c4CCM6dMmRV10Kw6osdd3SMWIMbTaOEhZsCz5sFo2AJaihAYX1X1jBukk+wP74boo2OOlvNgevM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FRuf6/+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG6XRUL022864;
	Mon, 16 Dec 2024 09:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	empyLl+83ntZMucC9x5sGV2EqHFWEfrRWGy2bXqqVf4=; b=FRuf6/+Xn5HjuEOX
	C2Kl9ORhz6lVzc/iFHyBq3DifGGj7xmbTWMDWGiWNsvMBfs+9ohtsqxRTnq8shPr
	Kvj34tenP/CxTSFURUmEHQD/VldEwvuD3LoUAg78rS0C7n1Kzz8WMnlV/cZu4wOO
	+rLYpgh7IljiDxbuRolRPvPY6YUnTUu27wGtBfiSsYA9PicBBNtDudzHkfe7xYfM
	K237m0AML257p+eTVvEWN30Rn19lpu9uA+snkRnZXAZG9sJmC9ynWd4JzAQlfScD
	gm5boH54K+DCdN9gUPaLz8IDnZ6iefM7pCJPhiBUYyoOJxKcOCo0tS6m3CVoZej0
	68qHaQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jf1w8kgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 09:55:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BG9tOaN007003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 09:55:24 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 01:55:18 -0800
From: Xin Liu <quic_liuxin@quicinc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <quic_jiegan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_sayalil@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: qcs615-ride: Enable UFS node
Date: Mon, 16 Dec 2024 17:54:39 +0800
Message-ID: <20241216095439.531357-4-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216095439.531357-1-quic_liuxin@quicinc.com>
References: <20241216095439.531357-1-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lHrP3T4UdhtZlSQ1Z5oQ-Ax34b_SWtb0
X-Proofpoint-ORIG-GUID: lHrP3T4UdhtZlSQ1Z5oQ-Ax34b_SWtb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160082

From: Sayali Lokhande <quic_sayalil@quicinc.com>

Enable UFS on the Qualcomm QCS615 Ride platform.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6..c211f1a814a9 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -214,6 +214,23 @@ &uart0 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l17a>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&vreg_s4a>;
+	vccq2-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
 &watchdog {
 	clocks = <&sleep_clk>;
 };
-- 
2.34.1


