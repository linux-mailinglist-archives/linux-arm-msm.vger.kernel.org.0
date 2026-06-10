Return-Path: <linux-arm-msm+bounces-112508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cONDJNGBKWq5YAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 17:25:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A83666AB1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 17:25:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jTQ8l0k8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kXUwtma8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112508-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112508-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6DF13007203
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E243827FD4B;
	Wed, 10 Jun 2026 15:18:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247E52E7F2C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 15:18:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104683; cv=none; b=W1YFjKGmtGwM225/o/prXt/XyhOLyOVEuhuj+MjvMHGMFDEhQm8RoUOKUq9mtnFXf8wYk5Pboh6QLiUPQJ293HrENuIX1jfLj4oa1rsukCJZbSGJ0KkX2Id46wmg8CYlTl2oz0QVO7WMQRVN8f+zCY4yyaJuDNbrLgIQPK5W6e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104683; c=relaxed/simple;
	bh=/1sJCH4aTkjnvQlnz28mHEwHTNCEcg/DB+ztRHNHtj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ed7r3xb2YtHhoOch8GPXDKqdqjZQAFFdKwL/OUIHOyxpnt3Ya1rtYNeQzuCpjyjK0FqUvE+jt+A7KkL/wdMj7DFXMMMw8XTWTmsfap7nZEdoLmrDM+v0dMIN4I5lOft/5A5D00ALT8OJicQ/d60QBsDyMq7TC4+cg8tgci9VpgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTQ8l0k8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXUwtma8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCM9f1554787
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 15:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=arBA4jNd+HaGHDjGRvTV9aRNGknsiOJivvV
	DqRhmnP0=; b=jTQ8l0k8UiiMhpfiF6QLZiaeAdkTkMKGdGfCXhoeyursUyYbSQx
	PYivx4NbG8TKc42AQkWD5r8c9IlwkknXz8dJrrPv01E0wLaUwlw0tTFj0mO6ygNF
	AOJn9nl2+xWX/flkJVwRtTpdQ1TW/jcE9lpdQCxwMG0NQHvmiOO3JXbsd4JIG+wM
	C1EVfkFtU/kcunXOpApc3PGNxASETfKt8wGqngzyPUIQAMEP2XKoC8aDVtW/VpKf
	KEXrBrtBBvJCUTmkUnlSesZqeoEyMIqCLXpsdnfdU+ehjkVCLknSSlZlphDVn4nh
	ssA74Qw/knjWaCIbfUmD31VFhzNZuQBWknQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnu8ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 15:18:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0532a6588so64102875ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781104680; x=1781709480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=arBA4jNd+HaGHDjGRvTV9aRNGknsiOJivvVDqRhmnP0=;
        b=kXUwtma83hOuCOqu5Da6RdYbmbgiWq5i24Q7qCs0I6tL1e0ane/qwTP2aUPKYfvSgE
         HL7fBbBezVhW3N7PLj/3g5ys13JxRkmcSxYUbM4geAUTykHHXursSLORzokliLJQyWsU
         V2t5w8bgrz0Yr0Gmu/OjFVq9b7rKCZyvGjQ3G0a7SWCw/bNtyD1yYw1Sh5TjBGRo0Y1h
         BqX2kb5voQXf54RqWURdZlGPOR2hFHhghA9K+sfJ+5QgJoLRsuDKSMrSNCIwGQhdq45s
         wOl9/ZmZ2bqG1doC7cxvIEb3vmKboYaqlNji8HG7JTeXBEuTGQsDGkNtr1PtfeiLhaed
         KA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781104680; x=1781709480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arBA4jNd+HaGHDjGRvTV9aRNGknsiOJivvVDqRhmnP0=;
        b=mkVUwosEKabwLRh6nJFK9mC/Tcr40Hg/37acE1a2hGoBOUu9lHfETNGWPAhiA2kEmO
         S9whyl9c8ZjYWWrcY3L9ySixZBFdkmcx/wufNtS4aQOS9wwjEN5ytvieNgOQAuF0cFIi
         QMNodiGA35m8YcMkZSDtLFWU142rZ0Z60no19R46Szy+Fv+9uYzE/kzCTmvBheBsCYJP
         HARIikesmOq9qoT6aBCIOJaFHmoDNcX50RIWMBB+B2VumCVYELMy3o6PBvCtt8TF0JLA
         8Rgv2SCez3RZDSE21viMtegOlXcjQWeUVqqQtlmEsj4ybUFNjAKkBhxeylXj7SGNcDrP
         W/RQ==
X-Gm-Message-State: AOJu0YzxdZnkWWzMepTiJtACz1ZL9mDfoCym+E6rwR64qHTMcCLLRq4k
	WboR2IUohwm8VImnS0l4OdvkPQJ1oDe1YY+G4BLJFp/IieddNPrtkLnH+xjECO7UKUy7zC4rqkd
	cH6SxtmDGaLhfW2Je11ENwiQsaGyoyIqhrpdUnfxXZJPteTohqiDP9KKm8xD7goSuJ11g5QMIdl
	hI
X-Gm-Gg: Acq92OG3HQbbKip5X6+CSYBbUvxHFPbqFCGyXctdIwtTdAFKevVGxqPOAx6yu4JkFyg
	zLIMvMT+SUpHeePjhuPOe41DjJrZqJ8SBco+qoPnM3sXvSmG4anVdAkLZ6rY48ZgER8Zpm72Ai0
	DOicloYXbrij2TvoM/vJmD5Q1hmnMY7wErgjUlEdmhQiRKl/QMhPLR/wUyp4c1siTwkUHQRXUfu
	fq/JPgYoJ7ABvxk0M0tGSlbmOlNVgtujp2IA5Zi3d+DhQsCWO+m/el8e28y8equkO1Jg5OH5BRz
	ioqCHkjzkCZZAQPl+CA8poMlfV+DC9+VihQzCDSahv6LhTXbZUDJTIaWutjbQLgBYpXVECVGdzN
	d4QE778BPYIGsaokZM8gQHl7mSf9HU1abKyoNrDe46Bh7Dv4oc4g=
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr288458665ad.29.1781104679983;
        Wed, 10 Jun 2026 08:17:59 -0700 (PDT)
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr288458145ad.29.1781104679381;
        Wed, 10 Jun 2026 08:17:59 -0700 (PDT)
Received: from work.. ([120.56.195.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm248366335ad.2.2026.06.10.08.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:17:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: Add Jeff Hugo as the Reviewer of MHI bus
Date: Wed, 10 Jun 2026 20:47:52 +0530
Message-ID: <20260610151752.9373-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: g5Pwz89HXzLFdoSDoI3xNFkrDZxXFmm-
X-Proofpoint-ORIG-GUID: g5Pwz89HXzLFdoSDoI3xNFkrDZxXFmm-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE0NiBTYWx0ZWRfXycelG6VKSKEN
 7wziU6/OfltKmgp3y+C8R0M+G6cQ67ZabTOwNn3H0yKwXiMH2/QgTrFE1pjLKgqDgARz6I4eyo+
 2O0xxKWpqVgIj/U4MOhvlnnJJAatWEZHrL5RoxUPsiMh+RTlA8ApXBtzxnGB/TjbmDS2Qi0QRbf
 d4zVKuu9cYbbhbuES38JBc+bWsxaxmk7y0MDXD78d7mZ47lUVlg+Qr7s2V3crg2XC0UZXKRWgxO
 5MoxLu0jupTDxONtm2OGGf7GKJGkHl3fEeIZlNAZSMpNluvGsFVDrEcT8apRdQgon+cMU1R5LBO
 zag0PGyfmYK1xggX3t+cxScn0vPi3gLQvBF7MirMEPNFCI0A+g9gkIoCt1AursVRdCwtaxQ2hjP
 fxSvSU/uajGINgzdvpGp2EChu8+10mT/VqaqnM+XlJWgoCxarA38z1M1ZjXQYga7SV7hFv1JZwr
 Nv3xNPOD4UeVVlPSS0Q==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a298029 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=n8UK4BQKCdfH/t0JQ2luxA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=jTQlwRca_LGcpbZH8LAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112508-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,linux.dev:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A83666AB1A

Jeff has been active in reviewing the MHI patches and he volunteered to
become an official reviewer.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..17c6fe6a0687 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17250,6 +17250,7 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.*
 
 MHI BUS
 M:	Manivannan Sadhasivam <mani@kernel.org>
+R:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
 L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.48.1


