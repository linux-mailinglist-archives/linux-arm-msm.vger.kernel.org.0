Return-Path: <linux-arm-msm+bounces-103048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL/eKnDf3WkYkgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:32:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 874983F5F5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0922A301550D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A429A35B12B;
	Tue, 14 Apr 2026 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzXDJ4yZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZN2niDeF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584FB35A388
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148197; cv=none; b=ajFb9G3quZxc1oVvcgMFvl/ghci052Mpp5wazaPynA2HWCfQulimWdGian2ED9s+3LepqVMFYZKueZr0ug2hE10xFMWrqkWKeFVrFpaLN2j9/J5GSeb2EAEgJ+AWtUjv74Aoo2Wy1aMjgHnmLwE32OVASumD5bcJ+qLAMTKozhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148197; c=relaxed/simple;
	bh=VUUEikl5UHPOVfv4oKGMvbhN6g0SfRRYaQ479Gv4di4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdNjYt+ZQoDInoI2nAoSpgl41MaoE+wF55F5JkcerF1Vc3aAOdCYv70w4Uhgn0ol72o/4XY1WD4xOshPraP7KfqgTiCMG/dRb6fBWiJn3aati3snQQT6x9uub+esTKQ9KgFJEENE/ACOa6l4d2AKukrBJcQm8nv5rop+zixepGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzXDJ4yZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZN2niDeF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCdFV3505281
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqmdkV0e8/mUqDD8XETz0W4AA/xXm+x9z4zqE7KF6y0=; b=DzXDJ4yZOhQ4A+9U
	33AwvLFNHP8PKCas+8cB+BkokTnQXwFbTAbQg/ER4qciyloTcqjN+VrJm3EcQ5Ce
	T9DVwBKmMYPYw8VkduttlVK7d/bsOdo/pIUnzseTyhomHvvSlY7LRPne2aJdCrq8
	onYiAg7TVBpzZ+4yclqqAarX+LIG1y8QTMTi1lJUb9SPjSJIEoeqCOJrjMT+d+iL
	9FoqjlWlJaCGrAWVfdTaGj2GJUIJngidJna7cMudEtBALiasvYtiLOmSeu8eCViO
	28h3UIUNh/+d4+RfqDpPxA+BLV897fLkW3R/AwMLGZiPnFOz1vTpgJ+pykfy6VCj
	1KH+Yg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870hbbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:29:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f2138a9e0so1320702b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148195; x=1776752995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqmdkV0e8/mUqDD8XETz0W4AA/xXm+x9z4zqE7KF6y0=;
        b=ZN2niDeFF7YvKIySAJcFY+sbbk+3iXGkpEvUmTieNX5lRuP+CZMBvFQOegvpZYbhbS
         52Tv/vo/ZMPr1wDh236qBkO1t2+PIu1LNAoT1Gn6SsxSbhHd2HdWIiLQl7XFEWXiOJSx
         hHAF6YD84Y8J8bA0jGVF3G6OkAZXWRMOVSDBGlqf9k0Ixbm6JLO2AhZJnBhglMeV4Esv
         rrO3160j/F3ReUjLC5ayVXRDSssjlssKuerG3b7Ctoh2O+nXitvYnCMwd3OYK8ut1LgE
         7HBDHciLvNCsca3dsSzqoRSPEFKeRgt3iNeEyhbM2l1Q/ODdYpgEhrm8sGO2ZTjh+Eqy
         IbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148195; x=1776752995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqmdkV0e8/mUqDD8XETz0W4AA/xXm+x9z4zqE7KF6y0=;
        b=c8dl4dPFlrkjflo7fxmd58HfE4E/RoY8mv27XWwzfkVFElq6PgGFZh59N9y/KYmDvr
         aRx6JqClcYMZ0fHXkO9Ka2k3gLPYxN6ml2wznvYqAmGQjXvGzoSLEnhnvVmAvqG57Y69
         8VdjhGqzu3G4HMrlMqxznpAd9xHWCzwSzc41sDaLZvtS29aswnl+SrD92pXwngfdOZ7P
         ZTYTKy7pb1Mz4slzPMXVQXkVRRQ9kQTECpPbIiGHIurOFnTcP+4/Rr3C1QJgzYtV6MCM
         bR18yT/uNURWbCryqmHdFlU1aM3E1S8Pllk1fNZQcLJbQwL/iasFGHmAC3bTCP4vf4+F
         549w==
X-Forwarded-Encrypted: i=1; AFNElJ+FIbwalo3rqMfZsubaYVuqxRo9ByYw0VyE4YmiTzY5sqSQY3LD2A1dkFlwUawSw2jI8Wj0OSVPlWujUvWP@vger.kernel.org
X-Gm-Message-State: AOJu0YzNe8Cv/HLPAZYoJElRM0gAE0weW1+DyDcPcSYsJ0EWVTqH4oh6
	FElpSt07+lTqKSPIBLsLpcbypE9GGHgO/bMzBKrE6bnS6M7AF58nXCneaQf2gwuDmsg56Z4nvhA
	a4RqPh0/fpibGyVkeeOjfqY4/sxrpHfaHy63Wj7AavKZFYD2FU45SlrFxgQ/PjpJzPFYl
X-Gm-Gg: AeBDiesW5CQENgUY6jjFwhcIZDY2vdEgrrey5S8RABpm33pQ/tZl5/Zb04MXjY2KVxr
	2u4SNxTB2mfJcFANFrBbMFtoAZUXqrdSt3TurskzfJS0oWtz/knruirJwngHueqqvht2hxHwx/w
	8wE2gPEDSgjeiZPaNXnm1DSXSf882Sip0kptIBqJJBng5aQyZXZNUyvspwRi6ya+3qpo9fBkiBN
	LTK0RvieiQspv6F7NtzkFNsTdMO3wjdL8zHeLMr90LmWB0z+sgiCErEexdtjSI8+b0Xb0gu9J1w
	pZ9Lcm5rAp6mUb87AiaAimQXIN69v/hjd6HmdaOLBAJwxPXa5yrYjFk6PwTt8a/IeppmRzMlMEC
	0uR+CvTyMNH+P66XVc8oVv+JkULpCOt+MQGmHRo6R/KWLOTAnnAuFJ2hEsQ==
X-Received: by 2002:a05:6a00:4212:b0:823:9e5:855e with SMTP id d2e1a72fcca58-82f0bea2ba5mr15310036b3a.0.1776148194940;
        Mon, 13 Apr 2026 23:29:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:4212:b0:823:9e5:855e with SMTP id d2e1a72fcca58-82f0bea2ba5mr15309995b3a.0.1776148194389;
        Mon, 13 Apr 2026 23:29:54 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50d40bsm12964090b3a.58.2026.04.13.23.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:29:53 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:59:41 +0530
Subject: [PATCH v2 2/2] bus: mhi: ep: Add missing state_lock protection for
 mhi_state access
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-reset_worker_deadlock-v2-2-42fd682b45db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776148182; l=1292;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=VUUEikl5UHPOVfv4oKGMvbhN6g0SfRRYaQ479Gv4di4=;
 b=mfXuiOs0RRm9jJDNSqoGDvDqK4EalrFkiDlK4Wlj7Z5kJkqkvDp/kfdRKK9qOrU7RbAqLZZn6
 EjeQW2d3BIfBHhy9xK6WLWoCFh4PwFb/LSAZ4eI/BcV1jYZiDpGFFeO
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfXy9k8HOmKc84o
 kxO6JXzTcfOsIShfH+YJxoG6bdg3y86hYEwx9FiS6bRRe5ifAUgqv4Ti+4RcA8QwlRM21LwDeWJ
 XP+4yag/jic3HeaAkuZ/Vkzx/k5U1OTDKbQ14gAWXot+oYNf3K38fl0FysOF6ONuSBRf9zB8Ajz
 p8Hn2AT1ndvqjoyaw5+qTwbYDI2AAvIz5Rah2yPWK3+sM6epSyjuKeei84r25gabwuLHZXRHNRL
 TyPVWCPhbFavOOPFCOdf9S/zFsZM1PBcO+n3wg3ZffuEnUlNSwAYLABa8GRuUq4vNTvjAqykQ1g
 XaDlCNy0vdG1Q6AUrBrHJ6+LBbEWX+ve0dtvtshCjRG8J/KLnBk/yXDsNEmVzT8SLqQcXSwE/GY
 BYt0wz+o6hzdAfO0j8jheGhUaV2Z3nullNkiZNeeRDdMbYIPghClpPkhdPRjCIvvHULZfr2KtIu
 Ww158naY6OA2xiDwLcw==
X-Proofpoint-ORIG-GUID: vBXT-spcBwRFvKhfmj6ya_8aWVBC4Glm
X-Proofpoint-GUID: vBXT-spcBwRFvKhfmj6ya_8aWVBC4Glm
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69dddee3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=AUlretI1EePZII7xc8UA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103048-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 874983F5F5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The mhi_cntrl->mhi_state field should be protected by state_lock to
ensure atomic state transitions. However, mhi_ep_power_up() access
mhi_state without holding this lock, which can race with concurrent state
transitions and lead to state corruption.

Add proper state_lock protection around mhi_state access.

Fixes: fb3a26b7e8af ("bus: mhi: ep: Add support for powering up the MHI endpoint stack")
Fixes: f7d0806bdb1b3 ("bus: mhi: ep: Add support for handling SYS_ERR condition")
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 4bb007d1933315e5b0b40d235248d5373548d3f4..eefb0a6c82f68bf95f5c7418afa595c47519dee5 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1148,7 +1148,9 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
 	for (i = 0; i < mhi_cntrl->event_rings; i++)
 		mhi_ep_ring_init(&mhi_cntrl->mhi_event[i].ring, RING_TYPE_ER, i);
 
+	mutex_lock(&mhi_cntrl->state_lock);
 	mhi_cntrl->mhi_state = MHI_STATE_RESET;
+	mutex_unlock(&mhi_cntrl->state_lock);
 
 	/* Set AMSS EE before signaling ready state */
 	mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);

-- 
2.34.1


