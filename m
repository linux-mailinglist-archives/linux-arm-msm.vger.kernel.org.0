Return-Path: <linux-arm-msm+bounces-103781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mARbHB1U5mkDuwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:28:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B35BD42F824
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 301A230C0A72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BE43B3C01;
	Mon, 20 Apr 2026 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcNXDeB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeRuIfCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C8F3B47FE
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692193; cv=none; b=EROI13JUFmFwB+95DobpiMtnbKSVp7qlsSmznIc5to4zbl6Yep3y2+BKO32V/oltH4oKYVtoEOwN1oY7cVb1Dbuph2a5TggohVrLVPbjZnUir9uCGHFKDv1Z+DSvGlIM7UzwXwBI3/N1NiIIaCixt/sfh54Fv+awhWLwU19Iqws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692193; c=relaxed/simple;
	bh=7fK/nJBDBKr8gQ/ZQZIfX6ZcYqbkWgAeRG2NCe02sJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epFmYgEO8QM2BLbBxW7PQMLqty4na1+u0glVEeKVyw+G5shejahCdeuxW5CcrgI0FarIVAXWrbScfGDasXnN0g/Yg99K0UaeTw63vBEl6gvP649j5krvzm2BeQ3bDplX/K8UzaOeV+t8MlZ9xM+5/LI3wNqnFC+BOdH2u2wGB0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcNXDeB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeRuIfCC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97SpY084514
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ejj/uRB4+uasiKUqyUjnwU1BaXr20Z3LDpH
	r6AeJKXk=; b=EcNXDeB2VzFWRVeutC5wSfwWSePHjbPeP+qFko05O7Sda2K6mmj
	5C1Nwo5E5Nfyunh9Woy22YXgFdwqU3qGIXO5gm6Tv7SZNjOYPO0s+EqxqFcFQORW
	3F70i4mqcBojy2Z5/Wcy0WPomCgU+lRHuEpU7EOjisbpKf3jF+EsT14cfm29Gusy
	ZnMhMLeyysBp8rVO0XDb3yZ2uyMD9Rifz8D+yBJC9k+6Ddh3H1sGO3vRbzL0egql
	oV1u8mqjQ8Tfb6K8WrlFBeulkE1QEhohLGp3J3AuYSf9LNNho8M9dINSUpzVuNLa
	P1k6t8Txsw3t0kRvwmazcJDfUpkzgFY+1CA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81gw9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:36:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso36980481cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776692190; x=1777296990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejj/uRB4+uasiKUqyUjnwU1BaXr20Z3LDpHr6AeJKXk=;
        b=TeRuIfCCUY2JLUg+7Cq4QHz4GvEkyeGlqdpSD7g/g4jwON2n5h5DcIzIXO8SSGpb+R
         haJGUfHEbjihcJYVR0FcX9NuqGpJRqvN9WxCYLVsNT0dn4voWfn6ZwZJ6eiO/5qBkm+p
         XYRgggP4t4QdfCGDqRwygDVeyU/+YhEX689SuELrX5LTQOuOLChgCA01r3ywiS5uj9jK
         IK9Y6IAP+PIw3ngeShHpVszKeexPBDln7nYX6nYmdtSCagJh1rD8gNekoTRh/3cG7XlV
         7p9n3MLhy7InggdT4FPIfJdJ+Px61HCfsydy9Mir6CT+ZnQ+An6aDZNJ6rD3G8lFOK7I
         xYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776692190; x=1777296990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ejj/uRB4+uasiKUqyUjnwU1BaXr20Z3LDpHr6AeJKXk=;
        b=IAlUVyKlBrVv50RYa9SwMufVTXhJupVwwjxPsqp8tjvhUbxWSvepfuSSuUP7RCBuON
         pyuBRYt2JWjFecFkANrQeHwt5jYOvYW7ZSTzu0zNqMaDaCd+sVHvHEN2blvGck6cbysT
         xtjVl8wzIYqrI21IXixb/cTO4ZbFswEDYE7ZPaQ15OA5GMyY8Rt1phewnLzMaYp/FzY8
         GgRZL5tRO+p5IcttF1iSz46H6PmQ19BLttPDrQNJ5AXKj/Hwjccpyj0ifoCyJ8GHrgTF
         gFV6bG9e54RrFXPYaCt3jnMS93FVvceZw48Q33LJ51lsgq1o0ZGJX8txtLdwD+9uBEFn
         3Orw==
X-Forwarded-Encrypted: i=1; AFNElJ+bTms88crH9gHWl7vKZ3/bby/eJVbyEmHI6G4BQGNOOVnTCh9FrTZm91JVDFDFCtwiH3AjO7x4FRo+ZXMs@vger.kernel.org
X-Gm-Message-State: AOJu0YwAGsm9aEL4jpli6iDodpVAKRcP62uDpsGOD0M5W6UtwupuXGK0
	+4NDggJl+T9mFes6dH9C/iGFbpjl20P9o9qys88F7CdFJ6L/RPY8HE4AqrRy70Df6SNf8UREF0V
	aEviK2YDnvL60E/IPksmb6U6dSe9PV3sAajlMwlwaqHsJNRN0adHuTVapxVs5twajflF5
X-Gm-Gg: AeBDiesxG1C+ld5lxdkIOp28KE5Is0Hgj9yuU3Bqki0QWIXqS1hmEl9HCyk6CY/QUE2
	iwUJ2b+mRSksDw4N4oDic8o8DK4vFtyjvXWU3nTq6dPzLZGkPXKiBtHMOF5rRJmwh0GwVBq9UQP
	DSX+uTmKnCtFqtQFSXfiaPTiq3M7lo8p/ezyy9UsnRN8eBewQOLL/OSHxV4Iuvzr4shbmF7rS7l
	2cGO+90fMRr4Rkc4ILI5gV7oB8We4qz1QQ3doxPb74UgK+BBeabr5Tr6oO+0e/JNau/Ea3JiYHx
	4+QFp6iMXTUTWKmKY0anRlpgCBUwehR2OVKB/UX7kTu3ktzmFaKbcCPQTVoiblfyvK3BOzPheDO
	NdD3ONG+oZjdGCeyk9hZkBSZ69FhnIqok2ie3CCpHh/DFJ5A=
X-Received: by 2002:a05:622a:a955:10b0:50e:4241:ec47 with SMTP id d75a77b69052e-50e4241f0efmr88547571cf.40.1776692190153;
        Mon, 20 Apr 2026 06:36:30 -0700 (PDT)
X-Received: by 2002:a05:622a:a955:10b0:50e:4241:ec47 with SMTP id d75a77b69052e-50e4241f0efmr88546901cf.40.1776692189418;
        Mon, 20 Apr 2026 06:36:29 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc100162sm310383925e9.5.2026.04.20.06.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:36:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
Date: Mon, 20 Apr 2026 15:36:17 +0200
Message-ID: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3121; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7fK/nJBDBKr8gQ/ZQZIfX6ZcYqbkWgAeRG2NCe02sJM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp5ivQ/aUChFY0PKkUjcjMNJuav9qZLjk75JVxn
 6Ljc3ZIXoiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeYr0AAKCRDBN2bmhouD
 16UGEACS48d85D19VTfVaBcMmnO5x0ALRyEEIH0gbY62H9pywmTNxx35cuhLLsnR6JI3LwQDcEk
 Gk1xxLpZuMkWHdau0FR8NnFVN6R5bQC53zB39P/GqTmKsZ3QglcETU+PLt22N/+zglC6hQjgM+2
 NTg6jxNVjyFnLMO07kQavv1uQO66GuSKyjFHYOme/aWd/Ig8WbdAw/a8hAYtyq2ckNEQoLA8qWf
 od8AZJYXGT1jHWWRhxS1PGmV3G7i0M2w7IyhCIc7P075/Fxd6QU8ybaAAni0KTVWl3SJZpJvcFT
 pH0QpB58UW7IgxIv2bTfprlsmIzvlDzpC4KWyOqJ2aFhzOhT20OrvJboKwOnxfmX3xP9jkSkLzj
 YeUjd9juzWjxPad/7V6k3g197dbTbfqCiBoLWXQZN4C44nBfbA282SKUDfS1SBmuKkv8WMMYY2/
 wZQ1I37i2pg51Sk/Dow7lftPs9OaxHtfJJTZ5GomZ8IsZJw0fjmWhHGzHCpjkOiL+RcRSG7mzkS
 VP0x7i8U7kQ/7Kn54aftDdav7Wd0S+PnuxVRZv6ZoP2yVHLCpc6sWJBUvJRYzCKbdz4H1zK9qeG
 aoS2Pw/iWyweag0MwHxS+RVDWKAlA5XlhIs3cJdENyadMoQmDMjV+e6725jLvoQk+ujof9N51UN kRYfxLVNMp4HAtQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzMiBTYWx0ZWRfX4ycbbSIB8Wde
 QU17YNhC2Sg27cIcd3ys6N0s+FoL3Dkuy9H+ffK/0IJQ7i70EbHV2+vhmrBSUA7a/VErz6phqWc
 6+2964hjf1Wul09Vu2Wv/mf5TjyaYin6ZLH1oIGH0dKIrF2RNjNWB+BSEEzVFsFt2TwV7AYlvbb
 X3E+rwxcKS3wwZ/lm2jjO4x71SI9PBM8U/hw+FF5mRQqxnx3a7HCBeU3q4a7PkDeN3W/WueOZbJ
 qeVrHexSk/tvgkJi/UqGS8oibx0D+c5EZLL32VsxypWyZE1Hzp6daO455H931rmRt7Gr3U1DJym
 usORq6TACwXWHfa56YCHIs9jHqhxmk7rmz/ndYggN8/lPfRdGLKhtNzzAgjYdTiYWQ4mTNKVrZv
 Xnxp6wDwv4GhCCWWSLLvCsr0tDqTevCX3gP9XrhzGUKpN9nGJF95136Xb2vVCSKK4JW+zYGaKKK
 OR+ZYEf99VKetmIYUXg==
X-Proofpoint-GUID: TcdpuW4VVOxTpvuF90H3rXVqdjCceKuB
X-Proofpoint-ORIG-GUID: TcdpuW4VVOxTpvuF90H3rXVqdjCceKuB
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e62bde cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6vJ1rGMNMJ1YGqXfLoAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200132
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	TAGGED_FROM(0.00)[bounces-103781-lists,linux-arm-msm=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.960];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B35BD42F824
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to user manual / programming guide there is no separate PCIe
phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
4-lane blocks.  This is also visible in memory map, where the 0xf00000
is marked as the main block with additional sub blocks for each 4-lane
phys.

Describing the sub phys without the rest is not correct from hardware
description, even if it works.

Link: https://lore.kernel.org/r/20260420-optimistic-unnatural-stingray-80da35@quoll/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  5 ---
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 39 +-----------------------
 2 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..647e934f4edc 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -440,11 +440,6 @@ &pcie3b {
 	pinctrl-names = "default";
 };
 
-&pcie3b_phy {
-	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
-	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
-};
-
 &pcie3b_port0 {
 	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..d5408bd3a389 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -737,7 +737,7 @@ gcc: clock-controller@100000 {
 				 <0>,				/* USB 2 Phy PIPEGMUX */
 				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
 				 <0>,				/* PCIe 3a */
-				 <&pcie3b_phy>,			/* PCIe 3b */
+				 <0>,				/* PCIe 3b */
 				 <&pcie4_phy>,			/* PCIe 4 */
 				 <&pcie5_phy>,			/* PCIe 5 */
 				 <&pcie6_phy>,			/* PCIe 6 */
@@ -3632,49 +3632,12 @@ pcie3b_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
-				phys = <&pcie3b_phy>;
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
 			};
 		};
 
-		pcie3b_phy: phy@f10000 {
-			compatible = "qcom,glymur-qmp-gen5x4-pcie-phy";
-			reg = <0x0 0x00f10000 0x0 0x10000>;
-
-			clocks = <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
-				 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
-				 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
-				 <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
-				 <&gcc GCC_PCIE_3B_PIPE_CLK>,
-				 <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
-			clock-names = "aux",
-				      "cfg_ahb",
-				      "ref",
-				      "rchng",
-				      "pipe",
-				      "pipediv2";
-
-			resets = <&gcc GCC_PCIE_3B_PHY_BCR>,
-				 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
-			reset-names = "phy",
-				      "phy_nocsr";
-
-			assigned-clocks = <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
-			assigned-clock-rates = <100000000>;
-
-			power-domains = <&gcc GCC_PCIE_3B_PHY_GDSC>;
-
-			#clock-cells = <0>;
-			clock-output-names = "pcie3b_pipe_clk";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;
-- 
2.51.0


