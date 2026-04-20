Return-Path: <linux-arm-msm+bounces-103811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJOlBApW5mkDuwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:36:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2642FB2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B3553066742
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA20E34CFC2;
	Mon, 20 Apr 2026 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgsBJ3I0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ps6Kzzaj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F834F483
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702613; cv=none; b=kcSSntyHTbZzddg+Qkm+MlhAdeT2ZalLLqJGYEAODKgIxBJUPca2UtNzTbZdcNM0Et5j7gia8V6mQ9L0blme6sYJjnUQ68wKQRYDszTadgKUcsAkQDSSUolI2rmhlWs6RkvSiJzGgJjVWg/AupvHvavfdMhwSeAUNCyd+9/Ldbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702613; c=relaxed/simple;
	bh=vaoo9ECmLXGGj1eX26QNfYzvPmzHSDFTBD699vbQ4Xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZUqBfQwKrVR4RuUOwS5M/x3naMUVEc50buTM3nR7RDU5GQL27jf3G7Zz3c8OAcnqMe7HMjLIXd+lngATSTGcPXu34JKO9FBq8mGZraKmbitXu3hmP5ogfTyfZu906dDJ50oQ58mI2TgWMh3vIJV4SNZduqXGcTLHDkY9Es6cJqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgsBJ3I0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ps6Kzzaj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBId0m1599247
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/fqtJNes2BS0feZ7MEJqvV0mddNisAP3ugFp3h/hW0=; b=MgsBJ3I0IagJfQx5
	QU8WDZ4v6UNziDUwcgOenN3dA+pQFndLeza3YoFNqz34LOEVrX1gvkHbrn0CRHjU
	TcJkn7CyZat6X1iLeqnyIfxjyPacWY+b1lb6JK+hNpAM0YjlBL9MNM7GtUtn3jt9
	hF+kV2hXBwL4Jq3vCvRSYCW5FBrtNmGr8jG9xQcE6dVqjELqFUPbgESzsc24EHUr
	0B3azc/H3GNmCmbYBwv8zQCVAlz7mNOpNaBnaZjrT7W5gtUTfuaovL2vFfnwrUvv
	fIJy1wFLAV1MXLTwE8J96bTt0BKuXWbD7MZIQH0RByuVN9HsSDFcbO7bROAYnRAg
	BFEKkA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnjbm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so2160688b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702608; x=1777307408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/fqtJNes2BS0feZ7MEJqvV0mddNisAP3ugFp3h/hW0=;
        b=Ps6Kzzajrp/4vgC7n8aPwAFZNNAdP6a3k9paXjils/jhBRqr0qKWvQvwMboOcG0Bwk
         fmw3+28uxjIickxG7wX1UZ3t34rR6YpYZi6XtEYEg3e/jBtcFM0XqBqlB2Be2GurMjHP
         r+7EyDtnvZJaQDKQ9G43Cf/E9JYNMiJjPFHZ6TY+wK68S1WvnYRKBLOwP6syNzn8Ocqq
         l/SgPdo5gV6ViOWsz82iREEHUBLrCRb8IQw0MU2QsrTjOG45b+FJQHS9RLMZjGEmU07c
         qWHu85xbdVaGR3m3+DG20HLOjer19REjphR5w1E9niejv8Q0VoqFw4rpbHZfnlaJsZve
         R0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702608; x=1777307408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/fqtJNes2BS0feZ7MEJqvV0mddNisAP3ugFp3h/hW0=;
        b=KXQeohzdNPSxUq/C+VWvOwMd+Ix0BW9sd25g0uhOnXpb7anqTpWJDMqU5TMMGSPvEt
         2rRukjnzwbbTLtJmmGAtD7jlhaB4jiIiYqlvXRGArgGJ1RCIn2yeSGqPDwJRNpQrSv3U
         gyhI59h0vgU13x09mY7DmfYQhlBOlGEuQ8RJoyr20pUnxnXZYQBrIQDjeqzn573JIHmh
         Fusj5x8FtUuddPZsyAq1cQQCJXmqsnnmbTJWuojnX2ARA0Tb7uSbGqLjkSZndw0o8Eyr
         XT6KO65S1s6zRj91sYgDGEJ2kBzjBLj1HAdxwgqW6hQPLQO/0XRCaaTSZEcOxjdeX/qL
         4ADQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jEN2KqahoThkpziB31WB4bMO3L7o1vyznR5NaDFVUm4eue2Pl/nFzdJkZF60k4tw4WRnXdPY55LbI2hte@vger.kernel.org
X-Gm-Message-State: AOJu0YztUT1/ZX9Gm8tM9coLcB/Lyl7ay6RhvDmvsAC95PDWOAfk7xn4
	f3GBh6E95qwgwQziKPznMLF+hDmAB8OKBGdNjmz2wxfNZEI5oqUsBY4TiGDKqT4izWEdd7i6Oca
	/t7054mn/AL1rkwwh9Mzupak12DZABQG+dK/D7U2QbP+XXD/5kvariI87xIUBG87hefhQ
X-Gm-Gg: AeBDieuwgBabg6D3xVAdoyPXjYtUrOfOZR20M2ikEzy5DbjbD3zID7o2/r5IrSSCMYk
	eRRZ5w3o6zJtC+3dV6JmAWzn+RLCBMHrqamv5b7CjZkuic7O41mgmGOXXiZv9nO9mipW/CSyWkj
	cUzX0ZcJXv3JLblJmEunsBkUIztgu4Wi0HS1VVCmONvB30IibwZ2L1AuRGXX/WgtVD95aj7kRbK
	EmCaYmhYNIa3j3vAR6ZxwH4Zi9ctx22oCbPUaaJYjZiNQyu/L055rPY8v8hxL6nk4mPQ0DD792H
	i7KSVgkaa3uflyxGXM7VwER9JKbeaEZmiDmogeQoCXVLByYKWmd6Vzex407Gck3NX7cR+evp6kj
	NW/YqtiP//KTmkgjtmTD1eR4Lp0o0P+qLN6Ie4QHVfj4wghnP4xaXLQedqs8TNZg=
X-Received: by 2002:a05:6a00:2993:b0:82a:6461:6d1e with SMTP id d2e1a72fcca58-82f8c92a5fbmr13447849b3a.46.1776702606861;
        Mon, 20 Apr 2026 09:30:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2993:b0:82a:6461:6d1e with SMTP id d2e1a72fcca58-82f8c92a5fbmr13447774b3a.46.1776702605917;
        Mon, 20 Apr 2026 09:30:05 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:04 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:57 +0530
Subject: [PATCH 04/13] soc: qcom: Introduce CESTA resource manager driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-4-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: l2Zg6vADHBYZZlllFsK2niScq4lDKfE8
X-Proofpoint-GUID: l2Zg6vADHBYZZlllFsK2niScq4lDKfE8
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e65490 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IVrhhqL9AMC4baiPyD4A:9 a=LiQtAYNERXlbN33A:21
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfXyw+wQKQh4rFf
 hUL3G/cqe2Lw0byhY/0bxol1a34hHNvrFy5sIQqGwrIJ5g392evTa8QvY/XOkbrkfDv7XHRZ+sg
 PBRqO32TgPhpaEvSmfAGQucd1pJwZmYZG2FqF/3H17af7dcNDLZbn3IE4zmsXorPGRDMILj8n3X
 6ollYANz1U9X2fmGiZgjc+G4h0/P/kaWTeXqswMGVMGZdk9Q+jGKlmhnCWk8A+iSlYKK3/qTLm9
 SkFHWLXXqioP97CRXc90Whms5YQUiH8bVAG7QeZN3pea7SUr05HIk1l1vxsz3rnrxAGde73GjIN
 yELWbRgxbYVKypXHiWsNNbTBktYutwLJJ2cFkrsv0/xRaBzw0DTLS/YkV0EJu8rF07zYBwFbrHv
 HrFRRflXwEBqjvs6L3D/LrLYAMvHrVXU6IGa/M49Tvop20ToZyY29jZ005ftugIf8H5DxfSL6fp
 XJGU0NZxzTTzHb/bBrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103811-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94C2642FB2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

Add driver for QCOM SoC that have hardware based resource management.

The hardware IP known as CESTA (Client State Aggregation) have different
Resource Manager (CESTA Resource Manager) or CRM.

CRM can be of 4 different types,
  - CRMC is CRM for clocks local to subsystem
  - CRMB is CRM for bandwidth votes local to subsystem
  - CRMB_PT is pass through CRM for bandwidth votes global to subsystem
  - CRMV is CRM for voltage rail / LDO requirements global to subsystem

A set of SW DRVs (Direct Resource Voters) can vote to all/subset of
CRMC/CRMB/CRMB_PT which then takes care of the respective resource voting.
There is no direct voter on CRMV, rather the CRMC votes picks up the
respective voltage from LUTs and scales the voltage accordingly required
for clocks or bandwidth votes.

Some important aspects of the CRM communication -
 - Resource votes can be placed in the form of performance operating
   levels or bandwidth votes for local/global NoCs
 - SW DRVs vote can be of the Active / Sleep / Wake type
 - All the resource votes are in the form of CESTA command
   (resource id, value) pair.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig     |  10 +
 drivers/soc/qcom/Makefile    |   2 +
 drivers/soc/qcom/crm.c       | 996 +++++++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/trace-crm.h | 111 +++++
 include/soc/qcom/crm.h       |  72 ++++
 5 files changed, 1191 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf8307ff94f5afbdd1481e5e5e291749f..50f6c3cbf12f87ca2bab183e7996dba7312b9f58 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -26,6 +26,16 @@ config QCOM_COMMAND_DB
 	  resource on a RPM-hardened platform must use this database to get
 	  SoC specific identifier and information for the shared resources.
 
+config QCOM_CRM
+	tristate "Qualcomm Technologies, Inc. (QTI) CESTA Resource Manager (CRM) driver"
+	depends on QCOM_RPMH && (ARCH_QCOM || COMPILE_TEST)
+	help
+	  Support for communication with the hardened-CRM blocks in
+	  Qualcomm Technologies, Inc. (QTI) SoCs. CRM provides interface
+	  to vote desired power state of resources local or global to a subsystem.
+	  A set of hardware components aggregate requests for these resources and
+	  help apply the aggregated power state on the resource.
+
 config QCOM_GENI_SE
 	tristate "QCOM GENI Serial Engine Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index b7f1d2a5736748b8772c090fd24462fa91f321c6..7f465e86c1b8a4c2657870783a22acc4315a7407 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -1,9 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
+CFLAGS_crm.o := -I$(src)
 CFLAGS_rpmh-rsc.o := -I$(src)
 CFLAGS_qcom_aoss.o := -I$(src)
 obj-$(CONFIG_QCOM_AOSS_QMP) +=	qcom_aoss.o
 obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
 obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
+obj-$(CONFIG_QCOM_CRM)	+= crm.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
diff --git a/drivers/soc/qcom/crm.c b/drivers/soc/qcom/crm.c
new file mode 100644
index 0000000000000000000000000000000000000000..9fc4460a65f7f0b4cc262da48f49b769db434082
--- /dev/null
+++ b/drivers/soc/qcom/crm.c
@@ -0,0 +1,996 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/wait.h>
+
+#include <soc/qcom/crm.h>
+
+#define CREATE_TRACE_POINTS
+#include "trace-crm.h"
+
+#undef field_get
+#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
+
+#define MAX_NAME_LENGTH			20
+
+/* Applicable for SW DRVs BW Registers */
+#define PERF_OL_VALUE_BITS		0x7
+
+/* Applicable for SW DRVs BW Registers */
+#define BW_VOTE_VALID			BIT(29)
+/* Applicable only for SW DRVs BW PT Registers */
+#define BW_PT_VOTE_VALID		BIT(29)
+#define BW_PT_VOTE_TRIGGER		BIT(0)
+/* Applicable only for SW DRVs BW Registers */
+#define BW_VOTE_RESP_REQ		BIT(31)
+
+/* Set 1 to Enable IRQ for each VCD */
+#define IRQ_ENABLE_BIT			BIT(0)
+#define IRQ_CLEAR_BIT			BIT(0)
+
+/* SW DRV has ACTIVE, SLEEP and WAKE PWR STATES */
+
+#define MAX_SW_DRV_PWR_STATES		3
+/* Time out for ACTIVE Only PWR STATE completion IRQ */
+#define CRM_TIMEOUT_MS			msecs_to_jiffies(10000)
+
+/*
+ * Here's a high level overview of CESTA - Client State Aggregation
+ *
+ * - CESTA resource manager (CRM) is used for client side resource management.
+ *   These local resources can be clocks or NoCs. A vote can be placed by DRVs
+ *   (Direct Resource Voters) which can be either SW DRV or HW DRV.
+ *
+ * - Current driver supports placing votes via SW DRVs.
+ *
+ * - A resource vote can be placed by voting to VCD (Virtual Clock Domain) or
+ *   Node (ND).
+ *   Vote can be in the form of
+ *   (1) performance operating level votes - Local clocks scaling
+ *   (2) bandwidth votes - Local NoCs scaling (Camera / Display NoC)
+ *   (3) bandwidth pass through votes - Global resource scaling (DDR)
+ *   Not all CRM can vote via all three forms
+ *
+ * - The base crm address is the DRV base of a register space that is used to place votes.
+ *   Each VCD/ND/PT_ND has IRQ Status/Clear/Enable registers.
+ *
+ * - The config crm address is used to find overall configuration of the hardware including
+ *   version, num_perf_ol_vcds, num_nds and num_nds_pt and no. of SW DRVs.
+ *
+ * Here's a picture:
+ *
+ *  +--------------------------------------------------------+
+ *  | CRM                                                    |
+ *  |                                                        |
+ *  | +----------------------------------------------------+ |
+ *  | | SW DRV0                                            | |
+ *  | |                                                    | |
+ *  | | +--------------------------------------------- --+ | |
+ *  | | | PERF OL VCDs                                   | | |
+ *  | | | +--------------------------------------------+ | | |
+ *  | | | |VCD 0      |VCD 1      |....num_perf_ol_vcds| | | |
+ *  | | | |-----------|--------------------------------| | | |
+ *  | | | |IRQ STATUS |IRQ STATUS |... IRQ_STATUS      | | | |
+ *  | | | |IRQ CLEAR  |IRQ CLEAR  |... IRQ CLEAR       | | | |
+ *  | | | |IRQ ENABLE |IRQ ENABLE |... IRQ ENABLE      | | | |
+ *  | | | +--------------------------------------------+ | | |
+ *  | | |                                                | | |
+ *  | | +------------------------------------------------+ | |
+ *  | | | BW VOTE Nodes                                  | | |
+ *  | | | +--------------------------------------------+ | | |
+ *  | | | |Node 0     |Node 1     |....num_nds         | | | |
+ *  | | | |-----------|--------------------------------| | | |
+ *  | | | |IRQ STATUS |IRQ STATUS |... IRQ_STATUS      | | | |
+ *  | | | |IRQ CLEAR  |IRQ CLEAR  |... IRQ CLEAR       | | | |
+ *  | | | |IRQ ENABLE |IRQ ENABLE |... IRQ ENABLE      | | | |
+ *  | | | +--------------------------------------------+ | | |
+ *  | | |                                                | | |
+ *  | | +------------------------------------------------+ | |
+ *  | | | BW PT VOTE Nodes                               | | |
+ *  | | | +--------------------------------------------+ | | |
+ *  | | | |PT Node 0  |PT Node 1  |....num_nds_pt      | | | |
+ *  | | | |-----------|--------------------------------| | | |
+ *  | | | |IRQ STATUS                                  | | | |
+ *  | | | |IRQ CLEAR                                   | | | |
+ *  | | | |IRQ ENABLE                                  | | | |
+ *  | | | +--------------------------------------------+ | | |
+ *  | | |                                              | | | |
+ *  | | +------------------------------------------------+ | |
+ *  | |                       ......                       | |
+ *  | +----------------------------------------------------+ |
+ *  | |                                                    | |
+ *  | +----------------------------------------------------+ |
+ *  | | SW DRV1                                            | |
+ *  | | (same as DRV0)                                     | |
+ *  | +----------------------------------------------------+ |
+ *  |                         ......                         |
+ *  | +----------------------------------------------------+ |
+ *  | |Configuration                                       | |
+ *  | | +------------------------------------------------+ | |
+ *  | | | |VERSION  | CFG 1            |CFG 2          | | | |
+ *  | | | |---------|------------------|---------------| | | |
+ *  | | | |Major    | num_perf_ol_vcds |num_nds        | | | |
+ *  | | | |Minor    | num_nds_pt       |               | | | |
+ *  | | | |         | num_sw_drvs      |               | | | |
+ *  | | | +--------------------------------------------+ | | |
+ *  | | +------------------------------------------------+ | |
+ *  | +----------------------------------------------------+ |
+ *  +--------------------------------------------------------+
+ *
+ */
+
+ /**
+  * enum crm_cfg - Configuration registers space description for CRM
+  *
+  * This enumeration is used for three registers (CRM_VERSION, CRM_CFG_PARAM_1
+  * and CRM_CFG_PARAM_2) which are read only along with their bit meanings.
+  * The CRM_ENABLE indicates if the CRM is setup and enabled by firmware to be
+  * used. These are used during probe to setup DRVs.
+  *
+  * @CRM_VERSION:               Overall CRM version identifier.
+  * @MAJOR_VERSION:             Major version number of the CRM module.
+  * @MINOR_VERSION:             Minor version number of the CRM module.
+  * @CRM_CFG_PARAM_1:           Configuration parameter 1.
+  * @NUM_OF_NODES_PT:           Number of Pass through (PT) nodes in the power topology.
+  * @NUM_VCD_VOTED_BY_BW:       Number of VCD (voltage/current domains) voted by bandwidth.
+  * @NUM_SW_DRVS:               Number of software drivers interacting with CRM.
+  * @NUM_OF_RAILS:              Number of power rails managed by CRM.
+  * @NUM_VCD_VOTED_BY_PERF_OL:  Number of VCDs voted by performance operating levels.
+  * @CRM_CFG_PARAM_2:           Configuration parameter 2.
+  * @NUM_OF_NODES:              Total number of nodes managed by CRM.
+  * @CRM_ENABLE:                Flag to enable or disable CRM functionality.
+  * @CFG_REG_MAX:               Maximum number of configuration registers.
+  *                             Used as a boundary marker for array sizing.
+  */
+enum crm_cfg {
+	CRM_VERSION,
+	MAJOR_VERSION,
+	MINOR_VERSION,
+	CRM_CFG_PARAM_1,
+	NUM_OF_NODES_PT,
+	NUM_VCD_VOTED_BY_BW,
+	NUM_SW_DRVS,
+	NUM_OF_RAILS,
+	NUM_VCD_VOTED_BY_PERF_OL,
+	CRM_CFG_PARAM_2,
+	NUM_OF_NODES,
+	CRM_ENABLE,
+	CFG_REG_MAX,
+};
+
+/**
+ * enum crm_vcd_type - Types of VCD (Voltage/Clock Domain) requests
+ *
+ * This enumeration defines the various types of VCD (Voltage/Clock Domain)
+ * requests that can be made by the CRM (Clock and Resource Manager) DRVs.
+ * These types are used to categorize and handle different performance and
+ * bandwidth-related requests.
+ *
+ * @PERF_OL_VCD:       Votes are placed interms of Performance operating levels.
+ * @BW_VOTE_VCD:       Votes are placed interms of Bandwidth for local resources.
+ * @BW_PT_VOTE_VCD:    Votes are placed interms of Bandwidth for global resources.
+ * @MAX_VCD_TYPE:      Maximum number of VCD types. Not a valid type itself,
+ *                     but used for bounds checking and array sizing.
+ */
+enum crm_vcd_type {
+	PERF_OL_VCD,
+	BW_VOTE_VCD,
+	BW_PT_VOTE_VCD,
+	MAX_VCD_TYPE,
+};
+
+/**
+ * enum crm_client - CRM (Clock and Resource Manager) client register space
+ *
+ * This enumeration defines the various registers used by CRM clients.
+ * They are used for managing driver base addresses, updating power state,
+ * interrupt handling and other CRM-related operations.
+ *
+ * @DRV_BASE:              Base address register for the driver.
+ * @DRV_DISTANCE:          Offset from the base to DRV registers.
+ * @DRV_RESOURCE_DISTANCE: Distance between each VCD or ND resources.
+ *
+ * @PWR_ST0:               Power state register 0 for the driver.
+ * @PWR_ST1:               Power state register 1 for the driver.
+ * @PWR_ST2:               Power state register 2 for the driver.
+ * @PWR_ST3:               Power state register 3 for the driver.
+ * @PWR_ST4:               Power state register 4 for the driver.
+ *
+ * @IRQ_STATUS:            Interrupt status register for a VCD or ND.
+ * @IRQ_CLEAR:             Interrupt clear register for a VCD or ND.
+ * @IRQ_ENABLE:            Interrupt enable register for a VCD or ND.
+ *
+ * @CRMB_PT_TRIGGER:       Trigger register for CRM bandwidth/performance point.
+ *
+ * @CRM_CLIENT_REG_MAX:    Maximum number of CRM client register types. Used for
+ *                         bounds checking and array sizing.
+ */
+
+enum crm_client {
+	DRV_BASE,
+	DRV_DISTANCE,
+	DRV_RESOURCE_DISTANCE,
+	ACTIVE_VOTE,
+	SLEEP_VOTE,
+	WAKE_VOTE,
+	IRQ_STATUS,
+	IRQ_CLEAR,
+	IRQ_ENABLE,
+	CRMB_PT_TRIGGER,
+	CRM_CLIENT_REG_MAX,
+};
+
+/**
+ * enum crm_capability - CRM capability types
+ * @PERF_OL_VOTING_CAPABLE: Indicates support for performance operating level (OL) voting
+ * @BW_VOTING_CAPABLE: Indicates support for bandwidth (BW) voting
+ * @BW_PT_VOTING_CAPABLE: Indicates support for bandwidth power throttle (PT) voting
+ *
+ * This enumeration defines the various capabilities that a CRM (Clock and Resource Manager)
+ * instance may support. These capabilities determine the types of resource management
+ * operations the CRM can perform.
+ */
+enum crm_capability {
+	PERF_OL_VOTING_CAPABLE,
+	BW_VOTING_CAPABLE,
+	BW_PT_VOTING_CAPABLE,
+};
+
+/**
+ * struct crm_desc: CRM register and capability description
+ *
+ * @crm_capability:		Capability if H/W can vote on PERF_OL/BW_VOTE/BW_PT_VOTE via
+ *                              crm_write_perf_ol(), crm_write_bw_vote() and crm_write_bw_pt_vote()
+ *                              APIs.
+ * @cfg_regs:			Configuration registers, memory mapped.
+ * @sw_drv_perf_ol_vcd_regs:	PERF_OL voting registers
+ * @sw_drv_bw_vote_vcd_regs:	BW_VOTE voting registers
+ * @sw_drv_bw_pt_vote_vcd_regs: BW_PT_VOTE voting registers
+ */
+struct crm_desc {
+	u32 crm_capability;
+	u32 *cfg_regs;
+	u32 sw_drv_perf_ol_vcd_regs[CRM_CLIENT_REG_MAX];
+	u32 sw_drv_bw_vote_vcd_regs[CRM_CLIENT_REG_MAX];
+	u32 sw_drv_bw_pt_vote_vcd_regs[CRM_CLIENT_REG_MAX];
+};
+
+/**
+ * struct crm_sw_votes: SW DRV's ACTIVE_VOTEs in progress.
+ * One per VCD.
+ *
+ * @cmd:                The ACTIVE_VOTE being sent to CRM.
+ * @compl:              Wait for completion if the cmd->wait is set.
+ *                      Applicable only for ACTIVE_VOTEs.
+ * @in_progress:        Indicates if the cmd is in flight.
+ * @wait:               Wait queue used to wait for @in_progress to be false.
+ *                      This is needed because HW do not keep a record of new
+ *                      requests issued until current one is completed.
+ */
+struct crm_sw_votes {
+	struct crm_cmd cmd;
+	struct completion compl;
+	bool in_progress;
+	wait_queue_head_t wait;
+};
+
+/**
+ * struct crm_vcd: The Virtual Clock Domain's (VCDs) of the CRM.
+ * One instance per VCD type (PERF_OL/ BW_VOTE/ BW_PT_VOTE).
+ *
+ * @num_pwr_states:     Number of pwr state that DRV VCD can vote for
+ * @num_resources:      Number of VCD resources (for PERF_OL votes) OR
+ *                      Number of Node resoureces (for BW votes)
+ * @offsets:            Register offsets for DRV controller
+ * @sw_votes:           Cache of SW DRV's ACTIVE_VOTEs
+ */
+struct crm_vcd {
+	u32 num_pwr_states;
+	u32 num_resources;
+	u32 *offsets;
+	struct crm_sw_votes *sw_votes;
+};
+
+/**
+ * struct crm_drv: The Direct Resource Voter (DRV) of the
+ * CESTA Resource manager (CRM).
+ *
+ * @name:               Controller name
+ * @base:               Base address of the CRM device
+ * @drv_id:             DRV (Direct Resource Voter) number
+ * @vcd:                VCDs in this DRV.
+ * @lock:               Used to synchronize SW DRV's vote placement. Must
+ *                      be acquired before modifying ACTIVE/SLEEP/WAKE votes
+ * @irq:                Completion IRQ, Received for ACTIVE votes which gets
+ *                      instant applied.
+ * @initialized:        Whether DRV is initialized
+ */
+struct crm_drv {
+	char name[MAX_NAME_LENGTH];
+	void __iomem *base;
+	u32 drv_id;
+	struct crm_vcd vcd[MAX_VCD_TYPE];
+	spinlock_t lock;
+	int irq;
+	bool initialized;
+};
+
+/**
+ * struct crm_drv_top: Our representation of the top CRM device.
+ *
+ * @name:               CRM device name
+ * @crm_enabled:        Indicates if CRM is enabled
+ * @cfg:                Configuration address of the CRM device
+ *                      Includes version and VCDs information
+ * @base:               Base address of the CRM device
+ * @sw_drvs:            Controller for each SW DRV
+ * @num_sw_drvs:        Number of SW DRV controllers in the CRM device
+ * @max_sw_drv:         Max id of SW DRV controller in use
+ * @list:               CRM device added in crm_dev_list.
+ * @desc:               CRM description
+ * @dev:                CRM dev
+ * @pdev:               CRM platform device
+ */
+struct crm_drv_top {
+	char name[MAX_NAME_LENGTH];
+	bool crm_enabled;
+	void __iomem *cfg;
+	void __iomem *base;
+	struct crm_drv *sw_drvs;
+	int num_sw_drvs;
+	int max_sw_drv;
+	struct list_head list;
+	const struct crm_desc *desc;
+	struct device *dev;
+	struct platform_device *pdev;
+};
+
+static inline void __iomem *crm_get_offset(const struct crm_drv *drv, u32 reg, u32 ch,
+					   u32 vcd_type, u32 resource_idx)
+{
+	const struct crm_vcd *vcd = &drv->vcd[vcd_type];
+	u32 offset;
+
+	offset = vcd->offsets[DRV_BASE] + drv->drv_id * vcd->offsets[DRV_DISTANCE];
+	offset += vcd->offsets[reg];
+	offset += resource_idx * vcd->offsets[DRV_RESOURCE_DISTANCE];
+
+	return drv->base + offset;
+}
+
+static struct crm_drv *get_crm_drv(const struct device *dev, u32 drv_id, u32 capability)
+{
+	struct crm_drv_top *crm = NULL;
+	int i;
+
+	if (!dev)
+		goto exit;
+
+	crm = dev_get_drvdata(dev);
+	if (IS_ERR_OR_NULL(crm) || !crm->crm_enabled)
+		goto exit;
+
+	if (!(crm->desc->crm_capability & capability))
+		goto exit;
+
+	for (i = 0; i < crm->num_sw_drvs; i++) {
+		if (drv_id == crm->sw_drvs[i].drv_id)
+			return &crm->sw_drvs[i];
+	}
+
+exit:
+	return ERR_PTR(-ENODEV);
+}
+
+static void crm_vote_completion(struct crm_sw_votes *votes)
+{
+	struct completion *compl = &votes->compl;
+
+	votes->in_progress = false;
+	complete(compl);
+}
+
+/**
+ * crm_vote_complete_irq() - Vote completion interrupt handler for SW DRVs.
+ * @irq: The IRQ number.
+ * @p:   Pointer to "struct crm_drv".
+ *
+ * Called for ACTIVE_VOTE transfers (those are the only ones we enable the
+ * IRQ for) when a transfer is done.
+ *
+ * Return: IRQ_HANDLED
+ */
+static irqreturn_t crm_vote_complete_irq(int irq, void *p)
+{
+	struct crm_drv_top *crm = p;
+	struct crm_drv *drv;
+	struct crm_vcd *vcd;
+	struct crm_sw_votes *votes;
+	unsigned long irq_status;
+	int i, j, k, num_irq;
+	void __iomem *addr;
+
+	for (i = 0; i < crm->num_sw_drvs; i++) {
+		drv = &crm->sw_drvs[i];
+		if (!drv->initialized && drv->irq != irq)
+			continue;
+
+		spin_lock(&drv->lock);
+		for (j = 0; j < MAX_VCD_TYPE; j++) {
+			if (!(crm->desc->crm_capability & BIT(j)))
+				continue;
+			vcd = &drv->vcd[j];
+
+			num_irq = j == BW_PT_VOTE_VCD ? 1 : vcd->num_resources;
+
+			for (k = 0; k < num_irq; k++) {
+				addr = crm_get_offset(drv, IRQ_STATUS, 0, j, k);
+				irq_status = readl_relaxed(addr);
+				if (!irq_status)
+					continue;
+
+				addr = crm_get_offset(drv, IRQ_CLEAR, 0, j, k);
+				writel_relaxed(IRQ_CLEAR_BIT, addr);
+				trace_crm_irq(drv->name, j, k, irq_status);
+
+				votes = &vcd->sw_votes[k];
+				if (WARN_ON_ONCE(!votes->in_progress))
+					continue;
+
+				if (votes->cmd.wait)
+					crm_vote_completion(votes);
+			}
+		}
+		spin_unlock(&drv->lock);
+	}
+
+	return IRQ_HANDLED;
+}
+
+
+/**
+ * crm_send_cmd - Send a command to the CRM hardware
+ * @drv: Pointer to the CRM driver structure
+ * @vcd_type: Type of VCD (PERF_OL_VCD, BW_VOTE_VCD or BW_PT_VOTE_VCD)
+ * @cmd: Pointer to the CRM structure containing command parameters
+ * @pt_trigger: Boolean flag indicating whether this is a pass through command
+ *
+ * This function sends a command to the CRM hardware for the specified VCD type.
+ * It assumes that the command has already been validated
+ * (e.g., using crm_is_invalid_cmd()).
+ *
+ * May sleep.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int crm_send_cmd(struct crm_drv *drv, u32 vcd_type, const struct crm_cmd *cmd,
+			bool pt_trigger)
+{
+	struct crm_vcd *vcd = &drv->vcd[vcd_type];
+	struct completion *compl = NULL;
+	u32 time_left = CRM_TIMEOUT_MS;
+	u32 data = cmd->data, irq_idx;
+	void __iomem *addr;
+
+	spin_lock_irq(&drv->lock);
+
+	/* Note: Set BIT(31) for RESP_REQ */
+	if (vcd_type == BW_VOTE_VCD && cmd->wait)
+		data |= BW_VOTE_RESP_REQ;
+
+	irq_idx = vcd_type == BW_PT_VOTE_VCD ? 0 : cmd->resource_idx;
+
+	switch (cmd->pwr_state) {
+	case CRM_ACTIVE_STATE:
+		/* Wait forever for a previous request to complete */
+		wait_event_lock_irq(vcd->sw_votes[irq_idx].wait,
+				    !vcd->sw_votes[irq_idx].in_progress,
+				    drv->lock);
+
+		compl = &vcd->sw_votes[irq_idx].compl;
+		init_completion(compl);
+		memcpy(&vcd->sw_votes[irq_idx], cmd, sizeof(struct crm_cmd));
+		vcd->sw_votes[irq_idx].in_progress = true;
+		addr = crm_get_offset(drv, ACTIVE_VOTE, 0, vcd_type, cmd->resource_idx);
+		writel_relaxed(data, addr);
+		break;
+	case CRM_SLEEP_STATE:
+		addr = crm_get_offset(drv, SLEEP_VOTE, 0, vcd_type, cmd->resource_idx);
+		writel_relaxed(data, addr);
+		break;
+	case CRM_WAKE_STATE:
+		addr = crm_get_offset(drv, WAKE_VOTE, 0, vcd_type, cmd->resource_idx);
+		writel_relaxed(data, addr);
+		break;
+	}
+
+	/* Set COMMIT to start aggregating votes */
+	if (pt_trigger) {
+		addr = crm_get_offset(drv, CRMB_PT_TRIGGER, 0, vcd_type, 0);
+		writel_relaxed(BW_PT_VOTE_TRIGGER, addr);
+
+		udelay(1);
+
+		addr = crm_get_offset(drv, CRMB_PT_TRIGGER, 0, vcd_type, 0);
+		writel_relaxed(0, addr);
+	}
+
+	spin_unlock_irq(&drv->lock);
+	trace_crm_write_vcd_votes(drv->name, vcd_type, cmd->resource_idx, cmd->pwr_state, data);
+
+	if (compl && cmd->wait) {
+		time_left = wait_for_completion_timeout(compl, CRM_TIMEOUT_MS);
+		WARN_ON(!time_left);
+		/* Unblock new requests for same VCD */
+		wake_up(&vcd->sw_votes[irq_idx].wait);
+	}
+
+	return (time_left > 0) ? 0 : -ETIMEDOUT;
+}
+
+/**
+ * crm_is_invalid_cmd - Validate a CRM command structure
+ * @drv: Pointer to the CRM driver structure
+ * @vcd_type: Type of VCD (Voltage/Clock Domain)
+ * @cmd: Pointer to the CRM command structure
+ *
+ * This function checks whether the given CRM command is valid for the
+ * specified VCD type. It performs the following validations:
+ * - Ensures that the driver and command pointers are not NULL or erroneous.
+ * - Checks that the power state index is within the valid range.
+ * - Checks that the resource index is within the valid range.
+ * - For BW_VOTE_VCD, ensures the BW_VOTE_VALID bit is set in the data field.
+ * - For BW_PT_VOTE_VCD, ensures the BW_PT_VOTE_VALID bit is set in the data field.
+ * - For PERF_OL_VCD, ensures only valid bits are set in the data field.
+ *
+ * Return: true if the command is invalid, false otherwise.
+ */
+static bool crm_is_invalid_cmd(struct crm_drv *drv, u32 vcd_type, const struct crm_cmd *cmd)
+{
+	struct crm_vcd *vcd;
+
+	if (IS_ERR_OR_NULL(drv) || IS_ERR_OR_NULL(cmd))
+		return true;
+
+	vcd = &drv->vcd[vcd_type];
+
+	if (cmd->pwr_state >= vcd->num_pwr_states)
+		return true;
+	else if (cmd->resource_idx >= vcd->num_resources)
+		return true;
+	else if (vcd_type == BW_VOTE_VCD && !(cmd->data & BW_VOTE_VALID))
+		return true;
+	else if (vcd_type == BW_PT_VOTE_VCD && !(cmd->data & BW_PT_VOTE_VALID))
+		return true;
+	else if (vcd_type == PERF_OL_VCD && (cmd->data & ~PERF_OL_VALUE_BITS))
+		return true;
+
+	return false;
+}
+
+/**
+ * crm_write_perf_ol() - Write a perf ol vote for a resource
+ * @dev:       The device making the request, dev->parent must be CRM device
+ * @drv_id:    DRV ID for which the votes are sent
+ * @cmd:       The CRM CMD
+ *
+ * Caches the votes for logging and immediately sends the votes for SW DRVs
+ * if the @cmd have .wait set and is for ACTIVE_VOTE then waits for completion
+ * IRQ before return. for SLEEP_VOTE and WAKE_VOTE no completion IRQ is sent
+ * and they are triggered within HW during idle/awake scenarios.
+ *
+ * Return:
+ * * 0			- Success
+ * * -Error             - Error code
+ */
+int crm_write_perf_ol(const struct device *dev, u32 drv_id, const struct crm_cmd *cmd)
+{
+	struct crm_drv *drv = get_crm_drv(dev, drv_id, PERF_OL_VOTING_CAPABLE);
+	int ret;
+
+	ret = crm_is_invalid_cmd(drv, PERF_OL_VCD, cmd);
+	if (ret)
+		return -EINVAL;
+
+	return crm_send_cmd(drv, PERF_OL_VCD, cmd, false);
+}
+EXPORT_SYMBOL_GPL(crm_write_perf_ol);
+
+/**
+ * crm_write_bw_vote() - Write a bw vote for a resource
+ * @dev:       The device making the request, dev->parent must be CRM device
+ * @drv_id:    DRV ID for which the votes are sent
+ * @cmd:       The CRM CMD
+ *
+ * Caches the votes for logging and immediately sends the votes for SW DRVs
+ * if the @cmd have .wait set and is for ACTIVE_VOTE then waits for completion
+ * IRQ before return. for SLEEP_VOTE and WAKE_VOTE no completion IRQ is sent
+ * and they are triggered within HW during idle/awake scenarios.
+ *
+ * Return:
+ * * 0			- Success
+ * * -Error             - Error code
+ */
+int crm_write_bw_vote(const struct device *dev, u32 drv_id, const struct crm_cmd *cmd)
+{
+	struct crm_drv *drv = get_crm_drv(dev, drv_id, BW_VOTING_CAPABLE);
+	int ret;
+
+	ret = crm_is_invalid_cmd(drv, BW_VOTE_VCD, cmd);
+	if (ret)
+		return -EINVAL;
+
+	return crm_send_cmd(drv, BW_VOTE_VCD, cmd, false);
+}
+EXPORT_SYMBOL_GPL(crm_write_bw_vote);
+
+/**
+ * crm_write_bw_pt_vote() - Write a bw vote for a resource
+ * @dev:       The device making the request, dev->parent must be CRM device
+ * @drv_id:    DRV ID for which the votes are sent
+ * @cmd:       The CRM CMD
+ *
+ * Caches the votes for logging and immediately sends the votes for SW DRVs
+ * if the @cmd have .wait set and is for ACTIVE_VOTE then waits for completion
+ * IRQ before return. For SLEEP_VOTE and WAKE_VOTE no completion IRQ is sent
+ * and they are triggered within HW during idle/awake scenarios.
+ *
+ * Return:
+ * * 0			- Success
+ * * -Error             - Error code
+ */
+int crm_write_bw_pt_vote(const struct device *dev, u32 drv_id, const struct crm_cmd *cmd)
+{
+	struct crm_drv *drv = get_crm_drv(dev, drv_id, BW_PT_VOTING_CAPABLE);
+	int ret;
+
+	ret = crm_is_invalid_cmd(drv, BW_PT_VOTE_VCD, cmd);
+	if (ret)
+		return -EINVAL;
+
+	return crm_send_cmd(drv, BW_PT_VOTE_VCD, cmd, true);
+}
+EXPORT_SYMBOL_GPL(crm_write_bw_pt_vote);
+
+/**
+ * crm_get() - Get a crm handle from a device
+ * @dev: Client device pointer
+ *
+ * Return: Handle to crm device on success, ERR_PTR() on failure
+ */
+struct device *crm_get(const struct device *dev)
+{
+	struct platform_device *pdev;
+	struct crm_drv_top *crm;
+	struct device_node *np;
+
+	if (!dev || !dev->of_node)
+		return ERR_PTR(-EINVAL);
+
+	np = of_parse_phandle(dev->of_node, "qcom,crm", 0);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev)
+		return ERR_PTR(-EINVAL);
+
+	crm = platform_get_drvdata(pdev);
+	if (!crm) {
+		put_device(&pdev->dev);
+		return ERR_PTR(-ENODEV);
+	}
+
+	return crm->dev;
+}
+EXPORT_SYMBOL_GPL(crm_get);
+
+static int crm_probe_get_irqs(struct crm_drv_top *crm)
+{
+	struct crm_drv *drvs = crm->sw_drvs;
+	struct crm_vcd *vcd;
+	int i, j, k, irq, ret;
+	void __iomem *addr;
+
+	/* Only SW DRVs have associated vote completion IRQ */
+	for (i = 0; i < crm->num_sw_drvs; i++) {
+		if (!crm->sw_drvs[i].initialized)
+			continue;
+
+		irq = platform_get_irq(crm->pdev, drvs[i].drv_id);
+		if (irq < 0)
+			return irq;
+
+		ret = devm_request_irq(crm->dev, irq, crm_vote_complete_irq,
+				       IRQF_TRIGGER_RISING, drvs[i].name, crm);
+		if (ret)
+			return ret;
+
+		drvs[i].irq = irq;
+
+		/* Additionally allocate memory for sw_votes */
+		for (j = 0; j < MAX_VCD_TYPE; j++) {
+			if (!(crm->desc->crm_capability & BIT(j)))
+				continue;
+
+			vcd = &drvs[i].vcd[j];
+			vcd->sw_votes = devm_kcalloc(crm->dev, vcd->num_resources,
+						     sizeof(struct crm_sw_votes),
+						     GFP_KERNEL);
+			if (!vcd->sw_votes)
+				return -ENOMEM;
+
+			/* Enable IRQs for all VCDs */
+			for (k = 0; k < vcd->num_resources; k++) {
+				init_waitqueue_head(&vcd->sw_votes[k].wait);
+				addr = crm_get_offset(&drvs[i], IRQ_ENABLE, 0, j, k);
+				writel_relaxed(IRQ_ENABLE_BIT, addr);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int crm_probe_set_vcd_caches(struct crm_drv_top *crm, u32 crm_cfg, u32 crm_cfg_2)
+{
+	struct crm_vcd *vcd;
+	struct crm_drv *drv;
+	u32 num_perf_ol_vcds, num_nds, num_nds_pt;
+	int i, j;
+
+	num_perf_ol_vcds = field_get(crm->desc->cfg_regs[NUM_VCD_VOTED_BY_PERF_OL], crm_cfg);
+	num_nds = field_get(crm->desc->cfg_regs[NUM_OF_NODES], crm_cfg_2);
+	num_nds_pt = field_get(crm->desc->cfg_regs[NUM_OF_NODES_PT], crm_cfg);
+
+	for (i = 0; i < crm->num_sw_drvs; i++) {
+		drv = &crm->sw_drvs[i];
+
+		if (!drv->initialized)
+			continue;
+
+		for (j = 0; j < MAX_VCD_TYPE; j++) {
+			if (!(crm->desc->crm_capability & BIT(j)))
+				continue;
+			vcd = &drv->vcd[j];
+
+			if (j == PERF_OL_VCD) {
+				vcd->offsets = (u32 *)&crm->desc->sw_drv_perf_ol_vcd_regs;
+				vcd->num_resources = num_perf_ol_vcds;
+			} else if (j == BW_VOTE_VCD) {
+				vcd->offsets = (u32 *)&crm->desc->sw_drv_bw_vote_vcd_regs;
+				/* BW_VOTE_VCD can have multiple NDs with which BW can be voted */
+				vcd->num_resources = num_nds;
+			} else {
+				vcd->offsets = (u32 *)&crm->desc->sw_drv_bw_pt_vote_vcd_regs;
+				vcd->num_resources = num_nds_pt;
+			}
+			vcd->num_pwr_states = MAX_SW_DRV_PWR_STATES;
+		}
+	}
+
+	return 0;
+}
+
+static struct crm_drv *crm_probe_get_drvs(struct crm_drv_top *crm, int num_drvs,
+					  const char *prop_name, const char *name)
+{
+	struct device_node *dn = crm->dev->of_node;
+	u32 *drv_ids;
+	int i, id;
+	int ret;
+	struct crm_drv *drvs;
+
+	if (!num_drvs)
+		return ERR_PTR(-EINVAL);
+
+	drvs = devm_kcalloc(crm->dev, num_drvs, sizeof(struct crm_drv), GFP_KERNEL);
+	if (!drvs)
+		return ERR_PTR(-ENOMEM);
+
+	drv_ids = kcalloc(num_drvs, sizeof(u32), GFP_KERNEL);
+	if (!drv_ids)
+		return ERR_PTR(-ENOMEM);
+
+	ret = of_property_read_variable_u32_array(dn, prop_name, drv_ids, 1, num_drvs);
+	if (ret < 0) {
+		kfree(drv_ids);
+		return ERR_PTR(ret);
+	}
+
+	for (i = 0; i < num_drvs; i++) {
+		id = drv_ids[i];
+
+		scnprintf(drvs[i].name, sizeof(drvs[i].name), "%s_%s_%d", crm->name, name, id);
+		spin_lock_init(&drvs[i].lock);
+		drvs[i].drv_id = id;
+		drvs[i].base = crm->base;
+		drvs[i].initialized = true;
+	}
+
+	kfree(drv_ids);
+	return drvs;
+}
+
+static int crm_probe_drvs(struct crm_drv_top *crm, struct device_node *dn)
+{
+	u32 crm_ver, major_ver, minor_ver;
+	u32 crm_cfg, crm_cfg_2;
+
+	crm_ver = readl_relaxed(crm->cfg + crm->desc->cfg_regs[CRM_VERSION]);
+	major_ver = field_get(crm->desc->cfg_regs[MAJOR_VERSION], crm_ver);
+	minor_ver = field_get(crm->desc->cfg_regs[MINOR_VERSION], crm_ver);
+	dev_info(crm->dev, "CRM %s version major=%u minor=%u\n", crm->name, major_ver, minor_ver);
+
+	crm_cfg = readl_relaxed(crm->cfg + crm->desc->cfg_regs[CRM_CFG_PARAM_1]);
+	crm->max_sw_drv = field_get(crm->desc->cfg_regs[NUM_SW_DRVS], crm_cfg);
+
+	crm->num_sw_drvs = of_property_count_u32_elems(dn, "qcom,sw-drv-ids");
+	if (crm->num_sw_drvs < 0)
+		return -EINVAL;
+
+	crm->sw_drvs = crm_probe_get_drvs(crm, crm->num_sw_drvs, "qcom,sw-drv-ids", "sw_drv");
+	if (IS_ERR(crm->sw_drvs))
+		return PTR_ERR(crm->sw_drvs);
+
+	if (crm->num_sw_drvs > crm->max_sw_drv || !crm->num_sw_drvs)
+		return -EINVAL;
+
+	crm_cfg_2 = readl_relaxed(crm->cfg + crm->desc->cfg_regs[CRM_CFG_PARAM_2]);
+
+	return crm_probe_set_vcd_caches(crm, crm_cfg, crm_cfg_2);
+}
+
+static int crm_probe(struct platform_device *pdev)
+{
+	struct device_node *dn = pdev->dev.of_node;
+	struct crm_drv_top *crm;
+	const char *name;
+	int ret;
+
+	crm = devm_kzalloc(&pdev->dev, sizeof(*crm), GFP_KERNEL);
+	if (!crm)
+		return -ENOMEM;
+
+	crm->desc = of_device_get_match_data(&pdev->dev);
+	if (!crm->desc)
+		return -EINVAL;
+
+	name = of_get_property(dn, "label", NULL);
+	if (!name)
+		name = dev_name(&pdev->dev);
+
+	crm->pdev = pdev;
+	crm->dev = &pdev->dev;
+	scnprintf(crm->name, sizeof(crm->name), "%s", name);
+
+	crm->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(crm->base))
+		return -ENOMEM;
+
+	crm->cfg = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
+	if (IS_ERR(crm->cfg))
+		return -ENOMEM;
+
+	if (pdev->dev.pm_domain) {
+		ret = devm_pm_runtime_enable(&pdev->dev);
+		if (ret)
+			return ret;
+
+		ret = pm_runtime_resume_and_get(&pdev->dev);
+		if (ret)
+			return ret;
+	}
+
+	crm->crm_enabled = readl_relaxed(crm->cfg + crm->desc->cfg_regs[CRM_ENABLE]);
+	if (!crm->crm_enabled) {
+		dev_err(crm->dev, "%s not enabled, exiting\n", crm->name);
+		ret = -ENODEV;
+		goto exit;
+	}
+
+	ret = crm_probe_drvs(crm, dn);
+	if (ret)
+		goto exit;
+
+	ret = crm_probe_get_irqs(crm);
+	if (ret)
+		goto exit;
+
+	dev_set_drvdata(&pdev->dev, crm);
+exit:
+	if (pdev->dev.pm_domain)
+		pm_runtime_put(&pdev->dev);
+
+	return ret;
+}
+
+static u32 crm_v2_cfg[] = {
+	[CRM_VERSION]			= 0x0,
+	[MAJOR_VERSION]			= GENMASK(23, 16),
+	[MINOR_VERSION]			= GENMASK(15, 8),
+	[CRM_CFG_PARAM_1]		= 0x4,
+	[NUM_OF_NODES_PT]		= GENMASK(31, 27),
+	[NUM_VCD_VOTED_BY_BW]		= GENMASK(26, 24),
+	[NUM_SW_DRVS]			= GENMASK(23, 20),
+	[NUM_OF_RAILS]			= GENMASK(15, 12),
+	[NUM_VCD_VOTED_BY_PERF_OL]	= GENMASK(11, 8),
+	[CRM_CFG_PARAM_2]		= 0x8,
+	[NUM_OF_NODES]			= GENMASK(30, 26),
+	[CRM_ENABLE]			= 0xc,
+};
+
+static const struct crm_desc disp_crm_desc_v2 = {
+	.crm_capability = PERF_OL_VOTING_CAPABLE | BW_VOTING_CAPABLE | BW_PT_VOTING_CAPABLE,
+	.cfg_regs = crm_v2_cfg,
+	.sw_drv_perf_ol_vcd_regs = {
+		[DRV_BASE]			 = 0xe0,
+		[DRV_DISTANCE]			 = 0x1000,
+		[DRV_RESOURCE_DISTANCE]		 = 0x20,
+		[ACTIVE_VOTE]			 = 0x0,
+		[SLEEP_VOTE]			 = 0x4,
+		[WAKE_VOTE]			 = 0x8,
+		[IRQ_STATUS]			 = 0x10,
+		[IRQ_CLEAR]			 = 0x14,
+		[IRQ_ENABLE]			 = 0x18,
+	},
+	.sw_drv_bw_vote_vcd_regs = {
+		[DRV_BASE]			 = 0xe0,
+		[DRV_DISTANCE]			 = 0x1000,
+		[DRV_RESOURCE_DISTANCE]		 = 0x10,
+		[ACTIVE_VOTE]			 = 0x20,
+		[SLEEP_VOTE]			 = 0x24,
+		[WAKE_VOTE]			 = 0x28,
+		[IRQ_STATUS]			 = 0x90,
+		[IRQ_CLEAR]			 = 0x94,
+		[IRQ_ENABLE]			 = 0x98,
+	},
+	.sw_drv_bw_pt_vote_vcd_regs = {
+		[DRV_BASE]			 = 0xe0,
+		[DRV_DISTANCE]			 = 0x1000,
+		[DRV_RESOURCE_DISTANCE]		 = 0x10,
+		[ACTIVE_VOTE]			 = 0x30,
+		[SLEEP_VOTE]			 = 0x34,
+		[WAKE_VOTE]			 = 0x38,
+		[IRQ_STATUS]			 = 0xa0,
+		[IRQ_CLEAR]			 = 0xa4,
+		[IRQ_ENABLE]			 = 0xa8,
+		[CRMB_PT_TRIGGER]		 = 0x100,
+	},
+};
+
+static const struct of_device_id crm_drv_match[] = {
+	{ .compatible = "qcom,sm8750-disp-crm", .data = &disp_crm_desc_v2 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, crm_drv_match);
+
+static struct platform_driver crm_driver = {
+	.probe = crm_probe,
+	.driver = {
+		  .name = "crm",
+		  .of_match_table = crm_drv_match,
+		  .suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(crm_driver);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) CRM Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/qcom/trace-crm.h b/drivers/soc/qcom/trace-crm.h
new file mode 100644
index 0000000000000000000000000000000000000000..838e4b51132a16ab6b1e73d3cccfd76859de2e95
--- /dev/null
+++ b/drivers/soc/qcom/trace-crm.h
@@ -0,0 +1,111 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#if !defined(_TRACE_CRM_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_CRM_H
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM crm
+
+#include <linux/tracepoint.h>
+#include <soc/qcom/crm.h>
+
+DECLARE_EVENT_CLASS(crm_vcd_votes,
+
+	TP_PROTO(const char *name, u32 vcd_type, u32 resource_idx, u32 pwr_state, u32 data),
+
+	TP_ARGS(name, vcd_type, resource_idx, pwr_state, data),
+
+	TP_STRUCT__entry(
+			 __string(name, name)
+			 __field(u32, vcd_type)
+			 __field(u32, resource_idx)
+			 __field(u32, pwr_state)
+			 __field(u32, data)
+	),
+
+	TP_fast_assign(
+		       __assign_str(name);
+		       __entry->vcd_type = vcd_type;
+		       __entry->resource_idx = resource_idx;
+		       __entry->pwr_state = pwr_state;
+		       __entry->data = data;
+	),
+
+	TP_printk("%s: vcd_type: %u resource_idx: %u pwr_state: %u data: %#x",
+		  __get_str(name), __entry->vcd_type, __entry->resource_idx,
+		   __entry->pwr_state, __entry->data)
+);
+
+DEFINE_EVENT(crm_vcd_votes, crm_cache_vcd_votes,
+
+	TP_PROTO(const char *name, u32 vcd_type, u32 resource_idx, u32 pwr_state, u32 data),
+
+	TP_ARGS(name, vcd_type, resource_idx, pwr_state, data)
+);
+
+DEFINE_EVENT(crm_vcd_votes, crm_write_vcd_votes,
+
+	TP_PROTO(const char *name, u32 vcd_type, u32 resource_idx, u32 pwr_state, u32 data),
+
+	TP_ARGS(name, vcd_type, resource_idx, pwr_state, data)
+);
+
+TRACE_EVENT(crm_irq,
+
+	TP_PROTO(const char *name, u32 vcd_type, u32 resource_idx, unsigned long irq_status),
+
+	TP_ARGS(name, vcd_type, resource_idx, irq_status),
+
+	TP_STRUCT__entry(
+			 __string(name, name)
+			 __field(u32, vcd_type)
+			 __field(u32, resource_idx)
+			 __field(unsigned long, irq_status)
+	),
+
+	TP_fast_assign(
+		       __assign_str(name);
+		       __entry->vcd_type = vcd_type;
+		       __entry->resource_idx = resource_idx;
+		       __entry->irq_status = irq_status;
+	),
+
+	TP_printk("%s: IRQ vcd_type: %u resource_idx: %u irq_status: %lu",
+		  __get_str(name), __entry->vcd_type, __entry->resource_idx,
+		  __entry->irq_status)
+);
+
+TRACE_EVENT(crm_switch_channel,
+
+	TP_PROTO(const char *name, int ch, int ret),
+
+	TP_ARGS(name, ch, ret),
+
+	TP_STRUCT__entry(
+			 __string(name, name)
+			 __field(int, ch)
+			 __field(int, ret)
+	),
+
+	TP_fast_assign(
+		       __assign_str(name);
+		       __entry->ch = ch;
+		       __entry->ret = ret;
+	),
+
+	TP_printk("%s: channel switched to: %d ret: %d",
+		  __get_str(name), __entry->ch, __entry->ret)
+);
+
+#endif /* _TRACE_CRM_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace-crm
+
+#include <trace/define_trace.h>
diff --git a/include/soc/qcom/crm.h b/include/soc/qcom/crm.h
new file mode 100644
index 0000000000000000000000000000000000000000..5411336f4cf222fcddf9197ba2e13aa3d41d16ec
--- /dev/null
+++ b/include/soc/qcom/crm.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __SOC_QCOM_CRM_H__
+#define __SOC_QCOM_CRM_H__
+
+#include <linux/platform_device.h>
+
+/**
+ * enum crm_sw_drv_state:  Power states for the SW DRV request
+ *
+ * @CRM_ACTIVE_STATE:       Active or AMC mode requests. Resource state
+ *                          is aggregated immediately.
+ * @CRM_SLEEP_STATE:        State of the resource when the subsystem is
+ *                          powered down. There is no client using the
+ *                          resource actively.
+ * @CRM_WAKE_STATE:         Resume resource state to the value previously
+ *                          requested before the subsystem was powered down.
+ */
+enum crm_sw_drv_state {
+	CRM_ACTIVE_STATE,
+	CRM_SLEEP_STATE,
+	CRM_WAKE_STATE,
+};
+
+/**
+ * struct crm_cmd: The message to be sent to CRM
+ *
+ * @pwr_state:     The pwr_state for HW/SW DRV
+ * @resource_idx:  The index of the VCD OR ND to apply data
+ * @data:          The Clock Plan index for the VCDs voted by PERF_OL.
+ *                 BW vote for the VCDs voted by BW.
+ * @wait:          Set by the client want if want to wait for the vote completion IRQ.
+ *                 Applicable for only SW DRV client.
+ *                 Don't care for HW DRV client.
+ */
+struct crm_cmd {
+	enum crm_sw_drv_state pwr_state;
+	u32 resource_idx;
+	u32 data;
+	bool wait;
+};
+
+#if IS_ENABLED(CONFIG_QCOM_CRM)
+int crm_write_perf_ol(const struct device *dev, u32 drv_id, const struct crm_cmd *cmd);
+int crm_write_bw_vote(const struct device *dev, u32 drv_id, const struct crm_cmd *cmd);
+int crm_write_bw_pt_vote(const struct device *dev, u32 drv_id, const struct crm_cmd *cmd);
+struct device *crm_get(const struct device *dev);
+#else
+
+static inline int crm_write_perf_ol(const struct device *dev,
+				    u32 drv_id,
+				    const struct crm_cmd *cmd)
+{ return -ENODEV; }
+
+static inline int crm_write_bw_vote(const struct device *dev,
+				    u32 drv_id,
+				    const struct crm_cmd *cmd)
+{ return -ENODEV; }
+
+static inline int crm_write_bw_pt_vote(const struct device *dev,
+				       u32 drv_id,
+				       const struct crm_cmd *cmd)
+{ return -ENODEV; }
+static inline struct device *crm_get(const struct device *dev)
+{ return NULL; }
+
+#endif /* CONFIG_QCOM_CRM */
+
+#endif /* __SOC_QCOM_CRM_H__ */

-- 
2.34.1


