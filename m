Return-Path: <linux-arm-msm+bounces-106934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJkzGfzUAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:09:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1AB50E96E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1474330CB28A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DC33E122F;
	Mon, 11 May 2026 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTE/cJlk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8T/nCWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1D3DD50D
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504486; cv=none; b=L1hMAhMqVADHb67PIfvMQAztKKaFnv8CBduYu0m9xb07D0ajQO2vWz+dChtPNT3tboEQdg3e+SgryimkqSU9rCUvu/+kA76XWfdVLxMnGqi8E+adx/uA1cSabSnWxUIjBmgWXMfgygo4AzxAxdR5mPHAYraqLDfVXDSXeQL0Ilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504486; c=relaxed/simple;
	bh=XZmlmpKq9dT2OjVxZaCDZBHXjS0SdHaDhZM+xjSaQsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rs6sW13WMJcgxeoKq+w7TfYuVbaqman6P0Ar9upHKSqu9rR12EqN9rcRZCWnB5JOO2bn26FTHC7EXe62a30bxVrsawCrX7VEM8y1+yv9/7e+0uJkEV4DojqIKRsEqzrP8vwUlwgXoX6gNcHZM94DLvd0gvxMVj4qBcbMUSgNTO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTE/cJlk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8T/nCWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BC4RQY1106915
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z+T7DF6d3yj
	uRFH4Z9NZjry6qzE7sW/NwEF2nzuN/uA=; b=ZTE/cJlkGUMWT8JTi3P6DxFacnB
	NcnREzdc0Ao++brhko7CLUfyKct7/eVDquXtlHEzXr3K15YALEtu/LduylPgJUho
	XCcsMUZX7J+JUrZChI9/ICLCH2lkreQ8I0eu/BriVdsCRuPudxgpFW6oXr9u/bkb
	vOtbIUimhNCU6p29Piqu+eV/x6fc88DPsnhaN/N/2GaXOS97X2YPkww1wO35IIDe
	CoMQGerjYUHygyVMAm931+ETwa+LWGKq7OuQEoqBEQJmXO8gQovcnjqH9YpV1NAh
	kp1wnKp8t32ZFjdZ/AHfYk8bpnsA5Wt3+Z+JaubJAF5/OT8v4JX76uIpClw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3esr85n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-835444b6ce1so3041006b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778504482; x=1779109282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+T7DF6d3yjuRFH4Z9NZjry6qzE7sW/NwEF2nzuN/uA=;
        b=O8T/nCWKp1Nx8Dv8emTQTflcdXkrrVDvNVHr/8YowbpklbeguSLjLrloaQ/viSQffc
         XP6b7XwlNMJWHRYXeCAltApfdb3As/7zsntVswR8ZRQmES75kq+39nidJ8lfeqACGtwm
         OtAymkGnrOoJzxRTRMrlD7yKJSwzPhyeGs9aSokRUlvvLlBxv5SZebFOnqqc/5MDFRcF
         +Etnr0A1RZb29mhsh1OSHMjOVGYTkCN2Pwg8g979SnppHtbKtkBw2ZGcexsFIq20AzMo
         zrA2OK7D5mgp8z0GFIizkdyTAp0zbYjVX00QZ3IZHMK79gZx8egsbkrysu+oqVKw7Tx9
         8Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504482; x=1779109282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+T7DF6d3yjuRFH4Z9NZjry6qzE7sW/NwEF2nzuN/uA=;
        b=b++aRjltgO6lwN6CxL/BSwJNadwcZ3vhBEolBDm3i2MLVxZX5kcT41zyOJw7rG1+oc
         vbr4ZEIQIT9tYNS1m0/SMcMccuPoLzDdWspspJxpYSVxRsSs0iokZg0L7KUO5otqJUw1
         JWyWh7JBwUkNrM0jvTA8xQrJSctpzyGcbTKc4Z0JpIstvrLEKE6bOQIlXD93HkKDIsFc
         ZH5KiMUGlJh3eBzEFEJFuGP8oqXxRy4Ds3wfmR56uTMg74kAD34FFGfMp4V9McLM5kcY
         GvJpqQSxmQZhe9WOGCS5lkyBcR77YAWVXFSLplLyIHnwC2wSJ54aIIY4S1nxVdMnlr3N
         Ytvg==
X-Gm-Message-State: AOJu0Yxg73/pveoUt30Qn+7vZOaxYXM3XGV00/NTpgs0b2Y0mm7Sf4eF
	gWCsOPZc0loBD3k+zZQV/dMPORiKg5KucrGu3y4klby/VNMInRd9aj81h1fsFBuK1zI5S1dzZmL
	Ch4E61P3Qby0jr6kOVih1d0ExbxsyURKOStm9mFUPZjDfDVvo6MAR/ZOnzJskE56PV14e
X-Gm-Gg: Acq92OEz4Ydm0A8ct9zYruDVCKsB83hWMa/vjLEFAbSgLcE8eoR1s0xGtrWncScXtQ1
	WYT/mdRpRiCNqKJ2n7qzTajawiiJtPbN7b7NKMad7yCMEK1fr9/HPcILT2GIrzy9GP6OZdCPoZi
	yRyw9i0fDVA/G8CuoeHfAG1RTXDDO/aozUsBwvuQYg7EIt4brhRjOT9Y7l0H2hQSi/yKWS+4erQ
	2v3iH18u7es50lvhaVyeBHSk0Hjj4VdawQzNJqZu5Cnx+r6tLSzE6+CzCDe5OqZPKx3gLZ3/CQp
	vehzaWQB6bqJJW91ar8e60bWEVvVxCoqgn49K2ylSzV3/0H9x7HKna99tMl9bUx4ZgbIKUZODpG
	OyoqzbfUwYLfBVntao5Ug9WKTvaPVDAGjrqd9pu7CWAM=
X-Received: by 2002:a05:6a00:3e0d:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-83a5e24a2f1mr21966303b3a.43.1778504481944;
        Mon, 11 May 2026 06:01:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e0d:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-83a5e24a2f1mr21966204b3a.43.1778504481124;
        Mon, 11 May 2026 06:01:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm20908324b3a.19.2026.05.11.06.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:01:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 09/16] drm/msm: Add per-context perfcntr state
Date: Mon, 11 May 2026 05:59:22 -0700
Message-ID: <20260511130017.96867-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x5rhlVcW4u5UJzBwhztICr2HdjDz8KIu
X-Proofpoint-ORIG-GUID: x5rhlVcW4u5UJzBwhztICr2HdjDz8KIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NCBTYWx0ZWRfXwoV2dDMH9aQL
 3D36XifvXhlZC2VXUl5mHLIjvUVx+udSxFKqRAUME3ke2enqOwj99NCwp8ppwKbRYiGKY/gZKLb
 h0/EzGLQUuSLUo2OKeyn0AChWJQ11j0bGH8eYQnP/m1ar1Ev320A76s7bZtHJgw0skNG+yV9H4C
 /4rIe8EC7rVmvnMW0sLOcP92DIdfZ9sH5VX6mQrHXjJnqaAhWupd3BuEqEl+F990wHx9VNfUAGb
 9QZk+O/sn+p+SnIR0R35nhoJv1rXf6qgkVbp3lUqjGgEVDHvJgjyFA7FynpcVQ1a9zHGQkAiRgB
 LX3wqYYfLxRiZ4svLP1tNf0hzcsmxYcFutxdxniNW8pNQzOxSn9CoYnBQ8+2IGdIPEi7SUvvJDQ
 NvOA/3XMAFQssBgzOw2ncIX/OwqXCrs7PTvOssTbroH9/pupg6/Zw/Kq75rmeiAIOAA0hOMg6WA
 KFk7d6OSYF+WPLvKdAg==
X-Authority-Analysis: v=2.4 cv=G40s1dk5 c=1 sm=1 tr=0 ts=6a01d322 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=OtV_UDYxk2hhjaRdRjwA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110144
X-Rspamd-Queue-Id: 0B1AB50E96E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106934-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The upcoming PERFCNTR_CONFIG ioctl will allow for both global counter
collection, and per-context counter reservation for local (ie. within
a single GEM_SUBMIT ioctl) counter collection.

Any number of contexts can reserve the same counters, but we will need
to ensure that counters reserved for local counter collection do not
conflict with counters used for global counter collection.

So add tracking for per-context local counter reservations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h         |  5 +++++
 drivers/gpu/drm/msm/msm_perfcntr.h    | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  1 +
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 9e5c753437c2..19484774f369 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -434,6 +434,11 @@ struct msm_context {
 	 * this context.
 	 */
 	atomic64_t ctx_mem;
+
+	/**
+	 * @perfcntrs: Per-context reserved perfcntrs state
+	 */
+	struct msm_perfcntr_context_state *perfctx;
 };
 
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
index 64a5d29feba1..7f0654182496 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -35,6 +35,27 @@ struct msm_perfcntr_group {
    const struct msm_perfcntr_counter *counters;
 };
 
+/**
+ * struct msm_perfcntr_context_state - per-msm_context counter state
+ *
+ * A given counter can either be unused, reserved for global counter
+ * collection exclusively, or reserved for local per-context counter
+ * collection inclusively.  Multiple contexts can reserve the same
+ * counter, since SEL reg programming and counter begin/end sampling
+ * happen locally (within a single GEM_SUBMIT ioctl).
+ */
+struct msm_perfcntr_context_state {
+	/** @dummy: Some compilers dislike structs with only a flex array */
+	unsigned dummy;
+
+	/**
+	 * @reserved_counters:
+	 *
+	 * The number of reserved counters indexed by perfcntr group.
+	 */
+	unsigned reserved_counters[];
+};
+
 extern const struct msm_perfcntr_group a6xx_perfcntr_groups[];
 extern const unsigned a6xx_num_perfcntr_groups;
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 2598d674a99d..a58fe41602c6 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -66,6 +66,7 @@ void __msm_context_destroy(struct kref *kref)
 	drm_gpuvm_put(ctx->vm);
 	kfree(ctx->comm);
 	kfree(ctx->cmdline);
+	kfree(ctx->perfctx);
 	kfree(ctx);
 }
 
-- 
2.54.0


