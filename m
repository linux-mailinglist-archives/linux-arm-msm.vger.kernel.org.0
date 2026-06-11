Return-Path: <linux-arm-msm+bounces-112594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pnPDGkREKmrLlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:14:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A82A766E72B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:14:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pt1dX46d;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WzRhlLb3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112594-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112594-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAC7C33D8A46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E8537A4AF;
	Thu, 11 Jun 2026 05:00:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FB3376BDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154015; cv=none; b=Pia0UQg0xobx2z1XeqM2SMTzJWNFGya97B89GX70EU+053Q9uw+5meIf4VHjStoH7yZI0c7F4ZyJWf20AhVbwSYD37XUTpBcAN8e8zljHelUejE0YCVHossEhZSBDH80H8Sa+gsPi+66/26C2gE288I9X9Yu6SyZ427vcsoPiXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154015; c=relaxed/simple;
	bh=FnMF1gdIBBqzcGyw/Qftg/BoiY5xILkioEGvlCuaMr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkWZy9Y0e22q5Ed5we9gNC1GHwtiAXc/VkQbmXeCkH7Yl3VHgfORutovvsEA8Ls5UwKwNrB4VurnAwrMEqoebz+Fgjuuzz24STsFR0QvoXZ329o7OePbt7nXkEggvFSK2my+i3z7ulaGi7EiDK3yLQshr3oWo+7/nVZ9qz93nhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pt1dX46d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WzRhlLb3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NWsu3091895
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=; b=pt1dX46dq1QknpDu
	3okQUhqNiFXZD+9gAFpJSAgpGEU/v42A47FTQP1in41m+hj7c1XGLXEN5gry/z7p
	4AxSEplF14EpbrMGpkaZq+w3vyxdRlisSsclUGwSzjucH0NWmRlrR26GHJe3mzwt
	9ZGUq77si6hfgPn58xPVZA/ZzW22UAWo2I/aor858tY1A4QCNPBO2mTR6QmUNj73
	a4RrsrDmuPiVyplwYoJvvap8dtbnzSPB7xAXj2JsG0ftqk4nPND/vaLbfmU28eVW
	otr0fjOkChip7RYDihTDCUZJuSFIttt5XUxq3T5s5Xp/tlzyjv/X9wV/FEkSF02c
	SEfyNw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6v9mjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf11699875so6511925ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154004; x=1781758804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=;
        b=WzRhlLb3PjQLMzKk+jLfWMntVZJhlqt1knjK7rzs1znKFfUMWLzuLDCVurjpB5X3/m
         YJ+XO1B2ggOzz/QwBPn4ddqFlwCTQlei6aO/XxR1KYla/st4SO7chLnoXeI92GKOJ4+t
         raXqa26P2+p3EIyo3mX3gSirFoWk0IGipmXTNmaCbx0Rvwu20hfBrqvI/mRu6+uJ4+l9
         lTCfJOGk+PEVVDX7tikHt+jXblWpok2sU6zc1YNck8UtkQsdcponzejQYbKhJdnqD3aT
         EIQwl5P/Qq01gG2xQetYfKDXlxreFE5TWrt3iaD7am7lBe1d95JyfazfPvt+5w2XU05m
         DeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154004; x=1781758804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=;
        b=QfJDzBQBCMXJuIHkdnmhOlHzfqYm9iqw7dPunqwXFHxZWMvyzQbu71s2j5jYQig1V+
         LUh+hQ9IyaVotVGxvEzS2HvXBxH1lq3vFWpLcRUeqT4VMuEK11KOn3fyt7N43I3r3zlF
         8/7cykzA6BF+7isi0C6B3EFfLPEfywtrqlmCvvmzO+0d/Nb8Y/aGbDJuQiY4Ojrwu27z
         PQtiPPiDoFqGotPN4FQPWTtmfzQAcgHZHWtvVLl37f60le+vjGn+UB2cYP1Wi/36oZ2i
         0fWeJfIG+PoFpkdyh2sXseGFGElo2b2xOxhoysVcagBTRmHCBpIzRbn4hUsO0ZVgTweV
         GA0w==
X-Gm-Message-State: AOJu0Yz1FqJxDGtJ3K1nvKyepxzorEyb6VZKMUrfs/9PiRiNyx35a19N
	yjJaIwAffgvoY7hNNbW11MBZz7y+w4OzjQ+/Yn0y1SxMH9sezjcNFv/EKByXVNHlwkKY4vO2ax5
	Or24kiLf9IurCW4BvEJ2wEciaxNl2Vk9L3Aeoe06JNEA/ehjvwo3cTm5EBRkr/BJuXtrswEFFCC
	pt
X-Gm-Gg: Acq92OGCUJeStm5NJigY6FS2AgLNqrxiWmoLf1Vs0LLzydr6D7yMJm08Hlwu8cjXYIE
	MZJSSp5y5XDTzzmiFc4YRg4MQpEW0QOJjZsyloU+R2LKOAP1PyIrOzF6eIwtDecidRFuKNPd6VB
	6mMnfGPCgoghXhh3zycMWbhDHTWlfSydIat4kxBP5QYx4Q5GXRgWKaNgOQ3VzOAL0KcUjmgbtj0
	rO4uV3OisIQ+ulJ8sfR/8icO86FJGlAkD9+4qeSpEcS/1GnMk1D/u+8zMrkGzrPVgWUmB1AjUm3
	YPoEOVe/H0wS7Sjp0Wyk8OOjhjdfprNu2PoyJIamvFlMia/Brs7C184TpDv03J+O0owU3+43hEr
	J4YI52P6CACxEKgWwANDmpRVwTxG6+lyiW4ZmPXY8MVE6qnNP901Rbc0cXmPqs6ufR3E=
X-Received: by 2002:a17:902:e752:b0:2bf:1aa9:6c8a with SMTP id d9443c01a7336-2c2efc57fb0mr9281405ad.12.1781154003344;
        Wed, 10 Jun 2026 22:00:03 -0700 (PDT)
X-Received: by 2002:a17:902:e752:b0:2bf:1aa9:6c8a with SMTP id d9443c01a7336-2c2efc57fb0mr9280975ad.12.1781154002417;
        Wed, 10 Jun 2026 22:00:02 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:02 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:53 +0530
Subject: [PATCH v2 17/37] arm64: dts: qcom: kodiak: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-17-2744251b1181@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=3509;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=FnMF1gdIBBqzcGyw/Qftg/BoiY5xILkioEGvlCuaMr4=;
 b=15wuX8JRz8UD0USokUpXpyMfhlRDaBFk2uYD0To+uVmrw8iRK+RLcD031zvTMpzI1IB96mIPc
 6uqTDq5ivHqAeiQjwdduD6LbA2uj/waYvvuw/SpR4tkm2mccKnlaRaI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: B6_-88Lvzo7999SvBLaJU-BF4f3GndIX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX8k8+CuITwylQ
 nHy7YwNmlMjxuYXg3r+xtBjnMH/2W3jnWMfYBnro6PFex98jy9xCNHgLz40KrNYqkPaS1UDq5re
 gR5lFeU140TUOkVmSKufjMyVN082WYs=
X-Proofpoint-GUID: B6_-88Lvzo7999SvBLaJU-BF4f3GndIX
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a40d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vzsU3dzRAwCoIzd_qrsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9Lz+eh7FVPdf
 m+sSD/O5yYqNJkCLgzhVrKcArhXE/VPHR/PTNRm7jDd/UCjiDKiWElvhgHzHlW/nSJqfec6U0iZ
 jeHcf08CxJabqJrI2RgPFs9/EbKgUKXRzuJRfg/F0u3rpRrcRHUd4zs7ZSCUJqbJrQg5x55DnGO
 hjXkqYPmFJnnXrToKMrp9KBdcaoyvIe5LGWVLauDZPeyYxuuR3mxOMraNH06UiqLNztXi/9uMVp
 fdeUd5VA/ZQIOz1OdYwUpv5huhntYSAIwS6lS94o9SMHpEJjqa5JHz9nzUKAoglwa2xeohTI8h9
 o2LlG1lfWZMkC9fKMF2AAbxFYHGbPwmtgExwRUVcVWac349I9XN0teFFrccIhyJUtP/xj1neZqe
 SdvqTyQVOHnWuc7t32PFJifx94q/axONuXoxwDJkZAdL5XmYjTLTapHWkZZrf+jiA62vyOCWigf
 gFk5wPt21ZX66OHU3lA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112594-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A82A766E72B

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..b1ad1d7c346a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -546,7 +546,7 @@ &mdss_dp_out {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..3a9fbef89aff 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -523,7 +523,7 @@ &lpass_va_macro {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
@@ -540,7 +540,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_clkreq_n>, <&pcie1_reset_n>, <&pcie1_wake_n>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..e0275430ef82 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -685,7 +685,7 @@ &mdss_dsi_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
@@ -704,7 +704,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..681a9ff5ef77 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -813,7 +813,7 @@ &mdss_dsi_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,

-- 
2.34.1


