Return-Path: <linux-arm-msm+bounces-101630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO8EHpanz2mZyQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 13:42:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D4D393C79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 13:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB2853003311
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 11:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489742773E5;
	Fri,  3 Apr 2026 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQNnEMKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIQnprji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0963AC0CB
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216364; cv=none; b=WOnHPDuVwbUDyfRVbba3yDZ4s23Bv4WSPN0IbViF5os7yaimrpQJIkyP/6sYqjAANfFZR9cPwmXqYe7fm7RDf9u49X77mWKAqhi/SDPyBGBd1CVMtyVeg/fqGbq46gm1Q8s/kKQY8pEh4vCMe3YIUz/+58zGtgICsscqWtFwtpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216364; c=relaxed/simple;
	bh=t7FMZglK2+2jzZa8/1V7/2Es9cmYaXdet2+pFupx/iM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A0JaNqTBrNTW22qJiGqATmbfnenXgWraunNFlxJGE48mFdDVyBE7mYjY0ogmhBYT0ssWZWrzAHX8XuMaqUQthp+rVcjhD7LOrhMeTe6iVLEj/P299PsYLL4Fpp09g+iMftdu/7Ycz/X9NarwDP0umN1mYWD7ghL4fgJE8/oeJTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQNnEMKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIQnprji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63373qpZ3449850
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 11:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zNRlukmz2e0NPoVz1cn93h
	uf+OC841eR9ihg676N1oQ=; b=aQNnEMKGuDKfY0S4T3Yb15K3OGY15qqW5EwTm3
	+LuhN5ejSlN7o9OoMnSF2NwsDoXiSZz2jx5LNtSZHJyLFYui5gRl5CerixRj7iS0
	omTh9jNPYuCiIs30iPV92wssxk/Jqfubt0b4JDFTj7jlhtPWC0f8u01s0tXriYuy
	mIaRwnvzNf0jzmEQNKx7Dhlozdle5LqjE6Bg1NQGEMeGm7BFr/Ur1Om2eE6mFeV8
	b0jDHOtU74QNQNm4ZtbchdnWFsxY7K64B9l3MTRhVx3rHx/5cnnqa78A+wGeUr16
	wNV+LgYQ/VaQkSpg6ZUCJ7nSVPih7/+NRZd5N7qcXDSEgyWw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u58s4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 11:39:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so2610796eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775216355; x=1775821155; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNRlukmz2e0NPoVz1cn93huf+OC841eR9ihg676N1oQ=;
        b=CIQnprjirQ5I0ceLNupfIWsz/98xprUtxubaENdGXTQFyV3fjikxF5LvkqAtlbZC0P
         dpRbfwtHcLa8Uu0dlNLrE0JZMBPp1e5ouWHHdWMf7L++hh4GzWy/cr3lRXxtPJhozsn+
         IGEso/jDUfhDY1bk0q+nSCEhka+/Bchx+lllupYh8atpPBrFiRGX0Ok31LLKZCdq5/6y
         4oEfqR/KrEJ5hpyYL0GmCLe/vRZA+E6mm0vUMeekAOmRWk8zcCZoCtkuAv6GO9jbkqGS
         WEJqugV2W9En1xP8qLJX5R++YxlWWHdZjOxuzddVmZis2rCEXb6nu6+E+Csin75LGIgt
         kuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216355; x=1775821155;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNRlukmz2e0NPoVz1cn93huf+OC841eR9ihg676N1oQ=;
        b=YXPGchv+4Xw8bznh7tuQ7VrRtSacJbm3W2yfvxRWXeGqhbRxj76ney3NSLCPfKJRsm
         sxmwE+yEDoPyB0pipYVjxH82K4q1XF0Yc4W3/X8MSkDsTunFkAaczS+UFcsXIacI8eOH
         vXPtoMrntsZPPvx5Unmh7HKaqkmab1H3ER42QSo+bZelVe34hYoCEqyLgHkoZh3Ypx5p
         PgyyaceyUBLwhmyMZilOO7oh1b1oF0/sm/YRXLdzSd9hpTt4DLsH8t4nbbhKPPJbUcp6
         4Iwx+9acPTWopzp3c3k2PGLQOedV+74GYXTKLffmrmKVgt3Ww5BYmsg5Sej5KmJxdDhH
         S5lA==
X-Gm-Message-State: AOJu0YzjIENraHjmItp4My9FNVGhqKmhSFOn4F82zn11di2KU3ooU7A3
	PJhwB7zndPoFJmGXNQaL4xlhZTDHjtpzD+sAhFEC4MntDWgBlZIdJnTaz0A1nX/dsFtO4BgriVy
	/M82Imm8PB3H3CaDUMsJYsWLc88AwxXkwPopWHdvQ2ebIqa0F+EDjBxjPylhExq0V05sj
X-Gm-Gg: AeBDieurryyJ+KFqFhPVbsFwnOoA5N9A5FPa3sJ7Qm7SvFrDVGpJVgPBw6H1EoN19xk
	1goX/Q4ra8keQl7/lQZu6bK5MUtAxpMo+98BX7t/sJgLi+Pmc2AufYH5i0YsMRtIsziR3k7mONH
	kZBQ4DEfvgSYCNEYo97MUZIYYd4IjfpOcpTXkXk0udPk7qy63GVklcFU0QVFm4YmintqWnBoyHz
	YfB6mvnJsWtnfulWNIEE4SBM1+Zxo+YlnJ6fZnqVKBbGojrws5joUO5lXG+cOAokSEH1rO/g6uZ
	xyWgiPE7RAgBDujmn+lA3+IRFzCP+X9FVnZWamXhwsfX3E8Ed0ql58aQ7LzVCExf7OtjVq9L/q1
	biMdiE+5SBM3DtFa0EmVpvVS0H1nNDwIB9rt5+AV79N07JueQ1TZ0mK4Fk0tnu8AF90o/eG4=
X-Received: by 2002:a05:7301:d1b:b0:2c0:dc7e:ed17 with SMTP id 5a478bee46e88-2cbf9afb1edmr1436587eec.10.1775216355302;
        Fri, 03 Apr 2026 04:39:15 -0700 (PDT)
X-Received: by 2002:a05:7301:d1b:b0:2c0:dc7e:ed17 with SMTP id 5a478bee46e88-2cbf9afb1edmr1436568eec.10.1775216354705;
        Fri, 03 Apr 2026 04:39:14 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20b195sm4905005eec.16.2026.04.03.04.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:39:14 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 04:39:05 -0700
Subject: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANmmz2kC/y2NSW7DMAxFr2JoHQYaPKMoeo8iC4mmUiWeItpBi
 yB3r+xkQ+AR///3EEwxEIs2e4hI98BhGhOYQybwx45ngtAlFlrqUubSwLn/G9YIPCHOoNHqwht
 nJGmRKnMkH373ue/Ti3l1F8Jl23gnIt3W5FleMTEQs909bfaxa4wu4TrOb0e3wF2BBFtK1JZMS
 Y37mpiPt9X2OA3DMZ3PbdtZJtg+YWkz10mvTEOFR6VUrauqcrVC8mjqxpAtZF3kOaE4PZ//8lO
 tLgYBAAA=
X-Change-ID: 20260403-glymur-soccp-2ca25f3b30e2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775216354; l=3114;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=dFPY0H1JaBHk/xYfZOnRkRZDP/3sJqYBg5AFq3lCtH8=;
 b=9rppjBP2DK82xX+MB2GijNXSZIuHv5Py3RaMgMMY5lQe0sP209+T5sL9XKkZBJ4uxyrNDK2Zm
 PzN5HVJey1lBcfjqyRKAT3rsO9ZkCT0xtpGqsKww1ihKQEsqA4sZEal
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEwMyBTYWx0ZWRfXx6OsEnxxk1CV
 UUELNcbtsiIkbmUHzHTA/QtgEGLi9irhdw6cdibOUPJ+Iqe05YV007BYUEme0HSGWZzfp7d2jPz
 S0ran2CBVIBM1FpDvjqI1EdM3M2VgxUryQydrleiOlKimdyCEXJEUd9rTief/9egIIx2vAsz94m
 3ZoPeEc0i9Fqbku5fbNhmTpFl1ov4p4K97x5UAubkzpVqyLSe2Oc+BeXF6x/HveqhAFYaz3QgFU
 1Lp6O4PLJdVvWvAyrTw8ONGGItLFzZL80ot9aBU/lriBlPmrllCGSr+VGkPX+9R7JG+w/JgOd+T
 +KogLfq6BfvxLbjjlsCVqCDK3bP3dkGyGJdN+myMCiMQUFWAK9bYSlASrftfwmQWWEALUQFK0n+
 NEuT3PvR313DVpPoBte9tf9Ui6kxP8ZV6UE8BHdDGa42qjgTwdPwwYk0dG9rYWUxw5pgKduBgkW
 JxP0V6IHQqxkhrtQeew==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69cfa6e4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BYW15FwYW1ykoKNPTzIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: rc5qJbi8vq3jqujzB56z_jXDXjTZ-ZJk
X-Proofpoint-GUID: rc5qJbi8vq3jqujzB56z_jXDXjTZ-ZJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fa0000:email,d00000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101630-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C9D4D393C79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 47 ++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..3fdf8dbbde02 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -560,6 +560,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..f7f3374a5e08 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2264,6 +2264,53 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc-soccp@d00000 {
+			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
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
+					<&soccpdtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+
+			};
+		};
+
 		usb_hs_phy: phy@fa0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";

---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260403-glymur-soccp-2ca25f3b30e2
prerequisite-message-id: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
prerequisite-patch-id: fa390011ee531589a7ad14250d158f497622efbd
prerequisite-patch-id: 93e7fca58a5c06edefa624ec2b006dd80f4749a8
prerequisite-patch-id: 99a3b6a7fcd061267b40097ad25f652ebe0a4c7b

Best regards,
--  
Ananthu C V <ananthu.cv@oss.qualcomm.com>


