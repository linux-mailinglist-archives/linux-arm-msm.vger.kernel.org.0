Return-Path: <linux-arm-msm+bounces-109223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ESTMdsoEGpQUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:58:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 345B95B18D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0DAB3049703
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F0D3C8C5D;
	Fri, 22 May 2026 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j6CIlmTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMj7ZJoY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAFA3C9437
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443821; cv=none; b=Akcum0VZofgELMcTPJCrxQDe8udWKFNVESjSzmQs2nQ3Q/teo3ul1q1e1kwXc0GKDr4Wrbpd1FVIBwk5LPeLz5RuEpMzuQ3rtMeckyHDvOsJe7OOmOWCHyRQtG590t7ROE9W4uS30jJMAC9YsX+l7NqR/S8V6csiIx5OHgZ5R2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443821; c=relaxed/simple;
	bh=yIozOWRREihoVjWjcGnl8m47aIKtimgMJwp/8uurLbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gOszB7lrh/+d6QbjmzmU5T+Jzo8QQGMDBK20UX6nQKt+Eyh11Vp4vn1/mtYn0QsHEZ6Y9NOpDULvQ3Y9BnTs4p2cVLwMzV5vRdJKl8Tuq8qtE5TUkBulAT2IkYoMoE4Fi0C/qAmO1z3HYBL9QzyeqnQrUr0P+BLoID2mrYPeFLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6CIlmTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMj7ZJoY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8r4l6399205
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R6Zu26CySy7F8kEACRFLd8
	GHoBOcnqSzJyxtGoTrkMg=; b=j6CIlmTEcZC73rRjWyUgdVGBRtxqC68jFIk/Yc
	7h9fZsRA3a+oLePoMeXW8+ex9NL5o9Vw+LVjTHP//n6vKqCOPUDQpOGzxE5wJz3v
	YoJeN4ISjZvA3tIRpojoSSwwd9ySfUdz3gZETSDLOkTvqjNStwkeuQlXTsFO/Ozg
	TgthCDpvEzhCraix29rtb8zBeMxHkpamAGRO6TuIHZdABHH4y6kj4zW1oLd+SImB
	U9G5MtofSfZogbAeKKDkmgjcvlVscXk5SCXudIHDkv4hKKIzX+mYSxHrvCII13eR
	+0diJvS+r09ZWwQwGYytRzJHvBG314BBps4K9N3bt+U5E5Gw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9urga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:56:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8271fb43d0so4079176a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779443819; x=1780048619; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6Zu26CySy7F8kEACRFLd8GHoBOcnqSzJyxtGoTrkMg=;
        b=KMj7ZJoYosSKIjkI/kXKbYn8vf1I+yGRJ0wMKElK3yeMTPe9VMMUOr38+pHmsJBtkE
         6uf7xsrePZY9PEZDS2QV3inpy5X7O+CloUO1PFGRXIaoSJZlILs/Lx4zP2zn5/prJ6Ui
         jh7nIeZoAgL+JHrAEZcNEcCZP/ZBHfsBecDIAZqmNTKYP/qoYoigsmy8X9aFBFogescV
         OSW61lNIPsgI4HVG8y4Cf2E+dzsJEP2VDGbolw2Kg3xChI9Wzq2xGrqoNwBjHbqrQAxz
         qvy5b0wHvRpTKj/qCZ6j1BEqSntaxjDO0Hh/fcXxdtE0Wn0Y2tkU83h4vQg/KJPlIGM7
         ni6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443819; x=1780048619;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6Zu26CySy7F8kEACRFLd8GHoBOcnqSzJyxtGoTrkMg=;
        b=QvZcZbx7l2cN+oTib+eGXBBWHl6xGdsveEI2s0KUSMz6OWjy9uHQPmfU5WcYW0jxcS
         pjhb4YJPksSbszWrgxz1Va7M08VGgFjpL4AEZu1cLNBUnjq0zXXz3NqCI0ZCmVkm2/07
         T8rZxAirgz0n9hG0niXdA7NOZWbpc7/HSeW96DcRexknCD/cH6klyqISI/etlVe6F7IF
         iIOJvgqw1zJ4AUtnncZtqkGOJn0h3e0sJSTW5prI/ZK6QmwJpJHkAP0LvkRQEcat2GKk
         qPErsR56B470RgL5aD2/Ql32NbkxennredLml5MUtEwSSoi69PzH38QLAgUnRE0IZrCK
         5Bxw==
X-Gm-Message-State: AOJu0YxNMtvgXAe5iq6ui2LpJxo3Fii43d+md/RbJ+pI4asfhVMbZEQP
	V47G0xsvU8JOOT7ESf69QPEetrUxxWS2RYUQPoOQiXcpCiKRPglzZ6S1qeP5001wdyFX1UWWU/C
	Bjkf2VB4OXmcAu96ug5VOt/5py6jD9HbZY5fDos4eFS6r05f5U2jEJ57YiBYUeRY5xQLj
X-Gm-Gg: Acq92OHHmkDLriu81oSG3PCIRrljPdU1xbsEhW0PGV5mnkYDYjQjyKt7xQn7Etk9NfW
	RI8ODK0bKGvOMPHOHz8rfKM8bwl2v4Ai1kNI3ZyFwcxs8XEHhZgdpJ56h4bsto97X+7PPzy4caH
	C4UKSBPYHkoPAPpQl9jLht9iZ05LLcBgJQBHyATxhA/3TF/VWaIxpL2tnbVcETXFUifArM5MT/V
	UnZH4lbWZaipjCLdDaG6UegmkE+fquahcOlWBEYsyGzBvIQyc0B+tUUgAnF+DL9EFlRrpuR9aiA
	e038aVurVhldMPG0cFkKFK6WFAqalw2wIPxeIWVgb+RHgBCXsSrQ9QvRWF35CQq0V0pZL2zX0a8
	Y4dHEjNzQMa1TOEi2w22qm/DYHaeyGKjeUlPV/g==
X-Received: by 2002:a17:903:41c2:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2beb064837dmr31696585ad.37.1779443818839;
        Fri, 22 May 2026 02:56:58 -0700 (PDT)
X-Received: by 2002:a17:903:41c2:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2beb064837dmr31696285ad.37.1779443818377;
        Fri, 22 May 2026 02:56:58 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58dde4fsm12801145ad.67.2026.05.22.02.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:56:58 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:26:39 +0530
Subject: [PATCH] arm64: dts: glymur-crd: Add reset GPIO to touchscreen node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFYoEGoC/x2NQQqDQAwAvyI5N2BDldqvlB7WTboG6irJKi3i3
 2sLc5nLzAYupuJwqzYwWdV1yoecTxXEIeQkqHw4UE1t3RBhsLG9IBfH9PqMi2E0xsCMJi4F06w
 Tlh9LHDyaSMbm2lEvLExdD0d4Nnnq+z+9P/b9C64KDhmEAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779443814; l=1748;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=yIozOWRREihoVjWjcGnl8m47aIKtimgMJwp/8uurLbE=;
 b=qwLxBcJHGJ7fhuZZqgy0PX+yLXmUjtuzbnSiJtL5AwJa8v/VT0lurpkpoLqTufbDEdtYKK3wF
 LX/9L4cPC6SAEuRR8X+0TyESS3E5IJK58zgNEtDNQ99L7tlagj5NNdP
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a10286b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lbRSShi60cGz1d_720QA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: BZI23bTbb0fk48JLOQYCXttBbUAwwbak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfXyJNezKYUBC6E
 s+AEmVviEp0LkzeKRmNtFAE/cD0yLel63tjy1DBZAV+tVVUmmdkRFtCwzyIXRrP31j5eTbHGIad
 d2Alx+UXRbpoiUOl3Q4MXxIsnTNl0Fc5TU/ps9aAhaK4H1lMg+hrnxd2iTqsQDWgFykUNWgLbuX
 DkXYQ3+bj2JsGdyOStqANJv7i1mKdN5+SkUWkXHhiKVgp9XlSLiqL/lxnhJHSuYfVyFs40dHV1I
 hqldKhICyCdibOQWSBxhhN2KLPlljcEgGYtg19qXC2eFJOrMpHu7DuBgTyKSC92tmutuzBTQBRj
 eTQ1mB6/BhZua+EBWVlrTEs+k5eEZBS9T/6FmLupmvcUFdwCvJuhTglwAnI9LHCqBbnJV1nwkHR
 8X+X65Wv4aLyyRnh9/nG4Ldmy0hT5Y8v5VF6Yu3omC7imys9hjEhu/9hBNQCstf0R7sOv7EJzX4
 UEd1d8ysM2wXWn8/E8w==
X-Proofpoint-ORIG-GUID: BZI23bTbb0fk48JLOQYCXttBbUAwwbak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109223-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,0.0.0.38:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradyot.nayak@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 345B95B18D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The touchscreen module on Glymur/Mahua CRDs is different from the one
used on Hamoa CRDs and requires the reset-gpios to be wired to the device.
Without this in place the reset line will remain permanently asserted
during resume leaving the device offline and causing all I2C transactions
to fail with -ENXIO.

Error Logs:
i2c_hid_of 3-0038: failed to change power setting.
i2c_hid_of 3-0038: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6
i2c_hid_of 3-0038: PM: failed to resume async: error -6

Add the reset GPIO so the driver can deassert the line on resume,
restoring I2C communication with the device.

Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
arm64: dts: glymur-crd: Add reset GPIO to touchscreen
prerequisite-message-id: 20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 1de3a49f49e4..2259577b9ae1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -623,6 +623,8 @@ touchscreen@38 {
 		vdd-supply = <&vreg_misc_3p3>;
 		vddl-supply = <&vreg_l15b_e0_1p8>;
 
+		reset-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
+
 		pinctrl-0 = <&ts0_default>;
 		pinctrl-names = "default";
 	};

---
base-commit: 1d376e58cb4a94f89de0fa9195d583ad6b86eb89
change-id: 20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-5892beded29b

Best regards,
-- 
Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>


