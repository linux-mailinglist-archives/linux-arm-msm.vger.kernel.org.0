Return-Path: <linux-arm-msm+bounces-101603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGlkENU9z2myuAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 06:11:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A472390D58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 06:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5B443029256
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 04:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5225B32AAAB;
	Fri,  3 Apr 2026 04:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLsj0wd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYNnOZMb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78F4283FE5
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 04:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775189325; cv=none; b=pcjulDm0Ai9vQpc278yKheTP9vTTfU5uKyxvFXOZYNNI+ZGQ0NmzhUqVhdkqHxl7phRu7ObNnDZBd47cqeADRLgMBTJbsJtLG7zOOhNeG61Edhuti2lTSf9T1TnKflgLeYyRXtr/5YTPRhFZcMuwuMOcot0BRdlNIv59p7z1h64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775189325; c=relaxed/simple;
	bh=thq3VzSFjwfIt01ulMHZCpwaLs0qWAz0pOOOeaVlRZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BpJclcJQUPaerHCz8b1DLDTpt99MCEAEs5CTyOCOlYBA1If+RzATxF7Fx+k8cEgNu1tShyIARH378ZG16M1gbVBpoBB+nCMs2kxAFlnnN/W2k6JQ7TxygEIcXrPB9Ou073ZFCePcRy54SlfJeQ3Z2JVqMU87UeqNYymP0U8H88o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLsj0wd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYNnOZMb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63331BWZ2922774
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 04:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pc7bw6RQRj5E6KmwuZe5xU
	g8kjZ/QHAV3XPbyk7ObnA=; b=gLsj0wd39DWcUxXTNFSXVY3+6WEMYXKEpARPZw
	8KRTKHkjSRd+plcVHQtTMJLYG5Q6bb1gclBsKl10voc5+zQrhwg/keYOqANKAOX3
	EbrLfw/9RBDbErtkWRCqlPMhqKjlfYwBA3fPgvJuwQtKWu7k5P5qGQY1n2N7U95+
	suaZXzQwjZsTdMC3UFmR0Wt33y7ncX7zSdgVaI9AthBy9kf73nP2p4hxSWsxwNBq
	s8exVrZZCH7bD9xSNfDP90M40U8DghaXgnNjYYctP3M+2DHKlhpcaXkmRFIlzJQn
	C8+diy1o2Jo5bSNLHWEkzbzde4c/kYm1kmEBvJ22xL+N0gAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9qw0ayc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 04:08:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0bf2b3879so39006755ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 21:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775189322; x=1775794122; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pc7bw6RQRj5E6KmwuZe5xUg8kjZ/QHAV3XPbyk7ObnA=;
        b=VYNnOZMbRbA7rnffvWOtV8h1NLDs4a47e6U894TNxufeiWls5yGJ3O69589KWD+gv3
         /wfSTkGXhNVPoueOIm2Fk64/h847lz1Thk1+T/iUsEvDICzUlA02gqgf0Uzk7Wp26fH1
         jUVLSFAUcKyr5wlmebuD5cvqQNXPbfC7vC/Ppp6LMno8p1nxw5FpfCzwQfpfFp9WTuuS
         OX+TjUmxCpvxsmIDrqg+khD8fEgM0eVlEnENOHDyZAsLR27wGtYjppF8tKuxTJKPs5Xf
         /rc4MUO7A799RDdMn84UTX68IIZdc13/spWpr219rwMPOHlYjTT4RYW9jPoZZyrg4qM5
         NdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775189322; x=1775794122;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pc7bw6RQRj5E6KmwuZe5xUg8kjZ/QHAV3XPbyk7ObnA=;
        b=i9N4fxY4V5kEkjzbIm/Y9jlUDVrCTNGPFtLDcCxHL3Ky8vqRs/X0XOFtzDmRYRAEQI
         LOl9b+FzjsC3MgNL2GsY9YGNDCRbX1BEypMfEsPJS4Cj0EUsOAyiCp3WJVsnlpGLQ8cz
         BDNMf6qx/CidA8hw0KJJyP+Qo74i9AwisMYlX1ql1WsnnwesDcvA8Z6Ghk7iXoJLdhz2
         pYv2c5sNViz22w2obnn4uTeR+gy8wEn4JkGw+RdAp1xgDz4xxUZE7jwfnrn0Lj1nKFOi
         JO8qkb30kMqQCK7kYWBmbd43ciXLD/glihDV3/MTbYX8drHllgLPT3G3As0amLymfJNe
         H+7g==
X-Forwarded-Encrypted: i=1; AJvYcCVUZqUtx1MkC0P8+nklJbw/xRCSB/n13dKxdOOrxDlLCMq0eSqoR7ycuI76SytmQkMSc7btEcoNAmOG81kR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8flwpHhWFpYoVcaJ/U7pxm+t+FV1ubDQRY05SA2OumfrUjXBB
	+g6aqvKunQ0pBayFfubKizkA8ClWT36BpebrBfl0KxM+0Iyxp7D4cLVItecwYwaAoZdnPDCHIKh
	Sa53r7NrXEm0idBLNnpL1DmGPrjbIZ+Mk18K+geQDzALoWsjHoIjIo7ZpzI1NR0JkYwFU
X-Gm-Gg: AeBDieuBbEbJNjyeiaR2GkX1teY6H03Po7p+6QST9CniMSCfazFAo4k00imMRrIBnix
	glNt4kocu4DttvSWwgwmAbZRP9oVasAxt5KF3cCWejej9Cfh38wTBfjwPRW3aLJKr4gjR9Lxlb0
	SugMbD1FwLo4rrf67ZRX0up+gZw9y9n/zkWEnNLQnF4M/N0rKWFfuBfTkK2nLMrI1z+C4m7vj44
	gUJyoiqqyj5cZlwe7DXZs/Ze0iL14fbi0VojCgclCC2Y8uxE90AzLLC3mhmfYQVssMBja3ZvOW1
	+hCC5zFHE9QImCuJxgwY1b+zhImnX28c22gT7ybUnwivYpi1Q7qaWgsYK1wNw6crKrtyo0Bf29m
	hzVn5OkaigKkD8x7zxbC/ZDHitkDM9aT4U32xDnB2/oKt9jP8kg==
X-Received: by 2002:a17:903:3b84:b0:2b2:71b4:a3cf with SMTP id d9443c01a7336-2b2816e4279mr18947575ad.19.1775189321660;
        Thu, 02 Apr 2026 21:08:41 -0700 (PDT)
X-Received: by 2002:a17:903:3b84:b0:2b2:71b4:a3cf with SMTP id d9443c01a7336-2b2816e4279mr18947345ad.19.1775189321200;
        Thu, 02 Apr 2026 21:08:41 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749c38adsm56569065ad.69.2026.04.02.21.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 21:08:40 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 09:38:36 +0530
Subject: [PATCH v2] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-cpuidle_ipi-v2-1-b3e44b032e2c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEM9z2kC/22MUQvCIBRG/8q4zznUmVRP/Y8YIXptF7a5tEkx/
 O/Znnv54HxwzgYJI2GCS7NBxEyJwlxBHhqwg5kfyMhVBsml5p3QzC4ruRHvtBBTViveaX826gT
 VWCJ6eu+1W195oPQK8bPHs/i9/ztZMMEc9153R+4VymtIqX2uZrRhmto60JdSvkIwwYCtAAAA
X-Change-ID: 20260316-cpuidle_ipi-4c64036f9a48
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775189318; l=2561;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=thq3VzSFjwfIt01ulMHZCpwaLs0qWAz0pOOOeaVlRZ8=;
 b=btk/eitDBbl5tw+fW5frTKJuCcLxLdei3fZAl4Nbg4YrEqx7WHxxakd+N92RA3zgX5b08zlNj
 7sz07SNscqfCrnRYsEDj7znOUkVYJlaGAnrgh0doYScSPJJpbRBD/9h
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAzMyBTYWx0ZWRfX2f5+HycH7eLW
 hsS40urctKAK0RtT0u61qfl7r2nYcuXg6Yut299cKtCfJjvbdQ/AZoFq5tIbjUToepEE2ILgDsQ
 cC8b9QdBRXSmc1pt6WathTU9ppKSqSXGf7oWL9n4lkggoKPo7gvRelI9grKtL6rjIADmMUqsDqy
 By9ju9HyzbXAJ0KeDzH/aPz2JjoH4X5/257tDTUkO9FsJrX2iWiw0mZWBu/LsmOd9sfWyMI5vRJ
 K9y/ixnWTM/8jJEef7nVhRIUKlNTa9xWi7OFLb29WiP1fK710WZ0G1j046E2+Uhjk8l3EnJgT3L
 m8gjQP6WSze5oK/LSB4Gz0dxOLt+MLcnCbax7/ejiYsbeiv5uBEg83dGJjOQN/Gdrb0X1vQGzfn
 t+PXWVc5xn92wdKOCs8ZuhVjsn4JLbKulyHqVKJa07shTC4x197v8sBMNvF4fSJuVwDlAAwl6k9
 kf3QwbTt0KHyEaW1j8Q==
X-Authority-Analysis: v=2.4 cv=PNICOPqC c=1 sm=1 tr=0 ts=69cf3d4a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5VM2pUZDyY3GmIPixBcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: DLGddxbICeMbK8m4InKwnim6vziNTauk
X-Proofpoint-ORIG-GUID: DLGddxbICeMbK8m4InKwnim6vziNTauk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_01,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030033
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101603-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A472390D58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CPU can get IPI interrupt from another CPU while it is executing
cpuidle_select() or about to execute same. The selection do not account
for pending interrupts and may continue to enter selected idle state only
to exit immediately.

Example trace collected when there is cross CPU IPI.

 [000] 154.892148: sched_waking: comm=sugov:4 pid=491 prio=-1 target_cpu=007
 [000] 154.892148: ipi_raise: target_mask=00000000,00000080 (Function call interrupts)
 [007] 154.892162: cpu_idle: state=2 cpu_id=7
 [007] 154.892208: cpu_idle: state=4294967295 cpu_id=7
 [007] 154.892211: irq_handler_entry: irq=2 name=IPI
 [007] 154.892211: ipi_entry: (Function call interrupts)
 [007] 154.892213: sched_wakeup: comm=sugov:4 pid=491 prio=-1 target_cpu=007
 [007] 154.892214: ipi_exit: (Function call interrupts)

This impacts performance and the above count increments.

commit ccde6525183c ("smp: Introduce a helper function to check for pending
IPIs") already introduced a helper function to check the pending IPIs and
it is used in pmdomain governor to deny the cluster level idle state when
there is a pending IPI on any of cluster CPUs.

This however does not stop CPU to enter CPU level idle state. Make use of
same at CPUidle to deny the idle entry when there is already IPI pending.

With change observing glmark2 [1] off screen scores improving in the range
of 25% to 30% on Qualcomm lemans-evk board which is arm64 based having two
clusters each with 4 CPUs.

[1] https://github.com/glmark2/glmark2

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Fix cpumask argument of cpus_peek_for_pending_ipi() to take single cpu
- Link to v1: https://lore.kernel.org/r/20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com
---
 drivers/cpuidle/cpuidle.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
index c7876e9e024f9076663063ad21cfc69343fdbbe7..c01e57df64ca5af8c28da3d971500b3f38306cdf 100644
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -224,6 +224,9 @@ noinstr int cpuidle_enter_state(struct cpuidle_device *dev,
 	bool broadcast = !!(target_state->flags & CPUIDLE_FLAG_TIMER_STOP);
 	ktime_t time_start, time_end;
 
+	if (cpus_peek_for_pending_ipi(cpumask_of(dev->cpu)))
+		return -EBUSY;
+
 	instrumentation_begin();
 
 	/*

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-cpuidle_ipi-4c64036f9a48

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


