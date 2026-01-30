Return-Path: <linux-arm-msm+bounces-91273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPI4CRiMfGnvNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:46:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D730B97CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 889B230488D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BB63783CE;
	Fri, 30 Jan 2026 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0gfw2vE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6XZV881"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E08329B8D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769903; cv=none; b=RqMPnz4LKe/kQRjrCk5GbWcNz56wu+XvxiXdL20PplcxTpHfuRYICM/sO7/C95BXh/wTupd3NcjFKobGR7MBkvxb1LMkMtUid4dryqJ/8s7Ul7zj6qmJxaTvGS+gnOsTafZWCjQ0Dgl0MaeSPl42j/KkRCj8rFXFboQU0DIRgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769903; c=relaxed/simple;
	bh=mhi0ypVvTwkXgTPywGnN+5DdBGkkVxPMBnQ/6sopdVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FSgAAdILffgjRspL9tv7cxEh2Q+eUesAZWTG2fzKLyDE+WLZbVaTXSXKUPxwxeAPbBOmx45WjgMt7Z6zkh5RhkrOOwZv4qHGeYcDUhyEbiUzgDox4HF2ynfjhmALb17Adr5N8ffZK/NYZu7svXCrJvQDEb1wDajscGAnES+zeZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0gfw2vE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6XZV881; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U7Goae2419200
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxU1VPQmj/sT37QTIhQa/VeITSABn0pkgP2cxL7fA4s=; b=O0gfw2vEj3UCSkaf
	tp7fygSj1QMkrcTCQIpHfdAi9rzhEaThZ75iJO9BL9cGH2OhV3BntYpuFUrY/qWm
	AWHyMQrK+9K4M2wrNa0ZlTVeyLhMZ0JzOGwKBxfzvDc61F6ueyBwnwbkdYcQUSU4
	AqFbFPnvkN0w8pYd3QF54ALTaViyOq6Goo4/5gzdTiCYBmGHX4M19F9PPeagJNhz
	w9sBIO6nMUian1yZ2APOga6jFVoz/9b7BF7qr2EZwF9HmjLhzE3xhGiv+FneEQlb
	9MnYvWDS6UVuVnfFODh0ikzrzIhJ7jhIyci7doMDtbQZSnNJsAHxRtqh73Cmbf0E
	v7Tc6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0r41gmad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352c79abf36so1855727a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769897; x=1770374697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxU1VPQmj/sT37QTIhQa/VeITSABn0pkgP2cxL7fA4s=;
        b=W6XZV881PMJ8FBq40vV/fLhl+6chGXAJbWkrx2R/cN28O0Svsj1rSLiAgvwOkb7qo6
         XZLqX13/Oa5EN3brkwG694cKViKBz/NG1AfG2wGLAGB26C29nswXbHClA216j6ZJKgNb
         /5wsu8xpMiQD0HfD5NwUVbhieMDnHXhgIAIKvAOvIfDwb45GqjvBoT/5QAJ1xTWkVbCU
         kam005l726okupNwWsD+BIU0pJemxq0EFjVUunTyRj4kYUVA3F2CVaB8tns3atBtIj8C
         AGHwM9gu3EZKCadF6ctRxmK5V/mD6mgA2e5lk/GIu/Tkpnaj+cbMMFqcmNDjIySnTIWX
         iUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769897; x=1770374697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NxU1VPQmj/sT37QTIhQa/VeITSABn0pkgP2cxL7fA4s=;
        b=hDfA4/6Qs9OzfdMHQ1jJYu42nJ6bLc2xE+CsgYLU4sh6V1DAP8tlmoaDaHDER0Bzuv
         fa7O3Nnbk0A8/jtIXVelIy1aCx0dqF5KrlLZcvZXw1Ic54msftWm+2furoaxc000WjZF
         wjxlwfKUSX9PeYVQf9evtZQtwu12tCtucpKqnzoDUfcWhPc+EsQRGsThaIoZHOMAslrL
         HcnJ8VpoE94UikCurKHSEeWDQorgOz3TcXWV8YF1r+sbitgbz2fT+dNePCEZ9Tj/g4Zp
         b+gTwEM8tRgVm3gCQbr6wHcjVyA7fiP1dKFZ4Tis0mKbr/nEgnPCANE0nFm4sg5YIFUV
         fBeg==
X-Gm-Message-State: AOJu0YwUraiGSD304VUu2CJRowfFL6LeesAyThFT8reYliG09s5bNe41
	xwkIn2+5Ovg4JzEQYdCbgKZK9ywHmcaMi0bhoPuTVBh38jqUwkjo9E5/wt3TdXp6wylcAmkeCMp
	T73/+H8bGTsP9Oc4IJEYDfSH4ryUNI+JCi7Y1wcd1QlVrBUxLfL/ISaonqA2ywz6FQwHZ
X-Gm-Gg: AZuq6aJ5atZYngqxkHFhVJauh7fnN5+6h3Jg1pRs2YArrVbbAAq61GjJ0bJOwmYXu8W
	qoHVGb4me3cX9cat2kgRPl/69ysRAFhF52g23W5vAxuZEk6nKsDQtafEFCKCcGv7wyhS08dtW3P
	GQ0Kk2Am5kQAfBBIdWa1DG5A1Wl/Ug2NHsPcJED0+TQSH5O7gq7twaOTSCJT3uI3d8LUV8tSD8E
	4C+I0YBDb2kaD0JxZyqZMC5uVBext4QmRw/wJSJ1f+BjOZY5Q/SZ2y3Vujakrjo1CdjYn3P45bR
	wJ0Ah7Z9JBhtxY5EnqeyPJURSFxyM1zh7W74cYn2jLGHaisn8EAl4n+FOukCiWPv03hVEVq1cEM
	cJmVMqlfpG3tHttiR6mYIPR7mdi/wC8tfwYRPy3DNqwZNnT1CahA9gQqiRG1bw3uxokSlr/yNTG
	rvTm/vc/nCOYxwz/f1CQFV14TNLsK6G2WWQtyVBC/ZInVY
X-Received: by 2002:a17:902:d4c8:b0:29f:2ec4:83e5 with SMTP id d9443c01a7336-2a8d9594d22mr20622065ad.12.1769769896500;
        Fri, 30 Jan 2026 02:44:56 -0800 (PST)
X-Received: by 2002:a17:902:d4c8:b0:29f:2ec4:83e5 with SMTP id d9443c01a7336-2a8d9594d22mr20621875ad.12.1769769895947;
        Fri, 30 Jan 2026 02:44:55 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm71231465ad.69.2026.01.30.02.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:44:55 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 16:14:33 +0530
Subject: [PATCH v6 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-wdt_reset_reason-v6-4-417ab789cd97@oss.qualcomm.com>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
In-Reply-To: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769769874; l=4107;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=mhi0ypVvTwkXgTPywGnN+5DdBGkkVxPMBnQ/6sopdVs=;
 b=tfzANnApupJpzTGirf7jVWsxryfSISOhUf+sDTuUssKxFECsN8ATjkWjoJyZd/OewOf6NkNVR
 7MkaUFHyHANANZwftMx+8h8Cm4QYz9HD6XbOVHqtCHoMZRQekxb319u
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: d4thGX51-t13LnBIiy11qKdNZzh5NXD-
X-Authority-Analysis: v=2.4 cv=W541lBWk c=1 sm=1 tr=0 ts=697c8ba9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tIxvoA3mxl7b6XSbyz0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: d4thGX51-t13LnBIiy11qKdNZzh5NXD-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfXxlchd7nudfdM
 WWe80d0Vgp5rEWjHNQGEanzNV62NF91TFCTkx3aR9fdxTsVZt1llhbjad3OFaUZbl3orKscldWu
 C47XIh30uRPQz0mvQsT9RdUOiC2dn1sYx1MJXXdfBqOVWVzDQGTUwBcp0qTn9jNbufg7sTsaOBr
 FvUmvR1PsjmHWv7/g4ly00kJEziJx+No38A4erfqcwDlJCqQs8+38qjbynfMjXB2uT70DE35eKS
 CoKpRUKyCvqnn5wPR2lY4weYq3+fe44SXukpnCEPk50OMRP2CXNrAUhglCw4pKx269BYnP0oYat
 IP3AII6ASN35hq4vLM4wC8Dyxzm3/9ktcQU0JWceXtFSkUkjWJ2VTXhr53zGOdkn5x66VGVWZPD
 9g0JCUMA1ySyMs6odfErpEwifnxGffRjfRKfHqpfPhg8wz40rP5kagWkIk7waKvWpPbaRnbORjI
 FAYlLk5tGCniPezAKCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91273-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D730B97CB
X-Rspamd-Action: no action

When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
in the WDT_STS register is cleared. To identify if the system was
restarted due to WDT expiry, XBL update the information in the IMEM region.
Update the driver to read the restart reason from IMEM and populate the
bootstatus accordingly.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
function qcom_wdt_get_bootstatus() to read the restart reason from
IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v6:
	- Reworked to get the restart reason code from SRAM region

Changes in v5:
	- Use dev_err_probe instead of dev_err

Changes in v4:
	- Kept only WDIOF_CARDRESET and dropped other codes
	- Renamed qcom_wdt_get_reason_reason() to
	  qcom_wdt_get_bootstatus()
	- Moved the existing check inside qcom_wdt_get_bootstatus()
	- Dropped the device data and put all the details in the DT node

Changes in v3:
	- Split the introduction of device data into separate patch
	- s/bootloaders/XBL - for clarity of which bootloader is
	  involved
	- Mention the sysfs path on to extract this information
	- s/compatible/imem_compatible in the device data structure to
	  avoid the confusion / better naming

Changes in v2:
	- Use the syscon API to access the IMEM region
	- Handle the error cases returned by qcom_wdt_get_restart_reason
	- Define device specific data to retrieve the IMEM compatible,
	  offset and the value for non secure WDT, which allows to
	  extend the support for other SoCs
---
 drivers/watchdog/qcom-wdt.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index dfaac5995c84c1f377023e6e62770c5548528a4c..14853162d57ccae3092fb1c01616fdfca0108e74 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
@@ -42,6 +43,7 @@ struct qcom_wdt_match_data {
 	const u32 *offset;
 	bool pretimeout;
 	u32 max_tick_count;
+	u32 wdt_reason_val;
 };
 
 struct qcom_wdt {
@@ -185,6 +187,7 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
 	.offset = reg_offset_data_kpss,
 	.pretimeout = true,
 	.max_tick_count = 0xFFFFFU,
+	.wdt_reason_val = 5,
 };
 
 static const struct qcom_wdt_match_data match_data_kpss = {
@@ -193,6 +196,41 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 	.max_tick_count = 0xFFFFFU,
 };
 
+static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
+				   u32 val)
+{
+	struct device_node *imem;
+	struct resource res;
+	void __iomem *addr;
+	int ret;
+
+	imem = of_parse_phandle(dev->of_node, "sram", 0);
+	if (!imem) {
+
+		/* Fallback to the existing check */
+		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+		return 0;
+	}
+
+	ret = of_address_to_resource(imem, 0, &res);
+	of_node_put(imem);
+	if (ret)
+		return ret;
+
+	addr = ioremap(res.start, resource_size(&res));
+	if (!addr)
+		return -ENOMEM;
+
+	if (readl(addr) == val)
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	iounmap(addr);
+
+	return 0;
+}
+
 static int qcom_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -273,8 +311,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.parent = dev;
 	wdt->layout = data->offset;
 
-	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	ret = qcom_wdt_get_bootstatus(dev, wdt, data->wdt_reason_val);
+	if (ret)
+		return ret;
 
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second

-- 
2.34.1


