Return-Path: <linux-arm-msm+bounces-99745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF7+NlsFw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:42:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA531CF3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9876310B629
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A09D360722;
	Tue, 24 Mar 2026 21:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iL4rP82k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnNoqX/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927135F8B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388443; cv=none; b=IKVYmaA0pK2mwRYIkl+NaKLT+JS1fUSN7uPWKpO+XM2erFY1fuRUS+ugvm/FtmJLv28dV5u+Q7NJ1IDgYB32gGJSU/IwBq90viker2OEKPlB5Bm5uHUm9dViprLHEAoKiakzJN+ylKNA0IehF7kgjfU8oHsRif45jXPmXwZpN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388443; c=relaxed/simple;
	bh=GzFnRb/5aNO0rFNdzq3eanYc+4uzepiO1YNcdlnwPW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOKKbkVYMJXsL3UGJbi4L7CWvGb4sZtFsICCNo58xAgUTYGq5mUQvo0a/Bu36cAPNuilSYvCeQye41S39wgaarhvRNvfzxlvEAyrkcQw1LOxgPCudZQXiai6yGn/1cvRIN9JM6w3AeqageDkvOf+McuVg3Uam+c8QuDCwPM/eOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iL4rP82k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnNoqX/s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCsem3110463
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VIBitPKQ5iS
	p48Wf7+RJ4YDtudeu6rRnT1VURwtasZw=; b=iL4rP82k1o3uqKVd1jzG0fbBm3P
	XnQKjcCYzOwFANYAZHhF8QJ9+R0/O/kGgCSMNjrti98JITh/2D+KOStCy2s1W+yC
	96LjMKuvwq7x8UgRBjldEwwL2jcmJayL6QdqtrzVfz1i4sFL+3FPmQbgWiI6sGsl
	eREcAOYIc6JerRtZlf3zTK81smQWJpFBQkTv6ULshDnDhqd1T+5NswbIyvO40gBQ
	2C/U9mCN9OMS5fm1LFidvoGfmH514W392sJIBhIUrnCYRAU95gOMLBPUcNnrGOg7
	yDRZlYhgdaeuHC6wdT/fmLGsOCHqk2pTsCT5kpJQNqKl3ZT+zcqKJewaoeQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvsjdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:40:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b051befbb8so54832525ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 14:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774388441; x=1774993241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIBitPKQ5iSp48Wf7+RJ4YDtudeu6rRnT1VURwtasZw=;
        b=gnNoqX/sEugBdJtxIIQQc0jyp7QGPlhRaaGcphCAP5xuIMX8uFvU4BNNK4zHwGk+gd
         JKDs1UOKDiw6VfRL1tPLxn91+UHALXtcdQRaiIQmuXkLKHp6SbqWxt3paPz+fcSrC2w4
         ZKZ+68fakgVzVQvbW9Npvrmm0HHtL/iWEzx3GmRKMtBSd7q8oQsm3hTUI+59dfOlb2Fq
         VFCKKRDrkEHSY4QQ2IqmPZNx+7gu031PreG+ruF35fG3Dj9QH+sTNQtXvXflGe+Sd2kS
         fdN2NjVnkWAIh3noTGvCsopUyHSFdwNQ91l/an30xL3fhL0Ek8bpkVnnHS4awfjXe86m
         ADYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388441; x=1774993241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VIBitPKQ5iSp48Wf7+RJ4YDtudeu6rRnT1VURwtasZw=;
        b=AWxA9x+RfK0kVjg7fxPkouKkGDFlNqPcc+WDNpV6f9LbTM1wxWhFPhOHm7rA8qvcXH
         /usOTikYToXyu/ePM8ei778eNvpmUiOOYTg6Vk6hu1TJROTQYOKI3Bgtjn68FUbiUW8e
         uQezCXB+Bkq1GajhUalbLLkC04H1A65b5VXvIam9YNQ7+MV1v4shWRyCTNxkyvlfoqm9
         VkQQ0QDCnhqDI/Aemigh0NeLMtoJn4ez5jdRZri2lhm4yJkjs8jJjzx+iStIzbiPt5XM
         Q/VX0DlUa242azV4SjlzgM65WjoNBWQitw/UL2TNeUeiw/KRg0VDa11U3nQEgLVg2xeP
         3BEg==
X-Gm-Message-State: AOJu0YzUeGg5vUOBcaJdCEuZNSfKmTZID1emcnTuN5d3W2s5MzZiGHud
	eU5xmHzoOsyibtJbmCSJG1LVbjgPBHiHmP/n1Up/yYEf2pJYsRmYZgcPUzRQDSoU38rAvI/iu/Q
	VUQi18E0+VhAljCe3sM2jQz3uJtQZ0buAtJEuHBaZCeIp2xupxQbDMGcT7ggB799dn3r5
X-Gm-Gg: ATEYQzz5qbFrHV/B0V431hzUjHikyZbchrtmh9jdZpaLrb+60uywmC/PETZ6aQP1pgK
	2DCjaXnBt4S5uO1W/xSB/YiopqK88zfyAR1H7d2ziiD5mP/rs82c+6wJSG9GbNbecl9qBXCpKtH
	UdhUll1oJZ8dbWEF89nLdp1Yc3jSF6NXyu2c/eAhtBX/FQvEuMHoztPfSXoJxRrxTrG0If9Vff1
	YF3arT2oQdu23CRJiFcA5MvuZsvsKpRRfzBMqJVo56hcRKEM8x6wEUE/rhbMFiWH80Werpbgg+5
	Ip9lWbYgh9DboyPf5CXGFPysqvdze5iL53UHBMHdw078VbdmfvV01DVNHyN/LFLGu3qVn5jLBuF
	Pvy9iPKrmwUHw5eNilWfqOUHD+Jkhvpt8
X-Received: by 2002:a17:903:b88:b0:2aa:d506:d189 with SMTP id d9443c01a7336-2b0b0a8d22amr11738615ad.34.1774388440745;
        Tue, 24 Mar 2026 14:40:40 -0700 (PDT)
X-Received: by 2002:a17:903:b88:b0:2aa:d506:d189 with SMTP id d9443c01a7336-2b0b0a8d22amr11738375ad.34.1774388440320;
        Tue, 24 Mar 2026 14:40:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083529e8asm162554315ad.20.2026.03.24.14.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:40:39 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Fix VM_BIND UNMAP locking
Date: Tue, 24 Mar 2026 14:40:32 -0700
Message-ID: <20260324214033.1219113-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324214033.1219113-1-robin.clark@oss.qualcomm.com>
References: <20260324214033.1219113-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NyBTYWx0ZWRfX+9tNyO+jYXch
 A7vY9Ejld26MB62/fa3lVacgUCN/G/rIRca4d5fNASRx9JpZJ514PW/4MO+pxQheHhli+fHOcy4
 ZZto2dhPFliTy/J24un4hXs2mymZE4DmI12uMNT4miKkWqE53dbP6dKIK+qDGkCbpQDSaSnZJsf
 TnMLybcvDq6YxYsmwRYMXHwXPJI2ZHfmdNjbLaYVcraLdChICevdDR8UYl7oRTdfRm7pqSzPdU+
 PPEzo7HuU2DKUHnKnYDZsEsBOn8fD+Lq4Ah8q8gMahszIfVxrtCMtVIymhuwZQdtDR+7Q1/yGFN
 YCjuWZgNexKasZASX1SZU6g5DwL25LVPJphHlAFdxSNmJ6ttUoyFuy0oBu9ms8JA3MW4F+wIi5I
 XRXEL3WolBCmCAcTUSOZ/wyLRkTQMe8Wu0QN3iIzADK4yqQvQYgSXcQ5FWtwTcO2/Ay5a1jnvje
 PTkiaxdN8sEF/XThlwg==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c304d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=eWlSUfSnBrBg5eVjM6UA:9
 a=ZXulRonScM0A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: yVq-82WKRcx1fn4WU5weLJ2NEDRoc9fj
X-Proofpoint-GUID: yVq-82WKRcx1fn4WU5weLJ2NEDRoc9fj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240167
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-99745-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EFA531CF3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wrong argument meant that the objs involved in UNMAP ops were not always
getting locked.

Since _NO_SHARE objs share a common resv with the VM (which is always
locked) this would only show up with non-_NO_SHARE BOs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 68a8f8f592fb..40892e206dbd 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1251,7 +1251,7 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
 			case MSM_VM_BIND_OP_UNMAP:
 				ret = drm_gpuvm_sm_unmap_exec_lock(job->vm, exec,
 							      op->iova,
-							      op->obj_offset);
+							      op->range);
 				break;
 			case MSM_VM_BIND_OP_MAP:
 			case MSM_VM_BIND_OP_MAP_NULL: {
-- 
2.53.0


