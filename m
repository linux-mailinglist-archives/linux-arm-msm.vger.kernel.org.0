Return-Path: <linux-arm-msm+bounces-102443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K3ZCutn12lVNwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:48:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 772DA3C7F23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D065304E0EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590C1350A1B;
	Thu,  9 Apr 2026 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8CnON4u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMc1u06c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F789347BA9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724400; cv=none; b=dJJewhxakcHor3PDb/rHVzN1PxTGsg3W3igZn98JUiXtQMejgZthvnEehIGJ8d9QwMrxihGjkKm8obOhJxYxDZfdINZhfA0phjcZEhCrFxUCo1Qa3ShmiU1FCVDHRg4bNGBs0WH1y5Io9n0sWU7w0NZoPmtNGmONgo4tJCdfKPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724400; c=relaxed/simple;
	bh=LILZ401zz4H4PYaJRtQNOEsPKwxxLyAST3STgzRbi68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIkH6B/qkwE06wYD5xvYdvfnsQ7/xq7aJS3qa+4ouoytDCelgIWujqhiqL9Dw0T2p7suSCQNJ6e3dHRlu17S3o2z3sV5Qzg2gmrEtAJ3p7hQJfA1f1597n2wloR7mWJDSZtQwS1jbZl7NPwR3IoZzWWwBmUPSxDXZ+HcKmzj6Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8CnON4u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMc1u06c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395kSPw1613649
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Irp+xgmj9Ik34RHCahjt5RaucthCedcYg4gNt6nNrw=; b=N8CnON4uIERbWLMl
	w9fK/vSu1ncvMdTgo9FcHm51bTsDYrLBJKpRnN3gPG8jY6B2q3p5pPFmRJ9U5gP4
	zICdkso2gBKmIAVnyn1UpV6/tilCesggfTAxHMN8aGSh2+Rq9+T6rzjswe77C4OM
	9oImUIJ+hhCg2VzoSHZ+jfBM6jZhOBJ7Tp854GLypZBhgdL05AE+Yx+L9akkyqsd
	E0fBlaw7dcT1I9Nf3RqUNEwLHzIgPZe28vdrE/YBblV64N+C4RQTCcjpucozmc7W
	eP9y9n/uU/3Pa7XdtFgewNB98Lgb/b55239DcE4uRrCZ3cGRZZvaZaP5oqVdQ6c7
	V5m/BA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de68v8m9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:46:37 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c283a1212so3181397c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724397; x=1776329197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Irp+xgmj9Ik34RHCahjt5RaucthCedcYg4gNt6nNrw=;
        b=fMc1u06c47erWy7664ZqzsoePxG4gCaW0baXmBkICiHI9nW33LX59tTT4Xk+3Uv99N
         j/59zDSem7JxZ/29jnKSHMuGVGGxh6DiJhUZlSIXDbsT9LwfpXs6vlITTHmTuDXBir1+
         ARX6/z02csIw2PKpOgC0EzpOYpk9kZOQ1OmOec035w8PNCiWyExGlyTYEbx/mTgcLzX9
         Vb3Ylt5oSsNoubeFm/eII195Bq29JuaRRBk9uicn017gHzWkPOfWWPisXo5O1S7iLYUw
         7SAJOI8iUZJeemFyQWrbn2FHV15NEFRmGxa4PN7E96lCB0N+v0gE/E5KNlyFWF6NggoK
         lPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724397; x=1776329197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Irp+xgmj9Ik34RHCahjt5RaucthCedcYg4gNt6nNrw=;
        b=linEdb538xUW/PITLWfwQWf353+NjeqrglYiTTBXPHuhVj1bB34anNQY5EgmYcBZHq
         cUiKvEipWJZTM9RgNGhhZIkM2/rI3p3EZfRg7znSqkV8lWDNNuOvjzvGejBQnuDEFQOI
         I22SttfI1S9wqNt517cQ4UerTt+B4jbCLzQZ3YZEN0LeV4TrFUdihjDe19iYMjNiGYT3
         xee+s6CoHBtcPiT6az7sZyq7/I6cWfvWZdddXn3vevpGw+2Rpj5gOafhMBX+q/kvnnhA
         zN2wQyLFY8O/75XZ8fMDre0HixP9HDKkPVjvuBsLujQgOAPCWwynYWDufG1veCAXNDtJ
         dZRg==
X-Forwarded-Encrypted: i=1; AJvYcCX4u2RKmDOXRVr4IBE3wiBtb6mOxKtHKbvOKWfFPzqPjiNjyrKRZZxKWdYdDNpoGI/gimxsO6aHQnNATbcf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy01EaIvnvRF7ja5puFyqX0Zs++a2O6G3bk8Id5qh2ZGw9iKgs
	IN1VN6rodgquHZtzUC7pg44mFPPDjlYBbRbkMF8pc3LkiOT9H4qgrs06375Dp4n41hg00P0u3RH
	qC/wXvtqVM6PK4WfCumDGgu0XPBxCt07MmawYs6GCG4nOggbmzwhoqCR7y2qX1y8q99Fz
X-Gm-Gg: AeBDietMdQDDwoQ+Ij6YZ+iGxU0EXEq3jad7jVlRDNVt0ESN2+kf3gvYganj3hWBrFJ
	WXZcxDO3ZRhU9HvKF2pZ78+lZvAXD+hi+lzMxq/3BRkIP4O6ALh+aDkvITgREMmp7SdI4gFDn4M
	szvOQjNZxkUlLW0ExDYRBKNLqvBFemGhY6pQr2bHq8C79iWCYUbn6aGaaWUFi6Mi4Ql4p4DIHZq
	jAHr7+ndyK2Mq6xWtCBbkRRnOjvy0BqqXYbYfd4TKATJcUp4j8QnIRsQNizcRS6Kru6LgiSxeZn
	maFgs1ZMLhXNDShLOJFMdhnS5hl5wqcGRAhP/aojDt1dno0yWK7FfnEwMNcMgGX7W8U/i267exP
	ubHTqrmNELTdogiNtldsW4RAUD1XyqnOs3UwmrrUuPFsWG89QABnflqnl21t5G9+xx95OOnhH
X-Received: by 2002:a05:7022:4381:b0:11d:e40f:ee69 with SMTP id a92af1059eb24-12c28c179dbmr1491438c88.36.1775724397045;
        Thu, 09 Apr 2026 01:46:37 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:11d:e40f:ee69 with SMTP id a92af1059eb24-12c28c179dbmr1491413c88.36.1775724396463;
        Thu, 09 Apr 2026 01:46:36 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm28451931c88.10.2026.04.09.01.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:46:35 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:46:21 -0700
Subject: [PATCH 1/2] remoteproc: core: Attach rproc asynchronously in
 rproc_add() path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rproc-attach-issue-v1-1-088a1c348e7a@oss.qualcomm.com>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
In-Reply-To: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724394; l=2493;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=LILZ401zz4H4PYaJRtQNOEsPKwxxLyAST3STgzRbi68=;
 b=qPNHNb8mVXkDQ+pA4e1qin4F/5ybw8Ks5xZVj0AN7q3zBfhv66RDYgyVzURhJMeRihMAnAemM
 KjmNghF9PTOD3B8IIGNwsc5SpHkIyUpjAZlldVTBwCzEAPrHS60ZsGD
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: x0Y2lT02RuaqF_oFS-wwXdGnwmruI3Hm
X-Authority-Analysis: v=2.4 cv=b7OCJNGx c=1 sm=1 tr=0 ts=69d7676d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=k_JL0JQvz4wm1xcudgQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: x0Y2lT02RuaqF_oFS-wwXdGnwmruI3Hm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NiBTYWx0ZWRfX5ayQl/eeYsca
 sp1BluLFotXoPxQYsHcLOKpejpizWyIPUCVD2SxRNo7kFrwMeZiYAROJg+RrkzWS5onxLjYGvXP
 3mHD5TGkBky0EQnuABNiV6XRXG+rcnpyU7LA/lrBmsSFHTs72DOYNBq2QWOR03ki3bMOgWauixZ
 PU3pzjRHdl3GJrDnEYcgc72wukX/y7qY6PGZ42SzW9SeD+Q5bxyVECtBx6mpUCUi+OnseuUJyrE
 MDReEkeMOQr53tc4c6X91xwKcMNq0zdpRsiIKV+Wj2B5My5zJKuF7gRK3j9TxxnhAZQEQTcMnn2
 dier8raF9G3XtqnOReu8To/uDJowz3vY8fN+/mZZZt+xzvqgTEDJU5cdwBTwOSCcV0hnWjua9iS
 hrnvIWl9adoJ3WK6L3WrNa3dTl2BHCD6DPDNyqeWf2HCDGxUH3vy0DQD8H8BkT0I8IBCsylS1Mf
 Smx9yMeuWS/YmxRQBag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090076
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102443-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 772DA3C7F23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For rproc with state RPROC_DETACHED and auto_boot enabled, the attach
callback will be called in the rproc_add()->rproc_trigger_auto_boot()->
rproc_boot() path, the failure in this path will cause the rproc_add()
fail and the resource release, which will cause issue like rproc recovery
or falling back to firmware load fail. Add attach_work for rproc and call
it asynchronously in rproc_add() path like what rproc_start() do.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
 include/linux/remoteproc.h           |  1 +
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b087ed21858a..f02db1113fae 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1673,18 +1673,21 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
 	release_firmware(fw);
 }
 
+static void rproc_attach_work(struct work_struct *work)
+{
+	struct rproc *rproc = container_of(work, struct rproc, attach_work);
+
+	rproc_boot(rproc);
+}
+
 static int rproc_trigger_auto_boot(struct rproc *rproc)
 {
 	int ret;
 
-	/*
-	 * Since the remote processor is in a detached state, it has already
-	 * been booted by another entity.  As such there is no point in waiting
-	 * for a firmware image to be loaded, we can simply initiate the process
-	 * of attaching to it immediately.
-	 */
-	if (rproc->state == RPROC_DETACHED)
-		return rproc_boot(rproc);
+	if (rproc->state == RPROC_DETACHED) {
+		schedule_work(&rproc->attach_work);
+		return 0;
+	}
 
 	/*
 	 * We're initiating an asynchronous firmware loading, so we can
@@ -2512,6 +2515,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->dump_segments);
 
 	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
+	INIT_WORK(&rproc->attach_work, rproc_attach_work);
 
 	rproc->state = RPROC_OFFLINE;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..9b3f748e9eca 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -568,6 +568,7 @@ struct rproc {
 	struct list_head subdevs;
 	struct idr notifyids;
 	int index;
+	struct work_struct attach_work;
 	struct work_struct crash_handler;
 	unsigned int crash_cnt;
 	bool recovery_disabled;

-- 
2.34.1


