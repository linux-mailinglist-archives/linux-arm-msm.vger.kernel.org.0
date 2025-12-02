Return-Path: <linux-arm-msm+bounces-84025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F0C99FA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 04:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1DCE3A513D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 03:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E94329BDA9;
	Tue,  2 Dec 2025 03:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmJFZoRu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcCV8dbT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0638D2853F1
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 03:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764647796; cv=none; b=HC+m4Gcw4LMmP3AlUqnMrc0CQh9h2n/Mz3FLcVEK9Mv8iD/R4cyUOecYDj1Evov4+eKcx9X7dZ/toNmcWzWn0CRTU1RKJ5QZvjphfrShgsb1cpDcY8AwOLj5dWwRiQWC7BvMZ9UXToe+1VfixEH4cGrzIU3jZHRrPnFPP8Qzi2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764647796; c=relaxed/simple;
	bh=7BpXbyKRd+fOGVdpYDjiUNA/8UljaPPFKtYj34FWThs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PgDCvxoBIH2fNFlJmU9ufPGXfMnSZbdbr2mjI+lgfjvxNmPNwE3+R9UbZwMXcecoez0HtznFkIwc/3lq7qD/swvR8IJydkgQ2bLD1zROG0GHIPqO9L/dlqTG5jDIN2eSfF93hNdKKKCZ4PQagvctDj1Dg6d2hXG/sS/CqObVC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmJFZoRu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcCV8dbT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1MmcVK1926812
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 03:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iA7Ll5fL6RccD4MPrygDJC
	gv5QsTGkbfv/zUaUvzApU=; b=QmJFZoRuN67FvVS8Eg/mQfySc0Pc7xlbW3GJpn
	A7FovVtSZ3IlhUDzRMrQy1SbZNxmYjsevcipTbsDRibJl6Mfu5esVXIDsvbrLizp
	2hxVb3mUuqc9HdtG4dg4cvU7eewsf4anqcPjYRIPQH4SSaLshgFMgc7webqmiLtv
	k1Udljr9Z4RqVaYzVTJPxMOnGNTB6N0xYAoSpWnkUP0a+ueEvjwVwFzfAZkbEpig
	hydPadje3lzue02JKpOsdSYoALmDWx1Kk4gGR6t56iW/3ZYDkoheA4gfmGWgsmwP
	49pkLoiMPghr/kQ5CLxtT0p1dEpgPGhF1F077VJDnEVSfpXA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asm4xrpv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 03:56:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29806c42760so161591805ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 19:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764647792; x=1765252592; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iA7Ll5fL6RccD4MPrygDJCgv5QsTGkbfv/zUaUvzApU=;
        b=dcCV8dbTeso+LrdFdKkgHfQTKSWvRZgqLEAAvq54DfivzzT9q4HKjEZs4vtcUtlk23
         v+HmRx8YePWfI433RBOb0ntdeLFMVrsP9D/5Dyp/WZ8Rm4phngOsbTBP/J8mIqvWOOV/
         B0vSpFQ4Jr/inoGbq394OAAZvYsIaHvGFZTnUFU4JL2DxmRE7vxI9PiuAX6ZZ9+I/LxK
         TBakXtQX2tAbk7LJJ55JwwleWzinjXS+sh58yNp4iOIayFNsPqua8gf0rp4gDxP8xgRH
         nJ/UEBQtqK1WRIsjFUG/1+JWVk0EQdMOAFSZrL/FbpCf+NPf6B9ADIyeyJCjOu09hPUd
         4DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764647792; x=1765252592;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA7Ll5fL6RccD4MPrygDJCgv5QsTGkbfv/zUaUvzApU=;
        b=Kcp9Qpjbnf0g+MyDNGjnt/a9B8dYJ2lQrBN1JJtdyflDLLiQlD4mfuE+vJL1Jhn0lT
         PSUbADiNx2j38AZ3HUaEkLxIjr5g8ez71WMgfz9uXfZfz+KnGPbsCz6qfkzZOXHq96g3
         oU3Yv5qnvn86WiqfqoHhyPgGHdE5Tykq7YNx5objW0RA8R9iCG4ZUG/mSrP7lfNwYx0L
         e2u+AcZquyxV73QhzZmu0G5/GDTvl2aisP0Z6o71tR5FijXBkfBDeCMUAsCPPC1DmULM
         comaYkBr9vKpOVzxH1lHYOYBLachiT5L1w/9vdLj/Bo8kz59jgAqn1UJV1GLeNBjzFcc
         JpMg==
X-Gm-Message-State: AOJu0YydBahxC2U2x6ILfk7Y0wKzctoZb7dCUZEspREF8SujdA6e0M8V
	Gx1klbK5+rJuMmf3TcyNi1NSDvz2xNdCNEL4o3EkebTyzyHLikzXSkBM32ay3PlUFwcsPAnzLvd
	Og26XqKkdQjw04lkGpV3GC6TBgTV/56zegHAStHdoduM4BZjmq2WX8Oc1E8DrMSofz3kmLeSyAG
	DBd5Pf/A==
X-Gm-Gg: ASbGncsD/9vSZXQCMgJQVDENuVVPo7omdqj+fvmRKWJbnt+qCDjo27qOMqPk99wy6Oe
	fbRg3k1jj6E1XXQRXWhpJrFP+ogNPUaZh7r43dkOrrAQDsDwcY9dhPMvH82ZhMko9RNuOouCjSw
	4iBbTp7Ngo3eWwn52rqdnoGfBkaRHh7aIXPEVJMsxrcf2ee/ZwgwdArB9Mrdbn0sgPlTAnP0nqL
	iDUZG0zqd8xigbxmyLr+YHFN27zCrq0ttaS6hC9JWcTn7ho57jjRYN4cxxkvOBfGgH319VDnZtZ
	u9SjxvlzPP8isPyg034CPTzeuWLd3e9A/Djd0WVu2mPKX+6z1VQ5slL3v4UJecBkO9I7qYMh9gK
	iq8OwnHO/fFA1I6FG/O9hClDPa0Np2cIonGz60ap8M7de94Chq/luTmz2e+UZ0X8camhQMw7DnX
	tO8t8=
X-Received: by 2002:a17:902:f70c:b0:298:6a9b:238b with SMTP id d9443c01a7336-29bab1d74ddmr290667625ad.51.1764647792547;
        Mon, 01 Dec 2025 19:56:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDdOVl+2Adomyo/VOpvbYnIsL+nbtbQvIhcGoKQDuUfpegZ0WU90gc/cg59MA2GVH+MEGimQ==
X-Received: by 2002:a17:902:f70c:b0:298:6a9b:238b with SMTP id d9443c01a7336-29bab1d74ddmr290667455ad.51.1764647792137;
        Mon, 01 Dec 2025 19:56:32 -0800 (PST)
Received: from congzhan02.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ab8csm135932565ad.9.2025.12.01.19.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 19:56:31 -0800 (PST)
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 11:56:12 +0800
Subject: [PATCH] blk-mq: Abort suspend when wakeup events are pending
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-blkmq_skip_waiting-v1-1-f73d8a977ce0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFxjLmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyML3aSc7NzC+OLszIL48sTMksy8dF1zY6OUxCRL08TklCQloMaCotS
 0zAqwodGxtbUAaNT2T2QAAAA=
X-Change-ID: 20251128-blkmq_skip_waiting-732dab95acdb
To: Jens Axboe <axboe@kernel.dk>, Daniel Wagner <dwagner@suse.de>,
        Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, pavan.kondeti@oss.qualcomm.com,
        Cong Zhang <cong.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764647789; l=3095;
 i=cong.zhang@oss.qualcomm.com; s=20250926; h=from:subject:message-id;
 bh=7BpXbyKRd+fOGVdpYDjiUNA/8UljaPPFKtYj34FWThs=;
 b=JiKoVK4Z25FmSmgnrTPR/T3XmDums+b+p82Oz2wYsB3TQ3HFt+OuH7sz3rBO2gyydC7p3vMho
 o7Tq/5oZ8G2CgH0RpkHOz0IkHGWpmjG/YhLiy3rd2dRIs/JNn+OwM/Z
X-Developer-Key: i=cong.zhang@oss.qualcomm.com; a=ed25519;
 pk=8SBh3ey5igz2nlW+UFC6khFvaNPgG7MmbWtAeO2s6n8=
X-Proofpoint-GUID: VrvJNl0jpjE-G757tsYSYo2Ss-Bs2BUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAyOCBTYWx0ZWRfX21v3dyEt1bjK
 xjtGHSPmS4Z3sPL9yeKYeJpLJNlDgWlehpiD/AYbCKJCZ/ezxFcnj3auPxEHKpLs4w+W7qiFUNQ
 2GLRgWxXNZt7/X0VFlsRaVXOKimsFlePygJaYgfkMJiRhH1biQpTuRGuPytD7Kh6xfBep3L6xVt
 mHsgnZsuJz3CjHYtFZbq2LX9hYN2AqXk98+E1osbFoTvYgBUYVE7Js+4CKptJMfqJN7cfUk4Vpc
 vpwnt8zrWaXoVh18IH09OGNX1iaQj2HL5sTZW5xWea1cj/gdeGpsPp3qUL4vcpm8lixfckbUTKk
 XAvDDvATEns+JiOpsew8YU4g85DN+8MVgkZnNA5Y23EcwZpVFZR5bFqucPjIsC5B0p1DMAEuSj3
 BccKC097EPxeaw1O1IY0iA/UWp6XJg==
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=692e6371 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NQIyLv43BouIiv1H7qwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: VrvJNl0jpjE-G757tsYSYo2Ss-Bs2BUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020028

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
 block/blk-mq.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index d626d32f6e576f95bc68495c467a9d9c7b73a581..0cf83c2d406609181d430df163cdf2e6ef4f7c18 100644
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
@@ -3727,12 +3729,18 @@ static int blk_mq_hctx_notify_offline(unsigned int cpu, struct hlist_node *node)
 	 * frozen and there are no requests.
 	 */
 	if (percpu_ref_tryget(&hctx->queue->q_usage_counter)) {
-		while (blk_mq_hctx_has_requests(hctx))
+		while (blk_mq_hctx_has_requests(hctx)) {
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


