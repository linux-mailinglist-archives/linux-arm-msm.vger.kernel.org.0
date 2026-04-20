Return-Path: <linux-arm-msm+bounces-103681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IL7F2jZ5WlvogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:44:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B18427DE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A87E8300A8D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A7D3859FC;
	Mon, 20 Apr 2026 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cY7ZsgQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBGu+OHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFD238553F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670980; cv=none; b=nW5W93sdbsvuBuXA+SFwse5VGoFzIqAUrN5f5VQVLsKNGfvDgIaoEGks6Cl0+kaPMdMuX8yuqx5pDFQKGQrawgV+nmFaUpkbGbF8eGfs8twNG2h/Mi06KNoz+d1eFXsM3c3qnY3KVlDf2zqJDJ7qC0V7vJg9ZHre9BQXr8z0zDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670980; c=relaxed/simple;
	bh=8TZSAgGn0ST4uwQenr8bMUEmLD2tllnMMegjYZ08myg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAXceVdEXHrDscV7Qm7g9HByBrdZHbXQeHcdjoV2O1r899a/AUAbNvsEMrant2FwmKUU7c53PvjXEigg3ktCzWvE2v2i4e9PRhH3ICYkuRQCqgtLiTRTsYtrkQ0oqfxcw/apkrASeIUO/AMyp5HRQE1xkDZlhd80iz0aPhLIsnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cY7ZsgQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBGu+OHr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7WrR41398993
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHb1dUo9TygTE3Q2B7zk071fFb8iK4/RDkiODdvYkgY=; b=cY7ZsgQg7N9iGn79
	DzCZZt0ozwl5dlfSxa4b5nniPlVcfexDCLmVkS3XcAzwd2B7/U8FiaUS04jkYulr
	HohZqpqfsX50yinkOwn9umUuJUuAXfeEvhxtoCJRTtEGecpCYfsOpTDpQUl/i64v
	vMHOEJeF9N20c9ZzAYzo8jzsqxePGvvtBcaRx0GKdCU3tXmONrrpdn+t0tRTMxIP
	G0TugmtzlM61Jg0g8kCJW1DSPScIWtw8ubBgdk2o8QaWqocNGACwviJ0D/1rOqpP
	+5mBtYE8mVmMaMabZtRrij17POhCYMSLtPEingIhCMXm8sG2vctqlsej+HJXg8PF
	jLTF5A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34hcn61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so3388259eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670977; x=1777275777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHb1dUo9TygTE3Q2B7zk071fFb8iK4/RDkiODdvYkgY=;
        b=BBGu+OHrG5TYM0Q7X1vP9Dx4FMqh4a6J1upObFfbu1SAro1XAE4GPkHfBqTFkX1br4
         MCu4jrVARJFnuW14EKE0N+czzi5UkscVLNrsYFwNsF8eMcmkqp8wvch4mk5e2lnXejkW
         4QrkK4zfV/aCr1SLoujGPgsjutp7vVmIlAGbVo8/7UUHhNWj5M+JWt/15cLoGFnMteBD
         r4UL9lEekWGerFFr+bkFgdLoJpA+uKZfGzUDS/kiG5CtHZ1iL/T1kXmoPpjQsPJM/AS+
         xtZXqq0dQaCll3QZ5MWEBCn/2v8K6/U5slerqOlCKFPW6NnEPjudZjNsKKxrzgu6A2Yk
         DaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670977; x=1777275777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kHb1dUo9TygTE3Q2B7zk071fFb8iK4/RDkiODdvYkgY=;
        b=cWsRBzR84vjuZa/y6LJUe2ca0kdqdZWjWLEf798xqgfPzVj6J9UOndzxtf3mr9ldmJ
         zNiDEmrGp3JxeJ6ieQXppg1KRVbSvbB7k1N75wFOOskrSymgv+Ll40sZWSwk/VisuOmZ
         ZzAl8+WgX7paj+FFHD/PXNUQc4LG60MI4d2te1FXyVmtHbLjBXOej7aKI3TAiB4MLyUc
         kimVJretDSs8ZQEXVkTxqwcg6gfjgXq8iOVggoehIMVUNEHhXPV8Q6ulKZlg/b8UMRka
         cv/uaa+CYs+ac0BQ0WJpCmyMjDYvDg+mv6LRgeuS3DB8IFnaK1sANwOApRvLk9GhzClM
         koIw==
X-Gm-Message-State: AOJu0Yy1o/nAl48vHpzlPfqNkSd441BcSqE+vxg/on5D9Zg2Ud7S3PaI
	nqcixz0LMpTQ90OHafXKbQ/ZwT86b+BY6HsEs/y1g5IPBawmOSSZYj0Z2j86Y44LHdR6r+xXDKw
	ICZlnjLN1iAqxSBMF2biTOmEjDvgGIY++Nhwg3lxHREWuCfNs/aSz+pktFLk8m162VpBN
X-Gm-Gg: AeBDieuNEjw3DLV5OZS8xABq68x6tLLIZ+gWsM+qvtOOyCVQeq2kwdntXCui+WAtLfk
	A9pP0QQ9SBG3Yg1LpKVl/cL71PeY+CUVEWfl8hB6pltgN+lSIOntPZ0rXlT13x29rJJSs+qoo2W
	PoaIMVCmuaeVEChBOUsPObGVKyX5sIJGEn5nyFOgvj/RwDLk44Aq4E+SDq8PS3pZLIu8f5gCWjx
	AexRZI5NnAD9pu1slUFwWKL0/8yUCP3NZuwJcyoJ243uUgWl0oIjkqfMZ2oWpLwP+0AspDCRJKx
	7ipcl4VFHoh8lLSPaXL3HPF4jXSkTnQ9dzp93GeVxUb56Is3XQPhxZsdAvjA+X2sV/wzxNQCPfm
	fwe4u++U3Va2mKZ4KlW/RmgkSzMAk7arwxI8/S74Pys94NHMDzkB5rMk1pP7mTOimSrgta0jmGZ
	ZboNQ=
X-Received: by 2002:a05:7022:6b96:b0:12c:3d3c:ac08 with SMTP id a92af1059eb24-12c73f6d728mr5893627c88.4.1776670976989;
        Mon, 20 Apr 2026 00:42:56 -0700 (PDT)
X-Received: by 2002:a05:7022:6b96:b0:12c:3d3c:ac08 with SMTP id a92af1059eb24-12c73f6d728mr5893609c88.4.1776670976427;
        Mon, 20 Apr 2026 00:42:56 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19866217c88.10.2026.04.20.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:56 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 00:42:53 -0700
Subject: [PATCH v2 2/4] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-vote_qref_in_tcsrcc-v2-2-589a23ae640a@oss.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
In-Reply-To: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776670973; l=9136;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=8TZSAgGn0ST4uwQenr8bMUEmLD2tllnMMegjYZ08myg=;
 b=dizq03G9Lv+4mTKloW/2hhrzL9SUvdpeRG8vcbr6vxzQIRpYbVuW83qXUgUaFBbENArHdliy4
 LZQ56yxIwr0AKMj3b0HspPGsjk4aT2p8qOJ9U5gK6X6qblJ0SKZ8v/x
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e5d901 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: XwE0-Ele8ELNUTeNGGaSsCjxWtYUOQUZ
X-Proofpoint-ORIG-GUID: XwE0-Ele8ELNUTeNGGaSsCjxWtYUOQUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NCBTYWx0ZWRfX0i4y5D3Wfxth
 Rk5E5WfX2N67TGuqn/ZtG52c3gg5B5v/SoubPSWUMKEG+HtOt1b/iRSLuGJi3vtE+nsmW+a5pak
 TvLkuHrxrQnX0JmhQ3KeOnpE6KFi8EKYBpE5fmOrgD5+lnR2y0O/YMFxtIFiDkWbSbpbDwSc30x
 nUzMzq80VnPqk8QcnAF+eliVkWN1Jxel2WWDrK1zE2y48KaOIpG1lTqstkvhi2pfx8LKijsT/o7
 Z6n2ZgXQJ4LHap/bU+oELPvW+zy1nC6EGB4SF8Nfkq1z4fySZKSCCKcV5XnVTemHM2LjkMw56kH
 QUhpXx2JVs0KX8g2U5DNQyFq50O83HeuBzz77+BnW5CO6Zpa3efrKrqkLZjnExLqKduo2D0bQLS
 UyAtvh20y1QD+esKmmrV19R5O5mcOpRTW0NSBvqW8Q1KoZ4ba4O5263iPMcbDMKxrEq2VGjWWlB
 6uGBsZuwVIOOn15qS6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103681-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09B18427DE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
register controls whether refclk is gated through to the PHY side.

These clkref controls are different from typical GCC branch clocks:
- only a single enable bit is present, without branch-style config bits
- regulators must be voted before enable and unvoted after disable

Model this as a dedicated clk_ref clock type with custom clk_ops instead
of reusing struct clk_branch semantics.

Also provide a common registration/probe API so the same clkref model
can be reused regardless of where clkref_en registers are placed, e.g.
TCSR on glymur and TLMM on SM8750.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/Makefile  |   1 +
 drivers/clk/qcom/clk-ref.c | 202 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/qcom.h   |  69 ++++++++++++++++
 3 files changed, 272 insertions(+)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 89d07c35e4d9..1659e9d9afa9 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -8,6 +8,7 @@ clk-qcom-y += clk-pll.o
 clk-qcom-y += clk-rcg.o
 clk-qcom-y += clk-rcg2.o
 clk-qcom-y += clk-branch.o
+clk-qcom-y += clk-ref.o
 clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += clk-regmap-mux-div.o
diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
new file mode 100644
index 000000000000..ea2ed03460f2
--- /dev/null
+++ b/drivers/clk/qcom/clk-ref.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#define QCOM_CLK_REF_EN_MASK BIT(0)
+
+struct qcom_clk_ref_provider {
+	struct qcom_clk_ref *refs;
+	size_t num_refs;
+};
+
+static inline struct qcom_clk_ref *to_qcom_clk_ref(struct clk_hw *hw)
+{
+	return container_of(hw, struct qcom_clk_ref, hw);
+}
+
+static const struct clk_parent_data qcom_clk_ref_parent_data = {
+	.index = 0,
+};
+
+static int qcom_clk_ref_prepare(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	int ret;
+
+	if (!rclk->desc.num_regulators)
+		return 0;
+
+	ret = regulator_bulk_enable(rclk->desc.num_regulators, rclk->regulators);
+	if (ret)
+		pr_err("Failed to enable regulators for %s: %d\n",
+		       clk_hw_get_name(hw), ret);
+
+	return ret;
+}
+
+static void qcom_clk_ref_unprepare(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+
+	if (rclk->desc.num_regulators)
+		regulator_bulk_disable(rclk->desc.num_regulators, rclk->regulators);
+}
+
+static int qcom_clk_ref_enable(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	int ret;
+
+	ret = regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK,
+				 QCOM_CLK_REF_EN_MASK);
+	if (ret)
+		return ret;
+
+	udelay(10);
+
+	return 0;
+}
+
+static void qcom_clk_ref_disable(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+
+	regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK, 0);
+	udelay(10);
+}
+
+static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
+	if (ret)
+		return ret;
+
+	return !!(val & QCOM_CLK_REF_EN_MASK);
+}
+
+static const struct clk_ops qcom_clk_ref_ops = {
+	.prepare = qcom_clk_ref_prepare,
+	.unprepare = qcom_clk_ref_unprepare,
+	.enable = qcom_clk_ref_enable,
+	.disable = qcom_clk_ref_disable,
+	.is_enabled = qcom_clk_ref_is_enabled,
+};
+
+static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
+				 struct qcom_clk_ref *clk_refs,
+				 const struct qcom_clk_ref_desc *descs,
+				 size_t num_clk_refs)
+{
+	const struct qcom_clk_ref_desc *desc;
+	struct qcom_clk_ref *clk_ref;
+	size_t clk_idx;
+	unsigned int i;
+	int ret;
+
+	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
+		clk_ref = &clk_refs[clk_idx];
+		desc = &descs[clk_idx];
+
+		if (!desc->name)
+			return -EINVAL;
+
+		clk_ref->regmap = regmap;
+		clk_ref->desc = *desc;
+
+		if (clk_ref->desc.num_regulators) {
+			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
+							   sizeof(*clk_ref->regulators),
+							   GFP_KERNEL);
+			if (!clk_ref->regulators)
+				return -ENOMEM;
+
+			for (i = 0; i < clk_ref->desc.num_regulators; i++)
+				clk_ref->regulators[i].supply =
+					clk_ref->desc.regulator_names[i];
+
+			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
+						      clk_ref->regulators);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Failed to get regulators for %s\n",
+						     clk_ref->desc.name);
+		}
+
+		clk_ref->init_data.name = clk_ref->desc.name;
+		clk_ref->init_data.parent_data = &qcom_clk_ref_parent_data;
+		clk_ref->init_data.num_parents = 1;
+		clk_ref->init_data.ops = &qcom_clk_ref_ops;
+		clk_ref->hw.init = &clk_ref->init_data;
+
+		ret = devm_clk_hw_register(dev, &clk_ref->hw);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct qcom_clk_ref_provider *provider = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= provider->num_refs)
+		return ERR_PTR(-EINVAL);
+
+	return &provider->refs[idx].hw;
+}
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc *descs,
+		       size_t num_clk_refs)
+{
+	struct qcom_clk_ref_provider *provider;
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
+				      GFP_KERNEL);
+	if (!provider->refs)
+		return -ENOMEM;
+
+	provider->num_refs = num_clk_refs;
+
+	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
+				    provider->num_refs);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
+}
+EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
new file mode 100644
index 000000000000..09e2e3178cfb
--- /dev/null
+++ b/include/linux/clk/qcom.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __LINUX_CLK_QCOM_H
+#define __LINUX_CLK_QCOM_H
+
+#include <linux/clk-provider.h>
+#include <linux/errno.h>
+#include <linux/kconfig.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+struct device;
+struct platform_device;
+struct regulator_bulk_data;
+
+/**
+ * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
+ * @name: clock name exposed to the common clock framework
+ * @offset: clkref_en register offset from the block base
+ * @regulator_names: optional supply names enabled while preparing the clock
+ * @num_regulators: number of entries in @regulator_names
+ */
+struct qcom_clk_ref_desc {
+	const char *name;
+	u32 offset;
+	const char * const *regulator_names;
+	unsigned int num_regulators;
+};
+
+/**
+ * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
+ * @hw: common clock framework hardware clock handle
+ * @init_data: common clock framework registration data
+ * @regmap: register map backing the clkref_en register
+ * @desc: clock descriptor copied at registration time
+ * @regulators: optional bulk regulator handles for @desc.regulator_names
+ */
+struct qcom_clk_ref {
+	struct clk_hw hw;
+	struct clk_init_data init_data;
+	struct regmap *regmap;
+	struct qcom_clk_ref_desc desc;
+	struct regulator_bulk_data *regulators;
+};
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc *descs,
+		       size_t num_clk_refs);
+
+#else
+
+static inline int
+qcom_clk_ref_probe(struct platform_device *pdev,
+		   const struct regmap_config *config,
+		   const struct qcom_clk_ref_desc *descs,
+		   size_t num_clk_refs)
+{
+	return -EOPNOTSUPP;
+}
+
+#endif
+
+#endif

-- 
2.34.1


