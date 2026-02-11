Return-Path: <linux-arm-msm+bounces-92584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBAiNvdHjGkHkgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:12:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8012297C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 356B6306BC89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 09:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C28235502C;
	Wed, 11 Feb 2026 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1Pbl4xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtB0bBkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3C1354AD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770801106; cv=none; b=A+352mCk7ASjnaMUvFd05YyofRYbkB0em3YA1C+lzX7qqXc/0HnUlEYghrTEE+EmDF3OQnGYUMg427FpqK3gGpS/TnKfSBKohU8D9xuhfk93+nJGGyCA2fwc900wDMc2pxpT4WJU3hURwsWyW9SkgBAxIWfwrRzaCGmQ7bistGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770801106; c=relaxed/simple;
	bh=B7tlSaRxoVzDVzgWIvLFZJvfgJWCbLmlyzh9k+uC7R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPL42DbuuVQfTViKt9CaYto0319GJ/WVT5CL2uspKhkTmjW+iE1SpksEHnC//sikQcMfrXkpWe9ScsiLnDnQvvTJm8ubo6ZWvhIOAoJ7dTlnwZUw4KfmyUJrw/KlNq39Ej1CW0wzjk5jhGc3RcnmPullOEKPXkYEgpOOjo1H6AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1Pbl4xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtB0bBkH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B3cQbu837932
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LhcnCaZGEe3
	cTjSbYgHfJXBp6F4JDXqmAu7e6xxYU4w=; b=T1Pbl4xd0z4SCE04qBaR3B3fwSO
	U3SF+k+uK2dc5U1GTukOIyJDZSIBp0JwjjmYMoHPTIWSoykqQOH/wcgVV5YCe5f9
	hi0m2sOjNUaucFrCny756nLgifCkFpiw9ygHdcp5bsS7fET9FecACJeMKY6DmAWz
	HnoRlrmbwydrH1y7MUWW8YSBOHMsMwOECRYuu1tTFl9z0BUGEg0I3vEywKaOQosp
	PVZKoWllz0P/nVJyw3LVi2yQIYYXPz7ho/mg71RBoPnrBkBiF/USDF4zutXAtyDj
	vSEtw+UUT56ktNLHb5UsLhlyh6BxTGffRT1+xcZjJSTKwvfzS1xHRBlsUNg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8j1t8x0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:11:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c61dee98720so3206774a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770801103; x=1771405903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhcnCaZGEe3cTjSbYgHfJXBp6F4JDXqmAu7e6xxYU4w=;
        b=TtB0bBkHRGJIVjnIjYdYOGcvyseh8Y1ZJCQqSF/2M23B4rry+HVWvpdl6TjdnAjLKU
         ugfVyX1xkDxwsDvEOrYM8Gm3pJQTcvgcaeXILRiUXr0UU4Wvh58L7vTKftAzj9QqSuf4
         lyw43bGL2XsztrqWG7zOyu9i4zSaVoQ0KM4ZQHxLlBgUj7sOdVmBGtPBslGEM1WI2GzN
         H5Os8CyR7Laar1zVw+Lfd8B84h9WnqSxvynB/jRL3ZKZQhk/E1UJNrsI583In3gGRqiu
         0qUEgvJvPInSbkdFAt7nWayD9KiJwSyL08QZjge03dGHiNAPvDqFQBA/b4NDZPXqNCxT
         WvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770801103; x=1771405903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LhcnCaZGEe3cTjSbYgHfJXBp6F4JDXqmAu7e6xxYU4w=;
        b=LkJPN9YI3qaKgPMVfSKqkVGxbZvf/cu1aBXR8+U5NzVkprURb0ptCwtQNu+Z5c17jk
         iHUCnRkN9B+JpcrmrstCbOX6ywqcKRICqgHbxBBVefbQqz7GcaTT61TG1dIxWGaHNXEK
         wbbRPjNH+ITu+odGmoNQKX0pvCg0KRhDqlf/BJJPTx0LZrcgLNg6CRa602JYAGQ5Nfgl
         RG69yypmxXLEzQ2yczYod/dgTreQwXlbOkN0xKYKbQsPh7goF41Z07By19sf5tSYml9E
         w9F+ePkFg7Bco6Wf7jv2lgd3kHF/VGju8a1ENkbDUvAKrbpeUA8DUd4GzviDkvVWheOk
         BPVA==
X-Forwarded-Encrypted: i=1; AJvYcCVNnjN6+e7hf5NVjz96pALkrhULYTaehznD2f2/sbrYU4FJG0BPF2hlPrF8SmCj5iyLZqGqZmkDFySNveGm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw17vCk+bKb9vJY7F83uuR5OqBQ4RzXtQY+FCDWcEuqYxTCd8Sn
	buv55887p/HZVoItLA1w3A24OzbIQRcj1QSW1ztxBuN5jicuqYc8AkuX8qfPcc2HG5oZcB1r4ko
	Hd+G8OWzpkP0axUGEUNVtmUjVRHqdi4Eb9taMddI3pk3z9lHrijkCi6zqlnoSKRJjlEB4GJ4RYs
	6I
X-Gm-Gg: AZuq6aL7EFvzCTME5jIXKorMTwHK48VZiPZZ4SCU6setcHeKDCY7k9M7/SNZPleBuVG
	kouvFaosapckfbDOlkldY7zXYib91vV9owd2+Zp71JkvM/f8rUZfGKRj9NrTuWE+gG3RyvhJ7oR
	W5UFEJIt80qF6DGFHQPyGXe3yHB7IlbuzuRJNOqHlwK2wMJQ6E3P5if5uuRl4+mkZAjpPxMLQmx
	gm3LhA5a4a0x4qoowUamxPgsZRGhJx2OmQ+e3PGtdyaKkwZ/9bGd/W0MQO4HLqmTErsFsDS2QLD
	QG5mPgxLN1XXfKsX0QMrtX+ailBWWKcBwGGZFuYubYXw7R/ME4sb9cqBC9lI4jffDL+4ktUeDqf
	51BNBDuy7c/sI4artZxb110T2E+EuqF50oEZ6PNrWaDQHj9GXC80IrMk=
X-Received: by 2002:a05:6a21:618f:b0:38c:627f:872b with SMTP id adf61e73a8af0-3942e69e362mr2089502637.59.1770801103063;
        Wed, 11 Feb 2026 01:11:43 -0800 (PST)
X-Received: by 2002:a05:6a21:618f:b0:38c:627f:872b with SMTP id adf61e73a8af0-3942e69e362mr2089474637.59.1770801102543;
        Wed, 11 Feb 2026 01:11:42 -0800 (PST)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e1981512bsm1521481a12.31.2026.02.11.01.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:11:42 -0800 (PST)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH v2 2/3] interconnect: qcom: qcs615: enable QoS configuration
Date: Wed, 11 Feb 2026 14:41:11 +0530
Message-ID: <20260211091112.3285626-3-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211091112.3285626-1-odelu.kukatla@oss.qualcomm.com>
References: <20260211091112.3285626-1-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3NCBTYWx0ZWRfX9w6Lzj0gDiNW
 kt1NaOym/r2FhjqZwrDNzbuHKKxS7fVI7MCscPqtTzmKhghbq5anBZvWemh3WjyOzEMj1MTtUHE
 cDhj9YFGCKc3/6XvteewFE8k8xIxp3QtMm6h78H9of+qNFmafcEnVclEQsT5yWEN1dc8X+QIenC
 lkwXKBJxeEH+wMfs93qcsDBxNfqtSK7+bF5iYHWSGgjB9tmxqBXS+Xl7oSUhyVMnrCjRoH+x7kB
 jWYNkJcuOOnmEaI2uVZLQRBuvoOEw20FPwH6wQctJ918YlTfx+5ylyLC82FP6PyxXk/hkz7Wq3L
 g0rbxJ6oLPvZwIL7o6tJvosMjxOIQKiAfmnKAmE92uDZB2qrXTMFsaBRYXoU/WU8649LLN6BbHF
 Q2+dJ4kVDVacQQEhAR0c4W/Qr4MEiIluBqQbw7YZ9euWnsKxzjwVUlY2C/hActmOpwvlPXCs8Pp
 g8Armrh/zgnw7vOb4nA==
X-Proofpoint-ORIG-GUID: bNGjBlUdYBKKnuicclOThjZaPS2XZ_pa
X-Authority-Analysis: v=2.4 cv=cabfb3DM c=1 sm=1 tr=0 ts=698c47d0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=_F59LTAU7XM1lwoZ_igA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: bNGjBlUdYBKKnuicclOThjZaPS2XZ_pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-92584-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68C8012297C
X-Rspamd-Action: no action

Enable QoS configuration for master ports with predefined priority
and urgency forwarding.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 drivers/interconnect/qcom/qcs615.c | 247 +++++++++++++++++++++++++++++
 1 file changed, 247 insertions(+)

diff --git a/drivers/interconnect/qcom/qcs615.c b/drivers/interconnect/qcom/qcs615.c
index 797956eb6ff5..017a6017421f 100644
--- a/drivers/interconnect/qcom/qcs615.c
+++ b/drivers/interconnect/qcom/qcs615.c
@@ -142,6 +142,12 @@ static struct qcom_icc_node qhm_qdss_bam = {
 	.name = "qhm_qdss_bam",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -150,6 +156,12 @@ static struct qcom_icc_node qhm_qspi = {
 	.name = "qhm_qspi",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x17000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -158,6 +170,12 @@ static struct qcom_icc_node qhm_qup0 = {
 	.name = "qhm_qup0",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x10000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -166,6 +184,12 @@ static struct qcom_icc_node qhm_qup1 = {
 	.name = "qhm_qup1",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x12000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -174,6 +198,12 @@ static struct qcom_icc_node qnm_cnoc = {
 	.name = "qnm_cnoc",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x4000 },
+		.prio = 2,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -182,6 +212,12 @@ static struct qcom_icc_node qxm_crypto = {
 	.name = "qxm_crypto",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x5000 },
+		.prio = 2,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -190,6 +226,12 @@ static struct qcom_icc_node qxm_ipa = {
 	.name = "qxm_ipa",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x6000 },
+		.prio = 2,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_lpass_snoc },
 };
@@ -198,6 +240,12 @@ static struct qcom_icc_node xm_emac_avb = {
 	.name = "xm_emac_avb",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -206,6 +254,12 @@ static struct qcom_icc_node xm_pcie = {
 	.name = "xm_pcie",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x13000 },
+		.prio = 0,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_snoc },
 };
@@ -214,6 +268,12 @@ static struct qcom_icc_node xm_qdss_etr = {
 	.name = "xm_qdss_etr",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xb000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -222,6 +282,12 @@ static struct qcom_icc_node xm_sdc1 = {
 	.name = "xm_sdc1",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xe000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -230,6 +296,12 @@ static struct qcom_icc_node xm_sdc2 = {
 	.name = "xm_sdc2",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x16000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -238,6 +310,12 @@ static struct qcom_icc_node xm_ufs_mem = {
 	.name = "xm_ufs_mem",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x11000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -246,6 +324,12 @@ static struct qcom_icc_node xm_usb2 = {
 	.name = "xm_usb2",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x15000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -254,6 +338,12 @@ static struct qcom_icc_node xm_usb3_0 = {
 	.name = "xm_usb3_0",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 2,
+		.urg_fwd = 0,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -356,6 +446,12 @@ static struct qcom_icc_node acm_apps = {
 	.name = "acm_apps",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x2e000, 0x2e100 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_snoc, &qns_llcc,
 			&qns_sys_pcie },
@@ -365,6 +461,12 @@ static struct qcom_icc_node acm_gpu_tcu = {
 	.name = "acm_gpu_tcu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x36000 },
+		.prio = 6,
+		.urg_fwd = 0,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_snoc, &qns_llcc },
 };
@@ -373,6 +475,12 @@ static struct qcom_icc_node acm_sys_tcu = {
 	.name = "acm_sys_tcu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x37000 },
+		.prio = 6,
+		.urg_fwd = 0,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_snoc, &qns_llcc },
 };
@@ -389,6 +497,12 @@ static struct qcom_icc_node qnm_gpu = {
 	.name = "qnm_gpu",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x34000, 0x34080 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_snoc, &qns_llcc },
 };
@@ -397,6 +511,12 @@ static struct qcom_icc_node qnm_mnoc_hf = {
 	.name = "qnm_mnoc_hf",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x2f000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_llcc },
 };
@@ -405,6 +525,12 @@ static struct qcom_icc_node qnm_mnoc_sf = {
 	.name = "qnm_mnoc_sf",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x35000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_snoc, &qns_llcc },
 };
@@ -413,6 +539,12 @@ static struct qcom_icc_node qnm_snoc_gc = {
 	.name = "qnm_snoc_gc",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x31000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_llcc },
 };
@@ -421,6 +553,12 @@ static struct qcom_icc_node qnm_snoc_sf = {
 	.name = "qnm_snoc_sf",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x30000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_llcc },
 };
@@ -445,6 +583,12 @@ static struct qcom_icc_node qxm_camnoc_hf0 = {
 	.name = "qxm_camnoc_hf0",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -453,6 +597,12 @@ static struct qcom_icc_node qxm_camnoc_hf1 = {
 	.name = "qxm_camnoc_hf1",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xb000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -461,6 +611,12 @@ static struct qcom_icc_node qxm_camnoc_sf = {
 	.name = "qxm_camnoc_sf",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x9000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns2_mem_noc },
 };
@@ -469,6 +625,12 @@ static struct qcom_icc_node qxm_mdp0 = {
 	.name = "qxm_mdp0",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -477,6 +639,12 @@ static struct qcom_icc_node qxm_rot = {
 	.name = "qxm_rot",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xe000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns2_mem_noc },
 };
@@ -485,6 +653,12 @@ static struct qcom_icc_node qxm_venus0 = {
 	.name = "qxm_venus0",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xf000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns2_mem_noc },
 };
@@ -493,6 +667,12 @@ static struct qcom_icc_node qxm_venus_arm9 = {
 	.name = "qxm_venus_arm9",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x11000 },
+		.prio = 0,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns2_mem_noc },
 };
@@ -559,6 +739,12 @@ static struct qcom_icc_node qxm_pimem = {
 	.name = "qxm_pimem",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 2,
+		.urg_fwd = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_memnoc_gc, &qxs_imem },
 };
@@ -567,6 +753,12 @@ static struct qcom_icc_node xm_gic = {
 	.name = "xm_gic",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 2,
+		.urg_fwd = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_memnoc_gc, &qxs_imem },
 };
@@ -1213,11 +1405,21 @@ static struct qcom_icc_node * const aggre1_noc_nodes[] = {
 	[SLAVE_SERVICE_A2NOC] = &srvc_aggre2_noc,
 };
 
+static const struct regmap_config qcs615_aggre1_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x3f200,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc qcs615_aggre1_noc = {
+	.config = &qcs615_aggre1_noc_regmap_config,
 	.nodes = aggre1_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
 	.bcms = aggre1_noc_bcms,
 	.num_bcms = ARRAY_SIZE(aggre1_noc_bcms),
+	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const camnoc_virt_bcms[] = {
@@ -1289,7 +1491,16 @@ static struct qcom_icc_node * const config_noc_nodes[] = {
 	[SLAVE_SERVICE_CNOC] = &srvc_cnoc,
 };
 
+static const struct regmap_config qcs615_config_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x5080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc qcs615_config_noc = {
+	.config = &qcs615_config_noc_regmap_config,
 	.nodes = config_noc_nodes,
 	.num_nodes = ARRAY_SIZE(config_noc_nodes),
 	.bcms = config_noc_bcms,
@@ -1302,7 +1513,16 @@ static struct qcom_icc_node * const dc_noc_nodes[] = {
 	[SLAVE_LLCC_CFG] = &qhs_llcc,
 };
 
+static const struct regmap_config qcs615_dc_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x3200,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc qcs615_dc_noc = {
+	.config = &qcs615_dc_noc_regmap_config,
 	.nodes = dc_noc_nodes,
 	.num_nodes = ARRAY_SIZE(dc_noc_nodes),
 };
@@ -1331,7 +1551,16 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
 	[SLAVE_SERVICE_GEM_NOC] = &srvc_gemnoc,
 };
 
+static const struct regmap_config qcs615_gem_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x3e200,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc qcs615_gem_noc = {
+	.config = &qcs615_gem_noc_regmap_config,
 	.nodes = gem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
 	.bcms = gem_noc_bcms,
@@ -1376,7 +1605,16 @@ static struct qcom_icc_node * const mmss_noc_nodes[] = {
 	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
 };
 
+static const struct regmap_config qcs615_mmss_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c100,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc qcs615_mmss_noc = {
+	.config = &qcs615_mmss_noc_regmap_config,
 	.nodes = mmss_noc_nodes,
 	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
 	.bcms = mmss_noc_bcms,
@@ -1418,7 +1656,16 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
 	[SLAVE_TCU] = &xs_sys_tcu_cfg,
 };
 
+static const struct regmap_config qcs615_system_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1f300,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc qcs615_system_noc = {
+	.config = &qcs615_system_noc_regmap_config,
 	.nodes = system_noc_nodes,
 	.num_nodes = ARRAY_SIZE(system_noc_nodes),
 	.bcms = system_noc_bcms,
-- 
2.43.0


