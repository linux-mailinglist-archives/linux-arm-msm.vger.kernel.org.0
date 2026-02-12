Return-Path: <linux-arm-msm+bounces-92704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKVOIM7ZjWkw8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:46:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D945212DF01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E7023061AE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3887C2AD20;
	Thu, 12 Feb 2026 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="for6HFq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j1G8ggVD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85BDEEAB
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770904012; cv=none; b=KFzron/7NqKFX6VFZ6unZGSP9thLISulSXYLon4CG4VRPpTretKfEh4rDZao0l0Ibq79st50y3udAl7pLSiCbnu0v1BZr9eBybUVgSlTPs2ne3Hl/QldUajkTi6om4y8gAEtBtvcO4PjUSUjGYs+7fEkrB0f2DP2n2tlZTdjrzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770904012; c=relaxed/simple;
	bh=GXBtoeC9LFNkJDZqdfR+vD7L3Zu5OIk5Rq74CjtI93k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YvbG9xDR8+9fs4pLHTxTKUHqFhVSzgQ8m1vMR6mjjGxu9179YrVWUfZ32aRFtl/pcs2ATKwqu5k9J/7anT8TCEWJFP2SfaoD1rRnWl3ZE1io5V8a8n+ffGpUTtWF7pTXLS4umurjptWKtc+hiZPD/A+2yL7v6pZaZsCKc+Co1SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=for6HFq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j1G8ggVD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDReAV1074088
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5Zt3oDzbaCUjmPeRW0ThtNXN1XRzan/1m7Y
	DMt3CNgo=; b=for6HFq7LHRoo8LcMqcAKy5dxVPVidvVgmG6DwAnCDTQhk8//kT
	MiDPwLzJlHpl1q+d7e4GxvE9AI2/0hA7Aptr6qUHMYFubzuBKZz4OdEXQ2CqLDxp
	s4Fqxdz0QEtGpXhtLcDgJO8L2dr0kjArGvvblmnqFNW4UB6qFUjPX3ESpkb8EezQ
	zuZ/0pm/+gtceUQl6KBwsaNxKzMB0t5fl5RlPJzBJ4qYtLtDFonHYcgvCABh7ql1
	p0kibEcgOuhJLV6uR17kmaG9lqLMjDDOi9TKfE0UmZXeRCERUgGMWSuIhn/wgh20
	+a2Q8fI7QEL6/GStqYz571qiUwLtL7sXpOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8nu67t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:46:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3e7722f1so635959785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 05:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770904009; x=1771508809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zt3oDzbaCUjmPeRW0ThtNXN1XRzan/1m7YDMt3CNgo=;
        b=j1G8ggVDtyNRq5Q5+QKyzK9Hf74hmQ5kJ788nfKi8FXUFMS2YAJSKIfT2pFmDvag3B
         hj5VuSw9rVhfMWx/8/D/z2aaAoX8My+zT6lsjgA90K7tt3Y6t+iafI4mKDZacyIFIEqr
         H5jcJONpIZsBjJuRcQoncM4gDG/TfCLvHP+GozY92AIxdCecs5o9al8z7WbRXFTuEgKy
         JGSUbST6JTn4gHa9UzRuAMzq5hDoioT8jdc/YVqASKPwAKgT8GwyscIj3ftV4L+dITxU
         1NTkqTmGLxVAXON/v/y88ygVsr27t2qwdJHspWdDni5h6ZuDFsFd9N0p6NJ/wkxXNRQs
         tPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770904009; x=1771508809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Zt3oDzbaCUjmPeRW0ThtNXN1XRzan/1m7YDMt3CNgo=;
        b=W28rtJ4F+qtw3Zr5CG/6I6Dio1lbHXbqsmimPXJxBjCGrCLwSarFhvjrDWVdxCWEiD
         4QRbXZAfAYVOWMVWyXWNSUbk90g/kNuQkoszFqKsAzhvbeSWm5e0Q3OtlHIOfOfposxS
         a1TlNwfkl90OHy7QPpoUiC72FjEDu++3S5yuWGnuFcN5BbRw13oT/lxaq/u/sFm1JiAH
         XRzbaHfcpsow9cHFOyWfTkG8JaLvue06A0VI5wzOb/5LrCwqm/MkpZHh6p5glhMFG/ur
         Spu+SEirLfEhNl8CiU49I+rmCY0MT1n7D965yUttQ1NxQ04UUZu8qedLLt9Nu1vKzgNu
         +s9w==
X-Forwarded-Encrypted: i=1; AJvYcCXcY7JYE2B7y2TV4B1DpIU1vWi/JuSprrlLRuU2rWUw28FmiOUoyXfQw9svJLa1tPj57JSryUiZgnzeFCUm@vger.kernel.org
X-Gm-Message-State: AOJu0YyHo/w1JepEqjbVSJmy//2UHPSeS6pc6SGIwnyXfh/TCMaN2swG
	sO7+JCSw1jO22W/Gd7OA4sMS7uMVkrUYQ1dcLGh6sXMWSVhf/7lAw+hK/2XeTBg1boI8hm3On2Z
	/9Xe5scbwavr7p5HUslNvYvkb/cJNGKAcYN1S/fEVxKlecSKVoudc6TBWfRzssy/oKRUxKp19D7
	mp
X-Gm-Gg: AZuq6aIqCAwhYH/lox0yN13V60MvQ5Q/f7XPYjM+HU8FyiauTvpt9VGuO14dXt+VYGs
	JRQmRwpRlNVGFdq8eKP/bPyQoFts+5i19kNbk/IohPmPqFv8Le4/cel5QH15To+Rz/9CvOC3p/3
	tjW2sZr0G3XhIE7eNYf/wMAxBdjC0+GIEkOrDGhiFCyfjscIKpFGjTBKpE0XlKO9wsI8VL56wCS
	41EXX0778nbbYUHWC8gWmN64YmTY34GyYdecEwmGyHC8Qgfr21/2xxG2hX2xgiPIijVla0rOJYv
	citX6NxF4OGuqLGjAFbDLa6SZBRJ14kHfQeW9l0dBOcXFSkYj2GTWJO6y6TQ4NZZpK3iuvCoHBl
	YM6gyGFwXnbII/UE02vg+q0lj2ettji1iOlzThPh/Px1rRkLJJmPS8oE1FEL6CH0K0J0pb/bby6
	tr/h3+Amo4kgBqca62tekDSzKnDYQ41fGeNqYq
X-Received: by 2002:a05:620a:450f:b0:8c6:df6b:93fa with SMTP id af79cd13be357-8cb33d8b4femr301847385a.43.1770904008919;
        Thu, 12 Feb 2026 05:46:48 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:8c6:df6b:93fa with SMTP id af79cd13be357-8cb33d8b4femr301843785a.43.1770904008409;
        Thu, 12 Feb 2026 05:46:48 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f92b25476sm61948066b.35.2026.02.12.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 05:46:47 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: [PATCH] driver core: Make deferred_probe_timeout default a Kconfig option
Date: Thu, 12 Feb 2026 14:46:46 +0100
Message-ID: <20260212134646.66433-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEwNCBTYWx0ZWRfX+z4oVQrjJgOc
 q4p1/duI/SWvGe/XCCSHLQObcrwhpHOV2PgZIH/WnjEnCj9usJ+6qPEY1k7k98FmaWi4ngYJP0D
 aeOR6gkWACK/OTgY4ii+CRcqdbRX3va6vzLcDO0Fek4Kj6Cd/d8Q6fhsz/KD4fc3qLol0SV1CmW
 eEtS4uNN3zbxLgAgT9zS+UtLFHmmXMTddefM3pIlPb+2JmhGQ6tRa78yQ5V32KOac6bdTa5QK+R
 el/KvkXMQhZTGCusO/hPt+dCHvcVZteEJuw9ATLyqAnrOE3gpKTd5f7RLMp/v4eOoHG3i8qQlAc
 zCfen1J/UvqvQqwZBgCEXAZXCOK6VlNGK4Dvwg71wADexfFw7d7V6HWenC/cnfYhke2LwB9itNL
 MTuoah2sNk30+vllWVmMv0fT+sIw6Gj1NavblW7XhpgrHIuCCRz4/LmOeZ3UysmU6xCdHGWf9lD
 OLE9UhA+36sBPR1SQhQ==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698dd9c9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=TZbnZ9SDAF1jH3i77HIA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JLlTHctlPqO5Ilo7ly1HAlFyj2luWs1Y
X-Proofpoint-ORIG-GUID: JLlTHctlPqO5Ilo7ly1HAlFyj2luWs1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92704-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D945212DF01
X-Rspamd-Action: no action

Code using driver_deferred_probe_check_state() differs from most
EPROBE_DEFER handling in the kernel. Where other EPROBE_DEFER handling
(e.g. clks, gpios and regulators) waits indefinitely for suppliers to
show up, code using driver_deferred_probe_check_state() will fail
after the deferred_probe_timeout.

This is a problem for generic distro kernels which want to support many
boards using a single kernel build. These kernels want as much drivers to
be modular as possible. The initrd also should be as small as possible,
so the initrd will *not* have drivers not needing to get the rootfs.

Combine this with waiting for a full-disk encryption password in
the initrd and it is pretty much guaranteed that the default 10s timeout
will be hit, causing probe() failures when drivers on the rootfs happen
to get modprobe-d before other rootfs modules providing their suppliers.

Make the default timeout configurable from Kconfig to allow distro kernel
configs where many of the supplier drivers are modules to set the default
through Kconfig and allow using a value of -1 to disable the timeout
(wait indefinitely).

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 drivers/base/Kconfig                            | 9 +++++++++
 drivers/base/dd.c                               | 9 ++++-----
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1058f2a6d6a8..80d300c4e16b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1250,7 +1250,7 @@ Kernel parameters
 			out hasn't expired, it'll be restarted by each
 			successful driver registration. This option will also
 			dump out devices still on the deferred probe list after
-			retrying.
+			retrying. Set to -1 to wait indefinitely.
 
 	delayacct	[KNL] Enable per-task delay accounting
 
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 1786d87b29e2..f7d385cbd3ba 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -73,6 +73,15 @@ config DEVTMPFS_SAFE
 	  with the PROT_EXEC flag. This can break, for example, non-KMS
 	  video drivers.
 
+config DRIVER_DEFERRED_PROBE_TIMEOUT
+	int "Default value for deferred_probe_timeout"
+	default 0 if !MODULES
+	default 10 if MODULES
+	help
+	  Set the default value for the deferred_probe_timeout kernel parameter.
+	  See Documentation/admin-guide/kernel-parameters.txt for a description
+	  of the deferred_probe_timeout kernel parameter.
+
 config STANDALONE
 	bool "Select only drivers that don't need compile-time external firmware"
 	default y
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index bea8da5f8a3a..e57144aa168d 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -257,11 +257,7 @@ static int deferred_devs_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(deferred_devs);
 
-#ifdef CONFIG_MODULES
-static int driver_deferred_probe_timeout = 10;
-#else
-static int driver_deferred_probe_timeout;
-#endif
+static int driver_deferred_probe_timeout = CONFIG_DRIVER_DEFERRED_PROBE_TIMEOUT;
 
 static int __init deferred_probe_timeout_setup(char *str)
 {
@@ -323,6 +319,9 @@ static DECLARE_DELAYED_WORK(deferred_probe_timeout_work, deferred_probe_timeout_
 
 void deferred_probe_extend_timeout(void)
 {
+	if (driver_deferred_probe_timeout < 0)
+		return;
+
 	/*
 	 * If the work hasn't been queued yet or if the work expired, don't
 	 * start a new one.
-- 
2.52.0


