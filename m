Return-Path: <linux-arm-msm+bounces-91104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHjgAYLSemlX+wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 04:22:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58728AB692
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 04:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 111CC3008744
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 03:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C087431618C;
	Thu, 29 Jan 2026 03:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+Ms+3GB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhYPKEt6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E93033E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 03:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769656958; cv=none; b=UM2i/YZ+r7U68kiX7xqbYfQ9tL3eLS42aeQ/nYf8vqQAgFFRbIqcN3MBakWB9ba1EwkczJT6RZw9CE3iQYph9o8PdBAZ8XIRLrspHDuZFjwpajFpAAaAwM8nsjpxwheD5BhP5do0ZjMaTcVR3piNQLIGb+UjxHh2EX3bb0oafqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769656958; c=relaxed/simple;
	bh=K6xHAGvgu/oTkp0qkaSIMKOft3xeCJMfJ9YElrFUBq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PM9ecQCJxFkVzw4oWPbG9+/ZnhUyP/80cDGlb3NQwP2XijKPWzOSgYB+ksc/IvSc1/2+N/kTdmIXHsV3Z2tSICBsXrO0GfHuYcqqUFBxvCWP8c2xUKhbSGdM36gJo60U7NfzwRMdGnrEmKdsY3hoJKJfNPN2hf/z5hDijF0Bjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+Ms+3GB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhYPKEt6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2otcv1521378
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 03:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EGC6VyU3/KJZdVzczXkLfj
	sqQ9gqC5V6TvXxA7UoqKY=; b=k+Ms+3GBUaK4qeBkSHi9DxqKaczhPGv5bivkP6
	vP6Le9UXyd0vYPLigYwNWB3V5X4mI93nJb+h/Uy8CX6wHl2Ccm/wBqBqYj5HAqTU
	XO1wRMXy2wR8aDhMlgUDeVSEY46IQziGkhFUwbYppj1ycSZygckeFaA8q3KVeg/5
	wlIY1LI9avvtC6w0/6VmKsKjH4LJpJr22iWJLd9m3nHr7XcPIgE7g9kZcNhHcK+F
	QjEk2Ysg82p0Vzhmhxf6ITlMqPKa+C0fj0r5kxSZ0cH1uWL285DnfzUR7AVb+th5
	/8mwkIybMsT5/6czEz8jX2HFUZIFzDLZZXiJMMoiJCH8KjoQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byjxhtndm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 03:22:35 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-124aa710af7so3399106c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 19:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769656955; x=1770261755; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EGC6VyU3/KJZdVzczXkLfjsqQ9gqC5V6TvXxA7UoqKY=;
        b=XhYPKEt659qIRf4gt/nVgR4wK1w5VHX3QRtWum/TlAiFKePIw8GNlghq600MNYBgtS
         ct9DImagRW3TPHSLku1QboA+hg4hyUY6jImQFyp92rgcCFPdswfXTS0cNCXWNlZkGN6w
         N37Ci/KvdS0t+dPLkFJykoOOyVcZDgmkyhshbS/UncSI+wXdoRuDxQ90C6zVD/9HisU5
         GZRbhcFsY5HI2K8CT2kIZrd09Fev8IA4JFxJiYdAxG1Wiwp3Udb1+9hwm4q9Xq00s5fo
         JvQT1ERkHijj/nhxCqaZvhFVkn1Taxf0+XBgSec/PzRkFlEKHweC1w3nyqBq8Q6H1bpR
         D1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769656955; x=1770261755;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGC6VyU3/KJZdVzczXkLfjsqQ9gqC5V6TvXxA7UoqKY=;
        b=qaRfEbLhsNNvTNX2HjnOt6RMYjQ9D4MmResS9IfxwqFWbd35KbQETFjjpEB9SyX9B6
         8gLfhH0KGzAEd5houWUMarN2H4ItVrqhr0ssTdGOasBPhTo0NHje+tS2qzBQecmMM8vR
         caKDqTxr3+5AASytPbYn5BippZW6MDw+EEvzaHRWDIxKTFHhIzSKA62m8lozvZ/wo5DV
         Kaom29LAlpetX7h8I2kNFHYBjSzINbJPV0/Tyl/dJFF0kmTxbX+NmattU7Hvzh8zUH9J
         mjqtjzp9ahJ4FD2JMeaxLGvvAQCre7pN/2sG1bzUAwEc+f7VL9qr0pbzmenfAqWiLYvt
         fq6w==
X-Forwarded-Encrypted: i=1; AJvYcCWL7XlVG8aLIEWWbg1KUOgvoJ6siq6yGE/FzlrNSSRC6YILypcb6qAU7V9Kbk6T00Jfa7ogCDuTwcFpg5Mb@vger.kernel.org
X-Gm-Message-State: AOJu0YyZzuVyRBN4vMgrtFZWxIiY2i6JM8RIbCVrMiuX9ncgcqphsbpE
	prYIufSAsm1MzUCCmNZNb9zR15Zo14jS1oVCqnj/pVSzvsZHmTXT/oqTU46IRKEsRSDu/iCtpFg
	8kykc+prg1OhlDnOnd/wmZE/hYSkZ7YcruD01nfpOPaTugI8lLhgmR5cl4hTPdqDaMhU=
X-Gm-Gg: AZuq6aLpk360t6wk6aBSO4KDPrq7wrL6oD8+fipjWSp63yah/HMOqPU26uHaCg+e7Z5
	qtZWmlo0EEdzbTN3DdKgV10anUpkNlrEOrVRfrfUzPdPEsXPly5vP78ac991RjRbIDhcVemon2a
	ZuQphsWTq/GMO0E1BSXFf0tfq30rJq5wvmOcN+i0MVyR2LYETo+0xHu69/MufO/6NCOZZ9DfhCM
	QQ41zv+KAR2z97xWT0tpu0BmzVDJcdRJNdwfZsxedt9S9ydYnkbyJmRjEVBF+qyhaNuq6y4sAdz
	WzNyEG09OGdVpMfm+/PsPdWOn1FkBBKqsGbr+T5kuYt7BO+2c1sfr9QIWUdsfIR16bxxBorTuzK
	5GWfl5YF46fIR+YpBvpm3ZxQ8OXn3hSU40zMnIN8IDksGAmm6y9SUPfPfenbLGUQIVGja
X-Received: by 2002:a05:7022:41a7:b0:11a:f5e0:dc8 with SMTP id a92af1059eb24-124a00aeb09mr3570772c88.28.1769656954825;
        Wed, 28 Jan 2026 19:22:34 -0800 (PST)
X-Received: by 2002:a05:7022:41a7:b0:11a:f5e0:dc8 with SMTP id a92af1059eb24-124a00aeb09mr3570755c88.28.1769656954128;
        Wed, 28 Jan 2026 19:22:34 -0800 (PST)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efd3b8sm4740532c88.17.2026.01.28.19.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 19:22:33 -0800 (PST)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 19:22:20 -0800
Subject: [PATCH v3] tee: optee: prevent use-after-free when the client
 exits before the supplicant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-fix-use-after-free-v3-1-b0786670d927@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGvSemkC/23NwQ6CMAwG4FchO1vCBnPoyfcwHgZrZYkw3WDRE
 N7dQWLigUuTv/n7dWYBvcXAztnMPEYbrBtSKA8Zazs93BGsSZmJQsjiWFRA9g1TQNA0ogfyiFA
 T8UYaaZSqWDp8ekytDb3eUu5sGJ3/bD8iX7c/Tu5xkQMHrQojyoZIVPXFhZC/Jv1oXd/nabBVj
 eJP4mpXEkni1JAmbOWJqx1pWZYvLNZWAgUBAAA=
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Michael Wu <michael@allwinnertech.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: lrRTC1nZc372iG4TylqKsg369dlIh-K4
X-Proofpoint-GUID: lrRTC1nZc372iG4TylqKsg369dlIh-K4
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=697ad27b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6MCoFBzevOMPZS9IYwYA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAxOSBTYWx0ZWRfX8rQrGiOkkVwF
 eS3o3T5lW3RkJ392PBZQevNkRKfhogZC+RTWxAdnQLc73eRR4J3mG6Iy4AvLwoB5lNh+C5L5iCT
 fWYA2+IrbIPK3hTVy3xC44LtSGBfiydE92qSbGpj4dUxxqfPD/zRIYEOs4FU3Wp34dqXovyyfRh
 Wo+8dkGvJjnfWbmqqXHpqyN0oJR7cqlXIgApURCxoYPON7abaHkJ2ONXzuABOHQoql2FhrhBfgR
 iCJ52A/jmRmiOA9z/QRdEpo+MJw75xpcsEqvP1SJGS8JsF5CpYlelwLEMmW9wcK8QPKbXg/7rAC
 /aCF42HCQqJW3tw2s9t9uDqUc9n3ouPB11K48B5pOEMQ6TLwNdoJ3zJN8nBidHcdeEyiYtp/cvQ
 opOaWAKWpDVRhQ/uzp//80/2sz/EVOmAlEZbXb7fM7uzfwmKgtJs5VMGn/Ap8sdnRTOxGxZgRzp
 5OnPySOvhR1HOCTsE3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91104-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58728AB692
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
 drivers/tee/optee/supp.c | 122 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 86 insertions(+), 36 deletions(-)

diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
index d0f397c90242..0ec66008df19 100644
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
 
+/* It is temporary request used for invalid pending request in supp->idr. */
+#define INVALID_REQ_PTR ((struct optee_supp_req *)ERR_PTR(-ENOENT))
+
 void optee_supp_init(struct optee_supp *supp)
 {
 	memset(supp, 0, sizeof(*supp));
@@ -46,6 +53,10 @@ void optee_supp_release(struct optee_supp *supp)
 	/* Abort all request retrieved by supplicant */
 	idr_for_each_entry(&supp->idr, req, id) {
 		idr_remove(&supp->idr, id);
+		/* Skip if request was already marked invalid */
+		if (IS_ERR(req))
+			continue;
+
 		req->ret = TEEC_ERROR_COMMUNICATION;
 		complete(&req->c);
 	}
@@ -102,6 +113,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	mutex_lock(&supp->mutex);
 	list_add_tail(&req->link, &supp->reqs);
 	req->in_queue = true;
+	req->processed = false;
 	mutex_unlock(&supp->mutex);
 
 	/* Tell an eventual waiter there's a new request */
@@ -117,21 +129,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	if (wait_for_completion_killable(&req->c)) {
 		mutex_lock(&supp->mutex);
 		if (req->in_queue) {
+			/* Supplicant has not seen this request yet. */
 			list_del(&req->link);
 			req->in_queue = false;
+
+			ret = TEEC_ERROR_COMMUNICATION;
+		} else if (req->processed) {
+			/*
+			 * Supplicant has processed this request. Ignore the
+			 * kill signal for now and submit the result.
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
 
@@ -153,8 +184,8 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
 		return ERR_PTR(-EINVAL);
 	}
 
-	*id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
-	if (*id < 0)
+	req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
+	if (req->id < 0)
 		return ERR_PTR(-ENOMEM);
 
 	list_del(&req->link);
@@ -214,7 +245,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 	struct optee *optee = tee_get_drvdata(teedev);
 	struct optee_supp *supp = &optee->supp;
 	struct optee_supp_req *req = NULL;
-	int id;
 	size_t num_meta;
 	int rc;
 
@@ -224,15 +254,48 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 
 	while (true) {
 		mutex_lock(&supp->mutex);
-		req = supp_pop_entry(supp, *num_params - num_meta, &id);
-		mutex_unlock(&supp->mutex);
 
-		if (req) {
-			if (IS_ERR(req))
-				return PTR_ERR(req);
-			break;
+		req = supp_pop_entry(supp, *num_params - num_meta);
+		if (!req) {
+			mutex_unlock(&supp->mutex);
+			goto wait_for_request;
+		}
+
+		if (IS_ERR(req)) {
+			rc = PTR_ERR(req);
+			mutex_unlock(&supp->mutex);
+
+			return rc;
 		}
 
+		/*
+		 * Process the request while holding the lock, so that
+		 * optee_supp_thrd_req() doesn't pull the request from under us.
+		 */
+
+		if (num_meta) {
+			/*
+			 * tee-supplicant support meta parameters ->
+			 * requests can be processed asynchronously.
+			 */
+			param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
+				      TEE_IOCTL_PARAM_ATTR_META;
+			param->u.value.a = req->id;
+			param->u.value.b = 0;
+			param->u.value.c = 0;
+		} else {
+			supp->req_id = req->id;
+		}
+
+		*func = req->func;
+		*num_params = req->num_params + num_meta;
+		memcpy(param + num_meta, req->param,
+		       sizeof(struct tee_param) * req->num_params);
+
+		mutex_unlock(&supp->mutex);
+		return 0;
+
+wait_for_request:
 		/*
 		 * If we didn't get a request we'll block in
 		 * wait_for_completion() to avoid needless spinning.
@@ -243,29 +306,10 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 		 */
 		if (wait_for_completion_interruptible(&supp->reqs_c))
 			return -ERESTARTSYS;
-	}
 
-	if (num_meta) {
-		/*
-		 * tee-supplicant support meta parameters -> requsts can be
-		 * processed asynchronously.
-		 */
-		param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
-			      TEE_IOCTL_PARAM_ATTR_META;
-		param->u.value.a = id;
-		param->u.value.b = 0;
-		param->u.value.c = 0;
-	} else {
-		mutex_lock(&supp->mutex);
-		supp->req_id = id;
-		mutex_unlock(&supp->mutex);
+		/* Check for the next request in the queue. */
 	}
 
-	*func = req->func;
-	*num_params = req->num_params + num_meta;
-	memcpy(param + num_meta, req->param,
-	       sizeof(struct tee_param) * req->num_params);
-
 	return 0;
 }
 
@@ -297,12 +341,18 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
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
+
 
 	return req;
 }
@@ -328,9 +378,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
 
 	mutex_lock(&supp->mutex);
 	req = supp_pop_req(supp, num_params, param, &num_meta);
-	mutex_unlock(&supp->mutex);
-
 	if (IS_ERR(req)) {
+		mutex_unlock(&supp->mutex);
 		/* Something is wrong, let supplicant restart. */
 		return PTR_ERR(req);
 	}
@@ -355,9 +404,10 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
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


