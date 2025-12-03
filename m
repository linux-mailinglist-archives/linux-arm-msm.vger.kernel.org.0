Return-Path: <linux-arm-msm+bounces-84137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA35C9DA78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 04:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C5BD8349530
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 03:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64800246783;
	Wed,  3 Dec 2025 03:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eF8ci6yl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyvKj7xW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977F823EAB5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 03:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764732873; cv=none; b=VopEqRCSAu+hDURrXhua2JhSi0yShVwBaNKJhjkPyHACqWKAK8OW1rtXb3p6Bdx744wsq4dhb4YjwObvVKuttsP/zLOyycKzELY32NlAZTW+tnc40TUoQ4iLogToOF/yDHAoH2PNrVlgBuwJpPTaG41hkEeXggxjkJWGA31/iM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764732873; c=relaxed/simple;
	bh=Hkd7AV0mcZXdrCRANgzOpqK7f3uUB46n0tDbwg22va0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RlfnLNilS90JcnC8xcbHh8fQqR5uqx0u0X2yEGurg5d3NY0+gBXG15k0Kq/lqBUO2PtMOP1lm752Y0k6VIYNMgfjOuafo2WrP7+tcTXjBQbIs9vagGOXTx3+MTzkK1+OhGR0qcCc7sxd3XFxUdXfaZdV93fEdgdeU8zNJfGaze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eF8ci6yl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyvKj7xW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2N4Sgf404615
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 03:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bz2PVVc6pyisZcO39uCSlu
	cE5ii1uplsTgIJhS9nSSU=; b=eF8ci6ylachen0RdxF9aU9WUOtH8M4A3IwSJ6m
	+g91OSM/oN7jQJ7HF5lLfKDGMulQJCya/1eDmQ+zTEGDnXuT9Q56lAZHL+y7ftsQ
	czcHjl8cFvNxLoPGNrqWBbCVFKRLmmwwg33xaqgnyHlnxI9jnFmDTvGGFv8nxMpF
	m0DSX17AH1wGDNIPCeDtwBzzJMOH/Rfq2rmHtQJDOM0Qo0369N/f9biCELSQrbxq
	wB7QJIWXTTOYABLqKu7NQht+0iy/s8zp2FLWjiQhhmDdU27IK6hh9Bjs4JNfMjsw
	fJkzT+DGry5QAh0pGyTQvEtYzB+qDWboAbgyLigQVI/R1n+w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at9fc8kx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:34:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34377900dbcso12360658a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 19:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764732870; x=1765337670; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bz2PVVc6pyisZcO39uCSlucE5ii1uplsTgIJhS9nSSU=;
        b=GyvKj7xW7xJ33Rct9yKvO39RZKatBBquJEQPt8zxpnaW5IbpVUR3/eo+zM/VRaKpPx
         lDzIBy1mYF9c/BYuG/cpXBXs4IXYjGXbxQq4K3xjFC5tajb1DYn6Pg+SpLP66tJd/7xR
         gVtPRgIVh5YJZSfMcNSpif2XkneDUCOUpbM9mDDwXLF1gyLlmYFd/doLcMdaFAq87kkp
         slLU2LQY834zvFncPg8+EVQ42jqyrhtljuI9ht4ktCxZThhMSOWYiS159LjBdazD2wpy
         N4cxiPEFObdRLZz70x41SSaiKmuSCFYV2/d6nfurTf8DugE59uHNbwkoQz6oxKm+XIy5
         rpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764732870; x=1765337670;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bz2PVVc6pyisZcO39uCSlucE5ii1uplsTgIJhS9nSSU=;
        b=UHcOn8GqNLJ18HVcuw8hcog1COwOn2VqoUOKrnZJ0eWJl7bckgyMl7GyP6xuGIwdg9
         4AlDvAafImJ9TDLSsLDuw4NIBRH21+e/UPvolj89woW7MAT4zmeXC/BCzRYml9Nqy/4D
         aoG+TGxplPkxrb2iGrWB/Z0UFqNGViOjDRvkIz61h+JSF/JFNNWE/GcUhMWlrbpLyV44
         zRNj9ipCgYhCf3u7lTs6ipYbkZcFbfUHxEjxxhHUwdmS3zdzhO6yNuVSL22kgDjbt8KW
         y6TIgJhWz6U2uaHYrzVIfHDoT/Ubm2A5ewXAWLnQ2obcNp3lu4jDqjlojAF1bGpcDCBP
         +HyA==
X-Gm-Message-State: AOJu0YxHY5YhnsIagmadEm/+lNbzc8iHt2GRej7qx7XP8Of8flUuYdkx
	uxJ9vJQuc9a8s5ZdMbyoRW6nO+YKTX489/tTgQw7YBHUM7fGCA0Muae9JW/kCgMdK5/swE29Rdb
	vjRplmqtbQGkV1U+WvDWRTK9IrEYUJi6kVYg71MGqxteiLvXR/O/DN6rLPeTejZLOdq4t
X-Gm-Gg: ASbGnctGV71MAYXba9HkZiwSTXOFdE4I9OPaQAtkfkh7X3m2bi+SejFfkbYznCGR816
	YfC3AabctG3hkRRD6N+Ki4a7gXEEeVjcBg9IvPeO5KP0y0TVz46d9N1AOtGOX6h13fRuJFla8oG
	XOvE8PrH1KdVX1P7kLQfT0JeGDORIg9gUTWP4SteFuBH05vj5Q0Jzbm7QLEEaihmHVRZdds7sUG
	qWtz7PK1f/OTZdSDieYjpXPnlZPbbL+ePYpxyJV64GGRw3vHgPOFbPazuhbezq2IZaULGZMOrlz
	JvBb07/XEAaZ0mzCBFps1Q3wgHTAICs4Dp1dWqF5/8CTRJnzXwZGAvpElzyqa3STOv6i0Ne4YFe
	KR3iYtyiLWGAerIECBuQNuZC7HcOQvDuwQL5NTv8k86AsFMp9O3Avvx4KvjyeKABGXa4JhYIiBB
	xqvhk=
X-Received: by 2002:a17:90b:5143:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34912607f64mr1105724a91.15.1764732869902;
        Tue, 02 Dec 2025 19:34:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRDk3lWNW37Ugzbg6j15n4JIdIohJWbFDAW8A3aR2F9lCXFDA5nQG7/QDdhXr/Cb/RsH2icg==
X-Received: by 2002:a17:90b:5143:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34912607f64mr1105699a91.15.1764732869373;
        Tue, 02 Dec 2025 19:34:29 -0800 (PST)
Received: from congzhan02.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150c618e7sm18533036b3a.3.2025.12.02.19.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 19:34:28 -0800 (PST)
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 11:34:21 +0800
Subject: [PATCH v2] blk-mq: Abort suspend when wakeup events are pending
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-blkmq_skip_waiting-v2-1-aaf38fa5883d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALyvL2kC/22NywqDMBREf0XuuhETkWhX/Y8iEpOoFx/RXGtbx
 H9varfdDJyBObMDWY+W4Brt4O2GhG4KIC4R6E5NrWVoAoNIRMa5yFk99ONSUY9z9VS44tQymQq
 j6iJT2tQQhrO3Db5O6b0M3CGtzr/Pj41/258uxD/dxhlnjUxNrgoptU1ujiheHmrQbhzjEFAex
 /EBWz6PmLsAAAA=
X-Change-ID: 20251128-blkmq_skip_waiting-732dab95acdb
To: Jens Axboe <axboe@kernel.dk>, Daniel Wagner <dwagner@suse.de>,
        Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, pavan.kondeti@oss.qualcomm.com,
        Cong Zhang <cong.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764732866; l=3492;
 i=cong.zhang@oss.qualcomm.com; s=20250926; h=from:subject:message-id;
 bh=Hkd7AV0mcZXdrCRANgzOpqK7f3uUB46n0tDbwg22va0=;
 b=shPdgQveRpk5HFJvvpktDef8I8kdmX67GF5KyoJXdwiAysQE/aRjM9Fx/5ifSDco2eiRah4rs
 IY0ZfdOA8qGABYttQPvJ9h1EhyU0dUtqHfNts8+LIagvNt2Q82L/3ar
X-Developer-Key: i=cong.zhang@oss.qualcomm.com; a=ed25519;
 pk=8SBh3ey5igz2nlW+UFC6khFvaNPgG7MmbWtAeO2s6n8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAyNSBTYWx0ZWRfX7L3NYFRBSjVL
 1mKEE+RezbUBKcfW6k5eYjBDwpR8toanfl4yqaDPE7aKH5zMkfsojzysJQyANhykImjsvJX2kPq
 KYUNVZ/WhF6xa9uQ4gA0Rq38rI2YjkPLRrCnRtxFbj+wc3pWWyo/9eXXDlui0YdUY6P3M5ISgxU
 ynbGRBeO/zMiklhfw6j+PsvAfmBKUvMzYckqB+rL/g8VVUwo1xB1x7Ntkz/vguoqVqO6cKZl8MC
 n/+DeGFmuOjRUEQyzAMX268cX9L8BU6jcu9PrtXp79d2ymVUG49UAMzK/OSI1E1MHDc6C8gwb1b
 tt/lTOPH36AJEfFleb58ZrkT1IfrtkenIQeyNrebmJ4q3AoTN0iq810P2GJKcWX37s9ouB6GVa4
 L0VuJ8glc4SI2O2JbhlbTdoTVpUvIA==
X-Authority-Analysis: v=2.4 cv=Qblrf8bv c=1 sm=1 tr=0 ts=692fafc6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5OloznZfUM2DqOS4epIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: NZq7QLZ1HSJrWwzipZi0gfpiHgEftf-r
X-Proofpoint-ORIG-GUID: NZq7QLZ1HSJrWwzipZi0gfpiHgEftf-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030025

During system suspend, wakeup capable IRQs for block device can be
delayed, which can cause blk_mq_hctx_notify_offline() to hang
indefinitely while waiting for pending request to complete.
Skip the request waiting loop and abort suspend when wakeup events are
pending to prevent the deadlock.

Fixes: bf0beec0607d ("blk-mq: drain I/O when all CPUs in a hctx are offline")
Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
---
The issue was found during system suspend with a no_soft_reset
virtio-blk device. Here is the detailed analysis:
- When system suspend starts and no_soft_reset is enabled, virtio-blk
  does not call its suspend callback.
- Some requests are dispatched and queued. After sending the virtqueue
  notifier, the kernel waits for an IRQ to complete the request.
- The virtio-blk IRQ is wakeup-capable. When the IRQ is triggered, it
  remains pending because the device is in the suspend process.
- While checking blk_mq_hctx_has_requests(), it detects that there are
  still pending requests.
- Since there is no way to complete these requests, the kernel gets
  stuck in the CPU hotplug thread.

We believe this could be a common issue. If the kernel enters the
blk_mq_hctx_has_requests() loop during suspend, wakeup-capable IRQs
cannot be processed, which can lead to a deadlock in this scenario.
This also improves the latency for wakup-capable IRQs. If a non-block
wakeup IRQ is pending, suspend is going to be abort anyway after this
step. Returning early avoids unnecessary delay and improve the suspend
latency.
---
Changes in v2:
- Add commmets for `if (pm_wakeup_pending)`
- Link to v1: https://lore.kernel.org/20251202-blkmq_skip_waiting-v1-1-f73d8a977ce0@oss.qualcomm.com
---
 block/blk-mq.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index d626d32f6e576f95bc68495c467a9d9c7b73a581..33a0062f9e56d3915b7d06f133548c16e1ca9aa6 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -23,6 +23,7 @@
 #include <linux/cache.h>
 #include <linux/sched/topology.h>
 #include <linux/sched/signal.h>
+#include <linux/suspend.h>
 #include <linux/delay.h>
 #include <linux/crash_dump.h>
 #include <linux/prefetch.h>
@@ -3707,6 +3708,7 @@ static int blk_mq_hctx_notify_offline(unsigned int cpu, struct hlist_node *node)
 {
 	struct blk_mq_hw_ctx *hctx = hlist_entry_safe(node,
 			struct blk_mq_hw_ctx, cpuhp_online);
+	int ret = 0;
 
 	if (blk_mq_hctx_has_online_cpu(hctx, cpu))
 		return 0;
@@ -3727,12 +3729,24 @@ static int blk_mq_hctx_notify_offline(unsigned int cpu, struct hlist_node *node)
 	 * frozen and there are no requests.
 	 */
 	if (percpu_ref_tryget(&hctx->queue->q_usage_counter)) {
-		while (blk_mq_hctx_has_requests(hctx))
+		while (blk_mq_hctx_has_requests(hctx)) {
+			/*
+			 * The wakeup capable IRQ handler of block device is
+			 * not called during suspend. Skip the loop by checking
+			 * pm_wakeup_pending to prevent the deadlock and improve
+			 * suspend latency.
+			 */
+			if (pm_wakeup_pending()) {
+				clear_bit(BLK_MQ_S_INACTIVE, &hctx->state);
+				ret = -EBUSY;
+				break;
+			}
 			msleep(5);
+		}
 		percpu_ref_put(&hctx->queue->q_usage_counter);
 	}
 
-	return 0;
+	return ret;
 }
 
 /*

---
base-commit: e538109ac71d801d26776af5f3c54f548296c29c
change-id: 20251128-blkmq_skip_waiting-732dab95acdb

Best regards,
-- 
Cong Zhang <cong.zhang@oss.qualcomm.com>


