Return-Path: <linux-arm-msm+bounces-91619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HizIVCtgWn0IQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:09:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F23D604A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D521B300D540
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815CF3939A6;
	Tue,  3 Feb 2026 08:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofmQk2d9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6png7bt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011F73939AE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106141; cv=none; b=ZqBdSfvPkOsOHEMr0rcfvkwE040Gcvd5aZ+EySdTkiyPu8GoMMY6ZmdV96oXRv1wuJPXVUmghqKb/sLv4YPc5Zpfi3x4+6m1h6a3I5yi5jLsLlzncdCkCgmWE1DNJ3/SLqd4BbXJf6Dsd+70ALuO3N3awfVg+yT5QSo9DmlA8lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106141; c=relaxed/simple;
	bh=jlz2/IuYwpwugUkJK8inilpdrM/O+cK7IPZqI00q7tc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ho+5wraISXYE4ArNdIJrA09MAMELn0v8tnPOPzYlFws83xL/YlzrbHGmIxRavfbkLg9wH0IOaincYvb03B4E57pLUnfQpiIs9UH5cdW5QffqWR/FY4WR5RgFtknKlbEhzUFLuDl+pxwakFjdvhLNJW6qntqts4WxXnUB8QAgSr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofmQk2d9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6png7bt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136RgD53459139
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 08:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8BteOiMQUQIF65nTYBAYVzMPaKDyNONfq59RhKWQ6k=; b=ofmQk2d9sujhHeln
	XGR7XTN0v2Wk25d8ucoOLTkjW2ONc1GGuoA2dw/Ujm5IboQolhh0NVDuioDh13Vj
	Lh+VkO0+5d/Ke+owdkVSyHh6Uu1o2NqVXDXo5VvBg67Wrgb9QX9IfO2RYBeMDyBN
	X2BmHpCTYVRNVQHl/jfXy7r2FfqgRlFiWix20wFIqEOl82a1BOEISxi5dogeZxFR
	x499iALL8HKaS6ky5W69RT5+IZNm8b3TdRB8GdE8O/r5POgkcbPXtsRri8bZPYBR
	EVA7MhVj8cX3Fa22q8d76/q6A6G2gkrpfDF29gv0YTCU0Du5gDTAZahvK5xFZL5D
	0cpRzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbkev9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:08:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a773db3803so56368505ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 00:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770106138; x=1770710938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8BteOiMQUQIF65nTYBAYVzMPaKDyNONfq59RhKWQ6k=;
        b=E6png7btuPPir2asjxdsUtd8as20on/+EQPR3pSVMWYTt9KjI+nBx3mr2iIF3QDvn7
         ygHMj0qRKuYnWZ91qREff+dqbOb+Ym8H2akDdCyTAsQ7SxDwjhBta+2NvNK/+1lisG4i
         2MjQVaFiCFY2r1VU12DKtS2uibRR9lWEJrJZb2t0ltbwKzy10h+21ZaGU0KVyW9MqQXA
         W0QuULAk5zape4Pjm+D+SKrH28b+fPzHad9oeFDlgTbKlI48LtEUzRY4Tjh2W0Uv7j7v
         o2R0Gx1s/OQDDH4RCP1nFwaWN1owF0e3UguH54Eh4MJJ/9b/+Sv2KzG54RiR9t3qD/vz
         2tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106138; x=1770710938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8BteOiMQUQIF65nTYBAYVzMPaKDyNONfq59RhKWQ6k=;
        b=CSie4vdDuomF3zIieeXfUDIZkzzT103VyLzqbP+/wVMUQ9UR//2+X+/L0Zbuju2a74
         JB0I51fvY7gYzAh5lj3oO3fY7yMIW1YWk0dTUE3eib7LQKs17w6lRJ/Q95ji83kAYTJw
         nDNSPc4cTVPvLW+HRnfo0zEn2eViAtgUNS5GBhUfpgmZHtzBnqVm/GHsQKGtZ+RJk3Rk
         3PdDQRaGe33KJATfPSiS75k2rVR8VkrCAhama2i68QKGNiEpPKavUPEEfamSsTukSbNN
         TVmfDwSlEH6zjiSxjmFDarbLaqUpV9CAMTxAMGP8wYy9VqdL1ivxZGPXZlxzWLVt4quD
         e/Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWuGJaKtAUScve4z6RS0QKqGgrE2gOMGljWXLao15SaxnD5pTKFscFBV4Qyf1r49zuEJPqMNjVEsi4S2Qtg@vger.kernel.org
X-Gm-Message-State: AOJu0YzqLfYWtbZDyVj3PF5L1bi5Y1YeiyAgkM5KoP0Lro2/Eaf0je8i
	Ayy4/ZiQIpQGjKojMkrHDIFhxel+WvlYUBLzIESOsOFboTKcLH9RbyLscnPfN4A0Ht2J+UBkBhP
	NG9UanAgN66cPal0UhHT2c7dZhO2MYOc7V/G4+sGkwrgI2Ta+ej5xF2uo00m9qs+veKx8nQ/y6i
	5B
X-Gm-Gg: AZuq6aKOo78sYDYcn/1PdlXEbhYrrsApgHgIS9m6Aij/yHbrT8lzvEYWMadqxHq64Ct
	+mosdE5HLsjE7oLB/8mdVAAYLlMytX7CnpoerlCfzm7vQOCQWFTtLMI25H/ji/bdCdM8+kYZaey
	XebuPy/dzO3byGOZX70Ppo70E2MZ+ogl5yRk2bo4tBZzggAUr3il1prKZZEOlRDUQDSf/asaIXm
	h8x7t+sEo9DNPOZIVSYqLrPrOrcwdntc0IHHL/FOtvK4aNhmNzU7tOe63/pRBNUL3ekzIgb2lui
	6/3FJKutBmvFUKRS1wXrj/oVXJwN3Cs2H3uJaWMh3Q5WxjXtMRoVqupXRzBCWrp3DiLCqTBN2u9
	h1vBrl6C64e8LigowXvdSAlVdakyA+iKPqh7tfgRUyl/sC6p37wbqr9ODI2QuonheXEOoOwiE
X-Received: by 2002:a17:902:e810:b0:2a8:7814:47cc with SMTP id d9443c01a7336-2a8d96a2ba4mr132671245ad.16.1770106137740;
        Tue, 03 Feb 2026 00:08:57 -0800 (PST)
X-Received: by 2002:a17:902:e810:b0:2a8:7814:47cc with SMTP id d9443c01a7336-2a8d96a2ba4mr132670965ad.16.1770106137245;
        Tue, 03 Feb 2026 00:08:57 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8e512bc2asm103144485ad.100.2026.02.03.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:08:56 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 16:08:26 +0800
Subject: [PATCH 3/3] arm64: dts: qcom: pakala: enable ETR and CTCU devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v1-3-a5371a2ec2b8@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770106119; l=4424;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jlz2/IuYwpwugUkJK8inilpdrM/O+cK7IPZqI00q7tc=;
 b=PcFxVB+XYy87wJxG+AWxfBdsvE4KvdwHczaqCOjVODxZdubTvQ7JHxLVIm188H8LlZHHEE4B2
 +mLfXWPtdZdBIp+8AsjXiGdYIRRWWwT98pdS9JmUpupzhGFngm2FKcT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: onDM-j-HFuH4pGtemmSryxsBe4ZMTemD
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981ad1a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: onDM-j-HFuH4pGtemmSryxsBe4ZMTemD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2NCBTYWx0ZWRfX9KL5qR60SsBt
 oO+mwutD+0wIn0Kr5gV1UA99JjAlFoYn6rEDgcS0y7e+l4dz3S0Lin2PjjGPI8nk1sdvu+2OMnx
 ZoQsatr0ZG7ia++Sm2Ix34NFsG4R5ksCSsnB0hXjtBeFzZVVd4JtIazrGW0dAuQmN98OyoAr3ww
 eSnatDArB/3xl2rCstg/wxhDxv3UMC95qLSpCk5TEFMhYr6YpQYiz1zZXsgICL8Az3UjbL3vYMi
 tcIKBL0mPjtsq5Y1Q5pj4HSIw67f4ZnDMlIf6Y9JMHqC5ckOJKIiNEJlZsvjxFSSVO5LsE+mOrh
 DRV51mMj/byNn8PasJhkIjt2vw3dgTWkz44iyXPFKkL+B01xZqI2w9VQ5ijeqDgacF/betUEd86
 JnL/F0d6o3xHSV5pAzxei3dflbNvBpII6XaVZitvsnnaAYsjgbVYpjfdAr9RuW5W5vujfIXg2BR
 +2NbiqkifDFu/ZGB2Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-91619-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: B2F23D604A
X-Rspamd-Action: no action

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device and the CTCU device serves as the
control unit for the ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 177 +++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..1e39503360ef 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3574,6 +3574,35 @@ tcsrcc: clock-controller@f204008 {
 			#reset-cells = <1>;
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,pakala-ctcu", "qcom,sa8775p-ctcu";
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
@@ -3687,6 +3716,122 @@ funnel_in0_out: endpoint {
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
+		tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x04e0 0x0>;
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
+
+			iommus = <&apps_smmu 0x0500 0x0>;
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
@@ -4357,6 +4502,38 @@ tmc_etf_in: endpoint {
 					};
 				};
 			};
+
+			out-ports {
+				port {
+					tmc_etf_out: endpoint {
+						remote-endpoint = <&swao_rep_in>;
+					};
+				};
+			};
+		};
+
+		replicator@10b06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10b06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					swao_rep_in: endpoint {
+						remote-endpoint = <&tmc_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+			};
 		};
 
 		tpda@10b08000 {

-- 
2.34.1


