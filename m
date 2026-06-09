Return-Path: <linux-arm-msm+bounces-112134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jg9uO5/sJ2pD5QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:36:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D1D65F020
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:36:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=graAYAY7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MLPeEJak;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112134-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112134-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90C373047260
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F5B39B951;
	Tue,  9 Jun 2026 10:34:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98FC3B0AF1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:34:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001244; cv=none; b=DyNSKYGvpaxfJWtSowCf+re679P0yDqAMIRcDcVGlwGCT/ModatoSAdeMqJ+kYlO7P4DcHZmdgz8OiVzGhsLKoBTOsHDJbcCuk0KT/UOAlvOHyEy4nNAJJQU5sNgvaRSC6KnTUThpAs0PwkMdExEJcGF5vNG1z69DPVzKbVVSHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001244; c=relaxed/simple;
	bh=JskPNUjl/unnUFjATN8VxXMvtu7xQ8Bn9aXHNcT2bA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=doRvKXVTy6f5BixvAKXAB54jjWHAM2ikmf7bbeOc+nVJSyOv4S+vjEncyq0Fo41jxvKPZkRKbnLD5dkiqCed/PQudGYM4CWHcWkc0BjYFglFTsIags/7obb73lNe3/OWktjJyUaATJjLid7OeXpR4HNAnKNugUOIYPFxmWrqWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=graAYAY7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLPeEJak; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599x03x2311965
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=brBIXNGGsispYvZS00KeXP
	2e5A/MhRPM3DYvmbD3NqE=; b=graAYAY7dhI35EEP/+Ly+UY1VNhai7HyYv1Sw9
	Lejbdt15CCHlfAS8jnFXnr3G2NTJFA/ikn3iRCl2aJfx6z0tazk8l1t9UfTvMh3n
	ACSfFxsZrRIR8HAa3zENi9eaMK6oDLyPJgx7ggvB1g4pnvfNiPqvGIj+OPHxKcZX
	JOyAdX+131oJ097Kh3FDTlO6RR56XJJKF9cOag+2yU3q6E0nmFVAJQCX0YySoS2a
	08neS4Op3kdxDGRoIMCwDz4DhH57HZiefSrkXzUY2nugIxH4ae4K8f1qyvWedo68
	mgo2gT2fo2nQeaYc1v5dFnhx0fBfis6L8/aCpvdBkhfHCryg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v08wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:34:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a3669a15so3154537a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781001241; x=1781606041; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=brBIXNGGsispYvZS00KeXP2e5A/MhRPM3DYvmbD3NqE=;
        b=MLPeEJak4/sCckzDJ6n8tT40dh0uE6mkTw73PqamNlf9Degmq1k8NB2B3nk4OgzItX
         CXCSqUUgaaTEV1MsCiZKqnUJ/AKonqqWToMyImVeN46+SW1MLJFPILV91kDIVCdoFkvy
         +lUkmbbDBq8Sa5qrkL9rmDQC5UPuekILC+lfunPStufm1DoBRSYNysQ0TBAdXwxvSpWM
         epnpNybY5eNL3gUIhTZJr23Zof0imHxQjUbLgrbqgysKuABXALGgqObnSJQ9J3/+56g+
         WoJfIqBwEy6OJbLfZPmhr3azAiWxiR+LuvQ4T5yzhGto2LhQUe7W/HM48IyBiOpvMPVY
         pUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001241; x=1781606041;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brBIXNGGsispYvZS00KeXP2e5A/MhRPM3DYvmbD3NqE=;
        b=SAswrcvcf5HGOuWYObnod3piLpqpDCl0hKdiRdQfLczEBq9keCArSV6KFKkvGvVGgS
         +gLOovJxWrH9k9TiCTGbqOFPMSdtyuK9vLdWGvppt0Mmu5i30KlKUMutE+5eqPh37A0T
         UEHTJGi2eVgqOj3HXx5+27uvyL1KuNZx68UUY+5l1Rj9tBMoGNuE7PVg9ZEXOL15ETl1
         6mplN8A779XKS9tL8+EIDishjkdYzKdXKR/fp20gtK3UmF5W/SZqY566ciV2EzvYmKwG
         xsS3dfCYur8qCXdVT1KSDUatgNAU5QSxR9SVy8n1ou0rd06RlEETxZsXv6eoQbmI8IGN
         QgbQ==
X-Gm-Message-State: AOJu0YzuFT3irD93p04VBlmEd9KNgyt2iWNBKso3LddpkkmopwEtd/q3
	9AKTmSEXCHVc00nm88/3qJo82QQQPiZ6s6q96vkgNI414EDgTVC4uaHcWv8vSBl3s7+Jam/N9hv
	05DXn7DheUCcut9L9FTrukI6SKsXUlYghlVGbNLpi6bwGRPF7wtRFXbTeL7MDdyRWsL1DJ85RRZ
	bJcNI=
X-Gm-Gg: Acq92OF16igZF1PHS9EJpjcu1zapKhbzo6wx/bOYrYxfImDc77cIeiH9/CZ8sWQFToI
	VeGseA47uMPdv4IlZLx7vTuvYVZngr2lhXSwI6IEGlTToyGyg9APYWNsOh9zR+FjDb6i9JXKLhg
	MiSdGKCJyO5GcAhVjmiopjzGXb0WPvaD18LsXlDs4EUcA/dyMZNtfU1PFCNm+S3Sui3e9DLMk30
	X3kvdnVdYkIfq2/0nPeB2Iwlpxzn9RyyPhUp0FzHV3E1xT0Xf617GzKhbrFfUZKZKVtqlq8Cijg
	N4w4fz7bqShxWZIFfu+4n5INOJbzr4S/bDOk0bwytGfJ8XecxssgpD0Aa02+dwqgpwSN3JEnp3z
	+xcfJrEb1vUfKZffF/dgJYKfveLuTPWrbnLjfkpJYws43lEUvPS0yh4uVdI3kotrb6Q==
X-Received: by 2002:a05:6a21:699:b0:398:6ec6:b06d with SMTP id adf61e73a8af0-3b4d3dd0543mr17149846637.34.1781001240647;
        Tue, 09 Jun 2026 03:34:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:699:b0:398:6ec6:b06d with SMTP id adf61e73a8af0-3b4d3dd0543mr17149809637.34.1781001240195;
        Tue, 09 Jun 2026 03:34:00 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm21001446a12.19.2026.06.09.03.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:33:59 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 16:03:11 +0530
Subject: [PATCH] misc: fastrpc: create duplicate sessions after all CB
 probing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAObrJ2oC/x2MQQqAIBAAvyJ7TlAJwb4SHRbdai8mLkUg/T3rO
 DAzDYQqk8CkGlS6WPjIHeygIO6YN9KcOoMzzhtvgk5n0ULyeaIJHUbEaEMYoSel0sr3v5uX53k
 BRVWeW14AAAA=
X-Change-ID: 20260609-dup-sessions-ea2acaac1994
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781001236; l=3981;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=JskPNUjl/unnUFjATN8VxXMvtu7xQ8Bn9aXHNcT2bA8=;
 b=wSC1WwlpkDiGveaxKjULB608p6GB63IHA5iIprbeYniOxm+B+EYXH5aZF1p4xC8N+oFF53YFx
 mLiMqgf/bG7Co5c4pE0N/YAGQ11l1b8/n88fZg6xVBvkyo5ebSLiUY6
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a27ec19 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: tYSuwJMRM_SAcyOXqrfeSFO1C7JZGc-R
X-Proofpoint-GUID: tYSuwJMRM_SAcyOXqrfeSFO1C7JZGc-R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5OSBTYWx0ZWRfX1aaUnEIF1qTU
 Jk9hFeZtFiRImfO8qF17bWfomWSkoa9LAV0NfW8GHkD8OadrazKAUeLU0NuKdILHGFEf0BCOXBS
 i5NQfCg1rMHSKoae8erYsyJ8vkWJ3U/K+7qL7iXpIWt5kS3YQ9/cPH3u/23b51ffA1G0ww7LBXz
 CRUCAMcQoUjWDJ5AgOAOhzAh3fIsEmftT/STF31EydTuHJ9VXXiDRnSyf2kqLSIiGDtZUx12KMH
 NRaW98G8ll6poNmh64B1OYlAHZ2Y0fQv5MiuW49Y/Y/6jK6IMaIxJRCHkOpF846gZkgzT0uGh1p
 O2tyD2cCIcA3+RFVWIw1o03LO0ILhZiFxu//iuVdQB4ZT6lUG7yOTS49btyo+iVXxSUeuoH8tt+
 H05ki68GWmAt5iDXZ1ynaSsttWiVHa+zk9/QxPoZa8qHie3v2WFb2ImtN7i28IE/sA+uo0xfsQY
 c8pVsBftUqsylvSEybw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112134-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:vinayak.katoch@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66D1D65F020

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To address this limitation, a Device Tree change was used till now:
  qcom,nsessions = <5>;

However, feedback from the upstream community indicated that this change
should not be made in the Device Tree. Instead, it was recommended to
handle this as a driver-level change.

Instead of duplicating sessions inline during fastrpc_cb_probe() using
the qcom,nsessions DT property, defer duplication until after
of_platform_populate() returns in fastrpc_rpmsg_probe(), at which point
all compute-CB child nodes have been probed and the session array is
fully populated.

For the ADSP domain, append FASTRPC_DUP_SESSIONS (4) copies of the
last probed session once of_platform_populate() succeeds. This keeps
the per-CB probe path simple and ensures duplicates are always derived
from a stable, fully-initialised session state.

The qcom,nsessions DT property is no longer consumed by the driver; the
binding and DT sources are left unchanged.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..46afbae9c234 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -30,6 +30,7 @@
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
+#define FASTRPC_DUP_SESSIONS	4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -2195,7 +2196,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	int rc;
 	u32 dma_bits;
@@ -2204,8 +2204,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
-
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		dev_err(&pdev->dev, "too many sessions\n");
@@ -2225,16 +2223,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
-	if (sessions > 0) {
-		struct fastrpc_session_ctx *dup_sess;
-
-		for (i = 1; i < sessions; i++) {
-			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
-				break;
-			dup_sess = &cctx->session[cctx->sesscount++];
-			memcpy(dup_sess, sess, sizeof(*dup_sess));
-		}
-	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
 	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
 	if (rc) {
@@ -2445,6 +2433,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (err)
 		goto err_deregister_fdev;
 
+	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
+		struct fastrpc_session_ctx *last_sess;
+		struct fastrpc_session_ctx *dup_sess;
+		unsigned long flags;
+		int i;
+
+		spin_lock_irqsave(&data->lock, flags);
+		last_sess = &data->session[data->sesscount - 1];
+		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
+			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
+				break;
+			dup_sess = &data->session[data->sesscount++];
+			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
+		}
+		spin_unlock_irqrestore(&data->lock, flags);
+	}
+
 	return 0;
 
 err_deregister_fdev:

---
base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
change-id: 20260609-dup-sessions-ea2acaac1994

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>


