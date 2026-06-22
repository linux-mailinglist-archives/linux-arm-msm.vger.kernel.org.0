Return-Path: <linux-arm-msm+bounces-113932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id apUcOBXROGo7igcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:07:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B396ACE2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:07:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y5MI4REF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W6jQSTNZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113932-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113932-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F66B3001389
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92FA35DA6D;
	Mon, 22 Jun 2026 06:07:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C5A2459FE
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:07:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108432; cv=none; b=oBBrf8aM9L7agn2ZLwmZivOGW7miqVpbbm1iWlzo3GyhkcWpE92DCNpcFCHRPnZIJrc7R/W3Y0DcjNYRZgduzcImLnypGRVr42Drmn9fBdom8nHUzsVPIqlvKkB70S3+ZQtABgN9Y8vqG82xkcn+Xfge0sSJel2rhNeALkBsfmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108432; c=relaxed/simple;
	bh=5irhzn6Cp2G0PLGg3cIT8ZOQfv1WOTFTON/xQ42iNk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=huXA5vsHoJ9NwoSMr2+6CNpc7yJCYQCY6BWJUPQqLR+uoYgKmPw4o6KRthpz0S6H/QAuoo0ZMj7tfaapIaqqQ2mlanQrcW19skw1sbwG/Wq5rnVQQh5nN2ZbQWCP1qqt1Za1b8g9aXxIf7vn4+m+8ebrk8URx8+3A7DPEUT12cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5MI4REF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6jQSTNZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BJo4255307
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jYZGbAB/vtFz8e1ISLusJFHfS4ttaW8UIMswF9R7Kt8=; b=Y5MI4REF7+/cheTz
	7LYPT37DIGSOmz2pB+fz+LutBQFLgxbEATS3qgZRvzdMmyd73VCxljsRo3Ugmdnj
	i4ROoVvBkl6LFrt5AbTM5kAs7ECL2uIaGtnW7v84CCAbt/nloZini/kTVEfw23/E
	XfCOwx4Xz68Pqho5ZEMogZv4zQIUS/ztu5INMa5j67m+g4Mm00GOUxVsH6bWJFXQ
	5QLqwhLBuTxXDZC4RFxRc3S9HqjyvGjDX1JBMWEZuUq5leHYMhrNYdRU3G2cNV+g
	b42KMvHJqiF+kEARRZXDfunqrc92WTMmTFFQFmBfr1OBZ4vBv6gMQEywJhw8BGso
	dzh96A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5n44x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:07:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453031c57cso5746032b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 23:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782108427; x=1782713227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYZGbAB/vtFz8e1ISLusJFHfS4ttaW8UIMswF9R7Kt8=;
        b=W6jQSTNZ8XbHGnN8CV5TsY4NzJwbqkKKnSXbVW1XDX8hsJqLH4u3Qe5KNO71tWwJu5
         Ed+cxrMuXU8AQKQKY/6P3qajDs390s4eLPTCn58au0Ew+AMJ+uVsux/BrYQvDWkRXghb
         H9fUkwulgDXnZu0G6J/l/PuB1VUdyNSTSNa2FAgBGVC4LGONSCcwEi0y4nq1XquaAH47
         1385CqY488VT/QoY6P0q++KdmEP/kUV0Pji30KEnFNjetnsNqUWfzrI14yspYPBJW0H3
         2+MotSElHzR4HzH/bkzcVAK/mIEWvDmbFrAqAg/OCQfJusth3Ld0jDO9dXx9eHKpu6i4
         ubaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782108427; x=1782713227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jYZGbAB/vtFz8e1ISLusJFHfS4ttaW8UIMswF9R7Kt8=;
        b=YjZYm8+EJjDDzdf1bgO69NAIrIdD8Rvz/RlBt5DhIWI0m4dbkfV1U0F59B6pZ4KKhW
         YFOWit7cqUCQEKl55EDDyKIPy2lHhhgv7ootXpii58kwwNgBaCijUZ9E1OUI1RfBf0Q/
         G5bcKFGkns/iZVMhn0ssxMYXyI/J+dRJRAYtauzy5JyRNPIq0Aj01duZPTkfP6+FDRmO
         YaliViXMLjk7lmSNNO7UxwSnp6d9WHqch344rA6VCirzFx3H/I4aw5Fyd3mb+0VCh2Po
         faaQ2BOwBFvX7CLea85KP0DZC38ZBbb4x02/XNObDBuqb9i4Kd0JUxrdgqnlWDhXMxiU
         /mAw==
X-Gm-Message-State: AOJu0YxP6zy3vNaweOjri+DTKA7YgWzuvqwRoVN9J/OXpm/cts1v2zQy
	wOkver7uBMjDUwTyhywpiB3N86EpjT//hm8gn5E47HaxGiXIyJ4fCLDmR83qLZF6pj/tN3VcTca
	42xrYoSPmZPpdu9uCbfuA+iXQsYSKSzlzp7xY0C8OEVzIVunfRj7IYQh/VxWjBsH7RiNA
X-Gm-Gg: AfdE7ck7W/iRSFGF3UFA/Ox1vkd3cWbZgjrkSNXbZuUs0XMprgWQHqvOtRmFvAgDOmF
	pVlzXS9fdQdp9nvpdqvM4BnuKqjZAEpjGXFvwLryuVdgBdBra1ifhHC7BUpvj5y002BSMn5QzOD
	2O3gn5X7Q8UruDC55ZkaYFVhZf9ZLbjgiMpG8POC1A7nxk0Kdr2nJI8gJ8VxVQ6/ix/f8VFPul/
	0EGHuXXGKGloXRNpeT33heMl2Mvm+KlKsNOWyKY2cVsOFPu94995QSuRBtgZ3vWMFSWpNN1KdRI
	uziyMx7rYm/B77Efh6OBt3FXHlBArERp3Q3uMfgBXYk+pT/hsuc0J+Js4iqv8vl1WHsSi1MAbsR
	owxjOr5PGnuiHDQn5S5vfuQsuzJpjZX5vWg==
X-Received: by 2002:a05:6a00:ab09:b0:842:6482:aeb with SMTP id d2e1a72fcca58-845507a0f7cmr14290465b3a.12.1782108426570;
        Sun, 21 Jun 2026 23:07:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab09:b0:842:6482:aeb with SMTP id d2e1a72fcca58-845507a0f7cmr14290411b3a.12.1782108425842;
        Sun, 21 Jun 2026 23:07:05 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7696dsm8040520b3a.37.2026.06.21.23.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:07:05 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 06:06:53 +0000
Subject: [PATCH 2/2] interconnect: qcom: add Maili interconnect provider
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-maili_icc-v1-2-0aa8286e6748@oss.qualcomm.com>
References: <20260622-maili_icc-v1-0-0aa8286e6748@oss.qualcomm.com>
In-Reply-To: <20260622-maili_icc-v1-0-0aa8286e6748@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA1NyBTYWx0ZWRfX7baxkYPe52P8
 Mpj5hKwycYnzPUaVrkL+c+/3dF3jvkd9yK7uZjfNR8ShWKkqpeiozWf7J5yxLYvRz3cREnp2ElO
 OXxL5GsX+dKF9OOXr6KiqWib5NtKyEmAV2CjkPBH+zetqmIXRf4aJ0MqykwzBHh60HxYSwikSRr
 V3O4n4DHdNlr/eysgVFF75IrU0DawEXiEieuPBN9fztPes4nh8/1W4bO0NrIaoBwkcA+n3sPYQX
 gxSsgqnHQU9CVml4MbtgIHTFypdfwGjq0/xtnV5b1TpWaIPVvJM/NkMuX2ZVAqoSjpJQdLtuouD
 kdBUYWCIbpx52AssjE1j9Fz1zc98FippayP7TgaVGUEWzOw1PPKx7Md0Wfk39N2x90oaVmBYniH
 WlOl/5vH2HymwnFTwOHwVBVwqwZt+yo0v1DpxK1IDBMFKuHGTPkn1P0YLdQfiK4HNlGpjeQMSpE
 2LpFZEoyOC9tNEKMY4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA1NyBTYWx0ZWRfX7dCBYnX0Jx8l
 e/VcFRMS4h/GpqAIJOoQ4UQAWIupgMgTsR5q8UnIVDYqRDijFdCu1KG/vVr4Oqquy7QdVqfF0A1
 JRnzMGCM+Ky+x0lWwVXwIUaF7YZnI3c=
X-Proofpoint-ORIG-GUID: 4veA5wcaEw5trw0lsHhTY6oLNe0CKivw
X-Proofpoint-GUID: 4veA5wcaEw5trw0lsHhTY6oLNe0CKivw
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a38d10c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5slXZHjDPm_0JgeRwY0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113932-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jingyi.wang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:raviteja.laggyshetty@oss.qualcomm.com,m:odelu.kukatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81B396ACE2A

Add driver for the Qualcomm interconnect buses found in Maili
based platforms. The topology consists of several NoCs that are
controlled by a remote processor that collects the aggregated
bandwidth for each master-slave pairs.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig  |   10 +
 drivers/interconnect/qcom/Makefile |    2 +
 drivers/interconnect/qcom/maili.c  | 2091 ++++++++++++++++++++++++++++++++++++
 3 files changed, 2103 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 5b8a094ca4ed..5b57f111c63c 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -47,6 +47,16 @@ config INTERCONNECT_QCOM_KAANAPALI
 	  This is a driver for the Qualcomm Network-on-Chip on kaanapali-based
 	  platforms.
 
+config INTERCONNECT_QCOM_MAILI
+	tristate "Qualcomm MAILI interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on maili-based
+	  platforms.
+
 config INTERCONNECT_QCOM_MSM8909
 	tristate "Qualcomm MSM8909 interconnect driver"
 	depends on INTERCONNECT_QCOM
diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
index 1c7d410b40cc..5f139a370bbe 100644
--- a/drivers/interconnect/qcom/Makefile
+++ b/drivers/interconnect/qcom/Makefile
@@ -8,6 +8,7 @@ qnoc-eliza-objs				:= eliza.o
 qnoc-glymur-objs			:= glymur.o
 qnoc-hawi-objs				:= hawi.o
 qnoc-kaanapali-objs			:= kaanapali.o
+qnoc-maili-objs				:= maili.o
 qnoc-milos-objs				:= milos.o
 qnoc-msm8909-objs			:= msm8909.o
 qnoc-msm8916-objs			:= msm8916.o
@@ -56,6 +57,7 @@ obj-$(CONFIG_INTERCONNECT_QCOM_ELIZA) += qnoc-eliza.o
 obj-$(CONFIG_INTERCONNECT_QCOM_GLYMUR) += qnoc-glymur.o
 obj-$(CONFIG_INTERCONNECT_QCOM_HAWI) += qnoc-hawi.o
 obj-$(CONFIG_INTERCONNECT_QCOM_KAANAPALI) += qnoc-kaanapali.o
+obj-$(CONFIG_INTERCONNECT_QCOM_MAILI) += qnoc-maili.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MILOS) += qnoc-milos.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8909) += qnoc-msm8909.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8916) += qnoc-msm8916.o
diff --git a/drivers/interconnect/qcom/maili.c b/drivers/interconnect/qcom/maili.c
new file mode 100644
index 000000000000..e5eed7f998f9
--- /dev/null
+++ b/drivers/interconnect/qcom/maili.c
@@ -0,0 +1,2091 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/interconnect.h>
+#include <linux/interconnect-provider.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <dt-bindings/interconnect/qcom,maili-rpmh.h>
+
+#include "bcm-voter.h"
+#include "icc-rpmh.h"
+
+static struct qcom_icc_node ddr_eff_veto_slave = {
+	.name = "ddr_eff_veto_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup0_core_slave = {
+	.name = "qup0_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup1_core_slave = {
+	.name = "qup1_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup2_core_slave = {
+	.name = "qup2_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup3_core_slave = {
+	.name = "qup3_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup4_core_slave = {
+	.name = "qup4_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup5_core_slave = {
+	.name = "qup5_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_aoss = {
+	.name = "qhs_aoss",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ipa = {
+	.name = "qhs_ipa",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ipc_router_fence = {
+	.name = "qhs_ipc_router_fence",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_soccp = {
+	.name = "qhs_soccp",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_tme_cfg = {
+	.name = "qhs_tme_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qss_ddrss_cfg = {
+	.name = "qss_ddrss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qxs_imem = {
+	.name = "qxs_imem",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node xs_pcie = {
+	.name = "xs_pcie",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node xs_pcie_g4x1 = {
+	.name = "xs_pcie_g4x1",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qhs_lpi_cc = {
+	.name = "qhs_lpi_cc",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qns_lb = {
+	.name = "qns_lb",
+	.channels = 4,
+	.buswidth = 16,
+};
+
+static struct qcom_icc_node srvc_llclpi_noc = {
+	.name = "srvc_llclpi_noc",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node srvc_llclpi_noc_chipcx = {
+	.name = "srvc_llclpi_noc_chipcx",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node ebi = {
+	.name = "ebi",
+	.channels = 4,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node ddr_rt_slave = {
+	.name = "ddr_rt_slave",
+	.channels = 4,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node srvc_pcie_aggre_noc = {
+	.name = "srvc_pcie_aggre_noc",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy0 = {
+	.name = "qhs_ahb2phy0",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_boot_rom = {
+	.name = "qhs_boot_rom",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_camera_cfg = {
+	.name = "qhs_camera_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_clk_ctl = {
+	.name = "qhs_clk_ctl",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_crypto_cfg = {
+	.name = "qhs_crypto_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_display_cfg = {
+	.name = "qhs_display_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_eva_cfg = {
+	.name = "qhs_eva_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_gpuss_cfg = {
+	.name = "qhs_gpuss_cfg",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qhs_i2c = {
+	.name = "qhs_i2c",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_imem_cfg = {
+	.name = "qhs_imem_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ipc_router = {
+	.name = "qhs_ipc_router",
+	.channels = 4,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_iris_cfg = {
+	.name = "qhs_iris_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_mss_cfg = {
+	.name = "qhs_mss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_cfg = {
+	.name = "qhs_pcie_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_g4x1_cfg = {
+	.name = "qhs_pcie_g4x1_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_prng = {
+	.name = "qhs_prng",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qspi = {
+	.name = "qhs_qspi",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup1 = {
+	.name = "qhs_qup1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup2 = {
+	.name = "qhs_qup2",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup3 = {
+	.name = "qhs_qup3",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup4 = {
+	.name = "qhs_qup4",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup5 = {
+	.name = "qhs_qup5",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_sdc2 = {
+	.name = "qhs_sdc2",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_sdc4 = {
+	.name = "qhs_sdc4",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_tlmm = {
+	.name = "qhs_tlmm",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ufs_mem_cfg = {
+	.name = "qhs_ufs_mem_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb3 = {
+	.name = "qhs_usb3",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_vsense_ctrl_cfg = {
+	.name = "qhs_vsense_ctrl_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qss_qdss_cfg = {
+	.name = "qss_qdss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qss_qdss_stm = {
+	.name = "qss_qdss_stm",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qss_tcsr = {
+	.name = "qss_tcsr",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node xs_sys_tcu_cfg = {
+	.name = "xs_sys_tcu_cfg",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node ddr_eff_veto_master = {
+	.name = "ddr_eff_veto_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &ddr_eff_veto_slave },
+};
+
+static struct qcom_icc_node qup0_core_master = {
+	.name = "qup0_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qup0_core_slave },
+};
+
+static struct qcom_icc_node qup1_core_master = {
+	.name = "qup1_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qup1_core_slave },
+};
+
+static struct qcom_icc_node qup2_core_master = {
+	.name = "qup2_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qup2_core_slave },
+};
+
+static struct qcom_icc_node qup3_core_master = {
+	.name = "qup3_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qup3_core_slave },
+};
+
+static struct qcom_icc_node qup4_core_master = {
+	.name = "qup4_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qup4_core_slave },
+};
+
+static struct qcom_icc_node qup5_core_master = {
+	.name = "qup5_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qup5_core_slave },
+};
+
+static struct qcom_icc_node qnm_gemnoc_pcie = {
+	.name = "qnm_gemnoc_pcie",
+	.channels = 1,
+	.buswidth = 8,
+	.num_links = 2,
+	.link_nodes = { &xs_pcie, &xs_pcie_g4x1 },
+};
+
+static struct qcom_icc_node qnm_lpiaon_noc_llclpi_noc = {
+	.name = "qnm_lpiaon_noc_llclpi_noc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 4,
+	.link_nodes = { &qhs_lpi_cc, &qns_lb,
+			&srvc_llclpi_noc, &srvc_llclpi_noc_chipcx },
+};
+
+static struct qcom_icc_node llcc_mc = {
+	.name = "llcc_mc",
+	.channels = 4,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &ebi },
+};
+
+static struct qcom_icc_node ddr_rt_mc = {
+	.name = "ddr_rt_mc",
+	.channels = 4,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &ddr_rt_slave },
+};
+
+static struct qcom_icc_node qsm_pcie_anoc_cfg = {
+	.name = "qsm_pcie_anoc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &srvc_pcie_aggre_noc },
+};
+
+static struct qcom_icc_node qsm_cfg_center = {
+	.name = "qsm_cfg_center",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 14,
+	.link_nodes = { &qhs_boot_rom, &qhs_clk_ctl,
+			&qhs_crypto_cfg, &qhs_gpuss_cfg,
+			&qhs_imem_cfg, &qhs_ipc_router,
+			&qhs_mss_cfg, &qhs_prng,
+			&qhs_tlmm, &qhs_vsense_ctrl_cfg,
+			&qss_qdss_cfg, &qss_qdss_stm,
+			&qss_tcsr, &xs_sys_tcu_cfg },
+};
+
+static struct qcom_icc_node qsm_cfg_east = {
+	.name = "qsm_cfg_east",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 2,
+	.link_nodes = { &qhs_qup2, &qhs_qup4 },
+};
+
+static struct qcom_icc_node qsm_cfg_mm_hf = {
+	.name = "qsm_cfg_mm_hf",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qhs_display_cfg },
+};
+
+static struct qcom_icc_node qsm_cfg_mm_sf = {
+	.name = "qsm_cfg_mm_sf",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 3,
+	.link_nodes = { &qhs_camera_cfg, &qhs_eva_cfg,
+			&qhs_iris_cfg },
+};
+
+static struct qcom_icc_node qsm_cfg_north = {
+	.name = "qsm_cfg_north",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 3,
+	.link_nodes = { &qhs_ahb2phy0, &qhs_ufs_mem_cfg,
+			&qhs_usb3 },
+};
+
+static struct qcom_icc_node qsm_cfg_west = {
+	.name = "qsm_cfg_west",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 2,
+	.link_nodes = { &qhs_qup1, &qhs_sdc2 },
+};
+
+static struct qcom_icc_node qns_llcc = {
+	.name = "qns_llcc",
+	.channels = 4,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &llcc_mc },
+};
+
+static struct qcom_icc_node qns_pcie = {
+	.name = "qns_pcie",
+	.channels = 1,
+	.buswidth = 8,
+	.num_links = 1,
+	.link_nodes = { &qnm_gemnoc_pcie },
+};
+
+static struct qcom_icc_node qns_llc_lpinoc = {
+	.name = "qns_llc_lpinoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qnm_lpiaon_noc_llclpi_noc },
+};
+
+static struct qcom_icc_node qss_pcie_anoc_cfg = {
+	.name = "qss_pcie_anoc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_pcie_anoc_cfg },
+};
+
+static struct qcom_icc_node qss_stdst_center_cfg = {
+	.name = "qss_stdst_center_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_cfg_center },
+};
+
+static struct qcom_icc_node qss_stdst_east_cfg = {
+	.name = "qss_stdst_east_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_cfg_east },
+};
+
+static struct qcom_icc_node qss_stdst_mm_hf_cfg = {
+	.name = "qss_stdst_mm_hf_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_cfg_mm_hf },
+};
+
+static struct qcom_icc_node qss_stdst_mm_sf_cfg = {
+	.name = "qss_stdst_mm_sf_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_cfg_mm_sf },
+};
+
+static struct qcom_icc_node qss_stdst_north_cfg = {
+	.name = "qss_stdst_north_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_cfg_north },
+};
+
+static struct qcom_icc_node qss_stdst_west_cfg = {
+	.name = "qss_stdst_west_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_cfg_west },
+};
+
+static struct qcom_icc_node alm_gic = {
+	.name = "alm_gic",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x14d000 },
+		.prio = 4,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_llcc },
+};
+
+static struct qcom_icc_node qnm_qpace = {
+	.name = "qnm_qpace",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x153000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_llcc },
+};
+
+static struct qcom_icc_node qsm_cfg_south = {
+	.name = "qsm_cfg_south",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 8,
+	.link_nodes = { &qhs_i2c, &qhs_pcie_cfg,
+			&qhs_pcie_g4x1_cfg, &qhs_qspi,
+			&qhs_qup3, &qhs_qup5,
+			&qhs_sdc4, &qss_pcie_anoc_cfg },
+};
+
+static struct qcom_icc_node qss_stdst_south_cfg = {
+	.name = "qss_stdst_south_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_cfg_south },
+};
+
+static struct qcom_icc_node qsm_cnoc_main = {
+	.name = "qsm_cnoc_main",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 7,
+	.link_nodes = { &qss_stdst_center_cfg, &qss_stdst_east_cfg,
+			&qss_stdst_mm_hf_cfg, &qss_stdst_mm_sf_cfg,
+			&qss_stdst_north_cfg, &qss_stdst_south_cfg,
+			&qss_stdst_west_cfg },
+};
+
+static struct qcom_icc_node qss_cfg = {
+	.name = "qss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_cnoc_main },
+};
+
+static struct qcom_icc_node qnm_gemnoc_cnoc = {
+	.name = "qnm_gemnoc_cnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 8,
+	.link_nodes = { &qhs_aoss, &qhs_ipa,
+			&qhs_ipc_router_fence, &qhs_soccp,
+			&qhs_tme_cfg, &qss_cfg,
+			&qss_ddrss_cfg, &qxs_imem },
+};
+
+static struct qcom_icc_node qns_gem_noc_cnoc = {
+	.name = "qns_gem_noc_cnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qnm_gemnoc_cnoc },
+};
+
+static struct qcom_icc_node alm_gpu_tcu = {
+	.name = "alm_gpu_tcu",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x145000 },
+		.prio = 1,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node alm_sys_tcu = {
+	.name = "alm_sys_tcu",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x147000 },
+		.prio = 6,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node chm_apps = {
+	.name = "chm_apps",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 3,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_gpu = {
+	.name = "qnm_gpu",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x51000, 0xd1000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_lpass_gemnoc = {
+	.name = "qnm_lpass_gemnoc",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x149000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_mdsp = {
+	.name = "qnm_mdsp",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 3,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_mnoc_hf = {
+	.name = "qnm_mnoc_hf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x55000, 0xd5000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_mnoc_sf = {
+	.name = "qnm_mnoc_sf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x57000, 0xd7000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_nsp_gemnoc = {
+	.name = "qnm_nsp_gemnoc",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x59000, 0xd9000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_pcie = {
+	.name = "qnm_pcie",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x14b000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node qnm_snoc_sf = {
+	.name = "qnm_snoc_sf",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x14f000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_wlan_q6 = {
+	.name = "qnm_wlan_q6",
+	.channels = 1,
+	.buswidth = 8,
+	.num_links = 3,
+	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qns_lpass_ag_noc_gemnoc = {
+	.name = "qns_lpass_ag_noc_gemnoc",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_lpass_gemnoc },
+};
+
+static struct qcom_icc_node qns_mem_noc_hf = {
+	.name = "qns_mem_noc_hf",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_mnoc_hf },
+};
+
+static struct qcom_icc_node qns_mem_noc_sf = {
+	.name = "qns_mem_noc_sf",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_mnoc_sf },
+};
+
+static struct qcom_icc_node qns_nsp_gemnoc = {
+	.name = "qns_nsp_gemnoc",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_nsp_gemnoc },
+};
+
+static struct qcom_icc_node qns_pcie_gemnoc = {
+	.name = "qns_pcie_gemnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qnm_pcie },
+};
+
+static struct qcom_icc_node qns_gemnoc_sf = {
+	.name = "qns_gemnoc_sf",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_snoc_sf },
+};
+
+static struct qcom_icc_node qnm_lpiaon_noc = {
+	.name = "qnm_lpiaon_noc",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_lpass_ag_noc_gemnoc },
+};
+
+static struct qcom_icc_node qnm_camnoc_hf = {
+	.name = "qnm_camnoc_hf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x50000, 0x51000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_node qnm_mdp = {
+	.name = "qnm_mdp",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x52000, 0x53000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_node qnm_camnoc_nrt_icp_sf = {
+	.name = "qnm_camnoc_nrt_icp_sf",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x20000 },
+		.prio = 4,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_camnoc_rt_cdm_sf = {
+	.name = "qnm_camnoc_rt_cdm_sf",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x28000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_camnoc_sf = {
+	.name = "qnm_camnoc_sf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x21000, 0x22000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_mdss_dcp = {
+	.name = "qnm_mdss_dcp",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x29000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_vapss_hcp = {
+	.name = "qnm_vapss_hcp",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video_cv_cpu = {
+	.name = "qnm_video_cv_cpu",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x24000 },
+		.prio = 4,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video_eva = {
+	.name = "qnm_video_eva",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x25000, 0x26000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video_mvp = {
+	.name = "qnm_video_mvp",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x23000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video_v_cpu = {
+	.name = "qnm_video_v_cpu",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x27000 },
+		.prio = 4,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_nsp = {
+	.name = "qnm_nsp",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_nsp_gemnoc },
+};
+
+static struct qcom_icc_node xm_pcie = {
+	.name = "xm_pcie",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 3,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_pcie_gemnoc },
+};
+
+static struct qcom_icc_node xm_pcie_g4x1 = {
+	.name = "xm_pcie_g4x1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_pcie_gemnoc },
+};
+
+static struct qcom_icc_node qnm_aggre_noc = {
+	.name = "qnm_aggre_noc",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x20000 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_node qnm_apss_noc = {
+	.name = "qnm_apss_noc",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1e000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_node qnm_cnoc_data = {
+	.name = "qnm_cnoc_data",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1f000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_node qns_a1noc_snoc = {
+	.name = "qns_a1noc_snoc",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_aggre_noc },
+};
+
+static struct qcom_icc_node qns_lpass_aggnoc = {
+	.name = "qns_lpass_aggnoc",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_lpiaon_noc },
+};
+
+static struct qcom_icc_node qhm_qspi = {
+	.name = "qhm_qspi",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x49000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qhm_qup2 = {
+	.name = "qhm_qup2",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x48000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qhm_qup3 = {
+	.name = "qhm_qup3",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x46000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qhm_qup4 = {
+	.name = "qhm_qup4",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x47000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qhm_qup5 = {
+	.name = "qhm_qup5",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x4e000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qxm_crypto = {
+	.name = "qxm_crypto",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x40000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qxm_ipa = {
+	.name = "qxm_ipa",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x41000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qxm_qup1 = {
+	.name = "qxm_qup1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x4d000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qxm_soccp = {
+	.name = "qxm_soccp",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x45000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node xm_qdss_etr_0 = {
+	.name = "xm_qdss_etr_0",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x42000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node xm_qdss_etr_1 = {
+	.name = "xm_qdss_etr_1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x43000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node xm_sdc2 = {
+	.name = "xm_sdc2",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x44000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node xm_sdc4 = {
+	.name = "xm_sdc4",
+	.channels = 1,
+	.buswidth = 8,
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node xm_ufs_mem = {
+	.name = "xm_ufs_mem",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x4b000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node xm_usb3 = {
+	.name = "xm_usb3",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x4c000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qnm_lpass_lpinoc = {
+	.name = "qnm_lpass_lpinoc",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 2,
+	.link_nodes = { &qns_llc_lpinoc, &qns_lpass_aggnoc },
+};
+
+static struct qcom_icc_node qns_lpi_aon_noc = {
+	.name = "qns_lpi_aon_noc",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_lpass_lpinoc },
+};
+
+static struct qcom_icc_node qnm_lpinoc_dsp_qns4m = {
+	.name = "qnm_lpinoc_dsp_qns4m",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_lpi_aon_noc },
+};
+
+static struct qcom_icc_bcm bcm_acv = {
+	.name = "ACV",
+	.enable_mask = BIT(3),
+	.num_nodes = 1,
+	.nodes = { &ebi },
+};
+
+static struct qcom_icc_bcm bcm_ce0 = {
+	.name = "CE0",
+	.num_nodes = 1,
+	.nodes = { &qxm_crypto },
+};
+
+static struct qcom_icc_bcm bcm_cn0 = {
+	.name = "CN0",
+	.enable_mask = BIT(0),
+	.keepalive = true,
+	.num_nodes = 25,
+	.nodes = { &qnm_gemnoc_cnoc, &qnm_gemnoc_pcie,
+		   &qhs_aoss, &qhs_ipa,
+		   &qhs_ipc_router_fence, &qhs_soccp,
+		   &qhs_tme_cfg, &qss_cfg,
+		   &qss_ddrss_cfg, &qxs_imem,
+		   &xs_pcie, &xs_pcie_g4x1,
+		   &qsm_cfg_center, &qsm_cfg_east,
+		   &qsm_cfg_mm_hf, &qsm_cfg_mm_sf,
+		   &qsm_cfg_north, &qsm_cfg_south,
+		   &qsm_cfg_west, &qhs_ahb2phy0,
+		   &qhs_boot_rom, &qhs_camera_cfg,
+		   &qhs_clk_ctl, &qhs_crypto_cfg,
+		   &qhs_eva_cfg },
+};
+
+static struct qcom_icc_bcm bcm_cn1 = {
+	.name = "CN1",
+	.num_nodes = 6,
+	.nodes = { &qhs_display_cfg, &qhs_qup1,
+		   &qhs_qup2, &qhs_qup3,
+		   &qhs_qup4, &qhs_qup5 },
+};
+
+static struct qcom_icc_bcm bcm_co0 = {
+	.name = "CO0",
+	.enable_mask = BIT(0),
+	.num_nodes = 2,
+	.nodes = { &qnm_nsp, &qns_nsp_gemnoc },
+};
+
+static struct qcom_icc_bcm bcm_de0 = {
+	.name = "DE0",
+	.enable_mask = BIT(0),
+	.num_nodes = 1,
+	.nodes = { &ddr_eff_veto_slave },
+};
+
+static struct qcom_icc_bcm bcm_lp0 = {
+	.name = "LP0",
+	.num_nodes = 5,
+	.nodes = { &qnm_lpiaon_noc_llclpi_noc, &qns_lb,
+		   &qnm_lpass_lpinoc, &qns_llc_lpinoc,
+		   &qns_lpass_aggnoc },
+};
+
+static struct qcom_icc_bcm bcm_mc0 = {
+	.name = "MC0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &ebi },
+};
+
+static struct qcom_icc_bcm bcm_mc5 = {
+	.name = "MC5",
+	.num_nodes = 1,
+	.nodes = { &ddr_rt_slave },
+};
+
+static struct qcom_icc_bcm bcm_mm0 = {
+	.name = "MM0",
+	.num_nodes = 1,
+	.nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_bcm bcm_mm1 = {
+	.name = "MM1",
+	.enable_mask = BIT(0),
+	.num_nodes = 9,
+	.nodes = { &qnm_camnoc_hf, &qnm_camnoc_nrt_icp_sf,
+		   &qnm_camnoc_rt_cdm_sf, &qnm_camnoc_sf,
+		   &qnm_vapss_hcp, &qnm_video_cv_cpu,
+		   &qnm_video_mvp, &qnm_video_v_cpu,
+		   &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_bcm bcm_qpc0 = {
+	.name = "QPC0",
+	.num_nodes = 1,
+	.nodes = { &qnm_qpace },
+};
+
+static struct qcom_icc_bcm bcm_qup0 = {
+	.name = "QUP0",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup0_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_qup1 = {
+	.name = "QUP1",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup1_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_qup2 = {
+	.name = "QUP2",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup2_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_qup3 = {
+	.name = "QUP3",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup3_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_qup4 = {
+	.name = "QUP4",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup4_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_qup5 = {
+	.name = "QUP5",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup5_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_sh0 = {
+	.name = "SH0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qns_llcc },
+};
+
+static struct qcom_icc_bcm bcm_sh1 = {
+	.name = "SH1",
+	.enable_mask = BIT(0),
+	.num_nodes = 15,
+	.nodes = { &alm_gic, &alm_gpu_tcu,
+		   &alm_sys_tcu, &chm_apps,
+		   &qnm_gpu, &qnm_lpass_gemnoc,
+		   &qnm_mdsp, &qnm_mnoc_hf,
+		   &qnm_mnoc_sf, &qnm_nsp_gemnoc,
+		   &qnm_pcie, &qnm_snoc_sf,
+		   &qnm_wlan_q6, &qns_gem_noc_cnoc,
+		   &qns_pcie },
+};
+
+static struct qcom_icc_bcm bcm_sn0 = {
+	.name = "SN0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_bcm bcm_sn2 = {
+	.name = "SN2",
+	.num_nodes = 1,
+	.nodes = { &qnm_aggre_noc },
+};
+
+static struct qcom_icc_bcm bcm_sn3 = {
+	.name = "SN3",
+	.num_nodes = 1,
+	.nodes = { &qns_pcie_gemnoc },
+};
+
+static struct qcom_icc_bcm * const aggre1_noc_bcms[] = {
+	&bcm_ce0,
+};
+
+static struct qcom_icc_node * const aggre1_noc_nodes[] = {
+	[MASTER_QSPI_0] = &qhm_qspi,
+	[MASTER_QUP_2] = &qhm_qup2,
+	[MASTER_QUP_3] = &qhm_qup3,
+	[MASTER_QUP_4] = &qhm_qup4,
+	[MASTER_QUP_5] = &qhm_qup5,
+	[MASTER_CRYPTO] = &qxm_crypto,
+	[MASTER_IPA] = &qxm_ipa,
+	[MASTER_QUP_1] = &qxm_qup1,
+	[MASTER_SOCCP_PROC] = &qxm_soccp,
+	[MASTER_QDSS_ETR] = &xm_qdss_etr_0,
+	[MASTER_QDSS_ETR_1] = &xm_qdss_etr_1,
+	[MASTER_SDCC_2] = &xm_sdc2,
+	[MASTER_SDCC_4] = &xm_sdc4,
+	[MASTER_UFS_MEM] = &xm_ufs_mem,
+	[MASTER_USB3] = &xm_usb3,
+	[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
+};
+
+static const struct regmap_config maili_aggre1_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x56200,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_aggre1_noc = {
+	.config = &maili_aggre1_noc_regmap_config,
+	.nodes = aggre1_noc_nodes,
+	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
+	.bcms = aggre1_noc_bcms,
+	.num_bcms = ARRAY_SIZE(aggre1_noc_bcms),
+	.qos_requires_clocks = true,
+};
+
+static struct qcom_icc_bcm * const clk_virt_bcms[] = {
+	&bcm_de0,
+	&bcm_qup0,
+	&bcm_qup1,
+	&bcm_qup2,
+	&bcm_qup3,
+	&bcm_qup4,
+	&bcm_qup5,
+};
+
+static struct qcom_icc_node * const clk_virt_nodes[] = {
+	[MASTER_DDR_EFF_VETO] = &ddr_eff_veto_master,
+	[MASTER_QUP_CORE_0] = &qup0_core_master,
+	[MASTER_QUP_CORE_1] = &qup1_core_master,
+	[MASTER_QUP_CORE_2] = &qup2_core_master,
+	[MASTER_QUP_CORE_3] = &qup3_core_master,
+	[MASTER_QUP_CORE_4] = &qup4_core_master,
+	[MASTER_QUP_CORE_5] = &qup5_core_master,
+	[SLAVE_DDR_EFF_VETO] = &ddr_eff_veto_slave,
+	[SLAVE_QUP_CORE_0] = &qup0_core_slave,
+	[SLAVE_QUP_CORE_1] = &qup1_core_slave,
+	[SLAVE_QUP_CORE_2] = &qup2_core_slave,
+	[SLAVE_QUP_CORE_3] = &qup3_core_slave,
+	[SLAVE_QUP_CORE_4] = &qup4_core_slave,
+	[SLAVE_QUP_CORE_5] = &qup5_core_slave,
+};
+
+static const struct qcom_icc_desc maili_clk_virt = {
+	.nodes = clk_virt_nodes,
+	.num_nodes = ARRAY_SIZE(clk_virt_nodes),
+	.bcms = clk_virt_bcms,
+	.num_bcms = ARRAY_SIZE(clk_virt_bcms),
+};
+
+static struct qcom_icc_bcm * const cnoc_main_bcms[] = {
+	&bcm_cn0,
+};
+
+static struct qcom_icc_node * const cnoc_main_nodes[] = {
+	[MASTER_GEM_NOC_CNOC] = &qnm_gemnoc_cnoc,
+	[MASTER_GEM_NOC_PCIE_SNOC] = &qnm_gemnoc_pcie,
+	[SLAVE_AOSS] = &qhs_aoss,
+	[SLAVE_IPA_CFG] = &qhs_ipa,
+	[SLAVE_IPC_ROUTER_FENCE] = &qhs_ipc_router_fence,
+	[SLAVE_SOCCP] = &qhs_soccp,
+	[SLAVE_TME_CFG] = &qhs_tme_cfg,
+	[SLAVE_CNOC_CFG] = &qss_cfg,
+	[SLAVE_DDRSS_CFG] = &qss_ddrss_cfg,
+	[SLAVE_IMEM] = &qxs_imem,
+	[SLAVE_PCIE_0] = &xs_pcie,
+	[SLAVE_PCIE_1] = &xs_pcie_g4x1,
+};
+
+static const struct regmap_config maili_cnoc_main_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x20000,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_cnoc_main = {
+	.config = &maili_cnoc_main_regmap_config,
+	.nodes = cnoc_main_nodes,
+	.num_nodes = ARRAY_SIZE(cnoc_main_nodes),
+	.bcms = cnoc_main_bcms,
+	.num_bcms = ARRAY_SIZE(cnoc_main_bcms),
+};
+
+static struct qcom_icc_bcm * const gem_noc_bcms[] = {
+	&bcm_qpc0,
+	&bcm_sh0,
+	&bcm_sh1,
+};
+
+static struct qcom_icc_node * const gem_noc_nodes[] = {
+	[MASTER_GIC] = &alm_gic,
+	[MASTER_GPU_TCU] = &alm_gpu_tcu,
+	[MASTER_SYS_TCU] = &alm_sys_tcu,
+	[MASTER_APPSS_PROC] = &chm_apps,
+	[MASTER_GFX3D] = &qnm_gpu,
+	[MASTER_LPASS_GEM_NOC] = &qnm_lpass_gemnoc,
+	[MASTER_MSS_PROC] = &qnm_mdsp,
+	[MASTER_MNOC_HF_MEM_NOC] = &qnm_mnoc_hf,
+	[MASTER_MNOC_SF_MEM_NOC] = &qnm_mnoc_sf,
+	[MASTER_COMPUTE_NOC] = &qnm_nsp_gemnoc,
+	[MASTER_ANOC_PCIE_GEM_NOC] = &qnm_pcie,
+	[MASTER_QPACE] = &qnm_qpace,
+	[MASTER_SNOC_SF_MEM_NOC] = &qnm_snoc_sf,
+	[MASTER_WLAN_Q6] = &qnm_wlan_q6,
+	[SLAVE_GEM_NOC_CNOC] = &qns_gem_noc_cnoc,
+	[SLAVE_LLCC] = &qns_llcc,
+	[SLAVE_MEM_NOC_PCIE_SNOC] = &qns_pcie,
+};
+
+static const struct regmap_config maili_gem_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x160200,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_gem_noc = {
+	.config = &maili_gem_noc_regmap_config,
+	.nodes = gem_noc_nodes,
+	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
+	.bcms = gem_noc_bcms,
+	.num_bcms = ARRAY_SIZE(gem_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const llclpi_noc_bcms[] = {
+	&bcm_lp0,
+};
+
+static struct qcom_icc_node * const llclpi_noc_nodes[] = {
+	[MASTER_LPIAON_NOC_LLCLPI_NOC] = &qnm_lpiaon_noc_llclpi_noc,
+	[SLAVE_LPASS_LPI_CC] = &qhs_lpi_cc,
+	[SLAVE_LLCC_ISLAND] = &qns_lb,
+	[SLAVE_SERVICE_LLCLPI_NOC] = &srvc_llclpi_noc,
+	[SLAVE_SERVICE_LLCLPI_NOC_CHIPCX] = &srvc_llclpi_noc_chipcx,
+};
+
+static const struct regmap_config maili_llclpi_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x17200,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_llclpi_noc = {
+	.config = &maili_llclpi_noc_regmap_config,
+	.nodes = llclpi_noc_nodes,
+	.num_nodes = ARRAY_SIZE(llclpi_noc_nodes),
+	.bcms = llclpi_noc_bcms,
+	.num_bcms = ARRAY_SIZE(llclpi_noc_bcms),
+};
+
+static struct qcom_icc_node * const lpass_ag_noc_nodes[] = {
+	[MASTER_LPIAON_NOC] = &qnm_lpiaon_noc,
+	[SLAVE_LPASS_GEM_NOC] = &qns_lpass_ag_noc_gemnoc,
+};
+
+static const struct regmap_config maili_lpass_ag_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xc080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_lpass_ag_noc = {
+	.config = &maili_lpass_ag_noc_regmap_config,
+	.nodes = lpass_ag_noc_nodes,
+	.num_nodes = ARRAY_SIZE(lpass_ag_noc_nodes),
+};
+
+static struct qcom_icc_bcm * const lpass_lpiaon_noc_bcms[] = {
+	&bcm_lp0,
+};
+
+static struct qcom_icc_node * const lpass_lpiaon_noc_nodes[] = {
+	[MASTER_LPASS_LPINOC] = &qnm_lpass_lpinoc,
+	[SLAVE_LPIAON_NOC_LLCLPI_NOC] = &qns_llc_lpinoc,
+	[SLAVE_LPIAON_NOC_LPASS_AG_NOC] = &qns_lpass_aggnoc,
+};
+
+static const struct regmap_config maili_lpass_lpiaon_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x19080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_lpass_lpiaon_noc = {
+	.config = &maili_lpass_lpiaon_noc_regmap_config,
+	.nodes = lpass_lpiaon_noc_nodes,
+	.num_nodes = ARRAY_SIZE(lpass_lpiaon_noc_nodes),
+	.bcms = lpass_lpiaon_noc_bcms,
+	.num_bcms = ARRAY_SIZE(lpass_lpiaon_noc_bcms),
+};
+
+static struct qcom_icc_node * const lpass_lpicx_noc_nodes[] = {
+	[MASTER_LPASS_PROC] = &qnm_lpinoc_dsp_qns4m,
+	[SLAVE_LPICX_NOC_LPIAON_NOC] = &qns_lpi_aon_noc,
+};
+
+static const struct regmap_config maili_lpass_lpicx_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x46080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_lpass_lpicx_noc = {
+	.config = &maili_lpass_lpicx_noc_regmap_config,
+	.nodes = lpass_lpicx_noc_nodes,
+	.num_nodes = ARRAY_SIZE(lpass_lpicx_noc_nodes),
+};
+
+static struct qcom_icc_bcm * const mc_virt_bcms[] = {
+	&bcm_acv,
+	&bcm_mc0,
+	&bcm_mc5,
+};
+
+static struct qcom_icc_node * const mc_virt_nodes[] = {
+	[MASTER_LLCC] = &llcc_mc,
+	[MASTER_DDR_RT] = &ddr_rt_mc,
+	[SLAVE_EBI1] = &ebi,
+	[SLAVE_DDR_RT] = &ddr_rt_slave,
+};
+
+static const struct qcom_icc_desc maili_mc_virt = {
+	.nodes = mc_virt_nodes,
+	.num_nodes = ARRAY_SIZE(mc_virt_nodes),
+	.bcms = mc_virt_bcms,
+	.num_bcms = ARRAY_SIZE(mc_virt_bcms),
+};
+
+static struct qcom_icc_bcm * const mmss_noc_bcms[] = {
+	&bcm_mm0,
+	&bcm_mm1,
+};
+
+static struct qcom_icc_node * const mmss_noc_nodes[] = {
+	[MASTER_CAMNOC_HF] = &qnm_camnoc_hf,
+	[MASTER_CAMNOC_NRT_ICP_SF] = &qnm_camnoc_nrt_icp_sf,
+	[MASTER_CAMNOC_RT_CDM_SF] = &qnm_camnoc_rt_cdm_sf,
+	[MASTER_CAMNOC_SF] = &qnm_camnoc_sf,
+	[MASTER_MDP] = &qnm_mdp,
+	[MASTER_MDSS_DCP] = &qnm_mdss_dcp,
+	[MASTER_CDSP_HCP] = &qnm_vapss_hcp,
+	[MASTER_VIDEO_CV_PROC] = &qnm_video_cv_cpu,
+	[MASTER_VIDEO_EVA] = &qnm_video_eva,
+	[MASTER_VIDEO_MVP] = &qnm_video_mvp,
+	[MASTER_VIDEO_V_PROC] = &qnm_video_v_cpu,
+	[SLAVE_MNOC_HF_MEM_NOC] = &qns_mem_noc_hf,
+	[SLAVE_MNOC_SF_MEM_NOC] = &qns_mem_noc_sf,
+};
+
+static const struct regmap_config maili_mmss_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x5f800,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_mmss_noc = {
+	.config = &maili_mmss_noc_regmap_config,
+	.nodes = mmss_noc_nodes,
+	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
+	.bcms = mmss_noc_bcms,
+	.num_bcms = ARRAY_SIZE(mmss_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const nsp_noc_bcms[] = {
+	&bcm_co0,
+};
+
+static struct qcom_icc_node * const nsp_noc_nodes[] = {
+	[MASTER_CDSP_PROC] = &qnm_nsp,
+	[SLAVE_CDSP_MEM_NOC] = &qns_nsp_gemnoc,
+};
+
+static const struct regmap_config maili_nsp_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x21280,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_nsp_noc = {
+	.config = &maili_nsp_noc_regmap_config,
+	.nodes = nsp_noc_nodes,
+	.num_nodes = ARRAY_SIZE(nsp_noc_nodes),
+	.bcms = nsp_noc_bcms,
+	.num_bcms = ARRAY_SIZE(nsp_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const pcie_anoc_bcms[] = {
+	&bcm_sn3,
+};
+
+static struct qcom_icc_node * const pcie_anoc_nodes[] = {
+	[MASTER_PCIE_ANOC_CFG] = &qsm_pcie_anoc_cfg,
+	[MASTER_PCIE_0] = &xm_pcie,
+	[MASTER_PCIE_1] = &xm_pcie_g4x1,
+	[SLAVE_ANOC_PCIE_GEM_NOC] = &qns_pcie_gemnoc,
+	[SLAVE_SERVICE_PCIE_ANOC] = &srvc_pcie_aggre_noc,
+};
+
+static const struct regmap_config maili_pcie_anoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x12400,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_pcie_anoc = {
+	.config = &maili_pcie_anoc_regmap_config,
+	.nodes = pcie_anoc_nodes,
+	.num_nodes = ARRAY_SIZE(pcie_anoc_nodes),
+	.bcms = pcie_anoc_bcms,
+	.num_bcms = ARRAY_SIZE(pcie_anoc_bcms),
+	.qos_requires_clocks = true,
+};
+
+static struct qcom_icc_bcm * const stdst_cfg_bcms[] = {
+	&bcm_cn0,
+	&bcm_cn1,
+};
+
+static struct qcom_icc_node * const stdst_cfg_nodes[] = {
+	[MASTER_CFG_CENTER] = &qsm_cfg_center,
+	[MASTER_CFG_EAST] = &qsm_cfg_east,
+	[MASTER_CFG_MM_HF] = &qsm_cfg_mm_hf,
+	[MASTER_CFG_MM_SF] = &qsm_cfg_mm_sf,
+	[MASTER_CFG_NORTH] = &qsm_cfg_north,
+	[MASTER_CFG_SOUTH] = &qsm_cfg_south,
+	[MASTER_CFG_WEST] = &qsm_cfg_west,
+	[SLAVE_AHB2PHY_SOUTH] = &qhs_ahb2phy0,
+	[SLAVE_BOOT_ROM] = &qhs_boot_rom,
+	[SLAVE_CAMERA_CFG] = &qhs_camera_cfg,
+	[SLAVE_CLK_CTL] = &qhs_clk_ctl,
+	[SLAVE_CRYPTO_CFG] = &qhs_crypto_cfg,
+	[SLAVE_DISPLAY_CFG] = &qhs_display_cfg,
+	[SLAVE_EVA_CFG] = &qhs_eva_cfg,
+	[SLAVE_GFX3D_CFG] = &qhs_gpuss_cfg,
+	[SLAVE_I2C] = &qhs_i2c,
+	[SLAVE_IMEM_CFG] = &qhs_imem_cfg,
+	[SLAVE_IPC_ROUTER_CFG] = &qhs_ipc_router,
+	[SLAVE_IRIS_CFG] = &qhs_iris_cfg,
+	[SLAVE_CNOC_MSS] = &qhs_mss_cfg,
+	[SLAVE_PCIE_0_CFG] = &qhs_pcie_cfg,
+	[SLAVE_PCIE_1_CFG] = &qhs_pcie_g4x1_cfg,
+	[SLAVE_PRNG] = &qhs_prng,
+	[SLAVE_QSPI_0] = &qhs_qspi,
+	[SLAVE_QUP_1] = &qhs_qup1,
+	[SLAVE_QUP_2] = &qhs_qup2,
+	[SLAVE_QUP_3] = &qhs_qup3,
+	[SLAVE_QUP_4] = &qhs_qup4,
+	[SLAVE_QUP_5] = &qhs_qup5,
+	[SLAVE_SDCC_2] = &qhs_sdc2,
+	[SLAVE_SDCC_4] = &qhs_sdc4,
+	[SLAVE_TLMM] = &qhs_tlmm,
+	[SLAVE_UFS_MEM_CFG] = &qhs_ufs_mem_cfg,
+	[SLAVE_USB3] = &qhs_usb3,
+	[SLAVE_VSENSE_CTRL_CFG] = &qhs_vsense_ctrl_cfg,
+	[SLAVE_PCIE_ANOC_CFG] = &qss_pcie_anoc_cfg,
+	[SLAVE_QDSS_CFG] = &qss_qdss_cfg,
+	[SLAVE_QDSS_STM] = &qss_qdss_stm,
+	[SLAVE_TCSR] = &qss_tcsr,
+	[SLAVE_TCU] = &xs_sys_tcu_cfg,
+};
+
+static const struct regmap_config maili_stdst_cfg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9000,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_stdst_cfg = {
+	.config = &maili_stdst_cfg_regmap_config,
+	.nodes = stdst_cfg_nodes,
+	.num_nodes = ARRAY_SIZE(stdst_cfg_nodes),
+	.bcms = stdst_cfg_bcms,
+	.num_bcms = ARRAY_SIZE(stdst_cfg_bcms),
+};
+
+static struct qcom_icc_node * const stdst_main_nodes[] = {
+	[MASTER_CNOC_STARDUST] = &qsm_cnoc_main,
+	[SLAVE_STARDUST_CENTER_CFG] = &qss_stdst_center_cfg,
+	[SLAVE_STARDUST_EAST_CFG] = &qss_stdst_east_cfg,
+	[SLAVE_STARDUST_MM_HF_CFG] = &qss_stdst_mm_hf_cfg,
+	[SLAVE_STARDUST_MM_SF_CFG] = &qss_stdst_mm_sf_cfg,
+	[SLAVE_STARDUST_NORTH_CFG] = &qss_stdst_north_cfg,
+	[SLAVE_STARDUST_SOUTH_CFG] = &qss_stdst_south_cfg,
+	[SLAVE_STARDUST_WEST_CFG] = &qss_stdst_west_cfg,
+};
+
+static const struct regmap_config maili_stdst_main_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf9000,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_stdst_main = {
+	.config = &maili_stdst_main_regmap_config,
+	.nodes = stdst_main_nodes,
+	.num_nodes = ARRAY_SIZE(stdst_main_nodes),
+};
+
+static struct qcom_icc_bcm * const system_noc_bcms[] = {
+	&bcm_sn0,
+	&bcm_sn2,
+};
+
+static struct qcom_icc_node * const system_noc_nodes[] = {
+	[MASTER_A1NOC_SNOC] = &qnm_aggre_noc,
+	[MASTER_APSS_NOC] = &qnm_apss_noc,
+	[MASTER_CNOC_SNOC] = &qnm_cnoc_data,
+	[SLAVE_SNOC_GEM_NOC_SF] = &qns_gemnoc_sf,
+};
+
+static const struct regmap_config maili_system_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x20080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc maili_system_noc = {
+	.config = &maili_system_noc_regmap_config,
+	.nodes = system_noc_nodes,
+	.num_nodes = ARRAY_SIZE(system_noc_nodes),
+	.bcms = system_noc_bcms,
+	.num_bcms = ARRAY_SIZE(system_noc_bcms),
+};
+
+static const struct of_device_id qnoc_of_match[] = {
+	{ .compatible = "qcom,maili-aggre-noc", .data = &maili_aggre1_noc },
+	{ .compatible = "qcom,maili-clk-virt", .data = &maili_clk_virt },
+	{ .compatible = "qcom,maili-cnoc-main", .data = &maili_cnoc_main },
+	{ .compatible = "qcom,maili-gem-noc", .data = &maili_gem_noc },
+	{ .compatible = "qcom,maili-llclpi-noc", .data = &maili_llclpi_noc },
+	{ .compatible = "qcom,maili-lpass-ag-noc", .data = &maili_lpass_ag_noc },
+	{ .compatible = "qcom,maili-lpass-lpiaon-noc", .data = &maili_lpass_lpiaon_noc },
+	{ .compatible = "qcom,maili-lpass-lpicx-noc", .data = &maili_lpass_lpicx_noc },
+	{ .compatible = "qcom,maili-mc-virt", .data = &maili_mc_virt },
+	{ .compatible = "qcom,maili-mmss-noc", .data = &maili_mmss_noc },
+	{ .compatible = "qcom,maili-nsp-noc", .data = &maili_nsp_noc },
+	{ .compatible = "qcom,maili-pcie-anoc", .data = &maili_pcie_anoc },
+	{ .compatible = "qcom,maili-stdst-cfg", .data = &maili_stdst_cfg },
+	{ .compatible = "qcom,maili-stdst-main", .data = &maili_stdst_main },
+	{ .compatible = "qcom,maili-system-noc", .data = &maili_system_noc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qnoc_of_match);
+
+static struct platform_driver qnoc_driver = {
+	.probe = qcom_icc_rpmh_probe,
+	.remove = qcom_icc_rpmh_remove,
+	.driver = {
+		.name = "qnoc-maili",
+		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
+	},
+};
+
+static int __init qnoc_driver_init(void)
+{
+	return platform_driver_register(&qnoc_driver);
+}
+core_initcall(qnoc_driver_init);
+
+static void __exit qnoc_driver_exit(void)
+{
+	platform_driver_unregister(&qnoc_driver);
+}
+module_exit(qnoc_driver_exit);
+
+MODULE_DESCRIPTION("Qualcomm Maili NoC driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


