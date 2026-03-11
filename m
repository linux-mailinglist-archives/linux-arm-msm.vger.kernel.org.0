Return-Path: <linux-arm-msm+bounces-97021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPl/KuCAsWmjCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:49:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE190265B33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69D03300AD94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249423D7D9D;
	Wed, 11 Mar 2026 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e750rKeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LvnUfvBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FF53D6492
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240442; cv=none; b=PKxf+5SD2oIU8CGsk3KVa1sVC5MVhZYAIpnNuJ/VmMbdZ6DQ5r3RWv8Nrg5bN56xPB09CStz0qBM5o8aa/XEc9j8t7lEAMHgQBpGWGT3a2jQ/5ARr/6sAlZMr6S2CWVJScfROUmfuRlNArvbfWKVVdRW1hz5nn9WOc/jDHvbfv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240442; c=relaxed/simple;
	bh=MmbwTnZejqoXZwYss2/ok3DTFscJl8ejhJtrJnSujeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOZjnAXz1PnctIhMCvCAHHwltrwDg0BOJ+L+Kgb0cTmovE1EMoOXVyBmT6Vv0nbptxHKYOVVG6l0L82kgT2YERIZlYqLmmagp4V43WW/FOXT6URcIJIOeKKM85j6fC3LXd7cO+wVmJAGqi7F5M+qEC5sVAX4hr3K3ZH4p+NrPWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e750rKeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvnUfvBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9jKcO248344
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=; b=e750rKehepLYn4s3
	sbwYyN9tye8RJbzF7pxuBCM5wfgz5CcFHsOu68F+fihq/dO4/8PfRVi0zbd3/9eQ
	SFPLS8gbwq/aY3v0nmFZ3PlGN7Dc0wgNKbm8bx1bH21iOY2eHc9LIFUXVgYeGaRm
	yP60Ec8cgrt7LDvmSn0oazrBESGFZhsjLfBcbaeclciUDUPPJUYYlGFKuybg73KQ
	Enz3Wx7xsZOKnKPm4dk8L/s94bkTSP8svyPrGwGlcziWwFgKAkeALYFPhsIO9rEr
	lUbEvW+VJ/SE5VI/M2SB2efRP5B4q0U37sv3ldwXEVuXBagVb/CWdOM4ctRjUSHH
	jYUk3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv1415n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7de0e161so2347983185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240438; x=1773845238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=;
        b=LvnUfvBahRIPGcpIbc04RdRjqR5c3JjksYSJyYioyAM6uAu02rat90KEH0gHg6X5A5
         ZHD3OmtW3s+BBK2lgXTJCe8omRvIcEskDkbv7//INihuVXIfYs88U9hlKiLCH8lhX/Tg
         nQ54rjQmAnI/yqShg71oOlDGCZQUlhMHysZ/kZR1EF+roFqQcOPw56t69WPNh2qejCao
         4bynA6bX3+aSLBHsidilp3/S8HYz5Hmu41TEsvquKoH//7STdP8zWwSOiyDmxU8AcLNg
         RTid9Bep/QE1CJRlt26jPHRh+r4IZJiqSj2VmPXsywI5+EjPBLXKy7kONdcRABQMpmyg
         o10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240438; x=1773845238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=crgpqYHRCZINWwc1UQD/oa3ra4g7qbkLaKi2fMoFJnk=;
        b=A6pvDPYYuv0yavrC9XBgW26w464rolv+G6WPWDxaHpGVhS+s4QwGMDG+JEPouRFMgp
         szU3Ad2+N7t+mUSHxkg9X5HUgC3xW2kl8sduw7cPgem7kjOpKORXGybmJiMNu+A+DCjA
         FxXpfmNAM9ddCgqN0YUVJd6zbmB/Nr3yt1FGN22SLFNg7WRbxzPfuK3HBWukCuHC1sBf
         PKUimux8CQMky8DeR9dYI2ITwXdyT0vPuLHkvw+k8ppsQbG9AaxAb0iunQI3iToCWUSZ
         Z0O3mqXNKAI7tq8luC2d0lda3meKNYsublRaCHBwZKWKG7ihvt8Q7s0Elwh2FHJPQFgY
         UxDg==
X-Gm-Message-State: AOJu0YwuShP8D5n25e0o3SHRhl5wgq8NTZ/SxjjxSjcJxLryTylmdJ0i
	CrSzQZDa8eurTV3IDWHIwiT5m+XYHdYnAxViikm0CX3Ea5g7vnSolwL30NY7svwGAP5umG4hBkg
	JBrw0fAPaaTqEsS4P8cl6kABa0OfGypytWa2Pdys0ssa/2li7C6BdrT5/SJK2L1ID8Wm8
X-Gm-Gg: ATEYQzzkfXjYoP8z08Pld14veoEor42qYkXU8aE6Gjgrm/O05vQCVHqx926vwohuvzd
	K0zb/XbgvSA3xcEb9IRKXm3LmX4RqhUM1IKSS3EdAe7xu/1fEGvkGiaEOLisHorDW1bZgaBR2Mr
	9ll3yl89/ic69K9MIRyuSazQz5U0kMbJK5EcTIyrpAmSK4RI/TcSxeiMryY4Yma8zJnHvZ9qSn7
	jwSF5Aut6OJD4ZxD6eF4mtiTXNNcNQ+ntdS5hjakbXq0oUbMoGcJbGt+w4cifVOCkQTSG/NLYrg
	tXYo7DM6BkxfyLJ/xOEQ0oi1K03/nBHVG3quUhdVpLb2AzDDkGvgKvoFPZEdLO4kPRF2/jwflzt
	k7UmZE3Zhb/tyaRqb70WVyIuYpmuetw==
X-Received: by 2002:a05:620a:46a0:b0:8cb:3a1d:79ed with SMTP id af79cd13be357-8cda1a7c760mr343819585a.72.1773240437605;
        Wed, 11 Mar 2026 07:47:17 -0700 (PDT)
X-Received: by 2002:a05:620a:46a0:b0:8cb:3a1d:79ed with SMTP id af79cd13be357-8cda1a7c760mr343814385a.72.1773240437050;
        Wed, 11 Mar 2026 07:47:17 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d61esm7992501f8f.8.2026.03.11.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:47:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 16:46:34 +0200
Subject: [PATCH RESEND v6 4/6] clk: qcom: rpmh: Add support for Eliza rpmh
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-eliza-clocks-v6-4-453c4cf657a2@oss.qualcomm.com>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
In-Reply-To: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0WfDXTaoPjhSkdPdWPSYcrpiPi2RGOcbaSM1A3kW1B8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpsYBe5Y7mdE8Z93kD0I+bJQNaX+YxHX8cDGgcw
 SCYB0r+xNiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabGAXgAKCRAbX0TJAJUV
 VrkSD/9XPaA2+tb+kLqhcs1SJOynS1N5tvUQAw98Ez8GzRtHrDUaPoFa6O/OjN2/os6CEJj9Q8q
 7/Ma/x5OVA+lfSk6OB8VkVBam0TD+29tKLNRnmCXgnp2LQLmNW+QEIR47xWVjtC3fhOTin275Vp
 j97uVdfBcUmWxWahHret68IgEGUA7hjFXXkDraEqnCrLzV6abkgoxA/kq6sdLa603XYLKc1plf7
 ngwMmcXo5nH2uHRvRyAAlL6cuAZI6m0FsEtS7nm5FukEf1/xbzOl+NCTEkIH2lA0sd7WAtbRs6t
 4wKAZYvbD+3meFpVDjDZeJA1ZcJVISyLe2Dvbw+IKuCzJfCKdZoUDe2Og22nGT0mJX2oLWDw2oX
 9vjFXdHSL69H51xqpHJbrXCTTF/eZjcrLDXddQP1/ppVXyUIko1oBgAYxOVwEQwfGE7WqZ/ceTf
 /6U5O1fB8CmKERrD9Gz3vJVMeEVHZy9XQYgglFabhJrNplvOr1g5L6RMUGYDKYW6YxfEUVLkq2Y
 MqlETrOwYYmTnXls4XRrTT7l3uxu2v7xisYba3szmxXie2YmU4QnWu+aMyipFna6iO8NCHj1Clz
 73v5gUn+LPn233i15phz4EL7B8b7c7QONuf1EodpiT6tjq/AYYuUfZeU02Aag3Cj3KMwXxTf2O7
 WHucWdrNtXSUVuA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNCBTYWx0ZWRfX5ZoCJ+ZoxTw/
 o9ZE9MOL+8wO7wO4jsdXomoDUaxgtbPlrVlUCtuxq6NVqIluVdfiNOyWvMt9k/3EaemmN3/Alne
 vXt3iguWfDVvduuclf8zz3ZYqK8QC2KVfc8H1z9v+F5pwgqUNPgxlPZmHITt/Dz7cFaI47sIUk5
 uUaxTy9yEhLUfcW0NfeXKVwHTGMo8wIN4mcnBcgyQMkQTYpBZ2tsEDGU4BzHdmFIyIAxHxEs6VW
 Hf/IIV7lit15uDK7GzM1ErY4pSclploKmeyRfIIfeVVys6dC3lFVJp/Quglm7B8fYEWlmiDIvFH
 e9kq5OoSk8EBJsP5l3CemAwOJyeKmPLE1YE1qUFx3UpNBLDWVDjdZnR9t7/2t7bVgrJfDMzPMyM
 +RG4uZwyBh1xBgpAsE267Uv+NdEsa5Jrj5uba7dtO+j+rRfRQfQLvlubT18gc3Pyu4MX/ERTE/R
 OUfYFF1PSZ5YTHKP0Hw==
X-Proofpoint-GUID: lkidJAKeQ-g2Pd_RQZ100FyLAiXi7CCd
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b18076 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WYKAqXAjdBNwTyPbr-UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: lkidJAKeQ-g2Pd_RQZ100FyLAiXi7CCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110124
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97021-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE190265B33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the RPMH clocks present in Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..6a54481cc6ae 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -372,6 +372,8 @@ DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
 
 DEFINE_CLK_RPMH_VRM(rf_clk3, _a2, "rfclka3", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk4, _a2, "rfclka4", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk5, _a2, "rfclka5", 2);
 
 DEFINE_CLK_RPMH_VRM(clk1, _a1, "clka1", 1);
 DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
@@ -940,6 +942,29 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *eliza_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a2.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a2_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5_a2.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a2_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_eliza = {
+	.clks = eliza_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1029,6 +1054,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},

-- 
2.48.1


