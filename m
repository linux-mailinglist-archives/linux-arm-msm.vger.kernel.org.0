Return-Path: <linux-arm-msm+bounces-106897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBpCJB63AWr2igEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:01:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CF250C6A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 497F4301753B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA321E633C;
	Mon, 11 May 2026 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1yPgFk3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLP2oJYf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760D8263F5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497302; cv=none; b=rHlLy+FwGkOWXgn2fEhLsAg4wZgCofxg8fcBkOwj3krMlrPTaQFZRpceJPkjn7WI7XfW1uHhGQTWR81Sa56t8kxlGHs/QsUQkTAsZYo6xeDk174Cb2YgPkHEYNytrJC/8c/DEF1k3Iq68lNo1qaYJy6hyJUDVo1Bc6EBZQLdm9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497302; c=relaxed/simple;
	bh=YNwSIpFm08EBvtqIqMQOfYYN54m3ct/e/7rhe0o7l6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UtOgjCsqSFRzisrFsD1VQRYNTCwe7ocNJ247+w7EU8XY5FerOvnMAaIG9orYubOqDoj0P1h9X9CdoIbaLTdxs0MhP+22COOO4yT6eDvCZ8cN68JcnoUCuEmF1zfAqN4Bb9bwBRuRFQ15eDBGmc8U/EMF7kOaPpFfRmi6emNRAKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1yPgFk3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLP2oJYf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8Hv831850356
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rjt+1DL2EWHMJuGEpz6QP7
	+XUe0cPp+JGhcItYkEqBo=; b=J1yPgFk3qEpH1hN9vM9SNuSPga3H5qckrQBay/
	qVSrt6L42VlniBmnYdfG0fYDCU4ZNU+W/bwwLzun4s8jMQHYWdU9D17A1+ELYdCH
	ftQBtyI+9tYfL1SinXDvaEnE5tqd1Xxe2hSsCeDYZjAgHqM3Ql1HMwRqt7mjifUO
	sixdlHaoP/PT8SgyZ1DgsMjuHpybVPbvXQ4cdo5V8Lm8Rc2r63CnyGpcCJdEehH6
	4M/IlwBcEhe3CJL/yFK8jtLl5js8mV/Hr9eAlSOle4J5HyG8t6p3OknQvbTRbFUF
	/LshuUCW6UfgLqYk4SUEDCSLUyH2pXNKLRKncCoizu+HMCmA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3bfvgkff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:01:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba5f794825so35217675ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497300; x=1779102100; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rjt+1DL2EWHMJuGEpz6QP7+XUe0cPp+JGhcItYkEqBo=;
        b=eLP2oJYfywXHI1qk+NFMa1OKI8lXHjuXR9WG574PtYvSvvEaRNN6v+9oLqxUtvUJLl
         abWv3lV4pm6eKtS9SrP+tcP4hKbR8BoYZ1wcL+kw2Mr658Qcxwehw74PT1HkGfHoD8XW
         vjcWJaHLqoG59NzUFjYP/mvsaLX9Sv72FqmiA9nFQLVTUsluopnpy8BWkr95+tFjBlsl
         PyXltaoggws4IKZ/cpUbwZ95NXyYQXG0aPlEc3I8WtvoyLBQi0YWpsQ/voYCkjpt6jjq
         GEpYCIRzHVQ/KimPn8FRNFxv8cPYXnkYl5YGqlIByKPWzZUIsvmleXw+1iNWPbZSIU6E
         M+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497300; x=1779102100;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rjt+1DL2EWHMJuGEpz6QP7+XUe0cPp+JGhcItYkEqBo=;
        b=nkUrBN0+YbmHGifGb1daCjGAFLKqyTrjWRCsemza4dNgsG8GiTdObd8Qbgf7UFpZD7
         pp0nLTkRDAek1Jkw7JLAq+j2LWsCQ88HUxBnUplvYBgylBHC7xWVjp9zGcVKcRvWntCo
         ITfiMrAUCswtvM/IHfYilMUpAA3Jjh43MkwLIO3YBn7OgXwSW/IwcrGX7g4/IVt2Fu+r
         5tl+9jIESfs/GBSyLxHOqMq8DEAMr7NzBy88tHvjwjECl4GKq5AhV6pbPinge14x/K9S
         bdVgXpTA0l1V8xRq9tZxx2lVQDncx90UmKhl9zbedMq6Bg504iSef/HXYOcNb30tBEZY
         Zv+A==
X-Gm-Message-State: AOJu0YymUFDQIOCZnJwIG037U+/1zN38yq4blZqQivUiX0siILE9jYet
	CAnC/HYV2tAN9SFYNuOEUAAm+gj5+gg3iPjqStjKmV7IcPwqSxOolNa7N1HCzGmDnBe8KX6Svnv
	93cI1cgY31GOI3Cxnri7odQkTWN65KnkhWW/ULE9V6My2+N6Gf5lDox7O1nzuf9c+VXix
X-Gm-Gg: Acq92OFvDM3WppK6P/ymQbue7QPCEdf3HJwomx52/EuHNkOm25p57etMwDnWMZazujX
	XJo9+YRG8YJhdTZFb0ePgJClaC4PCdqgvV8NJjXRX1Fl2OemddAOcZizMBF6ktcq57sohygOZuz
	eE7hIYDPEid8VoMAsMBlFeXwd78sgrMrwh1n8DCcyexXH7Mrgj5X7ik55fTfHRn52yhNVUFeohQ
	87V8bH4Q4lz/fsDWooKCq5c39mJBRWrNnusLvavkAocNS2WsQy3gRP/g4KqRM5B+7x6AkvLLqQE
	njf0LE+meayWwlSha4405CwWc9AeJznrliWsJMP/aRKgt1F6aNQ9qyKATLRG+8u/+gzCNj+Stf3
	sGSJ6PsKx6BijESpbfX5blojJ6uQLo5MhY5x2HQcmvx3xxhl+JpkA6Sj63BlmoLlsyrg+wfLjWc
	2q+tc94UC9LVTNLteRLkexW0bicjIoEpv5lxaL4vIQbBhfQ7ZsqEln/YLilQgwq+u6voE=
X-Received: by 2002:a17:902:d60d:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2bc7ac7e1f1mr95667275ad.37.1778497299991;
        Mon, 11 May 2026 04:01:39 -0700 (PDT)
X-Received: by 2002:a17:902:d60d:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2bc7ac7e1f1mr95666645ad.37.1778497299359;
        Mon, 11 May 2026 04:01:39 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec232esm104238435ad.81.2026.05.11.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:01:38 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:31:34 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5210: add the download mode support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq5210_dload_support-v1-1-5609c6b8330e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA23AWoC/2WN3YrCMBBGX6Xk2kAm2UbbV1mkZDITdxZta5KKI
 L679Qf2Yi8PfN85N1U4CxfVNzeV+SJFpnEF2DQq/oTxwFpoZWWN9aYF0DKfWwtmoOMUaCjLPE+
 56i/nPHXebpFRrd85c5Lry/u9f3NZ8Jdjfco+i8znZQ3W9+yv1zf/ajWWPKCMJONBt4GTIcuBY
 +gv8LRhKKzjdDpJ7RvudmQhwtagASJOzvtkrENMMXl00JouhZ1T+/v9Aeof+EoBAQAA
X-Change-ID: 20260511-ipq5210_dload_support-4336d9627beb
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497295; l=1328;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=YNwSIpFm08EBvtqIqMQOfYYN54m3ct/e/7rhe0o7l6c=;
 b=RAL8HuuXK98PDkLCK6tZO7K9uyOfCPqsL3gbjquPZEylSX5frOaeB58V/+N0WbQXQQoXhguNW
 2G0az6enMTMDrRWy9heSHJQ4SAAOboN7sqvUZC6pstelEJzyMO/TCez
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Fa4HAp+6 c=1 sm=1 tr=0 ts=6a01b714 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Wwb5wLp0g7qfDHHg2hcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: W2_5v8YRLBBRQbw04uFRw4DIEbCR8Q7l
X-Proofpoint-ORIG-GUID: W2_5v8YRLBBRQbw04uFRw4DIEbCR8Q7l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMiBTYWx0ZWRfX17E6LUU7G1wT
 bGW/KbkGcWzrXUOAlR3cGCljOdGAtSjH3Ha1IKfOgR0Ha4fv7bDC95DBiLKE0kEtiRfPdt1scRD
 XSL7asTJIpIvjd9+nhFx1vQnrNxRFo983zhOoaQOYvup/P3cKS3+5yf7nooNL6d9yEiKZ5r3FXX
 3d/Mlcwb2WJLs0TPk/NIaWiRoasCMDqCaS5lySogsMC2wuxr1/Q5rW2r50PLzcqIwZ63/CbBupM
 YP+1nRLg8juBgenk8NfVU8xeQfiJlRF1AoSkUlVeDgpXj1xJH8MMo4wQjtLrUDWQNse1NT1A0LK
 gInriuuT5ROhePgKhlH7ufcxSIGTX1fvBs81Lk+MaeQnKK0KNy3jhcx4n1cFrPNsZfZlWxckink
 nI9qx4892z+qKiE7bvnuvzEHQBOVeR3ZfihWX45O7+wOnap2BfeaiAKW4j9ouJ8O5iAMqpeIbeD
 +zs391quUnwYsoI0rzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110122
X-Rspamd-Queue-Id: 47CF250C6A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106897-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.29.142.104:email,1ac0000:email];
	RSPAMD_URIBL_FAIL(0.00)[0.29.17.104:query timed out,0.29.142.104:query timed out];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.29.17.104:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable support for download mode to collect RAM dumps in case
of system crash, facilitating post mortem analysis.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3761eb03ab24..cd587eef0018 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -75,6 +75,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -160,6 +161,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5210", "syscon";
+			reg = <0x0 0x01937000 0x0 0x2b000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq5210_dload_support-4336d9627beb
prerequisite-change-id: 20260511-ipq5210_tcsr_binding-5aef0d2eaeca:v1
prerequisite-patch-id: 93b818cd4feadea099a037157877d5a033545b53

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


