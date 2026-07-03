Return-Path: <linux-arm-msm+bounces-116351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bQFcNFDRR2rifgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:12:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400A703BE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:12:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nPysxJXq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fqxXtVR3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116351-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116351-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51187301BCF7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CA8414DF9;
	Fri,  3 Jul 2026 15:08:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D52414DEC
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:08:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091318; cv=none; b=gPBuC2JdkSVaUnjL69Yw5PR2UruYXVTwJUGTukfDL4APBuLYMfaTfB1k+I0h1xBFtvfOfD3X2fu6Ue3pMyTvbCh3pvromztjabbKBH3/DqM5GjXEZpa3+rjjgOOqbrwt5XTHQMilCVddS/L5SZWzgO5xCCzCNLLdIoyzMD//HvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091318; c=relaxed/simple;
	bh=SLKzc36ANlrTJ4UXlcsIz09mjFA5+gvF0IFn1cNkn98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VzVfy/UurRvolLcR4emRF+3Y8mUAuVLcpuZuBfqy9QZqk53H8RNvcC1UqJ0TTxWMzCRgRQ/qUxlwE/BA12tQKAGJOEYIqKrG9UB+0de41HdUOc/RgbORVm69s6wITkPnI1zTIS7xqiVUESdJQlkfqe0BNtamztFc8LA5NrFm3qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPysxJXq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqxXtVR3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663C7AlB3053416
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVG18AWi/7GZcB3iujp48a4REfVXmT1WDFQauOKLraY=; b=nPysxJXq1ISRuwU9
	P2PC8iBK5waFLilC4+WmGC5SzHiWxW+A9Bm4VK5fhPi0CY7uZ2A+rJasK+Zo2DyI
	O/YOCB7rNMHvCWGFf7GCTA3YbM5ywR0lvSAlDCAfc6iIbGQrvgcct2YsHDvSHT5u
	Bu0fwLZJzPYsr41RjJvTxN4Ahtg92hoqHdNNUAoDNwHh02JKOm5iz5to8wmaKUah
	tq1ASDyN7E7x4+QJJEBuXSLhHNxbZGf4yzoev/WydYbZY5olQiSlMDG4oeoqbu3H
	5BBRt1c8y7ROp1lpFkpYVIy/Hmd1CILkrckidVAYupNXFKPxyqv5Izvek7eboCXZ
	k8r13g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j01y3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:08:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810fcd9adbso1056473a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091313; x=1783696113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVG18AWi/7GZcB3iujp48a4REfVXmT1WDFQauOKLraY=;
        b=fqxXtVR3wk2iVwu9WknZ2TEjtbbH5DXKpw2febV+vZE/WkW5TeLVLcFDgn+1RZG/ju
         vf9bhLuvZkYSeHHc/NAONbs/Tevnmcee8uFaALq0dmhRV5yHVJnusCuuvPmvOS0wVCVX
         eZEt5FwSat59XS8VJMmyQqoq+KKZU7yFiAOfj7Oow6LAHuGTDwI0Z1jn/fEmmiOyOeFp
         bAlTvuj69zjspknteOTip3ua5VItKsNu3/X6IACnuSoMYImlntAORbE6I+BTAaeB0CBC
         CrvHponqp5MXAuKrsXRkzzmBLNIw2msKQXOYO1aXRwcl0iPckDBdqw49hIaFnu3iDSn6
         LUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091313; x=1783696113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AVG18AWi/7GZcB3iujp48a4REfVXmT1WDFQauOKLraY=;
        b=Dup0/MUv8naw2KmENN/hXfuyM8eNYxYPObxDEVbPZT3K5Eecf2INWoB56YOfwh+B6Y
         QVMazl0Xx/zsPrtqUBG/H17ru1/kSviCcMru17iiXL2pBcqbYuJIigaTp1eBLFVqsLoq
         4tqfbbtpTlwy6w2ux6TKvZy7lavLCsYfz1Uzp45mLap4XCnv6Ibjnpn3L+w2CuQD394L
         mZKsJEDP0H4UXHgSd1+ZzNu0MD/pZZbdy5h+djNpYdElS6Zkm206teusCym39kttxDjK
         hfjEQutAlgmBzWkMTWtJRXQYCDpNyXaCh9W93J96ptLVWHH3GVz3v8wNZXpJ+1mtovGg
         ru0w==
X-Forwarded-Encrypted: i=1; AHgh+Royl05A3msFcxhVdAgrMpUPtrFrX4YTo52L3nn0mzootsIzg6yZrx66qA1aHgK2dkklLU2dYdfZvgX688wq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6xL9ds7IXJkz2sgwWdn27woejriznqjwyKlRCMPbiLrdPk634
	vdaWkGsC/0cpVzMLKnlegRkADUJW2ktK5/lGvmp4WvpaNsw+C2o18YGROKY8MtaaGNV8KSdmxeZ
	4U3Y1Ql2CnFK3AsXfEUL+/78sssWouefNW2q9hONuTxbP8wV2thmqIiFMgyDzflB9fZx5
X-Gm-Gg: AfdE7ckTTGvTBl2ymsrIBp+Snt5cqnlfeVpeVBB1v3/inAY8VBieKhXxgS88cCsHSil
	g0cqmFBx/O1Wp21EJXl6QyGAM96slHDxfFshNSPQ4WniNAXLNCaQJsxCGzrxeahH29zXuYPDVxp
	Z17iKgjxIAtuRlN/RfbrKbgTwuxg2Oy0Nl6wHnjONdqZ1skseI16ZYJ04Er1iyf0YfSeLxgQegs
	uGEfSO7+GmITkX8VLsp4x2L31sUkA1/7XE7X6h0sXyrDZhlCwZPAr0iy5B/TDmfn6pBUmX5VBvt
	3hBQaiPGxRxtxA8CvZPh2YsTFl6n2kv4ENPVDOE2//CIBha7VlnAeVv96A5gl5FBq+3/ITk7KBs
	uwhAiW+6EIjCWFJJtKiuWqChPI7kpBxksRdCxVEBnKFHZ
X-Received: by 2002:a17:90b:4c07:b0:380:7d9f:81f1 with SMTP id 98e67ed59e1d1-380aa098483mr11495577a91.3.1783091312870;
        Fri, 03 Jul 2026 08:08:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4c07:b0:380:7d9f:81f1 with SMTP id 98e67ed59e1d1-380aa098483mr11495518a91.3.1783091312156;
        Fri, 03 Jul 2026 08:08:32 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm37007808eec.9.2026.07.03.08.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:08:31 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 20:38:10 +0530
Subject: [PATCH v2 2/2] i2c: qcom-geni: Add trace events for Qualcomm GENI
 I2C driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-add-tracepoints-for-qcom-geni-i2c-v2-2-e8bf8b178290@oss.qualcomm.com>
References: <20260703-add-tracepoints-for-qcom-geni-i2c-v2-0-e8bf8b178290@oss.qualcomm.com>
In-Reply-To: <20260703-add-tracepoints-for-qcom-geni-i2c-v2-0-e8bf8b178290@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783091297; l=2744;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=SLKzc36ANlrTJ4UXlcsIz09mjFA5+gvF0IFn1cNkn98=;
 b=BbTVYqz5bGt9wh4r4Hh2lALYtRHB9DlCQjB3Kn9E6j0DgfJLpHUnGcX4xVbKeyo0TT1r2Rh2p
 I8ATEYBIqkjBldCmObXaMUJOR3nHbQoRwIKWiId5ygTGWHIYb4r3M0D
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: ETMGHdlLBrq_d2n6kbl6feJyly_nbzlD
X-Proofpoint-ORIG-GUID: ETMGHdlLBrq_d2n6kbl6feJyly_nbzlD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX1N6K+7vp4/Pb
 WdHZds2tKu4mZ0Iq/LRdxL2O3LrzDTwxJsRWO055Rxzlmr67IIKHwujv2oGDUWvt86O1zUlSOuj
 ubD8YPk4SzKbjx1cGE6YzmGh8SKUldI=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47d071 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0MkepCNd34v6RWspawgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX2rgcutVqzHyN
 /OqcWjulEzI3QbSa+7Hk1V/ELEp6xrWSl7LHfmQYnEc9E7JToLxscYKMQQXPYDSTiFnzB2DG2gn
 2Chthd7u3JwDF23Uw5zFquTotzIXtzbN4KeFqNOKk/NmtGEL0zUvFyWSbUPEc+jj/L2oWKVpEle
 ShZVCjJxCouhHIcrR+PlwQ5P+YH3rnl+D3hkYw7yrQ6871lqAWawfk552N5Wq5YHCjWfpFAjIR8
 HFnhfQEol0gtTjd30eoJbfoNqIE0waHo4buF34GQ6QpDt7WYvbIPCFQwZ+zCF4z7SeNn8BRHSAq
 Jd8V7dYGfadW9RdQowtiuDRCw7FnB67S9CHE5E8fAMWV1aj05IpuU6ApJFFLV1tljL21W0Hk2wp
 bzXpUHBbsNdd2sl3TdUgCDBYfZkl7ruiC4GvH8pwDBwOOea/ao7kK2sTS5QvndebbJVh1SqjMZH
 cu4MDc5432lNgRPVZDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116351-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3400A703BE6

Add trace event definitions for the Qualcomm GENI (Generic Interface)
I2C driver. These trace events enable runtime debugging and performance
analysis of I2C operations.

The trace events capture I2C clock configuration, interrupt status and
error code and message.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..3227fab6d76e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/qcom_geni_i2c.h>
+
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
@@ -219,6 +222,9 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
 	val |= itr->t_cycle_cnt;
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
+	trace_geni_i2c_bus_setup(gi2c->se.dev, gi2c->clk_freq_out,
+				 itr->clk_div, itr->t_high_cnt,
+				 itr->t_low_cnt, itr->t_cycle_cnt);
 	return 0;
 }
 
@@ -252,6 +258,8 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
 		dev_dbg(gi2c->se.dev, "len:%d, slv-addr:0x%x, RD/WR:%d\n",
 			gi2c->cur->len, gi2c->cur->addr, gi2c->cur->flags);
 
+	trace_geni_i2c_err(gi2c->se.dev, gi2c_log[err].err, gi2c_log[err].msg);
+
 	switch (err) {
 	case GENI_ABORT_DONE:
 		gi2c->abort_done = true;
@@ -288,6 +296,8 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 	dma = readl_relaxed(base + SE_GENI_DMA_MODE_EN);
 	cur = gi2c->cur;
 
+	trace_geni_i2c_irq(gi2c->se.dev, m_stat, rx_st, dm_tx_st, dm_rx_st);
+
 	if (!cur ||
 	    m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
 	    dm_rx_st & (DM_I2C_CB_ERR)) {
@@ -788,6 +798,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	peripheral.set_config = 1;
 	peripheral.multi_msg = false;
 
+	trace_geni_i2c_bus_setup(gi2c->se.dev, gi2c->clk_freq_out,
+				 itr->clk_div, itr->t_high_cnt,
+				 itr->t_low_cnt, itr->t_cycle_cnt);
+
 	gi2c->num_msgs = num;
 	gi2c->is_tx_multi_desc_xfer = false;
 
@@ -895,6 +909,7 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
 		m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
 
 		gi2c->cur = &msgs[i];
+
 		if (msgs[i].flags & I2C_M_RD)
 			ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
 		else

-- 
2.34.1


