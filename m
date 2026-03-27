Return-Path: <linux-arm-msm+bounces-100187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GXtEvn3xWlsEwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 04:22:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C97233EC38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 04:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B88F30360D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4A836BCC9;
	Fri, 27 Mar 2026 03:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7Sv80Br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXw+7lOm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7D35CB7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581649; cv=none; b=DldaKBsMiNPiV8qENut0/RkRV4b6rP5m43qNS/sQChIsK4X04+Tc41ljMEsy/1zcBAYgTYla5uaInhdDFkrw4kzOaaFcnIrFSme1SRWhydPINeeBRhuQ4gacr155bHiUZJE4kdwFxw3lKIN/M1RFXTqzIkt46+lL7cY9iDXfhZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581649; c=relaxed/simple;
	bh=9STDMsUdx2G/B4oAKTOZ6F2GTEXJmzB3NHLjOqAmltg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HiKKccSqKO4pFJuo+YMIB4yLGi/T2MQD+dhSRkrVUj0pql+i0qBFOPeDeC0SDNSZfmr6+Qp+DUQJ2vBTqSQvXlgxC+HDH00J8oDWgs1v/u6nNSPnzZWy9BaB7PbG2vxG9SUi1q+lkct7wLKWo1p6UaBuJsmc+ZFQfO/l5WXos5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7Sv80Br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXw+7lOm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R2eUD83142106
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8idlfLC06oKX3MY8NuXMGWDVZ4DU9MyLkp+jww4VS+0=; b=j7Sv80BrcS2ITdHY
	1tqT4SWln7+GLBSAH3gGjfvV3CMLYlRmWaCpSLiXwl6Qw8X7l4q3w60Sw5UIvw/E
	YI1dslxsZMKdKlpCJcHk1kT9NCZYdcBLlEuBkyguaU1Zud3Gp5oA1XnmSYraisSf
	BEEo5h9gDfWRHpq8i/+c0TydDcrr4HZmYxmwYwvz6H7DlcITKnb6xB6kbHNs6KsX
	cBRGwIk6yddLfPT/NbEl2v5YySSbrhImipU8Ll3MS3E1Qxl6kofFK8YZqtfJ7coh
	H7qkB3QXZnI/X8hHo5WsXfWKhmWlDC1sRVEDPS/2fup0Iz6DuaG7YIZEhItTqYdc
	xgvJug==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapr4fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c1631e6189so12086355eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 20:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774581647; x=1775186447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8idlfLC06oKX3MY8NuXMGWDVZ4DU9MyLkp+jww4VS+0=;
        b=NXw+7lOmXw6WLgZ9tJVYeFxU8maUNNDUo1PjSqoZ4FYSQSNmGoTeTlYgLRu8xczYut
         5YyJRr5PfX6vJJZM6wlqFDt4jD33BXxHkbxy2eqzbAa86a3V8Gv4nWz/gdkgnI1xJ9z0
         Nsk/t7v9K+qBWDA3YU8zBWDu/urW549E5WD672gAOAplN6N1Id7cjzX6wH7I3JOrEW3v
         IVeLPoMs2AxUfvc8EJzVvZiOgAv4H9Q1VI5R8ckhdCF/arFRHVqgn+zBgdI0QfZPrzWm
         HA5T1dzm58j63oyOJpmRPa7a7VE2MNBblaWmF/bwY5fEkZ08PeuRYWo+ozhtYBvWzPrr
         /tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774581647; x=1775186447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8idlfLC06oKX3MY8NuXMGWDVZ4DU9MyLkp+jww4VS+0=;
        b=HMhJsgCt8VlDXmLo+xF/HXWt2dWhTSav7R1Oqnf8bGxMzMIeVROnxmzFWbDwBqRwuH
         LdyC8QDYGKDXGFvSg80THi1SK+eQ1nPrbNSY1C3g2YinYZGjCF6xpkhA7ASd3vq3aMn/
         hx4dt3PxJbbl/253Z5FLVpXwHNU7RiiQzbQx/cAMFJ8nIv1ECnFR5jkReJyoob67j1GG
         wUcdmHNw7j4NPlXZDYPg3jgyqYTx0g4o59MOFH+tIBBzMH4IGj5mG3nJ7KlcWYj5Fy8w
         LfJrK/dquQd/cP50jYBQxhnYv9yDiiaMUysmCSvnMamW5cpW/0S0iPofism1ryyY/5LW
         mGHA==
X-Forwarded-Encrypted: i=1; AJvYcCUQHQPcpPJ4bAri7fFE/KtfpqAw0CFovP80JpJXMevJzgiJ4+ghtt1p5Frob5IF9Z+pNSRgWKyALQipTsUJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3nlCdkfK2dZSniPyMlo5PZrzONMcRdlnYm1rsqSEp8xQLLPy9
	arQMn9FP6GOkpRJaulMMZx1dozSwqkjOQO+JfSbHEk/qWlxLkpFN+vyZrepy/tlTO9g8taDQ2Jh
	g41/1XAlC1dilE7+8Oz7lp9ZIgGRSlbjbvgK50eknAPNCMWV+v4I8POh+bAIuuWHPxE2l
X-Gm-Gg: ATEYQzz6rl+XEPYPFfzXply5G11TxRKksXAfJNLy7+dBMZKzHgyR2eOv6Ai8LJ9f5ma
	JNk0BCQrEv/za9OqAe12CuB6EO7cEmyaXrooDHpgndWfSmTRg8gfZTwrkxj8M7/108GRU+8UPdW
	AwoXCYJTfteq+DRVygnIwmPsNqVatiiGxu8RF9xhFVd/7hvBdFw2ElmiDF5+xlMkprnDBxABENH
	d9BQZu0typ8J9d0YunRhJliAPI3/uV1JxJlzjs6HrwTsmgq8F9FoxhlGVcoK+URPyrUj7Y5ACTW
	KBMCvfUuRBgVX5FEbYEnRUr0RmPwbMagQmrtxQZCWbNAkby5PjYfIpWBqoRn27pyWo7cgRJqRjN
	63tct7dzXguxYz5yPrU7CtZuQnbN7jOku8f5Ipde7z5JRyGtIgal2xMQVhjeWfUBj4hj1ggkr
X-Received: by 2002:a05:7301:578e:b0:2bd:c8a2:954 with SMTP id 5a478bee46e88-2c185f5d3b0mr527989eec.24.1774581646566;
        Thu, 26 Mar 2026 20:20:46 -0700 (PDT)
X-Received: by 2002:a05:7301:578e:b0:2bd:c8a2:954 with SMTP id 5a478bee46e88-2c185f5d3b0mr527970eec.24.1774581646046;
        Thu, 26 Mar 2026 20:20:46 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edde435sm4361337eec.25.2026.03.26.20.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:20:45 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 20:20:28 -0700
Subject: [PATCH 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-knp-soccp-dt-v1-1-a60c2ae36e9b@oss.qualcomm.com>
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
In-Reply-To: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774581644; l=2809;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=9STDMsUdx2G/B4oAKTOZ6F2GTEXJmzB3NHLjOqAmltg=;
 b=nzeTWlLaR+SWmacIuD3V2cO95RRszNz7GfKT6x141X3c/TurQacLEQUX5gK5I5aK+Z9+1UAUt
 tkhmXQ455wqDz8AdI7yu6BF24qWXdWAVBOweKNhY+x0tLNzyTxgy2Fb
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c5f78f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jOHJm0FzHgHzS9cTJtEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAyNCBTYWx0ZWRfX+vY/7q+fHIZd
 OFWlPUcJhrIeqGBErAM5Fj5YkhUXdkfmjoNylTTGyDDkWh3Pfsm9B3rHNBAC3muklL1k/sUOpkA
 R9KCVWTgtSFPhaI0+l9Oz10WlR3ciReeUDd/4MhEOeehNcY8NmF7hL4ZWihswntGPaQIJ8Fy2ZY
 qQgG66R4VCnmdhhdAtl98KBwFSIdw4R8H7y1qF3y1EOAbOjrAl/do/mF/TAbQCcLDQlhaEK6PcH
 MP1DlX8LGfXD3yqYzy3M5JTp9PuQhGHVTvBXl+8JNFy1YXPV7K7uf/MvnkVtlhKTACh9QIPXkcG
 9s0lsOJnm5WRXHsupU8CnXGaC+QfvyrYWHY/tfPntKBc+DdeqNEBDefW6iUoiK7vTKlWToms8J8
 /IkDhxrDG0LResF438siniD9B7a6Qicv+OKispxoqTZTk4xS/fOwGTpizWHM6QOiB/35KcJCw/Q
 JEbxFhKAqQ3zpVTmR0g==
X-Proofpoint-GUID: ww_tS1wFEAUWU4YWMfsY4INE4KNPgNUz
X-Proofpoint-ORIG-GUID: ww_tS1wFEAUWU4YWMfsY4INE4KNPgNUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100187-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,d00000:email,0.16.224.80:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C97233EC38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it
is brought up by bootloader, so set the status "okay".

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 72 +++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ef6add4e5a90..ac6a6c789902 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -504,6 +504,32 @@ smp2p_cdsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-soccp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_MPROC_SOCCP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <19>;
+
+		soccp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		soccp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -1513,6 +1539,52 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc-soccp@d00000 {
+			compatible = "qcom,kaanapali-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccp_dtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			status = "okay";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		ipcc: mailbox@1106000 {
 			compatible = "qcom,kaanapali-ipcc", "qcom,ipcc";
 			reg = <0x0 0x01106000 0x0 0x1000>;

-- 
2.25.1


