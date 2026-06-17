Return-Path: <linux-arm-msm+bounces-113616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vvPxAY6DMmol1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:22:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6656669902A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:22:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jp7jC87S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I2eCjmPJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113616-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113616-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 508A932325CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8960384CDA;
	Wed, 17 Jun 2026 11:08:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C79382361
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694500; cv=none; b=HySuyRfnBjzdJwk8TKn4wVxRnU23CyO1CclsREQ9R1l6SACCFACqH00mFgNGRt6JeraC9AW4pBLAenuHNqD00dS6mSzFGfz/OVMJgDlMYyqNY+9OyEITzbkZcIDuDj1U0GKBAqfcK5lAB4h7w/aPJGaoFeP/FjWf4ifjpTdCx7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694500; c=relaxed/simple;
	bh=Va9DP1JOK0mstsSy90ZuVxwqnBOsm/kHZXDbxgqIbYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJmF2f2RMHPsrrKpIwpMG8ciDhA6bgz6eGHWFk48Obb3KWVpjn7zSs4n1su9DrsPvxzmepLThRPsxbtJaTVPR5LLT1/qtt7Uozr1emrS8UZ8E/XQ1EddkfVuNGB5XB/TMrIz4luZyWj7QfXbd5NMgHY36fCr+9YWcvMzNeZXoFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jp7jC87S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2eCjmPJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UEJa1735019
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Goy6WfBe0KdTPrja68NN4UJlaPm1q9rbXt8RgA3d7g=; b=jp7jC87SiVxFzFb0
	AtE4SWJub1dFt5r7cmp+Cv8dt0GsXYfSzqgW2KqDz8bUt/ayhpmTJynJnE7YCE94
	wupVjU0IErxI/+CTfoJ8gn4yamgEA5i5cbAUnOhK/wmsvahRznv7dNdZLvtUbIhD
	2K1prWpmUXPFKqGq2lJpFROROgILLfT6Q4WM8WLfvIz2gPEfYI6IsEvYiK5WOsIk
	TL99MTnE1crUoSId1B7lBfaQzCSdZiSYbS7MRrGBjqYdx+PrJZBvtBQxmd5V9CZ2
	YbEgwVDDevBeVGgeaihj4pAXginffdfZ9KqbzSy39bY79sF+mD3TMRe/ucS2cYIG
	NIWGZg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemjtkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422f987f2eso9039302b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694498; x=1782299298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Goy6WfBe0KdTPrja68NN4UJlaPm1q9rbXt8RgA3d7g=;
        b=I2eCjmPJQyN8xaAZHHYP8Qhm1iYlpFcWQ0i0E6nmzFtlzXv0F+uY53kLxO5BvQc4Z/
         jtvP3Ih5cEhq8obexuyImn7M7APhUGalUMnqdek5Er9C83wCB4kM0dxUDsmMU50/DyyR
         Ca16IjBDcI7LDkncP6rSvLhLs9Hcr/KLa+1Ft1QB+H1RMyzSw96iyZg5iFA1bGji4o9D
         idIIdYSFE49m5+TwRNglmie6WiTo35PS7nX4bdQKVdWnwK3DI4ruT2VWsDkATwYETfKR
         pfWRp1eR789sGYsrRQxYzytSBr3LLsAtSMlBobXC6mTjA9sVWZsujPNOr8cNkyUBDGBH
         rmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694498; x=1782299298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Goy6WfBe0KdTPrja68NN4UJlaPm1q9rbXt8RgA3d7g=;
        b=T57WgsQbKLV7T6WAKEXhc17Wl9J3tEhgYkjTT7WdCtuSnUcsAEodFSQvhR+7n/Qymh
         GVxWpCiahL5+PEr4GMTKtbSuogHuY7V7wZ/KVR/j6+L8shjuA08q/JJNk562DqjMaqwZ
         VV21WMaaQpVik6CPEejzKdw87FJBjVEUK/Zvag3AB+IQpMuQjr0p4p4BkXIs7gxGWAGn
         guccvb3OSmY91pMMSL7NrhhtsDIBpwDRgr7v5b/cYVYG3o3/PBCpUvCoPTg6jKOdKeG6
         Wf2osj7YRyDBwwljZNPoQ/6OrUB+H8M7fzlM7Un/GiymXhK6jQC+8jyHBnmdaRYuOC36
         qHCg==
X-Forwarded-Encrypted: i=1; AFNElJ+P57L9neCftsIsIYChsCPBF33lC0qW2uhYKLGbsSfw5tU3EhcwDkqeZ59Sk2Dc/oWJw8dZH7q+gW9rpyap@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Sxz1C00fPNzwRxiTyHDE0BOXrE3P714rkk0leWQH4nV2e4xN
	t+WtBkCXKY4viRu+avt9zj9MUaDUfz/X1gHa3j9TzEWV8+90rdJhmkGIhnjh6MDkF1YoSqP+D2Q
	lbkK5rq42IKmgYGFq8sUpfl4wxrLPzsVDGvenRTNZncAgsJSGI1YQx4Llg548HxwyvQe7
X-Gm-Gg: AfdE7cmBNk4lonNJqsSBxRfJ6Yajx9XS04cVug/1637Tp4wffYaU+wkMpGaApoGU8jD
	urkZ/P1VRim1dN43xGOLO1spMAAFUoTWIf+2ac2a4UODK53ZowqqTjvSQDLhEfI3OOp1F7eRfwT
	EP5BcriA6cUY7SWxHR2RxmHevY+C6/Qrc9y8LE7GxeH1Zlp1Bmb5/3QuX3w3kGm696JNDRnMjy8
	mHyIacz2srlzE8v4cOyuSG0nYIYZZCS1YIPs+NCUHiYiW+1K0FoSBzQYgrjk1jRTT4klKh2lf39
	UdzKj9siu5FPoEcRrF1/amHdxalVFlHSbPCsjX4H//XCdTeLXyo6Zw0Q5Hi8vF8GN10vzau5Q6F
	oGRjpGl5HG8K3KlHH9t19XxmH00vUmKSa1w0=
X-Received: by 2002:a05:6a00:14d0:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-84524556ed2mr3304761b3a.28.1781694497537;
        Wed, 17 Jun 2026 04:08:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d0:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-84524556ed2mr3304696b3a.28.1781694496918;
        Wed, 17 Jun 2026 04:08:16 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cf01sm15873609b3a.11.2026.06.17.04.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:08:16 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:37:54 +0530
Subject: [PATCH v2 3/4] clk: qcom: Add EVA clock controller driver for
 Glymur SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260617-evacc_glymur-v2-3-905108dacaaa@oss.qualcomm.com>
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfXxZkKRZYRtzrZ
 vhNyj3BLNKkl8g/ifNHfautXmtle3bPjUFVu0PceGYVaNG0XhTtaABLliSleQyjuErTHlwWtlpE
 w6ITx2oOLy3n/Vl/5tYJ3Pl0lt21ozA=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a328022 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mU7vPRoAUwN6OPuHNRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 7BoUKZFjeYIYzxd69tsBJwJ-Rg_sXhzi
X-Proofpoint-ORIG-GUID: 7BoUKZFjeYIYzxd69tsBJwJ-Rg_sXhzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX03G2t/BjXFBz
 3zlxjOP/7tdoXeYiewudOUnXvL50I9pvKjE6besdDZtpOnABqhXwhlZxhQzuZd+yHI/5de2gAOS
 uqaL1BB0lfz9C8HzLxtEtCCG01dNgD74ZmDWzeZum0SIgOLZme+lhLv0vfONKbLY7rC408+5RZd
 POCG9L1mhW8SZrbYJ/dje0N1AY7ZmnwIILnE3kuGAdI8QYU351qYXcIzT8gX8WlQyrcDHp0j2m4
 rF9XaUOVYubKDBkJi2zwzhlXsQ1iPJ9FmCGE6RVmZY1aPTByds82qg5viPuWNRgC0stCbm+0EPG
 hmV9u8ycCWXJtimnZsdG22v/HkL4JRGRQXNQaOC4eemOOsYqLMVWDmB6By865+nBATLFQAewqn5
 uG2av3+HVGN85SgKBpfcHiFwytrkfQ58wWBFZVYJpY2/K/zF9Of4W4bpMkvEHjKogfAOGtwak7B
 L6Wt3ozIyPWdE2jCGpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113616-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6656669902A

Add the Enhanced Video Analytics (EVA) clock controller driver for
the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
and resets for the EVA subsystem which handles vision processing
workloads.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  11 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/evacc-glymur.c | 455 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 467 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d9cff5b0281d8cc373b8ab14683370cb9b7f8bf3..94378d435162799aa866689377e4a9f1e96ab138 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -55,6 +55,17 @@ config CLK_GLYMUR_DISPCC
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
+config CLK_GLYMUR_EVACC
+	tristate "Glymur EVA Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	select CLK_GLYMUR_GCC
+	help
+	  Support for the Enhanced Video Analytics (EVA) clock controller on
+	  Qualcomm Technologies, Inc. Glymur devices.
+	  Say Y if you want to support EVA devices and functionality such as
+	  vision processing.
+
 config CLK_GLYMUR_GCC
 	tristate "Glymur Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index e100cfd6a52de9f88f11720d9c2043db5e553618..74761f2c767d9ce5988fedf539d80dc1393b4617 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
+obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
diff --git a/drivers/clk/qcom/evacc-glymur.c b/drivers/clk/qcom/evacc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..ba124cfc1a4def4c20962de03dbd8750b2d3f393
--- /dev/null
+++ b/drivers/clk/qcom/evacc-glymur.c
@@ -0,0 +1,455 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-evacc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_AHB_CLK,
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_EVA_CC_PLL0_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 840.0 MHz Configuration */
+static const struct alpha_pll_config eva_cc_pll0_config = {
+	.l = 0x2b,
+	.alpha = 0xc000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll eva_cc_pll0 = {
+	.offset = 0x0,
+	.config = &eva_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct parent_map eva_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data eva_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map eva_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_EVA_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data eva_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &eva_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map eva_cc_parent_map_2[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data eva_cc_parent_data_2[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_eva_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 eva_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_0,
+	.freq_tbl = ftbl_eva_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_ahb_clk_src",
+			.parent_data = eva_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_eva_cc_mvs0_clk_src[] = {
+	F(840000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1050000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1350000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1500000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1650000000, P_EVA_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 eva_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_1,
+	.freq_tbl = ftbl_eva_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_clk_src",
+			.parent_data = eva_cc_parent_data_1,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_1),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_eva_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 eva_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x80e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_2,
+	.freq_tbl = ftbl_eva_cc_sleep_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_sleep_clk_src",
+			.parent_data = eva_cc_parent_data_2,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_2),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 eva_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = eva_cc_parent_map_0,
+	.freq_tbl = ftbl_eva_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_xo_clk_src",
+			.parent_data = eva_cc_parent_data_0,
+			.num_parents = ARRAY_SIZE(eva_cc_parent_data_0),
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_rcg2_shared_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div eva_cc_mvs0_div_clk_src = {
+	.reg = 0x809c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "eva_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&eva_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div eva_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x8060,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "eva_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&eva_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch eva_cc_mvs0_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x807c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0_freerun_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0_shift_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0c_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch eva_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x80dc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80dc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "eva_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&eva_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc eva_cc_mvs0c_gdsc = {
+	.gdscr = 0x8034,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "eva_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc eva_cc_mvs0_gdsc = {
+	.gdscr = 0x8068,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "eva_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.parent = &eva_cc_mvs0c_gdsc.pd,
+};
+
+static struct clk_regmap *eva_cc_glymur_clocks[] = {
+	[EVA_CC_AHB_CLK_SRC] = &eva_cc_ahb_clk_src.clkr,
+	[EVA_CC_MVS0_CLK] = &eva_cc_mvs0_clk.clkr,
+	[EVA_CC_MVS0_CLK_SRC] = &eva_cc_mvs0_clk_src.clkr,
+	[EVA_CC_MVS0_DIV_CLK_SRC] = &eva_cc_mvs0_div_clk_src.clkr,
+	[EVA_CC_MVS0_FREERUN_CLK] = &eva_cc_mvs0_freerun_clk.clkr,
+	[EVA_CC_MVS0_SHIFT_CLK] = &eva_cc_mvs0_shift_clk.clkr,
+	[EVA_CC_MVS0C_CLK] = &eva_cc_mvs0c_clk.clkr,
+	[EVA_CC_MVS0C_DIV2_DIV_CLK_SRC] = &eva_cc_mvs0c_div2_div_clk_src.clkr,
+	[EVA_CC_MVS0C_FREERUN_CLK] = &eva_cc_mvs0c_freerun_clk.clkr,
+	[EVA_CC_MVS0C_SHIFT_CLK] = &eva_cc_mvs0c_shift_clk.clkr,
+	[EVA_CC_PLL0] = &eva_cc_pll0.clkr,
+	[EVA_CC_SLEEP_CLK_SRC] = &eva_cc_sleep_clk_src.clkr,
+	[EVA_CC_XO_CLK_SRC] = &eva_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *eva_cc_glymur_gdscs[] = {
+	[EVA_CC_MVS0_GDSC] = &eva_cc_mvs0_gdsc,
+	[EVA_CC_MVS0C_GDSC] = &eva_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map eva_cc_glymur_resets[] = {
+	[EVA_CC_INTERFACE_BCR] = { 0x80a0 },
+	[EVA_CC_MVS0_BCR] = { 0x8064 },
+	[EVA_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
+	[EVA_CC_MVS0C_BCR] = { 0x8030 },
+	[EVA_CC_MVS0C_FREERUN_CLK_ARES] = { 0x805c, 2 },
+};
+
+static struct clk_alpha_pll *eva_cc_glymur_plls[] = {
+	&eva_cc_pll0,
+};
+
+static const u32 eva_cc_glymur_critical_cbcrs[] = {
+	0x80a4, /* EVA_CC_AHB_CLK */
+	0x80f8, /* EVA_CC_SLEEP_CLK */
+	0x80d4, /* EVA_CC_XO_CLK */
+};
+
+static const struct regmap_config eva_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f50,
+	.fast_io = true,
+};
+
+static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Update CTRL_IN register as per HW recommendation to ensure clocks
+	 * stay cycle‑aligned when the EVA core is ON.
+	 */
+	regmap_set_bits(regmap, 0x9f24, BIT(0));
+}
+
+static const struct qcom_cc_driver_data eva_cc_glymur_driver_data = {
+	.alpha_plls = eva_cc_glymur_plls,
+	.num_alpha_plls = ARRAY_SIZE(eva_cc_glymur_plls),
+	.clk_cbcrs = eva_cc_glymur_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(eva_cc_glymur_critical_cbcrs),
+	.clk_regs_configure = clk_glymur_regs_configure,
+};
+
+static const struct qcom_cc_desc eva_cc_glymur_desc = {
+	.config = &eva_cc_glymur_regmap_config,
+	.clks = eva_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(eva_cc_glymur_clocks),
+	.resets = eva_cc_glymur_resets,
+	.num_resets = ARRAY_SIZE(eva_cc_glymur_resets),
+	.gdscs = eva_cc_glymur_gdscs,
+	.num_gdscs = ARRAY_SIZE(eva_cc_glymur_gdscs),
+	.use_rpm = true,
+	.driver_data = &eva_cc_glymur_driver_data,
+};
+
+static const struct of_device_id eva_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-evacc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, eva_cc_glymur_match_table);
+
+static int eva_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &eva_cc_glymur_desc);
+}
+
+static struct platform_driver eva_cc_glymur_driver = {
+	.probe = eva_cc_glymur_probe,
+	.driver = {
+		.name = "evacc-glymur",
+		.of_match_table = eva_cc_glymur_match_table,
+	},
+};
+
+module_platform_driver(eva_cc_glymur_driver);
+
+MODULE_DESCRIPTION("QTI EVACC Glymur Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


