Return-Path: <linux-arm-msm+bounces-91641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDQODrLBgWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:36:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D48CBD6DC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 114AB312F523
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE46930FC1F;
	Tue,  3 Feb 2026 09:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7xE4H7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EB2ruy4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536E629CB3A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111209; cv=none; b=kCXc012iQE/ODLL/eNYwI0bRlvZ+mfEstJtRxdQN9ul9PyqvHWU7369ZUDdBK5C0G5QaOYXIuOHAaaNK6grUBvRbmUlyrpxIa8QhCSCpmQwA0qizRKpix6Gou3nopj+DoQaDdq+ql/90SwrKWMompXVOKDVqRHelNI65BSL1lT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111209; c=relaxed/simple;
	bh=001o5XY3+w2paDpYRNSmK49wmzg7ECB60KxXLrmgSlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgnJ0seqptXHH89OPvV4kDO1kkV9aN9GlHJO5tSjdxdsSuNeefKRS8hfB2C8oq/GD+eNMJZTxPQ+Sbn22KUvRWj82xOmXVhp91PbjBfDERiwPkfFV6QeZlXR9ENVwljxud0sbIFCMtFc9KWmvR9YThNGL5Y7zoMmfsLGz48WNf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7xE4H7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EB2ruy4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6133H6YF930798
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=; b=F7xE4H7Z5NtNFRzO
	f9N70VFTB6HLhgX792bNpZyR0iC+mNrZ332bcdWJFRE56zawc32J/ZQhFnGISScF
	1ammql8JjQaD8xm1wzp0zJJNQMGpy8Aot6ur99D4433Bew9gFhFMIXwAHG985Zd8
	XYmZQrudGNKmzwOc8yPQsZuurv6kBh+iUSElI9o/tEYDk9u1gmJlxIXhAQMQcZ+x
	mXdSJF+b9nYlUeOBi9jDJpQ/nytO82Jo08R6ttSVFz4WM1Ujbe9/lLqH395oXBGQ
	WYEpyM+N/qAqU1KxXRnkUuMUvSMi3fQQMsYR8EDYn4twC801+HDBh5LDL3VVHPTM
	SrKbfA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c38yu12pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:33:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0a8c465c1so5261175ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111206; x=1770716006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=;
        b=EB2ruy4jyEqSGn1N86MnpE47wjsmraLeiawrx8VG0RTyoCERpuITxaFTq+uz2pEGAz
         y53ZqqSqbcjpsSUu79yfIiZVXrnvTsY8YlLCHD40kRfEBTdHVVytQGMbvkxP7FBO/jAv
         LRsYLuL0cXBEVCsZNHHySY5BU8BRpfNyZMkiMTNqs1CrnXXTIDKCWc1QCLCjuoOlUbm6
         ykGpeNd6IVhQbiQi8hSfziOyTVB3QkFfcHw/HB82HadvHEcm16WVLf74F4ksIw5hsgdb
         Dwyf6eE77YgTaTL+7CUjObFfNdgszZQPZbNzhwGwp5Q+WAAzZEyyDa3yMxI9L9TEeymR
         nVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111206; x=1770716006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=;
        b=HYZV0Q9xWKfOLPC/ZkjNrGvjNAjF5NeiA564A1+a3FKov/qNKspmtIUSHt7je1cykk
         ReroF8c/c51JreZh8UZEJd362WDEn69uBLXVyQetVmazRFk0X4KOMcwsgAI/orCR7ugz
         OZct+SpWeQjariXCiGf3L0kR/vLuVo4/fz95MAC4LE1N3EChyr3/ikLUSInJIFRH0XiT
         vy5Rml3/ahmjCkadZCxtBw+GoLTx+biMa/Lz8I33Zs5xLkpWwjvgXW0BrhzhqFVcRf0T
         DWn/2qqoJ1ampC+MFAt99pQzP2ytOuOUeCNtu9ki8E22Sj7ITPWxLjGIZ54EdjmPbFol
         PN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7ENmgz6g9Ll6cP6Tnbf4frVsrEsvd3U/AMjLKyNsJW5ZCS4eqJavmKHUKCnrTrt/I3YxdTQSI1Ts2JLVg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28DUPgbSbhPgeMOULc9osAiH0k+xvdl06S2Gy0BwP23HFBDV6
	2R2VxAsEq3f5CbvR681RiZ4Mf7EilDytVcdzfMVLYFMIB+2QS5h4wEC1/OuriQPQrMLsDkSfJoG
	+OPLAr7jZrDO8YmxcpK9P0i0albFPWSlAmo7VoxUYm0F3wTdF9Me16sXpybAKKrDQc6ss4MENkq
	sj
X-Gm-Gg: AZuq6aIuBDhJqmXEDw9aYvv9wKSOycnSTGjl67yQ76WghDQ1fAVnYONvTL94lwoRODb
	9I9nd4XnpiRhVK1XXJHsSaYeRbRcZRXDOMtEOdbJkmZd1dbSfB616/cgqQDcFBIPMmY+w83Tqik
	9jvphk5um03CZg91L4lL22o8EQVWvQ52aZgFW9c9ZAWJlB6SeLyZc/OOtBkFi+EmsG+quFv5H1W
	TT2SwSGgGvptO1nlJNsWPSPudtUaUZWepJu16NypNH8TaJ0pE/H7vaZqZDlslPY+TNOFWMOYOFO
	d9nrvtWAz8ZFNxhS+bCyZ3JLEted/ExSY1JtxKpEGeLa1LFbn+8dKdPwJzf8xi3bQQHWpq7XtmJ
	55BIAkC6hU92uauiUNrQVG8dnPdG6JfGAYPQHUhxIkgKfIFOHWTq0dE3b7Vr/jo3m3FgI2JPT
X-Received: by 2002:a17:902:fc87:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2a9245c1465mr26132445ad.10.1770111206468;
        Tue, 03 Feb 2026 01:33:26 -0800 (PST)
X-Received: by 2002:a17:902:fc87:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2a9245c1465mr26132245ad.10.1770111205949;
        Tue, 03 Feb 2026 01:33:25 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm162489155ad.3.2026.02.03.01.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:33:25 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 17:32:51 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8750: enable ETR and CTCU
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v2-3-aacc7bd7eccb@oss.qualcomm.com>
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770111188; l=4485;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=001o5XY3+w2paDpYRNSmK49wmzg7ECB60KxXLrmgSlk=;
 b=PSTOMG87fTvpyqi6o0ia5EnvNjRj43E25AaazgqUn3HjV3FYjLY98xYWyyX1O1HPeUBKBkgKP
 U9OLV4555+CDKCodc2nfIetObbWtzpslO2mKHB4AGWFC9hJt1w+pSQL
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfXw9Tpri8lE3v6
 KULm3PRumq89xikmEEtMU5//aRCo+SPR4TYfKHKBHzPLz5V6puT9c9jmPD8rgU+EhqiFY4HbgyX
 1TSr4aDRVEwTKcfAbjb0dj50gs+JvNGRyPYaJcHFW4dWp1xwynkRIxBEuCvnD+qB/A0XA4ZSzv/
 NmOWwUwy0AWO53q5AzRM4tcjgDz70RbFqH2F3UWZ/sG2MeeL4ik4DpfJ16wuj8Lq1RNNXzXmpQV
 aeVcJiJovpAxsHzFWiu3H2BIopVqZCYevJqLWw0iR6iJz0Lhj+fi3uN7MRWMvVXDSO2BLww0+Ul
 v733Mhu6+zEAy3vmp2Hlfizjp6jO0qfTtF7n/R5DD6LYku7wPAxMBSVdYiXnBSuzVGqbMmGuToG
 oK1xnzm7utOQzgAzqe7tHHmvQHTN3K6PVtVZPyxmGMP43eTuBk0KpwdDGu2Uyh6VKqo8IGtKt6V
 zzxmrE9Q7qKeX5LMjXw==
X-Proofpoint-ORIG-GUID: 3WdzYWLfrcm4NlcQ2PujEWinEqhlMTCr
X-Proofpoint-GUID: 3WdzYWLfrcm4NlcQ2PujEWinEqhlMTCr
X-Authority-Analysis: v=2.4 cv=UKTQ3Sfy c=1 sm=1 tr=0 ts=6981c0e7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91641-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1004f000:email,0.0.0.0:email,0.164.203.128:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.152.158.80:email,qualcomm.com:email,qualcomm.com:dkim,0.152.154.104:email,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.153.82.0:email,0.153.74.48:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D48CBD6DC9
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


