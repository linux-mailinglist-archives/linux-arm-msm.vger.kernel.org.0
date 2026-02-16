Return-Path: <linux-arm-msm+bounces-93016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id u8UaFS2Zk2mI6wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 23:24:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A50147EAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 23:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CAAB3015A5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 22:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48329219319;
	Mon, 16 Feb 2026 22:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aI+TfEt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ez8H/h9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A8B14A60F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 22:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771280681; cv=none; b=spiaxihrXf57xDvk2GpXmdGegCONdmAYiOPC1fmTS0dWC3TEwPTGudl/64/4ANEM9hk2X19sHtBReGDmO4rz/UPbAt6MoTatt143kqo//AFZAHOlvglorlII13zXHpRzkOrpHIeTq10YSVJXusO6A5882w8+aGcQ/igCpih/fNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771280681; c=relaxed/simple;
	bh=sFOj8xX0Q3HGZxZuHG70/L20ZM5XbsUoy5e9awUE1fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KWiVCE46U4duySvtN0a1/LTl+0I/mVM/I5BfLt9GnGw8x6ePEi434BZBIXdIamOxOlYJL2IhnmAQ68dsKBahrIb2B/ivGsc10EGFEMluV9rhwVm4n2eOQqhsaZ8MnVWo3Q6SvCwjn93ycYt8JwDKIW3xwR5owflUICl7bnDHgO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aI+TfEt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ez8H/h9G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GGUGRU1601350
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 22:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kib2rIwG0L/bYr5o7sZjqj
	0oC1MGannDXI1dUWK6gUM=; b=aI+TfEt+ZWR/qxH0EQO3dxKCdVvXR0dVr4Gy5b
	Q5SGtnom04WQbyYgorb0fZ9WTvNmFOjOknUcOOKHXEAZcRmg4Kw/H63OJfwY5spU
	4AcoVQEDrMJxjUARuH7t4wol7aK4HLbCQwApWyxtpJbuo9v8BEBdOtGLt2/vZm2+
	6ehPj8ReD9VYjaUQiG6UPOS++pcynsrbzXIY9ucBK4YmHynH8jw8Zr1LBOiTtG76
	sl83pOtbtrjQ/Flb6VHDdZ987h/jkcrTzFx3GiNR7alJFLtshuCdfUkxtf3bmq1x
	4BWpUrANbzf303ZH4YY1zxeO81tZXx2Dmf2b7DiMxKVvvzpw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tm8m0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 22:24:38 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124a95d580cso61611667c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771280677; x=1771885477; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kib2rIwG0L/bYr5o7sZjqj0oC1MGannDXI1dUWK6gUM=;
        b=ez8H/h9Ghi3SnXaIq7mJ3m0QwZyhmAhuUuuOy4TUskTbC6QeipwRd54QnfxvfFl2YF
         I3GYzEPil0/wdGHkBAwVpFh7M0yKU31u3G6hDdW94XWArFhWnAhVVRSyHgDlEiPvnWS2
         YqPNT2KKwRQLxM73S7kmXvi5hozdJ/IqeQXxxGvCxu7MhnMUDaOx5cYAInh3jD9tYjox
         rb3L09RR2ywNQdEiNSfYNxosTVUHL7vxREyfNg/A1Lcv9RIeo0xc7lHgVFaO+3rXndMb
         PEiZqTTr/jomPhDjltQ4wnHn8qWUe3h5bx7ymHNWF2ixrdcjy8zavjXTG3hdFHknkl5a
         W3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771280677; x=1771885477;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kib2rIwG0L/bYr5o7sZjqj0oC1MGannDXI1dUWK6gUM=;
        b=sqdvtl/WT5SBJKhGpo6/fMSr43vByi1dcbQYNeyVO1tmGq/5UuJN5pqekHmF++O4QU
         +7BtJ4bUDe8boi9iWD2DZ2uK7OpuaWwZoHCHynXg6YWVTD3+rn/6W9r6w3PgsSzHhZRe
         NypR0QerFVPGYmQj/7HIZCwxdTX58s31JLfAPvUkdSo2sQR5F+BJRYfQn4K2Cs8tSVlI
         T6hhbtdOtqCu8xYuDi0tn7qmOsVbYjD4Pj334zRAeC6MFIQS+4DbfJO+RhVpBEXD7y33
         wtXKiVPkLLPXUeY0SeaH4LPmOGyCQZzHRFIa+RyAJUGS+giJWPU8ShnG8fS9n8vxHchD
         1Y2w==
X-Forwarded-Encrypted: i=1; AJvYcCVWiTfBoWpz2QinaFWkZvNmCyjlrsOKDX5MTLwxGqouRAowXOTZcpywuWjH7RtKcsXKPSGHVgziwt0dP9+W@vger.kernel.org
X-Gm-Message-State: AOJu0YwiBBPgyV6kU6Jo7TJxetdrA/sjBGJvRb4bCW3HAIEo94Yr5hvA
	BfUPgPikQr7BcWUxejSjNmmsNuvrVJeg8g19wKcxLvDcdX1wAykpwjHKbAegJknELum7xXNf7e0
	f/XqO2Fbg0mDf3az0OvOuV6VJ4GQMnF0UJpNXYlkq/TW+fFjamcbFAD44dmOP6WqGcLk=
X-Gm-Gg: AZuq6aJBCOtYGTBX+JycxIGXGWTTLbbgddHtazHB+dhwxkqxeCmfaej3yAtLsAZ7kmH
	K2T5/zmeEA89DlU7Xn9rdbRN7SkuBVTSThKWNb/1D9HgevDFgGfo+TRnhMIV5nJ6DYjJqoUI59l
	YqNjnndO4dIbtkWt59Y8uSiBtafzLHQ6StKyMswqRcliL3tYG9WyWn70ffqCx25+KFekvflfEgi
	IK7b4RdXkYxE6PqWsYXm0Ai+/DrwpN3YM/LXg1dFfOp0ArBZ/7Lhi53KT3ym1DoRwpCEM5tOCW1
	DAQTUyD7k6DaYufYOUxjWGbSJvomofqfImRDkVtZcHzO4VNfGq+s3Crcqre8C/6tA1MMBgXgyAQ
	dI7fYtM6qwAXwsr79QKhGRJIBRf6e2gpH6Nz5Mk1R5OH8G7YiLVM56JOVk6L2LkifHCSWdN+3ZM
	mJqvKJ
X-Received: by 2002:a05:7022:6088:b0:119:e569:fba9 with SMTP id a92af1059eb24-1273ae341ecmr6787692c88.24.1771280677139;
        Mon, 16 Feb 2026 14:24:37 -0800 (PST)
X-Received: by 2002:a05:7022:6088:b0:119:e569:fba9 with SMTP id a92af1059eb24-1273ae341ecmr6787671c88.24.1771280676548;
        Mon, 16 Feb 2026 14:24:36 -0800 (PST)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cba118sm14274369c88.12.2026.02.16.14.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 14:24:36 -0800 (PST)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 14:24:06 -0800
Subject: [PATCH v5] tee: optee: prevent use-after-free when the client
 exits before the supplicant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-fix-use-after-free-v5-1-0d6fd12d1f09@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAWZk2kC/3XOS24CMQwG4KugrBuUePKarnoPxCLJ2CVSYdoER
 q3Q3L0GCbWLsLH0W/ZnX0XDWrCJ181VVFxKK/OJg33ZiHyIp3eUZeIsQIFVThlJ5VteGspIZ6y
 SKqIMRDrZyU7eG8GLnxV56o7u9pwPpZ3n+nO/sehb98HZHrdoqWX0aoIhEYEJb3Nr269L/Mjz8
 bjlIm7qAv8k7bsSsKQpUSTMdtT+iTQ8JKc0hK40sJSUD87xYyM8k8yfBGrsSoYln002ScHgAnW
 kdV1/AXHT/HSZAQAA
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Michael Wu <michael@allwinnertech.com>, Yuanjia Yeh <yeh.ooxx@gmail.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: GN3Fh3VAAnQFxo1Th1OF7bkAP-oxaYW2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDE5MiBTYWx0ZWRfX/GYxvGQ/YqAr
 8OhrF69mztHwc9Z4EpmWRiC4j39SOztJ0lOQY3S+Gxzq/SqGMKop2K6y1WX2hyExfxWPNmPg7Pg
 c4dFqcQ5eWbhrfTLRNx7FKUJ4PLB1uZtwGebXktzEyKH6MPz0vJsTxtkgill/B/v7qnDGzKs3vg
 wwJeZNqGL7o+PMVWAHMnNnXpA8OMqFfu9UXOe1D4LfygNkcEzbxCOtv0EdgvKgXH2UcLWBgUhCp
 u5HWe4KczH9aum4ZWziOrEQOQ5b++EOL8EcugYRDlJ6UKPAZlKqUBFyHdcinUdtoVzOvL0b1vKi
 CzidJxl/yAtdeBz+igAAAXPb6JifU3Loyy6ThqW0s9hBx4Bu7rkqYGmFZgDVT0RBC1WSQ2OycAE
 1bY+OoeGlmNxil32tD9yOD6cq2hOAFbIZa2gO/lnwLhBO+eyFSnKK2B8UJN7jx2GSiMGHEm18fe
 gS6y0troJQDf6ZarRAQ==
X-Proofpoint-ORIG-GUID: GN3Fh3VAAnQFxo1Th1OF7bkAP-oxaYW2
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69939926 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6MCoFBzevOMPZS9IYwYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_08,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160192
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[allwinnertech.com,gmail.com,vger.kernel.org,lists.trustedfirmware.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93016-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3A50147EAD
X-Rspamd-Action: no action

Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made the
client wait as killable so it can be interrupted during shutdown or
after a supplicant crash. This changes the original lifetime expectations:
the client task can now terminate while the supplicant is still processing
its request.

If the client exits first it removes the request from its queue and
kfree()s it, while the request ID remains in supp->idr. A subsequent
lookup on the supplicant path then dereferences freed memory, leading to
a use-after-free.

Serialise access to the request with supp->mutex:

  * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
    looking up and touching the request.
  * Let optee_supp_thrd_req() notice that the client has terminated and
    signal optee_supp_send() accordingly.

With these changes the request cannot be freed while the supplicant still
has a reference, eliminating the race.

Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Changes in v5:
- Move idr_alloc() inside the supp->mutex, reported by Yuanjia Yeh.
- Link to v4: https://lore.kernel.org/r/20260209-fix-use-after-free-v4-1-7c4c4b02368f@oss.qualcomm.com

Changes in v4:
- Pre-allocate request ID when allocating the request.
- Cleanup the loop in optee_supp_recv().
- Update the return value for revoked request from -ENOENT to -EBADF.
- Link to v3: https://lore.kernel.org/r/20260128-fix-use-after-free-v3-1-b0786670d927@oss.qualcomm.com

Changes in v3:
- Introduce processed flag instead of -1 for req->id.
- Update optee_supp_release() as reported by Michael Wu.
- Use mutex instead of guard.
- Link to v2: https://lore.kernel.org/r/20250617-fix-use-after-free-v2-1-1fbfafec5917@oss.qualcomm.com

Changes in v2:
- Replace the static variable with a sentinel value.
- Fix the issue with returning the popped request to the supplicant.
- Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com
---
 drivers/tee/optee/supp.c | 107 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 33 deletions(-)

diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
index d0f397c90242..2386bbd38ce7 100644
--- a/drivers/tee/optee/supp.c
+++ b/drivers/tee/optee/supp.c
@@ -10,7 +10,11 @@
 struct optee_supp_req {
 	struct list_head link;
 
+	int id;
+
 	bool in_queue;
+	bool processed;
+
 	u32 func;
 	u32 ret;
 	size_t num_params;
@@ -19,6 +23,9 @@ struct optee_supp_req {
 	struct completion c;
 };
 
+/* It is temporary request used for revoked pending request in supp->idr. */
+#define INVALID_REQ_PTR ((struct optee_supp_req *)ERR_PTR(-EBADF))
+
 void optee_supp_init(struct optee_supp *supp)
 {
 	memset(supp, 0, sizeof(*supp));
@@ -39,21 +46,23 @@ void optee_supp_release(struct optee_supp *supp)
 {
 	int id;
 	struct optee_supp_req *req;
-	struct optee_supp_req *req_tmp;
 
 	mutex_lock(&supp->mutex);
 
-	/* Abort all request retrieved by supplicant */
+	/* Abort all request */
 	idr_for_each_entry(&supp->idr, req, id) {
 		idr_remove(&supp->idr, id);
-		req->ret = TEEC_ERROR_COMMUNICATION;
-		complete(&req->c);
-	}
+		/* Skip if request was already marked invalid */
+		if (IS_ERR(req))
+			continue;
 
-	/* Abort all queued requests */
-	list_for_each_entry_safe(req, req_tmp, &supp->reqs, link) {
-		list_del(&req->link);
-		req->in_queue = false;
+		/* For queued requests where supplicant has not seen it */
+		if (req->in_queue) {
+			list_del(&req->link);
+			req->in_queue = false;
+		}
+
+		req->processed = true;
 		req->ret = TEEC_ERROR_COMMUNICATION;
 		complete(&req->c);
 	}
@@ -100,8 +109,16 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 
 	/* Insert the request in the request list */
 	mutex_lock(&supp->mutex);
+	req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
+	if (req->id < 0) {
+		mutex_unlock(&supp->mutex);
+		kfree(req);
+		return TEEC_ERROR_OUT_OF_MEMORY;
+	}
+
 	list_add_tail(&req->link, &supp->reqs);
 	req->in_queue = true;
+	req->processed = false;
 	mutex_unlock(&supp->mutex);
 
 	/* Tell an eventual waiter there's a new request */
@@ -117,21 +134,43 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	if (wait_for_completion_killable(&req->c)) {
 		mutex_lock(&supp->mutex);
 		if (req->in_queue) {
+			/* Supplicant has not seen this request yet. */
+			idr_remove(&supp->idr, req->id);
 			list_del(&req->link);
 			req->in_queue = false;
+
+			ret = TEEC_ERROR_COMMUNICATION;
+		} else if (req->processed) {
+			/*
+			 * Supplicant has processed this request. Ignore the
+			 * kill signal for now and submit the result. req is not
+			 * in supp->reqs (removed by supp_pop_entry()) nor in
+			 * supp->idr (removed by supp_pop_req()).
+			 */
+			ret = req->ret;
+		} else {
+			/*
+			 * Supplicant is in the middle of processing this
+			 * request. Replace req with INVALID_REQ_PTR so that
+			 * the ID remains busy, causing optee_supp_send() to
+			 * fail on the next call to supp_pop_req() with this ID.
+			 */
+			idr_replace(&supp->idr, INVALID_REQ_PTR, req->id);
+			ret = TEEC_ERROR_COMMUNICATION;
 		}
+
 		mutex_unlock(&supp->mutex);
-		req->ret = TEEC_ERROR_COMMUNICATION;
+	} else {
+		ret = req->ret;
 	}
 
-	ret = req->ret;
 	kfree(req);
 
 	return ret;
 }
 
 static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
-					      int num_params, int *id)
+					      int num_params)
 {
 	struct optee_supp_req *req;
 
@@ -153,10 +192,6 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
 		return ERR_PTR(-EINVAL);
 	}
 
-	*id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
-	if (*id < 0)
-		return ERR_PTR(-ENOMEM);
-
 	list_del(&req->link);
 	req->in_queue = false;
 
@@ -214,7 +249,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 	struct optee *optee = tee_get_drvdata(teedev);
 	struct optee_supp *supp = &optee->supp;
 	struct optee_supp_req *req = NULL;
-	int id;
 	size_t num_meta;
 	int rc;
 
@@ -224,15 +258,11 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 
 	while (true) {
 		mutex_lock(&supp->mutex);
-		req = supp_pop_entry(supp, *num_params - num_meta, &id);
+		req = supp_pop_entry(supp, *num_params - num_meta);
+		if (req)
+			break; /* Keep mutex held. */
 		mutex_unlock(&supp->mutex);
 
-		if (req) {
-			if (IS_ERR(req))
-				return PTR_ERR(req);
-			break;
-		}
-
 		/*
 		 * If we didn't get a request we'll block in
 		 * wait_for_completion() to avoid needless spinning.
@@ -245,6 +275,13 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 			return -ERESTARTSYS;
 	}
 
+	/* supp->mutex held and req != NULL. */
+
+	if (IS_ERR(req)) {
+		mutex_unlock(&supp->mutex);
+		return PTR_ERR(req);
+	}
+
 	if (num_meta) {
 		/*
 		 * tee-supplicant support meta parameters -> requsts can be
@@ -252,13 +289,11 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 		 */
 		param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
 			      TEE_IOCTL_PARAM_ATTR_META;
-		param->u.value.a = id;
+		param->u.value.a = req->id;
 		param->u.value.b = 0;
 		param->u.value.c = 0;
 	} else {
-		mutex_lock(&supp->mutex);
-		supp->req_id = id;
-		mutex_unlock(&supp->mutex);
+		supp->req_id = req->id;
 	}
 
 	*func = req->func;
@@ -266,6 +301,7 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 	memcpy(param + num_meta, req->param,
 	       sizeof(struct tee_param) * req->num_params);
 
+	mutex_unlock(&supp->mutex);
 	return 0;
 }
 
@@ -297,12 +333,17 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
 	if (!req)
 		return ERR_PTR(-ENOENT);
 
+	/* optee_supp_thrd_req() already returned to optee. */
+	if (IS_ERR(req))
+		goto failed_req;
+
 	if ((num_params - nm) != req->num_params)
 		return ERR_PTR(-EINVAL);
 
+	*num_meta = nm;
+failed_req:
 	idr_remove(&supp->idr, id);
 	supp->req_id = -1;
-	*num_meta = nm;
 
 	return req;
 }
@@ -328,10 +369,9 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
 
 	mutex_lock(&supp->mutex);
 	req = supp_pop_req(supp, num_params, param, &num_meta);
-	mutex_unlock(&supp->mutex);
-
 	if (IS_ERR(req)) {
-		/* Something is wrong, let supplicant restart. */
+		mutex_unlock(&supp->mutex);
+		/* Something is wrong, let supplicant handel it. */
 		return PTR_ERR(req);
 	}
 
@@ -355,9 +395,10 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
 		}
 	}
 	req->ret = ret;
-
+	req->processed = true;
 	/* Let the requesting thread continue */
 	complete(&req->c);
+	mutex_unlock(&supp->mutex);
 
 	return 0;
 }

---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20250604-fix-use-after-free-8ff1b5d5d774

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


