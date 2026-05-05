Return-Path: <linux-arm-msm+bounces-105951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DtdG9/i+WmlEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:30:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E6E4CD831
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25F4130CA4BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEDB42B74B;
	Tue,  5 May 2026 12:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdJ65q7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1HqlDmr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16C42B72E
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983914; cv=none; b=NIK6e1QUUdR0bZI2hin1LtoBHR6qiAYWECvgBVXvGu8DyyCYm2u4zDxSkn2uEbOqgiE/LcO2mBUJHYEbKtxyd9RytZ5ui6bjic8H88GVPxHIxxbS8RiiLFSO8dPDlyA3ckimQAeAXftfG/FMmDuToTv67VX8v2G2OpSYsvIamf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983914; c=relaxed/simple;
	bh=2IM4lMSreVHLqyyOxDBhvYJWupnQlqLCRMuo/4Cjc8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLb56BQvnefVGZu7rhRfbG07UYaDq1xGL6mH3SgE3ic53HmQt91ZBv378ZoN2DxzisHNGuJLs171RDKbKko1HYvGt4v+zjzHwgD2I/j5DrB2j0llV7Kgm7cBqERnCtCdAJ6oJD6w3FTHeCDRmed1tzVDP7R1f78bf+RGMde5hd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdJ65q7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1HqlDmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457oElo1960741
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 12:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6n/YGblvIcxORdMx+6LxziMRaZ4/mcyw2o6YavI3itw=; b=TdJ65q7ZsmmM7A9s
	PBnNuQ/i0v4A8QPjn4V2POdg9kz/RCuU25m6xcXQN3WWok6aroZpw+rrldHYTAbZ
	5vmi1ETWcg43mtJQa3IAqFY5hg7tK9RcBniEEWKTdSS06luxc8Eczlt+X7+WJeNx
	L58cHgLKPuHNpiOZOtZ2EhMfaLHEcqX+Nn7QWtzGq9jAfltQVyF4h7cdzjSQXk5u
	OFLqy9roijDBrGdoGMOMzIv74cr3H1oXxHkL4yzhB2yeSmL/LwLoi31AWcK5Ut64
	7XRuZOKq3E5iUPMH3MtU9B3zbZv0T3EkwdhNm6yuqhBVPcjKMtSqvRbhH9q+Svkm
	uJTYKw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5dv9vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:25:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c822bc6ff86so202548a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983912; x=1778588712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6n/YGblvIcxORdMx+6LxziMRaZ4/mcyw2o6YavI3itw=;
        b=X1HqlDmrXexcEOl1Ody1QMG6ObFKNmsZQQmEMY4SYku+6/UBV4KClNEUL2DB9N85a0
         g328M+Juk/enKeteDRE9Dq3UzS1RJWKdSXt0TsGVbET1oAuRWFheHPYPF7w7XzLa8G2h
         1km6HnJl97RsjEPG1jZcepbS35+7Kv5sCMH0PZ5LsdmjQIq/OJLf9/v8AkD74KmIwSJK
         tCEjlQhc/MW0E90vmcKrzL8dBzpH1AEl0SoGpC1IvEoE4LaqiRypkkU9NevPAAoaoge6
         tZGL1La6/HJeN5IZBRWd114O+2VmK4Y8R7Qr3KAhJNs6kbMaYXd3QHylCd2apCNpQ9Jz
         ROaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983912; x=1778588712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6n/YGblvIcxORdMx+6LxziMRaZ4/mcyw2o6YavI3itw=;
        b=lHYtrlnAKzNnSTFQ7RlFKUzF2cTLsgiql9Oc3sx7V4FSlPIcHsGBDGLnFclZ5GjILG
         /XUw7pXShuo7FACj+FQZz8TJbq6/jF2RDDocMR8ZXhmsSNP7xoFwJPWRuoQMk4euzNdr
         lG/jkajsxN1WU4+Ef4ydymUjI1W0GMUX/zM9Z6WLvZ0miOh1o7K29lfUYEoWeWUgYNT5
         JJJ8Y3JWNmqm1/v5s2pmQuYoYylDzVFBWKo6StcEOFTcXLSSAyfqg1t1Lcv2eZYsLuXx
         PPum9DeReWPWpT5im1eQ5g/LCpjMEejbeBo4oOgPgKml5X399tSvhmRH+jaG4SPmYYdP
         bcdQ==
X-Gm-Message-State: AOJu0YxAumfhvBbxekzKNXP+UVU8Tio6INX8Kythi0MLsMzljKztv/PV
	Q4Qq4Vx3jSMqrYQai2CHE/08zgCeclPofLV55tCpIpF2a9l8/ay8tHGo8jBwDKqhBnb4GvKvbfm
	g0oH//r94blP3gRnMF4B4jQuEKUmVjcTZs514hsCdKesIQmtfmCicXmToaSXKv1i6YMDw
X-Gm-Gg: AeBDies2C+fBMPKoUXmpzq6kWQFCEujWKZHfO02dWCGPK7XM9IRYqy8M/Z6i1MztLoU
	hzejfdY9r41ce06bZIJnHL6665Ahqf3bkqYnNz32sP8f4h5pk033c6I9SnXH+dnUdK+ws5GeSjo
	0jiu3VWl09Qk/O7vg/W90pYFwfdw6gGlpb2g/aGVgVgAsjO5VRrDmZUq1BfsfpLYbTCSIXeUiWX
	Yo6SmfM77XNN153p40H6e79Cd/bDINPyEll6myEoaD42TC4ZQRyBYEczpPxMYNOZnDX9Qg1Cb1s
	e65lC4JlW40b01I8h3A1irXd6gHvH1LwRYxKitEfeOoYEREvIW2P37KURmYWywyNkupuSIHJwKt
	sUx7tsC5wv20TBU9Jjyy4Q/9G2Ok7t6J6l/ShIM8gwvoyzHK/ANsj8+shLpYX1Ps=
X-Received: by 2002:a17:90b:4e85:b0:35f:ba08:35bf with SMTP id 98e67ed59e1d1-3650ce40d34mr7090699a91.5.1777983911504;
        Tue, 05 May 2026 05:25:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4e85:b0:35f:ba08:35bf with SMTP id 98e67ed59e1d1-3650ce40d34mr7090668a91.5.1777983911014;
        Tue, 05 May 2026 05:25:11 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:10 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:47 +0530
Subject: [PATCH 3/8] ras: aest: Skip unimplemented records in debugfs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-3-d5d6ffacf0a5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=1700;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=2IM4lMSreVHLqyyOxDBhvYJWupnQlqLCRMuo/4Cjc8I=;
 b=fu5pDeP5xi3HER6UMYy15HGHWu0Q0X9dpDdi3I2AdC7VPoEVXMmPbTCAZ4BK67PM/lvDZoL4u
 HVgHnE+TPdgB2ZI4YYsNx0SlBhhGoi8hF8+KMHvtMao8NtxlePtZQ+7
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX053KcSxHU3kp
 z28uvNhr94XcDsfhGQ/ljYtTSn78u+BhV0v60AVkJUpdBEGrNeBuBiEhkvD4djcRL29Lv+Z1qu+
 UUEIadJsWf7DEzL4LA1mCViVa0pj+rJXySkqBdQ9XGj1rPr5s9ZI3uUzwmUz4tMx2kzH9kEaJlG
 kNdz5rLke5NciatRFFUPW3CrdCzQQwgxVu2JumaX2URvQOcs9WRbJwWXiWJg8Or8gHyt3lbU65+
 YZ2AIxV1QQ/kbxYme5eBjmgNAE6mp4MbkFbeKp3E0oq0pYqkqpbapiuhSsFWyUNgQDYURf4qO6n
 nG3N7LJYrpJAgooVa/NM5kKLldhyJBfnBe2tOCBvE/o8NPYnKnrBdLEPm+EHtIJbyU0LBmAIzJk
 ZjyW6M+A+Vfs38Fx0YrXkFT+g/7zxTEFVvAtAgciKkFvMFwVgst2rVorDBH+O792vZWr1Fl5xo0
 X/hQG4FMismj59EmAzA==
X-Proofpoint-GUID: sR7WemZs7UKz5Ojm1riK8ax8G6pt6kRU
X-Proofpoint-ORIG-GUID: sR7WemZs7UKz5Ojm1riK8ax8G6pt6kRU
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f9e1a8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Q5xIpPglxa2DKV_CsKsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117
X-Rspamd-Queue-Id: C4E6E4CD831
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105951-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The record_implemented bitmap uses the same semantics as the rest of
the driver: a SET bit means the record is NOT implemented (skip it),
a CLEAR bit means the record IS implemented (process it).

aest_node_init_debugfs() and aest_node_err_count_show() were iterating
all record_count records unconditionally, creating debugfs entries and
accumulating error counts for unimplemented records too.

Fix both functions to skip records where the corresponding bit is set
in node->record_implemented, consistent with how aest_node_foreach_record()
handles the same bitmap.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-sysfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/ras/aest/aest-sysfs.c b/drivers/ras/aest/aest-sysfs.c
index f710503e4d74..b36190bb3b3e 100644
--- a/drivers/ras/aest/aest-sysfs.c
+++ b/drivers/ras/aest/aest-sysfs.c
@@ -52,7 +52,8 @@ static int aest_node_err_count_show(struct seq_file *m, void *data)
 	int i;
 
 	for (i = 0; i < node->record_count; i++)
-		aest_error_count(&node->records[i], &count);
+		if (!test_bit(i, node->record_implemented))
+			aest_error_count(&node->records[i], &count);
 
 	seq_printf(m, "CE: %llu\n"
 				"DE: %llu\n"
@@ -174,8 +175,11 @@ aest_node_init_debugfs(struct aest_node *node)
 		record = &node->records[i];
 		if (!record->name)
 			continue;
+		/* Skip records not implemented on this node. */
+		if (test_bit(i, node->record_implemented))
+			continue;
 		record->debugfs = debugfs_create_dir(record->name,
-								node->debugfs);
+							node->debugfs);
 		aest_record_init_debugfs(record);
 	}
 }

-- 
2.34.1


