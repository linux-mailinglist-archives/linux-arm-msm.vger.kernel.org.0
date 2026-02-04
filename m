Return-Path: <linux-arm-msm+bounces-91753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBjkB9ytgmliYAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:24:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9319DE0CF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E319430CC49C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1402C0F79;
	Wed,  4 Feb 2026 02:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIBuDiUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BErvla69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760FA2BE621
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770171770; cv=none; b=WXUxWzMmhJyiX28h5iohEEPFRc9wSM4GlvQvNTLZazDcRq9PySr5NzNOBPYRQd6s/IzX509YIic3YoN5EEY4vW/aQkt7qbt7F121N+BfPBJPqvSx6ihFVBXQElZ6apv5CM0pbs2bgbC3B84NwTT/vf/dS1qTNjkjAykT/kqtyi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770171770; c=relaxed/simple;
	bh=001o5XY3+w2paDpYRNSmK49wmzg7ECB60KxXLrmgSlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8MzyuCF7Q6wQhb8wo4mFz1jgtAf0e+DyG2ZQjbxJsyNv76X2pZ10heXzAxEMDFFMBB/Slz9ucpUgZ1DUOatywD02dqIw0N3a1JS4iEB3633The7v5/5YwI48xP1ysQd9il45adp8mvzuV8eWSExjOgXbm92qp6XwBm6YPHV6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIBuDiUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BErvla69; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlrbE2613975
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=; b=fIBuDiUpHxybXRkh
	txqyh6SigEhX+B/b+RK/9a35brTWwFFWs0R0opeFZ533JrsHwRagWVA6xXBuKUK3
	oHYEP/Y1M0dzn/QmaNY0K94Nhb3V4RpW8cllWbISg2+R5SIPdbONMnzR7YQcxZy9
	AghXCE6K3ZncTazImtA8k1lCASyJ8lwXnNVGm4FEO8NsFYwwP6cZ1l0mzvDZRp6s
	7oQpYDSXIDPhuNau1Y1JrCLcL0URBsNIEJy4SYy9yPXJR5DGe7dBi2GeElojQe+f
	FuCxug71YVF+jHqivWyQO+32ZG5JSsiKoFHd/zImqCJVXJBteb6HBqjSm+ppOtE3
	ZpOd+g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3h07jk9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:22:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so324807b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770171768; x=1770776568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=;
        b=BErvla69lPaTfIrTigEcHwNWpkF+DlqDb/q6FgUWQWSiUSpmcb7QxqUIfRbFJQuEbl
         WRnRAID7pDj9zthv41fol7w8pGQWze0nudqRQxH92xird73lr82n4DMZZaWxh/B3GaMH
         bAmyyKC2nM2PKyVvhe65MSKz/rh2svLtYkMHzK9+49ES+chugHMcNqKkaned2iNqb8kt
         g6G7OLGCiuoR3kHEUIZFtANpgdNdu99pm83+66LrRFC90bnGiwPtSjw305EiTfWdIsx2
         vECc1II+Pk1XbKUTQztcH2d9wR1z6xLdR650kgtlImIM1XqHD7lR5ijnlzznTrNqBV2V
         RJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171768; x=1770776568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=;
        b=QJn+pBRyM+1K4abbwahlJxpd0cl7N6vgFC56piTHuRAMwCEeTj+eXTEsJbfKl1osdj
         aoNHswM58/0BGLEjqHhryK5HHtJ8MTVLOoiTdYOdQVfoowzGThtuhoPKXUJOv99L9SLq
         m7qVnTf2jr8fdqkEeYeHLl8toMidltndwQkbaJGIo5qLu4Um1tLdhFGVCSgIZ+8qXTvP
         I7vBtdQGldmLksFf4Fj4Lr3EUubMfwLCsioG9bGO+NxMeRkuFxUDtiSJ7BbNzsc1uHPo
         qt5qJCVLcIhskXr61M3Rxl266IbiGuD/PnvLECcVMXtwwrxDWGI1+y0OtNYRkBzic3T5
         5IDA==
X-Forwarded-Encrypted: i=1; AJvYcCVoO5EFzSFCsubInEolMGO/jn3lfAQK8A9zeJTjB9UdOsxbUoaI3YSMPDQ5nlNN8jjg/+1/BHY/m6UQkHOf@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/ywPgI3eyP8xbF6L251d0gicJTdKAuE9eIivPnRnvwHDhUqU
	XJi1VAlYx8JyDpZFNtvd9pc6w5z/JKB++wbtgi53jFy2itbXbBaVdW+Bu6ZkEVUxHlYYLBR2BW5
	OBwaJ2VkYrX8ORAildx/4rqHxt603rPo4fYk6B+CPMsF2GxTxUWpatuuPv9VGNUKUX7Hz
X-Gm-Gg: AZuq6aJflAwJos6LEmcRCw99U34I89J2aIC1rsvfOcbSaxk4qGitKHuCid42FhUh+Aj
	m1634ez7bd+r2tCZK9aMvuOUXABE6GvMfeDab4fIPdmyzhtYcT9rgyHe60emaz1nyE3QrhMLcGU
	3XWQvHO/bZmjTW9X9hSRRtylN9uRJ1QxqDDmn9gvDEYtMuel1srd5enIQwwFFMjLwxIvo7VuWFn
	fhvx0xyVdgezFEszztWL2grcOIV0rJV5/+NTlwmlvB+KvB94qztkPc6ciXzxwimV+eLfn13im8P
	1Ug05Sa5dsySo04G4YgzHdQ0nJ7/p019l4HDcAMDR6OvISe53MrM+zOCT2wKGkhMtfxRMmXzIaM
	8TxRg/H1kHosCpwy7c2aa3lpPAxw2NWe8PT0LDBSL3aoZ6ABv7tm1wbQJpzlpKcYx7A5BSK8c
X-Received: by 2002:a05:6a00:3c84:b0:81e:8e66:38dd with SMTP id d2e1a72fcca58-8241c79d696mr1600594b3a.33.1770171768184;
        Tue, 03 Feb 2026 18:22:48 -0800 (PST)
X-Received: by 2002:a05:6a00:3c84:b0:81e:8e66:38dd with SMTP id d2e1a72fcca58-8241c79d696mr1600570b3a.33.1770171767656;
        Tue, 03 Feb 2026 18:22:47 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4a5c28sm695598b3a.62.2026.02.03.18.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:22:47 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 10:22:03 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8750: enable ETR and CTCU
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-enable-ctcu-and-etr-v3-3-0bb95c590ae1@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770171750; l=4485;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=001o5XY3+w2paDpYRNSmK49wmzg7ECB60KxXLrmgSlk=;
 b=LRSAYL0rhvhIu47BE21bf2cZ137WV7u+QOHDidV1GRooXE9nQAvJRCPymhmWbJF97qfJ9oeVQ
 sdVNwbIW7oQBmzFUGCdUGpZDbVNe3RgYGpbF7B11EWxYVY0wkAB+MMt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNCBTYWx0ZWRfX+HCcjDpzlz/F
 Ck4ocSwrEHqzfO3Tw+VbAZPyEwdbbx9GN0a/NWNeGkbuYbRWxJlokDOnT60q0HpuNEOPdRZnQ7W
 8K7P+vbGIeqKSdyPJFwD7YPNqyj7y3Ro5Rsk3hrUbjWg40czCygCLysNyaMxKgB6DwNz8uL7Rm8
 VIixK+BrDYKTXhBCUED20c9obxRaIdGE1QnWRIoCeFTMp5fm5kzqhx2FyoDqD3TMtpoAZK2lOIw
 +tONexKbDktzzpj0zj1LeOa7n1dRVUZyE8hICiDorNRySNuCFjus9eQN4FyWOOKB0/6aBpWEsYr
 04cpbqRtV5NpBLSraGjhYkD3+vxcQM7OUQ52H8K/rrhl3NmAxsaXZdgmU3Ay9FXIn9aEDuiqh5X
 8ngndrAyCNoSGeQDmu4YIKeEG0dqUCMOIRl+rCoVnh7qH/2+GrjHWlGFAe3tAazZEJLUak9EscV
 qh1t6p5Y6H/PLtBBZ9Q==
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=6982ad78 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: U74NA6jGw8S4vYSrO26qrlTnb815rx6q
X-Proofpoint-GUID: U74NA6jGw8S4vYSrO26qrlTnb815rx6q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91753-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.153.74.48:email,10b06000:email,1004f000:email,0.153.82.0:email,0.164.203.128:email,f204008:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.152.154.104:email,0.152.158.80:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9319DE0CF3
X-Rspamd-Action: no action

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device and the CTCU device serves as the
control unit for the ETR device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 177 +++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..1781ec95283f 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3574,6 +3574,35 @@ tcsrcc: clock-controller@f204008 {
 			#reset-cells = <1>;
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,sm8750-ctcu", "qcom,sa8775p-ctcu";
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


