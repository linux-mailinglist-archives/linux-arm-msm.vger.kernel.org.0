Return-Path: <linux-arm-msm+bounces-117574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V8wlLIAgTmrtDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:03:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDAB72400D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:03:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RXrhovZP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Tkc94jnk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117574-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117574-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 705233021C90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB1239B484;
	Wed,  8 Jul 2026 10:02:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321FC391846
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 10:02:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504976; cv=none; b=u0MvrGzXArTEbBAZFzCWrgoxFq5m4SewUwTJCMBDgNBiNxGy5nwfY4mQgynB2869VMO1LKqNAsAgCokdlxTy0/s02/yhx7LunxubPO4NS3pBK8i8VAcj0y7nS60k8LcDQvu0Hp1LZafKgvT9AkI9QhUucufGzIpnTq3UPCD1SOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504976; c=relaxed/simple;
	bh=mWA8/QzJVw/Z7Z45NGEAV1BRxr53CZ6L3rVVpjHn2gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4hJL9wKw4oBlIt16jk/R2f+N17Dox2YDfCK1SvA/f6lGbgztRBrLE90YtM5H6bgpIIOtezq/vO6SQznPUmzbyZg7OxovIM4QwdLgQECGaa7m4MG31yTFz413SQeE/NsrpVvNzQ0JZ5JwdVv+lV1UGkzzgQWufFTfejAbDLmclA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXrhovZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tkc94jnk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668890Hg2083263
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 10:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=; b=RXrhovZP3PvSWbzR
	ksFZ9RNOYGYrCVPD/zXM1f9PST8UMaxfw+CT1sEsctUVC197z6nUPtfdOTnSvPwt
	9EvnL2H+4IEQrtL1oJiJD3wPMIz2ZAq3KQJFeRlD3l3g4DoI0mek3HgzUrQ6GjF1
	ZHOw6hAwF1LqJ2ZVSXRV0e3+f4JU9NXmWqpFGLoKnM4oICgXIqBfjrQZhbZxOY2K
	ey+w+6CCcPpPqgt27UCYc+z/oe2oAe4RXmfz+NGGaAu948Zq31JEqkv97y7APorO
	JmWbIhWyMD0kbc2KZrDJTxnizeaV6jJG5+fM2eO+1yAr3gLxnM58Vc96HmBV9Wqo
	xkG8mw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw90d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:02:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so846674a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504972; x=1784109772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=;
        b=Tkc94jnkyece6fFyWKAIBss867zuGuhkGRCDBpuZ8CuXEto3L7lfHqnCmUAcO7dfWT
         gZlrZvD4sTVzxeHa4bWhteqnkdTwb5AIC1TUka5TYXmY870T8ZtyYM+cpvZZPfM27rqu
         1tOwHs027Tu/1A3fu7b7n38klKnYabkBuwxqTPCL3b21+BjPez5TlJ3gJXvWgnkDQoee
         ORw4/TeuLHcJ+v/bDXLQQSyUDWvpuV4M2Qm8JgXiTiFqW8gnbF+sZ3PjIlGzHOz21G6L
         0fOGPFPiy5z8DBabUcy53JOFtSlS2mFZAtvcjQVvfhUxcTtMLnQG+XwcajAtgdvOp1UO
         kddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504972; x=1784109772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=;
        b=H43YG0PjEk5rSeAuDaiaXPp+YX2CQa3deba89KeALk3yMLu5PYL4kIYm1fUnfHfLfG
         /w3cUu/iKrz6lzH53Ns3mgekSWPh/p3HF4U1WKs0Ed+pucsHvei3mZTem34khg4m0WOd
         9qTVUqbswSPSlXHWdFoe7vdT2+DMWssvzQm5lIF7sYF9c1vUjXC2tuQVdwXpiLjFENhH
         oikDEscw/SHPAwdRWsf9KbH7ST/uV2Y3K7pQ8fnLch4M1RS8sOiI0ZSiwz84U+DjSNUb
         CvxWfhzzNAdDfCifuHGdABxKehlsMvYeoWRlMraPmkY3HhqLRt9AfHZ1vcT07zeE1/qq
         wnFA==
X-Gm-Message-State: AOJu0YyT+HUj/5Xv3Tbrq0wFywg0pbf8w4pQ/m6e0wQyNcOnPXbNZBO3
	Geb0V9HgeIEQ5Be2yUAfUZ/phqIsmc3bUrZvkHPYi9bTYrTHcJRaH4z/CxHloTVpbRZC3FRtg+X
	zCWJ5xG8QPaXaSuPuJnBsRVMY3Ts2Zr+LLr/7f1iIPQZppF/aofVl6U178DTYkC3g/lTN
X-Gm-Gg: AfdE7ck9PbWKHGVq1kZv1lMnfcqw2wXu5KPTbcpH6OPr8DGtkmNxzO92ZJyqCupLYXp
	2mXzYhEWwWBAMo8E+xWNhs3j+QROu9clDNKh75v6O0NCjMy05zxymmsJ9+Vp0qZclWFNtrDvZ+5
	IYjoIpyctCZCKIaJE+UTjv+g1aJtT393aKIvD1PgVO+ybpkAc1mbV9/zFH3mWjFT4mhdGcB5ZMa
	gbY4QAUmkLiLdtaMmRrs3Z9fd8IFXlD/HGURuXUeaQ1eTtX1irS8lEYiwA5i5poKUXWVrrlCDPJ
	kTHFGUkGKl2HBA6koxGHkkyvDmmVPKaMd/HRU5fqaovuvpUPF3rOs0vcyWPKq8cTs8on0Kwvtln
	wYeMDTCD34emv+OyNxES5+G3mzeaC5M/knUWxHepTB4+JxHFS0FSJ02xz8g==
X-Received: by 2002:a17:90b:5845:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-3892f2f957dmr1733298a91.15.1783504971696;
        Wed, 08 Jul 2026 03:02:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-3892f2f957dmr1733235a91.15.1783504971237;
        Wed, 08 Jul 2026 03:02:51 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:50 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 03:02:43 -0700
Subject: [PATCH v8 6/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcsr_qref_0708-v8-6-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=1658;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=mWA8/QzJVw/Z7Z45NGEAV1BRxr53CZ6L3rVVpjHn2gw=;
 b=njv5GvrR6CxqyO/rfBEWhYrj79LNrA0OeHsYJ1b1kW23+8ptLZ407Ks/0tAsTLUuo/SZVR5X4
 Jgl+LL7XH5pBtqXE7TtSSPHdAokDQ4Qi6/eRKnVLnMWC9KkVeXWYXh9
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NyBTYWx0ZWRfXwu+sSuYSRD7Y
 6zKB40tcIyBL7PL2EYCkk/1oFwL/Mka6Z6+WTTj0yGxQEzsY4FUPPA5yxoHh3+jwtVFE6InxYYg
 E8MdHHvguzuwMMcheuYqHABS9g85nreYskHEZ/rfnO28N85RPkHU+WDHEzLTMg4B6yvjYvYk9pV
 12WCPgp5e6ffNkV72pkvGnGA6WTebKCFZjaLLeyc0x7Bd3bSEEYW600nOMe/YY7QkSKwzWvLQaw
 IznrzYM5BPc9iONfOvDh3Y2LTeL+kwlxlzY07DxWzrUdUP9C9Jbeb9zUUqG4i6rl95zfcAi7Udt
 cXRX6bJEzo9cBgnDjccB2T0ZxpCqekIr2goDxPeDsCtYOJmLgvd/owYGtmMzRHb+ByzUKhDpOTt
 51SbpZSTa3eqFW8saCJLwtXFHPj2lcoEY0/dhUBLnOYaic8yINoBJ8U7/TdNcGYFgtHk7HCaO7h
 4CRF6ZL/uXKDQ+YZfDg==
X-Proofpoint-GUID: 1csInHgAtmar_UwS75j5aMN8w69PtDt_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NyBTYWx0ZWRfX8p5w3hzG7lnk
 cWXTAy+sPca/5Hkho2qG2GLKF1q4n9oF7Wwo2Yi1KxE+VjcpJI9oB/YcztwMBFK6PLIuqsLSYJU
 8HKEk+4s8MV+xGqZBeX4yyx7fXJVIKc=
X-Proofpoint-ORIG-GUID: 1csInHgAtmar_UwS75j5aMN8w69PtDt_
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e204c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=n5gI8yOKKvUJs91qd4MA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117574-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DDAB72400D

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 6125617de82a..44766a73b0d1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -28,3 +28,23 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1


