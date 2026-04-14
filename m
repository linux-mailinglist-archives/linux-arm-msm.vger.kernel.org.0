Return-Path: <linux-arm-msm+bounces-103046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Mz1NPze3WkYkgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:30:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AA23F5F21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAB34300609E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E8035A3B9;
	Tue, 14 Apr 2026 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8hv/421";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MntKn4OR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ED5357A40
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148189; cv=none; b=MoLifG7jEHWqpXsWKP0NNtH656ObdXvH4uhIf4jWu/ppszDOtLe7G7rUe+OoEjzbvSqSJZOmXvUHaYbd6GfFvY8q7fXaog8OUMVo/ZFxfpjuKKRq17I2/ViuyY/oieo3ubc14pML4/ZeHXzbQyibO8JTkmrO+bqtM3rNKucTn7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148189; c=relaxed/simple;
	bh=SLMPMucuMihuiOlx7PaQq4SBAxfTde3J4Eevj152d2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a2TuQ/VLSxBINk3PIQGuMp3DYUCYZuepkAErqy4XWRNNiF1p7ah4i4RSQEA4WGxYW5pg7/VfLBdndd0BAFClP1sHufVc4Txkom6LKiS6y6gS3OXEWkeaYwR+L2kio83YdmQzpb96VegZYp1d+Dz9OSnqtfjenEB1TGW5bLryASY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8hv/421; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MntKn4OR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCd263505276
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vSfZ9kEGx3ZJ6XOmihl6K/
	6a8EWL9iMB5kiI9kbbT2A=; b=o8hv/421KLiMQgZf/DeKITHNDcqRX6Iht3/1Ao
	7TMmvEv/hPjKblEnAiaxEXvp/KwFqwr8uNytSS7VasXnOUjwJlJa+umcpEST0dDM
	cUitbvqn+wGnaojIt1Sb9aTZftLf9Tnyc3H32f603AfrWyF1X1ss9axXoJkMSZ/7
	NYGsrNGpqbOpxnwZEtyP2xBXt2qVtBLCNSFo92Hof+iSxZQm+NxNQB3kxqEdbJmC
	kqnfiLXay4WZzz5uNtS/E9EivON8AYsf5sND2/doSU48ohX+bykSlRrUqsiaeC5P
	Updd1QqFbCgxAWYDYmF+S+MtT7q7rDDw0Tjd883tQmZ5exGA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870hbbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:29:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f2478c37bso3379521b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 23:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148187; x=1776752987; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSfZ9kEGx3ZJ6XOmihl6K/6a8EWL9iMB5kiI9kbbT2A=;
        b=MntKn4ORRqdPbwOzIZ0KH+twZX9v0i1O7TptPm+JBKRFX8qTPNi3RmFOFwlXulgKsh
         x5aoR6YVNbbNWmepxn5d5jzDf7GfueQXa5qg88E7/52TgiffFswpaO7zVyLN0pECyIqo
         4jSoWuTDwJ3yH/+fcNeRyj3Hx7NXmeNm3mWQxPEoMVrbiufyuZRR+oE10ff16V1T8xKf
         hSh/bds7zOujl85XlExdQ+tWjKh3wjpDF2ZgVg9u8C8tbE2nYgFTO2XNBJ6pkhu9ZC5t
         3Go/Mc38uehZsdPTtqEcrL88edmDVTuCng7XYjr+42O6kjSqI7sqxKfqjV5aGNBUnVDs
         ILnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148187; x=1776752987;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSfZ9kEGx3ZJ6XOmihl6K/6a8EWL9iMB5kiI9kbbT2A=;
        b=e4585c6KgxzyUYgw6yLsIk5b88zzg0tAsijU2G46aF5RihmzcTNiwwmXoV/vmaNgyA
         HwDuKwfZXr882FzP3Mva2+nTUDEPY9Pa8E21sQnoOU4IdPlpTbxkqlbAE1nUNp0dUn56
         fh7hdk2xyr2VVz3QCEcHnVjnWPYr/lR5e2VwtJSR1aw85nkiPuTxSpuhiMbK9RGK3RT4
         oh7e5jwa2z1BHnts2E7jlwlMoVa2ObXZQSkU4jvp9Ae5nwEd3DJ0LMF56n6v3mNjVMxH
         4v7XG7T+ttZ+idlQHg/hKc2eyMYwsgY+cVzQzvQ4LWLsO7eHFGdSCbOD9J4NE5vAf8HX
         z8zg==
X-Forwarded-Encrypted: i=1; AFNElJ8QPysclR96hnPjPva8ecUAnRfhZxhi4CrquYxUK0HpbNnbq8IjOd5TFMtF7Hje8q3N4i/2G6Hkm2jcdKUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvojmIKag1ccSxe974ZOmT6n47xh7QTA1Csiggjys3A16Sb0I
	B8Jw57fa+r7P8rVhL2DP8jl7f2rf6aAIiqkEMYBFK3JprU4yXjuzk8vxw2cK8XMtjVDLWUwkOOj
	oDQFiGgqB+lY2dvascsT9SNdE3Igw2dHdQHXixumvQi2vyiM0qQdCVY8yQRn+ISqcsQXY
X-Gm-Gg: AeBDiesYjtAiZqBqjrpmlCfWAy5Cc3YDbsW0CJI3dWxTSXQdZRRL9GgxLlq04kgh+hF
	nKvRy3yV5EvEpDv2j4o5slON0XnCKrnoNz4Obi+wE1nR3c+bw6sXL3omRf8H/MCPqlN81V8TPyq
	thS4VATy1Yl38jrCQMkc3oLARCQmLFqdeOoJbIm0bTkMlKNPH+Z4CFjKNiGoCbWnUhQ3yKcCdog
	KybHk8pw6/FsY0SDsjVvZsRIdyzOftGq2b7M+gbtlimuey+JxvKmu1p4aMIvIFm+yIXwek8mGDt
	OxEJ+8E081tfypjeZSuRizBarxkUZ74QMjh0GiNZus4z2UYCDWI57mzW/5kwCBb9qzd2XWuIeQZ
	DVmgrdMluO57GTxrxapPUlSyRQWbz5k7wNdi9N56MyAcMwMMpgfozJsYP2A==
X-Received: by 2002:a05:6a00:27aa:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-82f2243e66cmr10950772b3a.32.1776148187016;
        Mon, 13 Apr 2026 23:29:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:27aa:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-82f2243e66cmr10950737b3a.32.1776148186395;
        Mon, 13 Apr 2026 23:29:46 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50d40bsm12964090b3a.58.2026.04.13.23.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:29:45 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] bus: mhi: ep: Fix state_lock protection issues
Date: Tue, 14 Apr 2026 11:59:39 +0530
Message-Id: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTe3WkC/4XNTW7DIBAF4KtErEvEDMbGWfUeURQBM25Qfmggd
 VtFvntJ1F1ldzPSG+l97y4K58hFbFZ3kXmMJaZLDfiyEuHgLm8sI9UsUKEBAC0zF77tP1M+ct4
 TOzqlcJQKUfeqG7rQk6jd98xD/Hq6213Nh1huKX8/Z0Z4fP8TR5AgkbUKQMZ5sq+plPX1w51CO
 p/X9Tx2fpFmCTHkWosdeQ+LiJ1HlNSojLY0eN+0c0irAPUS4pqWve01oVXzCKpFpGOytvfGD9D
 /RXbTNP0AIZLgl9UBAAA=
X-Change-ID: 20251113-reset_worker_deadlock-0223907f7c9d
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776148182; l=1047;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=SLMPMucuMihuiOlx7PaQq4SBAxfTde3J4Eevj152d2I=;
 b=lwtMIWaPRPDh65ac3Ln7X4yb3fLuuTtH2CeP7cLm+g9MMgqhBEAVaw+VLuZGR7b7qqQdVnr6E
 cZenQd4z3qCA8/wqXjy7L+AWPuq4Sdh+aJSH1wdft/0WiR2gqTUxWPC
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfX1u1EvhEurPL0
 clW/x/6zFJ9atuEY3di7K14vqMQ5pbXAfnk4Ay4Bbz+cvwy8nzmewA/cvP+TZIeykhoGWvfXBya
 BR7G1P4AW1GqmMjjy/4161gAYG9iuNLca0jrez4GbnzOQ1HAkPo7iSEWPLDzu6VDFvIS6I7BE3o
 eE4YUGWHXqtb7PlBcDi3V50AvQfU0VRubIJgL1V4I8A3K8Qi66WxuNdRGhZiRFk1pt/f6L+9sNx
 saTgasnIU9vUc29/cdnb6dnWl1kIA8qOZ2TjmmjebWWpZ1lWGuFU4qM8wclGQLC+vNnGFjWvnVe
 cXLSoEeDv317E1PmK41x9j4n2doXkj1S6P9R17dYN3kczH3ado8E6/ycavALjMut0BbGONXcxYJ
 2BeoV2GNQiXWdoeEM2XbxR3sJ/xz8GuTL8RswqJlfEsmETC+QbMID3ILoKSSQg73A3MSS+KF/n5
 zpTfZsac6sZt46rMGlA==
X-Proofpoint-ORIG-GUID: vucpj6AZ6OW4HKU7nDg2j7gwXkHky8K2
X-Proofpoint-GUID: vucpj6AZ6OW4HKU7nDg2j7gwXkHky8K2
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69dddedb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZAiG1xSz17VMwVfmIi4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140058
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103046-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5AA23F5F21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a deadlock in mhi_ep_reset_worker() where state_lock is
acquired twice, and adds missing lock protection for mhi_state access in
mhi_ep_power_up() to prevent race conditions and state machine corruption.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v2:
- Move `mhi_ep_mmio_reset()` out of state mutex lock.(Mani).
- Removed the mutex lock from `mhi_ep_handle_syserr()`, since the caller of
  mhi_ep_handle_syserr() holds the lock.(Mani)
- Link to v1: https://lore.kernel.org/r/20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com

---
Sumit Kumar (2):
      bus: mhi: ep: Fix potential deadlock in mhi_ep_reset_worker()
      bus: mhi: ep: Add missing state_lock protection for mhi_state access

 drivers/bus/mhi/ep/main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
---
base-commit: 6fa9041b7177f6771817b95e83f6df17b147c8c6
change-id: 20251113-reset_worker_deadlock-0223907f7c9d

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


