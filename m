Return-Path: <linux-arm-msm+bounces-112599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vW3eBRNDKmp8lQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:09:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A014666E67A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:09:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LAtLN1tM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=brdNJZDY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112599-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112599-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B92AD30515AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E201A389108;
	Thu, 11 Jun 2026 05:00:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACD33859F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154036; cv=none; b=CFtjNN+BXSCHtibs4JGerGJWRpjIafqiEA4234p1os+JR8AhLeGB+/SVdba6a0KjmX+1/TnOY4noxVYMvutSoH7V8VxLkcRSPSPkDcNicsbWy/690NUU4wBrYTY7w7bKJ35u4V7IW7IjoDqZV8afxYKvV6TS9VYn82Ek/ucErfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154036; c=relaxed/simple;
	bh=OmfcXNKFfylOhIIh2tgI6MJiW5jAXnRxQ+FG6JCKRE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Li5t/nu4LvcwiSh4BxhnNGvIT11skg+Ka4BrIaQ5pi5dULKFCeLFN+yQz117/hm/+JQO9wWNGHJpNDtTufebnxhUeFVP040O3Mr+1noAjMj0ZQwJ+LyuZYYJXldIbwR5kEKX/3mgRHUdnY6PMkSPDT8Yn0201kW+8Iw4QMfltxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LAtLN1tM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brdNJZDY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nc1j3091921
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stmgkq1tIs0dKRyAaXldgGB8+OEjqF9BkHAkufapAc4=; b=LAtLN1tMJ/hRGRl6
	yxBp3OaONRLCavGWrA8sTCL/hvzAU3jfWwEHRWxMo3YaVV63aWXKp0cbenXf8QZd
	czbE1M7ckeqZRA3lUU6quqTwHjV5GhiT2j09U8v7V/h10q1dpYHGgb/7+S+zxI89
	PtL5oayM+uXOVkt2I45Lq8sYNeWwP0S4ODlG65JdB+PNgpKhVk2lz7btbCDuneYp
	q9zGvzCwrqE2LDQLPuDYGlo6hCfTi6DKXziksR1jp0LCecOUBrwFjIafk7j7dDuR
	YFV4eL+qnVVxF2RE1aPFOhWzhIE93c63335Z78kw7PUygAU6KouShTaKUDOCthOH
	hvZxMw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6v9mm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c10cd7df22so103467235ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154023; x=1781758823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stmgkq1tIs0dKRyAaXldgGB8+OEjqF9BkHAkufapAc4=;
        b=brdNJZDYgWWptIx+3485joZXo0ve8G5cgd6RppVswhUbOJFJPm7GbLaDsOje+ESsP0
         8S9QKaP87bpirnB3TbMvFybDW7LfRw3LO+MuEkFADA9P/WIrWRhS5ykiGeB7luBkWsih
         Ylu2FKKpS6syFQiw1KMxaG57197cCFp+E7mde1LtOLgy2w7e9qEwOZljQWv7Wkv4+/Og
         CZEOgtormNmdFwHnO0ppLD2c0ZNlOSrUVvjQPZMqggPJmnMGNZYq9sEJ9G3S5D6TweQi
         JYIIQC8wIe79AIJiZfUGvTFDn8yt6Pd+q0+U5j18TNlAdbO1xgc8ct1MVBzuv1Q23n8x
         XRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154023; x=1781758823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=stmgkq1tIs0dKRyAaXldgGB8+OEjqF9BkHAkufapAc4=;
        b=PHZUfmdbVR0eKgot/fdHAY7RUWo8jSn3Mq4n2/lRfCFfJzlQZ4XUnalgDQa1xPgOtJ
         GEspDPVdtLeSlDxl6JIkiuwk/YDQTT6/qL1mZ8CmaoJoQbuZligXpj6yLlwPWakz1Fp5
         UwZLNbujJbesym0pM4D9ek7G7a8oVk3OMUjhKK6aKncWbFEoD0DrEWuvXQvzpwOhHuY8
         62jw2t9Ma+G1fsWTCuwdgdaeTeonmO9+VEjHVKJWhuDKWSw1FdYW2OeYZYxLsEnWcaLl
         IN7AJbksKf+rSxcaeIWMHm8DruyOXTXiIwOZf4Rrf1cyifyGXTYIlAcqCwCdK8+Wx3sD
         NLUg==
X-Gm-Message-State: AOJu0YzOZDlQ1lJHnMy8Y48zU7qllaeiuOH4CPitPQqbnKiTJjD3Zlf1
	RLD/X8R3Qs+QdajlloBWL9CfjJk3CvfnBOZsfG6jNcYgsb3aONknJm7OXkH/N+ISFP+ODaTNilI
	89eoeLSi9tNYKSOrRTKCO/TnhRqelAcbFBoQdtMjMZ/GMF21t+zmpvLBd+nRcHb3LOpNTfZy6TS
	kb
X-Gm-Gg: Acq92OGvOQQHr9cYg1+p2nAmYnVcfe1GBisMhsWTzt7vVSyuRCJQpzumCxvbJ6YwJgW
	SUBrLNKuuNI6mbMfg0tae4I/X/fHLCU73FQyrD2icj/TC8muqr4YCWb3l2nNfuWNZeHSA3Cphet
	QsP7FB0aemGxaZkvKqbWV7hLVKoT/tKrH87iKSnKoU207ftz0Hqq0kwkSgUPbRPE9liI2GYTNty
	giEcSfe1qaBJ1weHGSIbbhH6jn/pmK3i42UxQOv89JB4nkiLx8d39UHtGZFtKS3amC4S5ZrCbb9
	AdnBFHdvLoh2yafIeIqbT9ndavzmAu6gpwnFW8RwtxtLXfFM6HFHp7kgagmhvyDCyvDoK9xWVcu
	OjyoG50QR0Op9S+oYSG80IUS23bdN9uAIkYz2R5qsuKbNIvN9g8SLafeyPWxGh5+n0TU=
X-Received: by 2002:a17:903:189:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c2f005b33amr12948585ad.1.1781154022945;
        Wed, 10 Jun 2026 22:00:22 -0700 (PDT)
X-Received: by 2002:a17:903:189:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c2f005b33amr12947905ad.1.1781154022333;
        Wed, 10 Jun 2026 22:00:22 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:22 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:58 +0530
Subject: [PATCH v2 22/37] arm64: dts: qcom: qcs8550: Move PCIe GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-22-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1636;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=OmfcXNKFfylOhIIh2tgI6MJiW5jAXnRxQ+FG6JCKRE8=;
 b=acoLxsuOq+BI4mvuy0V8edmZzr9nHlzA5V1bBgN3V8cXAcN4X8smyNBLcEQ7ed6IaQ46/IlIm
 5OCnRblQbnYDEKX4Dz+67CPntCKQ3oiZU8kjNoE6SnMirnQTDAeGsOF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: BfNLhMdBFUTEu6ACkn0mq4BTNLQTp_Fx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX4hpIDys3RJhh
 airdv+J5h4hVYLGT1zDdt2U7NIfhK3JYMZFOxTLm1J15t1aEdmn3p7v1f5zzPN5kONrGE8MyyjP
 Tboc/2Kn8rEk/7DeSFm63s3GB77Cc3E=
X-Proofpoint-GUID: BfNLhMdBFUTEu6ACkn0mq4BTNLQTp_Fx
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a40e7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=w5YLtpWUZy_VJOv5-54A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXwxak9Zq+eCjW
 Cw8KpiGXhe10auWi4obl+8n5IECTJLXnpd/EaA4BbjIjN6P9KLEHTJ902J5yN38B1IeVugmDPNk
 wc0O0Kr1revgu+k2zlb2qGmn14Q1TCB4uDFivzJbCwQOhLdu4XznFNNj5cf3frZFeVoNcOp4VI6
 7XnldLhoS75d6LbC5SShLAENdZbpDkwCmYdKgvYOhBHZB/xRnVN2Vav4tEdDqWpxNs4WJBGkBYs
 /Sg1p+A89KetJPvk7rGf/bI1eSzHUi+2+gvqa3TdG9oLd+vwWUSix/Hi4B9GieI0CGRj5INBfp0
 fqCrXgAX+Sbnzv8gAEJRsudYRHf4Mg4Q3bE0rTbmRnrdM9lgQkNIjJ3A6IC3/VctZ2xhAA7NEE+
 dcFhrIE5GaMUB9YoHu8oFAU+iM5hxix75Zm1OaCktSXoLuC6w0mPMIkvKKQaRNsxtIyBewFaZ10
 C6o162WYcoWS8atCyPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112599-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A014666E67A

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie0/&pcie1 controller overrides to the
respective &pcieport0/&pcie1_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index 5eb4626c6129..579b0a4f34eb 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -335,26 +335,30 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3c_0p9>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;

-- 
2.34.1


