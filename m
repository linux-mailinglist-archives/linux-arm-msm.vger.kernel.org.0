Return-Path: <linux-arm-msm+bounces-103343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Fb2IByb4GnokAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:17:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4C740B6BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5F3A31BE678
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842B338E5FA;
	Thu, 16 Apr 2026 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ez8QWPig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApIFOCdg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F005438A72B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327051; cv=none; b=YiLYRcyfgUTq0yr/B0d6IR0hkg4pYLgotpEjIH2/PIwBcEaZx47rTRBrRrXnpO1G5i8OjVxfTSNyE0fErnhLKAgmbxi3Ji/Jwwvska+IcIBtFrohz3AaevKqHHjQh32geW2FGIDpJjw+X/2QJ2IldIgVV76tYhkxtG6j14+QvIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327051; c=relaxed/simple;
	bh=U/GCGgDR2DIj1yR+Dns4B/yEJ1gOSnFBUGrN0EzjXYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoeYmsRK5sgbhaxIngvwYdVnRZ+0+VhTK0I2Az+GHJFPpMcadx9mC6hQxPL8fnLYkXdMC5K5OPu/sxrbztzsslR778T/aDdCrdpWhULD4JAIC9sBKK1OZgrUca9p4ymShJWLx1dyqrslkY7vkPXZ/hj/9TYjQGEBND48RgUKrGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ez8QWPig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApIFOCdg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G11DmT2834872
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aJMTjMLu3bQ2ajK93GH5k3mIoXNjTt6HbcbLlB4j9o=; b=ez8QWPigSi9y9rMJ
	rcz1o1p8eHA1eueP7atDBDZeZC36r21jrqCZ8o2K2XcUlGS8zRyMUdawMpdp0zx7
	dHPuHmBwUACkIdLGuZPvFEsuo1V6eU2s9csqNX3oXtnuk1RI5eO46zOOxoXkODUr
	VwJdXCR74nkYkLpO3BZr5Y3CCtzllbHWXcSAg+sYx7ynC/08Ut+XEVawv+Ha9UNF
	zIVqz9yfEWxz/MxBM71vagT9OmhQ/Z6NQ+L9r4jc3hcgOdjsOphVWKPe4dVkSAUa
	QeS7GwSUdT74nneIq9t+lbTP2UoAfZQwcuzwdYvODTcgZ3G1MYl3TlgWf6gfTwHK
	jiR/OA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcsvjx56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4661881eso32115481cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776327046; x=1776931846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aJMTjMLu3bQ2ajK93GH5k3mIoXNjTt6HbcbLlB4j9o=;
        b=ApIFOCdgJ0eciWttaQjBKRWVgxm8l1R4XMQL9iVDN5s1l9tn9FWbogWmg+eZAuem3G
         +U/skf6c/UnuP3DcoOgPB0d24msZ6im499WpTJOxgO5CdcatJSFzBW3EgcKWlanRpZOZ
         ocOCHHV/cQ73MPgf4K/RDHW5NYIW4b2bcEsY2xVnYUmlyVZXltw4gBGoxeJ4CF5gIGdj
         RxFBWZ2nSGb8yu7hlLrmHx1YBLaN49dEEXqYc4glIPYjHqNwC27heMWdB/be2ktt4xDf
         FUB53kpGk2QKCnxo0vF0owWTaLzJZlke/mR22suSQ2atb3e+8ZYUhNd1ed0WokXKmYjP
         R9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327046; x=1776931846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4aJMTjMLu3bQ2ajK93GH5k3mIoXNjTt6HbcbLlB4j9o=;
        b=rRqJebsmJlNrtgSvH/4t8NiqZE30qczftOvFT2OSlmKwuFGwkuEmkCjZMsErVSL9rx
         0nIb1AUMmWNTddWji3ig1EtX21UAuVptdowtOGtA3Qtxa0omvQsCAwTLY1OrzjZNx1oe
         AFkaPaGn9fj6HB2dmTUJsKhbCQr7tKAhdUXNNM/1So4+wiFhsAlK/5HMJGCLZa/8r+X6
         hWEKtU2ti2bAQ9ZpHxlkjS9Ew5cX0+v98fKCSopQqSlMR4ydk/hiDODebiimEf1Xqklm
         bTazXalEg+e4LPogrnUEGk4grR30H8XCo4m08693awOTMSkabxfM5ZloXhUUjbxTfI3x
         Vq6g==
X-Gm-Message-State: AOJu0YykniKx9lft6WVP+zvm7AGdYtTsBuM4LOnaKb4AVY8/sqmSnESX
	vjYj6Hg0FS9dkrAoK1Figkg3xDfgUX+V4b49fDOo82pX6kWxPr/3QfjjUqOFzgWJDFYyBcngtR8
	DqjfTvqE0a7/zSFMYA0HzG+ts7eKi+IPQdCcG8tbI9gbqOow4RrHqcmvY1s4TCTTmk13CSBtKB0
	/M
X-Gm-Gg: AeBDietfJ3WAQqw2pexG//1Xf8Gm0Ck5yUkrLpFaq2VUbpu3+lpaWw2x9alzbNdHgmT
	e4uwRseTdO/XwRPPK4ox4wmqm/r+MfFAv3gcESnhVmcGaBMT5fG0Mxff7tgptylJKRX4H2S6yK5
	6PpbIsMk/mpQqs7zb8ocsV6VZM9+TUfPj2dZpEiiCAZkB9AE6OCbOyOoSZVLR15A0K58NEwUWy4
	qFUG4BZ5uw9EsAdv8lSY0Htazj+fUUryTKpu+kbRoVlXqXx6zwuqKjUIk5s9BR1MuHvMgjfth00
	VPrjDoHZ6suYefueCGL9KbLIbLy4rdJ5o7njHeT6156BA/LhgHxhuFBjXoOjgoel5MzlHwTwK4y
	b3x+k/QbPZqMYfZewrXh5qrJ5HaIQXUa33aC4ub7bUxzv
X-Received: by 2002:a05:622a:4b0f:b0:50d:8e2c:6a68 with SMTP id d75a77b69052e-50dd5bdb96cmr336967561cf.51.1776327045934;
        Thu, 16 Apr 2026 01:10:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4b0f:b0:50d:8e2c:6a68 with SMTP id d75a77b69052e-50dd5bdb96cmr336966861cf.51.1776327044880;
        Thu, 16 Apr 2026 01:10:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35bf1esm12059571f8f.16.2026.04.16.01.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:10:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:10:30 +0200
Subject: [PATCH 2/4] clk: qcom: Make important arm64 drivers default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-clk-qcom-defaults-v1-2-579e75c4cfe5@oss.qualcomm.com>
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
In-Reply-To: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=39379;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=U/GCGgDR2DIj1yR+Dns4B/yEJ1gOSnFBUGrN0EzjXYo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp4Jl80Vrk0UdbGsc57DAt1/8qnra5VgoHroviS
 CUhkUP+LAqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeCZfAAKCRDBN2bmhouD
 1xFfD/9IYqIKIFbuplNxGXwHW+VWJRz3lpTRPgaqQqZwxITF3gjUfB/kRlU/gO0DwCZbyhwIXnJ
 EkTdWFIqSFQ3gJ9Ny4gsKuaIBEobmbbkQiyik4+u8RCliThjp44a+IU6nxUHl3k3BJgHHqQUsmN
 +0mwc2By5Uh0SXGzPNQCroVv4aYUfbihejF9CrqTC24OoQ+4MNzVFEnYi7+lEpVGTn3dzXZpSvr
 rJf7ewszQnUZCDUDwXztk4OAEz2jscxZsB5ZbS1JjkzueBe64IfvXlLfrWnzm1BFtiUP9paJMMG
 hc1feWZHqLhqPWR0Z/2SHFi3js8MHh4cdD5RvgvuXdkuJhB06Miz2s1YgU3G3WlrPG+vt/u9ozI
 5dTSGq0ZV9kr/Vgx3cRwzvvNmw9Ojtz+yr9NAnnQuuAsxTJ2965Yd9UTXSnTEk4dh804y4uJBiK
 G3fShsFVBPy4KeRPEtwKtJJpiKYNLLdEVw/C1JENoxYWBzyLsLEE0M/sb5yTNx6xKpfeFvtINzc
 OrnKeRnVPoLC+EbdDv6UpvK8rkcsrhm8GO8wC7Sv+qIdWp6l5yGk4sWRGoCr31aicO+QsnMqgP+
 V48r0ZcsInYUPbpcQ8MTfQf48j7l8qP4uVI99ihxPbVgQ++wQBc9M3l/ynHLaXmmw+uqAx/EaPD
 5bcu7/p/fq+6Y8Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Q9x9RUteKbMHPV2kmMLtr0omepnp9zML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NiBTYWx0ZWRfXyoX260mCh9tZ
 Z59joHB1FhLKK/jC3+bhXFKklwBqUbjKj6wK+8EFvwhTjsAoaQQPuG8HsjhzfWDL7QUduzJmc1+
 0ablRtyPlL/5U2gQqhKbdKy5doBGyPFrtGfJKe138dG91KujEjmvc8SuWpl+KGLD5xpJTVrztfv
 25+9CRlpy0BtihdE+8DOZGqknkT2sIiiK+Tq+US3Q1vLlwFBdKtHyfuQhEVIsVuQKWndqQ7fsrp
 Ajl78K91HeIqBvZmLz8dAMW4ekQE2G3iZ4POjYoeLhsi5Pl4gdf9DC9ASixm3W070dpRUHFs1Mb
 wc3mVModKent3z+TOjlmPSE7G31GO2Bgyy54A0Gu4DMHKCDzzb+RMlC8vQP4ZPuYUWd1Rga23rD
 5gPcGOGA39TmtBBP7P6dw5ISQFI5AECU7+474TVGJUXSY2gfOCEHb+XTq9uEbnT2VZ5Kod4qb8z
 bj8KEYSSut3FVj5F92A==
X-Authority-Analysis: v=2.4 cv=Iby3n2qa c=1 sm=1 tr=0 ts=69e09988 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uDmHqFaLPKE9KAAqR8MA:9 a=sWzT779ZOxFV2eiI:21
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Q9x9RUteKbMHPV2kmMLtr0omepnp9zML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103343-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: CB4C740B6BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Clock controller drivers are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Switch all Qualcomm clock controller drivers which are chosen in
defconfig to respective default 'yes' or 'module'.

This has no impact on arm64 defconfig include/generated/autoconf.h,
however changes few drivers for arm:

1. multi_v7_defconfig: Enable QCOM_CLK_RPMH as module, because SDX55
   (ARM 32-bit) uses it.

2. Enable QCOM_A53PLL, QCOM_CLK_APCS_MSM8916 and MSM_GCC_8916 as
   built-in, because MSM8916 is also used ARM 32-bit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 106 ---------------------------------------
 drivers/clk/qcom/Kconfig     | 115 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 106 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..e2e5784ad329 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1475,127 +1475,21 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_CLK_ELIZA_DISPCC=m
-CONFIG_CLK_ELIZA_GCC=y
-CONFIG_CLK_ELIZA_TCSRCC=m
-CONFIG_CLK_GLYMUR_DISPCC=m
-CONFIG_CLK_GLYMUR_GCC=y
-CONFIG_CLK_GLYMUR_TCSRCC=m
-CONFIG_CLK_KAANAPALI_CAMCC=m
-CONFIG_CLK_KAANAPALI_DISPCC=m
-CONFIG_CLK_KAANAPALI_GCC=y
-CONFIG_CLK_KAANAPALI_GPUCC=m
-CONFIG_CLK_KAANAPALI_TCSRCC=m
-CONFIG_CLK_KAANAPALI_VIDEOCC=m
-CONFIG_CLK_X1E80100_CAMCC=m
-CONFIG_CLK_X1E80100_DISPCC=m
-CONFIG_CLK_X1E80100_GCC=y
-CONFIG_CLK_X1E80100_GPUCC=m
-CONFIG_CLK_X1E80100_TCSRCC=y
-CONFIG_CLK_X1P42100_GPUCC=m
-CONFIG_CLK_QCM2290_GPUCC=m
-CONFIG_QCOM_A53PLL=y
-CONFIG_QCOM_CLK_APCS_MSM8916=y
-CONFIG_QCOM_CLK_APCC_MSM8996=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_QCOM_CLK_RPMH=y
-CONFIG_IPQ_APSS_6018=y
-CONFIG_IPQ_APSS_5018=y
-CONFIG_IPQ_CMN_PLL=m
-CONFIG_IPQ_GCC_5018=y
-CONFIG_IPQ_GCC_5210=y
-CONFIG_IPQ_GCC_5332=y
-CONFIG_IPQ_GCC_5424=y
-CONFIG_IPQ_GCC_6018=y
-CONFIG_IPQ_GCC_8074=y
-CONFIG_IPQ_GCC_9574=y
-CONFIG_IPQ_NSSCC_5424=m
-CONFIG_IPQ_NSSCC_9574=m
-CONFIG_MSM_GCC_8916=y
-CONFIG_MSM_GCC_8953=y
 CONFIG_MSM_MMCC_8994=m
 CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_GCC_8996=y
 CONFIG_MSM_MMCC_8996=m
 CONFIG_MSM_GCC_8998=y
 CONFIG_MSM_MMCC_8998=m
-CONFIG_QCM_GCC_2290=y
-CONFIG_QCM_DISPCC_2290=m
-CONFIG_QCS_DISPCC_615=m
-CONFIG_QCS_CAMCC_615=m
-CONFIG_QCS_GCC_404=y
-CONFIG_QCS_GCC_615=y
-CONFIG_QCS_GCC_8300=y
-CONFIG_SC_CAMCC_7280=m
-CONFIG_SA_CAMCC_8775P=m
-CONFIG_QCS_GPUCC_615=m
-CONFIG_QCS_VIDEOCC_615=m
-CONFIG_QDU_GCC_1000=y
-CONFIG_SC_CAMCC_8280XP=m
-CONFIG_SC_DISPCC_7280=m
-CONFIG_SC_DISPCC_8280XP=m
-CONFIG_SA_DISPCC_8775P=m
-CONFIG_SA_GCC_8775P=y
-CONFIG_SA_GPUCC_8775P=m
-CONFIG_SC_GCC_7180=y
-CONFIG_SC_GCC_7280=y
-CONFIG_SC_GCC_8180X=y
-CONFIG_SC_GCC_8280XP=y
-CONFIG_SC_GPUCC_7280=m
-CONFIG_SC_GPUCC_8280XP=m
-CONFIG_SC_LPASSCC_8280XP=m
-CONFIG_SC_LPASS_CORECC_7280=m
-CONFIG_SC_VIDEOCC_7280=m
-CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
-CONFIG_SDM_LPASSCC_845=m
 CONFIG_SDX_GCC_75=y
-CONFIG_SM_CAMCC_6350=m
-CONFIG_SM_CAMCC_MILOS=m
-CONFIG_SM_CAMCC_8250=m
-CONFIG_SM_CAMCC_8550=m
-CONFIG_SM_CAMCC_8650=m
-CONFIG_SM_CAMCC_8750=m
-CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_DISPCC_6350=m
-CONFIG_SM_DISPCC_MILOS=m
-CONFIG_SM_DISPCC_8450=m
-CONFIG_SM_DISPCC_8550=m
-CONFIG_SM_DISPCC_8750=m
-CONFIG_SM_GCC_4450=y
-CONFIG_SM_GCC_6115=y
-CONFIG_SM_GCC_6350=y
-CONFIG_SM_GCC_MILOS=y
-CONFIG_SM_GCC_8350=y
-CONFIG_SM_GCC_8450=y
-CONFIG_SM_GCC_8550=y
-CONFIG_SM_GCC_8650=y
-CONFIG_SM_GCC_8750=y
-CONFIG_SM_GPUCC_6115=m
-CONFIG_SM_GPUCC_6350=m
-CONFIG_SM_GPUCC_MILOS=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_GPUCC_8350=m
-CONFIG_SM_GPUCC_8450=m
-CONFIG_SM_GPUCC_8550=m
-CONFIG_SM_GPUCC_8650=m
-CONFIG_SM_GPUCC_8750=m
-CONFIG_SM_TCSRCC_8550=y
-CONFIG_SM_TCSRCC_8650=y
-CONFIG_SM_TCSRCC_8750=m
-CONFIG_SA_VIDEOCC_8775P=m
-CONFIG_SM_VIDEOCC_6350=m
-CONFIG_SM_VIDEOCC_MILOS=m
 CONFIG_SM_VIDEOCC_8250=y
-CONFIG_SM_VIDEOCC_8550=m
-CONFIG_SM_VIDEOCC_8750=m
 CONFIG_QCOM_HFPLL=y
-CONFIG_CLK_GFM_LPASS_SM8250=m
-CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_EXYNOS_ACPM_CLK=m
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 62489ab705ae..d11c5ea8be83 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -23,6 +23,7 @@ config CLK_ELIZA_DISPCC
 	tristate "Eliza Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_ELIZA_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controllers on Eliza SoCs.
 	  Say Y if you want to support display devices and functionality such as
@@ -32,6 +33,7 @@ config CLK_ELIZA_GCC
 	tristate "Eliza Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -41,6 +43,7 @@ config CLK_ELIZA_TCSRCC
 	tristate "Eliza TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
@@ -49,6 +52,7 @@ config CLK_GLYMUR_DISPCC
 	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controllers on Qualcomm
 	  Technologies, Inc. Glymur devices.
@@ -59,6 +63,7 @@ config CLK_GLYMUR_GCC
 	tristate "Glymur Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -77,6 +82,7 @@ config CLK_GLYMUR_TCSRCC
 	tristate "Glymur TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
@@ -94,6 +100,7 @@ config CLK_KAANAPALI_CAMCC
 	tristate "Kaanapali Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  Kaanapali devices.
@@ -104,6 +111,7 @@ config CLK_KAANAPALI_DISPCC
 	tristate "Kaanapali Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  Kaanapali devices.
@@ -114,6 +122,7 @@ config CLK_KAANAPALI_GCC
 	tristate "Kaanapali Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Kaanapali devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -123,6 +132,7 @@ config CLK_KAANAPALI_GPUCC
 	tristate "Kaanapali Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on Kaanapali devices.
 	  Say Y if you want to support graphics controller devices and
@@ -132,6 +142,7 @@ config CLK_KAANAPALI_TCSRCC
 	tristate "Kaanapali TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Kaanapali devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
@@ -140,6 +151,7 @@ config CLK_KAANAPALI_VIDEOCC
 	tristate "Kaanapali Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Kaanapali devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -159,6 +171,7 @@ config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on X1E80100 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -167,6 +180,7 @@ config CLK_X1E80100_DISPCC
 	tristate "X1E80100 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the two display clock controllers on Qualcomm
 	  Technologies, Inc. X1E80100 devices.
@@ -177,6 +191,7 @@ config CLK_X1E80100_GCC
 	tristate "X1E80100 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Qualcomm Technologies, Inc
 	  X1E80100 devices.
@@ -187,6 +202,7 @@ config CLK_X1E80100_GPUCC
 	tristate "X1E80100 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on X1E80100 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -196,6 +212,7 @@ config CLK_X1E80100_TCSRCC
 	tristate "X1E80100 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on X1E80100 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
@@ -204,6 +221,7 @@ config CLK_X1P42100_GPUCC
 	tristate "X1P42100 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on X1P42100 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -213,6 +231,7 @@ config CLK_QCM2290_GPUCC
 	tristate "QCM2290 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on QCM2290 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -220,6 +239,7 @@ config CLK_QCM2290_GPUCC
 
 config QCOM_A53PLL
 	tristate "MSM8916 A53 PLL"
+	default ARCH_QCOM
 	help
 	  Support for the A53 PLL on MSM8916 devices. It provides
 	  the CPU with frequencies above 1GHz.
@@ -237,6 +257,7 @@ config QCOM_A7PLL
 config QCOM_CLK_APCS_MSM8916
 	tristate "MSM8916 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on msm8916 devices. The
 	  APCS is managing the mux and divider which feeds the CPUs.
@@ -248,6 +269,7 @@ config QCOM_CLK_APCC_MSM8996
 	select QCOM_KRYO_L2_ACCESSORS
 	select INTERCONNECT_CLK if INTERCONNECT
 	depends on ARM64
+	default ARCH_QCOM
 	help
 	  Support for the CPU clock controller on msm8996 devices.
 	  Say Y if you want to support CPU clock scaling using CPUfreq
@@ -278,6 +300,7 @@ config QCOM_CLK_RPM
 config QCOM_CLK_SMD_RPM
 	tristate "RPM over SMD based Clock Controller"
 	depends on QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power
@@ -290,6 +313,7 @@ config QCOM_CLK_SMD_RPM
 config QCOM_CLK_RPMH
 	tristate "RPMh Clock Driver"
 	depends on QCOM_RPMH
+	default ARCH_QCOM
 	help
 	 RPMh manages shared resources on some Qualcomm Technologies, Inc.
 	 SoCs. It accepts requests from other hardware subsystems via RSC.
@@ -339,6 +363,7 @@ config IPQ_APSS_6018
 	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on QCOM_SMEM
+	default ARCH_QCOM
 	help
 	  Support for APSS clock controller on IPQ platforms. The
 	  APSS clock controller manages the Mux and enable block that feeds the
@@ -349,6 +374,7 @@ config IPQ_APSS_6018
 config IPQ_CMN_PLL
 	tristate "IPQ CMN PLL Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for CMN PLL clock controller on IPQ platform. The
 	  CMN PLL consumes the AHB/SYS clocks from GCC and supplies
@@ -366,6 +392,7 @@ config IPQ_GCC_4019
 config IPQ_GCC_5018
 	tristate "IPQ5018 Global Clock Controller"
 	depends on ARM || ARM64 || COMPILE_TEST
+	default ARCH_QCOM && ARM64
 	help
 	  Support for global clock controller on ipq5018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -374,6 +401,7 @@ config IPQ_GCC_5018
 config IPQ_GCC_5210
 	tristate "IPQ5210 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq5210 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -382,6 +410,7 @@ config IPQ_GCC_5210
 config IPQ_GCC_5332
 	tristate "IPQ5332 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq5332 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -390,6 +419,7 @@ config IPQ_GCC_5332
 config IPQ_GCC_5424
 	tristate "IPQ5424 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq5424 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -398,6 +428,7 @@ config IPQ_GCC_5424
 config IPQ_GCC_6018
 	tristate "IPQ6018 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for global clock controller on ipq6018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -425,6 +456,7 @@ config IPQ_GCC_8074
 	tristate "IPQ8074 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for global clock controller on ipq8074 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -434,6 +466,7 @@ config IPQ_GCC_8074
 config IPQ_GCC_9574
 	tristate "IPQ9574 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for global clock controller on ipq9574 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -444,6 +477,7 @@ config IPQ_NSSCC_5424
 	tristate "IPQ5424 NSS Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on IPQ_GCC_5424
+	default m if ARCH_QCOM
 	help
 	  Support for NSS clock controller on ipq5424 devices.
 	  NSSCC receives the clock sources from GCC, CMN PLL and UNIPHY (PCS).
@@ -455,6 +489,7 @@ config IPQ_NSSCC_9574
         tristate "IPQ9574 NSS Clock Controller"
         depends on ARM64 || COMPILE_TEST
         depends on IPQ_GCC_9574
+	default m if ARCH_QCOM
         help
           Support for NSS clock controller on ipq9574 devices.
 
@@ -487,6 +522,7 @@ config MSM_GCC_8909
 config MSM_GCC_8916
 	tristate "MSM8916 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8916 devices.
 	  Say Y if you want to use devices such as UART, SPI i2c, USB,
@@ -555,6 +591,7 @@ config MSM_MMCC_8960
 config MSM_GCC_8953
 	tristate "MSM8953 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8953 devices.
 	  Say Y if you want to use devices such as UART, SPI i2c, USB,
@@ -650,6 +687,7 @@ config QCM_GCC_2290
 	tristate "QCM2290 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on QCM2290 devices.
 	  Say Y if you want to use multimedia devices or peripheral
@@ -659,6 +697,7 @@ config QCM_DISPCC_2290
 	tristate "QCM2290 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  QCM2290 devices.
@@ -669,6 +708,7 @@ config QCS_DISPCC_615
 	tristate "QCS615 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  QCS615 devices.
@@ -679,6 +719,7 @@ config QCS_CAMCC_615
 	tristate "QCS615 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  QCS615 devices.
@@ -687,6 +728,7 @@ config QCS_CAMCC_615
 
 config QCS_GCC_404
 	tristate "QCS404 Global Clock Controller"
+	default y if ARCH_QCOM && ARM64
 	help
 	  Support for the global clock controller on QCS404 devices.
 	  Say Y if you want to use multimedia devices or peripheral
@@ -703,6 +745,7 @@ config SA_CAMCC_8775P
 	tristate "SA8775P Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SA_GCC_8775P
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SA8775P devices.
@@ -713,6 +756,7 @@ config QCS_GCC_8300
 	tristate "QCS8300 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Qualcomm Technologies, Inc
 	  QCS8300 devices.
@@ -723,6 +767,7 @@ config QCS_GCC_615
 	tristate "QCS615 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on QCS615 devices.
 	  Say Y if you want to use multimedia devices or peripheral
@@ -732,6 +777,7 @@ config QCS_GPUCC_615
 	tristate "QCS615 Graphics clock controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on QCS615 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -741,6 +787,7 @@ config QCS_VIDEOCC_615
 	tristate "QCS615 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on QCS615 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -760,6 +807,7 @@ config SC_CAMCC_7280
 	tristate "SC7280 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC7280 devices.
@@ -780,6 +828,7 @@ config SC_CAMCC_8280XP
 	tristate "SC8280XP Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC8280XP devices.
@@ -790,6 +839,7 @@ config SA_DISPCC_8775P
 	tristate "SA8775P Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SA_GCC_8775P
+	default m if ARCH_QCOM
 	help
 	  Support for the two display clock controllers on Qualcomm
 	  Technologies, Inc. SA8775P devices.
@@ -810,6 +860,7 @@ config SC_DISPCC_7280
 	tristate "SC7280 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc.
 	  SC7280 devices.
@@ -820,6 +871,7 @@ config SC_DISPCC_8280XP
 	tristate "SC8280XP Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the two display clock controllers on Qualcomm
 	  Technologies, Inc. SC8280XP devices.
@@ -831,6 +883,7 @@ config SA_GCC_8775P
 	select QCOM_GDSC
 	depends on ARM64 || COMPILE_TEST
 	depends on COMMON_CLK_QCOM
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SA8775 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -841,6 +894,7 @@ config SA_GPUCC_8775P
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	select SA_GCC_8775P
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SA8775P devices.
 	  Say Y if you want to support graphics controller devices and
@@ -869,6 +923,7 @@ config SC_GCC_7180
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC7180 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -879,6 +934,7 @@ config SC_GCC_7280
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC7280 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -889,6 +945,7 @@ config SC_GCC_8180X
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC8180X devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -899,6 +956,7 @@ config SC_GCC_8280XP
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC8280XP devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -917,6 +975,7 @@ config SC_GPUCC_7280
 	tristate "SC7280 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC7280 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -926,6 +985,7 @@ config SC_GPUCC_8280XP
 	tristate "SC8280XP Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC8280XP devices.
 	  Say Y if you want to support graphics controller devices and
@@ -944,6 +1004,7 @@ config SC_LPASSCC_8280XP
 	tristate "SC8280 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SC8280XP devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -964,6 +1025,7 @@ config SC_LPASS_CORECC_7280
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS(Low Power Audio Subsystem) core and audio clock
 	  controller on SC7280 devices.
@@ -983,6 +1045,7 @@ config SC_VIDEOCC_7280
 	tristate "SC7280 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SC7280 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -992,6 +1055,7 @@ config SDM_CAMCC_845
 	tristate "SDM845 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SDM845 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1043,6 +1107,7 @@ config QDU_GCC_1000
 	tristate "QDU1000/QRU1000 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on QDU1000 and
 	  QRU1000 devices. Say Y if you want to use peripheral
@@ -1061,6 +1126,7 @@ config SDM_GCC_845
 	tristate "SDM845/SDM670 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDM845 and SDM670 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1070,6 +1136,7 @@ config SDM_GPUCC_845
 	tristate "SDM845 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SDM845 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1080,6 +1147,7 @@ config SDM_VIDEOCC_845
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SDM845 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1089,6 +1157,7 @@ config SDM_DISPCC_845
 	tristate "SDM845 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SDM845 devices.
@@ -1099,6 +1168,7 @@ config SDM_LPASSCC_845
 	tristate "SDM845 Low Power Audio Subsystem (LPAAS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SDM845 devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -1142,6 +1212,7 @@ config SM_CAMCC_6350
 	tristate "SM6350 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6350
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM6350 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1158,6 +1229,7 @@ config SM_CAMCC_MILOS
 	tristate "Milos Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_MILOS
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Milos devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1176,6 +1248,7 @@ config SM_CAMCC_8250
 	tristate "SM8250 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8250
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8250 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1192,6 +1265,7 @@ config SM_CAMCC_8550
 	tristate "SM8550 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8550
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8550 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1200,6 +1274,7 @@ config SM_CAMCC_8650
 	tristate "SM8650 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8650
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8650 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1208,6 +1283,7 @@ config SM_CAMCC_8750
 	tristate "SM8750 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8750
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8750 devices.
 	  The camera clock controller has a separate cambist controller which
@@ -1228,6 +1304,7 @@ config SM_DISPCC_6115
 	tristate "SM6115 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6115
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6115/SM4250 devices.
@@ -1258,6 +1335,7 @@ config SM_DISPCC_8250
 	tristate "SM8150/SM8250/SM8350 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8150 || SM_GCC_8250 || SM_GCC_8350
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM8150/SM8250/SM8350 devices.
@@ -1268,6 +1346,7 @@ config SM_DISPCC_6350
 	tristate "SM6350 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6350
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6350 devices.
@@ -1288,6 +1367,7 @@ config SM_DISPCC_MILOS
 	tristate "Milos Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_MILOS
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  Milos devices.
@@ -1298,6 +1378,7 @@ config SM_DISPCC_8450
 	tristate "SM8450 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM8450 or SM8475 devices.
@@ -1308,6 +1389,7 @@ config SM_DISPCC_8550
 	tristate "SM8550 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8550 || SM_GCC_8650 || SAR_GCC_2130P
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SAR2130P, SM8550 or SM8650 devices.
@@ -1319,6 +1401,7 @@ config SM_DISPCC_8750
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8750
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM8750 devices.
@@ -1329,6 +1412,7 @@ config SM_GCC_4450
 	tristate "SM4450 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM4450 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1338,6 +1422,7 @@ config SM_GCC_6115
 	tristate "SM6115 and SM4250 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6115 and SM4250 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1356,6 +1441,7 @@ config SM_GCC_6350
 	tristate "SM6350 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6350 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1383,6 +1469,7 @@ config SM_GCC_MILOS
 	tristate "Milos Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Milos devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1392,6 +1479,7 @@ config SM_GCC_8150
 	tristate "SM8150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1401,6 +1489,7 @@ config SM_GCC_8250
 	tristate "SM8250 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8250 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1410,6 +1499,7 @@ config SM_GCC_8350
 	tristate "SM8350 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8350 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1419,6 +1509,7 @@ config SM_GCC_8450
 	tristate "SM8450 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8450 or SM8475
 	  devices.
@@ -1429,6 +1520,7 @@ config SM_GCC_8550
 	tristate "SM8550 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8550 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1438,6 +1530,7 @@ config SM_GCC_8650
 	tristate "SM8650 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8650 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1447,6 +1540,7 @@ config SM_GCC_8750
 	tristate "SM8750 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8750 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1465,6 +1559,7 @@ config SM_GPUCC_6115
 	tristate "SM6115 Graphics Clock Controller"
 	select SM_GCC_6115
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6115 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1492,6 +1587,7 @@ config SM_GPUCC_6350
 	tristate "SM6350 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6350
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6350 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1501,6 +1597,7 @@ config SM_GPUCC_MILOS
 	tristate "Milos Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_MILOS
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on Milos devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1510,6 +1607,7 @@ config SM_GPUCC_8150
 	tristate "SM8150 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8150 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1519,6 +1617,7 @@ config SM_GPUCC_8250
 	tristate "SM8250 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8250
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8250 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1528,6 +1627,7 @@ config SM_GPUCC_8350
 	tristate "SM8350 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8350
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8350 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1537,6 +1637,7 @@ config SM_GPUCC_8450
 	tristate "SM8450 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8450 or SM8475
 	  devices.
@@ -1547,6 +1648,7 @@ config SM_GPUCC_8550
 	tristate "SM8550 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8550
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8550 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1556,6 +1658,7 @@ config SM_GPUCC_8650
 	tristate "SM8650 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8650
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8650 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1565,6 +1668,7 @@ config SM_GPUCC_8750
 	tristate "SM8750 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8750
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8750 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1583,6 +1687,7 @@ config SM_TCSRCC_8550
 	tristate "SM8550 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on SM8550 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
@@ -1591,6 +1696,7 @@ config SM_TCSRCC_8650
 	tristate "SM8650 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on SM8650 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
@@ -1599,6 +1705,7 @@ config SM_TCSRCC_8750
 	tristate "SM8750 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on SM8750 devices.
 	  Say Y if you want to use peripheral devices such as UFS/USB/PCIe.
@@ -1608,6 +1715,7 @@ config SA_VIDEOCC_8775P
 	depends on ARM64 || COMPILE_TEST
 	select SA_GCC_8775P
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SA8775P devices.
@@ -1619,6 +1727,7 @@ config SM_VIDEOCC_6350
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6350
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM6350 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1639,6 +1748,7 @@ config SM_VIDEOCC_MILOS
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_MILOS
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  Milos devices.
@@ -1660,6 +1770,7 @@ config SM_VIDEOCC_8250
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8250
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8250 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1679,6 +1790,7 @@ config SM_VIDEOCC_8550
 	tristate "SM8550 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SM8550 or SM8650 or X1E80100 devices.
@@ -1690,6 +1802,7 @@ config SM_VIDEOCC_8750
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8750
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SM8750 devices.
@@ -1730,6 +1843,7 @@ config KRAITCC
 config CLK_GFM_LPASS_SM8250
 	tristate "SM8250 GFM LPASS Clocks"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the Glitch Free Mux (GFM) Low power audio
           subsystem (LPASS) clocks found on SM8250 SoCs.
@@ -1739,6 +1853,7 @@ config SM_VIDEOCC_8450
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SM8450 or SM8475 devices.

-- 
2.51.0


