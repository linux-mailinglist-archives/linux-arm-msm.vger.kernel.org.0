Return-Path: <linux-arm-msm+bounces-27442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 718EE9422CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 00:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3019D2860DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 22:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E32C192B69;
	Tue, 30 Jul 2024 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o0TIxacb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C8D191484;
	Tue, 30 Jul 2024 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378291; cv=none; b=BoXwl7U6imNI81jTe0Ei2n137pIAB0oiha92ebLgcI/FJFQyFmAgmgPQAPNWZTzWVPnulx6YnOeOl4opRGkTzvaedZidtQxZrctUOMbcwuVKxJbnAHlpmPGkLV/UK4nz/rDlIM1h2E8hDLQs9rMldey7ldF3Vnh+IjrDBS/nfm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378291; c=relaxed/simple;
	bh=lvOlkDTRUnEcFJxJV/1lkIuxDBFgG44TOICslHyuHQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=DJutJsRuxTAgsVSLf7vJl4TwER/5oEvHjk9IOyuuBgKJfQ+FtkceXzY7PEj3gkktpH6xZzOBC8aoMnBi77l8dJm2x5oFW6s4j2pi9CB3aUIwT0RYPpClqL7aNjePwSEc/PsxX1JUkFZ6lcJ+8DkruGX31idNqzo6nD9uAYc3EmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o0TIxacb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UGNn3L023986;
	Tue, 30 Jul 2024 22:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=emFgidV2PjQo0hvb9+4EkubJQp1xq0/hVnDgFoEQqts=; b=o0
	TIxacbjqBp+o0UToy935J+pmv2utlor/bXKwlA5GJ7QiqMbiOXSrTkKbT72hab7v
	SfPmb9XfLqK/9sq6qB2BhfRbyRN3q9XdtInDDkWnrA0OcWEcCGR517U8t1ToqGm8
	cfgPvvzgxiOcGKOWd6Tpti6L3ewQLT6LNNwQhJqzeDRNsuFeqW/sWG4Y5l5g1OZp
	VF9PX03XeZ1TsULaj1wwEp4kRY3GpCOgolaKPR767RTNUjMSWq3Lv6YG0WAVm4gh
	FF5fhAa+YBQzBCiwfFXZbArg63QAasrbVd/skckQIo/RpXD7f4GDtNhw3GUGxyyF
	ThR0qsinCwqJd81Wr97A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw452bx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:24:44 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UMMKE8030869;
	Tue, 30 Jul 2024 22:24:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 40petpw352-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 30 Jul 2024 22:24:42 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UMKQfb028611;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-eserrao-lv.qualcomm.com [10.47.235.27])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 46UMOfAq003282;
	Tue, 30 Jul 2024 22:24:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 464172)
	id B22A0500196; Tue, 30 Jul 2024 15:24:41 -0700 (PDT)
From: Elson Roy Serrao <quic_eserrao@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH 4/8] arm64: dts: qcom: sm8450: Add EUD node
Date: Tue, 30 Jul 2024 15:24:35 -0700
Message-Id: <20240730222439.3469-5-quic_eserrao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240730222439.3469-1-quic_eserrao@quicinc.com>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8JlefN6MwQkn3v8PZVWfMpsrjqfVPnwt
X-Proofpoint-ORIG-GUID: 8JlefN6MwQkn3v8PZVWfMpsrjqfVPnwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_18,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=764 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407300155
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add a DT node to describe  Embedded USB Debugger(EUD) module
on sm8450 SoC.

Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 9bafb3b350ff..bcdf61223ff3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4693,6 +4693,35 @@
 			};
 		};
 
+		eud: eud@88e0000 {
+			compatible = "qcom,sm8450-eud", "qcom,eud";
+			reg = <0 0x88e0000 0 0x2000>,
+			      <0 0x88e2000 0 0x1000>;
+			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
+
+			phys = <&usb_1_hsphy>;
+			phy-names = "usb2-phy";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					eud_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					eud_con: endpoint {
+					};
+				};
+			};
+		};
+
 		nsp_noc: interconnect@320c0000 {
 			compatible = "qcom,sm8450-nsp-noc";
 			reg = <0 0x320c0000 0 0x10000>;
-- 
2.17.1


