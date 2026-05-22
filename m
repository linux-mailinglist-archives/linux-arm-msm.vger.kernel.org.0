Return-Path: <linux-arm-msm+bounces-109424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPCCG629EGomdAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:33:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE45BA182
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67899301544B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447933812C4;
	Fri, 22 May 2026 20:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUF7XPo+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnbspD7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5733B38330A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482009; cv=none; b=V4cYI5CSx1x7KdPNvdw2nuvi6u4xz6bxMbCTuQe8VWYtL2nTVHgWUrahQReJpRrq35Jrh/TTZpIloDDDkHQNaNvWvVtgPQYygNLs40VTtQ3XfK1xAxxFra4v+fTfuq1fLPcXDWcsoaOlHeBawULhTkc9GKnbw87+qis4dz11AiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482009; c=relaxed/simple;
	bh=1ArzpGhOQxCx3RVe6axct8hrohdVOyEEi512dTfwxgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j24CCBV4G/X7UV9hqOK7DABYWvwjzTdOmaqvSpXQ06JipL+0FhVtjP0J3gUxv44sAYks00oG6ESIPu+BdGHy2xnC9W5QZlAENX/k5rgEEDDSpnBVpDqaCJ9Tv+46sjQevsPWwEVEZ2tDj6SiAVK1O5iEuQwb810S+wh6RJlDDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUF7XPo+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnbspD7W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHYQ8l3947428
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f33Syln7KaI
	1HAb8TNlHzt9EL9a9sngfU9QVHdZizrE=; b=cUF7XPo+aQqt2VmQjmFrwhLlEW4
	BW5HsFGrzoMCPG166wvabtLsqZx3kuRUbV/kgoMVSyUU2spU5sEh87w6iUwE2Uj5
	tPumXBWqrrw4JtoqLs+QOxT5eB7gzTVxmfnOHvF91D5ad0DOJy0YxRbfUhCbCyL5
	jDXtut5ZlxEZYutE8MEMnJ59DdiAN8CgCk54Wlij0xJLDJ6K7OmfbdvfttsgywSI
	B6HOV4rJ8f4kR7OHrcnU0b+w63nK4ypGPBCcld94QDZ83OwR5B6bUdaYbG3XvoGc
	iyzJexAYjJuC8cUjzsjPAAxT6qRcNW8xpkSyO8sM/jRnh/vkghjY6+idWOQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2njbq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:33:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8354503d9acso9544327b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779482006; x=1780086806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f33Syln7KaI1HAb8TNlHzt9EL9a9sngfU9QVHdZizrE=;
        b=GnbspD7WBo48iujHsGq0Fip/57ujmWgs7uvK1mFdjh5O3960LnuO8tCHJ8ddRTJxMF
         3px5qfNo7SQaM4gqnyUzuX3K4UgKTSZTyFD85MPEBxEvkVn1uN6/vwoee7YRlC/5kxk0
         0HUa/WUlCWUNED0S1SgnjZMKaY8w5dNKkE8lhv6xhGXREse40QfFbCFUzV6CkOJRlsxg
         PEKb/tcX3cCEtIS09Eh7N8C6x0AyIY2azclAQJ5vaYi2YQ8GOXKdnTeRiO/XeurTaxlz
         O+FEBaSeW1Bncm7UHW6IQw6fwRHGiFX9knij4NyBtq/T+OTx+YCbF60rG18/rAZoohre
         TEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779482006; x=1780086806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f33Syln7KaI1HAb8TNlHzt9EL9a9sngfU9QVHdZizrE=;
        b=AHN4QpCGPGJJy06Du4KjwwNSDaRdDp1GxuduEu0iiwCom3vICpVNLBR84KD0Os0yMk
         HmQBoiHyJP90w0E+9NF9EY0lflyR4biXlQDtoGx1aI4ywMrDD6lRK6rNfow3vu58Fa3D
         UaoZX4cKWe1OQuNsOb0nOriHz9WBwwbfe/C6CFCFu7T7wmkRkDfBaFkNdPcNk+dtAnwn
         51bIQeTIJBMLzou/J4aMC4FWfiWTw9RRahwDE1FabsfZXQ96XiEZueQV4/qDh0nypXgZ
         NGUfz4BBpY5FTJR/nnw/XUaIGpZasFFaMczDVDfCMCJxb/SrLUNMLZsWn/4UN0rpI93I
         ImEA==
X-Gm-Message-State: AOJu0YzZPC73bICLH8xDmReTnHkAZ+xYJYoHdmPKHIfYk2tasbDDNj/v
	R/BqbmxGVUl/nShm++reSK4Kxg9feAqlrHw9oAbIunRWna87K360HImRxOFgfloieH18RoteAZS
	1MukvtfZF6jKlpyJACctfedZRxAfuFnuW87jN4TXF8VUqh2VG91Nv21RgCsyEpKkjZxdx
X-Gm-Gg: Acq92OE1Q6mVWsZh21YPAHKX9MydN5fgKX6hJQC9Qxyb8fH0QmLTlCZqn5KMoMJlmSk
	rgzpBeP2J6Wh1MSDfHLl2lgdPyLOIZrRkYRdnVroxdtMFTHwFC21gGHPK8Y4VcnjE2eJ3yTBb3f
	nr2i6cdJb36QCN1s0UQADHyJSBfblfQv0huwYCJBeZKcSKeQ+i8q/HayFqhulOzkCxVYzsKEcNa
	Yykn9hanoqn5chAhcy6xbNqD+MZZmXztJ6J81g4sjsUfiFR3p322EhnVUq7prbtFDLFa/+xAea0
	o31sb5jjWuO4YRjGeB9FfnQoMox1Vo8zRh+GciVN9b9uDx42NmvPR2OuLLFmCuLWqkzwJPV1na5
	VZAiElMe3mtaEZ2o4a+JitsD/lzF0pmgUDzLSaJNiq2uB0gwEDA==
X-Received: by 2002:a05:6a00:8c04:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-8415f3ae582mr5683916b3a.9.1779482005710;
        Fri, 22 May 2026 13:33:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c04:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-8415f3ae582mr5683891b3a.9.1779482005169;
        Fri, 22 May 2026 13:33:25 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9c77sm3062251b3a.2.2026.05.22.13.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:33:24 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
Date: Sat, 23 May 2026 02:03:03 +0530
Message-Id: <20260522203304.4065305-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522203304.4065305-1-ajay.nandam@oss.qualcomm.com>
References: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
 <20260522203304.4065305-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a10bd96 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Rko4qIHHiJ4K03xOnZQA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: TXkFXPb4-QzJIOS7krbq1ciZ54hjhmjl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDIwMyBTYWx0ZWRfXyb8+P3OvYABK
 fNCrqrTblizhQDDnEybPmX7C5Qc0gASnX4N2ccimw/zEKSsF6rTQaLvcLl33RBcIBQHaXEo7gVC
 20QtPfNyb8x+mUjXNL2OI8QylCmfGCdQzwbQjUnh5rUXVVElXhXtB8BzToeHM8KjB8X9/IxntI6
 /91M/e4YsY4GX2IqFMF4mMKx1dfqcTC/2fvFbPXEH8dL5jmmpKlI0g0UeJzGYrH5hnJm+GKqVvI
 hLsKA3VktcsEqTh81bnMkOnclQ41x4Tx7A9gR4rEpXHNKJY/AyZftSrdjTHiYzeSIEyUew5IePG
 ceYxfZWndUdZ0BuMvIaUQY0R1k81uU36H+Nw8c0vegPyjybYmzgHNqYbMkvELKzqpa/VHOPBXzv
 R1VZtUapyMPitNMTjmCJmYMDo/vA8vCfHCTmJiACeBh9nvu/1Yp+gEhja49O3vq4KximwDNrlr+
 IM3arg5F6OfU7Y40bpg==
X-Proofpoint-ORIG-GUID: TXkFXPb4-QzJIOS7krbq1ciZ54hjhmjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220203
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109424-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEDE45BA182
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LPASS LPI core conversion to PM clock framework relies on variant
drivers wiring runtime PM callbacks.

Hook up runtime PM callbacks for the LPASS LPI variant drivers touched
in this patch so they are prepared for the shared core conversion.

This commit is a preparatory NOP on its own, as runtime PM is still
disabled on these devices until the following core conversion patch.

This is a mechanical per-variant driver update that relies on the
same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
pm_clk_resume()) and DT-provided clocks.

Runtime behavior was validated on Kodiak (sc7280).

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 19 +++++++++++++------
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 15 +++++++++++----
 .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
 .../pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   |  7 +++++++
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 15 +++++++++++----
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 15 +++++++++++----
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 15 +++++++++++----
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 15 +++++++++++----
 12 files changed, 110 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
index 3bf6fe0cf1bb..72b8ffd97860 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -203,10 +205,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-milos-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 750f410311a8..a61df10d46cb 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -129,20 +131,25 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
-	       .data = &sc7280_lpi_data,
+		.compatible = "qcom,sc7280-lpass-lpi-pinctrl",
+		.data = &sc7280_lpi_data,
 	}, {
-	       .compatible = "qcom,sm8350-lpass-lpi-pinctrl",
-	       .data = &sc7280_lpi_data,
+		.compatible = "qcom,sm8350-lpass-lpi-pinctrl",
+		.data = &sc7280_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sc7280-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
index 0e839b6aaaf4..27c47710365e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -166,17 +168,22 @@ static const struct lpi_pinctrl_variant_data sc8280xp_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sc8280xp-lpass-lpi-pinctrl",
-	       .data = &sc8280xp_lpi_data,
+		.compatible = "qcom,sc8280xp-lpass-lpi-pinctrl",
+		.data = &sc8280xp_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sc8280xp-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
index 65411abfbfac..7b5aacaae7d7 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
@@ -10,6 +10,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-lpass-lpi.h"
@@ -145,10 +147,15 @@ static const struct of_device_id sdm660_lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdm660_lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver sdm660_lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sdm660-lpass-lpi-pinctrl",
 		.of_match_table = sdm660_lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
index 858146c408d0..0a31f7ad2e0d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-lpass-lpi.h"
@@ -151,10 +153,15 @@ static const struct of_device_id sdm670_lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdm670_lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver sdm670_lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sdm670-lpass-lpi-pinctrl",
 		.of_match_table = sdm670_lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
index c0e178be9cfc..75bafa62426a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -221,10 +223,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm4250-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
index b7d9186861a2..05435ea6e17a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -141,10 +143,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm6115-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
index 4d06abcfedfd..946b23084304 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -135,10 +137,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		   .name = "qcom-sm6350-lpass-lpi-pinctrl",
 		   .of_match_table = lpi_pinctrl_of_match,
+		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index c27452eece3e..454de788be21 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -127,17 +129,22 @@ static const struct lpi_pinctrl_variant_data sm8250_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
-	       .data = &sm8250_lpi_data,
+		.compatible = "qcom,sm8250-lpass-lpi-pinctrl",
+		.data = &sm8250_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8250-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8250-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index 439f6541622e..834eee8dcce9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -195,17 +197,22 @@ static const struct lpi_pinctrl_variant_data sm8450_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8450-lpass-lpi-pinctrl",
-	       .data = &sm8450_lpi_data,
+		.compatible = "qcom,sm8450-lpass-lpi-pinctrl",
+		.data = &sm8450_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8450-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8450-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
index 73065919c8c2..875e04e5d2b9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -203,17 +205,22 @@ static const struct lpi_pinctrl_variant_data sm8550_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8550-lpass-lpi-pinctrl",
-	       .data = &sm8550_lpi_data,
+		.compatible = "qcom,sm8550-lpass-lpi-pinctrl",
+		.data = &sm8550_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8550-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8550-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index f9fcedf5a65d..bc7889c993d0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -210,17 +212,22 @@ static const struct lpi_pinctrl_variant_data sm8650_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8650-lpass-lpi-pinctrl",
-	       .data = &sm8650_lpi_data,
+		.compatible = "qcom,sm8650-lpass-lpi-pinctrl",
+		.data = &sm8650_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8650-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8650-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


