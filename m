Return-Path: <linux-arm-msm+bounces-60430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02EACFB07
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 04:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BFAE1609E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 02:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E491ADFE4;
	Fri,  6 Jun 2025 02:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTeaM/BJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A529A2
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 02:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175314; cv=none; b=nD6Nr8Z0cRDqxBWnDn9/Z7qsALjqy1vDjuyGPBKmxgCXjKp1wJJotnO3+t/TgTHj+tQ6hng1+UduaLcvauKXvVuSN5nsLer2w94nfsAQx0VvVyDoq+mNIudDsET2DvgHf5F0Mlg4NrBHLhYiXDSaYO+DEZdh+KaagN9r26y6gAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175314; c=relaxed/simple;
	bh=RosZNM45h6lNci+HzRHcl1YJXiwH57R3ufhklYa3Tf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MVVnSLSn7lXp1Ujc0cmYWKkhOVteInEN/jDdBxJWQsW2yBt0e19m922yoX4lAHkdvV0Nws4KW23acs8oaeZENMSV7/J3UA+dSLD2H34sHzcn5NYZ9oxZ6OnLoPUuFRur0he+pRdOcTu8lAMOwqFOzEBcAyig2In40Fkoo6Cn4BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTeaM/BJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555J71HG001037
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Jun 2025 02:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GA1aXy5cDaO41/lAJ0ekIL
	EVrQfQeRuMYjktMOiQleQ=; b=bTeaM/BJ3+1M1WISOCryu2qJiqLdQtAm7qZK7X
	Hni00v1UvMq954f7KMa36ePlE9dR8hgPitVpJOCg4Sy2OkRrZmK8+o3WczeBVK0T
	pRkIEaBi1BIy5EJmLH/x1qi9x+gPlZ6b8Qm8upkv16BrYaHE9E/HqLwCmE7N6Dg2
	1wXSpuzg45/SnsZ2fCfty3Z5NcBHZWQHzKyYgnaUQW4Y4o99p5gG8Ax5PqzYjdt/
	BkFkz8X3/B+IZTcuyc2eh2opLTSKXo5QwQNm7F40x/mJKWhkcpg9+Ceg+Q8n9Bt1
	N6YIaoQUuzvZFKxcfd2K6q0hXk2gDIRGGKcNijtIn4hyI7+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s37ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 02:01:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311b6d25278so1589555a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 19:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749175310; x=1749780110;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GA1aXy5cDaO41/lAJ0ekILEVrQfQeRuMYjktMOiQleQ=;
        b=V9B7YCIdYBzzdVCoReIntfailS7mg1JtHCemiZtVUWK1eQBhJl2Mjf0bfKwSVhESUW
         Gg/+ilocnXviE/djRbAF1NlRgHY2xDGHlNvaGUqrQXmQ6I1BchOg5QS0f0VPbiyIvyYQ
         /Ifon7X/fDi+H/Q3ykY1zKndAWqAqFVWclKi9xxrYVf0Yyl1xqfB85DitCst1mvRuEqw
         Rh3fkHlXlPHqUQQSbhq5lNP7zyh1oTEfgmOu4yGZNKM1wZ5dbk6GOKGPM+cQrXJl28tS
         mpKZRB5R/hpGUWSDp8/5qE20NYE6sJvUqBVkhGyJJ36kFK5kaAY/TNmkeiLP4F8GIGwV
         /POA==
X-Gm-Message-State: AOJu0YyDva16cV5chenEWVTBzjcmacHSAUyouOezRRbfOlhtcj9Y4iV4
	wkVXA1lxuaGU8OpsrFUiyWj6cJKCO6qlNXZPjjendHo6BXxJZ5bQ51ma8WuewMFC9YTt+o8Y69Z
	ZgXW8ImFEf3TGHKowQIztAyEGk3s6LlLRAatUY4igohbMQiarvYxovGE1occLbCzQzJGZxN5H7D
	g=
X-Gm-Gg: ASbGncv7ErzyB5IsQJN5N1mR2i7oReqfEruwcvjzgK1eGLndueMBJVutO65ofA/h5Ov
	xwLM+hAKaKf5TIkM9f6562vhKkJl+FLIhTxZEHcCLbswFimZGnM+6EKlVpQLQeTFYL//WVf3t27
	TGCNRTlGUGTD+AjaANU+QMron6i+2WlzCGQDW88fnRxuCW7oFTspfRa4wHl9TbbgXoOf0dgNgCG
	luxkqgC+dm1bI5lt5EYTuN4afHvod5W+OKSQBKBAFp3M23ax2rhVR2HE2NHommMkjVlcgQhE26j
	4BNeikZXwoEQgfUAe92BXGWd8nWWPCk1VelwliMZ3DsO7A/ysY2VLhZwMxJUtlQqZdIs5L0olKd
	kAEJhig==
X-Received: by 2002:a17:90b:5203:b0:311:e4ff:1810 with SMTP id 98e67ed59e1d1-313472c00acmr2446798a91.3.1749175310226;
        Thu, 05 Jun 2025 19:01:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiF3QYisZjv7JTp29LA9QxsRKx5jqhaxgAnNO+DlelsSLtqshOhmaF22ux+jHQIShDOrKYig==
X-Received: by 2002:a17:90b:5203:b0:311:e4ff:1810 with SMTP id 98e67ed59e1d1-313472c00acmr2446754a91.3.1749175309791;
        Thu, 05 Jun 2025 19:01:49 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b128012sm288588a91.32.2025.06.05.19.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 19:01:49 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 19:01:09 -0700
Subject: [PATCH] tee: optee: prevent use-after-free when the client exits
 before the supplicant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOVLQmgC/x2MQQ5FQBAFryK91skQg7iKWPjmNb1BepCfiLubW
 FZSVTdFmCJSl91kuDTqtiYo8oymZVxnsIbEVLrSu9pVLPrnM4JHOWAsBnArUvx88KFpKkrhbkj
 WN+2H53kBOdvBJWQAAAA=
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: JPrwOcNEysaG9CnGJNI9LBpSOrqLL2hm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAxOCBTYWx0ZWRfX8ubhP8lsa/nc
 NexkfWSNa+HzbqbgZ5EHvFDCr4PVHtt/+rlReewUw511xG0NC9d6o43Y73v3Xxrw+vFQ1a+vXEy
 pfSc6OZAWzc/ZxvVI4vziaBJ2mN8d+h8zG68QQtLLGJ3Wf8hrmeVysYpGHxrP6AGUtchOTkf+RR
 UY+AT53nAJoRys040hX3wVkOdH+UxP/S9JUFFDQmN7y7AlRhmhXvk/I/IpklaoAPQpTyQ5nIYk8
 LFNix2JaxxJCCfGimw4K6Q+YrxpEJYklptpasvt5L3eV4fiaEmlpkYxPV8Snv+xcYNUoJpH42Mw
 1n45QbQg9+QbwW95BfE76nVqBdYN0DG7ISj9ZlaKbRbt2ajUFShNNZDRBs6Lf6qCmAqh24pK5gQ
 T3zdBCBvVzktmQLRRDVPpQ9PKIsGQbtz19iRvEkP5fEYbFNyNSnOPb4SmTT9F6grJi15a7lR
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=68424c0f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=BsZwT7xNq_OLigDTsxMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: JPrwOcNEysaG9CnGJNI9LBpSOrqLL2hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060018

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
 drivers/tee/optee/supp.c | 114 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 77 insertions(+), 37 deletions(-)

diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
index d0f397c90242..62c9c75f48a6 100644
--- a/drivers/tee/optee/supp.c
+++ b/drivers/tee/optee/supp.c
@@ -9,6 +9,7 @@
 
 struct optee_supp_req {
 	struct list_head link;
+	int id;
 
 	bool in_queue;
 	u32 func;
@@ -19,6 +20,9 @@ struct optee_supp_req {
 	struct completion c;
 };
 
+/* It is temporary request used for invalid pending request in supp->idr. */
+static struct optee_supp_req invalid_req;
+
 void optee_supp_init(struct optee_supp *supp)
 {
 	memset(supp, 0, sizeof(*supp));
@@ -102,6 +106,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	mutex_lock(&supp->mutex);
 	list_add_tail(&req->link, &supp->reqs);
 	req->in_queue = true;
+	req->id = -1;
 	mutex_unlock(&supp->mutex);
 
 	/* Tell an eventual waiter there's a new request */
@@ -117,21 +122,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	if (wait_for_completion_killable(&req->c)) {
 		mutex_lock(&supp->mutex);
 		if (req->in_queue) {
+			/* Supplicant has not seen this request yet. */
 			list_del(&req->link);
 			req->in_queue = false;
+
+			ret = TEEC_ERROR_COMMUNICATION;
+		} else if (req->id  == -1) {
+			/*
+			 * Supplicant has processed this request. Ignore the
+			 * kill signal for now and submit the result.
+			 */
+			ret = req->ret;
+		} else {
+			/*
+			 * Supplicant is in the middle of processing this
+			 * request. Replace req with invalid_req so that the ID
+			 * remains busy, causing optee_supp_send() to fail on
+			 * the next call to supp_pop_req() with this ID.
+			 */
+			idr_replace(&supp->idr, &invalid_req, req->id);
+			ret = TEEC_ERROR_COMMUNICATION;
 		}
+
+		kfree(req);
 		mutex_unlock(&supp->mutex);
-		req->ret = TEEC_ERROR_COMMUNICATION;
+	} else {
+		ret = req->ret;
+		kfree(req);
 	}
 
-	ret = req->ret;
-	kfree(req);
-
 	return ret;
 }
 
 static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
-					      int num_params, int *id)
+					      int num_params)
 {
 	struct optee_supp_req *req;
 
@@ -153,8 +177,8 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
 		return ERR_PTR(-EINVAL);
 	}
 
-	*id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
-	if (*id < 0)
+	req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
+	if (req->id < 0)
 		return ERR_PTR(-ENOMEM);
 
 	list_del(&req->link);
@@ -214,7 +238,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 	struct optee *optee = tee_get_drvdata(teedev);
 	struct optee_supp *supp = &optee->supp;
 	struct optee_supp_req *req = NULL;
-	int id;
 	size_t num_meta;
 	int rc;
 
@@ -223,16 +246,45 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 		return rc;
 
 	while (true) {
-		mutex_lock(&supp->mutex);
-		req = supp_pop_entry(supp, *num_params - num_meta, &id);
-		mutex_unlock(&supp->mutex);
+		scoped_guard(mutex, &supp->mutex) {
+			req = supp_pop_entry(supp, *num_params - num_meta);
+			if (!req)
+				goto wait_for_request;
 
-		if (req) {
 			if (IS_ERR(req))
 				return PTR_ERR(req);
-			break;
+
+			/*
+			 * Popped a request: process it while holding the lock,
+			 * so that optee_supp_thrd_req() doesn't pull the
+			 * request out from under us.
+			 */
+
+			if (num_meta) {
+				/*
+				 * tee-supplicant support meta parameters ->
+				 * requests can be processed asynchronously.
+				 */
+				param->attr =
+					TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
+					TEE_IOCTL_PARAM_ATTR_META;
+				param->u.value.a = req->id;
+				param->u.value.b = 0;
+				param->u.value.c = 0;
+			} else {
+				supp->req_id = req->id;
+			}
+
+			*func = req->func;
+			*num_params = req->num_params + num_meta;
+			memcpy(param + num_meta, req->param,
+			       sizeof(struct tee_param) * req->num_params);
 		}
 
+		/* Check for the next request in the queue. */
+		continue;
+
+wait_for_request:
 		/*
 		 * If we didn't get a request we'll block in
 		 * wait_for_completion() to avoid needless spinning.
@@ -245,27 +297,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 			return -ERESTARTSYS;
 	}
 
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
-	}
-
-	*func = req->func;
-	*num_params = req->num_params + num_meta;
-	memcpy(param + num_meta, req->param,
-	       sizeof(struct tee_param) * req->num_params);
-
 	return 0;
 }
 
@@ -297,12 +328,21 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
 	if (!req)
 		return ERR_PTR(-ENOENT);
 
+	/* optee_supp_thrd_req() already returned to optee. */
+	if (req == &invalid_req) {
+		req = ERR_PTR(-ENOENT);
+		goto failed_req;
+	}
+
 	if ((num_params - nm) != req->num_params)
 		return ERR_PTR(-EINVAL);
 
+	req->id = -1;
+	*num_meta = nm;
+failed_req:
 	idr_remove(&supp->idr, id);
 	supp->req_id = -1;
-	*num_meta = nm;
+
 
 	return req;
 }
@@ -328,9 +368,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
 
 	mutex_lock(&supp->mutex);
 	req = supp_pop_req(supp, num_params, param, &num_meta);
-	mutex_unlock(&supp->mutex);
-
 	if (IS_ERR(req)) {
+		mutex_unlock(&supp->mutex);
 		/* Something is wrong, let supplicant restart. */
 		return PTR_ERR(req);
 	}
@@ -358,6 +397,7 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
 
 	/* Let the requesting thread continue */
 	complete(&req->c);
+	mutex_unlock(&supp->mutex);
 
 	return 0;
 }

---
base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
change-id: 20250604-fix-use-after-free-8ff1b5d5d774

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


