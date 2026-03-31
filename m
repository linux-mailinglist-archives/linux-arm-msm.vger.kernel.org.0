Return-Path: <linux-arm-msm+bounces-100921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFRwKywYy2lrDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:41:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A4362C37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EADC43093E1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 00:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3564C2D9EF4;
	Tue, 31 Mar 2026 00:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfMjOiFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaytB8mi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7126A29CB57
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917320; cv=none; b=PyOU0ksFRKeeOoM+Nu5RUo/eqnx92u0Qptc7n3jOS1vLzHOX+LmpmcS3zCTc6chET6E0pGdc0THLNdO6vrbbw/Z0fAQKvy85zs85vmOjR6ax5vRSEG3PRXmI0JqBUgBuvwT/8NsGtIA0OAfrxnmicQ82JRpdQ9VeOuMKVakmfdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917320; c=relaxed/simple;
	bh=dvTz9pJnz/6yW78RczUv06dX5VWsbqoJiYlp+i0Azwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cg3swU+YvoGPs+N7Po5DYJuVnC2GkM+kEV4bQywNmfd/pSEPBUCYWbfph8igEeJYSdQkTPD2mzu4SQu8eJBJWsftwDztTwr/u0lm4q9La74XChLo2nR0yZTuRBRYPVw/JVekMsVu1f4GX10W6YSONbyj03utIGUV3jOy6JJoBr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfMjOiFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaytB8mi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMYJRd2391623
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p56ol0FuHjmlarHhQHfqBzfwDmn8lvfqmM2KRXHkKZw=; b=mfMjOiFaAStTEIyZ
	AN+EEFYreoWuCSid0q9bqDblC9bRBhbuBpNPkY1pI2y1pMAR2vVlOpxhZikLXqOb
	Sg3ltiwy7d/B4XMgn8Mn2GUq/HQdd+g2g90WPVowYg4puXb9Y+Q+HvN5ny5iqQc1
	DtCRvMxgPal+m07zZc7/xc+DejjCTf9WM5zRmuvRyJ5iw3ORWcCuvOScZ5VUwvzR
	vPeR4xepml1fENk6dqki4mIO+00pQ4XoFCA+h+kvL5p+3mZoW34/x5Zf7+wwIh2q
	LIGrMyPTjRWII8PGIzyHo3vtwosV1qsVd3ZueIlsN36MOwG7HtjRl6FuwQ6Z43vw
	4CPRdQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7hxss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c5b48baf75so6785906eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 17:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917316; x=1775522116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p56ol0FuHjmlarHhQHfqBzfwDmn8lvfqmM2KRXHkKZw=;
        b=XaytB8micYFEAzVeVGDvJ0TyyqQDMG+FgBX1SvGZRNHqCeVeFZyG9vxW/d1sd6NAvp
         RBC0BjBR5e36lGQ7C71yN6siARMYU1hey5ZxO7UAwzeGhSrgoHXV4EY0yFqrzG183UW+
         UaIW0YphwVYIA/P+hbWbebhfgbHkX/Z8sZAiuMzrGb5nIK87u7eV1Se5KGat+LXv7a6T
         jZVAY6Z8dFdT/RmtOo7sVnXkaGJxyug1rhOIci9wrV47+MOY4pLqO2pYoTu6S3fDydQU
         6Kd3wLLK/lWLtJ+hPMaSeqwkQGTvD4uA5b6HC8+YgwVv28DcURllASD9TndoM0+FVXOq
         z4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917316; x=1775522116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p56ol0FuHjmlarHhQHfqBzfwDmn8lvfqmM2KRXHkKZw=;
        b=RflrV8ze5//SsjlyWd37uSzzRGldssJf92j9iKjh7asGnRVCCzbem948+dZumggU9v
         bitF9FoubRKajzqQv7ioUrBVZbayVHdWS5ChGv6UaMyyrvYTOR3OG2/LU3I1wB0rg5Cx
         VXqHBfHhemt+qruqgrLQqnl0ZhN4mSwIvXJ+StRWL5Nj3w3T4RhBH4IyjLbPjLKATeR+
         lwTciCzG4qZL8EP92h8W0ADtOItHa1V4OGThGWcwAqhareyyV9Sfb+r8b0b/OvoXEUU3
         KrgI5A0ie6xYGJi1Pj/dCUI0yhd8818agWGWpIzSS1enlVPTuXFvkXjSLxDmfLwfftQC
         JOSg==
X-Gm-Message-State: AOJu0YztzT/KYLVP+n/lnSk/nGaaGDjOhBgIdyffZRUmrth7WZQ1HcjH
	6P/+MqEuEVtuLd8TMLlJjHuipoIBTlMxux1gg9wkCgLxUawyCu9dbffQLBwqkrzJVROQb9A/aut
	HHEOH3qBmu1wlso+87ZlmaDz8KDMWa5TV3X4NNV1o55Aup0SZaWfTj1oGOOzyDxYxVs/nK3Dgof
	Px
X-Gm-Gg: ATEYQzyUthE4DTwNZVjGB8aBngECccvSe6yQ+ZD61DDycKv/wcnEyUYljU+MKJNS49m
	JARovDl2oel2rRWELhudqkGbOb/Be1nBoefxpz6dVZxSADMDh7RcuCuMFuZt87JgsD55FxYZr+b
	hFIDTtNOzAQP2MzoJXbGDqrJHkhOglJz5SB8PbGpVJ5VkMvGuOyfSHmdif+D+MbUYjzCcHSH24y
	KbwXOnZNRx/maUmtbzX9EIXvwuxt/V8J7CplKdB3dKTG8CozKWnOHu2W3IysdAuz9/ct29sse9L
	N0qZc/xnWdYcpMmBfCL6hs7O/Se8b10yRQ2XSTSPnKpiS9PgfD+sr8jAMio06P5glvRPsB3F2+9
	JFUcYYZC1fgSE1rfsqmJJ7LHH/9Mh+NspYtvS/I5YGq+PxqIS4QxWroZZf1qHDtX/bdFW+uKDRH
	51
X-Received: by 2002:a05:7301:1294:b0:2c5:76d1:7f95 with SMTP id 5a478bee46e88-2c576d1bbaemr4673549eec.28.1774917316065;
        Mon, 30 Mar 2026 17:35:16 -0700 (PDT)
X-Received: by 2002:a05:7301:1294:b0:2c5:76d1:7f95 with SMTP id 5a478bee46e88-2c576d1bbaemr4673522eec.28.1774917315528;
        Mon, 30 Mar 2026 17:35:15 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:15 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:35:01 -0700
Subject: [PATCH 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T
 PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=2840;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=dvTz9pJnz/6yW78RczUv06dX5VWsbqoJiYlp+i0Azwc=;
 b=aN2dhRKbA7AEXirzTPHtVQQAafPxYBZake1aRDjykgzIB6yHNYW9QBB0GvKEag88o8d4lgukV
 /A8VHH9ZaHsBo4lp/GwPDMedg7XBLjXFKmzZt/VYuDxJcRbBeyuzKlr
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX/dpnL0u/kRM+
 tPQDi1CJuxl0X8aw9ZlAeFuCciwEXggMNh6NtpiJjEOKUoAIq8zYpBSvRdr+zI9plBJ+ecaBXS9
 vnRIfP8dkSqa15r6d7wrgnhbd+NYR4IedfM/bgY2KQH7FQc1VqMFhnn1v1YuLOj1YSUWykDtNTF
 wz7VcVC5mhL71Li0jqP6qe+CKEWxComPgNByqxPyOgNB9d1Ikdmo85iJNSr8/pshtBWSqM6Por5
 Kuxo+xnQo2RmcFr/7QVvJsN0ohX4yk9l/fva9T2mmgDLSSXZwk4SBG6k6K84WlNAeX/E6VdxltQ
 D2cCuoGunqYLCsYLO5zFiCj2ewIibFpmnzEHQ80s37Czl5SCCtbRFNG8Uwkb1JKjiF3s8wbHiV1
 ynL3iqMjovIaqA9o4/5aW5V3x92GIHSDwzhu3TTEK44tkdeiSb9/Ng9ogCeomUZpH6miaFgxtPL
 25TukmOH7/ELfhsIxtg==
X-Proofpoint-GUID: kO-eWNHgWNoIKIrQ8wYr2tdTT-f6kpQr
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb16c4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Xwuga8JxpJPgM73N45wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: kO-eWNHgWNoIKIrQ8wYr2tdTT-f6kpQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100921-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F4A4362C37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clock operations and register offsets to enable control of the Taycan
EHA_T PLL, allowing for proper configuration and management of the PLL.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d334492145..3a2157bebc52 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
@@ -198,16 +199,19 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
 #define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eha_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eha_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eha_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
@@ -246,6 +250,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 	clk_lucid_evo_pll_configure(pll, regmap, config)
 #define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eha_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1


