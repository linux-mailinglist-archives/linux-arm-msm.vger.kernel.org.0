Return-Path: <linux-arm-msm+bounces-25291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65B927A1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 17:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38DA428A28F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 15:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5B51B14F3;
	Thu,  4 Jul 2024 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h3vv6bwI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4461B14EF;
	Thu,  4 Jul 2024 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720107029; cv=none; b=OMQ49MUO5+qLF8MBjtXcpSPwl1D4gias/EI7cvIrK7ByAXnooIS1ReROeGnZHgWOfDWouaBXZlLJTpixMhk64EKBEypyazFu0GD38g0Zja7kSzDTOk7VBLTiy9IoUfzJlS/Sw/dSIkxWo1YpLAAYavo09BfGjjwIhjyPVwzoRcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720107029; c=relaxed/simple;
	bh=V5dhI4qj5CZa0nIHGUQJYyyWyzth5S3eh2OENjg5ZAE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kHOnI5+d0FxCZRxwftoEhLixtFyUzQl0xdYDXSvQyi3QYhGrgPEaEDU2mK5X5uKLBTLaWCIqynvAjDnby4EgVS/B3jfFCLnT6Y3VtciQO7nVTce4TLbyPX8S46kSrUlfmLa1D2Zt8Ux2mnm4aMLKEtxKiamsK6sBb0Mz44ZRCeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h3vv6bwI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464C7HDp013722;
	Thu, 4 Jul 2024 15:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUSpm5sGut9yQtILr06gEY9yEfaS57tmtUYI7PG+XMw=; b=h3vv6bwICiMdb1w/
	69tg/xlmFr05J3Zy9fH5vLBWDpzDc9wiikWB84xl/fgST59k3lNZDAmaBeo9jI5v
	T75nQisA7mQLP8AFWQDtbeQz3WpiDElqTR2VjiFkI31B+9noBj4KAd8//EH/yxqx
	Y0M2SK8mpKuPJIu6txOCvEXU5KrN/Oy1ICBilpj9JZ1gdKEVTR07+kP+hZZHrnkO
	TmJGICZbjaiXEymQWPFzr2lmacZ9DyJnKXKqzBNjqpxQhv7mF/58828K6Q0e+Dvm
	oNc0J8a+8Sb2X8qeCTyK9DIeRLR+O2IjdrMBtXlbmIWTIgee7DVDyq9NkZwQB7lH
	2ll5BQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4054ndua72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 15:29:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 464FTn3x007723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 15:29:49 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 4 Jul 2024 08:29:42 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Baruch Siach
	<baruch@tkos.co.il>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        "Sivaprakash
 Murugesan" <sivaprak@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Douglas Anderson
	<dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, Iskren Chernev
	<me@iskren.info>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>,
        Vivek Gautam
	<vivek.gautam@codeaurora.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH 6/8] arm64: dts: qcom: sm6350: Disable SS instance in Parkmode for USB
Date: Thu, 4 Jul 2024 20:58:46 +0530
Message-ID: <20240704152848.3380602-7-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
References: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YL9-v06rcHcm1P53hCNeebEKlNxr1mXR
X-Proofpoint-ORIG-GUID: YL9-v06rcHcm1P53hCNeebEKlNxr1mXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=627
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407040110

For Gen-1 targets like SM6350, it is seen that stressing out the
controller in host mode results in HC died error:

 xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
 xhci-hcd.12.auto: xHCI host controller not responding, assume dead
 xhci-hcd.12.auto: HC died; cleaning up

And at this instant only restarting the host mode fixes it. Disable
SuperSpeed instance in park mode for SM6350 to mitigate this issue.

Cc: <stable@vger.kernel.org>
Fixes: 23737b9557fe ("arm64: dts: qcom: sm6350: Add USB1 nodes")
Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 46e122c4421c..84009b74aee7 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1921,6 +1921,7 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
+				snps,parkmode-disable-ss-quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 				usb-role-switch;
-- 
2.34.1


