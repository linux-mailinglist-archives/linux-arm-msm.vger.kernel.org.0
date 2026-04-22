Return-Path: <linux-arm-msm+bounces-104008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMvuJ/cs6GmYGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 04:05:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE6B4413E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 04:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBEA23021B9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646DA30BF4F;
	Wed, 22 Apr 2026 02:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NM4jiT7e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3djR7MZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380912E62A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776823542; cv=none; b=hoom28umB5w0/+XJEdu4E3/Z7bCyNv7mDvRPHEAxbuCy7AIfHAv0LiIZ8iAOdOjyorGTB3icxj4u5Z8UGpxsk0oaAIbHkVBjURKZc0vV5eZgBJImsyHPHIqYA3W63li4/VS16+nrlK91q4MCDmFGJIhLI2kasqEL235FVWRm2Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776823542; c=relaxed/simple;
	bh=zU/mEB4wBQibPmjskf1RzN5YoxgiHUDlAITXqmAVj+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJvAdoN/R/0UgGBQiIW/SRJFkWRDSv0ox8p/2TA1L+A0LFA73PeeTY0+WzaTfQ/LSjb/0IsScz2OG21VXoMsEwtV+ykxbfv3d1ZqefXX9IH+y1Q0CxIdTPgQ9sur+vvlEfXE5SFxjBl3QFtjv+aEXTK6z0LL/TGJ40OMXjDZHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NM4jiT7e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3djR7MZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZjwG3377463
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9RXI1/VCdzuvdAtzCvxInSut7Y0bEXfLU9ctF87H2Qs=; b=NM4jiT7eaBekxV3F
	Ou6SC6kl6Nd/9WGfojAppiNjKujD8JJEbAw/i/I7ue76A+/rQbIVRRTa24dA0nCO
	4egVHYvqe2XPfLKUsoD55GBENn6JPiEHUb7eviyk/vy2Ze77M+52nKO2Mj2K94Vy
	n8lGnLE4Kkqy2H73jGdMs/pOeK0HUMEbxgMxsnFGWL/zXcZt76PHgN2ETeRWdRSu
	CNGQREsm0mJhmj+cpACITCW0OLan6LMr7ydQG0M5ckewlfW0b2FfXgJ8M+5aFcH/
	eWROfc0iAe+gHQHsfkxCjJs5UdkGedaxvIO8xQdUizL0VEJ8nLDQ8ug/oZqxJQm1
	Z0GBkg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng1834-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f896eb6faso5399339b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 19:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776823538; x=1777428338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RXI1/VCdzuvdAtzCvxInSut7Y0bEXfLU9ctF87H2Qs=;
        b=V3djR7MZqQhkBd77Ka7PyAOe9D+ohPQD0UaSBHAHe3wezI16BbsnMFNj5+6I3CzdLO
         NwXgPj5j7DTFh9rikcue2QiZ97/r7tAye3nGh46SWx+szZDtUl4+g3TWIwmHJeRL1R+P
         fcpsV+vE072AjjeeQo2r0XSYuSnvY3PHGzE8X0twdMhcLkgdy/NhKOT629WrkEUkpOb3
         zo9ZLxtw924OtoVCoZcCWXM1qPPhWSnwdHRcWQ34iwUz9CeXtfYBpRgpAlnxcpPHuHnP
         H91J1h0zWCz7aX2EQYSaXXMi35DuvB418iFdh6tGgauZqDRLPM7cLaklF+yYWxYJGN/g
         7tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823538; x=1777428338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9RXI1/VCdzuvdAtzCvxInSut7Y0bEXfLU9ctF87H2Qs=;
        b=ToXyWPEHMeMMn/kIP41r2Qlap/2YStxyqaX2m81kprZ2Smw3th0Mc+iS5sQPMLy/VF
         uHIoYsPvAW0X3TWe6IQ3D5MobssE9/0FB247UlNbOAInJiYYBbSIOGy6gOVx5LPfwbNJ
         uyBBv8JxXQQCtL6wLCr3QJytXNmuXH13YG604HtUh9HtSMrvjdjtHCHlHf83xmEHiARY
         5yHWjWexTmUk7xnlQn69jsmyG0deMtLBw0Sz2dk4BuZyJNyad92aNr1G4leqYH9FxXcO
         X8qRlIA8JTAqjQ+xy27kVZRkSvlpxfQsFb5NajWMy4wLJcm+1Df2vKylNGR/J0SHTxIR
         P/xA==
X-Gm-Message-State: AOJu0YywKnar1Fuqy+0C9LhvcPz1AsDR8HYPmHW+qweIqb7nOSS4xLxY
	iWn/16IMp6AcOKEBcNTLoZssAGT22lC6li+c1APd68H1hd+7tJxfJrpmY3s2WH/nCsddIMNDJaS
	XLW2fMOeF3frQYbIGGEpoVH5TCGI+3Nx6YADNNc72CGXROM3yUT7gAA+UUfntt/emL6SyBkC+Z6
	74
X-Gm-Gg: AeBDietat/eZ3jOWYFuKxRf3vj2yftWahQFJowPQQu0pajSarVRxoV4p0hn7CKnS5L9
	TRhyYK9Ko9w5wa76pqdaNUB46e/Ptz3trBfxLm00RhzI83UCR6m4x4Zd2XucM36tpDhSZoJ95ls
	CbAgUiC+UgYnM++UMgPIymurgIq03FkYwIL0kiIArs7tAUVy2YyzkFrKuG04O6XR2X41JjWmNbx
	Ec1Hm7u7CTld/csokYlYrpBUS7fBy3h/1j6Db0UPXtXrG6j2onrYLYFmSatraaJCJlGsERWQZ/M
	sY9vfFwE4pcu+sr1X3KHo/5tmbvSLNUhjPXHD8kgOFU3vr4jAOVSbW2pYtQo0q0d5WhXp50rB/E
	bXWtSYHlQiKzjDGiNNrFgkREJKhy4ciPwZRo+JS2Cc4nXP6cadvXPU0o=
X-Received: by 2002:a05:6a00:6595:b0:82f:964c:e3d0 with SMTP id d2e1a72fcca58-82f964d0ddemr13556695b3a.39.1776823537670;
        Tue, 21 Apr 2026 19:05:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:6595:b0:82f:964c:e3d0 with SMTP id d2e1a72fcca58-82f964d0ddemr13556653b3a.39.1776823536905;
        Tue, 21 Apr 2026 19:05:36 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981be6sm18040368b3a.9.2026.04.21.19.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:05:36 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 02:05:12 +0000
Subject: [PATCH 2/3] interconnect: qcom: x1e80100: enable QoS configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-x1e80100_qos-v1-2-bcc2afe4cc78@oss.qualcomm.com>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
In-Reply-To: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e82cf3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yo5WBCStKggJxw3bOVAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 8208FYBlRR6nUgR8JIKjssrP9wReZAwK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxOSBTYWx0ZWRfX9h+muKwOpMWJ
 K3raUlPrU/V7XUSJrrVF0v0j1S4UWDTpeK/zkpQlqhgTLGlvXxVbbDEjpgxpClLZemoocgUGylf
 1rzijakiFeys8dW+ZwyPEtY3sdTKYu7PQqqJN4j/K6VNzXMyBX9sFkdau51ERgVmvrJ9rZ2aOEa
 zNR3trqJR4bolBU/KViH6yQtpvN+nKxH8DpU2Ndome4r17FOofZkfgjAtQiPWMHIbJ3lTUwHyzk
 MDRR+PMRdvBCNpmrmrunfLGQz2gCKKRH6dvfH6eEojTvpzL6zFO+mTneKo8OZvM77n4kH0EE6pu
 iXKaVTrAN23OoLAwWVNvBtIo88PycwcyXIArhXiOacOm4KfspykugvBe4sAXZqR75W1h0hFvzWF
 lUX89pvcBZxyGqOZloFYoOSHoMnk+dYQD8f+PixTUSKOSlp8ED7IBHvAbgTpqvogXYxkrIN+LCY
 Tm/nYiBlv/qfHwgrDHg==
X-Proofpoint-ORIG-GUID: 8208FYBlRR6nUgR8JIKjssrP9wReZAwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220019
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104008-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5AE6B4413E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable QoS configuration for master ports with predefined priority
and urgency forwarding.

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


