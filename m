Return-Path: <linux-arm-msm+bounces-117863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qGhxOzhCT2oedAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:39:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E80BD72D414
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:39:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QxL4Hmsl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bdHotcYj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117863-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117863-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AA4E3032942
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B903D5237;
	Thu,  9 Jul 2026 06:35:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40AF3D47D4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:35:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578957; cv=none; b=QBN4jdtti4Thoa7E6xS6T2hlZAztilkLoJP+blyiIV4kAKlONeRaQQtJJwSVzUDYNYj9SLLjPWJlQkuRU58i0A5hGxO9MAGQVGW1qmlJKwuLPvGPJO9ryKVi6MKKiu8Voll02eb0akmpDrGXChSihuphCDEhyweYBqigKgCBRmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578957; c=relaxed/simple;
	bh=LbNgjWi3xdSg5QyRDAQ6cjP0KSXQ31Ga8mzLNFd928c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xfa1p6A1EgB6ZZOJaKRMPl1To+bJMiJErGmM0PLnn6A4kPTptbvau4dw0OEXp61UOTpQooDQSVemVHheeGgktQM3w61Rk+pFqZzk8UaOqgtfrUsn4ti4qCiIpJlCTMXoGYjnUvBFbQCh6g1iM34QKgmfkhlh0PDRZ5h6F5+nnhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxL4Hmsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdHotcYj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960PH3784627
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vAr7bLFrWMsutX0Fk9x/KNLJeHFhChUaxX3V5RJjvUk=; b=QxL4HmslkH2EgtGk
	0YNuOXaPN6C1oC+fMMdou0CTTDJMpVCRum6vRAev0zLAqiXLsd7gOVMmdxxcC8PJ
	IS67o4qHm2MDPyfA5e0roS5k6XQfjJ+Ga4UXDNYD9hpS8wAsDLCfYznInwEwheZi
	qBybdPyaRe3qkaq4hY0Fwg8vTW8h2AHuNnUkUuRb/ndahatupdOZIfWbW/SyIKWr
	69lKLm9CTPXiUp+12hCHdc3COS+sDToVyO6lqIdlrC8WQIZTm1MSRW+DedS6QjfG
	+13G47wrFd3ta2MbHj/OFPdWyzG2xnTBrboUpzlQp4k0kDWBq59ak5aceF8kJiTN
	wdUD4Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u27fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:35:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so2209445a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578949; x=1784183749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAr7bLFrWMsutX0Fk9x/KNLJeHFhChUaxX3V5RJjvUk=;
        b=bdHotcYjV8GwZMd6fdZ6Z+f2+tWa0rMjhZI5SrI+JtVcYhemLSizWfVoqbw3tYIM7s
         bL/vUQtbWGMHkp1EpxlhNZEXDsUEDtuzvU/25T/m9S4S7ZtfPE0PMGJMv8FD7qp9IXBt
         GLnm7I20LYhylFdGDifGCMsv9ku87y1zyIZ7iC8YjkrUke928oib6akDhGRKsNNXc6lr
         5GPjv1QH9jiu7/r+PxB2u9PpvSDGy4/2PC96ziU3tYuEtfgGNQlFVuHTN296LAFhfNGd
         HWy8cf+OlOrPHesxxufOVXL0vZsAhsV/w4s6awsQ950t2j9+n800u1lfoo5oLKWrrlPF
         1fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578949; x=1784183749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAr7bLFrWMsutX0Fk9x/KNLJeHFhChUaxX3V5RJjvUk=;
        b=HY+kzerbHK+H5BgOzXtY7MDPlJE5E64Unoysnp+QGB5ObIAKxVIrJcpyW4D5gZaF+D
         uCTakQtAD3HZ6U3EiYnarzGz9+u3G4LMYOvZbFwmxgJV13mOFlHZZGL6StJHbruOGnjV
         9aIMcLIZPB6FyhUMc1N9XXkYCnhMgp+BdLN3uWky9k/Q3E8ksqWBIH408p5PD740hmaP
         4i7jqvNyIL6XFYONrBhvV0bI4HQS7recvBMTYR5Nv13JI+O70rrqbXs+AkHh7iKZaoLy
         y2MetMdXh2mLztGOVuGG2ckQnqBgQN386ndX9qrGzaT/LLJRVEx/z7FKcAbkpxss5FlR
         u0cA==
X-Gm-Message-State: AOJu0YwGzHm9L88b1JAlpu+zUSbFso7nR8WA+CcyOxIh0WXl7A5O/Co7
	Q6f9vww6JvjAHfijb49i0DquCuo36ZnrBJBgMHJjkxyVTjUSxqka6XJoAoq2P+9wWu5cuwK5zMn
	vqu/obNZadok83Cjhj3YL9Ej5Wh9DILcJfSxC5ws0Kp1kqG9fr/5amiB/LvdnkvwluliB
X-Gm-Gg: AfdE7ckoe700ixGB8bqVDS1NsYDMLLZoxRRYiRJDUpJnFOMyTGdVrzAvtnnrc0zVZK3
	aJbqu6f3l4KEmSlNkHZzLpXyiu+qyFfptvCO55h+4TLgHIVxJb6KGrxuFrGaQcvvKAc310aFpUC
	cxTgfQd47Ma0TTXA7V+K6p+5J1Pna4XYq8dMeLDDUHbSJZY8sH45B2/96nkZA1sLHNTUn247c8p
	39695F4LpLgB8zwrt7/J+EigsRkkl2Gv6GKC0I/8c9NAhjFH1iyQb8aJ3zUIdLyGBX29WEyQ/IP
	Wlc6qw8NnyQzbXpLigHBtSpWmzExB1lJWHcHuNJbMtqejCH3D2VrY2haTEMQLBPBP8N3s0zW8iR
	60Z9qP1Ark6oVX8BUTn0yPvB843lzwR2uLNY0lugQGZ+gAw==
X-Received: by 2002:a05:6a20:a124:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c0bcc2429cmr7001238637.50.1783578949405;
        Wed, 08 Jul 2026 23:35:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:a124:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c0bcc2429cmr7001203637.50.1783578948903;
        Wed, 08 Jul 2026 23:35:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm28304294eec.16.2026.07.08.23.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:35:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:05:18 +0530
Subject: [PATCH v3 3/4] PCI: qcom: Add link retention support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-link_retain-v3-3-81a9d187bb61@oss.qualcomm.com>
References: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
In-Reply-To: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578926; l=6218;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=LbNgjWi3xdSg5QyRDAQ6cjP0KSXQ31Ga8mzLNFd928c=;
 b=KOIzWz7+c/zS1ZoEPHiWV3gJxkNGPdqTJYU1reCDuqcgpFXArV4s7DdqJeKEawtmH6tR1F9oh
 vK3kZycv1NiDQdPsp2/FNOMoAQ478BvdxYtHTs1PEP6H+UBX6Er0Ip6
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2MCBTYWx0ZWRfX5Ybe0++MRo60
 MA4geVAs7RFAf2aXl3qZrrGIk1vaiwdh7YygHhIG771itQeJCp57IuUKE43pn6onuLGQFOVysTe
 iN4FVxI7M7ZdvFS+QN11RwLbzFJpKxU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2MCBTYWx0ZWRfX2e30qb3I8gZm
 nq78rSiqktgQpGogmUj9eecjrM1Y8Ozd/XfsvLIoz1Q8Fze/wrivaDtt69xQXJL7ZuyAQEenA0E
 RkyA8uspskqdyMXrQBuew5Q39/urdrzaC1Vf22II8wgFgyTbUyNc9cKFPAFGxehh3fwUo82btDs
 ycWe7XgSTiWYWt2Iai6NWILqtkkbrkU/94KdGEMZA3Za8nIT8NpI9XTw4R4QKfTuGpaQ9UqdR+k
 B9ZhYOC8R1Z8/bbZ5ZyWNZErmsARlIuh8//SP0pOlnec3oYrkiEFExmerXH4WZDwdiFA19dyzig
 3LZN5BsuPVhhD06jS+WmDTxUidcr0LYUqBTpmIaOLJUU2xrJPLmKk0ql/z8jGtZcyvFEGUGcRht
 TUM718/h4vPX+lpkczq4S8SRR9MKaBgoffIJtefUD5xWjYkVRo4SVRTJRAX3fIrws7BpCbATY4/
 S+VMiAaccLtF81/RoXg==
X-Proofpoint-GUID: 7qa-Hc1A_caiDLPiZxkJtIAP5_6WKsM2
X-Proofpoint-ORIG-GUID: 7qa-Hc1A_caiDLPiZxkJtIAP5_6WKsM2
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f4146 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1q2gNXp5umABOXX4V9YA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117863-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E80BD72D414

Some platforms keep the PCIe link active across bootloader and kernel
handoff. Reinitializing the controller and toggling PERST# in such cases is
unnecessary when the driver does not need to retrain the link.

Introduce link_retain in both qcom_pcie_cfg and qcom_pcie to indicate when
link retention is supported. During initialization, check the LTSSM state;
if the link is already in L0 or L1 idle and LTSSM is enabled, set
link_retain and skip controller reset, PERST# toggling, and other post-
init steps.

The max-link-speed and num-lanes properties in Device Tree cap the link's
maximum capability. Retrain the link if the controller's max link speed or
width exceeds the Device Tree cap, unless the currently negotiated speed
or width is already within that cap, in which case the existing link can
still be retained.

Configure the DBI and ATU base addresses in the retention path, since the
bootloader may use different base addresses than those provided by the
device tree.

Set l1ss_support in the retention path as well, since it is otherwise only
set later in the normal init flow which is skipped when the link is
retained.

Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c       | 68 ++++++++++++++++++++++++++--
 2 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index de4b245b1758..0c98b914eb52 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -471,6 +471,7 @@ struct dw_pcie_rp {
 	bool			native_ecam;
 	bool                    skip_l23_ready;
 	bool			skip_pwrctrl_off;
+	bool			link_retain;
 };
 
 struct dw_pcie_ep_ops {
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 9ca620d4746a..77d2d989e9da 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -260,12 +260,14 @@ struct qcom_pcie_ops {
   * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
   * snooping
   * @firmware_managed: Set if the Root Complex is firmware managed
+  * @link_retain: Set if controller supports retaining link from bootloader
   */
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
 	bool override_no_snoop;
 	bool firmware_managed;
 	bool no_l0s;
+	bool link_retain;
 };
 
 struct qcom_pcie_perst {
@@ -996,6 +998,50 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	return 0;
 }
 
+/*
+ * Determine whether the link established by the bootloader can be reused.
+ *
+ * The max-link-speed and num-lanes specified in Device Tree are meant to cap
+ * the link's maximum capability. Retrain the link if the controller's max
+ * link speed/width exceeds the Device Tree cap, unless the currently
+ * negotiated speed/width is already within that cap, in which case the
+ * existing link can be retained as-is.
+ */
+static bool qcom_pcie_check_link_retain(struct qcom_pcie *pcie)
+{
+	u32 cap, speed, cur_speed, val, ltssm, width, cur_width;
+	struct dw_pcie *pci = pcie->pci;
+	u8 offset;
+
+	val = readl(pcie->parf + PARF_LTSSM);
+	ltssm = val & 0x1f;
+	if ((val & LTSSM_EN) &&
+	    (ltssm == DW_PCIE_LTSSM_L0 || ltssm == DW_PCIE_LTSSM_L1_IDLE)) {
+		qcom_pcie_configure_dbi_atu_base(pcie);
+
+		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+		cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+		speed = FIELD_GET(PCI_EXP_LNKCAP_SLS, cap);
+		width = dw_pcie_link_get_max_link_width(pci);
+
+		val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
+		cur_speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, val);
+		cur_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, val);
+
+		if (pci->max_link_speed > 0 && speed > pci->max_link_speed &&
+		    cur_speed > pci->max_link_speed)
+			return false;
+
+		if (pci->num_lanes > 0 && width > pci->num_lanes &&
+		    cur_width > pci->num_lanes)
+			return false;
+
+		return true;
+	}
+
+	return false;
+}
+
 static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
@@ -1014,6 +1060,15 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	if (ret < 0)
 		goto err_disable_regulators;
 
+	if (pcie->cfg->link_retain) {
+		pci->pp.link_retain = qcom_pcie_check_link_retain(pcie);
+		pci->l1ss_support = true;
+		if (pci->pp.link_retain) {
+			dev_info(dev, "Retaining PCIe link\n");
+			return 0;
+		}
+	}
+
 	ret = reset_control_assert(res->rst);
 	if (ret) {
 		dev_err(dev, "reset assert failed (%d)\n", ret);
@@ -1074,6 +1129,9 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 {
 	const struct qcom_pcie_cfg *pcie_cfg = pcie->cfg;
 
+	if (pcie->pci->pp.link_retain)
+		return 0;
+
 	if (pcie_cfg->override_no_snoop)
 		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
 				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
@@ -1364,12 +1422,13 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
 	int ret;
 
-	qcom_pcie_perst_assert(pcie);
-
 	ret = pcie->cfg->ops->init(pcie);
 	if (ret)
 		return ret;
 
+	if (!pp->link_retain)
+		qcom_pcie_perst_assert(pcie);
+
 	ret = qcom_pcie_phy_power_on(pcie);
 	if (ret)
 		goto err_deinit;
@@ -1398,7 +1457,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 
 	qcom_pcie_configure_ports(pcie);
 
-	qcom_pcie_perst_deassert(pcie);
+	if (!pp->link_retain)
+		qcom_pcie_perst_deassert(pcie);
 
 	if (pcie->cfg->ops->config_sid) {
 		ret = pcie->cfg->ops->config_sid(pcie);
@@ -1414,6 +1474,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (!pp->skip_pwrctrl_off)
 		pci_pwrctrl_power_off_devices(pci->dev);
 err_pwrctrl_destroy:
+	if (pp->link_retain && ret == -EPROBE_DEFER)
+		return ret;
 	if (ret != -EPROBE_DEFER && !pci->suspended)
 		pci_pwrctrl_destroy_devices(pci->dev);
 err_disable_phy:

-- 
2.34.1


