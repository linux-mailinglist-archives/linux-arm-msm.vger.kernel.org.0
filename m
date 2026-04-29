Return-Path: <linux-arm-msm+bounces-105264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPanJ2078mlypAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:10:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 708BF49806B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8334E301F3C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D4B413258;
	Wed, 29 Apr 2026 17:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEY9tahK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kk63e0g7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4ED413238
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482550; cv=none; b=Vo3mXsDa9wVWIlAghWrTAnl3zoBi/V/zjBd4ba05v7+CMNUnQfVw2uGpJeWzlcrnoxeRe11EbsRV+6EFuE2laoMWCHmtnCrHskv9NJV+Ugh3gSZc3F46nDuU6gsxq8zsEgaBl0WiG2VR+urCyFQZgz8nqbMXiZ42mvg6aczRgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482550; c=relaxed/simple;
	bh=3ukGjQkgcOyujuxOwfozhWdE/4CyKPr9Iuvtl55GFSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EeJmhSkJmmVz6pUuehpsS8MjTE7zN2O/DM6L/MmLcBjof1qy+zDLtGkMYt8lDOY+CAyP1VLrfeSTUprkIGvAU0EiKgr7LNAfvhfP4d5JYsBIf3loBJnE9npQR/BdtYx7lvyTGXap7d53NYxXStluwJKZ1ho9bRHgDF8HAORo1QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEY9tahK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kk63e0g7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFRXWg3752372
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IQVFeLQXqpsYVFcqmblWt7Agfv/TcKUA8DG
	WTFXWnf0=; b=NEY9tahKmvNgsybfATUZaOkNEhC7fOWNN1qSBmagwuLfbtIBL8Z
	f6sG9upgftfp6fHjQcx8Ng/PfqjmhGGRFlflgNoJpRysLP9kwW9CQgvnZuIz+blG
	fldmmc9lCdnQXCHe24E4mbrQ/4kJiM6Y07wf7xzA3Sa56fhI4EZsSKGkyth6umIT
	HjFPPb5t+x7DKmXkvjN14vpi69U/oy28p9QDVAGOTtXAJJYRvTa1OlJvBk4j1mHE
	cGjVLqcU5sRZUEjQOTPQ8Et+wBFKT3ZU0Qx+/e1sAD6CO2SKtiMZJFSSYTuPNdxO
	8b5doezvob5U4VpeV+15saSETDNd+Q5npVw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1jp5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:09:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56fb91588deso31826e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482547; x=1778087347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQVFeLQXqpsYVFcqmblWt7Agfv/TcKUA8DGWTFXWnf0=;
        b=kk63e0g7SOoKNReW4Yhz6W65udjO8M6t5mY7KUcyD/VmYioFdLB98eX1Wv06/QFOdK
         M126HfMbUhS2InaOT0LcAwclfgxo2jPivycSq/WVmg7rDLUJHmFcNUv1k1e6gDFewFrd
         GjiMZKSJFDwMCR4dohhsLfy7xHc2E3OKyQ8kazqXl08iAyQsDkEeEgvD1Xlq8AGmBlRL
         C5GBTmSD7KKfB3LQE8DsVr+rBxhx3KbTZLh+055wlIVNCkVSHxRtDyvNUHeCFXCbilU1
         LrTeuAl3BeiHMRz6vR50J4CB8XoOX3y3Jfq7H5ohbvVdmHzQeNv8prVnz9Q5/7GfdQ3m
         HHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482547; x=1778087347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQVFeLQXqpsYVFcqmblWt7Agfv/TcKUA8DGWTFXWnf0=;
        b=Vq3A5dg8SgfoNI2s8lW4pBwaV2AgYfN0MAZFc4ioRgeqoJvkfkbwofw+Z42DyUjZHn
         916iM6IrZ5OiPdYVieErKCXEUyaX9nzigX0d54GZSVfTA9fyz9busWRXd6Ln1CX+j995
         mmcjNJvaxjhsRr6GPJEfBXTkhGhDJd6AWvimywfwk1CB0UxdHD+BDAF2R9ZS6clBDMWE
         sALGhxfg+I5COaMEdzUlLd7yuiYvn0bQDE4Q2hy4kaWQ2v3MqCYhX19g0u7qfhXgJ3dj
         1xLiI4uckss7tcabxOWoRuWDyKdnaRSQqLsEpcrwdK8V9FqCRJKLvbh3TuilLXUCQwpc
         /zDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TBqhsUpbMs71bWCEsDGABkhTJI0/pPeGH1HbZx4fL6pK4yuefwyCDlaISyLQjEufNKAx4s1ogaXWQeIom@vger.kernel.org
X-Gm-Message-State: AOJu0YznvzIr+uaQ3qtmxevnbsBHJT8a8xK29JtgsC4R+j8sQPXYi1oQ
	7UzTKh0S3bNudKuQ58I6ZFIw8fgZJtxP4J1dp0VAbFzmMV4IRpsmyJ2e+sl+2Tchol/VpQNeWtl
	hltzFq6/4EJR1qq/Ej82chCdP+tsIwVxOXFj74gYdji4NJbxnT1+uIudNBhNVVjhQGrJP
X-Gm-Gg: AeBDies3w1F5Cp0trvAF0vlnsG21G8FEIM45+Gtpf14k1kegeGDD9Vb99p68+Eg81Zw
	+86oxfvZvB0GFDztMAgDYir0vd2ZfuZWU37eqQ2pTsxs5oBkAjv0siKddqctzD2eTMU5RRRvq1G
	10PejxFc/Owpwb/F88vqn6UznIbbzPh8C+XB+o4xLfpqUNW6Pk02oS2dzZ1kEOYydyEuf9rHq/B
	bIDtwlRct5fKxdE05XhgkjMw3BTMe7dNGHt/rnGkTeNXFB8V3WcPB37IPz82ZLF6KyseKs7NDlL
	QgVWuNnZsJggQAXEt0kYO9ohkyD28QziGNv9oqXG3omm4d7Miz62gfaijUiYgGtwx7KRdMKUo2q
	RB7ks2Lx0vSqjS8/AQONOSRF70fGYLQyqSxcnrRAXhPtcHz8=
X-Received: by 2002:a05:6122:3906:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-573a5518300mr5157032e0c.1.1777482547005;
        Wed, 29 Apr 2026 10:09:07 -0700 (PDT)
X-Received: by 2002:a05:6122:3906:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-573a5518300mr5156981e0c.1.1777482546589;
        Wed, 29 Apr 2026 10:09:06 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2e8a6csm34918405e9.5.2026.04.29.10.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:09:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] clk: qcom: Constify qcom_cc_driver_data and list of critical CBCR registers
Date: Wed, 29 Apr 2026 19:09:00 +0200
Message-ID: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=3ukGjQkgcOyujuxOwfozhWdE/4CyKPr9Iuvtl55GFSA=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGnyOyuhJa45RXpLwBFAxFyXQGDPy/qEtUf7O9WX16absaTHh
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJp8jsrAAoJEME3ZuaGi4PXGz4P/iBB
 uJxcX03jzpzBvBiMpskZ7/4uSVzThalMfzCYha3IGAMssXDHtvwpeNcA7/u+AxHDPuHxrxvn/2u
 MB3xMCjIJB2Ot6fCraC0N4b0TkxzJk0fEwY1ra1itgZRW8IdDlYIzxeu8ndLrRuDInrGa4YcH7K
 dC2nNi6c/HDYlEH46YSlxDd8ro78vOMz+itRiDqQDp5aCELnFm7jscABFpeyyyOxFqHadUkVvyJ
 jC0xcmnCPfUMCPnB0AaUE7XmXpi2Bia/+W1BooHr7f8Vi/feY1uBq8XgeoawyP287cA3Ex3Oh7F
 GIJK43s5dyMm7z6V0uARWyn3OTSEBA4F4gdzR+Y5j6Dbw0QWN4f/73AVO0V1PrXVJmRizdJ1oeS
 RRQ1O10WRZid5kQbepMf/q9iKSsTd7prlf1ApQ5clo0nic5AREwk/F0E5iEERDEwRWusXFrMTha
 xnjQTBeW/0PF0QMmMeRxiNmpErewnq31xDgEHqvdwXRD1J8PEXnPFQUdxKZ+PqQjKGm6YnpvxOU
 5yuJCUjtKLhRRjyJ4WLeFwgMHLKJdNmaMAbB2U+90Gc+DlgKRaNVAIJyNL59XxqbLyefQucIsix
 OQGziwVt71Fpu/OOvtJxIM0ZT+HZAps+IAEhAF5w9BNTN9LUQj2Bqnf10lWufmYdyOae69pAdPS HDiBN
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f23b33 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VRa37pfzgGlg-717BZ8A:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MiBTYWx0ZWRfX9sKVVDZ1uVGv
 robwpjEuP23RwWX7vx4KPVieIMHO6uVKw2iKy+yWj59wx5rAQ3YydI9rZse+AyP2o4VFwP2yEGD
 i3HJ2ggR5zRQtHMJjc+YOn6d99stw1zqYwo2PM0Y3InDaoy+8GDAuyGHlzel80808yahxNyIvNk
 vxcUUvrGkRdaBNAG6GCtQmPxQjMP9j8tYwtMtSD2wQHQlcS7Bt15kEsaSvImjbn9samT1ZS6d8L
 wR3ocinDJsja4e0Bg9HrMK30bMoThMUykhI4QIm2DriDim5scvVMsbaipVZjgMpj+j+2Gn6zlX4
 yxT+Yh9xRV6b9zIuZi52B/E5kGNV72pTm/ZE/vpqUWhIRSFd5I6bjExTYZje0etoh+lm4kD1cXt
 tk3tgY3s+SLQpt27Ib4xVmyrpAxPb5hX6G5e9ipg5RcSyAo9OjBQtcLAJCql4SlwpPBmwEWd709
 9VxlbE9O+RDsvR8PJ8A==
X-Proofpoint-GUID: XNj5VXtUrR8tRh5tqfJvVZv6v9oFUh_b
X-Proofpoint-ORIG-GUID: XNj5VXtUrR8tRh5tqfJvVZv6v9oFUh_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290172
X-Rspamd-Queue-Id: 708BF49806B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105264-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
are already treated by common.c code as pointers to const, so constify
few remaining pieces.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
2. Add rb tag
---
 drivers/clk/qcom/gcc-nord.c     | 2 +-
 drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
 drivers/clk/qcom/negcc-nord.c   | 2 +-
 drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
 drivers/clk/qcom/segcc-nord.c   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 3098d8fac0fb..8a6e429f2640 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1850,7 +1850,7 @@ static const struct regmap_config gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data gcc_nord_driver_data = {
 	.dfs_rcgs = gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
 };
diff --git a/drivers/clk/qcom/gpucc-sm8750.c b/drivers/clk/qcom/gpucc-sm8750.c
index 5d52c6d8b5e5..1466bd36403f 100644
--- a/drivers/clk/qcom/gpucc-sm8750.c
+++ b/drivers/clk/qcom/gpucc-sm8750.c
@@ -421,7 +421,7 @@ static struct clk_alpha_pll *gpu_cc_alpha_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_sm8750_critical_cbcrs[] = {
+static const u32 gpu_cc_sm8750_critical_cbcrs[] = {
 	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
 	0x9008, /* GPU_CC_CXO_AON_CLK */
 	0x9064, /* GPU_CC_GX_AHB_FF_CLK */
@@ -430,7 +430,7 @@ static u32 gpu_cc_sm8750_critical_cbcrs[] = {
 	0x93a8, /* GPU_CC_RSCC_HUB_AON_CLK */
 };
 
-static struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
+static const struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
 	.alpha_plls = gpu_cc_alpha_plls,
 	.num_alpha_plls = ARRAY_SIZE(gpu_cc_alpha_plls),
 	.clk_cbcrs = gpu_cc_sm8750_critical_cbcrs,
diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 1aa24e2784e5..2cb66b0691a6 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1945,7 +1945,7 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
 }
 
-static struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
 	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
 	.clk_regs_configure = clk_nord_regs_configure,
diff --git a/drivers/clk/qcom/nwgcc-nord.c b/drivers/clk/qcom/nwgcc-nord.c
index 163ab63c872b..961cae47ff7c 100644
--- a/drivers/clk/qcom/nwgcc-nord.c
+++ b/drivers/clk/qcom/nwgcc-nord.c
@@ -626,7 +626,7 @@ static const struct qcom_reset_map nw_gcc_nord_resets[] = {
 	[NW_GCC_VIDEO_BCR] = { 0x1a000 },
 };
 
-static u32 nw_gcc_nord_critical_cbcrs[] = {
+static const u32 nw_gcc_nord_critical_cbcrs[] = {
 	0x16004, /* NW_GCC_CAMERA_AHB_CLK */
 	0x16030, /* NW_GCC_CAMERA_XO_CLK */
 	0x18004, /* NW_GCC_DISP_0_AHB_CLK */
@@ -641,7 +641,7 @@ static u32 nw_gcc_nord_critical_cbcrs[] = {
 	0x1a044, /* NW_GCC_VIDEO_XO_CLK */
 };
 
-static struct qcom_cc_driver_data nw_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data nw_gcc_nord_driver_data = {
 	.clk_cbcrs = nw_gcc_nord_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(nw_gcc_nord_critical_cbcrs),
 };
diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index 1aab0999de4d..c82a56d97154 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -1568,7 +1568,7 @@ static const struct regmap_config se_gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data se_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data se_gcc_nord_driver_data = {
 	.dfs_rcgs = se_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(se_gcc_nord_dfs_clocks),
 };
-- 
2.51.0


