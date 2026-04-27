Return-Path: <linux-arm-msm+bounces-104725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAktFcNb72llAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:51:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B7C472CEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7550A301624B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE1C3C3433;
	Mon, 27 Apr 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxzE5sKU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eiagujgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3553C060B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294016; cv=none; b=efKdSFgsQXHxP0Oy9BhcwJfy+GwXhkSm0GFKPtFkzUmVSPl4xNUsASlRkOq27tV0d8nv5hLCpEKN0WI/HcE0sg1b1tQyGTPtRHlZ+X+YcRU0yTheMt3YDMNNvnoBCkMUWxyFBxInH+uCIr68v/ZRZ0R/cXbdSPhBi4tXBKJbhR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294016; c=relaxed/simple;
	bh=KTYQxoDHRK+AaxLzVW7P0uYiEE/yFjt5Rigb2R9yyTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wsroydu4mVPxx1BgK3q3ZCUfJqzNJ9uXpR3PY2om4rfdv0YKtu58qCrwzyWGfX8ENJjBxuIrqkjJquh65qyIPBgFTKHOu02d4vINCMJHEeyEpZKrheel3iFUL1akoKLmYECIqolb4T13dj+90AuddDI01xQ9sgIb+w2QfIh6VsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxzE5sKU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eiagujgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAaU2793059
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnBfolT3jX6CNISr4JxMcRA7ySnkS3THYsCQYykqpxA=; b=WxzE5sKUJY2CJxiK
	nESqJSdcWh/FJc+J3JBtN8HnTz1fuuzS2hrg2UBweobcL19MDT/Ouoo/xFeQd3ef
	brOpMDIlzKWfnwMzo0vpi96xZNEYl3/6sFYyfM3JpDQwuo17LIbvTzSYExoOtuOx
	w/UGwb+fLTsRArABEHW8tBnA9/yv7t73qemSza51qf4KcM5QKRNW0BkWiCAHw/XR
	rbmYp7hgCbOvaLbsjXY6PLz/OsVyAH78giWn9zdIk59Kw0W0glVd/Dbmxu7KposP
	48DeUl1MXSf+mwNN8sNf6FZBBX3F4//h/6Ub13Z2qk9IobI5uozO2qGEsLUMfbqc
	ieehiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uv6x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51009190feeso3481791cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294012; x=1777898812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnBfolT3jX6CNISr4JxMcRA7ySnkS3THYsCQYykqpxA=;
        b=Eiagujgi36awTPYrqmRdkgP6OU+ORKOONattM93eKzMuWQOYUkncHbu2czqXE0FikC
         1nzb/NaoPYD9OuRu6Fi6sUA9IIcsbvZz2+jYtTf0iQnP5rfBBqpzuESUl4knkuLUpbkk
         oo1t4YinT12rgK9ig+igwq8TslHxiO2CrbAJLNPQRjEhdOeIKofSTXGyXOPvA2WskqYi
         XSulytnKA/Q2u9KxiZKENzeaHlpNZRHdumLZENklZxNExhO1aI6zUkyUn5lbqeCj6UAV
         4c8bq4shcRPJhHHcu5ykPpdRRuG6UI60NzCyXwKfqt3g7bs8kkaseDI+wZW+YUqL7pon
         DxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294012; x=1777898812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnBfolT3jX6CNISr4JxMcRA7ySnkS3THYsCQYykqpxA=;
        b=AGhZ6DQ1/yUJ+hGfFr4MP639iYNVHTT1qR9Ka0pPD+OR4ILiJEDOETZHqf16WWiHg5
         gMMaps2gD1PVLmIZpP24Fhyrz2N3hoJDViRFXaOhR/lrZRbYhA8RJruZtFHR2E97OO0e
         7P4zAKcdImpAmlZgBTpfmvlBNS0cVAKHwINXSrYJOPl+9ghPMXEhuN7ooLZQlnp5vt49
         dEH3QDKmUwRHJre3sLjj22EQJMbvt80zsZgY/hJa09N52VGfvBccUhfkgW09C9PB+gza
         YA4l9+DLo5VOQlqIun3Ec5+JsEHUPaQTwS40rTlAr90ROWoBB+hkKwhs78xYN4ZCOhN2
         5MqA==
X-Forwarded-Encrypted: i=1; AFNElJ928ip6TNcwn+AkNCHjp7oeHotKL7EnZlIDW8ZogKovePCiFAtOe46bpnJYoseTHvj1VxIbm3cAzxrpQ52G@vger.kernel.org
X-Gm-Message-State: AOJu0YxU4SveXvFuBm/ZVjVVc4Ys6vVl8bp5v7z6QIxrbctgRof7OYfA
	QmCfJyvP5tpgzbYpXEycPes4uYWsEJpZ1anA9ijrviZF8Nys8TYoy5oLhAUtge5WtGtQm2vJISj
	n5eGqUnVOxxctV5QO8nUrbQ2+ab4d13bpOffdJcGemC35yF41rco1hJEBUic9XQzxZTqd
X-Gm-Gg: AeBDieuyOMw29QrBg+Juxq6GQqyLxcHQgVp+nAMZ6+uJ1AINtEcdyuWSyAybH0GRkel
	DZlcFzMNk03leb5/yS98y+KfMCrrF7mkbGn+U9Qg+guzLywA5B4rYgXsugUs606h4VuI8V5Hiij
	aS30Kzucfxys2MRfbVaFBXTOGEWFEEpNfYpC0S9DmPffBYt8qza92UWv7pYZRTBM1uuApX2feT3
	+L/Xs6vw9YDSgt4reSzeTkffXDIhRA8NzFHdOPXNlB0HHbrR8xWYRTIUC5srGWFrt1N4QKJy1+W
	QF/7djmBLHWFim0WM4EcK8QzNoHMBG1yDyRIdogDsrO2Mvmkqx+Xx3iI3fak/Iim41VYAEFfWo6
	LeIdswC6m6Vgvbs++/MelpaNOQWVHALnJe2NDoyPqlaufCI8T7A71FSPuHgxMhCZOqfGPPLFd0T
	H62MKEBIIzWMZBrF8gYAzGObqUkMA=
X-Received: by 2002:ac8:5895:0:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e36eba371mr600763721cf.42.1777294011650;
        Mon, 27 Apr 2026 05:46:51 -0700 (PDT)
X-Received: by 2002:ac8:5895:0:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e36eba371mr600763061cf.42.1777294011031;
        Mon, 27 Apr 2026 05:46:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:36 +0200
Subject: [PATCH v2 09/14] media: qcom: camss: Add camss-isp-params helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-9-f430e7485009@oss.qualcomm.com>
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
X-Proofpoint-GUID: y4wNe_nlWy5eXlyoD3PalEKlDOkZgffD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfXxlVQS0u0kmua
 WqIEGdl4z22dFVr2ZbggY5sF7lgLExL5HDmFRnERv8JnT5Qfkct9HVIoTEmy2zefgXCFmcw+ugi
 djTyasGeGNkflSwNC9qTCA4jqYEwTtNhAUwhAwAdJDr500XnQMpc3V9cgv64ZQnu2XE8pN1ob+p
 nk73OakzYtRsTsN8fPaVh0BauhKGkYEkoU8enzyN7USCq5hHAXedEYIqGxIx7i1/BxzGQViPN9X
 ULSEHwVKNP+jQ+C8wheLD6+HXTfiSWP6SBxFktrv8XUEwUMaMKsRj1HoWdji3NgTiVVOB5g28A+
 Fy0LOh4RvdvazenPKvBJ9hEkbuq0OYf7KM7sPWvWZCVP25JT9LB/eUoC9Llve5rpT6Jt8h8XNQf
 0ZNvP4/F/IWsMxfjVVzfyqfSL5E9Xu1k9ybzCuGKAiqfJK/gesNpX6iw0O4+vVw9YjvneWBYhgq
 BotSJp7PU0HijAh2RNg==
X-Proofpoint-ORIG-GUID: y4wNe_nlWy5eXlyoD3PalEKlDOkZgffD
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef5abc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ELVW7ba-Z2avb-AJsJIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: B8B7C472CEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104725-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add an ISP parameter buffer parser for CAMSS offline ISP drivers.
camss_isp_params_apply() wraps the upstream v4l2-isp buffer validation
and adds a dispatch layer: after validation each block is forwarded
to a driver-supplied handler indexed by block type.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |  3 +-
 .../media/platform/qcom/camss/camss-isp-params.c   | 67 ++++++++++++++++++++++
 .../media/platform/qcom/camss/camss-isp-params.h   | 62 ++++++++++++++++++++
 3 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index f3acb1b54b6c1455d72e2d947c860f0c337648de..fba6f34b8d9f70ea258f7ae1a293a8d58d866498 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -32,7 +32,8 @@ obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
 
 qcom-camss-isp-objs := camss-isp-bufq.o \
 		camss-isp-sched.o \
-		camss-isp-pipeline.o
+		camss-isp-pipeline.o \
+		camss-isp-params.o
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS_ISP) += qcom-camss-isp.o
 
diff --git a/drivers/media/platform/qcom/camss/camss-isp-params.c b/drivers/media/platform/qcom/camss/camss-isp-params.c
new file mode 100644
index 0000000000000000000000000000000000000000..66dc717bb3a2a26707d206e537691deb4d58f04d
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-params.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-isp-params.c
+ *
+ * CAMSS ISP parameter buffer parser.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <media/videobuf2-core.h>
+#include <media/v4l2-isp.h>
+
+#include "camss-isp-params.h"
+
+int camss_isp_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_isp_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv)
+{
+	const struct v4l2_isp_params_buffer *buf;
+	unsigned int remaining;
+	unsigned int offset = 0;
+	int ret;
+
+	ret = v4l2_isp_params_validate_buffer_size(dev, vb,
+					v4l2_isp_params_buffer_size(CAMSS_PARAMS_MAX_PAYLOAD));
+	if (ret)
+		return ret;
+
+	buf = vb2_plane_vaddr(vb, 0);
+
+	ret = v4l2_isp_params_validate_buffer(dev, vb, buf, type_info, num_handlers);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "params: version=%u data_size=%u\n", buf->version, buf->data_size);
+
+	remaining = buf->data_size;
+
+	while (remaining >= sizeof(struct v4l2_isp_params_block_header)) {
+		const union camss_isp_params_block *block =
+			(const union camss_isp_params_block *)&buf->data[offset];
+		u16 type  = block->header.type;
+		u32 bsize = block->header.size;
+
+		if (type < num_handlers && handlers[type])
+			handlers[type](priv, block);
+		else
+			dev_dbg(dev, "params: no handler for block type %u\n", type);
+
+		offset += bsize;
+		remaining -= bsize;
+	}
+
+	dev_dbg(dev, "params: buffer parsed successfully\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(camss_isp_params_apply);
+
+MODULE_DESCRIPTION("CAMSS ISP parameter buffer parser");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-isp-params.h b/drivers/media/platform/qcom/camss/camss-isp-params.h
new file mode 100644
index 0000000000000000000000000000000000000000..4cedfbc745f81655569ff8bdd8e389b35f2c67a7
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-params.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-isp-params.h
+ *
+ * CAMSS ISP parameter buffer parser.
+ *
+ * Wraps the upstream v4l2_isp_params_validate_buffer() validation and adds
+ * a dispatch layer: after validation each block is forwarded to a
+ * driver-supplied handler.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef CAMSS_ISP_PARAMS_H
+#define CAMSS_ISP_PARAMS_H
+
+#include <linux/types.h>
+#include <media/v4l2-isp.h>
+#include <uapi/linux/camss-config.h>
+
+#define CAMSS_ISP_PARAMS_FMT_INIT \
+	{ .fourcc = V4L2_META_FMT_QCOM_ISP_PARAMS, .depth = 8, .align = 0, .num_planes = 1 }
+
+#define CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY   (1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
+
+struct device;
+struct vb2_buffer;
+struct camss_isp_fmt;
+
+union camss_isp_params_block {
+	struct v4l2_isp_params_block_header header;
+	struct camss_params_wb_gain         wb_gain;
+	struct camss_params_chroma_enhan   chroma_enhan;
+	struct camss_params_color_correct  color_correct;
+};
+
+typedef void (*camss_isp_params_handler_fn)(void *priv, const union camss_isp_params_block *block);
+
+/**
+ * camss_isp_params_apply - validate and dispatch a params buffer
+ *
+ * @dev:          device for error logging
+ * @vb:           the vb2 buffer (used for size validation)
+ * @type_info:    per-block-type validation info, indexed by block type
+ * @handlers:     per-block-type handlers, indexed by block type
+ * @num_handlers: number of entries in @type_info and @handlers
+ * @priv:         opaque pointer forwarded to each handler
+ *
+ * Calls v4l2_isp_params_validate_buffer_size(), then
+ * v4l2_isp_params_validate_buffer(), then walks the validated block stream
+ * dispatching each block to its handler.
+ *
+ * Returns 0 on success, negative errno on validation failure.
+ */
+int camss_isp_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_isp_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv);
+
+#endif /* CAMSS_ISP_PARAMS_H */

-- 
2.34.1


