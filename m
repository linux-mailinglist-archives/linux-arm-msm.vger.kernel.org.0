Return-Path: <linux-arm-msm+bounces-109405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BkMLqK0EGoUcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:55:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD85B9B79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2926F30166A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AB737DAA3;
	Fri, 22 May 2026 19:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmkKYak1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxxxQWNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A944B37EFE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479666; cv=none; b=lee0QusWZqiqg24KIOVCHA90HeWuNL7OyCnX8Z9Sp/Jwum5g+FFZJuIsiqqQzyMK/fCaUvnI4+BDeRYQjIo2z3mDsRklA/Dqfo/yRAtSlzK/p68zLhCEPvhHDo3GOuhPMIWkFTf8KA3bty1popvz9wkbBFwiCKa8VRYAThoWIH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479666; c=relaxed/simple;
	bh=vNpt8PKOg0KHWmF7TqTJnZtxLjMjP4Cx57/2xk/8tE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cn59rEsVu7n6BS98l0O+pYb0s7Pw9LjwqzpYkSJYVJwbDerACyvM+22Y5C8PPnt6gNHjf6r5afexRflc5J1+oFQizAuH7Z3YXkIuMHw30LsuHVzLuwNHgg/0ZWOygFSmP9GvZVjOz7/QisT3eCJBnwyiOyfhfTSF/LVl49GlpGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmkKYak1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxxxQWNn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0fvQ3477008
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uPBy9RLhDQt
	Tb65TZq9MAQCWN1WX4EkHGyq037DA01Q=; b=cmkKYak17MhH4RsbIPKxYqqBZOl
	FA1LnIBUwx/USd4u0AC/x8X6BOC6GR167HHmWe99/EosMszQe2xayblIheZfEkvd
	pG09FdFkcW6Lpr7Y6JMGzAGqjRoIFKUHE+uJ7cwHjGDqb169oF5xTXm+JC4n28uz
	q4FhUqM3iuEfgs3MIrpaKnHbvG7q8PqcVgPwi/GyDTpE3Mw5DXfyN/Q6Ab2OkKH1
	Z7sT9lUxLzJ2Nwwzbgqh4ljhmZunM0e4mCYVspkWv9yUcGe3pr2ovtsECdiLxNfn
	Chy8h2CfT8UK4B+3U9tKqY6dWyJdPjwy5xWGVf3vaZcyUbCnprWnh4DTNUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8t29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba054e0304so69205715ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479663; x=1780084463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPBy9RLhDQtTb65TZq9MAQCWN1WX4EkHGyq037DA01Q=;
        b=GxxxQWNnsQ3r6/4TQnkNGVs+2By/YC2H423BXZET5/dklGa8gl4F/RBN4yopqMqP9x
         K1SbR2+rw7gHaZav3fxcjQHSk3wRxEeyIcPIKPtlrP+yWyqKGvOLv78sH1oOd2mNVsHC
         xzakyMDkdgla7WlX5tlZtZbAxtoG40e17oW06SEnsMOmrYkySteBhzlx2oR/G9bqMHqi
         O/gPODjvzO3uFU3MUjxAnO9BPm9t+ntOdQU0w8O8eAz4PJDbCQMnY2dUjmx8rK7hD/y+
         ldIG1Na6SFjzum6X+cbZY7TiL72/TTHIVNg/r27O/gJj9HANORwjv+hZbvqDbcybzs3g
         etJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479663; x=1780084463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uPBy9RLhDQtTb65TZq9MAQCWN1WX4EkHGyq037DA01Q=;
        b=MuAqlyyW7U0WpWIwCKQcXyVjzs7WiowEgh8gDVpIWW0zWM9onYqbyqQrz98IsqIgJS
         2w7E93B7maP93oEW3LG2fN1jOqm6Ri1OohbihuKIDiydf66uGyoe25pzZY1g5v1hrPnM
         RnUmxnU2LK8f1JgaQJWk10OBVMVOa6rEJJCYtb95jrwNbUSnGJs4cHDUxNLsEabrZBf7
         XR/WoVdyBQa/xSJU7IaFgg673ztKckol6IzrXZxTY9eGPBE9P08JbAhpeTvRIHB5VfDI
         zQdFHxeFvBFo990qDH4QFu1WwtkTxL242ck2tZgxAgg4oH2NBHMt7r9AmBUVae8qb+X4
         D2EQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ylghCCX/9bIzJi0nizt8wgaJXpbv8QQED0Ez60T35fVA29nX3yLVY0ZYfZI+skPb6lHqjcO+6fWDyO+X+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr1cOtq9VOkQqrQfGLnCb0OHv1+G9HpqISYgeFMfqFnN4+a49L
	pM3IruHc+CA/Ls1Qr7ZSpgRAaljG/xqqYEI6/eSowwhmvwEvBJ5hTdgcKbS/gxZ8G0cQaau+9G0
	OF2Cf6gkn5UjTPISbPEAb+3ERn6q6HXc1czBsBvSPrCqe5X7Fcps5b/awznnHHByYxarK
X-Gm-Gg: Acq92OHCfXjv9QdBoPBrv0ROzWkjZfUBza1pYK7Tlk8YnVsMQLIDw4NzTGxp8LOPPog
	sn76u2SQUrby+4QM8Rje2XXgsd8nWGW/oXz3/8v7Ry1kBtUfSs0E+hiC1KCDdGnUNG7wtdjPsNK
	MsymbRWeBiNpbixHVF0VYOrxrwf2k3yD1PEWbT4udR0U7PJ5J4tt5rqtSleKRzODzq6njWhius9
	RgoOqoqUBQJdPCHmHdeUuOKAi14XiwOtA3y+HQfckX3RlYkxaUV+PoWrgMDNS1WMI1asw/YmZq2
	36Pb3BQ5y9CCckp8dzOJmJ9CAlS9abVpV7908jTCITO7xywlbn17IDX2ZkPWOB7o0OEBQe2XPN3
	9EJwxqNFpcBassTjk2eGcM7Y7bGflHBpD/ya8iwhKz2ExDAYG
X-Received: by 2002:a17:902:ea09:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2bea240dd66mr82458365ad.28.1779479662782;
        Fri, 22 May 2026 12:54:22 -0700 (PDT)
X-Received: by 2002:a17:902:ea09:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2bea240dd66mr82458155ad.28.1779479662199;
        Fri, 22 May 2026 12:54:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 05/18] arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:19:56 +0530
Message-ID: <20260522195009.2961022-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a10b46f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: jrANK_LORogESoCMC1rVka914dCDqUDE
X-Proofpoint-GUID: jrANK_LORogESoCMC1rVka914dCDqUDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX2jJiRkSsu6+W
 a0TyDI1R7YXjE7n3E2ibFY+8giWr2hNOXxF8adWBfsVZleCgoFJ6q5SOVCq9TTKcQ+rfjlh0X9Q
 ChUZgW4TKwq8gBfrmnzP4LUzwXfPiuU63vpE6o6tED27UZXxF1r2p/a9l5AnSdxRE0eP4UP01F/
 kAL33nbgcfucpwWo0H+TJPRRIe/HKnsAP8uyL/Z9u4EockOmA48BxVdWTnxA/7STwVCzDpAnKIX
 +1YOQ8og16JlcQrjVnpqtk/jTD8blf+xkdEF5Y3VwmdgjEZnYLr1dBIaIOsqV7JmM8rf8CQBZOz
 xi3PVxcd2ymoVBmnogAt5bq4ZiqQ1q5mNZoT9IWt0fTqVVDosnD+wmqDaFQ+TJ2NBOrFe5BWRut
 sYVLqLdRG2Mw/KepS9ER/JGFMDniGu2kiAAbrSINg8o7DlCBjKuGDp0j0TRgMS4DvG3Hntdsf1y
 cGgbe4h2KBQU9N5tHcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109405-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,94c:email];
	NEURAL_HAM(-0.00)[-0.986];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7DD85B9B79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bcd1cee31356..425b532c53be 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -224,6 +224,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 
 		scmi: scmi {
@@ -5448,6 +5449,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-sram@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


