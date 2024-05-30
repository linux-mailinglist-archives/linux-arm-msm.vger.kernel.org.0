Return-Path: <linux-arm-msm+bounces-21060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D568D4704
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F39C61C22650
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 08:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9984B152E12;
	Thu, 30 May 2024 08:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dpjXjL9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157F8947E;
	Thu, 30 May 2024 08:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717057585; cv=none; b=HgdXrQRtdnpLZn7qVVtuFtekhBooKgFm7VwlKzmBL6Z5VAkOK0iQc8w5K7uNLxIDxbNmhmUmmzmTBhz/PYlAFj/Oxt5g6z7KadeemPONT+YFxZpSaRIAXWYnOlhTt1YiRSjSPYF5il1CaM+GGxQkmemrJA3bsmY62ptEt6FIvbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717057585; c=relaxed/simple;
	bh=YqKPQ7kzSlamcFFO251BERhB6dhptDnxw+CiUg+dC/8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEPhCoRSSUN2no1VGmjsME68hv8m8KvNSLU0+4rNDF9DZOiw9gJlEb1YSWNzgztVBovq1zfJD07balTlIdoRfqi/u1ppEAQ5i1IsK9TdToaY9xix+rde1mPSuNTXrxHj7bxzKltqKiPcFkvW3pN78clN8mnLav17Ea5fTHppTI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dpjXjL9i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U7Tk0p000950;
	Thu, 30 May 2024 08:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6WYhfFZo3NSOji9iiHy7/6H3IVmPDrY+5DquU4saRCM=; b=dpjXjL9iuhVoiQDg
	iIK+i3osG950H/EC84zoRLj2G+fiO5M5la3qqsySSAIMidKZOoRcoiIzFsFW+uaT
	XxvPqaL6dgpwjWV80/W0OmTeNRzmW70LR5sp8y76Sy83YW3qArAwwizkR2zEcWgC
	tXrY20k0Qu+b6YygbJdUa9afcIxqVXtzLnO31K2S+FObrKLhtKz1wRm0SWRB47j2
	yuDtRuR0ZasqfLYFPo9QtFwAzS8qSClYjfT3gZ4eENLg/xOwFG6rEow4+sLYRoOo
	fAvZQV/vxeVwTKltLDZN2A1YtqNOxnAiHknok4IzEbWY3Dqv53/ljwVz+txOu+lV
	ApYZTg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2pug9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 08:26:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U8QGhK003597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 08:26:16 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 01:26:11 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke
	<mka@chromium.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>,
        "Doug
 Anderson" <dianders@google.com>, <stable@vger.kernel.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sc7180: Disable SS instances in park mode
Date: Thu, 30 May 2024 13:55:55 +0530
Message-ID: <20240530082556.2960148-2-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
References: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-GUID: Act0ZIPM_YgNs7Ys4ioGaumKmRNDm4_o
X-Proofpoint-ORIG-GUID: Act0ZIPM_YgNs7Ys4ioGaumKmRNDm4_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_05,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=633
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300062

On SC7180, in host mode, it is observed that stressing out controller
in host mode results in HC died error and only restarting the host
mode fixes it. Disable SS instances in park mode for these targets to
avoid host controller being dead.

Reported-by: Doug Anderson <dianders@google.com>
Cc: <stable@vger.kernel.org>
Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 2b481e20ae38..cc93b5675d5d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3063,6 +3063,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x540 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				snps,parkmode-disable-ss-quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 				maximum-speed = "super-speed";
-- 
2.34.1


