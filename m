Return-Path: <linux-arm-msm+bounces-21550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B998FAA74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 08:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5331285C79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 06:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE44513D2A5;
	Tue,  4 Jun 2024 06:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f68DVJ5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCFC13E889;
	Tue,  4 Jun 2024 06:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717481249; cv=none; b=hGVLRcNOi2ejUBr6ZCiulzOakQKqmfXzOp0Yxc3fzv9gHE5IrO36TA2cVo3NJzO4Zyq7xU3x19KirRCu25qFV49u+6OPKgZYmlRmt+7MoRIQMpB+yoRWG4i6rfXSekHG70G1TuaVU9O9X2cseLAAS/zWyY2VTsjrpI9/xHtjG30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717481249; c=relaxed/simple;
	bh=kPoXJC4QWs2kZrVUrhU9RPojbVzYDiYlA5eyHhpFWHQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P40A4NxFAcLoYpbslEzyfs+NejDBib1NsGbDJViPU3Zwm9lYZcayev1hUCMm/1Ca4m89S6WNy1VpMb5XrgX/FBpYU35o7hqgh5in0yN8r0FWZQD6hqY2cNimS3MMVVDlbLMhFlwf/ot8mGVShA+vsvoHJ1vbZbdna2NIXh34MEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f68DVJ5O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453KHshU000710;
	Tue, 4 Jun 2024 06:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kK9tZhStWVEWLycuvOE4VIqYCwolnRi3oheJTlwiZrg=; b=f68DVJ5O8YYCsM7W
	rpJ6qfm+JWMbT/hBQxcqUCxIJMkad8JljJ0IHWA3uIQDQ+qJbEGnPCtwIQx/k0Ow
	+L39iP0obTwW1BQr6vgDnaVYiAyExkYCnk08A0iSTSmyUSgtYKmWodt2lpMSqYGB
	PJ3c1m73qwi19MD5cTwOG36RkZ3JC3D0VeFtrpLczzBvgtpPl3hjQMl8rd3TKzr6
	xXEERLtSDL8sTmstkaCNAAr8mDlDosB/uUbHfP2H6dTkazwPpJyMfdmBCLGlwzTW
	UV0cVu+mGlYW7TZuYd1iX+EjkaGi1R+fNp6LtzgxOFePRU1earhcXlX9nPyuaB43
	OjlHdQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5kp347-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 06:07:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 45467LAP004240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 06:07:21 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 23:07:15 -0700
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
Subject: [PATCH v2 1/2] arm64: dts: qcom: sc7180: Disable SuperSpeed instances in park mode
Date: Tue, 4 Jun 2024 11:36:58 +0530
Message-ID: <20240604060659.1449278-2-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604060659.1449278-1-quic_kriskura@quicinc.com>
References: <20240604060659.1449278-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-GUID: M-1aHij5s1NhD2rg6JmNCoAgmMt9b2Zg
X-Proofpoint-ORIG-GUID: M-1aHij5s1NhD2rg6JmNCoAgmMt9b2Zg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_02,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 mlxlogscore=664 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040048

On SC7180, in host mode, it is observed that stressing out controller
results in HC died error:

 xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
 xhci-hcd.12.auto: xHCI host controller not responding, assume dead
 xhci-hcd.12.auto: HC died; cleaning up

And at this instant only restarting the host mode fixes it. Disable
SuperSpeed instances in park mode for SC7180 to mitigate this issue.

Reported-by: Doug Anderson <dianders@google.com>
Cc: <stable@vger.kernel.org>
Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
Removed RB/TB tag from Doug as commit text was updated. 

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


