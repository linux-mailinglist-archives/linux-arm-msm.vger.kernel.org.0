Return-Path: <linux-arm-msm+bounces-116371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P5trCiDnR2pthQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 18:45:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B442970462B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 18:45:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cJY0JdIh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Vqtz6iiu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116371-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116371-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 050113010649
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 16:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D7330AD0B;
	Fri,  3 Jul 2026 16:45:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E3130C150
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 16:45:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097115; cv=none; b=OmaDoz8clVH/W7jBk+rl099ZnvdJi8a95bnZTgvUtgjOF8fxTEfKUkUGKFtNWAyyFKxA7DODnriM0HCbeOijD+ikFVXhFYDMd9IaCiFhndNqX3sRLob+LwRg1EbOgL4SsvwYEfAXwEFoW8AnkP5P87/fSNHvMRW+giihsGMNQIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097115; c=relaxed/simple;
	bh=I0i0/HlHefRK2uY+x7hc90BCsCjQwfXmOJmJtOOooug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgefXgSrUOfrFf59SP6j6980yGPbTxJyTNJEl8YpAn3iryMmqxs8y7fApN6ZnnFcVSEavbW7EnH+D/KreZTV+J4nhG/9qsdCoGlyt4BX+IhE3HDEQML/mWtsa27JEWwkn7Y+A+RPN40SSWkoz8fSYjwRasBdMgVPQBBFDuffKVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJY0JdIh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vqtz6iiu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663GK42S494007
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 16:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DyLuB+89gAK
	AEf/TpDx7Gl2XLUKlCRklIj4JilYn1ls=; b=cJY0JdIhcPl7lGDBvXyyPOf0hab
	NVgBqBtg1Dj26co1yIbZQ8tI9tcyP5ku2zATFvbyUzbcMDcjtL/+jcqduP57Fhc5
	4Q/IA8TIrIaZEPrf6ErP5WhNTKzCPdwjkiHW2V+OWTf6kjG/q2mGKYBLKHel9u/v
	lhEDl2Fqsw9PyaLQBSHH6yBI3aSfTj2BZDaH6zVjbt+3YtW6V72Nx4wBKiySuqAU
	c9qODsE284KBJkVmzRUNICcwtVT+2vq+HMk/JyMvtx2IOdXprs8BY2Xc/t80dr/o
	L/c8/6SW7HOiBNqdL/Qng+35AuKYlawbcrfmIl1B9MleC7lqHGiKLgHfhtQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkgr7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 16:45:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so891067a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783097112; x=1783701912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyLuB+89gAKAEf/TpDx7Gl2XLUKlCRklIj4JilYn1ls=;
        b=Vqtz6iiupSzwMqUEoohsm8SIH2GtNqYHlZ9sO0TvIwcIaTEQeqf5ppW4ov9/qjYPjH
         4NP8b/Gu7I+t+g0Dqfop+8O+P0njduCl8ah+C6wR0b7Yp6Zd/aQBzHeLR8Lel0vhzPjW
         GWvg1Yp9rqabL7i4ZrnUBHeDX743xpGXw0xK2Sgie55ahfXi7D9DUVSR3LGj37ch5/Ei
         KvyXItgKXJ7e99KAOvaJGkZqLslhqT5tCwoumYJKguIOw9dHkLjiZMgt0tUCwTTzjKwC
         S3ld/0TPbIozeOrWghFBHIF+Nh0fIZ1LrNfZ+8KMy3oF6TXdsfg8/ghrgRuFzKo5PhnP
         YegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783097112; x=1783701912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DyLuB+89gAKAEf/TpDx7Gl2XLUKlCRklIj4JilYn1ls=;
        b=e/hHrwKdDGF/h/iKGwnzV7NJhVBnlm06y5uYdV4+oGZdbmLAN2R49uO/4utWlnYQk3
         RNDLIpYIhpbyCzF9Sj1iMN+ZchsS75/podBVC7os0RXZVzYnhIYt5UqnxtQGv6KX/SKN
         PTDEEgM/d/Qr92r8g5QZX14MgNkYRxWNuyCFOcdgm3NjF3fBShNPbOo/Atee1Mknqhxn
         m99QZPDSO5obCoFmAfTesBjAlqLf10ip26OpRC4Xlcw9MsTNz98VB9ACc16gBeA14WiF
         Tkv387IE/ti2faFLC+8pp4QTVxwh2mBLe0HPxjndA/epjB4/NjQAGYUVMIvGgAElYNum
         9m/Q==
X-Gm-Message-State: AOJu0Yxliq+mMynVRCBSXadO6sQx5P6o0hT0OGK0BhW6gk3MYEcPEPkE
	9gEnbAueYOe0qIXQCKvcobcsbsdTYXICcACL0F9MKTu0mud5Ms75t/HROgRwWAGQkGWFuWpHvdu
	y28BYZfKDdOgXdzYBaiYxz4dvDntPg7DWJyEWr4oCbcqs7vEHKCiabi2lMOCIM/eZxych
X-Gm-Gg: AfdE7cmjDaxO3V7+Ph4xPl9hmUGgCab4sXGOhL0QcGF8xiiKgEBtOqBTkHVLayCISFl
	YWhjh7xsko3I/tMcoPi3l37vA2+C+DKjZBL82+Zd92N3/VmFwEjFwRjHBv1ZvXrdMFa7Wn93DUX
	DrB+gCK6RVNFW63dIN62soI/8MNXUMH/J4yangVmceB+2ftNDUKFCMeS4b06SATkEl6X/vo7lHL
	5TB8rTBJ+UBn4cyhvX/0etP4wsI3FFheRWz53XKF8wbNayyBGPLdSpLUrynj+sAoaOsd237bGGg
	0l2t6A8y1eD29/EyUKv8Pj9ad0dK0dEu1F8By2jtHvSizIVXhr0p9pBa3i5ACwttoaLJGe+cyn8
	+9ZTFDPYUvoPc8K5NI8xFhlWqNATmw/FQLknmhQ==
X-Received: by 2002:a05:6a20:72a0:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c01c8d1863mr5116655637.17.1783097111015;
        Fri, 03 Jul 2026 09:45:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a0:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c01c8d1863mr5116602637.17.1783097110307;
        Fri, 03 Jul 2026 09:45:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f38ee1333sm3908984eec.24.2026.07.03.09.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:45:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/3] firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm is published
Date: Fri,  3 Jul 2026 22:14:55 +0530
Message-ID: <20260703164457.4040457-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703164457.4040457-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703164457.4040457-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE2NiBTYWx0ZWRfXyhgHCEWQtZlA
 P/HIAHZQ37T/3lujwIm/Q12jHd5GYgvVu/XUp323Z8Mr/nu1JD8mzu2tIhQ5q6XGFyFxUT+8lkw
 zoUt3iqa4ad+i6FOd30SVJSV2FFpZ29gj3Y1GNMmeaZyFRU2HvDHgDQlTb6aYpz746hm4wFuGbO
 6jInGNX2/boFkolRnZDNFA8lkduUNozOmUHXHlvdGUsyA/AGZkN2wQvocB1hUGtZVRPgl2CnPHW
 cYrKv7mGDmy7npqvEDRL5/oZ0TKa1HJr6xkIec4Op9yyJPVdM+lPDZSiYj84bURKjTzmvn+TZks
 wl8bOIjubQlmKredDk8M9tJ8CeOS9zKC12sORFnzyIt+ZV529ssUTnRlywYI7DdyOGLP85c92rb
 qaYfeI6dhTE8AXwOINKLsaZodItrCfNdc7yhuWpase+JF+pP2KZ66ySgUbCBt8CVM8pMp9QSaxv
 E9fhmhqfjD/Ehfal/vQ==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a47e718 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=oeUS87UVm4c7YcJ927QA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ANUDcaLl1a3BZJQe6YWj-QlFviVjxDOP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE2NiBTYWx0ZWRfX955QUG3ybiIt
 W+npkv2P+0UGjnkWdX1fm5PdirJnbnN7P2ycYOcV7BQmLSYZrm2Pq6WxRMjx3KQ2GAVOuZMX/t6
 s1BxQDLhW5RQJjLuYKM8MC3r4AMzx9Q=
X-Proofpoint-GUID: ANUDcaLl1a3BZJQe6YWj-QlFviVjxDOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030166
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116371-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B442970462B

In qcom_scm_probe(), devm_request_threaded_irq() is called before
smp_store_release(&__scm, scm). Two paths can dereference __scm before
it is published, both causing a NULL pointer dereference.

The IRQ handler receives scm via its data argument but passes only wq_ctx
to qcom_scm_waitq_wakeup() and qcom_scm_get_completion(), which then
dereference __scm directly. Thread scm through both functions so the IRQ
handler path never touches __scm.

Non-atomic SMC calls made during probe (e.g. from qcom_tzmem_init via
qcom_scm_shm_bridge_enable) can return WAITQ_SLEEP, causing
qcom_scm_wait_for_wq_completion() to run before __scm is published and
dereference it. Add platform_set_drvdata(pdev, scm) early in probe and
change qcom_scm_wait_for_wq_completion() to take the device pointer and
use dev_get_drvdata() to reach scm, removing any dependency on __scm.

Fixes: 6bf325992236 ("firmware: qcom: scm: Add wait-queue handling logic")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm-smc.c |  2 +-
 drivers/firmware/qcom/qcom_scm.c     | 22 ++++++++++------------
 drivers/firmware/qcom/qcom_scm.h     |  2 +-
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 574930729ddd..7abe60fce676 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -105,7 +105,7 @@ static int __scm_smc_do_quirk_handle_waitq(struct device *dev, struct arm_smccc_
 			wq_ctx = res->a1;
 			smc_call_ctx = res->a2;
 
-			ret = qcom_scm_wait_for_wq_completion(wq_ctx);
+			ret = qcom_scm_wait_for_wq_completion(dev, wq_ctx);
 			if (ret)
 				return ret;
 
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..464ae3b4ca43 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2630,23 +2630,20 @@ static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
 	return irq_create_fwspec_mapping(&fwspec);
 }
 
-static struct completion *qcom_scm_get_completion(u32 wq_ctx)
+static struct completion *qcom_scm_get_completion(struct qcom_scm *scm, u32 wq_ctx)
 {
-	struct completion *wq;
-
-	if (WARN_ON_ONCE(wq_ctx >= __scm->wq_cnt))
+	if (WARN_ON_ONCE(wq_ctx >= scm->wq_cnt))
 		return ERR_PTR(-EINVAL);
 
-	wq = &__scm->waitq_comps[wq_ctx];
-
-	return wq;
+	return &scm->waitq_comps[wq_ctx];
 }
 
-int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
+int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx)
 {
+	struct qcom_scm *scm = dev_get_drvdata(dev);
 	struct completion *wq;
 
-	wq = qcom_scm_get_completion(wq_ctx);
+	wq = qcom_scm_get_completion(scm, wq_ctx);
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
@@ -2655,11 +2652,11 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 	return 0;
 }
 
-static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
+static int qcom_scm_waitq_wakeup(struct qcom_scm *scm, unsigned int wq_ctx)
 {
 	struct completion *wq;
 
-	wq = qcom_scm_get_completion(wq_ctx);
+	wq = qcom_scm_get_completion(scm, wq_ctx);
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
@@ -2686,7 +2683,7 @@ static irqreturn_t qcom_scm_irq_handler(int irq, void *data)
 			goto out;
 		}
 
-		ret = qcom_scm_waitq_wakeup(wq_ctx);
+		ret = qcom_scm_waitq_wakeup(scm, wq_ctx);
 		if (ret)
 			goto out;
 	} while (more_pending);
@@ -2746,6 +2743,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	scm->dev = &pdev->dev;
+	platform_set_drvdata(pdev, scm);
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cf90a565fdfb 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -66,7 +66,7 @@ struct qcom_scm_res {
 	u64 result[MAX_QCOM_SCM_RETS];
 };
 
-int qcom_scm_wait_for_wq_completion(u32 wq_ctx);
+int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx);
 int scm_get_wq_ctx(u32 *wq_ctx, u32 *flags, u32 *more_pending);
 
 #define SCM_SMC_FNID(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
-- 
2.53.0


