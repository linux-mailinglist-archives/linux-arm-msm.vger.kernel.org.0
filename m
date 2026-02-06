Return-Path: <linux-arm-msm+bounces-92014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKJNE9LGhWmGGQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:47:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA2FCC97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA96C3047E6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 10:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4FF366075;
	Fri,  6 Feb 2026 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P91AGC7q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNe67oLQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22563064BA
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770374818; cv=none; b=niYkwNoJVJk0Re9EKwbFRaajeIjLWrce40GkbkCXGLOfeKQCSP62cwQAf9R9qDLmXcwDcAtzhxDjnj8BqDaUGkurhJdqEQJWZp+ZNCdIecGNLTGAuxhWMD5ESG8iwsjQi8i7YgztX+kEfoSuR/iD4vhOKEvDgSFFYmdL1jBzFN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770374818; c=relaxed/simple;
	bh=/GoALsNEBWV+r/IeYLl6dkLP3akRkqrGtuRWoj72boA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ksvzs+iKS/dUfoFYVIneya8eOLdH6gm317ntrc69iHEzWHyvVo76DAqU+x4QeCk8uGf8I8Ym1Es2WA1NNJ+njjiL78GuSFcNBB2BOipoTjawu9otMKlewP80mfAPtDuTYVCsV/GqRJZsAQCPsUimSwM40TgsI6to/H1PddJf7P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P91AGC7q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNe67oLQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168IqoZ1419630
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 10:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tkLNbvBisK6
	a//gVRUApDWe5C5O7SP/FYdZn/r94fTs=; b=P91AGC7qQq70H726l63gOHEkiVW
	RqZSxVIYkuMNSeFRW1GK3PTRJxxVfXH9aVix0KHwU7u1fl4P2PbC+ll5Ic1fKpth
	2oUt3/4sdEFgx8LSdSgjDrjJnLpgj9XefYVg9PzvCDEIKCPlZFjCeSY1tQ6FDdO2
	I24bzbOrbLLO8UrbQsYHogWp86dvtRZIQD7phk2sAZ39MSvwmNr8ropoOB3xvIO2
	zIfFry8oU4CmQPCfNMDUinlc+Xr5XhnNGA8Q4IgEzWeI3LlbkYl9g0LLwUfNeDd6
	pSx3n8e0lAvq7XRdSFRL9n/N/kVNOBXlJOKFWa2No47vXDAP5gYYiIR8jRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c50a9aym4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 10:46:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c6e05af6fso578393a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 02:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770374816; x=1770979616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkLNbvBisK6a//gVRUApDWe5C5O7SP/FYdZn/r94fTs=;
        b=BNe67oLQFm3fLvV/1DUVf+DdTzBEiYBZ1MlzGVk8gZJ4mz/lNtjp2n1S/B6hyx7AuY
         PFV/MwWnsLi/ZwQbZvPcU2F50v8H6SIzjFFogRmd/QosBCkEFM4mHjV0DHoVNq1vii9y
         pyJ8aKY8wmTBjQ9LtC4CVPpBdGq2QevCbHzw6WTp1PKl0JlFbUSQRD2gnX4ljGjXy4gd
         AKsc39MLv6KFcwHmVNIofbJANxSiP2syz1hyM2qzUmWKmEfVeNdRqTT2ygjTUWXRlUir
         IEtPUZaBfz4N58p+Goo5m/5Q7LsYSroW/kj0v13DHSjlR24U/D3EiQtDro/4LO/fW3OD
         IVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374816; x=1770979616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkLNbvBisK6a//gVRUApDWe5C5O7SP/FYdZn/r94fTs=;
        b=I3uCIgRdoE54fcJilXAoK9dN6unwbn5wW+CNFQADBwCwwb1F8fimrFriFebCPPxuNW
         kXjLgd2nW6VadPQeaDd+HMJj1M+z5jHAsXO3mALDe0ByYsLmpxaOwNIULPdWiGacCXpH
         CaVOy5AkOQlhLaWolAbPolcpmmDP/55MUcxCNcAcc77miAXas6ykIgkMM3MTLfthyi4s
         pFQrMzEJyQssrr1gXS7ptgrXbXidfX5c7F6AUMjLAQFQk741kvR/11IT6BBZ+jYxGI0e
         QR+97E9i3v0UNXopJ+isuUPPTR5lWNy3EI4jnf2NbJWwqvPTOSNpyEzuGyvuj1Uns65N
         g7Iw==
X-Gm-Message-State: AOJu0YzMdwii1Nfhdllz0LZDF+oMlXJNX2lyWmLaLIN7tnPoM+woZSMR
	XyIxxQ2G9W+qbn4VOstaGF+FN24kztzSO4RD6zVF2LbbTMubzmWzU/JUJdc6Lm7lXuJ7txW9PN/
	EwLTIEweLbIRTbZf4jBmekaHc0d7d3JKqkw9aJrbbdxtRgmh6+vo2zk1fG1zMGFyPzb9Y
X-Gm-Gg: AZuq6aKM4bx4oaw2Oe8mNNLHWUH3Tn9HSSpodt6w+IPKvmYAEGIW0QRPKrs+oOIV87T
	PKLQX5SlwwTxqPXKIVPYkHlABPfPjhgLHhKN1+2yFPlti0+sFk+k6E8XACK9ZqzK2YQERc7EUX8
	YR62IXNiu6DdhiOHvhfLXiZmyzPwbzvqAMdvAsJZYUvqJDVpeBZzHhsXpVo2Boz6/aMqNGe5tH7
	mA7Ek0V8W4AKE0wo01obkfk5NPSjCsYv7wSlcs3NKbrhbkcd+Tn3aYAT5uvALgN5od5DaONl5rP
	pZabJmHHHeSEMmthCZZ8CMzScsaNR0B1FVwYpXkxT0VgHKE5vJTtJzgTv7+3VD/8Xq/pUpiJgOM
	8lZvhzz0zie0JewNtjeZEN8fcp0PtFFTofxa0O7gDzcs=
X-Received: by 2002:a17:90b:1b51:b0:341:2141:df76 with SMTP id 98e67ed59e1d1-354b3c81322mr1925720a91.13.1770374815642;
        Fri, 06 Feb 2026 02:46:55 -0800 (PST)
X-Received: by 2002:a17:90b:1b51:b0:341:2141:df76 with SMTP id 98e67ed59e1d1-354b3c81322mr1925701a91.13.1770374815200;
        Fri, 06 Feb 2026 02:46:55 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b21fb723sm2081136a91.10.2026.02.06.02.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:46:54 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: lemans-evk: Enable GPIO expander3 interrupt for Lemans EVK
Date: Fri,  6 Feb 2026 16:16:41 +0530
Message-Id: <20260206104642.1038381-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
References: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PW2fAsQOQl8SojEjhODqhluoVoi7byLD
X-Proofpoint-ORIG-GUID: PW2fAsQOQl8SojEjhODqhluoVoi7byLD
X-Authority-Analysis: v=2.4 cv=e6ALiKp/ c=1 sm=1 tr=0 ts=6985c6a0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=RPQiPM-rC1IremnUZN0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA3NCBTYWx0ZWRfXx3Oybovy+IFL
 6njb4KD6iwNIOIz+3Hs7GdcHbwVJbKabI9vtM0ANxa2/iPepvOqrsy6668mIUI1OJoz9onQCmAT
 tBCTKnhL7iSHzqa8Cod9zSDzHLJIrdN0cNY4HbaieZIimyKLV+7AUS2wq08nRBm8+PEYWe6IodP
 nTiAfnPPH9Hv7bgLD7UOqRBNndMasIsIqiswnaU0LgGzXXIemMUCJ2GtvsQ12pwSqkpes0ye0hf
 mKMXcqywgOWBookMCZDu52SCg9fXvn8KTJgEUv2HCAhKl4VTqHadFynbWF6LSa5x59880XXVWum
 sXIpxLcKLKuHLFbf22vdH56ARSAJ6yB4FOfwK4xJ3hi3yNZneSiZqzlVvFQJdT3wUaVupB1xkVP
 m8itbj4X/+3OhXfgpH1h6RHrZsz66xXl71hwaG0hZrRDYnkK05DdMQ95KpwquEc59iWHC0I7+tw
 Kdjknh5RBeeYHEh4TzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92014-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.50:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3DA2FCC97
X-Rspamd-Action: no action

Enable PCA9538 expander3 as interrupt controller on Lemans EVK and
configures the corresponding TLMM pins via pinctrl to operate as GPIO
inputs with internal pull-ups.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a549f7fe53a1..473cc2a81670 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -649,6 +649,12 @@ expander3: gpio@3b {
 		reg = <0x3b>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&expander3_int>;
 	};
 
 	eeprom@50 {
@@ -894,6 +900,13 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	expander3_int: expander3-int-state {
+		pins = "gpio39";
+		function = "gpio";
+		input-enable;
+		bias-pull-up;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		clkreq-pins {
 			pins = "gpio1";
-- 
2.34.1


