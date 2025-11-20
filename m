Return-Path: <linux-arm-msm+bounces-82688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A10B0C74631
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 14:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 857912FFE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D922A33EAE7;
	Thu, 20 Nov 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gETmRkl5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGz2tpih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBB333E36F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646576; cv=none; b=cCD1/JT7AKaLHsbTspxkoUi3nsekNfBogpVWw3wYpjc6u/QOby/3I6ImM4JXWTULhmj7s8VSN7A0qv2ft7dNWuE3c+N/MeyPMW1wen/15gOwgcd0/fan9h1knlvV6yqRQidK9FfA1OLU+Tm9tZeuqOdGsfSYl6ihN2uoxGi+7Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646576; c=relaxed/simple;
	bh=VMPexPyvS/iyo0CUjLnAzVV60Me8ZKZxL4FWp0oWNDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IREsL72/tpFx6DB4PTRekCmqs+qlfaE2lKF2ela/aV2gw/Mq28am+m9Ov+BvgaXzqNChbudMhVub6RNDo8GkSb1UCtAuJSVIlJw8Rs4xQg+D24AvKfLbYt+5/Mkf5OM1S4BwFEMO1OsYfF0/8mc2UoIiWn+XtdS5hmd4b3JYV0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gETmRkl5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGz2tpih; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKC3sJR4026682
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 13:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KtOJ3EHxjesQGgvjCYjyNA
	cJH18WQ/xRU0NkUZXU9AE=; b=gETmRkl5g1F36GPZiD6bWXBiM+ZgC8LOpCWxvF
	uRT27j3okcjlgGHpcwjzPETc1TEerzVoyd1S57PuQXmKD1WqdLEddtATZC1U5FAV
	q7k1reHNXjIPWiwQ6hZZu6TolaDjqZjYN5ftiVVVcwR2rPz1nq8KD6mFFSgcTJL1
	v5lfGUSZqALae3ZD07I3/aFUd7hQoOxc/2NozzuGWFIz8M/i/gzm4QKUWCf36iq4
	AM+4DAlJhMDKFS1Jc6QLgSLKVjeCLv3cduoM41YXikOMMQ5AAwSRQyHeHaI6Bk5Q
	nIGEb4dppwLLZYBih0YGy1wkesMIsTiH0P1rCW/U6EnNk/xQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahvj3hhwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 13:49:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7be3d08f863so1563817b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 05:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763646572; x=1764251372; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KtOJ3EHxjesQGgvjCYjyNAcJH18WQ/xRU0NkUZXU9AE=;
        b=AGz2tpih9LeNmXqu1WK2ghhV5S7WxnZPIRM39hBg2epP+GlvB+6U4uxIsHbujwEJz5
         +w2p2egF4RR6ydw7wQI/17MKbut5AQaSYYFBhPJevblPZgmMNeTKHbKkq2S8++1Hr9Ix
         zdufduHq/hfBy5nh6/veErY/j1YDSK5iziQzQPDFbgiP4OVmrEMBTOLa75XhmYs2dSbF
         pjQ68JZEsdz1CH93mJNd8wnIBcNj6OKiaYQfzOL9qBVtRMdbqRARVqgjYmwHjU1Kk2P4
         IM74/A4xcoXH2XLfUMbIc+ezkl0jVlnmIDOZSG5YfcuA5ow/+GaldQc1fegvrpMKM3u1
         0uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763646572; x=1764251372;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtOJ3EHxjesQGgvjCYjyNAcJH18WQ/xRU0NkUZXU9AE=;
        b=keo8DyfgY8MdpdXi0LsqQIdd0lWk3xeYSDWbcbF299eEKnvGh0RN7EC22GTf/JyESj
         4ZXnFOJn2tx1axwVzLH7/J4J+yO/QmYR4RG7xugZD5FObWVTh8r3b3eiZTmotvbRX/+e
         EWnhcl1dkTIocjqB7/VezZNQz8+x2k2YkiScIncUc1XorUOUF0+83hW8InAuSnNAUHQU
         UoH2q31qefiSeOJWTC5tkDgoeiTQbtgepemkdlgGOhhkiKX+2tXrwWDNAz9W5aWOtR9+
         u5Siy78d6gw/p/k/5Smx3/Poz5hb8yCFZyldpw+xY78k1OlyVuF2v78hVAWpG54HQs+h
         8YOA==
X-Gm-Message-State: AOJu0Yyg1LWg3t5ceeDs3XYkBloA5m9uoOYh35NQch/NB92i5aMKK/yy
	/n6HNS2QzwK2vAurFscpWaL+gGn5B0yEuY4XD7eqHwiNiQCAf6ZejNp0QaCKtz2IWm33LOugdPg
	t17hqCEP2A+x2d7gRnmL040XnoFRFOWldHLsLG8YbdJ6Xc9I6ncOv8eGywhSa1pM2glvqIGAZ1Q
	AFTWI=
X-Gm-Gg: ASbGnctoAOPxunzSWI/xhT6UMdEKTSDAh49cN1eWEyobh27x2uBvpKsiJB12TJnaXZP
	xZ2LhhCrpvOdFtk6OvwL1k0VxLfcg62RyHqzKYlWmVPXiJXsrmvPPB9gckAtPYbYE88bwHbsSE7
	I3XLevqC0/Ggol3P0eaK8FOOyXT5NUR0k7YbMOlWryf8j4yoBeMWlh5XMUgFmjyOMsrhucLki0n
	M1lbQXpJB21uRZJwIITBJjHD3jFjj9z3lHcrXrkmq+B2s01Ix3TK2j3KREPCVcS3UShZzOXwELL
	QytT1qNrBFVD7+UdPugw4WhfXNaVA1bgHjQo31PQGKbD3hwnyY5rWMDPbrAVns6lRVa2UGyaq+s
	L6+5GnT8PdHBjM+d106V6sA1wARRxg4pmXT08uAAZ3hqEkSLgZwvcNQlWHeIvrVpBe5E3LfFF
X-Received: by 2002:a05:6a20:2590:b0:35d:7698:8d33 with SMTP id adf61e73a8af0-361407fad43mr2990682637.0.1763646571691;
        Thu, 20 Nov 2025 05:49:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+xTPVSue+ZppFt6LaMP7rXujnKwFtg4CS4KSF07DbVBSveuZBInvQNWREh3IMW41ysvLUww==
X-Received: by 2002:a05:6a20:2590:b0:35d:7698:8d33 with SMTP id adf61e73a8af0-361407fad43mr2990637637.0.1763646571121;
        Thu, 20 Nov 2025 05:49:31 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed37ab3fsm2968378b3a.22.2025.11.20.05.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:49:30 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 21:48:54 +0800
Subject: [PATCH v3] arm64: qcom: dts: sm8750: add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-add-coresight-nodes-for-pakala-v3-1-03bb7651bc90@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEkcH2kC/43NTQ6CMBCG4auQrh1Cy5+68h7GxdhOoREotthoC
 He3sHJhoptJ3lk838w8OUOeHZOZOQrGGzvEyHcJky0ODYFRsZnIRMk5rwGVAmkdedO0EwxWkQd
 tHYx4ww6hKiuRqb3Eig4sIqMjbZ7bwPkSuzV+su617QW+fv+mAwcOSlRXjVgUmuqT9T69P7CTt
 u/TeNi6EMSHKrKfqohqrrMDyZqXivCLuizLGxjCntopAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763646564; l=20440;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=VMPexPyvS/iyo0CUjLnAzVV60Me8ZKZxL4FWp0oWNDo=;
 b=VTlJ62dfx6vlseOCkC9VEQJ4HH/tQg1spa7EORQKmNdE6JV4vqXYwTaBTHORJ6SdRPuQuBxYG
 JQGSbFg68bcBz5C9XqKXyBudk6AvNlxOnVfIP2Tp2JDKwDFF86aaKSo
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=691f1c6d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ziJtgh3HEPKA8hFMK5AA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wZUfRkWuo7lw2_Zbzk6oLV0Md2G1FhzV
X-Proofpoint-ORIG-GUID: wZUfRkWuo7lw2_Zbzk6oLV0Md2G1FhzV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4OSBTYWx0ZWRfX5y95iQxIoOY2
 /fywkfVziQV4qloU3b2Wy985yJ7AhFLnxchEIg8q15owU6MMChUhlE+HNPxe1QY5bR+1BJ6H4Re
 WdudyHk1a0ZKuVkpqvxFyV+Pb2JHawbz5CAryodH2A0hQvkLi+X9c+lhrwTB8vZ8TlAHSfHea27
 7Noquk1vcdyieL8BoFaph6kYzIuRPgGaM4aZZGo3WRkYZdzNkD5MCPksaXnygsEkSXIneo+pSvy
 4S/TLv5P5Md7zlkFobXzQQN9Py06ZrH8FhbRQE8sNIESDPAuzq5dk2q5V70P7vUCkh4jb6077rA
 OaE2rCRdXP90rpw1XdlTlqQPMXNIulnQNeEiVP0GzdWfHbEOyYm10fQWoxdZHtL65mijPJry3WB
 DM5aZ8U5jFkeATXZZL1X0L3l2RE/aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200089

Add CoreSight DT nodes for AOSS, QDSS, CDSP, and Modem blocks to enable
the STM and TPDM sources to route trace data to the ETF for debugging.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v3:
- replace the turing string with cdsp.
- Link to v2: https://lore.kernel.org/r/20251120-add-coresight-nodes-for-pakala-v2-1-3f09ec715dea@oss.qualcomm.com

Changes in v2:
- fix format issue.
- Link to v1: https://lore.kernel.org/r/20251117-add-coresight-nodes-for-pakala-v1-1-d26bfaa44fe7@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 980 +++++++++++++++++++++++++++++++++++
 1 file changed, 980 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bb..f013198a1a0b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3313,6 +3313,947 @@ tcsrcc: clock-controller@f204008 {
 			#reset-cells = <1>;
 		};
 
+		stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+			      <0x0 0x37280000 0x0 0x180000>;
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
+				port@1 {
+					reg = <1>;
+
+					tpda_qdss_in1: endpoint {
+						remote-endpoint = <&tpdm_spdm_out>;
+					};
+				};
+
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
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
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
+						remote-endpoint = <&funnel_aoss_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@10800000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10800000 0x0 0x1000>;
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
+		tpda@10803000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10803000 0x0 0x1000>;
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
+		funnel@10804000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10804000 0x0 0x1000>;
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
+		cti@1080b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x1080b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@1082c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1082c000 0x0 0x1000>;
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
+		tpdm@10841000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10841000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_prng_out: endpoint {
+						remote-endpoint = <&tn_ag_in18>;
+					};
+				};
+			};
+		};
+
+		tpdm@1084e000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1084e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_mm_bcv_out: endpoint {
+						remote-endpoint = <&tpda_mm_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@1084f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1084f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_mm_lmh_out: endpoint {
+						remote-endpoint = <&tpda_mm_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@10850000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10850000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_mm_dpm_out: endpoint {
+						remote-endpoint = <&tpda_mm_in2>;
+					};
+				};
+			};
+		};
+
+		tpda@10851000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10851000 0x0 0x1000>;
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
+					tpda_mm_in0: endpoint {
+						remote-endpoint = <&tpdm_mm_bcv_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_mm_in1: endpoint {
+						remote-endpoint = <&tpdm_mm_lmh_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_mm_in2: endpoint {
+						remote-endpoint = <&tpdm_mm_dpm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_mm_out: endpoint {
+						remote-endpoint = <&tn_ag_in4>;
+					};
+				};
+			};
+		};
+
+		tpdm@10980000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10980000 0x0 0x1000>;
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
+		tpda@10986000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10986000 0x0 0x1000>;
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
+		funnel@10987000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10987000 0x0 0x1000>;
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
+		cti@1098b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x1098b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@109a3000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
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
+		tpdm@109a4000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb_out: endpoint {
+						remote-endpoint = <&tn_ag_in28>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a5000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_dl_mm_out: endpoint {
+						remote-endpoint = <&tn_ag_in25>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a6000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a6000 0x0 0x1000>;
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
+		tpdm@109a7000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a7000 0x0 0x1000>;
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
+		tpdm@109a8000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a8000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
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
+		tpdm@109a9000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a9000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
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
+		tpdm@109aa000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109aa000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
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
+		tn@109ab000 {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			reg = <0x0 0x109ab000 0x0 0x4200>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@4 {
+					reg = <4>;
+
+					tn_ag_in4: endpoint {
+						remote-endpoint = <&tpda_mm_out>;
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
+						remote-endpoint = <&tpdm_prng_out>;
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
+				port@19 {
+					reg = <0x19>;
+
+					tn_ag_in25: endpoint {
+						remote-endpoint = <&tpdm_dl_mm_out>;
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
+						remote-endpoint = <&tpdm_ipcc_cmb_out>;
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
+		tpdm@109d0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
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
+		funnel@10b04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10b04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+
+					funnel_aoss_in6: endpoint {
+						remote-endpoint = <&tpda_aoss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_aoss_in7: endpoint {
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
+		tmc@10b05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10b05000 0x0 0x1000>;
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
+		tpda@10b08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10b08000 0x0 0x1000>;
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
+						remote-endpoint =<&tpdm_swao_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_aoss_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
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
+		tpdm@10b0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
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
+		tpdm@10b0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
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
+		tpdm@10b0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
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
+		tpdm@10b0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0d000 0x0 0x1000>;
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
+						remote-endpoint = <&tpda_aoss_in4>;
+					};
+				};
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;
@@ -4239,4 +5180,43 @@ timer {
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
+		qcom,dsb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_modem1_out: endpoint {
+					remote-endpoint = <&tpda_modem_in1>;
+				};
+			};
+		};
+	};
 };

---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251117-add-coresight-nodes-for-pakala-65620d8ca6e9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


