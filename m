Return-Path: <linux-arm-msm+bounces-97855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CgiOWizt2nUUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:38:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDFC295BCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AEC03011784
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEA3351C1B;
	Mon, 16 Mar 2026 07:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bpLgIE78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knfCZgDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D53346FAE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646693; cv=none; b=gMioqTAY4ouSBxOiXNor9YcHJDZgukXkbnuUeaK/UaECLzZk36q9s+7NhWvbtbSmLn7ZMnzP9cwRTvyr67emZGAkwcIwJ+4PS2Rji9enZzqaxdcQJ1dKibv5empcIUYS29BkzSZ1UEopS5PxQeXOeRr0v+XRt2AOhl8wMSf6DH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646693; c=relaxed/simple;
	bh=Z/6THY+XjK9RDZxdSvC8eT1j6g70IKfbM7MZwp/Y34w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uIqGqyfj+BAROokYPOAXcPYbXIytVZj5VIzDj/YedlBILnRHPBiqtJ+a+M/0CBkZxuU+3sycmE4NCACBS6/EPUfEwYKCVUyw2GXJNm8J2ZcBPxGmSgTF2L3hq9VxL2V7sf/Do7gSYfp4P4AbzLs21jWSsKzRWbuno9OQnLuNh9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bpLgIE78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knfCZgDZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64cZ23777642
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yQfdCnYwqfB2t+bxnIB5Aa
	6+L8HeWThtqBaUd3Opfgs=; b=bpLgIE78N5oSwXgo5zhWFi+5LSEpo4cI6A1HnC
	KmoMCraDhNy8+PEIGXJGv7X5bynD6QPSieIfeSTL5760xmXsyrn4DjfcLSkhA49T
	8ttjwqUzw7unek9z9YfdQHGDjf6f53QafQMw/RuaeEX+mpvZYU1cBYZYHArae4ej
	G1lw21nv60FiOcmdBjy2o4m1sH4U/JtvTcEbk7G7iNL9Fca08f1WGMfU6UL2x3AD
	+9vGDTFga4dR0uYJshQMRKWxyBl9p3yIh4s0B35pkRfA6chfsySa8MHKPrP73wWF
	io8tWKxVSCfU4VaILxF2gWHGoyk9EmcZlO9LxqC0tx2dG33g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7vg89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:38:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c738662b963so2949795a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 00:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773646689; x=1774251489; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQfdCnYwqfB2t+bxnIB5Aa6+L8HeWThtqBaUd3Opfgs=;
        b=knfCZgDZW4EZGq8Sfsyb3HiMKCXnmtN3+LaArx9Ghv0CxpdvOINMxYzQmwre1J0dLy
         I6xkfa2AByZhpxrJLGTQMX7xhW/DDh5S9xDy3B1qc/FyiMjdc6uiG3rX/byCpQ+pfg5x
         fOKFOHlRsx8S22LwqzhKXyEQdnBsAYopXdX6muqrrXPVn5ZqWzfs5NQjRj/OT4YV+shp
         a5wKpFiuwSXsTlQ6KLRmmlkYgNVJOMGnk+0RV15vGK9uHuA+TODfQFjNyKdhO2F+f+vF
         R+am9hlqEuyIpmbr/+zSsB9ZD8j2zODa2Ry6atH+pR6gj1OcfUx+CxOFTJ0I6O/r6HH0
         et3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646689; x=1774251489;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQfdCnYwqfB2t+bxnIB5Aa6+L8HeWThtqBaUd3Opfgs=;
        b=HHTj7XjugICx7g63wFAlFHlFeuYOhiHj/S1mWTC0yPJ8hLpLFdcOuqnxFonFNFFM6J
         Nojl0QYS7dwmupU9Q+L3e5ZH3pb3L5RnGQd4Q2D+9nlODshHaFnKMmDIV4ySJ3KCr5Jc
         rPemRCcxY9oQp4oTBeWqaJWPrca6dqSZQiyy4w/GkFSXwu6vK4j0tJGuY/pDVp+MeapD
         p0nCzxCM8oSIlkoSrR/j1mNguj4znZGfZ0x0eRIgXrEX+aBl/h8vTdcFwnh3S7gBFXch
         wPwvvEeRa1OB+GNQTnTHyHEfqp2cpI1+mLP+ysqohnRM03RSMcxSe59XzsYHS6V5Jx/9
         OgyA==
X-Forwarded-Encrypted: i=1; AJvYcCW3z8qugXWJzj9NEl3wBj2KuOy5nfBfkiSQiP/c4UPl9GEyNm8FF0UPgXi3x1cF/uj6Da7kzgy0cB9bRAFD@vger.kernel.org
X-Gm-Message-State: AOJu0YzGnF5zbyhTl+jXi+65JwU1HCjIk3g8H9IqgbTzk7VxT1DIF/yQ
	aA+vnPWcmoGV27cm7sJ2w5MEhzo5a9S2XqI0s4fLnmJv2zOe6MHQ3JyP3TPiFqT4+B/8e94zbOZ
	ebOq+D1xTSaApdnvGkpjiQyYNgu9H4+DnpH8TIHwxsiFAvt9ovCbF+Wpd+M6TTQ7lu88D
X-Gm-Gg: ATEYQzzvhxf3EftDt/tV5paoXaeSNhPSRDmChKbk6E9ac+RyfSlyfvGJlhdP/pL+lM0
	HvwgV6/F8G4rgSzZkpVHpxnAS5wKKljyh7hr8El0QxX3zvVheLCRcEnaxZs7q2qAeRCWZRWqpI3
	gIu8qt9IrMzTUyZTkZFONe3v1bghjmN61UO74mpSEKx30OMtzuD5RV1rnwidfxXRx7RN65JZEo7
	JGASWvCqWZ2A8QsK3xMKOap5RWM2qWfzNaojgjPBZU8+kLOORdknUEg88+CZqxvDvsIBYJI2MSU
	q5jG2yv+Sr4EAVS27YSKhYqhl66rOBFFnQFcb8rIb42i9kuzK0v4ySqZ6BilLBhSpcybMKGKAFs
	44VLJZOE4im63TucQCcmKe5FZ0Osfmc6ah76i+xbWDz3WkssqPw==
X-Received: by 2002:a05:6a00:1585:b0:82a:ea3:c161 with SMTP id d2e1a72fcca58-82a198cb23emr8629459b3a.41.1773646688781;
        Mon, 16 Mar 2026 00:38:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:1585:b0:82a:ea3:c161 with SMTP id d2e1a72fcca58-82a198cb23emr8629436b3a.41.1773646688169;
        Mon, 16 Mar 2026 00:38:08 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0736b5e7sm12169509b3a.49.2026.03.16.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:38:07 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:07:58 +0530
Subject: [PATCH] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFWzt2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3eSC0syUnNT4zIJMXZNkMxMDY7M0y0QTCyWgjoKi1LTMCrBp0bG
 1tQAqoa2iXQAAAA==
X-Change-ID: 20260316-cpuidle_ipi-4c64036f9a48
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773646685; l=2361;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Z/6THY+XjK9RDZxdSvC8eT1j6g70IKfbM7MZwp/Y34w=;
 b=g8JlpKm2V6KsG+AG4VPbmSr/eN8Rllcg3DwIgMgyOzss36HbmNH1meKGA7OCrjjYTgumtnRgd
 a1cltzDnii+B7UbO59tcQX/KEdgmdfzmHjFMnKEUGlTx+hfc3ePfBVr
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: xlP1OxlU6YF-Q40KKF2NwnKLfkSxpCFp
X-Proofpoint-ORIG-GUID: xlP1OxlU6YF-Q40KKF2NwnKLfkSxpCFp
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7b361 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=5VM2pUZDyY3GmIPixBcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA1NiBTYWx0ZWRfX6CPffC4tcYap
 xJPqxPYv7uywtZZV+oB1OdDYicNH5ZgCNCjvdUMb1kznamn6POB/w2mais/BFiF45fldyRMdwQf
 4ROB8zcfyfKEufdSJGPb1n9ANvX6LwL0dmV/kjtGPmcZmKCLsBn2uiRJJ0tqt0qF9eT5fK28MlS
 hnOP0eCjssHvttAt1PTFnKc2cgtgwLdzNNZjaWNmFWOIVRvUJMHnguqKFZzHOPNUx/R4YPMwD16
 0jOE3pVDjNSL/GoQKx+uG+aKhuHTS9QX/nH3fkdxRmbhqOcFC4VPLeEHFb5/EEYxVnI1YewipR7
 DcqGVxFfgr14pgcYkOFGXpSnzhG6ZfrpPPEl0CiUf/H3B4VCP45w1Sk2G0+UetiigtLdDjXIg8i
 GV2qd2uq/WUy7YToyskvtJ4ZecmaXinbG5QpYxQcbEyGIMXCDNWgFoMZ6szdz8IXrPhDnwOEIyD
 zGLlWfIALPWP0pT7EuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97855-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 5FDFC295BCC
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
 drivers/cpuidle/cpuidle.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
index c7876e9e024f9076663063ad21cfc69343fdbbe7..c88c0cbf910d6c2c09697e6a3ac78c081868c2ad 100644
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -224,6 +224,9 @@ noinstr int cpuidle_enter_state(struct cpuidle_device *dev,
 	bool broadcast = !!(target_state->flags & CPUIDLE_FLAG_TIMER_STOP);
 	ktime_t time_start, time_end;
 
+	if (cpus_peek_for_pending_ipi(drv->cpumask))
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


