Return-Path: <linux-arm-msm+bounces-105950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMQ4EcDh+WlPEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:25:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3A14CD678
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72AAC301E4BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDE4426ED1;
	Tue,  5 May 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOddLap0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iV0tTTBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C90429819
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983908; cv=none; b=BtyFMEELqxIaOnTulXVpJpVpuPaGMlFDBKbIjp7CmCQP5Gxo6v5ojbD+me25fjozmQ7Gs5/ke8yRepsPPMn7DgG5xUj3mAJd7i8ar4G13lEjRc6uOkvRDWEUbnjRgABlAeM/3gaD5KHSDQ1xXTg2cCOERJsJbxTVqAx6PuOiQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983908; c=relaxed/simple;
	bh=K7/WGQ524x+e2ze3I8r02DnkbU84gUgAARamEEr7Lg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZOodjsNtRq+HRpycqRT/cXWdSN9CZFeatHVuxeyu7hUi+F2KrJnCSYnwVy40JzDodFtHE9deiYF8L4BoeJ7ZwBZHwZ8utH3itl8iCcCbtMnNX5Tm9NHmhU+EmuJ0xwOOW4tWWP5f2VrA/7HdTJW4hfdzi0nATk/dJRV+ANCnzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOddLap0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iV0tTTBc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457CUi81960770
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 12:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pmyq3Jn3jS95x5qGd6vMxoixGm9Dq9F0RVe09Iz/Q7E=; b=JOddLap0jB/q49ce
	ysA9hU1v8gpGvceX4so5na3MuDovcsC1hapvbgPTLjG4p90D0Lw7HNcngXZ8/o6f
	tS+tfHIjWHQtBoTPOdn8KqC2FBKhiH7v1k89tJR807w/wDuW/t1OsV3tRpzXaiyp
	hWa7nKC5Wp9z/EmyBWE+gvt1HrVrRrEqpn/6Hv1Z83Sk5Rrg+vZqPAVwaeLYFkEi
	VHpzE4WWdDmo6ck89/7+uXZ2KXkHvg4UmYyS6Jvm6b1glK6VTNFgfPYzybMqouAZ
	2MLbCJq0Zp8irK6UA9PL27jDvN5MpXHR2XrdRxkSh+NgPIq5TRwHZOdA2kdSu72p
	aYK6Ug==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5dv9ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:25:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b633babe5b9so300208a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983905; x=1778588705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pmyq3Jn3jS95x5qGd6vMxoixGm9Dq9F0RVe09Iz/Q7E=;
        b=iV0tTTBclAELqgIkx4OmeTTTwtI6shm8Z/kvYiOkg9o+QLk1po69gtRjjYkOth31iv
         Uk7Yi9y7Lclt/Ssaf7kpIgZaFWS+/jV1RntMrhSrMLVT7Mc5xQHOGr6Bu1XIcp0QBdh8
         8sWQaAAWHdaxOUeoEcvxSp/EbfSGGvcPWiBT1oQrRGgKLyaDQbW53BF57uYI7JyiAotz
         cB+lOenVTHqMpEbWBKmSPFCdnU5yFIe+ivrvWstKnpa6E5+73lDUFZW4UT8gzKokVolO
         XxlE89okldt6eD9AhDTNSmdVAxj3O6DONsRdTg8M/pdkRmCoUHpwEq/Enqwe1a1u1B7Y
         YQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983905; x=1778588705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pmyq3Jn3jS95x5qGd6vMxoixGm9Dq9F0RVe09Iz/Q7E=;
        b=Lqqme11ym4pnx1HNUHC2/TT/u+5L339NxF28R1Dj0KzvCKe4U2+K1Xlwl3CZNcPRhG
         mNxqXYqnvHbvQMoXxtQ1wWmwDjBrJRlPmHHI1fNiMFH87o8VjeBScbWHoJjI4Edu/5gO
         Q+3tMQYNQGJC0mb3zh/MFi+ypEXKF2xNljZUQ2nFN9vVoTjtLrV4+b7ePlK3IYTshdNe
         jpeLRVWElsQ1Ff9F+UlL2R1+S3s+GUx1aDqgFDFI7QzgwxQToCGqm/Im1xyUDdQixTOU
         vnMz4m0D5HRtYGx1+p8jgrEYb70EmViAHoc0IkXv3M7J/xKx6/nbJO0CuOe8+3tw2yvj
         3ynQ==
X-Gm-Message-State: AOJu0Yx9wZLEdUIw03ntyAuVLZz7GZvEpvB9fu9tcquQeYTJzgaClQCx
	gicVxuHJ78d7Znsq6TBbnKiZ8CGh/bhc1JduSmR3ku5rI+lsQWlc4Q513dq+trZLH02RhQwhUVD
	2SBFvi3Lwb4/nfycH6t/8a27FxOw5xvPKZyMJDxXSqZIsutR0RkVLhVUT+deqPFlWez4i
X-Gm-Gg: AeBDietYhOzbmKGvRCzgSwdB/p9jXxPJ9cx8HL7GmDCZ7kfcUY83u4vZQaBqCZLhkux
	eoB/20X9UMSagRngV4lFz9NR/XuZByLJM82VmniqZASP3ASZtBhWpKWK5ppRJi/oFVWwoJPn2Pd
	l1FpfvXLK2oONTCBqEb3sxsB/Q42MmYLPCfuyF5+KRmEGHsfiPwIQQ1D7KsvB4yov2rrge1XceV
	T3SURWvg6PVuWoHXF0KyGZF8wdpZkd2ju4uv09ERbEjb5XgHkgVSOk2BwD36Yd/KqIVKjHSPqia
	GBSUoSYa7n/SSxmoHtdZ3lnr7kZpYZ5IpPEK40wILH733EGbIl/LxUiKwO/Dcph/0zpzL2Semwa
	CFR/kHeI6qAA94HT35yST1+6R7xbwS+rlJYP9pHJjygghJrjWUzhEgQ/QjHpPdCI=
X-Received: by 2002:a05:6a21:6906:b0:39b:91d1:6c10 with SMTP id adf61e73a8af0-3aa3e94ebb9mr1574705637.4.1777983905066;
        Tue, 05 May 2026 05:25:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:6906:b0:39b:91d1:6c10 with SMTP id adf61e73a8af0-3aa3e94ebb9mr1574672637.4.1777983904596;
        Tue, 05 May 2026 05:25:04 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:04 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:46 +0530
Subject: [PATCH 2/8] ras: aest: Fix CE/UE error counts not incrementing in
 debugfs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-2-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=2690;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=K7/WGQ524x+e2ze3I8r02DnkbU84gUgAARamEEr7Lg4=;
 b=5srgoRDiOLE+04KITceVdE78eHY9ax0xzcodvWQFYmfY3QszjcUqV1fapWymL8cEoMNtESzDE
 hlR4muq4F70BQ11YJzNFbjlpe+vvXZxKIK3RDMz5XqD1b9rqRIt0Cm1
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX8AZAoZX4Q06+
 Z53raVvuxco8Z+RhYpN+I9R8ZpmgoXD9e+m9NBHztQPY7xg4rE8qPwC7ncOBJD9O0zpDAgPT+x9
 XlTD5IAl0yD83v3HVer03QuVF5cpBfaKhjQSrSOlavVSlr4wf2n6Ovz88iZOPmY/RhivA5FkOxy
 pTTxwmhU4W9Fpa3X+TfVy+afchQ/tSWcgsAd9lMw56PvUbxlDbxrvlQ1c8MnFFMBCIGok/Z8iIh
 1V2xHzQiqNc2znUctPo1V4Ylx9zp4KDN/eDc3UZ/QxpNjdyHex/n3v8aXL1xWsAVYMEjHRVCQm4
 ZNbv9HEkoPmbb7+Wia4cUltuc53WCHMIqdSJ7O8bB3HjT19mTHO0bw24pkkQLLBNyt55Bb/Dr71
 LltOyTZnKW/xWoAXn3X5Xc8AU5MgXJe46zUMZE/DdaoJVOZiXnujTqsVpo1jEZS0MWcdD0fBejl
 fTeGCZoi1UXjYNqLBEg==
X-Proofpoint-GUID: FtetD8zVBHAzahnC8saeGVp8YNP3seds
X-Proofpoint-ORIG-GUID: FtetD8zVBHAzahnC8saeGVp8YNP3seds
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f9e1a1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IvwcuExtd9bf9WbcJAsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117
X-Rspamd-Queue-Id: DB3A14CD678
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105950-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The error counts visible under:
  /sys/kernel/debug/aest/<dev>/processor<cpu>/<node>/err_count

always reported zero, even though corrected errors (CEs) were being
serviced by the interrupt handler. aest_oncore_dev_init_debugfs() sets
up per CPU debugfs entries but wired them up incorrectly in two places:

- this_cpu_ptr(adev->adev_oncore) was used inside for_each_possible_cpu().
  This always selects the slot for the CPU executing the init code, so all
  debugfs files ended up referencing the same per CPU aest_device instance
  instead of the CPU indicated by the loop variable.

- The code referenced adev->nodes[i], i.e. the template nodes allocated
  before __setup_ppi, rather than the per-CPU copies at
  percpu_dev->nodes[i]. The IRQ handler updates CE counters in the per-CPU
  records created by __setup_ppi, the template records are never touched
  at runtime, so err_count always read as zero.

Fix this by:

- Using per_cpu_ptr(adev->adev_oncore, cpu) when iterating over CPUs.
  Wiring debugfs files to percpu_dev->nodes[i] so counters reflect the
  data updated by the IRQ handler.

- Using adev->nodes[i].name for debugfs directory names. The per-CPU node
  receives name via a shallow memcpy and is not the authoritative source.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-sysfs.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/ras/aest/aest-sysfs.c b/drivers/ras/aest/aest-sysfs.c
index 66e9c1103f99..f710503e4d74 100644
--- a/drivers/ras/aest/aest-sysfs.c
+++ b/drivers/ras/aest/aest-sysfs.c
@@ -189,16 +189,23 @@ aest_oncore_dev_init_debugfs(struct aest_device *adev)
 	char name[16];
 
 	for_each_possible_cpu(cpu) {
-		percpu_dev = this_cpu_ptr(adev->adev_oncore);
+		percpu_dev = per_cpu_ptr(adev->adev_oncore, cpu);
 
-		snprintf(name, sizeof(name), "processor%u%u", cpu);
+		snprintf(name, sizeof(name), "processor%u", cpu);
 		percpu_dev->debugfs = debugfs_create_dir(name, adev->debugfs);
 
 		for (i = 0; i < adev->node_cnt; i++) {
-			node = &adev->nodes[i];
-
-			node->debugfs = debugfs_create_dir(node->name,
-							percpu_dev->debugfs);
+			node = &percpu_dev->nodes[i];
+
+			/*
+			 * Use adev->nodes[i].name (the original) rather than
+			 * node->name from the per-CPU copy. The per-CPU copy
+			 * receives node->name via shallow memcpy in __setup_ppi;
+			 * the original is the authoritative, guaranteed-valid
+			 * string.
+			 */
+			node->debugfs = debugfs_create_dir(adev->nodes[i].name,
+							   percpu_dev->debugfs);
 			aest_node_init_debugfs(node);
 		}
 	}

-- 
2.34.1


