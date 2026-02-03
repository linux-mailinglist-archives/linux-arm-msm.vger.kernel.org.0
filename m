Return-Path: <linux-arm-msm+bounces-91618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHUgCDatgWn0IQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:09:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB15D603C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 236E4300B460
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9C53939BB;
	Tue,  3 Feb 2026 08:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kmb3gAAl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+Ao8n8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B03939B8
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106135; cv=none; b=TOuHdFgDfBp9B1j749tzfK1/dVNr2rNUR/LUR80p2QE9NNZJTRjVKo8gP/mAPs6pqHiLuEjeeL+xIEF7njBBKibGuOhwHiXhjojpSlrg6KJ4E2iIvqd0oFFbMCw+E+4hZTH8i8p+2cPyYUmOMrTdGPeC/lqKHvtf5A/fJYaR9tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106135; c=relaxed/simple;
	bh=MmRh2JiBpDaFVC7myctfzKWNEp/EVU+H7DSEDhr01cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9YMcwliJq+/5wXWgRCv3azhoxozDClHA09E9nUFmx3Wn/tHUCah3EkcS+GaBorfDfCQKZBnhyslwUXHtLxPeJZRq8YNZ5S9jeCY4Cttjn4nmvwfnqScCep4F6hJmcwJyJc1tDBE9u4okVP4thIF05RAZVxqfYGopX9vyZQDPhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kmb3gAAl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+Ao8n8T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137MM9g2884370
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 08:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qltUqOfSxitFH26aqGz70TycTTJ/d1VqzyG6H1vAznQ=; b=Kmb3gAAll5yvulU+
	8SW/Umnsaf/SrAe6K8/zgygRNEZwPloxzX+1ffLvUY/YXgkS2Np2ELv7VhhflTgx
	vv/OXo2zmWensOwpYVf87F7gQtfWhjYxH2RMIJxbE9c73y6DMVw1Ai7Z3HmJAwwt
	0GF4a+wBGowhbTmno1nCDSrbJzMo0mxUcq1eeHwpNN4JdkdEAiDgj5tU6UCkjQ1J
	aOvgoIeDqodskNtfL/EZDqS3Z7wI8sDVwRZ+EGvQKykXC3h8gpfRM1tUnC5LiDez
	MN9CHj86E6oWoG4gVXA4vF9pwj7Tja/OS3kUyDNSA6CKnNL7ot4OJtmtYC6Fq3c3
	LFnadg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3k9tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:08:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76b0673dcso53892305ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 00:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770106133; x=1770710933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qltUqOfSxitFH26aqGz70TycTTJ/d1VqzyG6H1vAznQ=;
        b=j+Ao8n8TXSa1hjCq4nPxNqRA3XbTLvlffvNoVdrPR/KxyN6bwQrccZwXe2M3oRU0xQ
         qHoXLdsh65IVM9qH5Psmk02/V2DZi9rD7SS7bnQHDk02gRUMnm7k9bqWlM9gVz7vd6AL
         q6VWY9yExThTnlpoZxilOCAeuMzYxlMhkPg1ybu7OKxq5mNhIcsXbrwVY+kaFp0uYnp9
         UrNvFpVJ5w7E03jqhDV6Qt87KqIw/BrPYHcSGsBLcBRfM9jQJioWUC04BJEpP2ieu0T5
         QskE0EeCYU1vWcHWMdqNVhRU2MVvyjVYuhRFSvCTDyhgxfkqf85OvoPTsBTU324I+mnj
         dRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106133; x=1770710933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qltUqOfSxitFH26aqGz70TycTTJ/d1VqzyG6H1vAznQ=;
        b=V4JH+jPVazT8RGgxlZ/q24DOBSuuxmTw1chJCudETT4BCrPb7NCC9J0riL0MKHL7YP
         bJffkUd4+dKvu9GJtDtCp24HLdClu7ItF0s+gbYGmjFFm3/JdGVRtrpOQC+3HMmrVUl2
         PEQTtgUQzWNjmQmI5z9ZV2vbsdUTWWKn/0hByuveqKdGNNYaeC1lwBw/SWkGnb2oO50q
         iUsmeiBhacbD9KlHcOXbZ7eNpW9a4ln6PW+ifaWMEq/JiztWpRC3VPeYJfmD8SMPuz//
         W5kU6+zmbxvmTAwFwnvNek6agCaFUuSykVZd2lEiatgXPwiM1cI3DKTb9Bxwq+huOqxs
         AhFg==
X-Forwarded-Encrypted: i=1; AJvYcCX5eaflGuD2ztOU3CmjjcI1PGdWsi8wxlpekzR1R6bgh3Xxw7vlVAb7XRbrcX1MqO9Kq5OIHKDglnoQx461@vger.kernel.org
X-Gm-Message-State: AOJu0YyztX+D1dZleJLxwTabDLq6hmYf9LAXZuXMgdJbgw/1innWtxbC
	4tVm/Wj4kqV7v43IFAztGQ4aIgUoIc9riowGPK/gOzCpmpzdxxKQCnEENVWWy322b7M9DWQ8gsm
	pw77t4sOIuJrWtOHm5AX3vDMS1qlo/paFFISdgk0C+ehNJYtCh76+DbtU2TMRjR3XkNFjAuV+BS
	JN
X-Gm-Gg: AZuq6aJoUvinNkQX4us2REh7NquLIUhOYtBabKnnx6I4c+1f5K96i4kBQjcnVp6ROiR
	o1cTdGuP8eCPeIaYX//oRT1Uo2QAk+PdeGfWnwhYorSCg9ao59FQ3lJDeXnV5XsyCy3/VpsnACo
	FvobqzeYdjT9WFRdkYPYgITc73c58wiFMtQuyxIHMnZpAG6n6WcRgKdG3uRsBdSPxFpgLgqfybt
	SmseCyL3GAUlg2d0um7uP91FZVA6ZL0leMpj5fX3mrbuG93O9iIyccyHyQB//bdnyP9iXU17bJq
	TKauDVhQzioUflbLA4uiWaFVCbGeFVG6Q4sxGwvB6wmAVWCTqK65JgsCtoBl9+Nq/UNrX9bvZjj
	cyfjCOtXgSzzWtxmCF/pQCd75TxRb8iUjBQlZwv9yw/1uyol2jO7tTtiKRztQQicgKAJSLlYj
X-Received: by 2002:a17:902:e944:b0:2a1:e19:ff4 with SMTP id d9443c01a7336-2a8d8037a5dmr163075215ad.29.1770106132986;
        Tue, 03 Feb 2026 00:08:52 -0800 (PST)
X-Received: by 2002:a17:902:e944:b0:2a1:e19:ff4 with SMTP id d9443c01a7336-2a8d8037a5dmr163074945ad.29.1770106132506;
        Tue, 03 Feb 2026 00:08:52 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8e512bc2asm103144485ad.100.2026.02.03.00.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:08:52 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 16:08:25 +0800
Subject: [PATCH 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v1-2-a5371a2ec2b8@oss.qualcomm.com>
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770106119; l=4204;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=MmRh2JiBpDaFVC7myctfzKWNEp/EVU+H7DSEDhr01cc=;
 b=jXw9fBnOgTrZ64vwsEqqkAQfIpgHq3+uHhp5p5GYasFIVD1lh+OeEnkOv9lE8MKFA72vV8hNh
 NP6O4dYOisuCASDplk71WBQAAZVMv19h3nLZedGgA6tQ66OdPKki6pH
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: KDhELm8Gy7tMoJm77ZxNH6k0pmhaVEs5
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6981ad15 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: KDhELm8Gy7tMoJm77ZxNH6k0pmhaVEs5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2NCBTYWx0ZWRfXzCjxAviGzKSN
 OgU0jIsALrl8d+Z0z+o4nxk5U1+FuyeTdYNaJGKIQE2GowWU1m2SlTt+8kM9nsJvPxVyqKmRh5e
 Grt4aZYhlVK0His+VB/6t6egEHB43Z5Wgozjd5+rvYjmMseFZv+OqEeY9Kfd7N69GfVWAa2NE6l
 aUB/swy3gvhjjA34YWshe1OEKouu1MJgakLdge5n5qNYVhh/4xVvuF1yyefx8H6b0dJaNSigmLq
 ORJvSPb2pt4P6cTVtwn2Tuq7LOswjtlg/NHrtnNLXZOgUAe/WW43u+6rXksZQjXW5A7sunDJkYy
 H/a1oTHDw9aNgLNPgdj/y136XwX2yO2BR8xAc5DQB/4YWbgfLslMY4rs60Y8kLBCsmE0lrY+f/H
 fzm8EnK6CgmEgTAcaRJwDz/ly5/JyBmBdvNs6n66hTWJNmn9iaVIXQwNnXywtiRn0Lo8hgG8OPk
 Ibp/kIfzbgu3XrIQs2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91618-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FB15D603C
X-Rspamd-Action: no action

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device.

The CTCU serves as the control unit for the ETR device, managing its
behavior to determine how trace data is collected.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e618..88ec29446ba1 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6771,6 +6771,35 @@ data-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -6985,6 +7014,122 @@ qdss_funnel_out: endpoint {
 			};
 		};
 
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep_in: endpoint {
+						remote-endpoint = <&swao_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint = <&etr_rep_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etr: tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04e0 0x0>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&etr_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etr_rep_in: endpoint {
+						remote-endpoint = <&qdss_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					etr_rep_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					etr_rep_out1: endpoint {
+						remote-endpoint = <&etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etr1: tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x0500 0x0>;
+
+			arm,scatter-gather;
+			arm,buffer-size = <0x400000>;
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint = <&etr_rep_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@10800000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x10800000 0x0 0x1000>;
@@ -7298,7 +7443,20 @@ swao_rep_in: endpoint {
 			};
 
 			out-ports {
-				port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
 					swao_rep_out1: endpoint {
 						remote-endpoint = <&eud_in>;
 					};

-- 
2.34.1


