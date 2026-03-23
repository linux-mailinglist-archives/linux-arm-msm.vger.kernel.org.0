Return-Path: <linux-arm-msm+bounces-99390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJlhEYWfwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:16:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D49192FD115
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A060C30A6809
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB023DCD89;
	Mon, 23 Mar 2026 20:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOXMgnna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWOebm+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5FD3DCDB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296796; cv=none; b=n40iAKf/8NSVYeHvpl++Lxcx6eqbnCbFUH+zJBQhseCYbOV2Seg3L1uhdJ1Kdzp7saVJZJCe1bWd+ZmDoQluCVgyoflWdjz1/MkUA3KYUsxKL+7SYRpdoPn4pm9eY95VMxYxHOHFFbBpHKJ0kRBnrhqAqdR+wT0KyRYaOOCut1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296796; c=relaxed/simple;
	bh=1ajLVoslkBTv41Sp8G4luxsz7Te6eYrrZtKsz0zxR/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlMqS70zlhE1QS380R0xHCMhYfl7jttpZo1KIMlC/+TPCkDF3UaH+kS4m/cfzXaRSGmy9PnLLzRV7FxR1lBAAgaItrsQy/Yd3yERC2wnXo6XbikRsJnNyseFNl9NwC+VvMtT3tFZDOm4Us+Td/Y0HI7AWSNASob1h6oNqznuf/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOXMgnna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWOebm+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqktN1762295
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFi8aoHCvHDcD5YBbZdBFmik9S7MrX8p/en9vgMxupI=; b=aOXMgnnaMW2rfqSm
	wf62voJmAEkx/vKDnitU4Jh6I+Jx9zjys+3vRU5b6OOGPsOe+N7aF15Klx1HQe0j
	VgFTzhqWfc1X3Cq/hARFhbp5MkrRthSJ1ksvZD6XHyJIqFXbFtRfXgpNIEny9zUy
	C6ik7xWFs8OomYncVeiUK1WIyzYiIXaR6fdC0yE2VqAQyZBm4W1VGouUFsnBeuVH
	wI+RAIicJKiwElL+y07nTDqRJMqgNruncASULMUkJyWmOLgw3zdGPG1RYC4Zp0yw
	zK0Zqo2xSSoO2V6GDjufxkp7rfU6R6Ka0gAbnebsXOybe9KfLJIy5YwXdzWwTZMe
	Fe9KIQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f09dsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so2157374a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296793; x=1774901593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFi8aoHCvHDcD5YBbZdBFmik9S7MrX8p/en9vgMxupI=;
        b=dWOebm+MY4mYFHddn0uBWhIwa9tJCm0yJLasqUwncgYgEfWfvMKzLImWfYzei416WX
         P7yexKuGyO061Pdzc7dN0ilNtAkVbJEaRu9Couwe0AM8UFzIQPBccHygMNDf8ZHxG30R
         lcuKukjqEWAPf/I9aanc+VAYTe8H+9uKgW73npSLF+f+gxBONSUXGrSLgFW8FRpGM0B0
         RAg86G5EH9JQmFpOyFvz9ehRC2aRfMpoewEBUN4D0OHOJAnc9z+Em73nfQ4Du8CqVHhM
         eodyzVVbfvZvvfBZB9ZuIIR80pehV7GCv+scvhJ9cAbBGfVbQX4VFBco00LlMHWBhec1
         9NZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296793; x=1774901593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFi8aoHCvHDcD5YBbZdBFmik9S7MrX8p/en9vgMxupI=;
        b=rjKoO/L3MFUIv9Ths4s8LpTwF5U6jZ+BUEv5U6Iyo8eaXCfrM8SDKzc6FNahISg5jZ
         EMOmMzMg6fjuGuXsWolHGbllSCk76936EakwlqteBNL+lo4STKAuw73MqYtNMeqBvlxM
         Z1xzsK4mkxq+nS4ZDcbyoqM8rQf0rnK3fK4CkgXsZwJAHIyQfQSUoyL4+Z37AAD3nDrz
         V4hpjffIubr68TNB2XUqT2qMgjU3FJvkAMkf70OO4vxaWxKdItNt8dp112TiUQfnIvaH
         TShG5bWwM9Acold0p9r9USElWQkB1/fW+y9RFzLnVN+TnwVv7wfV2DDAH1LHArrVJqf1
         OBuQ==
X-Gm-Message-State: AOJu0YzYPYj/2VoyGXjf6d77By1G/4X8pkpMBN1ATutsBQWZNeiJ2uYj
	Bj0jAH5pE1uiHgXn0aOwZS+BzccGKHZiQvaHx5UHzGtO7OYEpRm71swxQtT6frLKTY+EbXrt4NK
	VKCpYW1EtoqV2C6KBWQ5/5jaDinZ2SHMr7Zk3t+YCQdq78ZRMweGLZmc3ymyGuqa1dzRn
X-Gm-Gg: ATEYQzy1eV/xWsEhVNdFU47LUJxh0AO+AA+PAkN3n1lPa9DqKrKPWD+MZd/DqDqVdyq
	cM1fIf8f8qOxodcqVdcKH7uAmL0LbFiwWy3Lrm8ZGP1Dytdi0pOzj55x0wajUYIQl5R7md02Oij
	phP8RdeUAYoiXGcHIufxGv6XvJ1uWDyqnz8GcQQSCcHaFGbiIjgnY6A8d8RCJrPqVJXaMFCBWZk
	Jp0EtjE9NGnOXuZ6vaTnhFHxeFaZli2JgwlL1gOWVK6PpT9++vKkgJT/pVIrQ5C4K/nkakuqwhk
	zChhBoXvlUwuZ/QpY0QsD+6KqGKSGht7aYMXvndJovYgNFgU0kbfwHQP2yM2E8iDHJPn4ll68fs
	VnUfiJr7uPEp0TQQrWs0H7WLu8IBvSIUS9daLn/qr14VZaA==
X-Received: by 2002:aa7:8ed2:0:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-82a8c35758cmr8866491b3a.44.1774296793144;
        Mon, 23 Mar 2026 13:13:13 -0700 (PDT)
X-Received: by 2002:aa7:8ed2:0:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-82a8c35758cmr8866464b3a.44.1774296792639;
        Mon, 23 Mar 2026 13:13:12 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:12 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:18 +0530
Subject: [PATCH 06/16] drm/msm/a6xx: Use barriers while updating HFI Q
 headers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-6-fc95b8d9c017@oss.qualcomm.com>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=1974;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1ajLVoslkBTv41Sp8G4luxsz7Te6eYrrZtKsz0zxR/0=;
 b=fMD8o5dT8SsxOVs4k4rWFPgLkKIR8YU77uqDQ0DMUTmim9gm/FgM8cMODWImekNXWofrA88+w
 e0f5Cwsu1g7BsVGQC1TXcmqh/guEntf0zGyTwt2ln78P0OQd5K3Jkww
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c19eda cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=h6CQE6Wve-Y6OpkwRbYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: z56uGi9MK6cunoEWn_dwb03ReUus0yOy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX/Mdjgnfq6Lqx
 elAiZFk9FYaZ2JMlP1/8AoA5Lrwr8v2gfmsbyTQkYJDv+F4Coe/aLVkT1CAzxJRHoQZwAE0N69b
 gnZYfxj6thblenQqx9yWamF+DeQlOyDIDjT2Wk+aaaqdHVSrMT2lIPpDBb3CXJzJI3aFplwgckn
 hd55BeLJzReJWKCXK+Uf/gWCV3EyGZxN9fGyIDwDkVhhB5q+5QyoCOTYO1aSNKNhDtA+Z8n8ox/
 MJ+mdXUUNG9YcZBvd+Nyt4liPhA7UFWRA45nc/6YF3ZgkNRxlk71SsdyLy+wKNDgAVCcPze4Wvq
 L2vF+UGRbcxgOppLmlyr7xmjxlymjAXDm+yQdSZZkJWP8Ch4c+zixreAByvf5ph6TxTe4wkb6DB
 XczwyQmT9M0s2b+1nNVt40SwG1HNrhVnC80ZA3mCTF9WUuRjBlvAaL7byy0TdSfs477pT2bc+Bk
 DVTJAlxz/TQEaM8tjpA==
X-Proofpoint-GUID: z56uGi9MK6cunoEWn_dwb03ReUus0yOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99390-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D49192FD115
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To avoid harmful compiler optimizations and IO reordering in the HW, use
barriers and READ/WRITE_ONCE helpers as necessary while accessing the HFI
queue index variables.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 2daaa340366d..aef00c2dd137 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -34,7 +34,7 @@ static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
 	struct a6xx_hfi_queue_header *header = queue->header;
 	u32 i, hdr, index = header->read_index;
 
-	if (header->read_index == header->write_index) {
+	if (header->read_index == READ_ONCE(header->write_index)) {
 		header->rx_request = 1;
 		return 0;
 	}
@@ -62,7 +62,10 @@ static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
 	if (!gmu->legacy)
 		index = ALIGN(index, 4) % header->size;
 
-	header->read_index = index;
+	/*  Ensure all memory operations are complete before updating the read index */
+	dma_mb();
+
+	WRITE_ONCE(header->read_index, index);
 	return HFI_HEADER_SIZE(hdr);
 }
 
@@ -74,7 +77,7 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
 
 	spin_lock(&queue->lock);
 
-	space = CIRC_SPACE(header->write_index, header->read_index,
+	space = CIRC_SPACE(header->write_index, READ_ONCE(header->read_index),
 		header->size);
 	if (space < dwords) {
 		header->dropped++;
@@ -95,7 +98,10 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
 			queue->data[index] = 0xfafafafa;
 	}
 
-	header->write_index = index;
+	/*  Ensure all memory operations are complete before updating the write index */
+	dma_mb();
+
+	WRITE_ONCE(header->write_index, index);
 	spin_unlock(&queue->lock);
 
 	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 0x01);

-- 
2.51.0


