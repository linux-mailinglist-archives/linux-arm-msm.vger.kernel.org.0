Return-Path: <linux-arm-msm+bounces-99105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGExO/PcwGn6NQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:25:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 934D52ED070
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 175D83047034
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22AD2DB787;
	Mon, 23 Mar 2026 06:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIWgEOVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUEo03i+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5C22E541E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246812; cv=none; b=ZX/A/tusaMqeicGeibXi4Zzv5UpBbHK0gyiwMEG92YG0OKixX97hnjot76q4Gt8Bxfe6SEoM4vsLpLZirmuekOQC9ukxQKniHnWJ5x0em02471enz030jLO8ADTVP21apKDUMGVN8m/RgGBShZOlv6ksfVlxgSP4iQn7zo88yE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246812; c=relaxed/simple;
	bh=oGwRIOc93xYStSM6Gd/8iBKszXltpbb+q7NN5cO2OOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8nlmsqAtK/yKDOWMxRwtFCctz03lOj+Tvn+FUQpYQ2Di/SjsH+Fi2+sNmqEsLjhKElRTnXK8gIME3t862hvR2gVn/r+wOOIPV4BhnnEdaSpu05F8x5s1j7fTUYHpo5kef4NSsksy2NYggdjbfb6wvfgfK4zhUqMnHJcQc9lCUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIWgEOVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUEo03i+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLxLjO2191143
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3YZT0muKx3+xEdcClyAW0YBjbV+H7CRL33h+nqGjzM0=; b=PIWgEOVMYq7Seu9G
	2svLhPslnE96I3J8Z+JxHyMfvel6TCbPmwubI8ybDkecZ7Qt6TodYgQuSZVeXt+q
	3oTu8lEju/mWJCxBPlzYe9At885fv1Z7kjYSmWetOzo/yS6L4iVtxyJUiGEap4OS
	JqWsN+kJeHRed1yE5kKrKX58jMSTNXyIbr/xTxh1xDCw7IOwB4ijPzu0nkRi8VL0
	5zhwrfxyOPxgzulN2jWoaWO0iEBsGw4MB3JuhkIJiEwM+0Rtro+JXFNDBsGww/G9
	9F2cU6PEUM4u/2D+Y5XBvXfqNUgzrUulzgZvy+Pnlike29vVjO3LEaugEeNuuOJE
	glj8yg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3cuusj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2383952eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 23:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774246809; x=1774851609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YZT0muKx3+xEdcClyAW0YBjbV+H7CRL33h+nqGjzM0=;
        b=aUEo03i+3kmltpR6bJMUQI25K7wP7jsrHcF+LzzFl9x2Eio+abSt1QHaih6linGb2V
         o+0itobBD5EL/Im0uluZyqANqNcNvPPQ60bEm1htyA9tQHGCXmvTibn8I2f+Dq2nGFq6
         i7Yj7xeOuFprPtvL+nemsBKuJD7IdOkCcR/uWM7fV2fCbYPcZFDu5nZAoTSUWwdiOjTh
         DYtfnqSFVhQE6wZF0tb+EC8M1Oa9eSRuYPdY+UyMWfMX7WtD7XXPW9jpfeER+3WlbJJB
         aMHjFdYAyC4CkSsokwGNynpLMHFR8GCrKMb8swup3ASEo1zpzS6927129dcE4e27y/i+
         ep4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246809; x=1774851609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3YZT0muKx3+xEdcClyAW0YBjbV+H7CRL33h+nqGjzM0=;
        b=gIvouEBAoqfo9pGpd5a5Nomk/Kyd21PwadbNq95UMRAJ/E+fsYCz/PK9WjLiTCi/dz
         MOcWVl3TObgIQUb8l+jRadeBJBPQX65ibtcopMywxkdma+24x+iaHhxnILTHaMfFqtR2
         m+mxhQxU2yRx+mY3VTTT+b7SUkAFOsk9diVCvtVbW2H5ldTknlEvx0BWhf0fahdWHPHJ
         ctXA96X+6tJkIjKs46VM7XGjguH52/D1wA2XldbZ91pgHE2qtUjAaetGHXp++BpZ8Ybn
         J1WxORdAxoq8yF8SLr4j2zPCbSLm6tK0CTB9j/Zz8mvn/eG8p5huR1eqxlTsRBlqy5cg
         jI9w==
X-Forwarded-Encrypted: i=1; AJvYcCW4EN41QY+P+CnKQjiPSf0LOTviOV7vMblGkA/k3Mx7kC5oEM+I5/vYrz5uMuBHzOZiCkdB06FCx/ClQIGs@vger.kernel.org
X-Gm-Message-State: AOJu0YxTZqPCDaYxYDWviQWyxJLVq/9dqzEcIlnvrkNTW2S84DgBTo8j
	k9R863tx/Qr14Sf6Jx7sHCOMIvujMAWeqAuyiZ3HK/GmBeGLFuPMk9sCz2EcXNvHRrYg8HbEOle
	V5U3axNb6mzCW9WOd9K6GNYczyGwN3pucoEAgfI419+N+Bsi1Dx7L8Dciu9d7TIYcJyj+
X-Gm-Gg: ATEYQzxcrbIniIViCnuvXamjqRZfcLRyqpz67I6mMPlCp/6t4wasCvylQWki0JSyRM+
	boeCgtktECPuu4CcSOiHv5ZAtEmqZ5j4OI7zyhyw3kFLPffw6onVmsZCOxkjH+CNMOioJIwpw59
	FqcMyqov/PJOAsIad1oLQlMmBJvBJCwOMNTES/hgg6BDxkwTy1nMDaNNwxOeE0kdUDESzJhgAQF
	D6LsYjCpIkOazM2o9HK9XxmvT+oDM/u+w84bkxq3S6v2gOl0bJ3G9zWsmJgwLKy3nk63UOxaLnC
	OQUy1n9hs9za7CDvFrgoltSic8cUoFoVkZXdO/PrbU+F0xhhGt7M6lOhmBboI5H55rUU8EU261Y
	yCPodMlv37nCYTJvcr5yaUNfvL4DZlFnmfB+6INbKlceCNpNSiKCOPLQYktCf+fp/VCsnNOv6
X-Received: by 2002:a05:7300:5b88:b0:2ba:6c66:1f0d with SMTP id 5a478bee46e88-2c1095ae76dmr5775829eec.14.1774246808955;
        Sun, 22 Mar 2026 23:20:08 -0700 (PDT)
X-Received: by 2002:a05:7300:5b88:b0:2ba:6c66:1f0d with SMTP id 5a478bee46e88-2c1095ae76dmr5775789eec.14.1774246808088;
        Sun, 22 Mar 2026 23:20:08 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm11389751eec.2.2026.03.22.23.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:20:07 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 23:19:46 -0700
Subject: [PATCH 6/6] arm64: dts: qcom: kaanapali-mtp: Enable display DSI
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
In-Reply-To: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774246801; l=4311;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Bcgd1pbppR4E3CYRWwbr/+gMO4nBssdUvmhr/lE/8eE=;
 b=nqkZCpyTfTimMyRXh+M9EucqMFxwJncRED8n5LC5m8Zrxe3D16IPQSirPPgHVyr3gWo86V+EE
 m7hZAHi47s+DyoTRk3pSr9f5Oqspy4k2Sh3UbxtD9Mb49GWEiUAC2QC
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: I14JWyGbAf1eGmHUY6QmNVJl87jYeYiU
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69c0db9a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XD4UgOkGy63ES9sr7zQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0NiBTYWx0ZWRfX9gMFUXugmJpn
 KiHW1sC78dK8TK3LUFR4pCg8pJcJD7ix4zMz9NsBiPjLbDGONKoklQcqXgaSF5VVcNY0sXSFGOE
 AIQ8G2ENipj/9bOdmW04bLa851ntNJyfoopzpVqGlCgV0vDmJdNktxU53QOhwamyl7+1J1tm/ka
 hlIJBFuN9Ac+OLMxYOnNT2av79TkwxaALSMK+TTZrOybKsvldXMaiQ6CHJP0cM55YgXBEN4Dx6j
 3Vv0mVRxi/LcQuauRogCI4uvkD/oCChVYWM7eeqzSnLlk35b43oXLnGYhy8TFUHCajFLhH7nqJS
 LDCAntwBb1FLkzz5YWQA80Sq+6DUGhVNdqHoQWe8gvYO8Xxdu0IpIBrR/OMNjxP047saxp4XhbU
 3lgCqbOejw2aJMjOwrDdoNhHRtEJlS9rVAK/QN5bITpNt1nRbvCDoVEkrQLIvNhKYDXZe6efNJt
 +LwNg3m21TuA6M3OTuw==
X-Proofpoint-ORIG-GUID: I14JWyGbAf1eGmHUY6QmNVJl87jYeYiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99105-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	SURBL_MULTI_FAIL(0.00)[0.0.0.0:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 934D52ED070
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Enable MDSS/DPU/DSI0 and add Novatek NT37801 panel on Kaanapali MTP
board.

NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states VDDI ranges
1.65V~1.95V, but ldo12 ranges 1.2V~1.8V, so change ldo12 range to
1.65V~1.8V.

pmh0110_d_e0_gpios and pmh0110_f_e0_gpios are configured for
level shifters. Kaanapali need configure these pinctrl for panel
function.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 118 ++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index d0f3909621c9..07247dc98b70 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -375,7 +375,7 @@ vreg_l11b_1p0: ldo11 {
 
 		vreg_l12b_1p8: ldo12 {
 			regulator-name = "vreg_l12b_1p8";
-			regulator-min-microvolt = <1200000>;
+			regulator-min-microvolt = <1650000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 			regulator-allow-set-load;
@@ -873,6 +873,51 @@ &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l1d_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-names = "default", "sleep";
+
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p0>;
+		vddio-supply = <&vreg_l12b_1p8>;
+
+		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l3d_0p8>;
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -970,6 +1015,42 @@ bt_default: bt-default-state {
 	};
 };
 
+&pmh0110_d_e0_gpios {
+	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_mdp_vsync_p_1p8_active: sde-mdp-vsync-p-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&pmh0110_f_e0_gpios {
+	sde_disp0_rst_1p2_active: sde-disp0-rst-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_disp0_rst_1p8_active: sde-disp0-rst-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
 &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 
@@ -1128,6 +1209,41 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		bias-disable;
 	};
 
+	sde_te_active: sde-te-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_suspend: sde-te-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_esync0_suspend: sde-esync0-suspend-state {
+		pins = "gpio88";
+		function = "mdp_esync0_out";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.25.1


