Return-Path: <linux-arm-msm+bounces-104717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKYfEuFa72llAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:47:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBA8472B6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48D283024A14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4143BA239;
	Mon, 27 Apr 2026 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1uPdLIG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzkQREdo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C43542CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294002; cv=none; b=Nmxv4+MvUf5YmECZGzIgoLy1f5UU9jHXs36uQkSabHcI/e2FIqcbOD79scmbHZTjmBKzHOg/WRO4vo54696CYvZnGk54sK72PFnN/inN0GwiuPAr+2/RPcSSuXpDoFCYkdkvx2A2EE61bhEK6x/m0GUMk278HRcb04L4ilgon5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294002; c=relaxed/simple;
	bh=U/xIWfIVyxF2mQ02rx0FKseSqm13qZ1XiNmxrWwriB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDPntSV3LjH955HwZ0WK6B/qNE7rDaNXLidbGvkbHhE9Pr5GxZcoyIcLLh/bEnZ13+IJsWOtzHQE6/fmmZ/7c9TYBcpuTqtk/C1FYoeuk35/K4H+ZV7HQWabkaifosBI6w8zhRErH9RlNPMQq5cWZUDLY/mMy0qzTtxhaRjginM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1uPdLIG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzkQREdo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T7nt3639599
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4kiIupbbdzP1AaB54zj5uEJPC21c2MwWBaLlQ5wgiU=; b=X1uPdLIGlNZRxzwR
	/7qKi6EbNQ10JMyLzWgqarhhPJB6jpuCwCq6dUInbebyfQxxVR45i9Zh+6WnaWe8
	buVESTnNACxCrhJ360/QEVLLoCAQiNObjtvn95RAVJNB/JHQD01D6Svg4QJGkjSn
	zmdg0WVGe9BtQDbRIWE8W4QZ2uGof6Gmmkj9jRoxeH5JV8EKYyrlLneRvBB6Yenv
	na8hoh2eAzO5nPjBOQrOU43sgWVC8/KZO3sKviNMv/EsSV0Ajz3nlsptD91M5Yad
	3NOsazrLiaEWOPeXnVwGaKQAC5PayTXPpfpDnqOzfJwENY+afWbm0MfDIthQ5FJS
	+J1SUA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya023ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:39 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94d6c5433a0so12466674241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777293999; x=1777898799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4kiIupbbdzP1AaB54zj5uEJPC21c2MwWBaLlQ5wgiU=;
        b=bzkQREdohcoh3eE6JVy9aJV+4+0Ls6pyw+ExBe/rypz2J3G8wg4cnQZNJkHWwhhS7+
         s70zZVIBI7sWy+/AzXcQOimWFwBQmTjNFy9UxUrlOvwy0dMfBKPmolOBfUkdNIBTDZ26
         4CIOu8ieNRyAyqTaqAxFjrzCRxZsGPd8nQGACy5TZ8F4G+AMc6L97G/4IqxTH8IqWxmc
         7FjKjetZh/8BdG4P3PHg95rHHSJPNCN6DUVmhX+kBcMrL5leQ7R+Nluu2XiBhE9gN21k
         iLSKEx3uttx1glvRdlbrMbmzMvWGcCvIRNzdY/+8oYv7GF71xK193CNV7yBRJ83FKRg6
         tSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293999; x=1777898799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S4kiIupbbdzP1AaB54zj5uEJPC21c2MwWBaLlQ5wgiU=;
        b=GsVkEcmv2xdkALQ8D2OM1eq0qzQnp22N3qUJE5ReUZPKgmng4ixYQPwTJ2E1P7+BhH
         WZg6nzof8dCIC6K2F4Mgwv+qMARpBa8qNdmsdEuJYrZEObmAhzgNbApsbtau2wn6FQFE
         NMU8P07Z/rOsOnq4sodUoyp3PnBIWDlmmd5NkB1b9wZQb2nD7baAwFQI7V3PctFbwyzL
         4FEd2z390IW9ILyYT5SWMP+IRARsSTaDXlU9CZGfPHiaZly0vgNNmhqTrs9vkdR7qS3i
         qNKxiKV12JvGfZnV5jATSPhoYmelpRxfqLvX+oJJ/UxH5bUH6ON0Upt698LIgOuCtG3s
         f6pA==
X-Forwarded-Encrypted: i=1; AFNElJ91J9+AbrUQ50IHVpCXRbu89u+ETHTdXZaZ1gkEgn3zTOZ5dzOlEh6O9ckEZBnTjGqriDJhYMQchEywItSf@vger.kernel.org
X-Gm-Message-State: AOJu0YxzSAR3vyi2XnxMxr0xl9jfDiXr/7k6rGbh/2PN6FbnLEb2lvD7
	G9dS/TLUR+sZAl9aCIXjsDQM+pSydQbEI7H/Tu9VIDGfOGqU8kUvNyAdAYkXJgA6Cb7SJP5Gexb
	n9kD7v80xffZGOI/aqmc4dH8hLfH2eB6sbtHqwAx+v6hRe59S/4dzdrrItMwgxYK9z014
X-Gm-Gg: AeBDiesbr8Y6G9kQSWhQ+gdsZYZq4Th57lQmGEzGGirUQwC7vM68BqhmZC0xc09jonR
	FfwwM8+D3FAR/8uERcu39xgjLsupnCOPHJBEjcq58h/O5laiv2rw39SmomQbUAkBSajQWbgiy0H
	510LtWBKY9czZIQXAXDLA1fdJMOVNj86Y+oMaF8rStkYIhY6vPEgG7Xw2XHzQlvUM+Zt3uogdi2
	FKH8lOS6Ag1RrnBdVbR9B3x4f5ob6Fe4qMQArTBcWj1RZWIP2GfYr0um1w8SgKe2iQlSHOXTDuB
	mKm3lm69hVihqN5mt92yMntF03PExSAIXX8uUT9Z45Z3hn62C2m9O5SnabP6PQCpQoU5LdMvlCz
	FIUoMEYRG7579diG6grdTJFZMovevlgZlqy+YupjjLOV6Uk7fgYaHuzRx9h8XA+z0mvpq1kCAyT
	RUhDfKduXSUsZn4ZNBBPewel6ndaI=
X-Received: by 2002:a05:6102:4e:b0:617:9372:dd24 with SMTP id ada2fe7eead31-6179372e22amr15468852137.20.1777293999108;
        Mon, 27 Apr 2026 05:46:39 -0700 (PDT)
X-Received: by 2002:a05:6102:4e:b0:617:9372:dd24 with SMTP id ada2fe7eead31-6179372e22amr15468817137.20.1777293998705;
        Mon, 27 Apr 2026 05:46:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:29 +0200
Subject: [PATCH v2 02/14] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: a7FYwmpARqB0inyBEAgCQd-uoFrwN-JY
X-Proofpoint-ORIG-GUID: a7FYwmpARqB0inyBEAgCQd-uoFrwN-JY
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef5aaf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yohlUIewGNSudplHeboA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzMyBTYWx0ZWRfX0vfHdv+mRKUw
 40CjrxZV2wkRvgcIQU/pXD8VxGXHzpEHPbAQhPDMhmqqqq/aBcV3ZGnC+TL461SEi6oL7SnWg/+
 MFBJY2HbRvDle5dlbftZn3Jw5szkcVLhe2J4jyc2g214zRwVkiV1h4EPBGUVv96KW1jK7D2xt1U
 +5ZJ5bIQNWnOm8afhn3+SnD2m6Ae95/r43mj2WKrrnCwhKBvqbWDNriuUKkTeNp+mteuPE3wFDO
 huPw8SL4fnxErGt5bgLzeuMfUhxpxaBJFgIa4FEes2QcxSKqdp34aVskYehWZkN2mZw4MIElo2H
 EO5xd6X3TyqXcbbCOQqciQH9qn0VD4vSwqzguF0tLUDpEn3qKoO8XkQ/+BWlmlCCwdbqbBkejeN
 OvzZnOVROupkWm4LQU8wFXxsu4DDMvDiAd7fzMuxKYGPnAumJrCRMDml9eUyoyf7QX8J6vLAaxM
 ycKVZffxmbdpz0W4Gtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270133
X-Rspamd-Queue-Id: BCBA8472B6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104717-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add optional PM clock support to the CAMSS driver using the PM clock
framework. This allows CAMSS clocks to be registered once and
automatically managed during runtime suspend and resume.

This is especially useful for global CAMSS clocks that are shared across
multiple CAMSS subnodes. Now that CAMSS is modeled as a simple-bus,
these clocks are automatically enabled whenever a child node becomes
active.

This avoids the need for each subdevice to reference and manage the
shared clocks individually. A typical example is the set of clocks in
the top_group, which may be used by CSID, PHY, CCI, OPE, and other
CAMSS blocks.

Introduce a small PM clock descriptor table in the CAMSS resources
structure to describe clocks and their optional rates. Initialize
these clocks at probe time and delegate clock ownership to the PM
core.

Hook PM clock handling into the runtime PM callbacks to ensure clocks
are properly suspended and resumed alongside power domains and ICC
paths.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 54 ++++++++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h |  6 ++++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8f2b1d3cd9f289895aa439443d2a18bb036fccde..ca68ad7fc9ff30eae23d3baf34cf1ca642acf9d7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_clock.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -4593,6 +4594,49 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+static int camss_init_pm_clks(struct camss *camss)
+{
+	struct device *dev = camss->dev;
+	unsigned int i;
+	int ret;
+
+	if (!camss->res->pm_clks[0].name)
+		return 0;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i].name; i++) {
+		const struct camss_pm_clk *entry = &camss->res->pm_clks[i];
+		struct clk *clk;
+
+		clk = clk_get(dev, entry->name);
+		if (IS_ERR(clk)) {
+			dev_warn(dev, "failed to get pm_clk %s: %pe\n",
+				 entry->name, clk);
+			continue;
+		}
+
+		if (entry->rate) {
+			ret = clk_set_rate(clk, entry->rate);
+			if (ret)
+				dev_warn(dev, "failed to set rate for pm_clk %s: %d\n",
+					 entry->name, ret);
+		}
+
+		/* PM takes ownership of the clock, no explicit clk_put() is required. */
+		ret = pm_clk_add_clk(dev, clk);
+		if (ret) {
+			dev_warn(dev, "failed to add pm_clk %s: %d\n",
+				 entry->name, ret);
+			clk_put(clk);
+		}
+	}
+
+	return 0;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -4677,6 +4721,10 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	ret = camss_init_pm_clks(camss);
+	if (ret)
+		goto err_v4l2_device_unregister;
+
 	ret = camss_of_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
@@ -4984,7 +5032,7 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
@@ -4994,6 +5042,10 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 	int i;
 	int ret;
 
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		ret = icc_set_bw(camss->icc_path[i],
 				 icc_res[i].icc_bw_tbl.avg,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9d9a62640e25dce0e8d45af9df01bbfd64b9bb4b..bd5e572f0a0a7daa1668831b7d2fc60e0498200d 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -100,9 +100,15 @@ enum icc_count {
 	ICC_SM8250_COUNT = 4,
 };
 
+struct camss_pm_clk {
+	const char *name;
+	unsigned long rate;	/* 0 = do not set rate */
+};
+
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	struct camss_pm_clk pm_clks[CAMSS_RES_MAX];
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;

-- 
2.34.1


