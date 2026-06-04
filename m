Return-Path: <linux-arm-msm+bounces-111127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J3PqOpcNIWrM+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:31:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C5A63CFE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:31:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jP1BgOpo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A2ROExcL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111127-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111127-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 52951302FF7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15903C13FB;
	Thu,  4 Jun 2026 05:27:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05A23C060E
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:27:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550847; cv=none; b=OQNJUONIV8rUZkr/AVbrqFN/3sfNOtm6e26ZE+7+hY91ID0IE16RhLQwy6FXpRCvsnR5JmsSLcTtuclX/aq6BDU0PXAk/yWqfFQcqprsgLP9nKTiTfWqNDbJ3L9pgGiQjQgUUCZoH4Qpxq625VLGC7AnSFyjoDGLqAkhx98jbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550847; c=relaxed/simple;
	bh=Fb7z5iu2Tu23nAp6mDwCPKGAkCEtpKFZU1e3tF43ZGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSE1m9IFM9HSJs9rwzoNbg+QSLHkLGgw82bLqpZkECdQ4DExpQkLF4dIgxTd4Ep2OkPwXNUPAbnjrDrBtccf1ugu87a5h5GKFElYjVS9b1W1pZCSa8oLJJs0LPYDKvDmIoJTBrBJacxhuqPTNjC+aRShZYGjGGwQS8vbgkNDl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jP1BgOpo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2ROExcL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542bDtn3552133
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=; b=jP1BgOponwXvKH+Z
	uKI93IC6ylBIZx/UCrvwLa24Otthi1EFGoTFh46JddICAqYWhwKQCo+RJDWkWhBv
	8xP5iNkdwClopAA8MZO1Ja/J9Zj6VlXSKP8awd1Cgjg4tmBbWVfAcGmDaOaKb7Nr
	xdiAtw8J2HkDGmLobafhdLv9SpHAs1ixN5aYFGmscew2kmpjTE+bPGwjplxqIsy2
	R3kSBO7F02DfDlfAhKZ/L7fAtcOrvEGky5qu4UmDe8sRqCgX3kxrX9/0Uk5fXVSY
	nfnGYg0sbrXR77OTMiN/uxUm7HZBvdheBsbAKBP9chQm7yCawnvilKRV4TqWAh4W
	m4JLmg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mv553-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:27:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422ca754d8so263736b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550845; x=1781155645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=;
        b=A2ROExcL4f3m7Q5fnSffSgewS/p5u01TPZcAQa5Nv/Uv/XZZRIYGmZ2/ogFGvfjpPR
         M6dr9vOK1dgxP28gdoI95g/o+F7B5aOO1vXSKFCihyFuV0fQVIjSfhqT4IVHA8evaua9
         pI94U+TjilP6NOcmH7muklb7p8EQQFcnK0pnm5eLkHPZqgfVk7vrmEoACFc9hWFq/ry7
         F+s9wNPnnPNScG32wt5BT0ddXjf0yj5JwPN2ulUTK9MmTEPfpb0e2GiGWYa9JPIQTDBT
         byxBxzTXjw4BqLnO4BImqo9RJCkL0mNJhJbVo5llQW0/4yxrHGyptMdc+DM/IVuqlnQi
         X2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550845; x=1781155645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=;
        b=LuIQpmOKLaeP7owQXAkCaRpAiNT+QOdL2CnU282nDmcAhs47bfmaVOEvvhg9jbZo0y
         ZsK08oFgjiO3UKTuzvCyMp9rUtGPHrv5fR8pLz0hcV5eyluSba86bDj0LW3IZYAcb46L
         RQG//hBGzN3HbQFBBjLXXMGl5LZVFNCS/L1yCtGwb624KT6oTu1otp03mfj19ET7Z1ej
         u354GOFZS9iEjopq+NMT83gBQwmZBgpAWHYqCBPVx238biBGk5DOHvt6LmeMd24pT5Bd
         6x3mCIwdSAxn99vlp4Ghkn/6M7Hg9BoNba+r1S/ehIE/WWmCVp+J+JRX10G45r2PmEeJ
         GlTg==
X-Forwarded-Encrypted: i=1; AFNElJ+O+okS2+OEMo93jvFdlTSdO5L9a2hRsgCQJB0lN94c98U7/WoqOF9E54U8Yu96IT5hsAsKF5YM6t5iJTgB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy5nXJ6SWDixh1DSI4ga4FDuPJ95md/zEEF2xVLp0TBE1GYgYp
	NyseLS0Uji8YaKQ3v+QWL6W8aLgwqpBTFkZnCdKDBuFTFKPGKDFEyo7NlvoB4BY9271FLbEsmx5
	qiL8pjDh9f8a6/E2Gi/pgQtPEYDM7HUsmJ2/qhwBFd6s7lFOo9b0vwZD98+lV5xYSvtLY
X-Gm-Gg: Acq92OE5mWHE2+Bm+wVAkCWrbE+we6jxvh8izCn76tRnn1OxXkZ9PujyAo0Ef91fLrL
	1ERKGIw38qCJuqf7IsF+/LBCheykMgM6USid+iyqpgcWdOGAk4tHnh9Iu1mHMrVSGJ3St32VZZw
	6f58AOWBabJi5g5XM61AGkzyKBkBbrzUmHKjjGpbDOCINiHP/MLRGsLlS7cbKS2417XaRbGUkB3
	CZUhFffmf78Yy14hxViXRNr2l0ZV8vUdhSsPcugUH0o1fHPPkLNQAx/MjySZpR0ABPsXYXG1/pe
	VguGGO0a00zYaDcUAZeP4Fp7vzYug4inEGhP9Qo8yEoDMuYIHu1U/UZyZtAkcNrCXSYAPUNWD7A
	Edf6TJHSJMxqMyZyGi7iHXVIcY+dQVn/pwm1cORKE9B4Pe6DqQFuLeXjtTZqVJUw=
X-Received: by 2002:a05:6a00:2999:b0:842:6004:3fd4 with SMTP id d2e1a72fcca58-84284ed9801mr6234775b3a.24.1780550845449;
        Wed, 03 Jun 2026 22:27:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:2999:b0:842:6004:3fd4 with SMTP id d2e1a72fcca58-84284ed9801mr6234757b3a.24.1780550845013;
        Wed, 03 Jun 2026 22:27:25 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:24 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:17 +0530
Subject: [PATCH v4 11/13] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
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
X-Proofpoint-GUID: XkPsKM2hT54Zq5AfI-4-O8NGECLv8HWS
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a210cbe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vsOEvA3BJYGQS88P8KEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX/bK9l7R3lipn
 Z/wtefEcCysSUUsCmm0o9TfDkipEE5Ghe0ROBgB1zqdg7iH7O6t0wAo+/p9avQDlWVE/GT6dbbM
 8DbvetGQb8TdAUzKeZRKRDv9zCSmBEpfhLlAJBQnDaoEu6d7QOxuO1L2m+bI6jiBG9afNv9JxMX
 jFrPvABaLl8HL6F5XVtino/0skF0m53ii4x86b6e4fDHO/WcR12rf7Mfar3BPbn2+BbOx6X9XEi
 fI93/7N0+Xy8HMt5N0MmRCGYqVSiZlbeqZvbBoyxSS+rAhr3WBE9A0UVitdmtsTVYIjYqj6FuCJ
 dLT/CxuF8tIxh0HJXLxPFsVeQkO8xGpeYy+MDtR9KkONLjbDcDlTtXOMIibJ5hxtEXAEu9Js07g
 tnRwgUaso+oqATOd5X5sCQPmRWPrnCWKuiNxq+gKk989BsNXfnSxpdpC3Cwxf3NdgCD0XVYJdBO
 kyNMCu/ZeWGaXQ7KtIg==
X-Proofpoint-ORIG-GUID: XkPsKM2hT54Zq5AfI-4-O8NGECLv8HWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
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
	TAGGED_FROM(0.00)[bounces-111127-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: C5C5A63CFE9

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence add support for Shikra
GPUCC by extending the QCM2290 GPUCC driver.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 6e696cf672923495c789055dcd2ff905d1761e16..f43dd8231fb20d6f44a10ac33ed7dff923c81fa4 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -133,6 +133,17 @@ static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src_shikra[] = {
+	F(355200000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(537600000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(672000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(844800000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(921600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1017600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1142400000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	.cmd_rcgr = 0x101c,
 	.mnd_width = 0,
@@ -357,12 +368,16 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
 	{ .compatible = "qcom,qcm2290-gpucc" },
+	{ .compatible = "qcom,shikra-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,shikra-gpucc"))
+		gpu_cc_gx_gfx3d_clk_src.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src_shikra;
+
 	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 

-- 
2.34.1


