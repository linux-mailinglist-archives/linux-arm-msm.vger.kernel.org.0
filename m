Return-Path: <linux-arm-msm+bounces-102952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFb9Dyfg3GnrXgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:23:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C033EBDD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FAD33012BDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594823C454B;
	Mon, 13 Apr 2026 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzLNs6Gg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="huPLBe2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669E83C4548
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082975; cv=none; b=N97Vy+DJPMABg9lvhY1hRmUZ4h+K8U0qn8ZdbgI6iTVyH7flapM9a2WilFtbExQiLacZQFlkIl19iVXYRFuv1SUxIuFmg5izoKIvhtLy0yq4rxWX/MpCpUr+Po3Enl8UhdrfAsJOiZ9ZJZmv/rR9c2TYShPzGkrKWsb+dQsQLu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082975; c=relaxed/simple;
	bh=WqGjp+3nNmWD37jnenV4bomrrnmUA2taflFijifU3W0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=axd22xe2YxTINvz+pxQuXml7BvLm9QY34/ggcw99fWpWBW+XfamYKcKjy3f0V/0ZtEZ4/O6R7vztKrjrOwtqVmEmokQ4XvGJGj/Fwa2Kya4l5+zgo1+WBLnmKIuaUODQjMXOXEsF2TCgPLM6d7BrCVT6v7tnF1TDItGu+9NAIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzLNs6Gg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=huPLBe2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D79KrO480469
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jIHQxfHe8DT
	AODaHCq4F4LiV1LMXh8MqG2eRCRTxoak=; b=TzLNs6Ggz6DeART+AVrG3FRXxtD
	kyPJRNCrvj0usGt7jNTK7yp8mTmOe7beCeUW19wxAHkQAGLKH73aAynvuP9dS+h9
	2i8mGWW7fJc6SzoOak7pL3S3SYACHIQAVBj1fTiiIj7NLOCt7oQyxCUPaTUromOt
	8tcj2qJLXnSMH1H60D9LtL32tMBBUTWojSJtoe3o2wQwdCh1RQOi0OEuBPpKTxD+
	LyaoAtG0RpeaXjiCjg6ATQlAS11mDJkBNMAKXnTjiDeP1jw0bvAfNRDvEezOarf2
	Z+HjrcFPI1/ONNHLPU4JVVpzb5wB9+IHmukPfUL31Aun0YQn2T/g3BTxR2w==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguuj91bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:22:52 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-79064868702so93754557b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082972; x=1776687772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIHQxfHe8DTAODaHCq4F4LiV1LMXh8MqG2eRCRTxoak=;
        b=huPLBe2gQufZ3Kz1wblHBW7Wwinu5CYsQtSQ7j6UrN8hshtYJttcJd8WZD1JlzxXF7
         ZJ6Ry3x9I6pfCLbp5Tm05CeVvfqSOZIc6DSsOZ4KgKIFKcPQPreGSmstrGBjQRjtGGtD
         rWtsDZKAAOP70JSfiym+vPJipyheyIMODUZglWCbicmXOSe3GDP60ntEvEshrzQH0Ckx
         MsIczoOzpCG2xdRdHkKaol573hOjJs4Aufoy/NVVWa63cHvSlkEshvAIxzaF2tlFZ/Y9
         eZoJQTfdUy8mzz3R9M8ur5iZMZvIuI8MgJvSaCYu/Jp8MLXcbpSAejCZx0x/aseYUdAm
         buaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082972; x=1776687772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jIHQxfHe8DTAODaHCq4F4LiV1LMXh8MqG2eRCRTxoak=;
        b=HzbFTOsK0tSNe8U981SmJukFVw5cQCLFwDvT887RIGQ7dP5pSL9h0ethvGGGc36Ucj
         YLNsZ/27mCH/TCPB7DJcf6oDnEBg+IWv90gaY3e5oGI3Kk4Z6G+g9Io1Msj6jKLESseM
         9jcAVIiG5WyXgtOPYiN+DW8D0vc5oLhjwC9f3fHOJ/DvPPKqFLJvquPBnZn+Mg2eP8IQ
         DlTL5PEah1rUXLRi3lCkdbJwY+sOsfvuocQKO+1knSUS2kDGUoaequnU2SfyF7wcX665
         po7xhSro4lP3eLg1Tr6kdE8xsO5FMroGBGVs2IIAwHTV3YaR7BLRrOPThTn1qrT7xQgC
         JqKA==
X-Gm-Message-State: AOJu0Yw+wibxRwZ4L4Kh9H02bAzYqdRhRHUcRjZCMG65azcuifrdanBj
	qnFrbI/tUVbb62k/C8lu6uR/Od01RAGBC28fVlGGwbxKcnwLAKQa56NO+H74T2N3HCfAtaJmJXY
	CKSE+CulVe4MPZpySYH3qdL62tSJUmIC4PMoZXkU5BTJO8AGPAAad0uBnZMzHWyrVX8Jk
X-Gm-Gg: AeBDieuWJ1hXDIeQw3KdcJY8dUReO5w0u4JopnAvusVceIEThv4qRlt12vSM412k87r
	mrrulIYDHE4N6ql9vGwd0XDGxrWJmTPbdMuRI5f6fON8JAaNucee5FqL8brs5C5TTr1ll2V81KV
	Blg6cjBiVrkB7ZfCaO1h8wx5Oho7/AeX3mWi7sFHup9pIfcT4SwdlGc17kaOm81qA/6sV1/FKC2
	pt5d6XXGPnm+05ZtJDKZRcclCPh6+Kbfd9Y6qp4H0iqu9YliNEsRA8mj2m8WrD9ERurzqe5+CuV
	h5rxXzujs68vboNuLZm/durOp0I2D17WAyvOghYoY+CwVE/2a4IxZcoR52CAIOGWHkxuiiWVXYf
	ymzTDxXoSkXppLhK5MFgIacrXjzBrbrlLs/kfihYAXt0oZFhi0w==
X-Received: by 2002:a05:690c:60c6:b0:79c:a09a:e596 with SMTP id 00721157ae682-7af7253064dmr143747457b3.47.1776082971492;
        Mon, 13 Apr 2026 05:22:51 -0700 (PDT)
X-Received: by 2002:a05:690c:60c6:b0:79c:a09a:e596 with SMTP id 00721157ae682-7af7253064dmr143747127b3.47.1776082970937;
        Mon, 13 Apr 2026 05:22:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af400eb1fasm50781657b3.44.2026.04.13.05.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:22:50 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 1/3] pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
Date: Mon, 13 Apr 2026 17:52:31 +0530
Message-Id: <20260413122233.375945-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMiBTYWx0ZWRfX0dK55LSn+DgZ
 tyApUKVj4ROeZW8IB+PFVGHSFEiACAGB7w07nKbpf3k2OaavR6fdcILulc8x1nNNBR18bUejC5h
 QS0JpwVAKuKFbXg3gzdIne95PQHK8BEKC98E+GQJefRVz2jNxSDqVvQ/MSxrQnGzRhNzydixFzT
 M+Les7L2ck1QVaOE4Mvu05+4c0a0JJN35Yd15bC61yV9/RX7wpHt5XDRNDVBIbp+G+BY8nN2NnO
 1yw4wmmen8yTeQwi26yrJbK9TyB/D3Zkt+Ju8qL1xSP0Pa9E53r5RwFQoYlw4r8pFM0H+IMtyMb
 vIwy5P6REs6xEC/awdau7jW97/nFd/7uyWV+UqREHy44ZaBhwdG8IfRdKLVkVyez/AUQTSkRKJa
 Ugg+EOjLL8pXjqkUwMPiibHqEsnwbX4HpXpgYz1hUVkD+m9xhuV2uNMc3b4wXeTgyHXLqpe1Bzh
 wXsRwizZbR2+7EiQsfQ==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dce01c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=hf2oG6dDkt1_u3eYQosA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: qHpjlZ5iRebPN3EpKvvJRWdZNcJW7whB
X-Proofpoint-ORIG-GUID: qHpjlZ5iRebPN3EpKvvJRWdZNcJW7whB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130122
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102952-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0C033EBDD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the LPASS LPI pinctrl driver to use the PM clock framework for
runtime power management.

This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
improves power efficiency on platforms using LPASS LPI island mode, and
aligns the driver with common runtime PM patterns used across Qualcomm
LPASS subsystems.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 36 +++++++++++++------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  2 ++
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  5 +++
 3 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 76aed3296..6d50e06ef 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -14,15 +14,16 @@
 
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinmux.h>
 
 #include "../pinctrl-utils.h"
 
 #include "pinctrl-lpass-lpi.h"
+#include <linux/pm_clock.h>
 
 #define MAX_NR_GPIO		32
 #define GPIO_FUNC		0
-#define MAX_LPI_NUM_CLKS	2
 
 struct lpi_pinctrl {
 	struct device *dev;
@@ -31,7 +32,6 @@ struct lpi_pinctrl {
 	struct pinctrl_desc desc;
 	char __iomem *tlmm_base;
 	char __iomem *slew_base;
-	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
 	/* Protects from concurrent register updates */
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
@@ -480,9 +480,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	pctrl->clks[0].id = "core";
-	pctrl->clks[1].id = "audio";
-
 	pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->tlmm_base))
 		return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
@@ -495,13 +492,17 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 					     "Slew resource not provided\n");
 	}
 
-	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can't enable clocks\n");
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
 
 	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
 	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
@@ -539,20 +540,33 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 
 err_pinctrl:
+	pm_runtime_disable(dev);
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(lpi_pinctrl_probe);
 
+int lpi_pinctrl_runtime_suspend(struct device *dev)
+{
+	return pm_clk_suspend(dev);
+}
+EXPORT_SYMBOL_GPL(lpi_pinctrl_runtime_suspend);
+
+int lpi_pinctrl_runtime_resume(struct device *dev)
+{
+	return pm_clk_resume(dev);
+}
+EXPORT_SYMBOL_GPL(lpi_pinctrl_runtime_resume);
+
 void lpi_pinctrl_remove(struct platform_device *pdev)
 {
 	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
 	int i;
 
+	pm_runtime_disable(pctrl->dev);
+
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	for (i = 0; i < pctrl->data->npins; i++)
 		pinctrl_generic_remove_group(pctrl->ctrl, i);
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index f48368492..ae94ef48d 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -107,5 +107,7 @@ struct lpi_pinctrl_variant_data {
 
 int lpi_pinctrl_probe(struct platform_device *pdev);
 void lpi_pinctrl_remove(struct platform_device *pdev);
+int lpi_pinctrl_runtime_suspend(struct device *dev);
+int lpi_pinctrl_runtime_resume(struct device *dev);
 
 #endif /*__PINCTRL_LPASS_LPI_H__*/
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 750f41031..2d955643d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -139,10 +139,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(lpi_pinctrl_runtime_suspend, lpi_pinctrl_runtime_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
 		   .of_match_table = lpi_pinctrl_of_match,
+		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


