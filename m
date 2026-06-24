Return-Path: <linux-arm-msm+bounces-114389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4LrjCOErPGqUkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:11:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC346C0E82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:11:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VGg1tbKL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OzRN9U5E;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114389-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114389-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FC8430E5AD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBC633BBD9;
	Wed, 24 Jun 2026 19:08:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A0E334692
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328136; cv=none; b=ClFZJz+zGiB9m7ulEPQabYQsw3fgqTR6L/UcchYjYTT18Gr05XOJxIhvbB6nlsvWngvjN+C7G+KgBcQMMlrF88uhc4A3hJ0iDgk+JALDJXBgYi7xF6HnoEEDu+2iQgW3HdV8k6DTDeW6S82tYdDe49S97Ih+BQbwFruI7B91+oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328136; c=relaxed/simple;
	bh=4FxHbmz8kDUtIfGKFuiVIX5SuFnBhCE95+M+is46FYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiomvi+rRiNm1rOk+yKsnMKEi+RyCJS4eIcYP+PTtG656O0XbjQWaGKhgt9kXP/PiCuyDykhIrM4aHLeYOIcAb7Y01G8p3bockFiWLSDHH6AaRSGGnTPoc8CQANghkiya6mCrOapUAK5Qt0vQm7Zoq+ogkqH/1V4yzxEBk8UW28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGg1tbKL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzRN9U5E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj7uH4153440
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r28Iz21wgcp
	SxJs9OE2sYvkYbcyymDjl28v67tiLeDM=; b=VGg1tbKLluzPCW1tprMwfq4BU2n
	twF3wclNipE/UTbq/SJ/Hgmi6Sockd2AtMEOsKrPEDBG0czYwwNJ9KS2EkkXIwWL
	2oqCX9GDCK1n9rBMjpVN29H+el0Q6zsxrjuxYEDaqHYimgKBpvEhsvqwVgWD/gJg
	pCKqyM+hjBDMo4bZbHUk1vbVmZYZB180IhSIXVC9qPkXCLO2D/ee3h3jED49zZOf
	sDxDXHh02/eNhrLajho84TE8RoYL9P9yBdVZTeNeS8hoAkXLopKQFH+CZrRzd1Um
	hNIirGMWw6cTaJH9wlu1OIcQMS7ZNsJPPWcsSt8RKbNANJKidM9QlN5kp4w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0996k5wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8454912a507so2355728b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328132; x=1782932932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r28Iz21wgcpSxJs9OE2sYvkYbcyymDjl28v67tiLeDM=;
        b=OzRN9U5EgXMi5NkfTrIgP8lvuOw/gSvGSM5uJ4IH7Mt8rMxfFMMeABde50auNX5u8m
         f1zS0/HTvcs2Kod86r55aIJkPxrWdVao1UGVEug4siEuLdprxaOQCRihwkakMK9gETip
         qF5d3RYDlck24B1GzPSdcgBqRamd1G3bLBABTFY5Es3O65+4QAikDIXBr/hTn9MVdVRl
         RmY/7BJeHDqHwDSe0Pe6DkPp8ZyqLkT7VDRRQxmybQMpFt+/eFc7qgnzSgXwqyEK850j
         iBMoayyHquRmSNt47GBJRQELBloFbIcXEiljstkhXvAPwTFBhlsCdkfw+AWL/Fvgt4Tc
         1HVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328132; x=1782932932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r28Iz21wgcpSxJs9OE2sYvkYbcyymDjl28v67tiLeDM=;
        b=RJnwF7nEe3yB8wqtZ5DfCBR83dQyevV38yv3KUeu0AGzjQVio3KUOUM7udvma4eGkY
         pTzMh2pARPtBIxry0y70Ic7ButWLXTUv2QqRACpkxi+fJOLdoAmUMHN23GwFHIAfWdZ7
         490hDCiBKFs+CJk1F4fXpsM2LIR4Pyu9PhB4bX7C5xQvlYer+lHJrNNSvElmizGiqSoe
         IZdYkCiX9dVWALEYKGNqZZjtYgPJiVxU5LVoU2BRP/nkrDFFabsEw9/nMQQYUIN2QdKn
         poLNIriX4Jz04Fj/SBctwqHUT9I9cBnONKQgrvOiTZdkS+AsZniPqvRoCuYD4N+pZkMJ
         u4lg==
X-Forwarded-Encrypted: i=1; AHgh+RoaNjMrGfCDVUW1PPdtoJPIEk7WVj/1HBAOxnAMxxj7zZAs4DCrFhyqEmwJ9EmkrDdHak0kwKSj26EvYp+g@vger.kernel.org
X-Gm-Message-State: AOJu0YxUX5o0ltbPRNo79hH0QpEHjZeicq+kKpxDV0nXGpIQpNFlbG8v
	TZBjEJFZ0271qO4gPW5ft3KbBEHqW8Dfyq2SX2HmLbL8qHbOBsj8RzoNhCq4rgU4gGpPq3Q2nGW
	K/ADWRZQmhZ3RWjxf4btXPDOi1QYcp5BxYyOjtQp/Azigh6E8UIYmCAUrLLkElrggCklk
X-Gm-Gg: AfdE7cmOKZwh+o90uxNk3iRmnbvRgRPpxuSAOGLyPWcP6PkXHSYQMysLVPNmLoNPhcC
	oJM4RR+SKWEeM57zxzCOhP++1w+8m3EH6VOI55fs41KNW2qQQ2ceNyI+L+gkUDftfPo5aLia0FS
	UmAZN54n1TUkOmu5pqApq8HaVrseYsVEnd3fUSBjRVfmcb9e6AjO7vySGtMuiy3QEv3+dQhNxuv
	HuWUrEYefEnjEyzAIwbTg5iNfT+qHp5coHVML0ZeiK0DU6DM09bd9Pp6Ubo4bezbllUAP0vdGwh
	ZrRVBi+LrXqRdQPHQDvzqgin78amN9vvAfgNQ4t5aT0FB6E90ZcIGDorGT6wZGLLk4dUPkM9A+P
	Ce/8YRQlkSNnNsRxtdSRgbHBPEXVhNqH2zkgafQ==
X-Received: by 2002:a05:6a00:3927:b0:845:4928:8645 with SMTP id d2e1a72fcca58-845a2ac2920mr5509750b3a.7.1782328131433;
        Wed, 24 Jun 2026 12:08:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:3927:b0:845:4928:8645 with SMTP id d2e1a72fcca58-845a2ac2920mr5509716b3a.7.1782328130925;
        Wed, 24 Jun 2026 12:08:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 03/19] firmware: qcom: scm: Fix missing smp_load_acquire()
Date: Thu, 25 Jun 2026 00:38:14 +0530
Message-ID: <20260624190830.3131112-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: Z_87SnG1fhc4GhQOFb5TZsxf4cFghMXy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXwyAr9eGJ5IG4
 xD7ptJBJWfaYUNg5AXJtcwuiGbpd4bo9ppYIlMpHySZUJBGUEKzJMIIZvY1OTXs2Ss+/eEfj5SI
 VTwjSvPbZ6fxHsCLAa9XBx8RzbUQTiE=
X-Proofpoint-ORIG-GUID: Z_87SnG1fhc4GhQOFb5TZsxf4cFghMXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX37zxLeOoINSi
 DI6m95HWVTwGtQRYPyNrZEkd8n7OJcAsJcPFIqw5Z4fGho1oqCDwCpyVY5B2l9/oGzOb21Rv1fD
 keUXsP9NU4ThrqYLM6iOvIMjLFJa0i/qHTT62ov2/5uNfZTkH4jHU0lb75xjsTbcwciIS3wkhey
 lkiu2l469Xf/452H4xMVRA2maWdiJgmsxzAjxfKIEW7m5s9dAhRhg4e1nw8SeW6ZDwxde2IFgI3
 oyYgZHUXoh1wqhjJ5Ptp89hFLOiIbhy0l3e30N8MZmVvPZ2a4PmhwtvRFANGNMwrIiQuWrq+xrC
 /cBVUbDE+zB9wxNn9AFVIpqCJ0hYoyXHUaNJhJiC29ZuKB3p6EzG3V3llzncc9wUu0JyCVn/ZSa
 vnNlgrQDRIPu48J5egl49algdFHW8w==
X-Authority-Analysis: v=2.4 cv=Tv/WQjXh c=1 sm=1 tr=0 ts=6a3c2b44 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=NeVOsJV41uE9b8WGLD4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114389-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AC346C0E82

__scm is published in qcom_scm_probe() with smp_store_release()
but qcom_scm_set_download_mode() reads it directly without
smp_load_acquire(), creating a potential ordering violation where a
CPU could observe a stale or partially initialised __scm pointer.

Use smp_load_acquire() to acquire __scm in the
qcom_scm_set_download_mode() function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..b78da40a4d60 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -551,23 +551,23 @@ static int qcom_scm_io_rmw(phys_addr_t addr, unsigned int mask, unsigned int val
 	return qcom_scm_io_writel(addr, new);
 }
 
-static void qcom_scm_set_download_mode(u32 dload_mode)
+static void qcom_scm_set_download_mode(struct qcom_scm *scm, u32 dload_mode)
 {
 	int ret = 0;
 
-	if (__scm->dload_mode_addr) {
-		ret = qcom_scm_io_rmw(__scm->dload_mode_addr, QCOM_DLOAD_MASK,
+	if (scm->dload_mode_addr) {
+		ret = qcom_scm_io_rmw(scm->dload_mode_addr, QCOM_DLOAD_MASK,
 				      FIELD_PREP(QCOM_DLOAD_MASK, dload_mode));
-	} else if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_BOOT,
+	} else if (__qcom_scm_is_call_available(scm->dev, QCOM_SCM_SVC_BOOT,
 						QCOM_SCM_BOOT_SET_DLOAD_MODE)) {
-		ret = __qcom_scm_set_dload_mode(__scm->dev, !!dload_mode);
+		ret = __qcom_scm_set_dload_mode(scm->dev, !!dload_mode);
 	} else if (dload_mode) {
-		dev_err(__scm->dev,
+		dev_err(scm->dev,
 			"No available mechanism for setting download mode\n");
 	}
 
 	if (ret)
-		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
+		dev_err(scm->dev, "failed to set download mode: %d\n", ret);
 }
 
 /**
@@ -2705,6 +2705,7 @@ static int get_download_mode(char *buffer, const struct kernel_param *kp)
 
 static int set_download_mode(const char *val, const struct kernel_param *kp)
 {
+	struct qcom_scm *scm;
 	bool tmp;
 	int ret;
 
@@ -2720,8 +2721,10 @@ static int set_download_mode(const char *val, const struct kernel_param *kp)
 	}
 
 	download_mode = ret;
-	if (__scm)
-		qcom_scm_set_download_mode(download_mode);
+	/* Pairs with smp_store_release() in qcom_scm_probe(). */
+	scm = smp_load_acquire(&__scm);
+	if (scm)
+		qcom_scm_set_download_mode(scm, download_mode);
 
 	return 0;
 }
@@ -2842,7 +2845,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	 * will cause the boot stages to enter download mode, unless
 	 * disabled below by a clean shutdown/reboot.
 	 */
-	qcom_scm_set_download_mode(download_mode);
+	qcom_scm_set_download_mode(scm, download_mode);
 
 	/*
 	 * Disable SDI if indicated by DT that it is enabled by default.
@@ -2875,7 +2878,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 static void qcom_scm_shutdown(struct platform_device *pdev)
 {
 	/* Clean shutdown, disable download mode to allow normal restart */
-	qcom_scm_set_download_mode(QCOM_DLOAD_NODUMP);
+	qcom_scm_set_download_mode(__scm, QCOM_DLOAD_NODUMP);
 }
 
 static const struct of_device_id qcom_scm_dt_match[] = {
-- 
2.53.0


