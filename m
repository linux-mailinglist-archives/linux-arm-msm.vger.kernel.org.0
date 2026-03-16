Return-Path: <linux-arm-msm+bounces-97863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLkdJd/Dt2m1VAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:48:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2AC29670C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 050053004C13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCEC355F2D;
	Mon, 16 Mar 2026 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqlJ02rJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YK69d0co"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15FF182D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650907; cv=none; b=JJ6JwMbsKRmsFP74aBwlJvxBkzZMt/IbtY0a5zOgjZxkCeCyQcctD4inPyk40yORjVUCBi3pKUjhbyls9+uLX2UV1yuYLaAgtwgy6T6zPOaJZYRsfwThlLEbi2albzkOVkM2uHlzQ09C2HBMm2vLFCPt3vrWT9vTu2M+SzlniJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650907; c=relaxed/simple;
	bh=C0RLfjOvxxqcBW+InCYlOuH6ZnHlMl5mOlNXy4qD4Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HFeIJQYvs6kPffbaEq3gukPmVXb3OOSED1gKZIIARWw/UE/huJneZN/rZQxgdnzK4IGztibxPYMNBrC5lkR2aiAel3lgRpdlszjwp4DUzT9XD9bn8NfNJP8DiTL9F3TydKoohNw/16Iu0mpNDaUonZ10fayuhFon2wl9Przlsy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqlJ02rJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YK69d0co; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G65281664264
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DLH9OkgzIRACCI0JUBEX92
	CcsSzaMraDpTjyv0j8cTA=; b=lqlJ02rJ0kf2DEs10UrY2yOlrc4PYZ4jmlUkNd
	tPIp8NLtLCjDfhF/M7jcMUEhV63v+rCBufR2yr5ssqxw1yOlImnzKsa3MSzkcQLI
	jJsHvDoD5nBSFhZVWBePGxfHW/6rR1BSu8HVtPTLTafmAxrm+bL460JL4omVoA2b
	j2USTHCfF3Uw7n4U+t+MI5izMVTfSfJdxWeOY6TY0qmQkE7LprbbpIxLk8fZKmMx
	pygE5znsJyAQQoCJgRQBMxWod1fb7FrefI0reWx8DcE8L/Sc5Mdmx5bK+6AUXku4
	Y79L6PQ337kFLE349xtyje3jWmCJyBdDEptSfai0DeOMwgOQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043mv58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:48:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0601ff3d9so1523485ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773650905; x=1774255705; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DLH9OkgzIRACCI0JUBEX92CcsSzaMraDpTjyv0j8cTA=;
        b=YK69d0coBttx98E/VKqetpFzhfYpkwXhhOMwh/4HMZqhDKOJ+4flolegFRumrqUvHu
         uwsqPOvPFdkIet3CmDZ+0zsHBzHwXBnZr02skI3jSkAez3k5iAZPYC26o0+itGKcR7wR
         VD/BX2oVDK0ZiMclkf4DLmRQU3EzlWKGfG+gHw3F16nVxNITiPDfNiivFX/YD4Pk/yT8
         VR4B9L3VKH3JXCUL5QdcbiRoSg7HNnsWROOTWfHdlW9KPSu0ILTBfCZwJN8FjAEOAKkU
         g8ZabjFiJeA+SO3dn8uG3+yq3qzTFtTQhTrNZsTr011lYnepLp+Il+YetpZycvduHw+W
         C3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650905; x=1774255705;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLH9OkgzIRACCI0JUBEX92CcsSzaMraDpTjyv0j8cTA=;
        b=UF3ZErAXfMbUl6Dp//UHdr1hERZnYr/9ZTIcGKwRvA1Opfdmxtfyw9TiIDvpdH1nze
         wpOOj37sWKDgs50ZKl2vNhXowhEu60nX883I1GXeP1lUfNucnTjxc85rmENpZmuBHmsI
         ONIXEnXP0JWGyoS8K2+hHAxMdrOkd0vBIL2zhEnliBnOtTW6aJpZNOFU2H4gRJY+5N+m
         Pf7hCDapV/Rac1ijKy7hy1G8IrofADKD8D5xrOaGosP7NqSCgfHYOX/FKeGX+si55XGp
         vDBOLqm7YxhrkQ5NIg2E8Vj863nz+zzdZ/XUIyMAdrJRpk1ngInWunAiH9oe13iN2iAo
         rZEA==
X-Forwarded-Encrypted: i=1; AJvYcCUe7VPRjFgrCpIWOVUrWsmkeRE69Qrk44QROkMwFHLKleWIRMwx8n7RENCXuDIAMJYPnLJnSdXrMvBSBYW5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9PRHxQ20r0FX0GGbOKB9THem/Nj41dG97a/L0NNgOFfiEgrB/
	SVL/Ws6eUtFnwBftMxhPbk6fbp8kBrB4Ij9HEAMGsTUTJO+MozVGY6jVR9ZL04obQsXA6Kjab63
	j7Za66oPy4cw1NnURGJNDgE2kqOnPMk5bz//8NM63waGcmAVnZJeZrvuAAK7Pa/Gd7eKs
X-Gm-Gg: ATEYQzxvYwYJiorq1hBGEBPQvT/PwtAMza2BaJ+dRSTb1Hy3FnJNkN+Yq6yOgWwxPFM
	lsy1Oggl32owvIhUACKKhAIWFD0A0nmcKBZs3noCbciDbgGX3sqYJ7G3HlumGiN/+NLEqOmR+YH
	gfxMrDi6nJta3On7jGuenozCaz4EDApiAGBg9vbh8KNwVJWGmLMUbxnYYyTToIdcrzzmTuLp9sC
	+3DKSBmsKbh11vLqn4jHZFiuKgl/vJicFoXP5euwNN+svx1yHUoxAXkE/nF4CGmKVkBCn3HvkXP
	I3bH2Lu70ULixjlEynGWYUq3mzYg/kObNmmtFXVjjJfuh0/LgPWPgLRGbj2jSs5cMaxyGJDcE1m
	Vh51YOSkA2AB7cr5D1PP0nVfMd62ejVcaKl3skDjfLSKS2fNOyg==
X-Received: by 2002:a17:903:2ec7:b0:2ae:7f84:79e3 with SMTP id d9443c01a7336-2aeca9c64eamr115688495ad.16.1773650905103;
        Mon, 16 Mar 2026 01:48:25 -0700 (PDT)
X-Received: by 2002:a17:903:2ec7:b0:2ae:7f84:79e3 with SMTP id d9443c01a7336-2aeca9c64eamr115688295ad.16.1773650904555;
        Mon, 16 Mar 2026 01:48:24 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62c4f9sm104154685ad.38.2026.03.16.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:48:24 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:18:18 +0530
Subject: [PATCH] arm64: suspend: Remove forcing error from suspend finisher
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANHDt2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3eLS4oLUvJT4otQS3RTTVKB4irFJcrKlElBHQVFqWmYF2LTo2Np
 aAKHaxsRdAAAA
X-Change-ID: 20260316-suspend_ret-d5e202d34cc9
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773650902; l=3429;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=C0RLfjOvxxqcBW+InCYlOuH6ZnHlMl5mOlNXy4qD4Rw=;
 b=AUJaZ1RZqElA354OMsaaGns516zMnd90syz1b3tgLGl8xo12UZecZgdv01fhugXZJd3VMRPpi
 OJ6JIIYKOV1As8iaw+vBlHbl3jXVFh9gq4WVbBVzU5W+fIA81vera7O
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NSBTYWx0ZWRfX8n1ebkAwH7mS
 //FuiFh6FrXp7yy18aIAKFOZBbIwAZy+7eHRPDHrikaNnDIorAKSH4sj2PlJURhks4XqswqIBNU
 40JEx6GxjFi5J4kgi5pn8bza45z3uuol0GoOKHLXJI4asUdMUVpYBcDOFjaq4TrQ1c8ntTW0X22
 afi2HZCCjvQpo3Bfs9SOQiB0+acu5+PVzydIjC8OAVIkyQYLe3TYnCwUp6jn1rBdBrwQ6FcThWw
 s/a5WTGFYvxH+9QTHiUjbhvJSC6O3wck5MSd8oNEyFgVEL8ufL7pLpu75ujz1E1ufe59M8F1I2q
 Rc0g0BlUFAaDbjVf/KjcGpNR/Pq7QU4TAwrcTYADkYUR0Be+fZUrnC3PQCSGoEVa7CyCtiHienJ
 Ig6vUjU2awHmYPNIsGDSvUj8XDXWrcarxgxzdDjriltI4AUg2rIZBdud3DYoex6iyB06brpXczk
 sXpjQHDAgu9BiTilKmA==
X-Proofpoint-GUID: RPOvlPFIJZ0BgMjCu1cIV05qp7R4lBiu
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b7c3d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8 a=860BThSAxwKqi7__TBsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-ORIG-GUID: RPOvlPFIJZ0BgMjCu1cIV05qp7R4lBiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160065
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-97863-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E2AC29670C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Successful cpu_suspend() may not always want to return to cpu_resume() to
save the work and latency involved.

consider a scenario,

when single physical CPU (pCPU) is used on different virtual machines (VMs)
as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
requesting a shallower than powerdown state. The hypervisor aggregates to a
non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
resume the execution at the same place instead of jumping to cpu_resume()
as the HW never reached till powerdown state which would have lost the
context.

While the vCPU of VM-x had latency impact of saving the context in suspend
entry path but having the return to same place saves the latency to restore
the context in resume path.

consider another scenario,

Newer CPUs include a feature called “powerdown abandon”. The feature is
based on the observation that events like GIC wakeups have a high
likelihood of happening while the CPU is in the middle of its powerdown
sequence (at wfi). Older CPUs will powerdown and immediately power back
up when this happens. The newer CPUs will “give up” mid way through if
no context has been lost yet. This is possible as the powerdown operation
is lengthy and a large part of it does not lose context [1].

As the wakeup arrived after SW powerdown is done but before HW is fully
powered down. From SW view this is still a successful entry to suspend
and since the HW did not loose the context there is no reason to return at
entry address cpu_resume() to restore the context.

Remove forcing the failure at kernel if the execution does not resume at
cpu_resume() as kernel has no reason to treat such returns as failures
when the firmware has already filled in return as success.

[1] https://trustedfirmware-a.readthedocs.io/en/v2.14.0/design/firmware-design.html#cpu-specific-operations-framework

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/kernel/suspend.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index eaaff94329cddb8d1fb8d1523395453f3501c9a5..b54e578f0f8b03c1dba38157c6012bb064adaa12 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -144,15 +144,14 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 		ret = fn(arg);
 
 		/*
-		 * Never gets here, unless the suspend finisher fails.
-		 * Successful cpu_suspend() should return from cpu_resume(),
-		 * returning through this code path is considered an error
-		 * If the return value is set to 0 force ret = -EOPNOTSUPP
-		 * to make sure a proper error condition is propagated
+		 * Successful HW power down should return at cpu_resume()
+		 * however successful SW power down may still want to
+		 * return here to save the work and latency involved in
+		 * restoring the context when the HW never lost it.
+		 *
+		 * If the return value is set to 0 do not force failure
+		 * from here.
 		 */
-		if (!ret)
-			ret = -EOPNOTSUPP;
-
 		ct_cpuidle_exit();
 	} else {
 		ct_cpuidle_exit();

---
base-commit: 343f51842f4ed7143872f3aa116a214a5619a4b9
change-id: 20260316-suspend_ret-d5e202d34cc9

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


