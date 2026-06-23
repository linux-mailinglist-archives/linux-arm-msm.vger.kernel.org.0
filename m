Return-Path: <linux-arm-msm+bounces-114168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8YHqLAdmOmol8AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:55:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1526B667B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:55:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BCMCaTfS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kCY2xdey;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114168-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114168-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A374308A62D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAA63D0BE9;
	Tue, 23 Jun 2026 10:54:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001F13D093E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212067; cv=none; b=WW+/en+c+o5C6LgoOnTabaD4hWfN1v+QSVG5ySBNRhcjnVXIL51vnuD9syb5UEOqLCz67N5toqcu/thAHvv/9p/+L85iyqU8jajJ5O8aboleftK2+SlVX/TFHPlIktFGrTBgk2HtdNMguBBTNnKL5e+6fsqynyDWeN8XzH8fpBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212067; c=relaxed/simple;
	bh=bbWtU83+E0lxCYxjPllAAq0uNIiwu05NnGRfi0Uh9Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klJ1IUIp4JXSpT/IK/lVUPzpccy4B5QB+5yNND8kpcSfejy8XZ3lqtXBw4CRFV9NQV8ofbypDum/FB/bw2MB/1poCndKmXh4MdRRKyYfu/GrWHl0TTtz8/iuXlZXeNGL1tWyhXCH1wCdqvOVoYOYXH4lG3hzOPHsKIIgZsIL98Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCMCaTfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCY2xdey; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsLJK042140
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHsJjUQonrIrxjhLdwVtbSnLceMyJZhxVv9QeQNe47M=; b=BCMCaTfSdrCvVyJp
	2tNkWiWqtgbnhsin8XmIwgh1/R70wu9VCw3tj9j9Kooq8vAUHtQN64Z6DTrxNVzj
	5hesRF+cPXXr8rx7irt6zEYRspwH+6cO5LhyeSj6D47TiM1cgncjf+RJpZDp00lg
	5O/ZmBXeLbpF7RUyNR1Ihn7d1xOnbchihB2M6/KpE3JV1968pbmrq+J44qP6HzzL
	JVm9guMQd3ghA6bsXRAsg3VdyOtfUqRV8yyxDbBodxqzgNnYeHwM2twqqfThdBfl
	rUa7C0G/MQrc88Ibh/Q5vz51ltnGecMdqK2rW7HxRziPI1w24gmuc3CGiX9e9eaX
	+vWrCQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr32068h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0532a6588so48704225ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212064; x=1782816864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHsJjUQonrIrxjhLdwVtbSnLceMyJZhxVv9QeQNe47M=;
        b=kCY2xdeydjN/0WSotaf57NRdYo5ofKv0Xzpwe04SiwtjCnf6ih0HiuWBpgdNZyk7d3
         m9kZVsyJCETpiPmuVlMlb4DCX4/aZuAFU09WxSbQzOxmMp0SVdHd5CQDr/Yw+WmqVkbY
         ylwd84/I5rdYFL+j1YXPa/8UZYTAD5yO7gCRG/aWHUKdOA9N5LajuQ3XFx65c8MRtebP
         cvs10dp7k3fe3E+spXtFiKHKOqohdYHu1PA9E+jeZqlLT7arxQX13HZNFbEdIYeLAPMd
         fZu+n99ps7TNIVrhBX9HmzQwx1GdUsoY4KplxautG/DDkHrDC9XtNimZkXok4r2vtXiR
         hqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212064; x=1782816864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHsJjUQonrIrxjhLdwVtbSnLceMyJZhxVv9QeQNe47M=;
        b=FWabDfydC5fXZqp5bF/Rsd9Gm0em9bBWPXgFEmBEugZ8/UaCr3OcXnGsVSx60upD4k
         wP/mTJKl3IFVh7jscJ+SY2NTKL+ttaqFPkRiPSuT4ha0O9a9Mgp6hMdB2XTj+UtQg10h
         s8Xr1aQa9JB1rCirMYCvl3i479uBy57Rfso6cHhksPv6SK2m/cHHG4ResSZoISIhYIol
         Fj4aXOFMxHY8zlWGb/X1nI9SEtBllGTGVHSEn8YCXjNnzrt8GVWHx6M0EnXWnPmUZ7TS
         HhnDhxjbtTia3hQ+rpndLsOSLH4X1i3CvExDcrKwfLRNQ890AjJI10cLf8dTniHXhveZ
         8dcw==
X-Forwarded-Encrypted: i=1; AHgh+RoolH7je/gmBAgg1OqWQ+8yk4NvQCt7UjmniRkn3vaFnCbz0/sDcmwjLKp47WRzSvfD0EX+jAHGg21X+9yh@vger.kernel.org
X-Gm-Message-State: AOJu0YxEPgZshlNkzpsTf3o4K/U/apKCZ0CxMBpLuaaLL5lyYPLHpTbC
	LXB9i3qJ/NBihWXwKlzgN1b76/wi8UKQVPwU/C+6YsTA0Ky2xRYPQy4RONZU7C2hvqhSgum76Xp
	MffKpfJTSmRGpGpuE6B2TpEzIcsvH5sOuhDLvSqXCpP2/5lqFP6F5L0rCPyJm8JneFsmy
X-Gm-Gg: AfdE7cnd2CvG3tvQ315Q7NZkVeA8krWsBYS4kps/OIwy0LGAjsrykk73yP/5vX6/Fv5
	bpbSq3qZFoahr2T0hGVt55ACIdaaA6HHMmbk87yO6N6DcghAFZ5/m4lgbaOLXQmpLEiRWml+eGY
	VWlnFdQ5Q6wC1wwMwLwVs6Hr3DotP83++r9ipT20tya6l5qlfOigVPMhsSEZvDhEeLlnBh2Q39j
	7GogO7bSbY3MPu9jgIeZWzdqJ2bu8KTVdBL9SV9M9IYA+jXmXmwV83HMbwH6Sz2iotoTpxvxR7F
	Wxb8S5DIKSAzJCx7YYtKjIjJ7eNN5gYM8q+KNVKGK8odvnPcShuY0pfeTmbQ87V/6eLpxo1au65
	edXhAtFQv4c1B1qK0LWtw8zUl/NlVUOWhTws=
X-Received: by 2002:a17:903:1106:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7c99df0fdmr20220485ad.24.1782212063971;
        Tue, 23 Jun 2026 03:54:23 -0700 (PDT)
X-Received: by 2002:a17:903:1106:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7c99df0fdmr20220085ad.24.1782212063513;
        Tue, 23 Jun 2026 03:54:23 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:23 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:24:05 +0530
Subject: [PATCH 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via
 critical CBCR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-nords_mm_v1-v1-2-860c84539804@oss.qualcomm.com>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX3Flf557wlbUm
 25NhbcLScO5lqL+EwgDyAycvNZxDbS9JJGsMUDSlDmJl+urUfGQeE2wE8W6T50NGlHd+FAHZhv5
 GMImQsaSgnu3QvXalXqLB29DaYwMNrg=
X-Proofpoint-ORIG-GUID: jCIM3sJjEBTeHQ2zqUALit2j0fooPR01
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a65e0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mEVXwad1GdBeBoogAroA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX2FbFctUw663K
 o9qwXgvYFVmXaslEzbzuC2vHiCRIIUwkthSBE7hXmHkIV9e+6tSwSlD+LKLjKK9seTkGo0EcHIE
 dNPF4/pBvtBRa4/WBUATA7/RSSnuiiTuOZ5iH5I5e0o38UFF7NIqpUkvkEQIWBJNNdgELMtxawi
 5gsZzhLEQrkb5nnbBCXgCRExVWXgN2lwt0BGW434R2XuVoML+UHHz+amCp4paYjXaHeamau0Ju3
 Dj0cY/Mi+MthzEcJ1uh6yWADNuvFe65V9slbL7mrqzrCTE5SsFVppK37noDpK9rGth7MB4y+qQS
 FpnIP88otQGB4cVFQRiCjbq3lqHn1+EuXumTv38coTNV/kq1Dq/8pZFF6hXUYXFXzpE4DENXqN+
 fhJYFwVK9gxixDF41N8tlS8lTDhr6rQak2oJXu3dvrFqbvKmeV3ZMH5eYDvh1N3N33V6whvTq9C
 xS3HpKrH6R5ekgyGniQ==
X-Proofpoint-GUID: jCIM3sJjEBTeHQ2zqUALit2j0fooPR01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114168-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 6E1526B667B

The GPU2 CFG clock must remain enabled for correct operation and
should not be exposed as a controllable clk_branch.

Remove the clk_branch and mark its CBCR as critical instead to
prevent unintended gating. This follows the same approach as
'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
Qualcomm CC drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 2e653ef0fe0e304f09ed354d5578fdbed9151d20..bc4d478d5606ad7478431573f98b62f6f9b7d9fb 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -952,21 +952,6 @@ static struct clk_branch ne_gcc_gp2_clk = {
 	},
 };
 
-static struct clk_branch ne_gcc_gpu_2_cfg_clk = {
-	.halt_reg = 0x34004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x34004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x34004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "ne_gcc_gpu_2_cfg_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch ne_gcc_gpu_2_gpll0_clk_src = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
@@ -1817,7 +1802,6 @@ static struct clk_regmap *ne_gcc_nord_clocks[] = {
 	[NE_GCC_GPLL0] = &ne_gcc_gpll0.clkr,
 	[NE_GCC_GPLL0_OUT_EVEN] = &ne_gcc_gpll0_out_even.clkr,
 	[NE_GCC_GPLL2] = &ne_gcc_gpll2.clkr,
-	[NE_GCC_GPU_2_CFG_CLK] = &ne_gcc_gpu_2_cfg_clk.clkr,
 	[NE_GCC_GPU_2_GPLL0_CLK_SRC] = &ne_gcc_gpu_2_gpll0_clk_src.clkr,
 	[NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC] = &ne_gcc_gpu_2_gpll0_div_clk_src.clkr,
 	[NE_GCC_GPU_2_HSCNOC_GFX_CLK] = &ne_gcc_gpu_2_hscnoc_gfx_clk.clkr,
@@ -1946,10 +1930,16 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
 }
 
+static const u32 ne_gcc_nord_critical_cbcrs[] = {
+	0x34004, /* NE_GCC_GPU_2_CFG_CLK */
+};
+
 static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
 	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
 	.clk_regs_configure = clk_nord_regs_configure,
+	.clk_cbcrs = ne_gcc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(ne_gcc_nord_critical_cbcrs),
 };
 
 static const struct qcom_cc_desc ne_gcc_nord_desc = {

-- 
2.34.1


