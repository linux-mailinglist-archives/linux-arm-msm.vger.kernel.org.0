Return-Path: <linux-arm-msm+bounces-102719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEjRLL9E2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:43:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E1C3DB87C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A8BF304F313
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C5D3E4C7D;
	Fri, 10 Apr 2026 18:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFj82ER3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgOzfanm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B663358A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846546; cv=none; b=IEb2JbSU0/CahCtfwncQG6tKJsrcxjmzmHkNCzT9v8hDbrFi1yfj3Wa07IzwdDflw0UVqrC4y7b+cYopPBXtEi+36EbHu+o9qlD7MweMpCJUVXgWa5d2DKfs41QanhrRIOtuXyUlig+dnX8FAclRpU5cwEZkJ1VQRQZDjA89ycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846546; c=relaxed/simple;
	bh=Rep82lDGgEQ5XYFsLbrfvpCeiJUiYIk501w0wWDaZhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mF0hmCMRJUt+gJaqQ2ux4hB7cX5aTiobLCkzsrzHR4vrGWq8eynCDvJYEPFD2I1iZ7ELpxp+KlU6Di6eESIaZAnVqiROZAH/C/VZpnDgw7AwgVfpJ0mRjnEdaUwSp15yLkFMhZrZSifLiof/aqQF9hBtVgMgzfv31ZuhMcj3wJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFj82ER3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgOzfanm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AApPt2709117
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eyFWyVs6irF
	F2geJaREtVZvdfCX41zqa6jIB6bjO66A=; b=JFj82ER3kW1wrsaG2tMRDyshzgO
	uR/0WYdb/3+xDwdHrCK5hfvqhZDXuVQjzBItDtdLg4eoZNsZkfehNTXa0F52ShOG
	TuGPPFEaX8oA+DDyEeUaOdboD95ojeL0m9oirfO4gcmxDx0QYJ/6xK0KJPZFnu5T
	ZTH8VBY6Xe1fl/Fddt0JoroNy0ckzsfxHLUcotj0mG0mTi00kFgy88d5jZtyi2Qy
	DK0XPf/F3HNqBgc4W4SgVmksnXpHl5cZNTKE9l+ETojs61GhJnSTe9Wc61GkdlNX
	zHsixS9/KiqX2jKZjt9Tw7KD2c6MUyqKbmFTC+HzbXcTJoJWOl88nrfgYMg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cdf02bce5so1263475b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846544; x=1776451344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyFWyVs6irFF2geJaREtVZvdfCX41zqa6jIB6bjO66A=;
        b=MgOzfanmZ0XDyfl89cZiq+Cwb68hZ75lyRSPLcdzyWHsYhONwRcZVStgXSWuXj399S
         kN49ds9UvXgHxhR87t5nKv0par1Xa1VM9qI6OataVdo8qFqqgVBSErBS8w783JZGgr9n
         cFwsRAJEJ5nH2M9bXKcGVe2uVK/fBmdmJ8NdjKi5Ikpuh3wiHB+Sih3WiKrH2stk9zKn
         hq7bXbKG1DEBb6MCRDBd/I1IvNJu4yat5CCBZ9HoRiXOIbuKMJyxnWzvPjm+uSv5MdIh
         3XNLeEf52yYwIooabvZKw0wTo1JQ0b+EmReMJ/dFn+9ovZ6OyPRvtsAxWtRo4Ky3HHXb
         r+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846544; x=1776451344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eyFWyVs6irFF2geJaREtVZvdfCX41zqa6jIB6bjO66A=;
        b=qGD1G2Ebxwc2eCl6LiXLlKxMvR9wsgSY4irvcKH/3LfPhlTJ7ckjC/tiTM7qWgut8O
         a/e6PhS8bOc4LNfHNn/znBFF4ln0Yn4BmVVJH/Sg5BX2TZpms0TXSjOAz6ThZZ4xSx8a
         oyZZ7y/JFz5m2cDHGfXPRexoGQ3w9oiff4rzx9S/DiS7zpQI8XjloomK+jaNu3jRI4bo
         EPixSRh0vF1AuEnynbi19ds8c4HOKNdBQQHiFRV22DlQdgcOjiUsD1v/sQ9MZ9m2OmGT
         vIfCySs9mphLhn+VCAUU53WWNulFrdGXpSOq2G2BAsAsOcY5Vu+uKaUAtbRzpbNQDsbe
         sQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVfSAAwbWkIZKDs27gqb4kunEYv7WKvt7bifZTO8yb5bpFQVXgh9CD4rXd2II7H6AnglTu+DTdLJEjGcWu4@vger.kernel.org
X-Gm-Message-State: AOJu0YzkJnKsaenzRhIyFdH85iXwkcjzmRc9kCXq4S5jvpPb7fAyqj7Z
	Ft2cigV+I6szc9ZcMiPO/SQ8//R5P1b9lnvXqihammf0HcCT6dQdnh8vMhtPsLYoNSTvwww7iWO
	wjE/GCUJsf1Dq7hrukyXb72zGnAPQyWO0QkDXxP0KJsX0yVZVeD74guqGkqCwK6NtKGNR
X-Gm-Gg: AeBDiesAD1fA6PytacoyNKRqnve5uSlkI1bR95jhNmbZpuv8Oz9IEi/OCmfX+HwbkHH
	qD2n0kBq+7kdoelWd4TctcuCuIUpXBCcusT1hMd4Jllfd2zUPy6HRsbXqaQOIy/V1G/xno7jfb2
	aJ8VWk2pBWDyH8Fez+3sSp4wzru68N0o1WnsiO/H3zRwUdsHBT8prAXb541O+qwPp40Wnwk2rp1
	QIlWB7zqGYqQAx90ij9Yxv6+H83GJlpoD+3IfZO4in8TQqGjQszjl5rL/2gOPMFfTss1YNht3tU
	AilsPiXiImTELawFM0rwFv7+zAVzsj4f3Yb3EGkVOMXiYy8icnlEPvSWVZN4YD4aKB/oZ3xGRPb
	EDOVlSmuDATP7kxzIEm5KKF0dDX1XUim22VkAR0YKhRj7VxFm
X-Received: by 2002:a05:6a00:12ca:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-82f0c1896c9mr4811749b3a.21.1775846543451;
        Fri, 10 Apr 2026 11:42:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ca:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-82f0c1896c9mr4811713b3a.21.1775846542859;
        Fri, 10 Apr 2026 11:42:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 05/35] irqchip/qcom-pdc: Add PDC_VERSION() macro to describe version register fields
Date: Sat, 11 Apr 2026 00:10:42 +0530
Message-ID: <20260410184124.1068210-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vhd660AkFoOE1Zo9sQt2Loh7Beh1jcnY
X-Proofpoint-GUID: vhd660AkFoOE1Zo9sQt2Loh7Beh1jcnY
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d94490 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VeW31bOOL8eyMvC__NIA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX8LjzBpLMukdX
 QOlis4WKlDqy1TdBrdRJA/V1FnxHPmCDqBxjQXFJ36DkLiTigx8qRe1ayRUMJzZs3p8XsBiwpJY
 GCucSnUcrNCBp4RKmeK6asfGYhaAwHAeZ9V9ClhnJJqWIx/Gi0nQXIsyhIOQSBPORuZg83veNEl
 /BbztwBfqr+wnaXsB6W/V3CAmxMf4tKqt+Xhl4OLz/apBo8f800JeIi52LDnYZvBOOwFEingNba
 bmN5j5ekx5R+8uttfbxFQq21LwBIyeDJ6ImqjjZZJlabpe3gnQRupQPLZ5JlWIUGh2NmHdFgNF2
 WUzdZphu3c94m/qmuMKituEOjq551IBoVECsQJ2SRl4hgdQBf8dWuL5XKMZI+LrePNbi7MGjajS
 piv1pPCg5DG0VWhQMMuG92tSZ+lOQ6XFw+sOEKG2X1wbuZH6yYUFSsNEOY3kptHrXC+kKXDS/LU
 Ft5OohXyV3FlCYsa67w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102719-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65E1C3DB87C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC hardware version register encodes major, minor and step fields
in byte-sized fields at bits [23:16], [15:8] and [7:0] respectively.
The existing PDC_VERSION_3_2 constant was a bare magic number (0x30200)
with no indication of this encoding.

Add GENMASK-based field definitions for each sub-field and a
PDC_VERSION(maj, min, step) constructor macro using FIELD_PREP, making
the encoding self-documenting. Replace the magic constant with
PDC_VERSION(3, 2, 0).

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 734576cdce0c..5e1553334103 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -34,9 +35,16 @@
 #define IRQ_i_CFG_TYPE_MASK	GENMASK(2, 0)
 
 #define PDC_VERSION_REG		0x1000
+#define PDC_VERSION_MAJOR	GENMASK(23, 16)
+#define PDC_VERSION_MINOR	GENMASK(15, 8)
+#define PDC_VERSION_STEP	GENMASK(7, 0)
+#define PDC_VERSION(maj, min, step)	\
+	(FIELD_PREP(PDC_VERSION_MAJOR, (maj)) | \
+	 FIELD_PREP(PDC_VERSION_MINOR, (min)) | \
+	 FIELD_PREP(PDC_VERSION_STEP,  (step)))
 
 /* Notable PDC versions */
-#define PDC_VERSION_3_2		0x30200
+#define PDC_VERSION_3_2		PDC_VERSION(3, 2, 0)
 
 struct pdc_pin_region {
 	u32 pin_base;
-- 
2.53.0


