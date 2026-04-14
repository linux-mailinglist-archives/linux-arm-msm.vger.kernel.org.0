Return-Path: <linux-arm-msm+bounces-103047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AulOhzf3WkYkgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:30:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C63F5F37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4B6330512B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EE635AC3C;
	Tue, 14 Apr 2026 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLzgBBzb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MT+Yuxkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A71A359A7B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148193; cv=none; b=TscIpVaIuvewAVyAtvyFz0cCDX7LUztceZbtxVG7L3a/fHmb2HUJlhApNwT07YttlAkXBZU0n6AqKJonUJr9y6knQf3hcKr5z44S1BdHB8RRYvj1QqpCxAyIniId8Me9TIh/sHdQZuKkIU2qD0AWp/vTDhmSrQcWEAJSuWo4/fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148193; c=relaxed/simple;
	bh=foKTLroabGy6b8CCElXPQmQli339GG53tjCPvr4Ej10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h5h23IOgwpnlcrLzvq7y0w+GD8p+XNT3JxvBY31HJ0UCFRO7pXhtHlesg0dm7PSjwrVffD+mB7aAac0iRIS/yOQgjlFnbIO4bbBBzoIjwPQrje6iu0PO/5zWkreWYI48DQsdcj4/CsR4D5FhDR3Qw1Cp/0Op7mHdF/kvs7XYf+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLzgBBzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MT+Yuxkc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLDlu33425638
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzNjB9Rkj+GRqUidlRL9ZEObQoAw7hf0ixCn2dgcEqw=; b=WLzgBBzbQ2WzF4T5
	ALUuzdEmjZM8rN0iepJI28pMQW+Y/GCtrRMjpD96RjTWZUd//dRDnogErOESZdkJ
	UlsmSTspuJS4o0DeMIO7OHjuPT8Jd+Ymu7s0YdEC01bTY6hzjOCuI/BX5eU2knNw
	NjHPiQFlcOmzZ3cHmJ0gB2Sf/ONK5xJFAK8Jr7QzrHDeN0GTF0ybwgCF/UKTKeoN
	geddZVzCIVxJSIHVg1zCXlY90xGyilGrfyxvkrf3UAgMj9yDxbNZLLhA2uH/rur7
	CM+WWyRTh4DORIWhOyth6Ty36+Cu7XIzssZBee4Q13B/voEwZxMh80cr+pb9KqDp
	T5bCIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87f9bkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:29:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82ce1c395ccso5806246b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 23:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148191; x=1776752991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzNjB9Rkj+GRqUidlRL9ZEObQoAw7hf0ixCn2dgcEqw=;
        b=MT+Yuxkc1HwO4MnoSuN6wsWeaPkRg38Fh/fF3fDLPkelkB/X2XlLfQ+Gu2ZIpKniUL
         bf299rWhjW9MCfZxe1Z4vMAR0t6dMU/AQWboY0kO0Hg29MPAtSNI8DX7T6tmOum2oz91
         fIyCGB+9qFygEwS93BmuWLRa1ZcjAiIoRnmjPIiHjFGwpG10DM+wp+BMgmLsnSq5Pr9f
         HH3c7UdB32CE1HyE0aTbTIL4wVRF3X1ibAs0fGMfcvoCgFOeOxN04Xwy1pOGEghCQqVC
         DmzJU/RC5YMO7J+lVVzB/DKKvLTSZgPkWnoRjr7GjKU3RO3YXudgWWD+X2KIeZ/Kgm8v
         asOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148191; x=1776752991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gzNjB9Rkj+GRqUidlRL9ZEObQoAw7hf0ixCn2dgcEqw=;
        b=a8EEWb/QgFKnd0tw68jH3/qSd5M4bQQlKN6qW70v/1Mvm9HqzhejvTJQnjSExNElfw
         jSivGQlI7Wj7I4qVORk0Xa5IYwFVBJARu09kZ1HbymLotyUunJRWgd8J2aosSAqT+yQY
         h2NQN9JxFugxk7IOo/+tQRKeRbP5CEuIPOCLBdEdXbT8vrvFEnYNbYBY9DQkGjB6AXHZ
         F7q2ORTlgj7AXjoMIdW2vZ1SGD7UWwNnzIqjUKbSTHnRABkmBwL5BbAYc9DGVivni+IJ
         vztMBzNHweoIvuPlGguQJIvvGHs1RgFsL/rVk5F8MOlUBGEOytl+qoprDM35/CnpzTo6
         B54Q==
X-Forwarded-Encrypted: i=1; AFNElJ9z1920wq2LfAt/oCMPOeVz9bd/kVof+wYQ2VxI0dCYODRj5iAWwSqxyaLw3F5dSp7NftPcuhUehHoe0vA1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9UFp06zxH2aCPOYBdVpP5iPQtDsS+qz+Bcm8Cm3a2Y3wCRxTd
	CsqPPe6gdB+4Uac4r8EHd8T5aK0ZssBKkTkHkHIgKpFgZla5FCZCKTZqqfzUVSUYKUJ0/+ax7Kd
	TjdgIuV9c78KggA8Q/jIqJK2qeVLJbpHPY6M3n+IYzVF153R4pWf54bKY9ZIJfHxJApJHvDiz6E
	xL
X-Gm-Gg: AeBDievqq74mBjtCGiqvbW7VQd03kWNuAgwJbx6NiTCRBmhYN8eDXCNJFul2JsD5rkP
	tQ+H8/Darr3nDVBmjmMj/CNXHF6fCQMImBPZCa7II3+EyAj6qJCw4QssH4M1/HKjjaXiwQRmQls
	TMRfsSdk+/GdzMWv/HpqX2yC/sV4RqoSYYcI4M0ZzJe7WAU1gZVRlhwA0tYzVG+MYerAs/pKEaS
	8/l41E3oOOVySgFYEv/hS25VSSJp9OnTodXInU9AK9AuPVogJ4U9mvUTJLOMfLDfwL2O2Up81fp
	sesEeyPIukHOlVlC8lBKVtnwAVZmdR/14tl5cKw8MiDToppDeojSUo6P+G8Coc2DJ264ISQ0yBp
	Cn5ngTL5ypp7O//sAY5wE19GyhMjLsQ8HJoUJSOi/0D3ZNLIyJ7Y+rhnz2w==
X-Received: by 2002:a05:6a00:4197:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82f0c2c9dbdmr16870816b3a.43.1776148190881;
        Mon, 13 Apr 2026 23:29:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:4197:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82f0c2c9dbdmr16870786b3a.43.1776148190247;
        Mon, 13 Apr 2026 23:29:50 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50d40bsm12964090b3a.58.2026.04.13.23.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:29:49 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:59:40 +0530
Subject: [PATCH v2 1/2] bus: mhi: ep: Fix potential deadlock in
 mhi_ep_reset_worker()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-reset_worker_deadlock-v2-1-42fd682b45db@oss.qualcomm.com>
References: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
In-Reply-To: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776148182; l=1704;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=foKTLroabGy6b8CCElXPQmQli339GG53tjCPvr4Ej10=;
 b=r0sWw9l9IluRseJbGPqzo1H6NqPgrwBXZF6/Q14lBlbqLvSkLzvcLWp4qvhLlw+PsGP6ho1Ym
 zuTEQTxPbNsCKEOVOawJc9mzw42JDjiBp/s6zJ+3zgVKP8q6zBmpc3j
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfX3//5jA1yROBG
 SUMCT0ZS4ByqOD7ad17eMwmgUILm1GlJ5jydMrtEAfp9vWz1Tp1RCIY0NbetBfrtz4kG7kSDOOW
 4FM3mlpLI2U/vEVLOjKg9OzVoWzzFG9umD5/4UmX3c+8ppf4WH+HeSXY0feTaonycz954A2ughf
 pNShOHzNjVq7EH3AYbDAs7eZGAYpm5O+HfAHk4XgdAATNZlfgRMVvo3tFmYDEsGcE3vdSIeOMte
 X+BYjTDI/7ZRojKGkSrTpXRsmICr1Bobo84kLyFmIFeHOhrOKqQw72yfAaNQdcN3s9rmhpGG6w+
 yXI1CxBpuyLDpxRQzdQAwQ5CXeR6EBGaZ45TS3WQONKERRx56tIDrpaoQbZ21OEf2f+OpQpvO/e
 KSOOsyi8520xz5Nz9LWDsl66fxX5LfaoHGxgbR0+aw4ZTXZ97t6NSpWN/077zWy2b2kJJuUiPRd
 mJfqgD0TaL+3rtsMfwA==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69dddedf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bDPEW0BwyBpd79SF-D0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: nTlvG258Ysn5Ed5o6oVdmqxWC0Vsqx6a
X-Proofpoint-ORIG-GUID: nTlvG258Ysn5Ed5o6oVdmqxWC0Vsqx6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140058
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103047-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 500C63F5F37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a potential deadlock scenario in mhi_ep_reset_worker() where
the state_lock mutex is acquired twice in the same call chain:

mhi_ep_reset_worker()
  mutex_lock(&mhi_cntrl->state_lock)
    mhi_ep_power_up()
      mhi_ep_set_ready_state()
        mutex_lock(&mhi_cntrl->state_lock)  <- Deadlock

Fix this by releasing the state_lock before calling mhi_ep_power_up().
The lock is only needed to protect current MHI state read operation. The
lock can be safely released before proceeding with the power up sequence.

Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index cdea24e9291959ae0a92487c1b9698dc8164d2f1..4bb007d1933315e5b0b40d235248d5373548d3f4 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1087,11 +1087,12 @@ static void mhi_ep_reset_worker(struct work_struct *work)
 
 	mhi_ep_power_down(mhi_cntrl);
 
-	mutex_lock(&mhi_cntrl->state_lock);
-
 	/* Reset MMIO to signal host that the MHI_RESET is completed in endpoint */
 	mhi_ep_mmio_reset(mhi_cntrl);
+
+	mutex_lock(&mhi_cntrl->state_lock);
 	cur_state = mhi_cntrl->mhi_state;
+	mutex_unlock(&mhi_cntrl->state_lock);
 
 	/*
 	 * Only proceed further if the reset is due to SYS_ERR. The host will
@@ -1100,8 +1101,6 @@ static void mhi_ep_reset_worker(struct work_struct *work)
 	 */
 	if (cur_state == MHI_STATE_SYS_ERR)
 		mhi_ep_power_up(mhi_cntrl);
-
-	mutex_unlock(&mhi_cntrl->state_lock);
 }
 
 /*

-- 
2.34.1


