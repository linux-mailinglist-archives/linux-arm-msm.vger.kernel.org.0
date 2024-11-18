Return-Path: <linux-arm-msm+bounces-38172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F69D09B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DD31281CD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 06:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08ACA14F123;
	Mon, 18 Nov 2024 06:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eyb8uyfA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2208D14A619;
	Mon, 18 Nov 2024 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731912355; cv=none; b=bqnmehkEN00+Sn2n/lkLFoVx7WW094ykeBXy/53yt6FIlh60Xvb5XLhR+iuUIW/3exz2aMkEp48ZjtJG8Vad9Nao9C8YP7iAGjisCDGEGha5Mbrf8GiOByziTTVu5RQWxxf7jyu3iSczLZfEirZ90lMId8z7/ub1qMJzkzha/fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731912355; c=relaxed/simple;
	bh=0qZUPdGJk7bBM+UxhZdM6wcIbpEizh3WpNn2B2lAzws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EuYo8cJYbekl4uZokL1nkyu/VqvFMFU2m5dEXO2u6bQ5Truj29kxBAlcklfij2J5NebWjnAoKFmZhHFBxnn6Bv2oHSFosW7JIB9JKXcjHGOE2Nfkbku3Zxjxvcp1BjIF+Fzf8RcJXxe9aaIHp2q62eGUovb8L1ZqEh/GVClHfMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eyb8uyfA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5Rot4004351;
	Mon, 18 Nov 2024 06:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iK4hvlfKA1B5TOlkb/qDrP+TI79PdOVDfLf8BJRGGg0=; b=eyb8uyfAW0xEeuA2
	t2NJgcVM+DvsEoZ1zNQMzngXFZz9PpV3k+EUTUYMk77i+9+aFjPnPdrfFSw6YRj0
	27OXb/S9+CpW2YDr1CylwwJogyHc0c8lKqpn1XESwz/82gSKvPUh5KaLjyVfALNu
	aDhrrKW02cfRi3esxYwp4pUInKUrAqp9fIOKK+v+K9rpK2QqMRnIEjNwe5e4/2Bc
	/EIrbsyLk2ic1qUYWRM8jFHNip5pfP5YWjRG8zP6kp0bAZicyY3tuVqtz5mcfwSn
	w1yYT1jwyNw73VcB8U6+3N+ZipW9yEtQphPhaOHfk7z4qzfs3G3Vi9YsKEz53nqY
	bQwLog==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xm5g3m7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:45:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6jk5I027342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:45:46 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 22:45:42 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Mon, 18 Nov 2024 14:44:01 +0800
Subject: [PATCH v2 1/2] arm64: dts: qcom: qcs615: add ethernet node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-dts_qcs615-v2-1-e62b924a3cbd@quicinc.com>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
In-Reply-To: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731912338; l=1557;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=0qZUPdGJk7bBM+UxhZdM6wcIbpEizh3WpNn2B2lAzws=;
 b=MsUHD8jkhc0p4eO3SrfoBRfChT6ApXL8WER3ZCv11iQOu9n+4FxUOFJkvW2WHGGl0WyiMa8Vy
 VoJAHpAnszOAIhcQD42va+5093Jn3iOZL+Uu5nlFl5akhMx6ZjdcARO
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RMfz0mxFFypAfNSUXCmzBr5NdoC7blkF
X-Proofpoint-ORIG-GUID: RMfz0mxFFypAfNSUXCmzBr5NdoC7blkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 adultscore=0 suspectscore=0 mlxlogscore=681 phishscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411180055

Add ethqos ethernet controller node for QCS615 SoC.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 868808918fd2cdf3f23fcb43ead61b2abfc776f7..e429a012428701b1240556c919c630382b3ee8ce 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -375,6 +375,38 @@ soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		ethernet: ethernet@20000 {
+			compatible = "qcom,qcs615-ethqos";
+			reg = <0x0 0x00020000 0x0 0x00010000>,
+			      <0x0 0x00036000 0x0 0x00000100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			clocks = <&gcc GCC_EMAC_AXI_CLK>,
+				 <&gcc GCC_EMAC_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC_PTP_CLK>,
+				 <&gcc GCC_EMAC_RGMII_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "rgmii";
+
+			interrupts = <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+
+			power-domains = <&gcc EMAC_GDSC>;
+			resets = <&gcc GCC_EMAC_BCR>;
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <20480>;
+
+			status = "disabled";
+		};
+
 		gcc: clock-controller@100000 {
 			compatible = "qcom,qcs615-gcc";
 			reg = <0 0x00100000 0 0x1f0000>;

-- 
2.34.1


