Return-Path: <linux-arm-msm+bounces-83705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5E5C9145D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2451D4E8CDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925612F6199;
	Fri, 28 Nov 2025 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoskWwKe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RklvgYOM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3182E92AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319228; cv=none; b=imIbtv/a1a5w7RQQLNE1lQNUNhXWiT29OR8BaSwbjtHhg5nbhvTz+S3rVK0Ndi/FIbjMHTjQ39S30p0Pg8ypeakTtZSImki7+yVOc1P2b0PDtrkLeei0FJiEMBDzpiPYm55PYLL3RRyBl31qJVaH56P5kdSYoD7RSbH+MBg9cyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319228; c=relaxed/simple;
	bh=ysZn+zbAbrbWtVp4TXSJi2v2dI+VNGoIJydWTuqjj7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IyPmSJzg7xLHi0rimTlsei9Mp9IjBDla6XNtbtAs+3MuaaTOW/pBGQ7vFu+7I3j+RaLhai5mQJpzeyz/Pobc8yBbDBuyRMLx/jyttnlybzpVwj13Rw5Mj2M0zHN70eyTnzL1MyMvwA+oEPryqtol9gldskTnGhESuaTUWxefQ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoskWwKe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RklvgYOM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8O52e3476509
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVCTkrbkT/rzInG1hgyw5Lwb+5uuUMolAlYJ/UpUKYw=; b=AoskWwKekCFt5Kxv
	1zpiEgHdTIbAibWHNkN1KMOk0+yklZ6CvlhT043yrJZDLPwhjSlYdxdbcPgDtOtf
	iu1xjNEUHMRCfiYtLogPQ51RhJecnSF/UDEPZnkBxoEydIoBueFFtrpzKcPLE4RB
	TCgkZQdDtFe6eoOv8+B3rBWsqppPFdOWepUaUhAuK9HGBZ6JZ8mr9wwTAO/xun/1
	9YwtFkNG5IkUKId0TjDfMguuiSmbfE04mtbIJgevFYZsQi8G/E/6tsRGtSr6K4xN
	mWdQphg3KTltRYca99NufP0ZIRN5d24hkSq2eSoDqWmVlU0511NJSxl4+ORH3Ma0
	xltvDw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpu9qrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b92bdc65593so2882792a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 00:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764319218; x=1764924018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVCTkrbkT/rzInG1hgyw5Lwb+5uuUMolAlYJ/UpUKYw=;
        b=RklvgYOMCcsfeTdxR9aEiqaKaktleFnNOEP0YKGUo4H6OOuXShROW9z6WTWPMilBE3
         sVSMH/ip6f7U0VK/hxO+KIgfzWkyRNj14JAgdltnI41r3vVyfszmRTfdVTfPRlWwyG+C
         cxePEZStq8jnk1ikIQellFnM9KFZwCnpm4+f4Qlq9+6GaIfJ8beUJN+qNlx0CT5ukVUC
         R4Z6Q9Ra7SqZ15XvgLVH79emRG1X/PBniviqwn6v7Gj9XKK8bd+lPmfR+Kg0DsnYw6Cq
         lVQR+xv5kK0h3RaRhmBSwKFYkpi42pzKM+XNzz+Ea4plj5nilAFkJrt/ZO62vtcr7pM6
         /7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319218; x=1764924018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nVCTkrbkT/rzInG1hgyw5Lwb+5uuUMolAlYJ/UpUKYw=;
        b=r2Jv+diW7rWeWfi8N3iiTC0izS6kn7m3D3MgXyipVvHeNEciZtY8x71CsCbv8S5T2y
         Gyinvcwn/iHRTE79/LggklcOu97/ANRTUUCaNsYwEuSje1hFREHxASp0KbusI2uJZmVB
         q4sd9mX6zc2rrIWpnR78Z+pzDRCs3LuZZd6RiUIzOXR7k3am6xacRWmfd+5DPPyOd+gW
         Wo7Vli36uf+qpwHK10Y5sHsk25h4t2CAd/juNcFSEC/ovpC35icTUr6xwpbP9xFeztdN
         WDmM50s7rfJhy/19WEYStF6o+WguIzqy1iJM7NTGwBEnZy4I1nR5fpIXnUV9QHoLYb6Y
         eyJQ==
X-Gm-Message-State: AOJu0Yzu5jbr+Jjl/DIoq6807UR9ZcpECBTpCVQZDEqeHS6I3SN9LOjd
	eZM73w8gfdYoGJag+NoM5l6HfxadcHdDnlEAbYJXd/Sr6bQMDxrUaMHMuAkzJkmjRxz0xyP8hD7
	xCQUQJYQwpHx0s0xNJq/zhrrcFzNfj3+LLh+fGFTew521ZfBImOAmmSFk/cePD8JP7DSL
X-Gm-Gg: ASbGncs7+AgkGTGROskSLMCCoyKsbY+RA2xXd/PysSabew3cM30vxLRzOXYjTfLwkel
	/SsjkCfJ9AZr/Wph2hv1JlffBb9+4sl2nm68hcEyqIBGGZo8KstwTQmkdOjPZLcZKl0+lw1hbi/
	Hj93TebUomyjhnivBCTasee3h7oaFItPyPtGvTGqL7DIffRJ7Nr8NwBnzIC2Wq0CHSDtnHLxELJ
	kpGauMcJElOLfSkye+EX13LCsLkELsDIxXTM79BUk5Wk3wF/Z0ekb/bda84SbpbpcpEu3cJEl89
	thJlZpnPrWtPJ4MQodLfjS32cLl03+5ZYiHmMXldAmuntOKl7rICViRD7GRpd1pil3FoDU6koHp
	uA696C7RV7GYTr1gfhXtTFkQBS4MrJgz7iE9P7YVKv19C/zgRQj1d
X-Received: by 2002:a05:7300:a903:b0:2a4:3593:9699 with SMTP id 5a478bee46e88-2a71927a3b7mr21651806eec.22.1764319218407;
        Fri, 28 Nov 2025 00:40:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvLFQjHSljmTko1192Z3r1NZpMHLko+3RxNTojw8NiRKixmbZt5C4pR0Tk737ckx+aiYNp8g==
X-Received: by 2002:a05:7300:a903:b0:2a4:3593:9699 with SMTP id 5a478bee46e88-2a71927a3b7mr21651775eec.22.1764319217919;
        Fri, 28 Nov 2025 00:40:17 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm21895872eec.2.2025.11.28.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:40:17 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 00:40:15 -0800
Subject: [PATCH 5/5] arm64: dts: qcom: Represent xo_board as fixed-factor
 clock on IPQ5332
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-qcom_ipq5332_cmnpll-v1-5-55127ba85613@oss.qualcomm.com>
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764319213; l=1629;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=ysZn+zbAbrbWtVp4TXSJi2v2dI+VNGoIJydWTuqjj7s=;
 b=Slrarzk3ShB5tl2JJ4EVIvu4kZZbu0CGXywc6rmBiZ2JxPkpef8u4Gmf2rIjTg89Go7SxjwrM
 jlxlKsiZKoUAwJrgtsvaAjhEE7VG7DYU7IVjhd9z7WUveDomGc3ilvL
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: M4rPEwV8p51lDYPngjSPr1icVXUrAr_E
X-Proofpoint-ORIG-GUID: M4rPEwV8p51lDYPngjSPr1icVXUrAr_E
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=69295ff3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cZQRF-JHJlm1EiHCSyEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2MiBTYWx0ZWRfX+YuLGWTEzinj
 G5isHodCZ4s3AfQ83OIF4uB95iuc+04ozWZU2/AD4oD0LMTK1HovMfKLUwJD+CaOALDUs+CVHZd
 BLn6sWzoErdkvf09bdDfRL1o92RN1bY831Gw0HkJBI4uOPyNOM85n0Zz5Xb4X+wzGh/HzdT6aKv
 RxWZBWNACa0NswJc0elk2W8YBSjlIl8emMAfbfjmqpDH9/GjjM+ASAZCKtdXkhgXj29a3/YcIvp
 UFrxXagRR2NWOXpAKf1qVsHaZ2Af4dGYexRt7EYhoUb2J7QVRzd9DQYA8jtyzZf46F+p8RA5G63
 rLOC0VtPnvuHTMIPBsExPRKpUXISgW005zyT/IaQ6QEfInZGp1JZI1rr82Dw2CRUDt0NMQjsHOO
 4nPNZPomJk/QM4FEAmj9FA+1N/Fk9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280062

The xo_board clock is derived from the 48 MHz WiFi output clock (divided
by 2), and not a standalone fixed frequency source.

The previous implementation incorrectly modelled it as a fixed-clock with
fixed frequency, which doesn't reflect the actual hardware clock tree.
Update for fixed-factor-clock compatibility, and properly reference the
source clock.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index 471024ee1ddd..e1346098ab0e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -70,8 +70,13 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 0707e053f35d..9e30be3930d8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -29,7 +29,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&ref_48mhz_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0


