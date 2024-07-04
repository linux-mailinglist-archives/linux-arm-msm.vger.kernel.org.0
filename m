Return-Path: <linux-arm-msm+bounces-25286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED86927A0A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 17:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 715792829AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 15:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4233E1B1428;
	Thu,  4 Jul 2024 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BeImiB/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBDA1AD9CB;
	Thu,  4 Jul 2024 15:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106998; cv=none; b=VrjFMykTByUF0psHuxi62Mt1Sf5dRxiFy1ejbYTBZyJu7PFCnwlo2Byzw90GIwv8+yd8JDJlIojRsW6XKnMRMw/09z7gWvv0Cllkdg1BHG2Ztaiu3oiE1nklBJkzynxpn5UO1XhrzjFDvv04khcIBx6LPQVPY7fx7zf+biBEgd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106998; c=relaxed/simple;
	bh=nqbj245Lqk/BnzmG21dNWXUAnjP4PepU7tfdfPlaHGQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mCQrp3CFdDthbId9nXdD5nQxPdwX85upOJhYMnGJlCmUWIbytnNcsoVrVrlwHlmECCpfmBe7aTcTVheIm94pcNt7h3VG1euyVJ8uj+4hW81fbC0oJUR7IpJDpJhgS5kENQgi2R6o4kK07yQwygEpkVH5EZEHlcPYxZXltM2WYQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BeImiB/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464Exc1X011782;
	Thu, 4 Jul 2024 15:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iefFYZNqUmP6WnP8Suf1EEtxcDDucMELyuUCosCozMI=; b=BeImiB/lBb4zzzf2
	hFBLJRAk3ufaM8mhgChhk1DgfazoZ9tQmbEtp6jvUYwXGjpazSexvTw9P5SXi/xu
	AFiFA4jIODdvHb82gtXIh7KIWWqxAdA8olXUAkxB/JkIN0Ls9PNGQPVTXKtDeSXs
	+2OEbo68U4RsavbaijooYNuKCAoJmcU4jILps5qFpNlZWQWTzSERqJWEaQNk9rvj
	gZF4iwPLpiBqDgtdSwIcr66mE8uVGe62YWAdxfG5BWDhGQpj9bZPqwzp59bF1Jrx
	jqPDC9Z2yMAfFEp8szHpYySpIz9VBQdtNmdnRnY8ZUqye4+oJbcMOdFbctnxBecr
	DlFg0Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yr9c25e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 15:29:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 464FTB37006218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 15:29:11 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 4 Jul 2024 08:29:04 -0700
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
Subject: [PATCH 1/8] arm64: dts: qcom: ipq6018: Disable SS instance in Parkmode for USB
Date: Thu, 4 Jul 2024 20:58:41 +0530
Message-ID: <20240704152848.3380602-2-quic_kriskura@quicinc.com>
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
X-Proofpoint-GUID: up3F5Bf2kICWNNb0kkrXhB1JaHm-utlR
X-Proofpoint-ORIG-GUID: up3F5Bf2kICWNNb0kkrXhB1JaHm-utlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=622 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040111

For Gen-1 targets like IPQ6018, it is seen that stressing out the
controller in host mode results in HC died error:

 xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
 xhci-hcd.12.auto: xHCI host controller not responding, assume dead
 xhci-hcd.12.auto: HC died; cleaning up

And at this instant only restarting the host mode fixes it. Disable
SuperSpeed instance in park mode for IPQ6018 to mitigate this issue.

Cc: <stable@vger.kernel.org>
Fixes: 20bb9e3dd2e4 ("arm64: dts: qcom: ipq6018: add usb3 DT description")
Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index b3b98f050cfd..e1e45da7f787 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -704,6 +704,7 @@ dwc_0: usb@8a00000 {
 				clocks = <&xo>;
 				clock-names = "ref";
 				tx-fifo-resize;
+				snps,parkmode-disable-ss-quirk;
 				snps,is-utmi-l1-suspend;
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
-- 
2.34.1


