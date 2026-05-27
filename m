Return-Path: <linux-arm-msm+bounces-109930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOoiDXiDFmoznAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 07:39:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 801EF5DF82C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 07:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFF66305D5F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 05:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DFB3090C5;
	Wed, 27 May 2026 05:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7cHVzj8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azXon6WR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415530596F
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860249; cv=none; b=HdMgqrz5/SZwxecuA8KcDnsqOmpOT9cWc9ZKz0cMm6defeoJ6NJ0ulo34cHsk+7VYBw7rTWdj8Hu8GbZIehX5SNPt+N134YxswJY/X1SpGchI/h6CqzcabEv6NBRGgkTeMw2R6W029DKobPSJ3AWs1Iu/nhkEH480CTLbwWdNic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860249; c=relaxed/simple;
	bh=DL8seG0fFhTOQpGV6aJQlM+Kb6rk+X/TsUYmj7F0LvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LV4UCMJreenF2uNDGFu0HCHlMeh6UP12C32sLpLwoIsCk8zOHfUDlnMVLRrh/Lp7yGLPAVbiZRhyK/0xp6gadM90QDzSOP8jhtK7NusHxtkqbLswcXdZVSXS7mPGBXv5MQrUVwO8pClj6gchHJS5AJvPg+qWfeUe4HfPKSvBtnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7cHVzj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azXon6WR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2WhvU189770
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvH3LjXQWtDXKjNiHYj4DRTZ9kI2HMA5faBBw84vBEo=; b=Y7cHVzj8utGELjbL
	QpHHixv8npGpeyI3jrVA1k4mUATEkoTkVvprEMJa6SFgTD+F4dHtwf+44puxjtUF
	LuQAU/pYnu4uGKgx/O2FHnf/itKvO0SCoUgrSoEGpQoVe6mGX+VBqcw3iXAiBEjq
	cyI89k8FeQe35sh1VDIArnkMrsFTn5gEm0f/Sbmqq0bxSJR4UdDGpgh/xyh6s05e
	APwB44z1y3hU0c2fsCy2p4E3VICQAGW0fqdhiFk/7IxuBruuIEgFtmYCTZfH6yC/
	A5Zw2Wp624Jqomg1XywyN/HUC/83GzZPgy8Nf4FzHgkHzxCJhPzjlWQ5rGtlOgwM
	yUdsuQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edh179sw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso115514005ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 22:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779860245; x=1780465045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvH3LjXQWtDXKjNiHYj4DRTZ9kI2HMA5faBBw84vBEo=;
        b=azXon6WRwHJ2rhGYCJHbY1ipFGO2EempbobI4jRmeGA8ektMj4rIKLBRWeKlWu6tfi
         tdeYSRrGswdMYla+L40suAVDSf9jKRpDZSNJL+GbhSzkh072BoeC+6vctZRvr2uEkSv0
         MXtRT4c6ewtH9iokEkYlPECQwa3Jb5bIMSz3fKnDVpSZgvKIGxQRvQzX8XZe6feYBfzk
         J4AE+1Uxryr2+HxbdKQXNvk+SqZsov4rPmFP0iCk8WsB/I9pCptb8UvCBeO+kN5/adn2
         QOnuuRFkstiPQvTDBa2c5onIHxGyxyCQkm+ocwGP1j5oZ6MruZWl7EhpxiF+h1FTNmOi
         sGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779860245; x=1780465045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DvH3LjXQWtDXKjNiHYj4DRTZ9kI2HMA5faBBw84vBEo=;
        b=evf5+H08qjm6V4DnGJD9y2/721y7fTCpDaHoiDG+h+O+Jkw5XcFyAAjxlKBZvU2NIF
         ltGJ2q+zO+mRRjp2s1SPGy1FaFUAPCdMZdg85aslDCF9el51NHx/nfQgPe3XQlyOJqFx
         Zxo7l7hjhY42qAhufeZgQC5A6RlN8Nj2QvkLxKUOtPwxDaN9i/EobLCIA8PMh7ySc8LY
         Y1+oHkZveEwTAZWuJ8YCjCXcPB+N5zihCeNXEMNehm7KOqRLZR494oWlOVvYvFTqa+rS
         iZCbrcR+6a43C1CyjeWE/ITn5pyYILeBaq09G2+AAXgi+iurQ1hq7N/ODJFQXTKWBND+
         NSNg==
X-Gm-Message-State: AOJu0Yw51G9uRa9LcvdNPDAL4F4lr/WebOsWs+LWLbDYtKmjTOhDWtd+
	aiq98wCD34y9ndG7eiqB4k6OAEx/6741JyVtTnJ1minQIdfXUhbd3ep7rTjCXG4H3fQkTaMQDrt
	bAOHfqAtqcc4jrwJogBDouqhpfqljrxf5vFDJVtuOL1drwEEYI208NalFPK2/UI55znyd
X-Gm-Gg: Acq92OE84FuY78YBrF7UTG51X4Gq5M+YvN6dZGoMAf9/Mdh+WfwGXme00UDMCKl4vrT
	slSqwfe4KLdNpT6ahWDbXiA7xd7YLi86dKR6RflwF84BCNqVYSOpNSm08icsBrIub4hSjEQmuL9
	mFfgsJ3j0rSpkTku4CMzDEcbPfk7N/5T9bqFooKnPVomkF/8n3z8KzypDS/nd/HSDKnHsxAUAYE
	ugcgtR3+OTrJrOlbAYryXGayJ0/tRe4X+lRXWxL8k815NIuAOLoxJ2pEjqdncTxarwXHptQ4Ouu
	m5cIzmys4ZOw5twU4SvOFetkMvRVyr5Fo0nzlLHDBli35dPrIPB6SeLiT0xV0N+u+v9QiX/GJU1
	xeEhcUfqLiI0ffdKW4FnSUb/B6VILF6bCtgTCEnecDERvvTz/tKq/HcQ=
X-Received: by 2002:a17:902:da84:b0:2be:b09e:721f with SMTP id d9443c01a7336-2beb09e7439mr247668285ad.31.1779860244877;
        Tue, 26 May 2026 22:37:24 -0700 (PDT)
X-Received: by 2002:a17:902:da84:b0:2be:b09e:721f with SMTP id d9443c01a7336-2beb09e7439mr247667815ad.31.1779860244209;
        Tue, 26 May 2026 22:37:24 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb569592dsm136338585ad.16.2026.05.26.22.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:37:23 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 27 May 2026 05:37:10 +0000
Subject: [PATCH v2 2/3] interconnect: qcom: x1e80100: enable QoS
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-x1e80100_qos-v2-2-305c6539e6d2@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
In-Reply-To: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: hoRoX4-YrmDXjk04K_9Qt-GYZlYZxICe
X-Proofpoint-GUID: hoRoX4-YrmDXjk04K_9Qt-GYZlYZxICe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA1MSBTYWx0ZWRfXxdPzDxTPLyAo
 DSyyT9FQOLSzE+9XYWzl9zAEcB6hMiobiF2cUZpJCMCCYkraUapeAn8jxwdM+1BDoawvvpuKPqK
 ySVwuebIvR7DZjox18P0svyT7XPkW4tHtpPrSxu90YfEHPQY/Piuu8lebDhpFFjwahSSXSo7T56
 fWqXIW6n58GMPgKAwH7mZOwcFvfFYvt7MI8wE+3MxsvPtr5Mc4R7xvIXs5nV/Hcwq8p7AjMYf3R
 YBtTok3Pev/LdYwZrUVG1OziP2x8v+KfBnAF7sMtsxeFYerx6wRsbztOMwzeJEeUfCMTPLKCxZp
 tE36U8Nl53fWDyuyKnLFl4j7knisPdt1pwwvXcN04VaHNS64jJbw30SgOa3Qc0dyprMJUI0EYDB
 QSvHjp4p4ybX/IkTK6GskaUpzm6BT4RpYywtDGJv8WHPUo0m0j1O5sqGwpd/Ff8pzT0U0REzodw
 muNTJT95AcMbU5D8nSA==
X-Authority-Analysis: v=2.4 cv=Gc0nWwXL c=1 sm=1 tr=0 ts=6a168316 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yo5WBCStKggJxw3bOVAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270051
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109930-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 801EF5DF82C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable QoS configuration for master ports with predefined priority
and urgency forwarding.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/x1e80100.c | 485 +++++++++++++++++++++++++++++++++++
 1 file changed, 485 insertions(+)

diff --git a/drivers/interconnect/qcom/x1e80100.c b/drivers/interconnect/qcom/x1e80100.c
index 2ba2823c7860..8075e0ff2059 100644
--- a/drivers/interconnect/qcom/x1e80100.c
+++ b/drivers/interconnect/qcom/x1e80100.c
@@ -173,6 +173,13 @@ static struct qcom_icc_node qhm_qspi = {
 	.name = "qhm_qspi",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xb000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -181,6 +188,13 @@ static struct qcom_icc_node qhm_qup1 = {
 	.name = "qhm_qup1",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -189,6 +203,13 @@ static struct qcom_icc_node xm_sdc4 = {
 	.name = "xm_sdc4",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -197,6 +218,13 @@ static struct qcom_icc_node xm_ufs_mem = {
 	.name = "xm_ufs_mem",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xe000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -205,6 +233,13 @@ static struct qcom_icc_node qhm_qup0 = {
 	.name = "qhm_qup0",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x16000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -213,6 +248,13 @@ static struct qcom_icc_node qhm_qup2 = {
 	.name = "qhm_qup2",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x11000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -221,6 +263,13 @@ static struct qcom_icc_node qxm_crypto = {
 	.name = "qxm_crypto",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x12000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -237,6 +286,13 @@ static struct qcom_icc_node xm_qdss_etr_0 = {
 	.name = "xm_qdss_etr_0",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x13000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -245,6 +301,13 @@ static struct qcom_icc_node xm_qdss_etr_1 = {
 	.name = "xm_qdss_etr_1",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x14000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -253,6 +316,13 @@ static struct qcom_icc_node xm_sdc2 = {
 	.name = "xm_sdc2",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x15000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -337,6 +407,13 @@ static struct qcom_icc_node alm_gpu_tcu = {
 	.name = "alm_gpu_tcu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x271000 },
+		.prio = 1,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -345,6 +422,13 @@ static struct qcom_icc_node alm_pcie_tcu = {
 	.name = "alm_pcie_tcu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x27d000 },
+		.prio = 3,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -353,6 +437,13 @@ static struct qcom_icc_node alm_sys_tcu = {
 	.name = "alm_sys_tcu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x273000 },
+		.prio = 6,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -370,6 +461,13 @@ static struct qcom_icc_node qnm_gpu = {
 	.name = "qnm_gpu",
 	.channels = 4,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 4,
+		.port_offsets = { 0x51000, 0x58000, 0xd1000, 0xd8000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -378,6 +476,13 @@ static struct qcom_icc_node qnm_lpass = {
 	.name = "qnm_lpass",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x275000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
 			&qns_pcie },
@@ -387,6 +492,13 @@ static struct qcom_icc_node qnm_mnoc_hf = {
 	.name = "qnm_mnoc_hf",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x53000, 0xd3000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -395,6 +507,13 @@ static struct qcom_icc_node qnm_mnoc_sf = {
 	.name = "qnm_mnoc_sf",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x55000, 0xd5000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -403,6 +522,13 @@ static struct qcom_icc_node qnm_nsp_noc = {
 	.name = "qnm_nsp_noc",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x57000, 0xd7000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
 			&qns_pcie },
@@ -412,6 +538,13 @@ static struct qcom_icc_node qnm_pcie = {
 	.name = "qnm_pcie",
 	.channels = 1,
 	.buswidth = 64,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x277000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -420,6 +553,13 @@ static struct qcom_icc_node qnm_snoc_sf = {
 	.name = "qnm_snoc_sf",
 	.channels = 1,
 	.buswidth = 64,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x27b000 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
 			&qns_pcie },
@@ -429,6 +569,13 @@ static struct qcom_icc_node xm_gic = {
 	.name = "xm_gic",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x27f000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_llcc },
 };
@@ -469,6 +616,13 @@ static struct qcom_icc_node qnm_av1_enc = {
 	.name = "qnm_av1_enc",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x2f000 },
+		.prio = 4,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -477,6 +631,13 @@ static struct qcom_icc_node qnm_camnoc_hf = {
 	.name = "qnm_camnoc_hf",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x28000, 0x29000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -485,6 +646,13 @@ static struct qcom_icc_node qnm_camnoc_icp = {
 	.name = "qnm_camnoc_icp",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x2a000 },
+		.prio = 4,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -493,6 +661,13 @@ static struct qcom_icc_node qnm_camnoc_sf = {
 	.name = "qnm_camnoc_sf",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x2b000, 0x2c000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -501,6 +676,13 @@ static struct qcom_icc_node qnm_eva = {
 	.name = "qnm_eva",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x33000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -509,6 +691,13 @@ static struct qcom_icc_node qnm_mdp = {
 	.name = "qnm_mdp",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x2d000, 0x2e000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -517,6 +706,13 @@ static struct qcom_icc_node qnm_video = {
 	.name = "qnm_video",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x30000, 0x31000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -525,6 +721,13 @@ static struct qcom_icc_node qnm_video_cv_cpu = {
 	.name = "qnm_video_cv_cpu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x32000 },
+		.prio = 4,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -533,6 +736,13 @@ static struct qcom_icc_node qnm_video_v_cpu = {
 	.name = "qnm_video_v_cpu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x34000 },
+		.prio = 4,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -573,6 +783,13 @@ static struct qcom_icc_node xm_pcie_3 = {
 	.name = "xm_pcie_3",
 	.channels = 1,
 	.buswidth = 64,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x7000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_north_gem_noc },
 };
@@ -581,6 +798,13 @@ static struct qcom_icc_node xm_pcie_4 = {
 	.name = "xm_pcie_4",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x8000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_north_gem_noc },
 };
@@ -589,6 +813,13 @@ static struct qcom_icc_node xm_pcie_5 = {
 	.name = "xm_pcie_5",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x9000 },
+		.prio = 3,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_north_gem_noc },
 };
@@ -597,6 +828,13 @@ static struct qcom_icc_node xm_pcie_0 = {
 	.name = "xm_pcie_0",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x9000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -605,6 +843,13 @@ static struct qcom_icc_node xm_pcie_1 = {
 	.name = "xm_pcie_1",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -613,6 +858,13 @@ static struct qcom_icc_node xm_pcie_2 = {
 	.name = "xm_pcie_2",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xb000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -621,6 +873,13 @@ static struct qcom_icc_node xm_pcie_6a = {
 	.name = "xm_pcie_6a",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -629,6 +888,13 @@ static struct qcom_icc_node xm_pcie_6b = {
 	.name = "xm_pcie_6b",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -653,6 +919,13 @@ static struct qcom_icc_node qnm_gic = {
 	.name = "qnm_gic",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1c000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_gemnoc_sf },
 };
@@ -685,6 +958,13 @@ static struct qcom_icc_node xm_usb2_0 = {
 	.name = "xm_usb2_0",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x6000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_north_snoc },
 };
@@ -693,6 +973,13 @@ static struct qcom_icc_node xm_usb3_mp = {
 	.name = "xm_usb3_mp",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x7000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_north_snoc },
 };
@@ -701,6 +988,13 @@ static struct qcom_icc_node xm_usb3_0 = {
 	.name = "xm_usb3_0",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -709,6 +1003,13 @@ static struct qcom_icc_node xm_usb3_1 = {
 	.name = "xm_usb3_1",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xb000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -717,6 +1018,13 @@ static struct qcom_icc_node xm_usb3_2 = {
 	.name = "xm_usb3_2",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -725,6 +1033,13 @@ static struct qcom_icc_node xm_usb4_0 = {
 	.name = "xm_usb4_0",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -733,6 +1048,13 @@ static struct qcom_icc_node xm_usb4_1 = {
 	.name = "xm_usb4_1",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xe000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -741,6 +1063,13 @@ static struct qcom_icc_node xm_usb4_2 = {
 	.name = "xm_usb4_2",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xf000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1466,11 +1795,21 @@ static struct qcom_icc_node * const aggre1_noc_nodes[] = {
 	[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
 };
 
+static const struct regmap_config x1e80100_aggre1_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x14400,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_aggre1_noc = {
+	.config = &x1e80100_aggre1_noc_regmap_config,
 	.nodes = aggre1_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
 	.bcms = aggre1_noc_bcms,
 	.num_bcms = ARRAY_SIZE(aggre1_noc_bcms),
+	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const aggre2_noc_bcms[] = {
@@ -1488,7 +1827,16 @@ static struct qcom_icc_node * const aggre2_noc_nodes[] = {
 	[SLAVE_A2NOC_SNOC] = &qns_a2noc_snoc,
 };
 
+static const struct regmap_config x1e80100_aggre2_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c400,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_aggre2_noc = {
+	.config = &x1e80100_aggre2_noc_regmap_config,
 	.nodes = aggre2_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
 	.bcms = aggre2_noc_bcms,
@@ -1573,7 +1921,16 @@ static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
 	[SLAVE_TCU] = &xs_sys_tcu_cfg,
 };
 
+static const struct regmap_config x1e80100_cnoc_cfg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x6600,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_cnoc_cfg = {
+	.config = &x1e80100_cnoc_cfg_regmap_config,
 	.nodes = cnoc_cfg_nodes,
 	.num_nodes = ARRAY_SIZE(cnoc_cfg_nodes),
 	.bcms = cnoc_cfg_bcms,
@@ -1603,7 +1960,16 @@ static struct qcom_icc_node * const cnoc_main_nodes[] = {
 	[SLAVE_PCIE_6B] = &xs_pcie_6b,
 };
 
+static const struct regmap_config x1e80100_cnoc_main_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x14400,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_cnoc_main = {
+	.config = &x1e80100_cnoc_main_regmap_config,
 	.nodes = cnoc_main_nodes,
 	.num_nodes = ARRAY_SIZE(cnoc_main_nodes),
 	.bcms = cnoc_main_bcms,
@@ -1633,7 +1999,16 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
 	[SLAVE_MEM_NOC_PCIE_SNOC] = &qns_pcie,
 };
 
+static const struct regmap_config x1e80100_gem_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x311200,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_gem_noc = {
+	.config = &x1e80100_gem_noc_regmap_config,
 	.nodes = gem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
 	.bcms = gem_noc_bcms,
@@ -1648,7 +2023,16 @@ static struct qcom_icc_node * const lpass_ag_noc_nodes[] = {
 	[SLAVE_LPASS_GEM_NOC] = &qns_lpass_ag_noc_gemnoc,
 };
 
+static const struct regmap_config x1e80100_lpass_ag_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xe080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_lpass_ag_noc = {
+	.config = &x1e80100_lpass_ag_noc_regmap_config,
 	.nodes = lpass_ag_noc_nodes,
 	.num_nodes = ARRAY_SIZE(lpass_ag_noc_nodes),
 	.bcms = lpass_ag_noc_bcms,
@@ -1664,7 +2048,16 @@ static struct qcom_icc_node * const lpass_lpiaon_noc_nodes[] = {
 	[SLAVE_LPIAON_NOC_LPASS_AG_NOC] = &qns_lpass_aggnoc,
 };
 
+static const struct regmap_config x1e80100_lpass_lpiaon_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x19080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_lpass_lpiaon_noc = {
+	.config = &x1e80100_lpass_lpiaon_noc_regmap_config,
 	.nodes = lpass_lpiaon_noc_nodes,
 	.num_nodes = ARRAY_SIZE(lpass_lpiaon_noc_nodes),
 	.bcms = lpass_lpiaon_noc_bcms,
@@ -1679,7 +2072,16 @@ static struct qcom_icc_node * const lpass_lpicx_noc_nodes[] = {
 	[SLAVE_LPICX_NOC_LPIAON_NOC] = &qns_lpi_aon_noc,
 };
 
+static const struct regmap_config x1e80100_lpass_lpicx_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x3a200,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_lpass_lpicx_noc = {
+	.config = &x1e80100_lpass_lpicx_noc_regmap_config,
 	.nodes = lpass_lpicx_noc_nodes,
 	.num_nodes = ARRAY_SIZE(lpass_lpicx_noc_nodes),
 	.bcms = lpass_lpicx_noc_bcms,
@@ -1724,7 +2126,16 @@ static struct qcom_icc_node * const mmss_noc_nodes[] = {
 	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
 };
 
+static const struct regmap_config x1e80100_mmss_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x5b800,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_mmss_noc = {
+	.config = &x1e80100_mmss_noc_regmap_config,
 	.nodes = mmss_noc_nodes,
 	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
 	.bcms = mmss_noc_bcms,
@@ -1740,7 +2151,16 @@ static struct qcom_icc_node * const nsp_noc_nodes[] = {
 	[SLAVE_CDSP_MEM_NOC] = &qns_nsp_gemnoc,
 };
 
+static const struct regmap_config x1e80100_nsp_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xe080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_nsp_noc = {
+	.config = &x1e80100_nsp_noc_regmap_config,
 	.nodes = nsp_noc_nodes,
 	.num_nodes = ARRAY_SIZE(nsp_noc_nodes),
 	.bcms = nsp_noc_bcms,
@@ -1757,7 +2177,16 @@ static struct qcom_icc_node * const pcie_center_anoc_nodes[] = {
 	[SLAVE_ANOC_PCIE_GEM_NOC] = &qns_pcie_mem_noc,
 };
 
+static const struct regmap_config x1e80100_pcie_center_anoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x7000,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_pcie_center_anoc = {
+	.config = &x1e80100_pcie_center_anoc_regmap_config,
 	.nodes = pcie_center_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(pcie_center_anoc_nodes),
 	.bcms = pcie_center_anoc_bcms,
@@ -1774,7 +2203,16 @@ static struct qcom_icc_node * const pcie_north_anoc_nodes[] = {
 	[SLAVE_PCIE_NORTH] = &qns_pcie_north_gem_noc,
 };
 
+static const struct regmap_config x1e80100_pcie_north_anoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_pcie_north_anoc = {
+	.config = &x1e80100_pcie_north_anoc_regmap_config,
 	.nodes = pcie_north_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(pcie_north_anoc_nodes),
 	.bcms = pcie_north_anoc_bcms,
@@ -1793,7 +2231,16 @@ static struct qcom_icc_node * const pcie_south_anoc_nodes[] = {
 	[SLAVE_PCIE_SOUTH] = &qns_pcie_south_gem_noc,
 };
 
+static const struct regmap_config x1e80100_pcie_south_anoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xd080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_pcie_south_anoc = {
+	.config = &x1e80100_pcie_south_anoc_regmap_config,
 	.nodes = pcie_south_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(pcie_south_anoc_nodes),
 	.bcms = pcie_south_anoc_bcms,
@@ -1815,7 +2262,16 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
 	[SLAVE_SNOC_GEM_NOC_SF] = &qns_gemnoc_sf,
 };
 
+static const struct regmap_config x1e80100_system_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_system_noc = {
+	.config = &x1e80100_system_noc_regmap_config,
 	.nodes = system_noc_nodes,
 	.num_nodes = ARRAY_SIZE(system_noc_nodes),
 	.bcms = system_noc_bcms,
@@ -1831,7 +2287,16 @@ static struct qcom_icc_node * const usb_center_anoc_nodes[] = {
 	[SLAVE_USB_NOC_SNOC] = &qns_aggre_usb_snoc,
 };
 
+static const struct regmap_config x1e80100_usb_center_anoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8800,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_usb_center_anoc = {
+	.config = &x1e80100_usb_center_anoc_regmap_config,
 	.nodes = usb_center_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(usb_center_anoc_nodes),
 	.bcms = usb_center_anoc_bcms,
@@ -1847,11 +2312,21 @@ static struct qcom_icc_node * const usb_north_anoc_nodes[] = {
 	[SLAVE_AGGRE_USB_NORTH] = &qns_aggre_usb_north_snoc,
 };
 
+static const struct regmap_config x1e80100_usb_north_anoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x7080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_usb_north_anoc = {
+	.config = &x1e80100_usb_north_anoc_regmap_config,
 	.nodes = usb_north_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(usb_north_anoc_nodes),
 	.bcms = usb_north_anoc_bcms,
 	.num_bcms = ARRAY_SIZE(usb_north_anoc_bcms),
+	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const usb_south_anoc_bcms[] = {
@@ -1867,11 +2342,21 @@ static struct qcom_icc_node * const usb_south_anoc_nodes[] = {
 	[SLAVE_AGGRE_USB_SOUTH] = &qns_aggre_usb_south_snoc,
 };
 
+static const struct regmap_config x1e80100_usb_south_anoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc x1e80100_usb_south_anoc = {
+	.config = &x1e80100_usb_south_anoc_regmap_config,
 	.nodes = usb_south_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(usb_south_anoc_nodes),
 	.bcms = usb_south_anoc_bcms,
 	.num_bcms = ARRAY_SIZE(usb_south_anoc_bcms),
+	.qos_requires_clocks = true,
 };
 
 static const struct of_device_id qnoc_of_match[] = {

-- 
2.43.0


