Return-Path: <linux-arm-msm+bounces-92395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNvfK6WdimmuMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:53:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBBD116865
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0344302C09A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A702E4263;
	Tue, 10 Feb 2026 02:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKFN8JjR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jW79TEZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD452E339B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691680; cv=none; b=mbUU1pkT9jeJMhDS40+HIS5Flbuch/EzRAfDmOuCNdSVeQhSIyVyZUt44eH8/8shiJQWjqqFEzL/O8otqTV5Jhffbyo/b/jhY1w/Uad4iqVR/gMVcaHWWKVr9C8inb7hF9xTPisBSTJnvv5CQXr3NwSO4NGV0jDbB5eTknwV/5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691680; c=relaxed/simple;
	bh=h+JnRI8smI0eCXdUK54XyM6HFxQxQx3HmRZnOYLL2xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XffqaDnNadxDECCGlG++Pv9YVD++SDetMjFs/tl/9ED6ErpOTIyZziJDO19bojQO0ndcogajbxU023fxSvJiveH1TM5uqq95E0exnH+Qex7JImVKpmR96WVs19/1w2n/gbj+UNRBv2avcZfZQQtBkW5ExGXBoHpU/rxbTSEmKTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKFN8JjR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jW79TEZz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Ld7wQ441723
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WobcuadDUEwcwFCrS42OUs
	ld9H6nDDwqCccmcCmcFak=; b=dKFN8JjR4ee1h6sLwKH52X07CVFZGI4SOdqesK
	8GMrswRp1to6tHFf1sTMpefWSu7E1aZZCkj/74SyZLJ6ZPn0COz9D519RiUAlKRl
	mGkhsXdWvLN3Bbj98pZOzqKqUxY4D2pbnvcPhi/EQI+dek2PIVMr2Rrl4+pNzFGs
	ZtDwcj+00K9nZHmtPOJdIksVAmCX+cCBlUwqoo1mTTLmD5z9XAzfoYQ2JQreGjFK
	nXJAgETqqkQr71moZzggR7tfGvjwdynf4Bl3l3TgVQ4as+DsWnRMKQbRZqCgeJhU
	iKV+NTyP1SobnlaAboVe4m/sGTgThGnev8+UmAv8EQvOataA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7qp9guae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:47:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba87c0e198so336679eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770691676; x=1771296476; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WobcuadDUEwcwFCrS42OUsld9H6nDDwqCccmcCmcFak=;
        b=jW79TEZz9EFdQ/tdS7qW3ue4H4nw3npaVj0wcp32arHmgINm6Ci4T1T1orGlcok8N6
         ztbVA4L4Atrgy4Sa4445D84eAfDmFUHcThaX5HVL19CN71qSF47vgg70mvn8R8Axt7U8
         VGb4r0k24Sb39yzr23ejrR/fix02PRqO4Vu7sSP5jV6uHEE753jHieZEKFIjsD+Wcf6l
         JAy4mOV922oJkqH8jUPGunb/2SI4t4G0Tjie4xgfjqS/K8+53PT3I76qVPi8Op+72zxY
         JDOZw171lDTYnkDiWfKKdc6EKrT486QxKnbtbMOep8QngZVIiJTEc6JL+ZOLJjGx/H+n
         NCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770691676; x=1771296476;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WobcuadDUEwcwFCrS42OUsld9H6nDDwqCccmcCmcFak=;
        b=VyE+HMbn9xGRSacJzrsqIzWwXe2OE4aMUMpCmh4snmNXEnujvmaBbN+tOjW0vJVApO
         cPPG1QW+J4J5qmSYNgESSArk+fhMN53VJBVqZ3xm4LK9JpCk/Dzi3yI4Y14Ga0hkMJXq
         rp9ULiP3lUpc3wJl97Dl0WRZ9gR7wFFyq7CHTQWtAQHLQJXXPEq3s1Pt7/hlboCStPz5
         H7J6DRsvvPqX5hL5/Med/T4uryr97u7S7yEm1dmNCDUrE9ZgfudwBwmY7RcqPfJwtqbJ
         xG4nqQQMuiEDZl9446VnirfAmH6tMAdmTgAqfO1thwlrVDwg0xRYxBp5bv8wAs1DF0LC
         TW9w==
X-Forwarded-Encrypted: i=1; AJvYcCUBrLp35PZ401JdLoHSLHXy5nPGQ4rdEnCbE3pu7/mumpIf02KO4CWf4cUOSwxSeGlxiTfs+PpnOEOU+l+V@vger.kernel.org
X-Gm-Message-State: AOJu0YwOi10RfYimmqtO+SC2c7/Nf2l9kGu0WqsUH69fpmDnJjeqB8VI
	Un5yq3y3odnC2OdIgbZyTONRN2qKab4eHgz5xvXV8QYBY4jIjS4xZt0QwPJJiqqWEwrcJ04Vw6N
	2Sw+xxfUdQfTrn52pa8DULtQG3SzTe7L0JUxigCBa/r6VeU8vMiKeAkKMpkgZLBMqE/E=
X-Gm-Gg: AZuq6aLqHZcDN+OEg5HJl1irT0jUZK+XZPk24w8JaXtSkyA33Kyw8iQ+Vz3O27U0PuY
	5esU9WVYygwhs4i7wZ8dzdU9vtVGt4mXrvz1zUwAIuiLPjTzgqb617IC2RC57U7Myppy0rx53s2
	XrVzOX5g0NFL/My8jdmUNlf9fvIExDTBqzNKroV0+PO74r/rGnmGLEtjVNAG99nyt3sXSPxI2DV
	Gi30Y8kxCzUqqKu6sSt3ugoJOqXyqQW+k4sc+o8LTK6SjZz8aPYBHyAjW3b5Adhgp+UOpwoMBI/
	5Iowmi2ZC4CHX6LtyVPLgFsbHgPojbThagAA8RXlG06EAHhw0OamqLia/vCeSTV5foKk4Ooz0qv
	NKtyrfQWsS7c/6jDbjQwq4oNOycjcDf4X1uQfg7YI0lKsOY0Or/ERMs+CR/MQe+tf1TEAVzdrot
	Sud2SS
X-Received: by 2002:a05:7300:570d:b0:2ba:7a5f:9e54 with SMTP id 5a478bee46e88-2ba8a867c13mr300243eec.42.1770691676142;
        Mon, 09 Feb 2026 18:47:56 -0800 (PST)
X-Received: by 2002:a05:7300:570d:b0:2ba:7a5f:9e54 with SMTP id 5a478bee46e88-2ba8a867c13mr300221eec.42.1770691674894;
        Mon, 09 Feb 2026 18:47:54 -0800 (PST)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c8a8f6sm8673747eec.32.2026.02.09.18.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:47:54 -0800 (PST)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 18:47:39 -0800
Subject: [PATCH v4] tee: optee: prevent use-after-free when the client
 exits before the supplicant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-fix-use-after-free-v4-1-7c4c4b02368f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEqcimkC/3XOwQqDMAwG4FeRnldpq7W6095j7FA1mYWpW6uyI
 b77oiDs4C6BPyRfMrMA3kFg52hmHiYXXN9RSE8Rqxrb3YG7mjJTQmmRiZSje/MxALc4gOfoAXi
 OKEtd69qYlNHi0wNNbej1RrlxYej9Z7sxybW7c/qImySX3BpRq6REVGl+6UOIX6N9VH3bxlTYq
 k7qR5LmUFIkSSzRIlS6kOaPlOxSJqTKD6WEpFKYPMvosUIdScuyfAH8G67RTwEAAA==
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Michael Wu <michael@allwinnertech.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: Z6vCBnWglfswFlTITrD4Z3LShxyVTD-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAyMiBTYWx0ZWRfX3f9z5Qqeegzc
 sUsNTFELxGqcjxSn6+J6c4D5g5a0uE95IOr4QWmJt/lbOs2YYmHE3mL+lbVphHxLxOdAFRuqb5g
 OkIclNBJHD1DnuZp0d5DYulW6HT0NbyTLn1Sed5bv8M6CM++rM/SVI5p0TJSYpcaKrq0tSydeen
 N6ufh1sIRcSClgmouxy3SJTDUuPwWQQCXvnsDv8S50KGTv26kA8WFyNR/n4hWpg2kz81OB1KC8C
 5u0XRhvl1279jKM4nVs64ONauCWYRfRqz7mb5gq5/8Evfpdb4UFFj2A8Jo+vyjBGXWMJzMPMGLh
 hSub78V2Lg6gPva1XUWN55oq/TpW5NU3CnWT3ZD/UP/fqvIZPJfSxmfRSlIKo4kKIQ5uwPygqY2
 vztUWBveGA8D6+DdSSKJJa9vJi5bPLXwodBNn0kYtknHzGuMKAN6lCSiXlwOeD/z+/HeaHsBjF9
 TfYIR3ex9KC4rpaiUYA==
X-Authority-Analysis: v=2.4 cv=dP2rWeZb c=1 sm=1 tr=0 ts=698a9c5d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6MCoFBzevOMPZS9IYwYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Z6vCBnWglfswFlTITrD4Z3LShxyVTD-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92395-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BBBD116865
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
 drivers/tee/optee/supp.c | 106 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 73 insertions(+), 33 deletions(-)

diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
index d0f397c90242..c1ae76df7067 100644
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
@@ -93,6 +102,12 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	if (!req)
 		return TEEC_ERROR_OUT_OF_MEMORY;
 
+	req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
+	if (req->id < 0) {
+		kfree(req);
+		return TEEC_ERROR_OUT_OF_MEMORY;
+	}
+
 	init_completion(&req->c);
 	req->func = func;
 	req->num_params = num_params;
@@ -102,6 +117,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	mutex_lock(&supp->mutex);
 	list_add_tail(&req->link, &supp->reqs);
 	req->in_queue = true;
+	req->processed = false;
 	mutex_unlock(&supp->mutex);
 
 	/* Tell an eventual waiter there's a new request */
@@ -117,21 +133,43 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
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
 
@@ -153,10 +191,6 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
 		return ERR_PTR(-EINVAL);
 	}
 
-	*id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
-	if (*id < 0)
-		return ERR_PTR(-ENOMEM);
-
 	list_del(&req->link);
 	req->in_queue = false;
 
@@ -214,7 +248,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 	struct optee *optee = tee_get_drvdata(teedev);
 	struct optee_supp *supp = &optee->supp;
 	struct optee_supp_req *req = NULL;
-	int id;
 	size_t num_meta;
 	int rc;
 
@@ -224,15 +257,11 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 
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
@@ -245,6 +274,13 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
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
@@ -252,13 +288,11 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
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
@@ -266,6 +300,7 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 	memcpy(param + num_meta, req->param,
 	       sizeof(struct tee_param) * req->num_params);
 
+	mutex_unlock(&supp->mutex);
 	return 0;
 }
 
@@ -297,12 +332,17 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
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
@@ -328,10 +368,9 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
 
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
 
@@ -355,9 +394,10 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
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


