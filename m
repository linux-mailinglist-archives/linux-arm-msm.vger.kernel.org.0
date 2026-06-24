Return-Path: <linux-arm-msm+bounces-114391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eTEPFHkrPGpzkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:09:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7986C0E25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:09:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="iC/e+WaH";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SdKiScWr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114391-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114391-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37A9F3066B48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024072F7AC1;
	Wed, 24 Jun 2026 19:09:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA5D33BBD9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328142; cv=none; b=RSs73dQ1S5lXfuXhkffOBRh+Ytl3rm2aYfaMblleldIr1blVK+0TPAlNojvq/nj7+cnM6WzHmaI5mYfVHMPfuQuUz7n3WxsNBlrx6q3YiGuU0T73RSxYtTmDGTerDh2eMLh6nt+Z1iNx3Bl+RtRef0qMBJby5zALgPAXO16s3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328142; c=relaxed/simple;
	bh=l6Bkp9/8+2EkOUuzwzVN9Bn0oUtVH8oEIpg6qopk8aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKz+WBYkVPkT+x7kOxtCyZtceHi7TpzfWhWvPAqr82fy3GfDQnxP2R+hHxp4FGoO/q93SANkdCHjtYYOL65luwLt6AfyNlg6KeWFThciijHOw4F7w5xXYFB27NvqHVhWg8i7pQRfXhXiNWwovxVeYINyHB2PEbOw+l5+HkV5TQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC/e+WaH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdKiScWr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHjhMi3493487
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VkBgbhjPlBw
	pvXuwsnQ1bZtfCf62wd2fBiuvs/fqOQg=; b=iC/e+WaHh/kGENSloCw92oydd+X
	kC6Do2H0tN/Sr3yiF92K2N5YMJCY+AZAqFTbEvENoj74RsFWbgtzgKsnMfYYtgJ5
	Ab5FvewIKeJxCmvinpU8ncszenHH/6F4CNpHjikoIyAseTi/ebpJieWT7Qbz/XcG
	H3IX46ZE4KlndzQQs24ltgHhEhkAYo6CfAktr16AyEun5gMPyFgy12RtHVDAxh3r
	VnYWJbBNBb5UX2KLtVnfpWrchKcnQxmhtqM2ZZzkIdEYcw6DPe4GsAiqQeKqly8r
	AxHbXEhtwQGpZSMnUy23V8jAh8SZqXIEKZnJ4f+tqOGH6SDk/dKSS/+/3og==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfbvb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso820508a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328140; x=1782932940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkBgbhjPlBwpvXuwsnQ1bZtfCf62wd2fBiuvs/fqOQg=;
        b=SdKiScWrQTpJMEVDjX7/rs8qjGDUk+C5T+6KrCmDeecGRjFNAXS07FM2u+n6UxAOFh
         d4Q8V86TyYkXAufKijPEX+xxxsb/FUiQrCIfSIHvT08ZSJalbNG52GMB7ei36iecwk+h
         kdzySKftTawJD23qUrO6Yvwc0OnaxUN0/aHn+cjl8q5bxb8rBzZGRIZkIwmEljP8iRbD
         Ho6fFRpTOVqGNYf+aQjT4EUAqLFr8+nsbus8dfEx/cp8D/NREeF5figtwK9I+AmMYIRe
         6aEG9M2EB2WQapzQe1o+f6iMbEgWD1LLZ31m+E+LyG9a5z8IMFjLBWidotFMUvWOmbvl
         gHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328140; x=1782932940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VkBgbhjPlBwpvXuwsnQ1bZtfCf62wd2fBiuvs/fqOQg=;
        b=eOXPzu6dRbOnbnqaHoLwA5od/IxV9XH9K8fg0e8YiPf8M7R8NQXE1pt5F/uC4CPwx8
         KJSkdb7iLd4Jmvo2x9lzXkozmesxGUexBxMQNwHD+JhYARBu26VXvP7P+2qcSGZTPm2Q
         4pBmAQ1XOmVHICxjIhW26gAz2vFTwPK6KT8Zz/4Kk7AcM5HfBFfZN2JF4SMw7qC2/gMx
         h5lo8Dgd4cwyWwaeX8+ODI3sOsmA1f6M5Y/AUlWk0NnXileka9lBwowi1dZX+3Z9FnaA
         +ovcb5PrLwkPjcvHUZQJXvfDuoJwU4Eslt+98u7ZC5L2AZsd93n31X7T9tJXkWR59YT2
         9iTg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ro0v7jmF2OfTZHSN/42GAhDFRv6ktm7GcBEy9G9/ZuVhYrrixbbxJXg7g5pWLzqFzYSLYjLzGuEON/gyB@vger.kernel.org
X-Gm-Message-State: AOJu0YyvosqzijRK03ltc+O1wzXrtvtVezBEpWLYwb4IhAVwdQ+JVJuk
	maH3up57V8pCjs3hJLAs6sfNSx0nCkcGrqEZCtaTdooE/Z52nxtsIGe45Gm/F/XiNxBIY21nJNf
	hTapyBTwdTtJ6vql51JrUt9W4l9wMOarasqYf+BdfSE7XBwdXFsIuJXLUtgGSSV5cH+HimhPpS4
	LN
X-Gm-Gg: AfdE7cmPxFVgBI7X6RHxAjj2vt0vggpLInAWkcJqYGbKvG1VoMKjGJkl8069t+O/PAk
	bvky0LTsQPkxS/0N9Q5KbvFzknBgdk3TVRdELz8w5GAT9YeA929BvkL0UthpNmPiyynbleCZI8W
	bZFdLx8uR3s2GYzW897p7BJOODhRFXsOb5BblZf6s+kORrMtXeNW6pUhDoGEp/EShpJknGE4SjP
	wGu5w4HEJaVC40rCpnLdlqsTprn/b8Kpq4F9a92Jcd7IwPsITD5GeE4Q6salrDpGbaUG+oVgnwD
	uYL8wQhz00zsdB9aGlI/egxi/w6Ir8lhQY6A6AU9wAfcQWSP48cDccwhXFhxYX9oNOMvvHn8Ehm
	LkmjTr5Li96an1hEzkLtU+N391rYZTjwkbIpE2g==
X-Received: by 2002:a05:6a20:b7aa:b0:3b7:d8d5:2340 with SMTP id adf61e73a8af0-3bd2d0b4f76mr5461825637.11.1782328140292;
        Wed, 24 Jun 2026 12:09:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:b7aa:b0:3b7:d8d5:2340 with SMTP id adf61e73a8af0-3bd2d0b4f76mr5461802637.11.1782328139670;
        Wed, 24 Jun 2026 12:08:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:59 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 05/19] firmware: qcom: scm: Add minidump SRAM support
Date: Thu, 25 Jun 2026 00:38:16 +0530
Message-ID: <20260624190830.3131112-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3c2b4d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rvpxAYJ4qTt-cjm6DxwA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Zcm5wbemaCJGPYtk5K5UeuhQb8mdm6xG
X-Proofpoint-ORIG-GUID: Zcm5wbemaCJGPYtk5K5UeuhQb8mdm6xG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXxbMn5TFMnZo5
 692LDwCXHfQg8lKXVyR7irXbpt2O1hX5uXCGpzpqVz1walkyM5dK4DEkFE5dOlWGlCBuZjYEDCv
 A2PYuJ9N0XaIvWxuJS4yA3J8jTYHj8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX+E9SnUsxcCAz
 3mZajX/CbZ4QxJ7F36YhA19dESRp0wxOp2H10tTwWi9/g4LytgEJg9NQV4N04M8AlO7+PSMTzcS
 bem7yr41+LCNOIlLODIoCQTLi0VxPhWPm/HPIjf5549cUDAZIHXcsV603KPVY3CLDgPJ/7mNU97
 BRQpSiH8gw101deG4cS9Vyc4GaOWJeB6jzWtn9ARbLJbg/OcNw0v4SLpuYAs3agKUv/WFVMGcyn
 GJpvwOCKfFdi2YWmq4meF8jkynYb8LBEEg2az6WFUmZA1KTrx3kt51nxH9d4nc0jUWf5hL5JcuT
 yxRt6CMLXJIgmJyrMzxVqdGa4Zhn1M8TRMmzdzAjb//zMdEIc9K5eVsPu7g1FEWzHWXkCB18Bbk
 6t6D2NtgR+acxnCGoSVkgfvBkLpj2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114391-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA7986C0E25

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the operating system (OS) and boot firmware.
Before DDR is initialized on the warm reset following a crash, firmware
reads this word to decide if minidump is enabled and collect a minidump,
and where to deliver it (USB upload to a host, or save to local
storage). The OS is expected to select one of the destinations.

The SRAM region is described by a 'sram' phandle on the SCM DT node.
If the property is absent the feature is silently disabled, keeping
existing SoCs unaffected.

Expose a 'minidump_dest' module parameter (default: usb) so the user
can select the destination. Only the string names "usb" or "storage"
are accepted.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 92 ++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 83e4810f1c53..ba5cdeed8a04 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -57,6 +57,7 @@ struct qcom_scm {
 	int scm_vote_count;
 
 	u64 dload_mode_addr;
+	void __iomem *minidump_sram;
 
 	struct qcom_tzmem_pool *mempool;
 	unsigned int wq_cnt;
@@ -141,6 +142,20 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
 #define QCOM_DLOAD_MINIDUMP	2
 #define QCOM_DLOAD_BOTHDUMP	3
 
+/* Minidump destination values written to always-on SRAM for boot firmware */
+#define QCOM_MINIDUMP_DEST_USB		0x0
+#define QCOM_MINIDUMP_DEST_STORAGE	0x2
+
+static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
+
+static const struct {
+	const char *name;
+	u32 val;
+} minidump_dest_map[] = {
+	{ "usb",     QCOM_MINIDUMP_DEST_USB     },
+	{ "storage", QCOM_MINIDUMP_DEST_STORAGE },
+};
+
 #define QCOM_SCM_DEFAULT_WAITQ_COUNT 1
 
 static const char * const qcom_scm_convention_names[] = {
@@ -568,6 +583,14 @@ static void qcom_scm_set_download_mode(struct qcom_scm *scm, u32 dload_mode)
 
 	if (ret)
 		dev_err(scm->dev, "failed to set download mode: %d\n", ret);
+
+	/*
+	 * Write the destination into the always-on SRAM so boot firmware
+	 * can read it before DDR is initialised on the next warm reset.
+	 * Only written when minidump is active;
+	 */
+	if (scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, scm->minidump_sram);
 }
 
 /**
@@ -2040,6 +2063,29 @@ int qcom_scm_gpu_init_regs(u32 gpu_req)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
 
+static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *sram_np;
+	struct resource res;
+	int ret;
+
+	sram_np = of_parse_phandle(np, "sram", 0);
+	if (!sram_np)
+		return 0;
+
+	ret = of_address_to_resource(sram_np, 0, &res);
+	of_node_put(sram_np);
+	if (ret)
+		return ret;
+
+	*out = devm_ioremap(dev, res.start, resource_size(&res));
+	if (!*out)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
 {
 	struct device_node *tcsr;
@@ -2737,6 +2783,47 @@ static const struct kernel_param_ops download_mode_param_ops = {
 module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
 MODULE_PARM_DESC(download_mode, "download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode, mini for minidump mode and full,mini for both full and minidump mode together are acceptable values");
 
+static int get_minidump_dest(char *buffer, const struct kernel_param *kp)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
+		if (minidump_dest == minidump_dest_map[i].val)
+			return sysfs_emit(buffer, "%s\n", minidump_dest_map[i].name);
+
+	return sysfs_emit(buffer, "unknown\n");
+}
+
+static int set_minidump_dest(const char *val, const struct kernel_param *kp)
+{
+	struct qcom_scm *scm;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
+		if (sysfs_streq(val, minidump_dest_map[i].name))
+			break;
+
+	if (i >= ARRAY_SIZE(minidump_dest_map))
+		return -EINVAL;
+
+	minidump_dest = minidump_dest_map[i].val;
+
+	/* Pairs with smp_store_release() in qcom_scm_probe(). */
+	scm = smp_load_acquire(&__scm);
+	if (scm && scm->minidump_sram && (download_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, scm->minidump_sram);
+
+	return 0;
+}
+
+static const struct kernel_param_ops minidump_dest_param_ops = {
+	.get = get_minidump_dest,
+	.set = set_minidump_dest,
+};
+
+module_param_cb(minidump_dest, &minidump_dest_param_ops, NULL, 0644);
+MODULE_PARM_DESC(minidump_dest, "Minidump SRAM destination: usb (default) or storage");
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_tzmem_pool_config pool_config;
@@ -2754,6 +2841,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to get download mode address\n");
 
+	ret = qcom_scm_map_minidump_sram(&pdev->dev, &scm->minidump_sram);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to map minidump SRAM\n");
+
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);
-- 
2.53.0


