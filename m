Return-Path: <linux-arm-msm+bounces-111122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 38dLI/oMIWqh+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:28:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 878A763CF74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:28:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZzjTSTOc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e57bx3SI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111122-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111122-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFCE03036BE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208AA3C0639;
	Thu,  4 Jun 2026 05:27:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C193BFE50
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:27:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550822; cv=none; b=e8cZQRfkKiZYsc8Y9Ukaq4RSsTKisKSpcDnmfyBQ15rKeMCRnN8/Rwh2RTq/5hHiwF0gVPspaZkXhwMrqW5JN7QC9fAG1BYopoAGY4mUTG0uaEE1QgsXInFfdUslynGh7ruC82IkIdOa04i5AH7cQk1jCsP3OtLEJr1L9H8zM58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550822; c=relaxed/simple;
	bh=sfuATI0fCC0PdMmc4wHiyaBvpIQ5ZcPp15gGK/db0jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdKkLs3TzPOyhnrKoxGG6UBjePMaYX348tAi4BW2md/oZh6hzpevZwIkT1gwpyRRa5IZZnE3bzTozBkcv6G3/EjCXrBlKMoRNQvuMqIhgSLK6uIBatPMIf+j96C4kuDvpuIQhSDylN+C9da82oEDkriZAxe9adDqMAoqysV6mPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzjTSTOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e57bx3SI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540toGY598077
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WzeyjYyJNfSQbXmAFrqFQg8Zn1md9eGVWpG1i9pHV7E=; b=ZzjTSTOcQXQQWkJZ
	tvrGlqYDUwwW5BPGrsQVvEbrhzfOZZx8nZgbsdCwA31X9uJo+vIDoc++RDVj3PLv
	xPcHibPiRwzLE1rxG8okvBmljrduk3QheN34X5npOoy8wKEi2UlYaJKGrdewwXxI
	7JRP2SJUGNUwSUuPKdgEiZR7DZ5L5ZZ5aJqPtRbuX/1/J0UGYS78BSXwi8217zKw
	9QR9TC+gQxFjTMid6NtHj5HLT0m0dhwvFSHcSGMUanlW3Z7s7i+EqfMUHWBGH1Io
	VoSiahn/CbVUyWmKoOuQqWicVmaZmA7YFoIPgsps1ctTIK6dFHOFJuyOKr5DpEwm
	9XqRQg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m0rwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:27:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423770d72dso433104b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550819; x=1781155619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzeyjYyJNfSQbXmAFrqFQg8Zn1md9eGVWpG1i9pHV7E=;
        b=e57bx3SIJ8VNB2Ud2NIwqTqrx6fPGeL5mkS9po26ZNA08qZL5ZrbgrPDeroLlK45xm
         V8h0tksM8VIfMJVuCAKFmeDsdkzEmQK77A3Fgkl1aHqCTvm52hkHX+et6krWmS8FuzxB
         tn18pkiaBExiSHc+PItzYZb5pabLulLe6ahSwmYKjLLF8AfVLnua6qhPd1sGsWzoWPu2
         yIKTXmaSoiwO3BLzW7kFc7oaEgNPYklTlix4x1vp7MNL+LqiPDNQ/A/MaIuxDJMBEdri
         88Nujj+hOn/Z3inV3KgA69//zsKx43OMqH6OA9ILsVI20DQ5caNBxB04zeVQrNJYYVOK
         nqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550819; x=1781155619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WzeyjYyJNfSQbXmAFrqFQg8Zn1md9eGVWpG1i9pHV7E=;
        b=S40s199xOMaHgaHkBuz+ha2dM8ji5NO1njAZJOhNRCV05htric4U3NUw35zJNKWbtS
         RyWzQMU5Qts9IeM9orGOsvdKHUxYB/Iayrj1/kQHSnFa9RYxbr23j0z/HhabUbXzvhMB
         xUvgOwo2LF228LsTnXHzvyLyXqr3AJ7z1mLNOqbdqztyPsEJ7H1qHMcobAP0Y0UhvhQP
         gPxd3ErjzD+3DyFZ739qZCmD1Ryv2GrSnQgwMUfrj/LJdarHNuqUXbVzq6vdiVSfc5we
         84wX6NXaGX4Q100ATNanQocrAY9KWBP1zhiA6391wUZsDxTImTVORELgKJlcIHd8pg2Z
         aDKA==
X-Forwarded-Encrypted: i=1; AFNElJ+2GPRH8ZSEVsjFG8sYfx+KbcoaoQLPuPTCJWk8v7UVUgzs3SDe280/MMVs8TksOn1CQKsqpLlxfjLmQO62@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7mv4+jZDH3B6G+fUWl5DiZbGr9nODgBNhAWml+0fUDyxltqYW
	fEqp9pVUTzGd+TxcRYgNXC9dcPWPTaFAeoYBRXqxFKwIx4U58sgCzzwk+2NMiI3w0CZSaO6eJDu
	PzxaQRGWYKA+q6yK2ZNuWJlqTO3k5+S9Qy6In5JbOYa5vTKGNpvTSP4yuvyZxyCnJ4SN/
X-Gm-Gg: Acq92OHOLB+Prs5L0s5TOedzXZvU1PXeSUQTTxfyO0Phaline5n6oL63tiuSCQq2PiJ
	Bf695dV9u5TNbopVXxAly5iSpOnww7UksAqHkcU/Q1zu+TK/OOHdcpYH8k31FibIQ0I86lxWzL4
	C5UzEeINWDZnsO/lKDn70ozqwCTcLRVs05Hz1IIlcAhmik2AmBWfDqu9hqc+PzhnS/AaZmHislE
	ACE6SVpZ161Y/jnai2ZG8Uy7M/JPtevHHezHibX0CHTS3zRBSROdG0AP+ce5EclSZYifARz5Prl
	M1Ql16zDPOH41xI2W5icYvVPSHjznTVqvWFwgt20aDQNzWgyfn+bSIGUITJ9scaMUcEVzEHz+2J
	EzylK/oRVKSngQSU5EJMeq4Dm5dQZCA2pLEpWTbysI78FcShJgq1afNvsOdVNy+g=
X-Received: by 2002:a05:6a00:2e05:b0:841:dcf3:e521 with SMTP id d2e1a72fcca58-84284f3436emr6990199b3a.49.1780550819503;
        Wed, 03 Jun 2026 22:26:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e05:b0:841:dcf3:e521 with SMTP id d2e1a72fcca58-84284f3436emr6990172b3a.49.1780550819064;
        Wed, 03 Jun 2026 22:26:59 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:58 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:12 +0530
Subject: [PATCH v4 06/13] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-6-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a210ca4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Thq-9bDrPsIKtHylmFsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX+m8OTVN/tA5q
 IDybHyCAGMEevWX9GI+1ziiyfXkiq9DtUfCuXAsd+dWzIiyTE++Htb0cMfF5Awjz6h1yLUbFvzU
 6HGnOmCLzKTRZiENnaqwTbUuumfT5UVReCJj8ocgGImtZWFdSGkXOlo/Tjy5jnhtM+NJU8teVI6
 131SSp7ZW5k1XYUNhlEFpzTGnWSCDWUcbD1QZDMKjRVQohJa9rfpr0m0OBMcp2+7YiW6MlpfJp3
 VDCDCZEF0LUXsED69Qsun/mUVmH/pPnnr3wQ7M0egqyN+kZcldX3ACy0Hsdm5WWr2BD0bkxupMw
 4Y+qVH6iS22rrByzb6GYyRwYfzbva3+BakrCGvXIXoWeDMCsi4c1SM4eHUMFhrhTjPUeuOJppD2
 Aiod0TfUF5vrgkfB+8crPeP8+nICG/3iFfH7PGh59tS6MjDJsm/NkNUJhKgSO8dNGbQ/NXUKsrh
 bJHnA1K3MJzEkESs3hg==
X-Proofpoint-GUID: CNvX4HDB9SoehwpdChIQFZ-tzLDlHq0g
X-Proofpoint-ORIG-GUID: CNvX4HDB9SoehwpdChIQFZ-tzLDlHq0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111122-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 878A763CF74

Update the QCM2290 DISPCC driver to use the DT index based parent clock
lookup to align with the latest convention. While at it, fix the parent
data of mdss ahb/mdp clocks to use GPLL0 main output as per HW clock plan,
and update frequency table accordingly. Also, add the DSI1 PHY PLL input
clocks support.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 1c21267ae0f7a86c1de88e888c2a990c35f0a0e0..f5dbd19d0a0334362a44f91a69229cb0f018f309 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -24,6 +24,18 @@
 #include "gdsc.h"
 #include "reset.h"
 
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_GPLL0_OUT_DIV,
+	DT_GPLL0,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+	DT_SLEEP_CLK,
+};
+
 enum {
 	P_BI_TCXO,
 	P_BI_TCXO_AO,
@@ -33,6 +45,8 @@ enum {
 	P_GPLL0_OUT_DIV,
 	P_GPLL0_OUT_MAIN,
 	P_SLEEP_CLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
 };
 
 static const struct pll_vco spark_vco[] = {
@@ -58,7 +72,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_pll0",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "bi_tcxo",
+				.index = DT_BI_TCXO,
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
@@ -72,8 +86,8 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
@@ -81,17 +95,17 @@ static const struct parent_map disp_cc_parent_map_1[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .index = DT_BI_TCXO },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO_AO, 0 },
-	{ P_GPLL0_OUT_DIV, 4 },
+	{ P_GPLL0_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
-	{ .fw_name = "bi_tcxo_ao" },
-	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
+	{ .index = DT_BI_TCXO_AO },
+	{ .index = DT_GPLL0 },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -101,19 +115,21 @@ static const struct parent_map disp_cc_parent_map_3[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .index = DT_BI_TCXO },
 	{ .hw = &disp_cc_pll0.clkr.hw },
-	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .index = DT_GPLL0 },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
@@ -121,7 +137,7 @@ static const struct parent_map disp_cc_parent_map_5[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .fw_name = "sleep_clk" },
+	{ .index = DT_SLEEP_CLK },
 };
 
 static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
@@ -155,8 +171,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
 	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
-	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
-	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
+	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
 	{ }
 };
 

-- 
2.34.1


