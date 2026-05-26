Return-Path: <linux-arm-msm+bounces-109719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCINLwEwFWr9TQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:30:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E545D0D6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCD28302F389
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA643BE632;
	Tue, 26 May 2026 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OA+h4Gnb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4TaYNaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E2730C16D
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773404; cv=none; b=Ysrk3ZNUC5MxsuzQGO0Jq7nZCjONSqTcbyQw4hYv7z1MchyRZsqjLAftvuCjUbZ9k+UdTuHeDGAvRF11MNXpHYwejkEYihtDS281uZk02fcbi2Klho6PQ6LzqpfZwfuzdlHTXHFwLlkvYZXEzZdNWje0dZk7fpiXAyfx0NZMdFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773404; c=relaxed/simple;
	bh=uSJLF7RNJtZ5PlwbCa7e1h6aBxkEzjFbwa9KTWahQDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6jy4dGNRcgcNQaL/6KqrhtkODvmMD0BhoRofCxiafc4z+PqlPrICwnRo3RH29rAEVAh6cgT/wgWUVREixzQA7edTfSa++lzONWAie3AOqDLYuLUexBljKxNJOmS0x/2lIYX2O0G6vi9WIVNqYATBYEPEVJn07YMYhS29w7NYyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OA+h4Gnb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4TaYNaR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PJhSap3263556
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8rvkZNUxGALVC/TVnWmKKOdJ6HzDEfUiUd21M/kwiy0=; b=OA+h4GnbYCN7RNQ2
	wM7/JhMyfizCJnLviygI24DcoeW54AZWOI1wiF6W9s8AGs0jDpvfrp+KdRzH7OWT
	ioEX7buGcK1GiGyzQRkDzTywEeL8of8MOQhEi6nFBXZxBq2/MT6fZL3yoMNzFENX
	195wb2+B2ZG9mt+uuC6vTCZRmLNzrYwS7HWmbKS47sWi7a1F9jZCaVZ8625a59hO
	8uA3LhCu/INcaFw4FhYjoOnt9O+kNfjY7uFIe8bOiPawbKoirJVcICV3Dl0lLx1S
	xp423JaV+A0WFS6Nc07f0iYsx/wN5oKbTwyAJVe17Mief9HuDxQUmgT6foz+/BER
	XbrOjA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs2ry2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b7aba0af02so97060135ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773401; x=1780378201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rvkZNUxGALVC/TVnWmKKOdJ6HzDEfUiUd21M/kwiy0=;
        b=S4TaYNaR0AVOLrKcFArO8eRBnIBRZkhEshyUpjEOhTgbLfmljiIVziG5mrYX8pY4Yt
         AMPgnwJA9Rbzk8UdxFo5aIeTx3Zgfxqlry6u1IwKDlL0gWR9pPFqrs26Lly0xKDncEFJ
         pyFqDF8b+DyltNpquJttSRy7ZMuWcfINITjGcK+KtvIB6oulTx7ScH1KH6C1GBg+zTh6
         8VJcZc8KjzEwTtjZzT4/N+1dLIcp6HJHdyRp7vhbxbO2MvwP5bHvpKHB0wbFwpMLGBdt
         N30SJtN6c8hg50kJjS+C34J5zB/aI54LH2Et+iVDQ29N0Rnk0EgdV/YYNJ9PXri1TuyK
         9M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773401; x=1780378201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8rvkZNUxGALVC/TVnWmKKOdJ6HzDEfUiUd21M/kwiy0=;
        b=WBrRNg9JtDm1nTXu4u8jkjabJTYAJOf42omBm8A0ylntf64fprc8de26fxXzn2PvET
         L8Fhpu2UPnmy2BysqenFWs0QeOQkUnvtuQrorSCGSVr0oGOIFhh1chIbrLpvHCRmzjSY
         rEldajNUl8kPmrMH9abDvp6wE6OEz58qyutTJOdOFoAMwe4aup76BIqiQX3VPEjQAhU/
         el0vWPNadwGq4o0eVd+yYmVd/72LkofCmzK3c0ZuxCnV9p/A+1Dlx+8sopI1H6CNrpT6
         5mKdkVced8RnOUC7iLPjXR8fm9+t67bMJue8QaTX2J8h3adMBXB6ZBNzk6sCcjCleDyL
         qNuA==
X-Forwarded-Encrypted: i=1; AFNElJ8BP6xW0pXBtrGDnDlS8f33MmAPXDc2MuB5AWn5kMGhvKj/KZXjbqSQMGu4sytMbX/ybpwXrsgjuiqc0BKl@vger.kernel.org
X-Gm-Message-State: AOJu0YwsPnWE8gcxQ1ShnQa9nTcH361xwqLjPZOnGc2db+cu8ifFOTWe
	Ejr2AB4gZnEIoB/nU2QMkJI+ziQ631iqvFYnz0XRIBZ8F7SMiFHja6V277pH0tMjkT2QXpekcTZ
	tG411TfG8TKkCAdf7vFxbZmJZqyHdfnPA/X/owbPJpUJZNho82rTM6pOL31cTHcBbYpEo
X-Gm-Gg: Acq92OEoSLkC8SsesOfUixiDomd0N8xCRKA8uJW3Grh+KlG46JCgH54LJO75T085L6C
	sTX+Pcitp+ppkXj1TF1CZhRo/7IESDmPKG4xhBrfv8cmO34g2DJln0sXaE5xSpLk6nsrF1AQ6vl
	Qqm/DFrsOYKWv8VGFH0RWz2/3ohrOteJrCW2MUQXbOvyGOWlvWlg+IRHsn8BSbNTY89aUe7K4cW
	0b9Q8rJYSn5wuKj/c7coSIjWejgFpsnvMzDqw6CiKc65Tc2tiad7fujsK6mFMKpMG5I5/BUj3/3
	wo8Y30PMazbsXxkhXUczp3Hjfi6m2eXbDrnalpoCAPvNiIru0Bx936rfIToVdLNDanK6NSlK9Dn
	EtH0LL5h08onuiSTWTPRX3ksF63oWGBu2joiqt1rgIzA33g26P0xC87BL
X-Received: by 2002:a17:902:fc85:b0:2bc:f202:54d7 with SMTP id d9443c01a7336-2beb069e6c7mr187181005ad.38.1779773400848;
        Mon, 25 May 2026 22:30:00 -0700 (PDT)
X-Received: by 2002:a17:902:fc85:b0:2bc:f202:54d7 with SMTP id d9443c01a7336-2beb069e6c7mr187180555ad.38.1779773400370;
        Mon, 25 May 2026 22:30:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:30:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:59:44 +0530
Subject: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a152fd9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6SqLyIFWvb7f5ISMJ2QA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 5ygB5-U0I6yVXGYbOAERBAzpTzm-D5js
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfX7MVIMO3wty5N
 iQxM1tgIHGwHxFiGF3dlQXEtF9+mmlBiio8LUxDxn3GWa9/tte0s8nJGnvFig4liKyqU8j1hecP
 aFLqCO7HAZFxP4i/3EJrrwxOkpMxaO8dM5MGteBu4f89TAWyvUHsqecgrzCoKYay51n9/GwHk2Y
 IgZ8OQ+qrtxnxjQVUMm8G9j4CctN78cFE6IM9vdgKuVJguY6h82iovycHGkwBNPFDl+H5APVKlz
 6I/utM6dbdSvOnKt7gzLxN1QWbs9RcwEfSQ+qfyS3ZK4u6UdcB4VPnbRqToDkqARjp3q5CBVHOF
 0oF37/oJEZddawGQWAyABIU0Zlvyj5/i5C9IXbQBHvnKJ1MFCROpODD4IP3JzziopO1l6OnggtZ
 okW69o6BnsxmuSBNv0U8w4MD81lkWuvq9uj70bCsoWdL7U/Lwlw06/TokAOYjXYN+KU5K8+5UVa
 jdDTcBTP5Rx9mbt/7zw==
X-Proofpoint-ORIG-GUID: 5ygB5-U0I6yVXGYbOAERBAzpTzm-D5js
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109719-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52E545D0D6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
registered as standalone GCC branch clocks. Drop these clocks from
the GCC clock list and instead add their CBCR registers to the GCC
critical clocks list to ensure they remain enabled during early boot.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 2736465efdea9b3cf9ec945107d4b002e123b59f..32d23bdc819b7a62472f2a1ad23c9c8a66cfd0d1 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -3669,21 +3669,6 @@ static struct clk_branch gcc_disp_hf_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_eva_ahb_clk = {
-	.halt_reg = 0x9b004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x9b004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x9b004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_eva_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_eva_axi0_clk = {
 	.halt_reg = 0x9b008,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -3714,19 +3699,6 @@ static struct clk_branch gcc_eva_axi0c_clk = {
 	},
 };
 
-static struct clk_branch gcc_eva_xo_clk = {
-	.halt_reg = 0x9b024,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x9b024,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_eva_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gp1_clk = {
 	.halt_reg = 0x64000,
 	.halt_check = BRANCH_HALT,
@@ -7993,10 +7965,8 @@ static struct clk_regmap *gcc_glymur_clocks[] = {
 	[GCC_CFG_NOC_USB_ANOC_AHB_CLK] = &gcc_cfg_noc_usb_anoc_ahb_clk.clkr,
 	[GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK] = &gcc_cfg_noc_usb_anoc_south_ahb_clk.clkr,
 	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
-	[GCC_EVA_AHB_CLK] = &gcc_eva_ahb_clk.clkr,
 	[GCC_EVA_AXI0_CLK] = &gcc_eva_axi0_clk.clkr,
 	[GCC_EVA_AXI0C_CLK] = &gcc_eva_axi0c_clk.clkr,
-	[GCC_EVA_XO_CLK] = &gcc_eva_xo_clk.clkr,
 	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
 	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
 	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
@@ -8545,6 +8515,8 @@ static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x71004, /* GCC_GPU_CFG_AHB_CLK */
 	0x32004, /* GCC_VIDEO_AHB_CLK */
 	0x32058, /* GCC_VIDEO_XO_CLK */
+	0x9b004, /* GCC_EVA_AHB_CLK */
+	0x9b024, /* GCC_EVA_XO_CLK */
 };
 
 static const struct regmap_config gcc_glymur_regmap_config = {

-- 
2.34.1


