Return-Path: <linux-arm-msm+bounces-91609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFhfNdubgWlwHwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:55:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B53ED57C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D82A3008249
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EE938F25A;
	Tue,  3 Feb 2026 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWcpLdPS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5vTMBAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8ED3783DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770101714; cv=none; b=ZMD9i5fH3yM54vPpJ88vWjST4ddkFA+RFP26kPQmiqNl9twPU5EvK8WssmZyEy2Z3+SWTyN8HbE2zkPl0nOHWSYfc3xBPUWesYgEaO/mFqnHvBue22wqSTxmYUZKjE09oAQ3ojWqJUmGHZdeXR8vMs9IVFNiHS3tk6jqm8Z+u0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770101714; c=relaxed/simple;
	bh=xUFQC0oKUZhMbN1EUEq9J4r8gaEYrW4edfzPoB2NIy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlMy7sgzbvZEABjWlPMvF8lbQTECahLz4036yZwCT/FOcvKyGy74Zhkj1b4emntcEUAP+w1h089nGmyf3M2IORMNFxfCrtn7fdITRDGPFGrdTDWkCTprIoZbVB7HUE6nzKyt4wOtS9u9ZvqzfIxdKIXn5jotDLAPoM0oBUb36vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWcpLdPS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5vTMBAA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61367Hpu2848631
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4F/hnH+TubDEnoHXK3j6joX/LfhUU7/6hZeKGHC2m3E=; b=NWcpLdPS9fM4Ycz7
	YF3EkmOX0kPL8DXwcSJgL4yTn2qoCNZeV9LaZwHSilRrE09rj2k+ICM0WDAGjbKb
	fUGEcMxJxgSc8hD/IjOSemjhiAjPBGchQQYJNisfpFWeAKrqiXjCVt+whp0K6Yjk
	uJ9Qmx5v0OmlHCWFiSMaUdud5TNNfo6kZz+wTQRDk+wkvpGbbBYGhOBAXwgkcQN4
	FcfMInye8L9+6q6F7ZgQbS4Vpbey5WBXH89+KmSDHjtugdJ1YiQd87U31DsCgyy3
	JWgJEOjD9bMTkYB05AbHHp/Y7meLp+HykT8NfOu7IH5ABhhoZcvW3J+YRRvCGami
	U1M4lQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tqtkb1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:55:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3545dbb7ee6so1794999a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770101711; x=1770706511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4F/hnH+TubDEnoHXK3j6joX/LfhUU7/6hZeKGHC2m3E=;
        b=Q5vTMBAATIwFV6qaTIQ86zmibaKD3nmwjIxJ8FywjAwFFf889Ad9KkgY8f1HIG02MZ
         EO9UELIJvQfg2D7hQHCQUrJquNZpKaSUfGQu2ZGUSo6dk/w62cz3TeWjbq5ztiUsQ2J8
         REc88XK/KG/On9NFkL8kobGBDDU0oqaHXqrB5w56nFDGdX8seFl5e8WjUem8DfJoLeP9
         dYCLZC912Xx6ozGPKBUiG5zBQa/MCGfC9VkeiwAGwJVdCdod10OqnN4QFYwECcSGBswj
         s3Qks+48Wq4xTboyJANNAAMumgbXEZx/PoOjTO6R3r7O6Yfavd6kw5Nlt9Mn7CQ9qa/y
         /bPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770101711; x=1770706511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4F/hnH+TubDEnoHXK3j6joX/LfhUU7/6hZeKGHC2m3E=;
        b=J3qY4S52Mf8dV6BcVUKNi7vCQe8fIRP12ANLLhxbI7PA6uF/5ZWzP36lIVm9gmU7/x
         RkjZtLIPKkQ76pAg8ovdTIvpIStfvUBodpQqDdvcviGdjTUtla/IjWSxU0rxH+3qatIk
         kaBjbjSfzA6AqHRAHZ7fs25acp1EO0h+RvdWPJJGjeOv8RBVtxh4ac+JqPBNdrtcgVL/
         NbnRsGnnrFLdwJ0oKSmWebLdyoLQGeWzeKpaAqscq9+cwbDdyR5p98Ne5cqteUfsOTdb
         LE4RV0sHQF5fD4h4TSVuBiIbJqdazES0BkIFqC1OK3oWT9vsjpJmLzXuZk9lToeCzx+a
         OKeA==
X-Forwarded-Encrypted: i=1; AJvYcCWgLLHDa2jf75y8yX+K8bp4/Ni+xbdhgGVFbHhhkCzt1UWidDlK95gK7Rd10tBpZH2aOcfevLF87WDAv5eh@vger.kernel.org
X-Gm-Message-State: AOJu0YxLLx8E9xcA5TkyjnOJ6ak74BrMOYJPfApMGcH3BSdklKvWs5k9
	09A131idMBPIU5pHiBip+ia64wvFKMCB+s66s+duJSHZpnw4PQb33WDZNS2fnYIdp+ZLBJLGZ2L
	KhgbsIGTazmQv6Dx5qBbG9UdukryItrxPMMG+HXt44bDh3N/SJn7UWazSej9c/MVX6euVpbwZSd
	TD
X-Gm-Gg: AZuq6aKU7aIrGvYaSYy6h4b9lI8Jmm3h0nYCSdn9dFfg1Jztc86Vtzfddo06T0cCckb
	BO7ZqNDhL1qvGHGQPwrweyt4YYZoCBK94aHnmnc17mfm5SVZma/PIOfkEuWWXm2DAQqvnRMVrOb
	BK1S5IdwfigDCGSoMG1OO7C1SzKVZZMUwm2LOOtS7oGvWhnPwQ9d6fx6RMv9Rn2t9YELlWB1yvm
	wkcmK7qTpByHYozvupYvlSbgEXDacJnr+aGd7Fuf92eOp1RdK3LwQ79f6trXmHJcdil0EV6bOPO
	8SOV4QqiXJyWnNm6EaUa7nKrsNQTUzSERAyG/k3A6FkTslqzP7H4qNj4oqaTI4Iuc+DDuUNj5iw
	EVLIX7wz7WltvQtcMiN8Nwaf0duAPLEwwTJ4=
X-Received: by 2002:a17:90b:4a4f:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-3543b32c8d7mr12527521a91.14.1770101710613;
        Mon, 02 Feb 2026 22:55:10 -0800 (PST)
X-Received: by 2002:a17:90b:4a4f:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-3543b32c8d7mr12527507a91.14.1770101710056;
        Mon, 02 Feb 2026 22:55:10 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547b1036e6sm837924a91.11.2026.02.02.22.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:55:09 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 12:25:01 +0530
Subject: [PATCH 1/2] bus: mhi: ep: Fix potential deadlock in
 mhi_ep_reset_worker()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-reset_worker_deadlock-v1-1-7ed889b5bf19@oss.qualcomm.com>
References: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
In-Reply-To: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770101702; l=1569;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=xUFQC0oKUZhMbN1EUEq9J4r8gaEYrW4edfzPoB2NIy0=;
 b=kiC3cPCpVYFsvTLCpb7ic2ubQnDeFKHXWXJxB1QeBVT2ghA6iJT2umRb+WNFx6knSyTIT/U8/
 XSHESAFBW8BCmMsa+pUWIK1hy5nSPom2II1jZJaVDtVI3Z4DJFYji3E
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=69819bcf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bDPEW0BwyBpd79SF-D0A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: dVqftLbZ2O_Z_8V9r1GdM9vLjG6h11dl
X-Proofpoint-ORIG-GUID: dVqftLbZ2O_Z_8V9r1GdM9vLjG6h11dl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1MyBTYWx0ZWRfX+buATCkEM0Ez
 QNKxnXo2cP3shm+uD5lCUyCf+s8SQQGk9wC/G2HyABoG3Boz/7nQh8s7Ph+IoIjT1WqUjMoKhns
 3wfMRCGK33IQw4pcj1l0Sf/tK6+NVU626S31f4Qzi1AZVIgzW/9eCrRJDi+dkgZfQnzrMDk8r0v
 rqNqWpZRFEbvXrPrpXHD7IJ4UOzmuuF7Qjl19z3U2akpXYarYJjSjXuHC1MOYrvysvMorD7emTN
 PsXueE5v9OaZGC9v7KEcU+WI4P+k/YpIzwa+Qe6kiAEtUd/KZOHmjtmWJjlBlSmSyMs2mRLCljo
 5tPq2NZ+k6zKjrZo+pag4uymtAjOYJxJn8fw5OKY8BP44fPEXuaAXslC8lSc1INS5ZstYPvRxv4
 IGpHes8pbUVtu5V9xI+58TaqBlnAOxq/0hIEWaMOvPgCV3HhBM0Hdl9QGtsyel3Y8xAV/VRwHnJ
 U4bWo0dHUKb8JQaLi/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91609-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 7B53ED57C2
X-Rspamd-Action: no action

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
 drivers/bus/mhi/ep/main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index cdea24e9291959ae0a92487c1b9698dc8164d2f1..73597de373ef7e0c428bcbc126d63a9a97f95144 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1093,6 +1093,7 @@ static void mhi_ep_reset_worker(struct work_struct *work)
 	mhi_ep_mmio_reset(mhi_cntrl);
 	cur_state = mhi_cntrl->mhi_state;
 
+	mutex_unlock(&mhi_cntrl->state_lock);
 	/*
 	 * Only proceed further if the reset is due to SYS_ERR. The host will
 	 * issue reset during shutdown also and we don't need to do re-init in
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


