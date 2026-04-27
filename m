Return-Path: <linux-arm-msm+bounces-104572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GMLOqKz7mm8wwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:53:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CB946BC28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C2EA300D965
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 00:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7E92222A9;
	Mon, 27 Apr 2026 00:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PbrGbWbL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMFuny/I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8143119644B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251183; cv=none; b=Pvn3bfnvWyyM0UF02fmD+DBb2/Qx+fFHO0FtatmXuxWfBYDWFNTD8YUf0Mx+DQGq9vd/uoCZk7d4m96lHbpWxyE+GC9k7iPSRQA9a32PsAF57CgVqkSGlQwOQLYRWvAO+53RnWGQchvLeinZgU0cxobe8oyEbteKT+9rod5TNIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251183; c=relaxed/simple;
	bh=W21W00WdNPd7hVLGmTsWpexG3nKdXTn4uQpavl6fcMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioHsFs679cNLtPelJkLEnjGUaPms9vfY8FwbzGL77vcFJyh5IIftwIaxAQjUjD9UN60UvKTTIH6sKSVxFn1df7pvsQZTSr7RaneCrLoSgajh8uPHp/mOcFV0GVh5Sdj0xgxL1ofSgW23f8up0GgGtq4ocriIy0rhXmtnaljLHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PbrGbWbL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMFuny/I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMLHgT2750382
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C0wuxUvjpfq
	GGqQtmkibYN/vNESQHvxRn5wfp08z134=; b=PbrGbWbL88ub0y20O+3AiKGuPMB
	XDbvzDDC+GuZqudF8Jp36DfAqDN8iZmSrAmSY5u81kdL9VDNsWva/wmVZYFvK7mz
	27FsDka7mLFabDg1HvDQqqw3e1hxF11E40LDlzG6rVW0+B4mmRBKMukJZKTAHedJ
	liZKkjF+VAfRFJ6cnLZyTGl7w70W15oHTqz3hIKvKwsJXQa88qTacrNx6aHjq0ZM
	xDhDEaSoqhl0yyKofb0+wyTzIU12v631MVcEC3akyW+PvOCqw2GpS8uaifY/pvZ+
	FpL69NDAJCDaSjssZoiOuTk3Hjhx/JueN6h+SWZ9PT/TLaLiI6FaAF6axvA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxbvas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:53:01 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c726f4019so12583470c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 17:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251180; x=1777855980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0wuxUvjpfqGGqQtmkibYN/vNESQHvxRn5wfp08z134=;
        b=XMFuny/IRtoyRh5y38oMeSovh5N1O+VuOZugT7UhJwx9cma/dW5+jdxV2hnrYhBQEm
         bA7l/SQPAqR3ZQdt51KmXy2Viu4dzevlzkSjwH95MIehgVg4og1z5pT2igPxYghXM4uV
         9DOyZ5BGFB6HQM/bUjMcsLBSfzMl5GtDNjfcLAWfO17pg6zy5zJOWgt+sXpl0WKwkgxd
         apkPG2LoO76iMlJohrj4ZgFpzhAUhqYFJXBMoMj7i5KLernlPQDR0asUkymobiMRALt6
         N39/RO+IBYjFg+ze07mmt2llc0s5Gjj8JKwWCZ5JsLGJymXxndncitn/9Tpl2eCdj+BY
         IMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251180; x=1777855980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C0wuxUvjpfqGGqQtmkibYN/vNESQHvxRn5wfp08z134=;
        b=nZTjTWUX92jPYLU3CHH8Vi02xFr+uL6qNu1M2juBoEjUHZxmP4kzFDgfh6ctMLrrXx
         9hM3z2jETg765QU3o/oAfPay0ZKD9SqvgVVcutuBpdPlZRdRT1LlTHSS+qAwazRZ0sa8
         KFdfyHI8M/0VQp0mrYhxKCwnBEnzkXLAYAHShXKUVe7Y1srMH8XBsjT/exktvyQFjRok
         PynGy/OqFEkxbZ7SW+HuZO4ifc9ccjVfDyo17AQ3snhFLX3S+uPFJkIe9QSy5ctOQ3Wz
         hYw/6kAXoqIqYLETZt1W8uVNoa74UeK3TuVdF3MhTbn/tpoWCEy4bBXywiMKlixwTfAE
         VmLA==
X-Forwarded-Encrypted: i=1; AFNElJ/+vaiYNdzlkVsT07tber4MyQYxBqysqaPHUSrAhKjDc62SL64TN6J7DgV70I4oenxlRvcwKsxXPzDOO3En@vger.kernel.org
X-Gm-Message-State: AOJu0YyPMobXUjF5D52RchxzZdGY1AQo1SaD6HWKba1lgt6YAk80ofHh
	q/eujE53/zy+cE3sS9FpIXlk8q1N3ZMuaRzzJQaa5QfIrx/C8hu+puz8JY7YiCAlpMj2k9El6cd
	LmbOHmtk7ckOJmnxofN7mMrhQaVuY2l36ylCpz8t2ecTuVwOIwsJZxe2LoiEa/P63rjiJ
X-Gm-Gg: AeBDievWWQHo65LGW+B5hcnewSLY+5putApDh+yafpgNkY5CrUNEHTqRhIQuaBQ9G7X
	IS4PGwie/tniO5HyvqrgEKx1PBe0sC2neK8cBZjWn8Wp0zB32UA5aWmbuUe1lDACfygOGy7puH/
	HpyaUkQV3jI7QNJyLNT0VbxPbpxaIs7LOwByIkZOm27Pm0CCEUJc8PIw+Y+GMwL436OVOutZdwU
	259G+jaY0YvnEXp1F8J4ELb5GsnXcKejo045c4gcwZKE+Ouc9gP6hzx93deQL9OuGETGOmQv0hz
	bTIJ3VLNxFt5wHJrppEKHQqvG3JtpjK0pazINgvqhP/ydhPi3UrI7Ewx63Aj5fNC+lgJz9Fv7sI
	pNJJvIE4xDO/l9SFXH/y6LMpXHKPgEZ5JRo9JY8TdHmYWf3TwRqP0s6x77jlGQ88qO3RY+MsulH
	9+coY12IkrbpCPq6vN
X-Received: by 2002:a05:7022:b87:b0:128:d375:f1d4 with SMTP id a92af1059eb24-12c73f98f83mr20905390c88.28.1777251180312;
        Sun, 26 Apr 2026 17:53:00 -0700 (PDT)
X-Received: by 2002:a05:7022:b87:b0:128:d375:f1d4 with SMTP id a92af1059eb24-12c73f98f83mr20905380c88.28.1777251179792;
        Sun, 26 Apr 2026 17:52:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dca2c1c16sm11449051c88.5.2026.04.26.17.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:52:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP mailbox controller
Date: Mon, 27 Apr 2026 08:52:36 +0800
Message-ID: <20260427005236.230106-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4ZKBRB_QYbBUap4StZ-yCgWtFbbhSXFD
X-Proofpoint-ORIG-GUID: 4ZKBRB_QYbBUap4StZ-yCgWtFbbhSXFD
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69eeb36d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=OYxAFmqQ0AEWrUtYbScA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNiBTYWx0ZWRfX3ty81y9dai78
 4tZb9HMYR1EpGAX6kwaG4FeI3eOrWqYFVRWSVdF8RPvkEx/rr5j5JKpXekDETi8RgdgCLU+AS9F
 q/mS1No/kT9GuusDSTn9MY5FNRXBrrxQHH2gfQ0cX6VRCNhlbbpr6N8uktyPSaoP4YTp7vsWK/U
 AGPLdbtkpSD8PSLTauRPLEgj93b2IUs330nexSP7GnFa5S5/KdT+CoiYXKPDqQbk8za6dCPzPpH
 bIFLd4+3uCG4mkYmM0kDzWzTJyBdA264+LFFGvMxNROpGDBJMiGPZDO921oJncYxYMLuK27071z
 qH7kXXKRUBN5anDaYC8F6An+pdXxy6ZMDXyWHOp/W1QYPkmHUQxw86IA0YUEu23RIbqT5qM9fPE
 T59Rk+LCqmEXYbVDYedrdA2gL77PbeOavg0X/0mz3LdM34Qtc8Q1N3iOimkyhG4t3Gpv3+duNJt
 v1uF1eXKbWCFqWajf0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270006
X-Rspamd-Queue-Id: 67CB946BC28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104572-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

The Nord SoC CPUCP mailbox supports 16 IPC channels, compared to 3 on
x1e80100. The existing driver hardcodes the channel count via a
compile-time constant (APSS_CPUCP_IPC_CHAN_SUPPORTED), making it
impossible to support hardware with a different number of channels.

Introduce a qcom_cpucp_mbox_data per-hardware configuration struct that
carries the channel count, and retrieve it via of_device_get_match_data()
at probe time. Switch the channel array from a fixed-size member to a
dynamically allocated buffer sized from the hardware data. Update the
x1e80100 entry to supply its own data struct, and add a new Nord entry
with num_chans = 16.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/mailbox/qcom-cpucp-mbox.c | 35 ++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 44f4ed15f818..862e45e8fbd5 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#define APSS_CPUCP_IPC_CHAN_SUPPORTED		3
 #define APSS_CPUCP_MBOX_CMD_OFF			0x4
 
 /* Tx Registers */
@@ -26,6 +25,14 @@
 #define APSS_CPUCP_RX_MBOX_EN			0x4c00
 #define APSS_CPUCP_RX_MBOX_CMD_MASK		GENMASK_ULL(63, 0)
 
+/**
+ * struct qcom_cpucp_mbox_data - Per-hardware mailbox configuration data
+ * @num_chans:			Number of IPC channels supported by this hardware
+ */
+struct qcom_cpucp_mbox_data {
+	int num_chans;
+};
+
 /**
  * struct qcom_cpucp_mbox - Holder for the mailbox driver
  * @chans:			The mailbox channel
@@ -34,7 +41,7 @@
  * @rx_base:			Base address of the CPUCP rx registers
  */
 struct qcom_cpucp_mbox {
-	struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
+	struct mbox_chan *chans;
 	struct mbox_controller mbox;
 	void __iomem *tx_base;
 	void __iomem *rx_base;
@@ -53,7 +60,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
 
 	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
 
-	for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN_SUPPORTED) {
+	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
 		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
 		struct mbox_chan *chan = &cpucp->chans[i];
 		unsigned long flags;
@@ -112,15 +119,24 @@ static const struct mbox_chan_ops qcom_cpucp_mbox_chan_ops = {
 
 static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
 {
+	const struct qcom_cpucp_mbox_data *data;
 	struct device *dev = &pdev->dev;
 	struct qcom_cpucp_mbox *cpucp;
 	struct mbox_controller *mbox;
 	int irq, ret;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return dev_err_probe(dev, -EINVAL, "No match data found\n");
+
 	cpucp = devm_kzalloc(dev, sizeof(*cpucp), GFP_KERNEL);
 	if (!cpucp)
 		return -ENOMEM;
 
+	cpucp->chans = devm_kcalloc(dev, data->num_chans, sizeof(*cpucp->chans), GFP_KERNEL);
+	if (!cpucp->chans)
+		return -ENOMEM;
+
 	cpucp->rx_base = devm_of_iomap(dev, dev->of_node, 0, NULL);
 	if (IS_ERR(cpucp->rx_base))
 		return PTR_ERR(cpucp->rx_base);
@@ -146,7 +162,7 @@ static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
 
 	mbox = &cpucp->mbox;
 	mbox->dev = dev;
-	mbox->num_chans = APSS_CPUCP_IPC_CHAN_SUPPORTED;
+	mbox->num_chans = data->num_chans;
 	mbox->chans = cpucp->chans;
 	mbox->ops = &qcom_cpucp_mbox_chan_ops;
 
@@ -157,8 +173,17 @@ static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct qcom_cpucp_mbox_data qcom_x1e80100_mbox_data = {
+	.num_chans = 3,
+};
+
+static const struct qcom_cpucp_mbox_data qcom_nord_mbox_data = {
+	.num_chans = 16,
+};
+
 static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
-	{ .compatible = "qcom,x1e80100-cpucp-mbox" },
+	{ .compatible = "qcom,nord-cpucp-mbox", .data = &qcom_nord_mbox_data },
+	{ .compatible = "qcom,x1e80100-cpucp-mbox", .data = &qcom_x1e80100_mbox_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
-- 
2.43.0


