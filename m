Return-Path: <linux-arm-msm+bounces-89106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07172D229FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B209E300EA3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BDC2F25FD;
	Thu, 15 Jan 2026 06:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6UW3se4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibnYUmhf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FAF2F0C49
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459764; cv=none; b=e2MBONsLQAdghCYoNWxCElzHmGnhnxe6tqScbTVUWgN2BaVC1qAGuH5KHstDSxOKaqq3yFVy6GywrOwNjKbimpmwyntH7Hn+gv8gwYDntJMQCEzcqK+AUu4wLMRV/frbvFC/QCdV08/7hXfadWriMhwYAx28psJQqp9PMFzH1dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459764; c=relaxed/simple;
	bh=1em+TGSoqfXn7ixdbrG7OS7LqS9A8AeB5DOEyK4xRs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ksjx/myrzPhwWmykqFVGYRnnKoWlxLlZvcvZf3MLX0MILiXdA7O+zWNbOHREn+P//QRn9JahTeC1mcng9qVWs9wMQdX/QdVVHezM7Qnnx5Y8KV62+Q71Jv9UwaAkl2wl5vTf24/TU89cKtk9zc8L+4lIODjD0BiTN9MRYK+3siU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6UW3se4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibnYUmhf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fjxE1850835
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBLMhpAoxA7gX/R8PINLFKG5sxDHLas6GJap2I5S4kM=; b=O6UW3se4pQ/v6Ww1
	b4esVb88n97hxuO0MxSH+BbwJUxmTBPH2tUmcEnIPS2Cq7lfCwUvUA5ePc1MuHhe
	VRM6BZXYVLo23haDUhVedNSrnNQh9XJ0KxEdCbNWJkFQnPHYdzGPJMLBXJUZRxg1
	uUAToN16/iPEPKrrY00d255wP2vM78zIf4I0JdsqCfdKOfgJR9jwjfF6EYWbvZr/
	pf5yuNuq9avvrlwuuvPe+NK0HLdmJHjsLEgNi0XTOWCW0aKSIo8GFwz4AuhB+xg7
	IrXWmjr1FcW20HpcWRpOaKXFcB2BhL/9xfX3lDIfPSre3NPIJxNatB68ikqznZX4
	nS1k0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej0d35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae29a21e7eso728248eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459757; x=1769064557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBLMhpAoxA7gX/R8PINLFKG5sxDHLas6GJap2I5S4kM=;
        b=ibnYUmhf06SU5+Uc86ZcB7BJnOi2+eZ5SVn5amakf7jU8MwxX+49dIkfgeFPsqahCy
         Q1nA4c69D1q27Ako1DHWJdkxQn43Pc6l/Sggg5ZkxVDdALOHqkfOPlLJOjPa4qtuidED
         /Cy6YO00qTZRZ5F5DdU6UfhevyxdgZcqdLrpZxTk1Pb/Gt/iGPsljPXPC/nITdliwUpU
         IE0g6HpT3+TWw8tb0v0GEWFdr2kg7I629vO8OpOc0i6DWy2/Hn6wL0KPh7ahP9/M06tC
         rMCH506DlXRs701LjpopWCyD+M9kX3n9kRIMchM8iEZoh2MxVPuikEXHIKVnpEOgLtlS
         NMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459757; x=1769064557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nBLMhpAoxA7gX/R8PINLFKG5sxDHLas6GJap2I5S4kM=;
        b=Sz3wkFoJrCx4m6G8s5341XZVrnwUWdR1XxxcCOLdTnhNFGnlDvZZlPJjXD9ZBecSz1
         gWzMBo65sV95hdMo22MoSvhZM2d4gfPAdVgrJyuhBqT4GmTH5lxVkcQ0QGoij6NwZNxQ
         Pr3zlaKfnuZjqZqJE9p86ix2UqO6XEzfHWSnkHs4KBeENaztWHArUelNdSm0STVYlxSo
         IyKVwARdx3SA32FAYLH8B6T8kP6PnwY4bkyabdCtJ86qgKIrquPCJ3nxqtRYOYtxMzyd
         PoDXhZUGte0JitAiFPAAGefw8SVhXy+DJss4Xv1dc8INsSCKd07GGu/TvxQrAt/CIyPm
         vcXw==
X-Forwarded-Encrypted: i=1; AJvYcCVoCIB/T/SdYbtFKHvEmw1/hB8YIeJBXuqo4eJV5BXoQr+2a8C3tlzJZT5oMK5R3j6tiSCZQqnbCMCilo1k@vger.kernel.org
X-Gm-Message-State: AOJu0YwjUG8cGeqYesRhDt2oHCBsKvJpoVasX22d2rSYlssPRuTPxMuW
	H5Jnw+QjvDYquLePCzV/FxQ9Zki8tnf9uHREOWgZziL3dQiMO0KUS8mjnju6ShxZNcfPX1k26cj
	WwOvBweGTisEoy6ekz5ypLKdA8ZnVUJ/YdpWqVkdwFpa4lTi+K4ehGmwJ3CxFPpTip/t5
X-Gm-Gg: AY/fxX6uoEMk3WgIOFIzWC5MLQfRN2syl6ji9Yc4GtEGodhCUnEsrnZHVkUVrH3zwQ5
	11qvFteD8YiUKVkbyJQE8+ydSoQHPrPSoEdyyP44KIKRyupUioOSPwl+pIMEjiOK1D6BNOFaTrs
	lCWBPGg4jbhT/XUIQ9O1z//+Jb2pclw506jW51bmDF77BTtqus8afWb8z6b60QqWYkondanCxN2
	hb2N4syEZI1zyQE7kr+yWK+Fhgv1fTfw0YGKPJgZKYTbd2NPaJjgyntS5NKbCAGBv17RYgMkmU2
	gKiEDdNzJxS+bb+eemsWa7xHQTct+P7pPv6+tsezMhS3GMh7XdIODCHlADJ+W2W4bgMok9gO8mm
	ZlYes9Zo/gjVT26AbO6DEk5tlTlYbdZOfdtWzKXJ1u3OD8Uf8OXOmrIz6de+w
X-Received: by 2002:a05:7300:6c12:b0:2ae:556b:76f2 with SMTP id 5a478bee46e88-2b65b8e3500mr2754679eec.6.1768459756734;
        Wed, 14 Jan 2026 22:49:16 -0800 (PST)
X-Received: by 2002:a05:7300:6c12:b0:2ae:556b:76f2 with SMTP id 5a478bee46e88-2b65b8e3500mr2754634eec.6.1768459756094;
        Wed, 14 Jan 2026 22:49:16 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b480dea94fsm3259143eec.24.2026.01.14.22.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:49:15 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:49:03 -0800
Subject: [PATCH v3 01/10] arm64: dts: qcom: kaanapali: add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-dts-misc-v3-1-a6cc9e45de93@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
In-Reply-To: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459754; l=23446;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Yx5VQyk9T8zr3doGPyurqp2OyqH3AdVL52ILnOdezUo=;
 b=uf7NvWPnUtZf/AUbk6wl4k02w2EI33BF3AZrxJ2zWxZAfXpd8KLF9a5h8kQ2lGbL1yzFmqj1f
 jdFgMvBNk8tAGWKViIMFcMR8kwQZSfViHl2yzkpZ17zIqPsVJ/+ThnV
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MyBTYWx0ZWRfX4AeVHBCHvN/1
 wnHMf1ya5txYdnuVyAOQ6DFeqiw3IrBLblgH3FFCUVzAOayNiMBC557pEYcpytn2gvlwfaHfb1P
 dWzM+PO2MOg1Y7TCeGp65yWLnFMtjRFtrwmQ1ORPRWxqlutC6bwEOqjPk6qkGDPh3T/PV2h/ROU
 kFWf50eoJE+PDEc1EGi68iQeUDYVcXmITyerZphHYeclLQET2oMT93k5azH2st9HBme6ejL+42+
 74WzMF0EwlS2nIUXyFLLGGzuxc4eLtruIQ+XqcGs7WXorgCl8zpVIlPs4CjsS6tsmhxKpNiQ4bh
 YtaEP+0eVGfWkmWFY4xY7w7YARJkXELOuAqy1+njylGk8dApai2fNGNN4kHIS0MkdM/nQJee+fM
 p8rw2e7epTchWw2sxD+1fJbNbIPkjhNxAEt2xpgbuQKtA8xd3FK5sVadPPzunNSlIxyBdSG6Y2R
 qLesIte9PjU1enY9dsw==
X-Proofpoint-ORIG-GUID: cvccO58Q41cQiqKBURbaF2cW_CfnzXuL
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=69688ded cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7UlbJtpOWuNyX1kucuYA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: cvccO58Q41cQiqKBURbaF2cW_CfnzXuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150043

From: Jie Gan <jie.gan@oss.qualcomm.com>

Add CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
These devices are part of the AOSS, CDSP, QDSS, modem and some small
subsystems, such as DCC, GCC, ipcc and so on.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1160 +++++++++++++++++++++++++++++++
 1 file changed, 1160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9ef57ad0ca71..6e231850d5d6 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -1080,6 +1080,1114 @@ card-detect-pins {
 			};
 		};
 
+		stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+			      <0x0 0x16280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel_in0_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@10003000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10003000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_dcc_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@10004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_qdss_in0: endpoint {
+						remote-endpoint = <&tpdm_dcc_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_qdss_in1: endpoint {
+						remote-endpoint = <&tpdm_spdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_qdss_out: endpoint {
+						remote-endpoint = <&funnel_in0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1000f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1000f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_spdm_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10041000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_in0_in0: endpoint {
+						remote-endpoint = <&tn_ag_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_in0_in6: endpoint {
+						remote-endpoint = <&tpda_qdss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in0_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@11000000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11000000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_modem0_out: endpoint {
+						remote-endpoint = <&tpda_modem_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@11004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_modem_in0: endpoint {
+						remote-endpoint = <&tpdm_modem0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_modem_in1: endpoint {
+						remote-endpoint = <&tpdm_modem1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_modem_in2: endpoint {
+						remote-endpoint = <&tpdm_modem2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_modem_out: endpoint {
+						remote-endpoint = <&funnel_modem_dl_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@11005000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11005000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_modem_dl_in0: endpoint {
+						remote-endpoint = <&tpda_modem_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_modem_dl_out: endpoint {
+						remote-endpoint = <&tn_ag_in13>;
+					};
+				};
+			};
+		};
+
+		tpdm@1102c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1102c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_gcc_out: endpoint {
+						remote-endpoint = <&tn_ag_in17>;
+					};
+				};
+			};
+		};
+
+		tpdm@11180000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11180000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_out: endpoint {
+						remote-endpoint = <&tpda_cdsp_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11183000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11183000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_cmsr1_out: endpoint {
+						remote-endpoint = <&tpda_cdsp_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@11184000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11184000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_cmsr2_out: endpoint {
+						remote-endpoint = <&tpda_cdsp_in4>;
+					};
+				};
+			};
+		};
+
+		tpdm@11185000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11185000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_dpm1_out: endpoint {
+						remote-endpoint = <&tpda_cdsp_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11186000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11186000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_dpm2_out: endpoint {
+						remote-endpoint = <&tpda_cdsp_in6>;
+					};
+				};
+			};
+		};
+
+		tpda@11188000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11188000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_cdsp_in0: endpoint {
+						remote-endpoint = <&tpdm_cdsp_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_cdsp_in1: endpoint {
+						remote-endpoint = <&tpdm_cdsp_llm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_cdsp_in2: endpoint {
+						remote-endpoint = <&tpdm_cdsp_llm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_cdsp_in3: endpoint {
+						remote-endpoint = <&tpdm_cdsp_cmsr1_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					tpda_cdsp_in4: endpoint {
+						remote-endpoint = <&tpdm_cdsp_cmsr2_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					tpda_cdsp_in5: endpoint {
+						remote-endpoint = <&tpdm_cdsp_dpm1_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					tpda_cdsp_in6: endpoint {
+						remote-endpoint = <&tpdm_cdsp_dpm2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_cdsp_out: endpoint {
+						remote-endpoint = <&funnel_cdsp_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@11189000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11189000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_cdsp_in0: endpoint {
+						remote-endpoint = <&tpda_cdsp_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_cdsp_out: endpoint {
+						remote-endpoint = <&tn_ag_in16>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a3000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_pmu_out: endpoint {
+						remote-endpoint = <&tn_ag_in29>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a4000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_qrng_out: endpoint {
+						remote-endpoint = <&tn_ag_in18>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a5000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_dlmm_out: endpoint {
+						remote-endpoint = <&tn_ag_in25>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a6000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a6000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_north_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in26>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a7000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a7000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_south_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in27>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a8000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a8000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_rdpm_cmb0_out: endpoint {
+						remote-endpoint = <&tn_ag_in30>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a9000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a9000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_rdpm_cmb1_out: endpoint {
+						remote-endpoint = <&tn_ag_in31>;
+					};
+				};
+			};
+		};
+
+		tpdm@111aa000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111aa000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_rdpm_cmb2_out: endpoint {
+						remote-endpoint = <&tn_ag_in32>;
+					};
+				};
+			};
+		};
+
+		tpdm@111ab000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111ab000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb0_out: endpoint {
+						remote-endpoint = <&tn_ag_in36>;
+					};
+				};
+			};
+		};
+
+		tpdm@111ac000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111ac000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb1_out: endpoint {
+						remote-endpoint = <&tn_ag_in28>;
+					};
+				};
+			};
+		};
+
+		tpdm@111ad000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111ad000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb2_out: endpoint {
+						remote-endpoint = <&tn_ag_in34>;
+					};
+				};
+			};
+		};
+
+		tpdm@111ae000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111ae000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb3_out: endpoint {
+						remote-endpoint = <&tn_ag_in37>;
+					};
+				};
+			};
+		};
+
+		tpdm@111af000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111af000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb4_out: endpoint {
+						remote-endpoint = <&tn_ag_in35>;
+					};
+				};
+			};
+		};
+
+		tpdm@111b3000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111b3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_pcie_rscc_out: endpoint {
+						remote-endpoint = <&tn_ag_in8>;
+					};
+				};
+			};
+		};
+
+		tn@111b8000 {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			reg = <0x0 0x111b8000 0x0 0x4200>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@8 {
+					reg = <8>;
+
+					tn_ag_in8: endpoint {
+						remote-endpoint = <&tpdm_pcie_rscc_out>;
+					};
+				};
+
+				port@d {
+					reg = <0xd>;
+
+					tn_ag_in13: endpoint {
+						remote-endpoint = <&funnel_modem_dl_out>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					tn_ag_in16: endpoint {
+						remote-endpoint = <&funnel_cdsp_out>;
+					};
+				};
+
+				port@11 {
+					reg = <0x11>;
+
+					tn_ag_in17: endpoint {
+						remote-endpoint = <&tpdm_gcc_out>;
+					};
+				};
+
+				port@12 {
+					reg = <0x12>;
+
+					tn_ag_in18: endpoint {
+						remote-endpoint = <&tpdm_qrng_out>;
+					};
+				};
+
+				port@13 {
+					reg = <0x13>;
+
+					tn_ag_in19: endpoint {
+						remote-endpoint = <&tpdm_qm_out>;
+					};
+				};
+
+				port@15 {
+					reg = <0x15>;
+
+					tn_ag_in21: endpoint {
+						remote-endpoint = <&tpdm_ipa_out>;
+					};
+				};
+
+				port@19 {
+					reg = <0x19>;
+
+					tn_ag_in25: endpoint {
+						remote-endpoint = <&tpdm_dlmm_out>;
+					};
+				};
+
+				port@1a {
+					reg = <0x1a>;
+
+					tn_ag_in26: endpoint {
+						remote-endpoint = <&tpdm_north_dsb_out>;
+					};
+				};
+
+				port@1b {
+					reg = <0x1b>;
+
+					tn_ag_in27: endpoint {
+						remote-endpoint = <&tpdm_south_dsb_out>;
+					};
+				};
+
+				port@1c {
+					reg = <0x1c>;
+
+					tn_ag_in28: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb1_out>;
+					};
+				};
+
+				port@1d {
+					reg = <0x1d>;
+
+					tn_ag_in29: endpoint {
+						remote-endpoint = <&tpdm_pmu_out>;
+					};
+				};
+
+				port@1e {
+					reg = <0x1e>;
+
+					tn_ag_in30: endpoint {
+						remote-endpoint = <&tpdm_rdpm_cmb0_out>;
+					};
+				};
+
+				port@1f {
+					reg = <0x1f>;
+
+					tn_ag_in31: endpoint {
+						remote-endpoint = <&tpdm_rdpm_cmb1_out>;
+					};
+				};
+
+				port@20 {
+					reg = <0x20>;
+
+					tn_ag_in32: endpoint {
+						remote-endpoint = <&tpdm_rdpm_cmb2_out>;
+					};
+				};
+
+				port@22 {
+					reg = <0x22>;
+
+					tn_ag_in34: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb2_out>;
+					};
+				};
+
+				port@23 {
+					reg = <0x23>;
+
+					tn_ag_in35: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb4_out>;
+					};
+				};
+
+				port@24 {
+					reg = <0x24>;
+
+					tn_ag_in36: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb0_out>;
+					};
+				};
+
+				port@25 {
+					reg = <37>;
+
+					tn_ag_in37: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ag_out: endpoint {
+						remote-endpoint = <&funnel_in0_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@111d0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_qm_out: endpoint {
+						remote-endpoint = <&tn_ag_in19>;
+					};
+				};
+			};
+		};
+
+		tpdm@11303000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11303000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio4_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in4>;
+					};
+				};
+			};
+		};
+
+		funnel@11304000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11304000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@5 {
+					reg = <5>;
+
+					funnel_aoss_in5: endpoint {
+						remote-endpoint = <&tpda_aoss_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_aoss_in6: endpoint {
+						remote-endpoint = <&funnel_in0_out>;
+					};
+				};
+
+			};
+
+			out-ports {
+				port {
+					funnel_aoss_out: endpoint {
+						remote-endpoint = <&tmc_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@11305000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x11305000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_in: endpoint {
+						remote-endpoint = <&funnel_aoss_out>;
+					};
+				};
+			};
+		};
+
+		tpda@11308000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11308000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_aoss_in0: endpoint {
+						remote-endpoint = <&tpdm_swao_prio0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_aoss_in1: endpoint {
+						remote-endpoint = <&tpdm_swao_prio1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_aoss_in2: endpoint {
+						remote-endpoint = <&tpdm_swao_prio2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_aoss_in3: endpoint {
+						remote-endpoint = <&tpdm_swao_prio3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					tpda_aoss_in4: endpoint {
+						remote-endpoint = <&tpdm_swao_prio4_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					tpda_aoss_in5: endpoint {
+						remote-endpoint = <&tpdm_swao_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_aoss_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11309000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11309000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio0_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@1130a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1130a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio1_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@1130b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1130b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio2_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@1130c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1130c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio3_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@1130d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1130d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_swao_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11422000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11422000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_ipa_out: endpoint {
+						remote-endpoint = <&tn_ag_in21>;
+					};
+				};
+			};
+		};
+
 		sram@14680000 {
 			compatible = "qcom,kaanapali-imem", "mmio-sram";
 			reg = <0x0 0x14680000 0x0 0x1000>;
@@ -1603,4 +2711,56 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	tpdm-cdsp-llm {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_cdsp_llm_out: endpoint {
+					remote-endpoint = <&tpda_cdsp_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-llm2 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_cdsp_llm2_out: endpoint {
+					remote-endpoint = <&tpda_cdsp_in2>;
+				};
+			};
+		};
+	};
+
+	tpdm-modem1 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_modem1_out: endpoint {
+					remote-endpoint = <&tpda_modem_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-modem2 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <64>;
+
+		out-ports {
+			port {
+				tpdm_modem2_out: endpoint {
+					remote-endpoint = <&tpda_modem_in2>;
+				};
+			};
+		};
+	};
 };

-- 
2.25.1


