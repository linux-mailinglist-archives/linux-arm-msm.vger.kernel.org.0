Return-Path: <linux-arm-msm+bounces-106665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAHbD+DK/WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:37:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 369FB4F5D59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C168130095D7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C65C3D6CAD;
	Fri,  8 May 2026 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hq0lZY2k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfjRYeXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A247D35DA41
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240215; cv=none; b=t49ZNOkmmunxykwfUqatbzTgSdEL1e/rDU1maWXZz/RQS0XGweLzfT4w+P9GM2n7kEHLybvoNfAW9IbowxC7aqNJOA9aVEdZBEMH5IElkTmU7eECQOmyduJi89LCbUkYosNzgjyxK9lnI+wHOq0z6D11yFFG6xl4Sc4NLuTgp9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240215; c=relaxed/simple;
	bh=Zu/RY3LBBjQ4dbJR06TZC4oVdo2PezBjsnbEbC6VTYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QCj7GuSyPoEpHjkZDUzBPLTus3W3VvTdK5Zz995rJx8btdtpvScNyJVFki5CNjmb9fJZ30e7j+oaxqznw85MEGb0ATSuVFwPNy+urty4y9i1M9DKjfqcp7iq6/hZibuyNAu4sHxya9qk9ylAHiht2UHXCtdHdaJumEA+n2RNqQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hq0lZY2k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfjRYeXS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64868cDi4069381
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9u8mi5Kc0c1
	AQavAhBg1YKOOag4KvYd2fKsDDwyEpsI=; b=hq0lZY2kn2BKnLR6VGUJngcdw3h
	FUEFhYSNAwZM9/DDNNOHA3NW2lrlZ/wXoFQpzbEX6U7fMP8N0Gxo4XlvUUHp7r51
	s5DZQGW6mELzdEwxeyEzq3wuQfz+5qIPdnsgqZ+cc7MxXYm0bu9a7/wzpLhdwPo2
	RLnSIq5oC9EaAJeM9cfw/bZ3fxYra6sROB0XYCkjOJo94fTnHgyxN6fJuECgxth+
	tTYr42KGGCarnp3zwZj3/kb/qY0vs5XX5F/A/3AuTtZYz4QsblnfRnXz1Ua65XGe
	T1GIllTsBhSr0xy1OewTxsU2H1Nv+xchixM+iIux2QTWho2UKrXH1rKi7xA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp2r5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:36:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36615b95e7aso1863327a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240210; x=1778845010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9u8mi5Kc0c1AQavAhBg1YKOOag4KvYd2fKsDDwyEpsI=;
        b=IfjRYeXSzlMBFQfSbtCURwQWEnYNQGAAMS17LM1oVDRtRNHebNDMyo1q5COUuaLYeQ
         a+BK423noo9BU/rscN/Dx2240HGXuBONmf4hp0SBjO+mLr5z6HHWYGE0PARb26jPeaOv
         ESmGIN0VcReHLoXPyRRaUNtmEktwAFUMLNy9yXq7keJhKqrHS2icCgGoRP7t2gmW7yDN
         610A2xxGaa/b6Lh/Fpj+ZpCJJvZVM0Ite30N7MiSP+FfR3J50RIrCxdag2X+3OXNE3JH
         SAIEjnmEWd8M8+QwahMSX6mqqpLkrE3/kZ1o+UrhkvCQFjRPxTGZdQj4yOluEnoVboJH
         IjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240210; x=1778845010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9u8mi5Kc0c1AQavAhBg1YKOOag4KvYd2fKsDDwyEpsI=;
        b=iqyWfteiIuj4WM5BLGzzpCKPnJ4kGKtvwj+XaMS401WoZtT6QUmenbYniBsBJ8+tkL
         Da1D/cX19OZeIOt0rIsv+mbA8htLd7+RY7i3OkDHmEzlmka227S1q+27O1nJidjWaYyJ
         K6aJg+wFBYMwp4mbQeHcqKzOnpThq5Upsn6EyUXtbkiJuDfxxM+Qi48y63N470IfmrcW
         Cp5J3G5DWcBLjZO9ZeAOq8l4zM78obYvIil6ZPAHr96Ku0wlD7tZSS/POHhZjL1CGu7h
         hIVAu5IX+AWfB2xPWmHWnmNY0rdqBLD3XxB//v7Hgq3twDnvICIEbZrnquXwQdZ2FWDO
         THFQ==
X-Gm-Message-State: AOJu0YzK6nBaDOR7pzcbeqaCJ+/5X2uIc0ALyd4jioh/Uf41HGPOBy7r
	YD83DicYo1LGaO5+gRnnekDJUNwwNuC3LTuiO3ua/sX00OPnP4K9C+h9PwWMZjyEC7x0Ak4+R9H
	RRBePhtGW6sBTEhAbFWLhukK5Ba/BRK6+YnZYVumCoqZJSyr18yG54A/4qo+QVn++uekp
X-Gm-Gg: Acq92OHgJvLZ3yGO63gfp6Hzf8l8u0UIFmYpfqm7HS+uFASuvncwMsGnC6qtDVdhmTp
	tPhncySCVvZPlBbuWp2WxQbpuGl5nlDnjZMziwCe5E6XqLUn/WVtFUWpwsHYtsLsqV4bU1tC+tt
	Wp8dHzQlMnFs2qQxFufjt4JLyavK3V8zyuNyUxlIgWI7sxa4L91JbB5i6yRmc8oKDJAR3qyZKXw
	TrtP3rWti/7niOXsBS2N+4C7NHS+oFMdHbA/ysc++ohUnr4PGEWSswDtLL6t4DUgeOP+BS5VL/V
	LrueJ0umwO64gmk0kN6IswbjEufI9F2wZuedX4+oiD3vsvIGSXB/wjtbHzGRQz4HZFW21Si9DEU
	2oYV/QXt4Rqhe0kLrS5E3OTD83JfbmjansBMaQKDCz10BmjgY2g==
X-Received: by 2002:a17:90a:16cf:b0:365:fd4b:24f5 with SMTP id 98e67ed59e1d1-365fd5a6b04mr4739548a91.8.1778240209444;
        Fri, 08 May 2026 04:36:49 -0700 (PDT)
X-Received: by 2002:a17:90a:16cf:b0:365:fd4b:24f5 with SMTP id 98e67ed59e1d1-365fd5a6b04mr4739529a91.8.1778240208868;
        Fri, 08 May 2026 04:36:48 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bdac03sm1256373a91.2.2026.05.08.04.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:36:48 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on remaining SoCs
Date: Fri,  8 May 2026 17:06:35 +0530
Message-Id: <20260508113636.3561383-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMCBTYWx0ZWRfX8/uhyIZb3JGz
 yyy/O/BBCpKeY0pb2z6Mhiy4mwQz/gq4t2ppR1hQJd1LR4rBRR70TT6cuYIEX1sZO4wjalH12Tt
 3TWJMNwUuXYaL45zeiqHEkl1TA2qW8NQmNA9iUCT8DHfxmGCE9UaSG4zs2YfKNob/kBOfL+xcUA
 c8hdypRIjrjBybVqA+Se32t3ZCfsnkNiZ7mj7GlIV1zeUYcA4VfJ8ir9dEERq5KcQwk91wWTRag
 K+zGJNmgVLLQEzUQ1mUXDgsR3u5huDaARji0jIcLn4fbl/kmn1K0fn9sRfrZmWXabecRyom1XFs
 n93qOJHqaRuuRZ7dxBlC1+PIzPrLhOHLDFi4IOHC7d3A2W57EfMwlVz4Y4mCefjlYoCqnuch6sb
 39hGYBodrB/M9QTNtirE9T4q6Bax3bnczWOhZNXPLXHcFiG5XSuIzuwuJEBp/J1QTkqB+hkjBH0
 6gzHw81nDtWYgNrcskQ==
X-Proofpoint-ORIG-GUID: qBwjAn-2xfyoPFg8-1u3voTwaaazGtFU
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fdcad2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=PNqn8kwc-IHmyLqyaEgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qBwjAn-2xfyoPFg8-1u3voTwaaazGtFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080120
X-Rspamd-Queue-Id: 369FB4F5D59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106665-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The LPASS LPI core conversion to PM clock framework relies on variant
drivers wiring runtime PM callbacks.

Hook up runtime PM callbacks for the remaining LPASS LPI variant
drivers so all SoCs using the common core get consistent pm_clk based
clock handling:
  - milos
  - sdm660
  - sdm670
  - sc8280xp
  - sm4250
  - sm6115
  - sm8250
  - sm8450
  - sm8550
  - sm8650

This is a mechanical per-variant driver update that relies on the
same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
pm_clk_resume()) and DT-provided clocks.

Runtime behavior was validated on Kodiak (sc7280).

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 +++++++++--
 10 files changed, 80 insertions(+), 10 deletions(-)

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
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
index 0e839b6aaaf4..1a61316c8c47 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -173,10 +175,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
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
+			   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
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
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index c27452eece3e..656f22da7dde 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -134,10 +136,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
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
+			   .name = "qcom-sm8250-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index 439f6541622e..a79f99ec6df9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -202,10 +204,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
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
+			   .name = "qcom-sm8450-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
index 73065919c8c2..9037ef0020da 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -210,10 +212,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
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
+			   .name = "qcom-sm8550-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index f9fcedf5a65d..513ddc99dd37 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -217,10 +219,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
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
+			   .name = "qcom-sm8650-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


