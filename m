Return-Path: <linux-arm-msm+bounces-110733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D/hHHaFHmqhkQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:25:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C16E629A63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B833C304E43D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06D136683B;
	Tue,  2 Jun 2026 07:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuP1B37t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMF3+cD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74295372060
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384692; cv=none; b=P8OAXIfQZUN2GTq4HV40gjTjuALBuzHEDf6AlF4WP7+gBcKujeWUR93PlN8luP9ai9Ep0sq0+o6EtuyA5iQjqAjq8gbBkRY8Y1PpLs7eT7dZff5RuJaISG0dbxRrfRYrYJ8NjdclSxiPvEcIrNbZjDcakxS2f4rKUlFwjJm09U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384692; c=relaxed/simple;
	bh=uwUosZaTRLvg70pMj5LLo47klKvzExFmHdJcqWxZT4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vCdmU8tsK+QZdK7LVTRAn3h6JaO8UQwZRjwR+x9cFMGUMMk66JBPIMjpLi6HCL7JisNH0PZtbcXwqp49Cym345Oe2+jBeyuD0LRb4VcMkR3JuvomvqaBl7ncejQ/Yfj71AcuZqxkzkZNPlWqdNPkdWUbIj+qWdhx3WLyZXqcFSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuP1B37t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMF3+cD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6521jTGq623025
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h2rbBUksZJT
	YcjdAJliGesa3QsJPl7wEGaGM4JyELQc=; b=BuP1B37tHS7VbrwU9/VUo/TUYKT
	oAul/jxN2jFUzdSURUIKGp7AdxAaCZlWpjYlpJ4nY8mjli7ovWe777Ehxp54ElP8
	pQlvNLGlKDYZpQrWAaXFI5qYGvb7wNBelhJaoAlG6G/Yk/KL/KvLXU0NP0MUcEGD
	IPxURgaiTerzEemUfalIlgl/BHdWzbmeIb8w1/mSlEDVx1RpnUjhpsWWIXht5ine
	G6V5TC5aovy90kPxlOpL2VkcVqNRtA+2DhU62KSAdKfy+6J11D/885T5vM4qOzt6
	EETyxofzjM69kl3Xn3hEcWihbLSVS/oe1Q5TwkmJ5Vfp40SDZXpaK1NaQnA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954mkc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:18:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso7879984a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384689; x=1780989489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2rbBUksZJTYcjdAJliGesa3QsJPl7wEGaGM4JyELQc=;
        b=MMF3+cD4DdP6/lXqY4B+iqR58odm3yOrFu9UjPZU0bG9QIC2nNdu9X4EPvAv4eb3Qh
         yWIlBPahzcNddibHzcKXJrTToYtJBiB/JsxQ/Sexbr3bW7KTp+0VuSs3qkf5CUdiQkBB
         eE2KJhy6W5b25bcxrt4FQSwGbV+C0wVG/6TCEh0zInDiR2fR6RVcdFBaRZitPJ2KfyRR
         V1Eo4Aps6lfQ4iRsX3Ds7ffrPjm4jS3v49+EDHf1oXDP7PwYJfxBTKyg9vBVljhAcDRd
         VN2SnoI1o7+v6F523IsQT+JHozJCGEDhDgZYHHG+Y1uI1sODIrLx/MWEfgbeorZCTRTC
         /kAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384689; x=1780989489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h2rbBUksZJTYcjdAJliGesa3QsJPl7wEGaGM4JyELQc=;
        b=FN7WkdOiOUOdsrsUIw2/HZNyKPHpROO6XZfIiGKT9TDdQhr3JnTiHrj6BCQmE3qHCT
         Z8B36t62gXlPmA4g2um+tOASqRknc5TJqQirX5Fr/8QSnt5z47M0PW7tkf3S4J8u2No4
         SAC9dMPoxOhct/IgFfmfHAL0vDZnOvnQFTVeKsCElaLP4ioqOQOYRTkaf3zZ+Z7qv6ci
         n04Ag7SdCzt9Wm1g+1R070p0Tl4RqZtmCL3hM9UqbRqWzhR9tcghgIRk4UVrYPPcYa9+
         MgT1i3CQXzw1Vgvuoz+HjLK1kHaTxfVKiC7bq0mywI2PTlg2wxGxk0BK1MU+bcg+zlpQ
         uOsg==
X-Forwarded-Encrypted: i=1; AFNElJ8dvixX9GU12MVW72sQDBrV+OVVZLoSAVD7B59Zcs+MrLlM0VOFI6Op3w2yWAzhChIZdnU+OfdUA8yqhfsM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfjt1u2uHyZ0weF9/fNwzGbiyJ/6qd2bY58BuMPPS5FQ18QwDj
	K/nm0p0EXJ116rIIdCShPYUbi+6kjUKEQ1x/AG2IkhiJXGGml3/T+0vD1UU6u6iXiNnQY1Rt1Op
	1v2roqHiL6e1SZx//fJZA11hrxZkLo72SdjakHQ3A/ghAGhZAERF0HidZj3xfmXH52vbD
X-Gm-Gg: Acq92OH1NS1S5EY5Ke7YG/pi+FryqbooK7FK4pA9y/KZE6ZtSjTOWTXpREhK4mtTCzd
	5lxfOjORR/NT6FmVjmdOC3EEjwVSkHdS01wWLbYIa0Fihfb5H61lbYVUwBnNqEl/w8f1wuVt1Nb
	UPtgY6tuBnB5IEyn3Z1J6Eq+BI6nVB+zOiyrDiCze2qWy/JaWx2cGb/yeYGUBaT+BzDGMCb4yB8
	jzOX6x5ZwzPYjaRD5V0H79p90fdWjxhxVWTGobpT9/RcHT8A4oi5wrm5/my3KlRQsko7sVaXtp1
	07ZcZXzh3YJ6+eUf8kW2TXoTOcXB7KVFqfGVsChe401qPs09ufbm+DtPXdjpvP6v/DlQdmOPSIC
	x6KV2EfFaBD1R51amsdzP8EC1bWXVQWLkKI8vkpER0IfPDfdv82WW8e09HE6ITMtm0hmMK9TLum
	FBc8r8bjcARwqNVXlemv2I2ZbLXbnwEQ==
X-Received: by 2002:a17:90b:5184:b0:36b:8824:d7cc with SMTP id 98e67ed59e1d1-36c501efef2mr13151234a91.20.1780384689411;
        Tue, 02 Jun 2026 00:18:09 -0700 (PDT)
X-Received: by 2002:a17:90b:5184:b0:36b:8824:d7cc with SMTP id 98e67ed59e1d1-36c501efef2mr13151203a91.20.1780384688932;
        Tue, 02 Jun 2026 00:18:08 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91c9991sm1766279a91.7.2026.06.02.00.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:18:08 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v7 2/5] misc: fastrpc: Remove buffer from list prior to unmap operation
Date: Tue,  2 Jun 2026 15:17:47 +0800
Message-Id: <20260602071750.526-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -1mVIzWF2LXwr2LWmTTxCiP8miOZSYZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NiBTYWx0ZWRfX+gKr7Y8q/lUb
 xBXURGALNRyi4cGhCKCc04bBwirJ47WwAXsJ3g9ikBYCJ6mLlNAf/SMo53Iogf+gSb6LvALJ0No
 2sa2BHbNZqg7fdFSX2294bo0/Kyu/cPs5ZJBwLsYKeHprOAv219T8HoumVQwR7Qu8syBXra7gOX
 2jgTBKCt7wYMQm+n5NdfL9yv/0Fyg3D7ELK6si4B5psLQzCDrtVTAb4xMARi0NK7+zxokk8hiW7
 QUUM8owZ5auLJjctBKttR3TWIvNSlLOhSAvJHij2Ign6iDhbGfHMTur292jBX8Jsj3hdYFD6LH7
 puZjK+quiPSZ/8Jib5Bh7ypWWXO8b9GHi2MDxYwfyASQTp5nYf2EqkFqgL/FBXQP8V5D3/ZsexX
 E+KfoyFYzotTUpPyQ/O4o9bpBA4Mh9DGC/ypvogltcmIvQRfgeb+4z4A5WNYcizyxpNjAECduST
 85aj8tu4ldWCqhxgRIQ==
X-Proofpoint-GUID: -1mVIzWF2LXwr2LWmTTxCiP8miOZSYZO
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1e83b2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=8ZZxLbFAX5vHFMKIXQAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020066
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110733-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C16E629A63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
getting removed from the list after it is unmapped from DSP. This can
create potential race conditions if multiple threads invoke unmap
concurrently, where one thread may remove the entry from the list while
another thread's unmap operation is still ongoing.

Fix this by removing the buffer entry from the list before calling the
unmap operation. If the unmap fails, the entry is re-added to the list
so that userspace can retry the unmap, or alternatively, the buffer
will be cleaned up during device release when the DSP process is torn
down and all DSP-side mappings are freed along with remaining buffers
in the list.

Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 80a636962357..a8a58f889d07 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1892,9 +1892,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 				      &args[0]);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1908,6 +1905,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1915,6 +1913,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	spin_lock(&fl->lock);
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
 		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+			list_del(&iter->node);
 			buf = iter;
 			break;
 		}
@@ -1927,7 +1926,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_impl(fl, buf);
+	if (err) {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
+	}
+
+	return err;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
-- 
2.43.0


