Return-Path: <linux-arm-msm+bounces-111366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fg6ZOQanImokbgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:37:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8EA64766C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:37:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eo428vh7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Mjg6TW8h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111366-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111366-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AD23301FCAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73324413610;
	Fri,  5 Jun 2026 10:31:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F2F40B383
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 10:31:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655476; cv=none; b=CZzcTLFyH3pixMVs/VvkMhllhQi9xJGQ32cjA/tjjpZkMULSSQyAkoR49QjSZCuJ9kWNYQFQxeh7LUrfPEhmyC8N994Zubbn2sQ7HhAGsf9BdjbMnIASqYm7FCocZd3kK4aqzn18TpOp07Z60CQaHhslYswXflMPjUgMDPJmL5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655476; c=relaxed/simple;
	bh=R/FRwW+ySF9W2dPGZQVRXHt6gF9PijiVFPkHxc0Wcgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P2QR46jzldvtWgmdJYVX3dNofdaHDWWhNaSnE/COQgVAqQpQJ49VXu2naQIZb0hFO1buHRMSJ+2gebmIDxmPcwL9xg4qNcxpCdT6n+coj4osRXzHt1lfZTjy4aPoau2jVALMF5PbjTAVne93IiCTDzK3hQ1H+0UsvhSCLdXeuH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eo428vh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mjg6TW8h; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6555uY533112556
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 10:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LC2pJVsxWt+KbmcxSdrSyA
	iWMz8/N4TYn6VfLvbw4to=; b=eo428vh7LlUfLQKi1KEuWDaoevAiL01w5uPhma
	jbNzKJ5NGZXboNFhiDY9LPh4aVj/p83r2wGxoDyYilKgZcXMZhDaIruezLS18Ykq
	OJsttuA4+9AM9Xsh5gLuqWbzaQjmZc4+6rD1fCtjeEoTXj+qlOwuQk8sj+Ymh4lp
	OKc1d6140TOI/6iQjeEb0psGpwkwJhmQgIIr7sQYUk9tQiXDJH7/+ziwrk7bUAPQ
	hBLu2ET7hOA+jjkpfz5EZMsEMHFRSWmt5Mf2whRdx6vAdh2SbBBcnXPPGRo96WDY
	0Fv90FQrBH2DOsD0IhZUPAlUXu3D2XgWiGSdk6jtnOXN2W3g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekfv73269-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 10:31:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2c0b56fso1701621a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780655473; x=1781260273; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LC2pJVsxWt+KbmcxSdrSyAiWMz8/N4TYn6VfLvbw4to=;
        b=Mjg6TW8hdgFSDmOqY04qhkBmhzJ0Po1wVJ5q4n6kmuOG88QSvL+1CwxjSnjMD+PnFl
         y2BvcykMQUq2zHbxCJ0A0w5qiCx25pznFeNhVqgWjIf+Br/7sJH8B1bwEKJnxfNs6Gys
         viDxUuQkglkTSpgVcjURse3xNsFjarJtZSrcdEN3PbqXc8olUTif/tPwMe6yDAeeozH9
         lfN7OLysfIoSX/M8r5MQYPVYlAbvZEf1NyyEwL5V+4vKMIswetNdzORIilvsKrIBjUZO
         E62r/l01Cp4zQ2Vn/1gM3+D/GZBay4sOVaN6/XD03SQ1Kle4Adsa110WCXTgOwxDXyde
         N3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780655473; x=1781260273;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LC2pJVsxWt+KbmcxSdrSyAiWMz8/N4TYn6VfLvbw4to=;
        b=E1qvLDUD/fz5qCjfaifaUxZg8ckwvyFkzw8dy9Zppm/gBgAs1RW+GoVgmAagEmTi60
         jGh5RH1MFB1Oh5X1GQACZ6Xd5TDHcfDI5/0dSltDH4+R0SWoTZPCGF1Pad9MEFc7ADbP
         KJJEYQoCXAfbfXYJD/PZNfQg+CAua9Ih3WlXGWQM28XQvRTWg1KZHg+DEAYHFfD6ROWa
         qAaLJzQ6NOGK431P+fY2RG8ITdAlnqCjyGink0o/10+TCntH8mRXe1X6Zv3kBfydKR78
         Iklk0rpT8T3Se34pAQ2M+Czx4sdlcijn6aWtghTD/Xt30lB8HZw7dZE+mzZb5e34cBmw
         CXmA==
X-Gm-Message-State: AOJu0Ywj0lTolRYf7pskwqAKx2fI8bSPzaw3fbz38vm4qrqUIbU8egTn
	7S1H8XrQB8b+ZVNgf3bFUJk0M3wXuGnHwMmM5SGjKXzmMijlskny/UmpB7m8z7ZJd1115oBkRmi
	sSqVLBggC3GjvQQXH4ODFM4jLTS18sYh0gUphWHOp21AgPJnEMN6zv2EjZIq6/2eMAsUH
X-Gm-Gg: Acq92OGlWPEXpD919/w6DKa3VwpUkvsU1s9i0iKYdvYMbO7I1kGvnXsTU5Mst3rGPIV
	1fqcIzP4V2nKLh3JJ3T2o2ZbXGVLDAQlaOSzE9BkpWCQ/C62BlbPOe5X5QpcpQH9OCb64uHyJSN
	TAxTETwrO3+DQYO3nDgZw9TR70da8N+lvcW29EIknQsu2yATCLbzkDXjMR5zpv8xYCkn5YNvoDb
	o8c3RiKzQuEocGcXbqfWUo8/8eEndidbbQ047qD+ZYz+Er9mDyGxRugoMoC5RbQXpmdKMIB9qQX
	57+dyvzC+vjJ0XWVog8/Yk27bGseNed9GX7P9NshQVfvv8T/45HAU26srGS1mw7eTIEAlzZzQkr
	jhu2AOF5HVdD3Xm6tecdDHxPOOd2zz11TMu+2qnT/gWfPlFjWqZbWLkA9MvD7yA==
X-Received: by 2002:a05:6a21:6111:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3b4cd03f192mr3495328637.36.1780655473395;
        Fri, 05 Jun 2026 03:31:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6111:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3b4cd03f192mr3495292637.36.1780655472902;
        Fri, 05 Jun 2026 03:31:12 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm8743566a12.1.2026.06.05.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:31:12 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:00:46 +0530
Subject: [PATCH] kernel/cpu: Disallow offlining boot CPU based on config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFWlImoC/x3M0QqEIBBA0V+JeV7BrITdX4lF1GZqIDS0IpD+P
 enxPNxbIGNizPBrCiQ8OXMMFe2nAb/YMKPgqRqUVFpq2YmJs3UrGhfjbvx2mEi0ckCBrqdhsP6
 rSUHNt4TE17se//f9ADzwiI5qAAAA
X-Change-ID: 20260603-disable_boot_cpu_offline-eb4f55ac96f2
To: Thomas Gleixner <tglx@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780655469; l=2099;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=R/FRwW+ySF9W2dPGZQVRXHt6gF9PijiVFPkHxc0Wcgg=;
 b=+PA7Cxep45m/Mu6YMDVJ7/tZ8OzoVvkvmeCtv1jQZ8fJ9rD028VTNKmb3zBPaZbL+6bccn1Xl
 zYP2D1YGjTSBwRBy+ZTFZOzN3+tc186oYHr8jl5AV0vnnp910QyVhh8
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: QNtXaK7a5DJ_cLQKA6ZcyBza_XEv0WW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMSBTYWx0ZWRfXweRfbjQq29jO
 +hU5xTnVN4q/ZiBHa8zGywqFQ2qZRRRPbrHpvp+J35706DgGOe261h1KSTmAgeQt71p1C8rvZLw
 IqMnPjRAjbg59ecFLLo9k81nFgD5ooxJ3FOQEyuS6jRcPIhJaQnVreCY2vIOhB5t9qHrWKeWswh
 N059D1qupyJtGawwrKYElysz3teAjT4T21V7r8m6xbi9AyCREXBUj/s3cjQI0hMB3MXqR8XYJs5
 LOWDgBGj8mklQ3wUZSxhz/rnTBbecuILDyVemwGcfoKJtG737PfpRWY6SDYGqa+FwpuvHc17kXP
 XYEbHT4oUogdHQUbkc31XtMrxTXRNPUz8hjWdk3yRsH+k6g5HVinv7LYVtzS7OrmsXx/RXeq0u/
 ShhwvMqApGRaE45y5R3sVd3RqBmWxwF1baqgBFRiHx3hPI/yeVA87DTntMEBvIInmS46dlO2xSa
 fcquX7NNepm+6YDm/Yw==
X-Authority-Analysis: v=2.4 cv=JNULdcKb c=1 sm=1 tr=0 ts=6a22a572 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uPx51MvRb-IBqrSjUCkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: QNtXaK7a5DJ_cLQKA6ZcyBza_XEv0WW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111366-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:peterz@infradead.org,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D8EA64766C

The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
the SoC to ACPI S3 similar state where SoC is turned off and DDR is
retained.
The hardware design on these SoCs forces a constraint to suspend and
resume the system on boot CPU / CPU0.

If CPU0 is already offline before starting suspend to ram the
freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
proceed further to invoke PSCI SYSTEM_SUSPEND.
This leads to a system crash.

In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
config and when enabled prohibit the CPU0 to be offline.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 kernel/cpu.c         | 4 ++++
 kernel/power/Kconfig | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index bc4f7a9ba64e62d76fbb2b362f243c918defe5bc..1c878db1d9cb6df0e31cb55343851aab4e38a3a0 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1478,6 +1478,10 @@ static int cpu_down_maps_locked(unsigned int cpu, enum cpuhp_state target)
 	 */
 	if (cpu_hotplug_offline_disabled)
 		return -EOPNOTSUPP;
+#ifdef CONFIG_PM_SLEEP_SMP_CPU_ZERO_STRICT
+	if (cpu == get_boot_cpu_id())
+		return -EPERM;
+#endif
 	if (cpu_hotplug_disabled)
 		return -EBUSY;
 	return _cpu_down(cpu, 0, target);
diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
index 05337f437cca29da57864583166d7f9abd526507..0b342b3a4a5650a1927dc4805d1515e1d9e067c6 100644
--- a/kernel/power/Kconfig
+++ b/kernel/power/Kconfig
@@ -401,3 +401,11 @@ config ENERGY_MODEL
 	  The exact usage of the energy model is subsystem-dependent.
 
 	  If in doubt, say N.
+
+config PM_SLEEP_SMP_CPU_ZERO_STRICT
+	bool "Disallow boot CPU (CPU0) offline"
+	depends on HOTPLUG_CPU
+	depends on SUSPEND
+	help
+	  Disallow boot CPU (CPU0) offline when the suspend_ops->enter()
+	  has to be executed by boot CPU.

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260603-disable_boot_cpu_offline-eb4f55ac96f2

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


