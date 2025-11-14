Return-Path: <linux-arm-msm+bounces-81820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C201C5C62B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 10:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8140C5056C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BE130AAB3;
	Fri, 14 Nov 2025 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BHB1/yNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42813093DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763112682; cv=none; b=rVZDjx7YYCnf3tNiRKFn9gizHmG2AjL4dHsskN5pt2N7ySs2fWlewH4IsXllGoEHYjQO+SWAku4tqsZneZAkEDEWIOXdoBO9vDKHx4DJqk4fw+Qpmu2+nJOKrtUvM0L//w1Z9z5xjZCpZ1I6F5i3vanUbRXmBFJH+JwZhDeBI2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763112682; c=relaxed/simple;
	bh=T6YuXb734/ygf+0vM/phTPDFUm5FVnnNeVk/SsxUKbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Muc9t8x+cAPLJpo/mCfqDiIfJUSBCau6JK3X6F3jAtXDXUEo5oW79Kz7Ew0TLPOGc5Sf6f+N+zcKq/uOqv4tFcGDQgWzhcl69hL3evujSoek1uDckCstYnEsXzDrdsDM7gS1k5/MuUxglYCvg31J7yCll8ChudJ4LE6jO/+nycs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BHB1/yNy; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7370698a8eso35417366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 01:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763112678; x=1763717478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5R21p9Vq6BqN2XMtSXYRBpypTUAovOSUjdiGreLgok=;
        b=BHB1/yNy84vl9tWRoY7oq44jVZERJpSdffTlZNL/V1P47eKceN8LuW2C92E++HjkDP
         XF3EXRmd3EMDLBGENDMky8MUn++3ad/S2ayuR+CxT9Gahl2TOItMVG+ZKq0ED7tQKVLr
         u+aAskPNMG9QdkS8+w3+i6TvBuYOsiKkNDGAKFHztMBakeBvXcUihD52BK4/HKAA4/vg
         /yEl1cB1+8IhK+GvT4cpRNaqQJ6weFXFIJd36qy6dL36o5EiRWNTmbuFDdzL7jUrlD7w
         dUO7viw2qYD3pgE7VCRT8PXVo+Zuq8sYqlva74KJ/L2JNBaPmAoNG5qci9040LNXC4VK
         hixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763112678; x=1763717478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e5R21p9Vq6BqN2XMtSXYRBpypTUAovOSUjdiGreLgok=;
        b=AX0bXsWMgyjG4iGwmEBsa2RyX1T/xFVaA6gjOZ9Fl2rD4XQQPH/AAYrBN/o23A7gVc
         2GW/ZvLKc2Iflm3AQsGJ6fiMlYE+LymwCrfh/aem3IQ7tDb61McjPu4iRAkwR7Za0JBx
         qbjX+c++xl2KQ3ftPbGVXv5TUh7vNUR9+h0r2sgKErtVFjUbyxiLWBroeCS4JqRjUnIS
         YlFJGOCtFN7a9TcRUZmVysQNkMNF9hqASJ8bFT1EeqVzbAehwHCpB3zsE6Wir6ZqvbVF
         mdv/9CI93DUNZYUlJu/NXp95HaZAYuQ8ZzLKik6ygG/Xs1SP5f0W3QxfpAnzDhhAi1Fl
         IxYA==
X-Forwarded-Encrypted: i=1; AJvYcCUBi6yoSDZHyXQc1CKUYHNt5yYugVsKUiuSBeQ14ibe1+w8ceWsnII6CiBpL0Q0b75QRQcRrmCVZC6/BEST@vger.kernel.org
X-Gm-Message-State: AOJu0YwRJqTyFunxH5DoAxpf50KUuJCR6OLFP8SsRBs6Lx9MbuzRY0gJ
	WOq+4dz3bOYqHZeAihhd2JJn4geN7pKMl2aW9IrbnG5amJ7J/rFHwONy3hfBBHeSwzoyOW5DfTD
	3B9AAlO4=
X-Gm-Gg: ASbGncvzM7J7ELTUdpiTiy9uVsatfCNKGRGyqT4TzX058U7rFIlwLoKhD/tPZ1n7QnD
	6rq4FNi3zCi2JyVO1NBXCxMGYph0L7E6M2LTbzc5LOv5WlwY8vPtk30U/f8Fp5O4mlwmyHwWgud
	KVYxKOExhaMra9hUna2gGOhFUzjIb2t1m/4xKyaRKz26F99YkDU0IuhKWT+3HpA82wOnkr48ZHY
	D31EKE3flLyddMWopGwKnD0wrvpvdpbRMRSoZ/vlQokcNFpMSDtGqLJMPFlOz4ehUzRy3KjRMpE
	JEix81BXD8HXAIi5iaO8kgUVT96+nCzm1lR3FZgVDBuK3UENaciEvGbDPK3s+Q1VPoOMYMavcOu
	lzpU7McQcdITlPYoqrrLcvjymRYP9VTZUfonbIh3RAKUjR2PnvO4FzIB9BHLufZBLYlzbmcMDGd
	h2NL6XmE0eKp8wa5FR8HdH3DEmCo2MJ3TB5Rc9oetQobv3GS5LA12Z1vQMS4EQtNDElGuh6+EN/
	fi6i9Jp0n3fkeKoh6Cys9N/j2nyag3Daw==
X-Google-Smtp-Source: AGHT+IHv+zVA9CAHVMA5Y+PURmSek6BBWv4SIg7yr9zgsWTKPeHzlLdjTuVq7uNp92wbkneltu4w9w==
X-Received: by 2002:a17:907:a41:b0:b73:3af7:b6e5 with SMTP id a640c23a62f3a-b73678d2b45mr239348866b.15.1763112677287;
        Fri, 14 Nov 2025 01:31:17 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80841sm352104366b.41.2025.11.14.01.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:31:16 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Nov 2025 10:31:12 +0100
Subject: [PATCH v2 4/5] interconnect: qcom: sm6350: enable QoS
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-sm6350-icc-qos-v2-4-6af348cb9c69@fairphone.com>
References: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
In-Reply-To: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763112672; l=15166;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=T6YuXb734/ygf+0vM/phTPDFUm5FVnnNeVk/SsxUKbg=;
 b=0rr2TTujwI8WIVZUuf2lQzNvsuDWnCIPjQfsRi8bVimMZWw3REMj6HZrlevLNSiYuSGVp7IEl
 xdAbGD5fqUNDpw5IwM95ipZbSfHM7gRKA975nHq1GZJFbgcVe3he+MG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable QoS configuration for master ports with predefined values for
priority and urgency forwarding.

While this does require some "clocks" to be specified in devicetree to
work correctly, thanks to ".qos_requires_clocks = true," this is
backwards compatible with old DT as QoS programming will be skipped for
aggre1_noc and aggre2_noc when clocks are not provided.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/qcom/sm6350.c | 288 +++++++++++++++++++++++++++++++++++++
 1 file changed, 288 insertions(+)

diff --git a/drivers/interconnect/qcom/sm6350.c b/drivers/interconnect/qcom/sm6350.c
index 246549cb761e..d96bec1cbb26 100644
--- a/drivers/interconnect/qcom/sm6350.c
+++ b/drivers/interconnect/qcom/sm6350.c
@@ -150,26 +150,50 @@ static struct qcom_icc_node qhm_a1noc_cfg = {
 	.link_nodes = { &srvc_aggre1_noc },
 };
 
+static struct qcom_icc_qosbox qhm_qup_0_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0xa000 },
+	.prio = 2,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node qhm_qup_0 = {
 	.name = "qhm_qup_0",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &qhm_qup_0_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
 
+static struct qcom_icc_qosbox xm_emmc_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x7000 },
+	.prio = 2,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node xm_emmc = {
 	.name = "xm_emmc",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &xm_emmc_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
 
+static struct qcom_icc_qosbox xm_ufs_mem_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x8000 },
+	.prio = 4,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node xm_ufs_mem = {
 	.name = "xm_ufs_mem",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &xm_ufs_mem_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -182,58 +206,113 @@ static struct qcom_icc_node qhm_a2noc_cfg = {
 	.link_nodes = { &srvc_aggre2_noc },
 };
 
+static struct qcom_icc_qosbox qhm_qdss_bam_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0xb000 },
+	.prio = 2,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node qhm_qdss_bam = {
 	.name = "qhm_qdss_bam",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &qhm_qdss_bam_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
 
+static struct qcom_icc_qosbox qhm_qup_1_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x9000 },
+	.prio = 2,
+	.urg_fwd = 0,
+};
 static struct qcom_icc_node qhm_qup_1 = {
 	.name = "qhm_qup_1",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &qhm_qup_1_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
 
+static struct qcom_icc_qosbox qxm_crypto_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x6000 },
+	.prio = 2,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node qxm_crypto = {
 	.name = "qxm_crypto",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &qxm_crypto_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
 
+static struct qcom_icc_qosbox qxm_ipa_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x7000 },
+	.prio = 2,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node qxm_ipa = {
 	.name = "qxm_ipa",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &qxm_ipa_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
 
+static struct qcom_icc_qosbox xm_qdss_etr_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0xc000 },
+	.prio = 2,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node xm_qdss_etr = {
 	.name = "xm_qdss_etr",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &xm_qdss_etr_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
 
+static struct qcom_icc_qosbox xm_sdc2_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x18000 },
+	.prio = 2,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node xm_sdc2 = {
 	.name = "xm_sdc2",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &xm_sdc2_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
 
+static struct qcom_icc_qosbox xm_usb3_0_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0xd000 },
+	.prio = 2,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node xm_usb3_0 = {
 	.name = "xm_usb3_0",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &xm_usb3_0_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -278,18 +357,34 @@ static struct qcom_icc_node qup1_core_master = {
 	.link_nodes = { &qup1_core_slave },
 };
 
+static struct qcom_icc_qosbox qnm_npu_qos = {
+	.num_ports = 2,
+	.port_offsets = { 0xf000, 0x11000 },
+	.prio = 0,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qnm_npu = {
 	.name = "qnm_npu",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &qnm_npu_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_cdsp_gemnoc },
 };
 
+static struct qcom_icc_qosbox qxm_npu_dsp_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x13000 },
+	.prio = 0,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qxm_npu_dsp = {
 	.name = "qxm_npu_dsp",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &qxm_npu_dsp_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_cdsp_gemnoc },
 };
@@ -401,19 +496,35 @@ static struct qcom_icc_node qhm_cnoc_dc_noc = {
 			&qhs_gemnoc },
 };
 
+static struct qcom_icc_qosbox acm_apps_qos = {
+	.num_ports = 2,
+	.port_offsets = { 0x2f100, 0x2f000 },
+	.prio = 0,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node acm_apps = {
 	.name = "acm_apps",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &acm_apps_qos,
 	.num_links = 2,
 	.link_nodes = { &qns_llcc,
 			&qns_gem_noc_snoc },
 };
 
+static struct qcom_icc_qosbox acm_sys_tcu_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x35000 },
+	.prio = 6,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node acm_sys_tcu = {
 	.name = "acm_sys_tcu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &acm_sys_tcu_qos,
 	.num_links = 2,
 	.link_nodes = { &qns_llcc,
 			&qns_gem_noc_snoc },
@@ -429,53 +540,101 @@ static struct qcom_icc_node qhm_gemnoc_cfg = {
 			&qhs_mdsp_ms_mpu_cfg },
 };
 
+static struct qcom_icc_qosbox qnm_cmpnoc_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x2e000 },
+	.prio = 0,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qnm_cmpnoc = {
 	.name = "qnm_cmpnoc",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &qnm_cmpnoc_qos,
 	.num_links = 2,
 	.link_nodes = { &qns_llcc,
 			&qns_gem_noc_snoc },
 };
 
+static struct qcom_icc_qosbox qnm_mnoc_hf_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x30000 },
+	.prio = 0,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qnm_mnoc_hf = {
 	.name = "qnm_mnoc_hf",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &qnm_mnoc_hf_qos,
 	.num_links = 2,
 	.link_nodes = { &qns_llcc,
 			&qns_gem_noc_snoc },
 };
 
+static struct qcom_icc_qosbox qnm_mnoc_sf_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x34000 },
+	.prio = 0,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qnm_mnoc_sf = {
 	.name = "qnm_mnoc_sf",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &qnm_mnoc_sf_qos,
 	.num_links = 2,
 	.link_nodes = { &qns_llcc,
 			&qns_gem_noc_snoc },
 };
 
+static struct qcom_icc_qosbox qnm_snoc_gc_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x32000 },
+	.prio = 0,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qnm_snoc_gc = {
 	.name = "qnm_snoc_gc",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &qnm_snoc_gc_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_llcc },
 };
 
+static struct qcom_icc_qosbox qnm_snoc_sf_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x31000 },
+	.prio = 0,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qnm_snoc_sf = {
 	.name = "qnm_snoc_sf",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &qnm_snoc_sf_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_llcc },
 };
 
+static struct qcom_icc_qosbox qxm_gpu_qos = {
+	.num_ports = 2,
+	.port_offsets = { 0x33000, 0x33080 },
+	.prio = 0,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node qxm_gpu = {
 	.name = "qxm_gpu",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &qxm_gpu_qos,
 	.num_links = 2,
 	.link_nodes = { &qns_llcc,
 			&qns_gem_noc_snoc },
@@ -497,50 +656,98 @@ static struct qcom_icc_node qhm_mnoc_cfg = {
 	.link_nodes = { &srvc_mnoc },
 };
 
+static struct qcom_icc_qosbox qnm_video0_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0xf000 },
+	.prio = 2,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qnm_video0 = {
 	.name = "qnm_video0",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &qnm_video0_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
 
+static struct qcom_icc_qosbox qnm_video_cvp_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0xe000 },
+	.prio = 5,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qnm_video_cvp = {
 	.name = "qnm_video_cvp",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &qnm_video_cvp_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
 
+static struct qcom_icc_qosbox qxm_camnoc_hf_qos = {
+	.num_ports = 2,
+	.port_offsets = { 0xa000, 0xb000 },
+	.prio = 3,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qxm_camnoc_hf = {
 	.name = "qxm_camnoc_hf",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &qxm_camnoc_hf_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
 
+static struct qcom_icc_qosbox qxm_camnoc_icp_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0xd000 },
+	.prio = 5,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node qxm_camnoc_icp = {
 	.name = "qxm_camnoc_icp",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &qxm_camnoc_icp_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
 
+static struct qcom_icc_qosbox qxm_camnoc_sf_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x9000 },
+	.prio = 3,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qxm_camnoc_sf = {
 	.name = "qxm_camnoc_sf",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &qxm_camnoc_sf_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
 
+static struct qcom_icc_qosbox qxm_mdp0_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0xc000 },
+	.prio = 3,
+	.urg_fwd = 1,
+};
+
 static struct qcom_icc_node qxm_mdp0 = {
 	.name = "qxm_mdp0",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &qxm_mdp0_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -616,19 +823,35 @@ static struct qcom_icc_node qnm_gemnoc = {
 			&xs_qdss_stm },
 };
 
+static struct qcom_icc_qosbox qxm_pimem_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0xd000 },
+	.prio = 2,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node qxm_pimem = {
 	.name = "qxm_pimem",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &qxm_pimem_qos,
 	.num_links = 2,
 	.link_nodes = { &qns_gemnoc_gc,
 			&qxs_imem },
 };
 
+static struct qcom_icc_qosbox xm_gic_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0xb000 },
+	.prio = 3,
+	.urg_fwd = 0,
+};
+
 static struct qcom_icc_node xm_gic = {
 	.name = "xm_gic",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &xm_gic_qos,
 	.num_links = 1,
 	.link_nodes = { &qns_gemnoc_gc },
 };
@@ -1388,11 +1611,21 @@ static struct qcom_icc_node * const aggre1_noc_nodes[] = {
 	[SLAVE_SERVICE_A1NOC] = &srvc_aggre1_noc,
 };
 
+static const struct regmap_config sm6350_aggre1_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x15080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sm6350_aggre1_noc = {
+	.config = &sm6350_aggre1_noc_regmap_config,
 	.nodes = aggre1_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
 	.bcms = aggre1_noc_bcms,
 	.num_bcms = ARRAY_SIZE(aggre1_noc_bcms),
+	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const aggre2_noc_bcms[] = {
@@ -1413,11 +1646,21 @@ static struct qcom_icc_node * const aggre2_noc_nodes[] = {
 	[SLAVE_SERVICE_A2NOC] = &srvc_aggre2_noc,
 };
 
+static const struct regmap_config sm6350_aggre2_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1f880,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sm6350_aggre2_noc = {
+	.config = &sm6350_aggre2_noc_regmap_config,
 	.nodes = aggre2_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
 	.bcms = aggre2_noc_bcms,
 	.num_bcms = ARRAY_SIZE(aggre2_noc_bcms),
+	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const clk_virt_bcms[] = {
@@ -1459,7 +1702,16 @@ static struct qcom_icc_node * const compute_noc_nodes[] = {
 	[SLAVE_CDSP_GEM_NOC] = &qns_cdsp_gemnoc,
 };
 
+static const struct regmap_config sm6350_compute_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1f880,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sm6350_compute_noc = {
+	.config = &sm6350_compute_noc_regmap_config,
 	.nodes = compute_noc_nodes,
 	.num_nodes = ARRAY_SIZE(compute_noc_nodes),
 	.bcms = compute_noc_bcms,
@@ -1532,7 +1784,16 @@ static struct qcom_icc_node * const dc_noc_nodes[] = {
 	[SLAVE_LLCC_CFG] = &qhs_llcc,
 };
 
+static const struct regmap_config sm6350_dc_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x3200,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sm6350_dc_noc = {
+	.config = &sm6350_dc_noc_regmap_config,
 	.nodes = dc_noc_nodes,
 	.num_nodes = ARRAY_SIZE(dc_noc_nodes),
 };
@@ -1561,7 +1822,16 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
 	[SLAVE_SERVICE_GEM_NOC] = &srvc_gemnoc,
 };
 
+static const struct regmap_config sm6350_gem_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x3e200,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sm6350_gem_noc = {
+	.config = &sm6350_gem_noc_regmap_config,
 	.nodes = gem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
 	.bcms = gem_noc_bcms,
@@ -1588,7 +1858,16 @@ static struct qcom_icc_node * const mmss_noc_nodes[] = {
 	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
 };
 
+static const struct regmap_config sm6350_mmss_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c100,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sm6350_mmss_noc = {
+	.config = &sm6350_mmss_noc_regmap_config,
 	.nodes = mmss_noc_nodes,
 	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
 	.bcms = mmss_noc_bcms,
@@ -1643,7 +1922,16 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
 	[SLAVE_TCU] = &xs_sys_tcu_cfg,
 };
 
+static const struct regmap_config sm6350_system_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x17080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sm6350_system_noc = {
+	.config = &sm6350_system_noc_regmap_config,
 	.nodes = system_noc_nodes,
 	.num_nodes = ARRAY_SIZE(system_noc_nodes),
 	.bcms = system_noc_bcms,

-- 
2.51.2


