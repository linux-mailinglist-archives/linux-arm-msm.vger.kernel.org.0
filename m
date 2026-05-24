Return-Path: <linux-arm-msm+bounces-109530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HrFLu9XE2qA+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:56:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234F5C403D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AA1B30578B2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3540430E0F5;
	Sun, 24 May 2026 19:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVDyVxsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCprqNYy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0536D324B2C
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652220; cv=none; b=TNq5frXLeTKEzTH7JpjYTRgmOA4n45FrYFZF+9JwLpKjY2txu8v2ENDhRYSormyvGbMGUna3qijgAwAqlLftPdaTeqF8Dv0fJiHyCqutyRKHCTzeJNhOephWwsJUYESGkJPtM4Bdwf84FiEzi8s2p9fl5y5cOZzxLC33/5M+1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652220; c=relaxed/simple;
	bh=h2561MUTAlBWP9LstFppBlJ737L72NjnE3HiMjLnIww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZwT8KK2e3iyIa7jQky5o39fjgzZpcL6/fB9IHXQ4XGNr8eQd0uRZStaM+QfcYTqb48b92ypd3xGy2l2dpakT9lb1XW3cwETdK3v3Ny3/0ItVoQ8bYA+g/lp4PbSaP4ZFmw1A16CapI4EKMOygSJEr+zyukOSMaodJBM2neF6XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVDyVxsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCprqNYy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ODFx7X803976
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+KE1req0AFK4kYUvSBuXjFMHaKhuk1XxVZE4565XCs=; b=PVDyVxsiK+92KTA3
	1sQ8Qi/BMCBPThWVpUuYsztNz0J+/beLWfeKLDr5J0pXm50LEOpnokbqoDq+zFjW
	7dqM8x9r5OnuHVqNuPl51qXEhSSoZeTH6acqlHExmn+Y1kNfKA9B0EEZxTGbVuhf
	7BTqKOweZv8lcynHBQ7ht08kUI8WBnBZjD8JlcbmOgwMpQ6te/DqL8EWGdqVYAo6
	IceHXquy91T7fqqz8RPHeTNMdIG2V/xQu25NtJHKIHeslEpyWh7imDcmTtUQcZg1
	/K7tGE2vbQJwO0zQy7XteEIRzwe4EEZZgwanmIOWBjggfB+EmgP6XUf0jPCl4z5e
	KVBwhA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0u494-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so8696738a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652217; x=1780257017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+KE1req0AFK4kYUvSBuXjFMHaKhuk1XxVZE4565XCs=;
        b=dCprqNYyG+sHO0PFapIfydjq4VYcpPiVsAljQItk6rYNU9Rib+qvslTLXBYOkQ5qh5
         m87ZrT00EhnUhJc8lgr6AU6WYViRgzDIFpzDhsMv2XfTCbtUKGGzsTHlubLFjvKT2zsW
         nl8OmfCdUYEcCxAbJ2JHDak/8F4YnLe9OD5N0dJweRhesjDXu+Vyms1e0KURUDzh20a0
         mD3kD+nRDDLJlHxUqfDfniE4Eac4oZcLNaAwymWw11yRPLNa3OMZr0K4TcsK7sViHyCV
         omEMtvgSyi3blzR3+t+p8uSd9n85foyqbNHjer+yTI0UsqKKKv47yUvXb+BCcHauXt/0
         1rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652217; x=1780257017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y+KE1req0AFK4kYUvSBuXjFMHaKhuk1XxVZE4565XCs=;
        b=HQew3CEL1EV3juwMbxJBsGfyLpDiQN+eyMJyKEpYJepuxNj3ZD45vePFpbc7Me1H6d
         hruzSnQX8DEqsOZX3AQt0YsaymWyBtQhaUj2QZ81uPsXH7aGouUY05f99QWrZK4pRVgj
         6PLL2JbIvS/YjmkfegSIIiXZZv4M4TtbA4p6FuOlozyC0BzqP4fYZ9lstLEDkmzGyYJD
         GKJA6asW778r8G0AO5IS0nKeeEmG4LWF/FGIfrp4WYK73/hxRRRBOp2L6khYviKOGxjF
         xiaqHWdvKaM4YN17qSWi9vc6red79/Kaq0o+Ok63CZq4yc0bmbdc3Ew3Os6PyVUV7ooL
         7GKQ==
X-Gm-Message-State: AOJu0Yx3DKo95qFzWLrWP+1Zrsp0MchH8iGRzxU10WCV9Wd8aRUuT57I
	4pNjTAN9XBEV+DQdDh431bI4Y0sNWwxgFOPoveV85kps7QdjXm8Ugal+F2jbyvcJ5iAp2BA810d
	MYoIuYkc5gkwLnRbUlW1abfwgNwVjhjpPX5vezam8r7MSCMfhb4qcBIOYL1zA20zAstjI48Xxz8
	IV
X-Gm-Gg: Acq92OFJ94NSvvYvIxJG8vbQVwa4OzgNzOxaNLlHXDOGlncUvo8TwPf1eYYfki+o2aW
	RYrWFJZIR5q5bphNyg9xq06atMgKMpU/hhuvWLKAL9nZ1KCp+iKaZuEWW8p33+evos8PWkrgkH1
	wNU7v8Yp2tBgBAGLqBtJ9j24RIydzcDhK83gt5uL8G0euAh8QFOj7tWE7+qPNrIIQkkmMV4a+MK
	USGI7MSyUd4kXnqSJX1cWvTV3YQPygbd/Ktl0HSZ20A+dhg+3VsaHkIL5JV77vSxrsJWJWK313s
	ru1pOTqdMARgcYrJ5u9p7cYoCPBJmM7p0JnFDhYfppvVj/qAJMYzTv/wJpOl+HgpYuJJBDw/cbs
	+DuGvdY+5jrE19mTpMFWoptiI5+RBd60kSn9J1cHV0Vrhbrs=
X-Received: by 2002:a17:90b:3149:b0:36a:ee1:fc1c with SMTP id 98e67ed59e1d1-36a674c5677mr11953804a91.8.1779652216468;
        Sun, 24 May 2026 12:50:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3149:b0:36a:ee1:fc1c with SMTP id 98e67ed59e1d1-36a674c5677mr11953765a91.8.1779652215853;
        Sun, 24 May 2026 12:50:15 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:15 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:13 +0530
Subject: [PATCH 09/16] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-9-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=5225;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=N2myH3ZS/JYAPq+cEvLA9M1TLJ/FuYAVGQaHhcS9rEc=;
 b=O3e8l/eJsdXMmKUozXX9JNw/zpUBRo2I8Gt/I7iZ63YbLY/mHjcclWZhwD5/uSFxv6NgO2JJw
 8AjiUFKULpQCtHyOXwbM58Om4TJw4asWMcO0+mPdDvhSpJ/MuN2Wkmw
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: -Qm4zn83v1aZwXC5W8mZHyjNg4zGNt0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfXzn8KrUiFYRr1
 gb06+7VWQTzqMuoz6OTW1KmcCJ/392m5DI2GJ274FbvqCfZXWPFcxSnWhCTp0FWABvwn1DkcejC
 nmqvlUK8Z0IVXVSmYJQlzYzJIJdDS3KUicY4rWpMCe9QWHclfVfWkS9sSNG7+36xt57Bd2dq3H9
 Yy5wbBFjWyyUaTvmNnrG4w1ImygwSHm9GEIh23wbNf8bkEIfQ4sL7oGer7vatbUZPQTEe+MIUKo
 HKTMnFYaAtX0FTddiqYJPBWtHwy157+47y+pr38YOhgmWiJDU2dB2QkW4TZKqZ0KZZXp+LRPczu
 fRFIY6BFYc5jVSpLhTQxbHZz6zxzhZsm4MKxL89w9yS6IFksUeYdFXqAc8rS6q8ZZ9k2sDc1XPj
 KEcjLKLxI5JWjOir+jZC8lMu95CxxaSld5QJ2jy4crBvIsczY65NkDbo+Zq+cDuiYLTZIJotzmh
 /CCHGV7an3hLOnO1DwQ==
X-Proofpoint-GUID: -Qm4zn83v1aZwXC5W8mZHyjNg4zGNt0L
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a135679 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PL06LPxOd80rETEQ2XQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109530-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1234F5C403D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2ea35e4442ef..96ec5b5c7203 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1797,6 +1797,170 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		remoteproc_mpss: remoteproc@6080000 {
+			compatible = "qcom,shikra-mpss-pas";
+			reg = <0x0 0x06080000 0x0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING 0>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&mpss_wlan_mem>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 12>;
+				qcom,remote-pid = <1>;
+				label = "mpss";
+			};
+		};
+
+		remoteproc_cdsp: remoteproc@b300000 {
+			compatible = "qcom,shikra-cdsp-pas";
+			reg = <0x0 0x0b300000 0x0 0x100000>;
+
+			interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING 0>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&cdsp_mem>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 4>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					label = "cdsp";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0201 0x0000>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0202 0x0000>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0203 0x0000>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0204 0x0000>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0205 0x0000>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0206 0x0000>;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x0209 0x0000>;
+					};
+				};
+			};
+		};
+
+		remoteproc_lpaicp: remoteproc@b800000 {
+			compatible = "qcom,shikra-lpaicp-pas";
+			reg = <0x0 0x0b800000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
+					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
+
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
+
+			qcom,smem-states = <&lmcu_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 9>;
+				qcom,remote-pid = <26>;
+				label = "lpaicp";
+			};
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1


