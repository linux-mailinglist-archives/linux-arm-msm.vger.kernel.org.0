Return-Path: <linux-arm-msm+bounces-104811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DviOjCr72kCDwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:30:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC67478992
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 655F530628A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21873EB7FA;
	Mon, 27 Apr 2026 18:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHc61Ip3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVJa9ur7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D73EB812
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314382; cv=none; b=AC0cfjQ8ouR0yvpwIAuZEYFnl9Vv4gCX70RPO0C9LN5UpHtlH48BpbyA6K7kSCYkfvy+AmLuq7akltzVahcT67vmk/KlNkagkpbIYly1TY32cEIDcYGg4Qh63Ud6C4S0G5Q3ZjRXyRtmwKdjtUuBoqGLn6N//OVz8ZHVKOuKSRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314382; c=relaxed/simple;
	bh=aCSDQO436HpuxDKMB62Pk7KuQwfxeJrpdLuLYwmKsIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oapmheRb5EASdIfq+6T1A12aEtYvLcLPdZyF6azZf+DeFCQJVLP05sLUKAuF8+Mjf8roWx6bWRBBehhC5pXYcLuxdxIAzerBUxYsDoh6mVVjgDH/PKTtDg1uaRDWQ20L4Hg1qI+bA5+LfrFHJqDomLneVsB5uG85yteqpEOZ0VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHc61Ip3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVJa9ur7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYOoa429010
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g+ARg1hUBWvaOqT/ilKWbT
	PpnZEeo862sArqSvo5Veo=; b=XHc61Ip3mJVqC1ipSG0OwpH32VaKYyfW55Hwf5
	XN5rWRTNTqd6A7PUiNIJVkPwzwyRbcqZM+kFT5KrF7n8eRWJZVuUMC3kSVYGO5aM
	NldH7ynMoFmER1TDsFKmMBvvsrRKfQQRLutYaqfhmTLhDpYXuLQfs0rpaBCWnPFA
	z0/ZNzLceBpKiWaOaEf8rpDcWslUa6KC2noRlSHxX/Q/ALettQwR2ZgAQWz7w3/m
	LfZuwzcDihlvkyio6TP/nDPgreGF7bkFdMZYaJ2aBDeevGt9NbZm2LEyD28LULRp
	OX/pHJL/l/mQvcnOfRt98j18rrXJXMgGaa1237BTGe30d5bA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x31btd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:26:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso7056698b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777314379; x=1777919179; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+ARg1hUBWvaOqT/ilKWbTPpnZEeo862sArqSvo5Veo=;
        b=YVJa9ur7FRCapXeeptnsCC+EZODiXJkau3QtCzqxTJERBDfNLQBzaBf9ynx+YmvjR7
         dvcrwf/ag/q7oQ5Tstn/95FjYYXzeWFntiXmULSNNmbARRGP8OSu73W8buJNSLTt34Kb
         cZjNgLwWqp0Yrc1+Mbsrr9r3ySint1zud1PAEArogbFXPabwHAXzhpVmuorQ02KxUhIk
         DFGdT/mtDIP4ho9myTqzVtwBenEVY9Hu09H7n5jfhoKV8hnAmdMyfci9RUQvjoF0XCtM
         HHZyfk2rjF1qiDiUEJwvZYCvz5RBaIFmOnOCtzkfYElhr5z9+ya33JZjNm/pK5jUA0w4
         HLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314379; x=1777919179;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+ARg1hUBWvaOqT/ilKWbTPpnZEeo862sArqSvo5Veo=;
        b=dVuEKle8DEZclgOEQ83HTt277HtILnPoW4Z8tM1bc9jLVRAVNKVh6NfPu2Zq/Mc2L3
         0NYsxihDzhr+fzqzcO5m6/HFcx4ivUjzFhW/E4nYxx/b8FozGxPVkNpx/dQB60oUMwB3
         uMwCzQjHhjuQ5zak8ga/prbR/+64A1eVOU99Q3JxUcxJ8qhKLpY7k+Adgak3zhuTXZAL
         wwbnoCw1vGn3OmYdgz9cBLfAzmvxnLtzdxKV16PXQfLYTu3ftHZ7p4C/wtz7O8KqG8EV
         LiLJUxNInPmxnoh9mT6R5b2EmO1c/xPgoXNRaVNVAr2eZqfvP/Fohzu2rjODscz9rdGv
         Dxmg==
X-Gm-Message-State: AOJu0YwXcJwpRiwr2vFeCAc7Mgmz0R5frj85CTdAg0VZNeQzWgsN32Fs
	AH3UqGiOAx9U6EbkSRzyVIguq4LnVKm8GJIN+FalhBNWZ8JBS0gB6WcGmdhwkoo3CBkmluKPDS1
	CiqIqVs5EiJksp60kS6cdG2iLGfGfaKtmGSAS12to3TqZEJ10oNZIMc0IKVKozfs+7uE6cPmnkA
	aq
X-Gm-Gg: AeBDievbbWAImdbbSkyCCzI72EanGcY+zbjZ6BKzt4KBHaOUcxbdYeu48U7p2Z8+gN4
	7rkFT5SkPKaEJxEJZUOWZd8GqBoauXKLJx5vEabCCBPXkzdHEDyDYDpaBJRH5ZirdfVWkibDv3X
	yDAh7W7FgU9AAhvLK0XWyL4LUmAYepLtsbU8tpl3hzIVSVXuXbo35ET0sq4OOILa1L80zOxsJOw
	4MGZM1hyttLJ18L/9GWL16lPbZWak0Zk04T5D0Itow+PjulToMk4PXFq/dRAmGNTU6E9EEb36Rk
	dX159Ge9zHC7YrrI1qWPov00oX385TyCoVTwOITxifYEY3Lej+XqxA25pmH/fhSNtEs8opuhUx4
	It+SM53/HPC4HPiuXDDHS/4ZWTzMz4DCPzMBU9AkcTBU/EBusDd9biFNo
X-Received: by 2002:a05:6a00:2d24:b0:82f:6a64:deac with SMTP id d2e1a72fcca58-834dc277788mr109728b3a.28.1777314379031;
        Mon, 27 Apr 2026 11:26:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d24:b0:82f:6a64:deac with SMTP id d2e1a72fcca58-834dc277788mr109687b3a.28.1777314378378;
        Mon, 27 Apr 2026 11:26:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae07945sm179413b3a.9.2026.04.27.11.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:26:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:56:05 +0530
Subject: [PATCH] arm64: dts: qcom: talos-evk-som: Enable Adreno 612 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-talos-evt-gpu-v1-1-d40b6dffa108@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADyq72kC/zXMQQqDMBCF4auEWXdAgzTiVcRFTKZ2QBObiSKId
 2+odPk/eN8JQolJoFMnJNpZOIYS9UOBe9swEbIvDbrSz6rRBrOdoyDtGad1Q++NHk2rXd06KJ8
 10YuPn9cPdyf6bIXN9wijFUIXl4VzpwIdGf80DNf1BbjqLeiQAAAA
X-Change-ID: 20260427-talos-evt-gpu-dd72b782c18c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777314374; l=945;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0V53xvYr7g9kBtmZTUeEPtPlVCLGnJ6Vp4Y20I75eX4=;
 b=N6a7mInwX5bMssY2w3J2quJDF/s3NVDROgDXxFpn6lapx5t93Twz2i2OVlTTgVVFjv2EUQPDJ
 ZjVgPBmayJMBzjpWP9hweDLkGaSCvoHfZdcLEIJA+ZfAJ2lntbY6b/R
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NyBTYWx0ZWRfX/gkGgKLSZLbG
 Qb9q0fosyP7gIZ2l2N0jgQTeNQtF7Q/LZu5Vmuta8+eNpsXhzyNQsEC3aMoq2LXAmHWzl2r8f5l
 cBp6P883PTpy799MRl8/2cRIuLhUHRSXy2+H+Vz959C2S2rlAFkHAxVJKaypDRRkravXkTsNCxf
 F3K0JqitEAPykJ1oalPLaWKF1YFEMF+V8XKd0R3yHrnBrnPUK6eRY7cDk/hUpPMWKS3pddOYUOS
 CW6XkrZKFl+Dl1fs7vvQmKxvA2KuNolRbMOI0aj2cXuHxgjchUs3SEGhpYEhygiZWJRNz22GkKm
 pPiEg4KZVQcngLbXackPgLorKSIBc3tEDItFfFRMNVVBY6IMTCP2YVqW5+O6F3YjhKrz89IccSj
 B8QQcqat+1V1uHPqQ3IpwCaJkJHOlbwta4VgDAGzzJxkm5rXau++118CgJR46orLrW0M1ViRUwQ
 p23qSIC7lR+hscn7OiQ==
X-Proofpoint-ORIG-GUID: mPQ05c0eCp9QRAdpN5MSQ-kb-lfuRsqT
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69efaa4c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: mPQ05c0eCp9QRAdpN5MSQ-kb-lfuRsqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270197
X-Rspamd-Queue-Id: 8EC67478992
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104811-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Enable GPU for talos-evk-som platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..6d2cff3cf23c 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -317,6 +317,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 	status = "okay";

---
base-commit: 6ffbce0fdf09f89d4f970301f6ce6d6d88d9393c
change-id: 20260427-talos-evt-gpu-dd72b782c18c

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


