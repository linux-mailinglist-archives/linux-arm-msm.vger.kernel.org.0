Return-Path: <linux-arm-msm+bounces-115813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tcWWAmXLRWpXFQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 04:22:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0894D6F2FBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 04:22:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OFfJ0o1f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bSj7TslH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115813-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115813-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58625302B1FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 02:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4302C21EE;
	Thu,  2 Jul 2026 02:22:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F1A2772D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 02:22:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782958945; cv=none; b=jH9xB0ysMcjloHlonLCZItxV7S1ihAy2s4gNGad2k6lngkOR6ISWKikrRrpT8FV7Dk2Yl6MpMG72w/Pcz5PLnB3zGu5iR9eSGLri5K8N4YtygXPpWKEtX1DfxZIBEl6+nB/ChBOntA4xnSUZaNlxbG7zJ1HAvkh4RfW184sw+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782958945; c=relaxed/simple;
	bh=Xcx6CVbzOR65UAneR1Q9ElsyhMM8u/rDhorB1CejVBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bXjuXHSP109m+VRySlUg36PvUYUcQTM5fBl7uYWp7H6BV+S3TTIYaxLGFGzB3v0Pn6SNWKxMQtmTYsS+KijboAg2D/zQiGZhAjul6ZCggQwqvjRSp2Eg32Gp+zgqyMCIR9GBDxRk/7rbyvtXYd2xk/hQte7Q4xIofWQvt0uctDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFfJ0o1f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSj7TslH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KR6t3046912
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 02:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WuJiALMC/BGgUNf5qTrrae
	7IiC6Qqo1y/5Q35LNS3FM=; b=OFfJ0o1fNPdox08dfjsyHo7ZgIA2iIMIX3hTR/
	t1xpdTN8Z0FD3Tm5caJs+CRwmmsgUbuHgecd2WMA4YqAHpLiDsYqqtIBvCUgwmoc
	CByM1he21y8/0IZZ9DhLZjaelZS9TUWkbrViTqKExJ3YuNLOroj/ls2a7DEiGUG8
	S5dVViHPYAjlw7BYuoYJM4U03Njd7w/1ig65s8eYCQlflDGOcUw/j7940sDa17k2
	QXg04zAulHAwn4cR65qYi6d1S9CHyW7uXh0AjFcavGaejGp1jwsjOnUY/8Ei3YUq
	qIqy4ZzK4CjGX5NOOU2KQAr93Lj+DOH3G4iEDHCG9HjNMI8Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f58k39d01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:22:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c987913b08so16821455ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 19:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782958942; x=1783563742; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WuJiALMC/BGgUNf5qTrrae7IiC6Qqo1y/5Q35LNS3FM=;
        b=bSj7TslHMz27TBiirfXbPb6509OUBOsTolkNJElcFZNLNDu1zE76tvjON7p5/ZWFw3
         USeT0k/KGE24t85/7EY3O1o+Ntes3mDFSfu9yMsm68YXhOkOR0mUrmO/iFAMz3UdLCef
         IVPmm9OGlNyFm3CO0176Xgwv387mXhk5+rz4xcMUwq260bV3SLCFFL6+rwStNAidDqJZ
         v4U3Non8liN8mkeK/y8QcIghLbJoXyfaml4v3h/WWuVoBeBv2oQn9O0M4IEgxgPZepPh
         A0V2kn2dK9RvZ0UlAUg6Vzq4wvqSQ/v1S7zrg3kPoY0XPM82G/FEJDT1hjl3iCUONwMk
         ViqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782958942; x=1783563742;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuJiALMC/BGgUNf5qTrrae7IiC6Qqo1y/5Q35LNS3FM=;
        b=QwHskztLwVtt04tbV1/sf7LtAxdFMBA69fdYaViqJL+Rmmv3RGeKM4k2sc9DNuZD2D
         McLYf7c2kbnEhDjHKhRhj/E2TPvGR1ryUCsDsKerxfdujfWdoZnE0xyJWAQJfV9eH5XL
         1JRHvLqVx1x/lUFeJ3CX2P8XpJjvcNYrYRwcH/v++YXIe0FBtMVzlvLnnoaSzWwQRUsu
         FXeMnYHjCbCU3ZWqrkATnK3eNrq9nbHK17jYeDy6Owkpk3Texi3Fq+ZkiGBQnT7xGtrq
         mQtDQQ46gcz1attkfnOY7p9Tvq86wEKyhcAcXouSUoWmJxzhcnVoRcGJZeDO1VR4uQ85
         Sl0g==
X-Gm-Message-State: AOJu0YwHOQtDRivynEq1mc2oA88dHMthOmx2rk0DH0kcXG8Xo1gQRCKD
	aSzrLjfzN3/qemOQshsuGK5pjP4cUdWMz8fjCinrG9k2ttmuDaH0/YMcAVpBLmURzgDtp6hXRIg
	OuKcGOpyOde0zccH+vsHTYWbVrACCuHott9ZaqBT6OY60Az5fc0sg7RwumnwSRECqT6BzHXj6Ea
	zYmWg=
X-Gm-Gg: AfdE7ck5W157NeAd+TKhOBLT7ab0cdQVaCi87gFcANsRVel2pj5sfHJMXvd33Gerbed
	jSZue8ktuUYGjzQX3DUebvwxGZjl0xsLt+UxM58jgVBx/i8WHxIXT5xBBofSoS2cOmuA7+8twiu
	ZS4+8nhQfz2hR1xFK4cAWuiKQIF+3LglWrqdZbMfmod/2qSMUTYv+xfGEQT0pL4UXVM8uG0NqJ9
	wP40uxYRc0WDqQ3VR+uY+sdCJ3WoL0w4WbV2R7jYMuCXZVhhTaRJKgq2VB/0WKZyeZR9FK8Ubek
	Pqw202JnefBljGCt9gVfvx0rQfdojoYYX9U176r0Bg6cTrxyZDGs3EihgGtmNDPEAQxUfvpAOIW
	v7K0qk8ScG24u06kppI60jL4tRUkwHWJMldnw6HBnW15SHg8NS0TILgyDzio=
X-Received: by 2002:a17:903:3883:b0:2c9:97a7:b1ec with SMTP id d9443c01a7336-2ca7e9348f2mr45315995ad.43.1782958942321;
        Wed, 01 Jul 2026 19:22:22 -0700 (PDT)
X-Received: by 2002:a17:903:3883:b0:2c9:97a7:b1ec with SMTP id d9443c01a7336-2ca7e9348f2mr45315615ad.43.1782958941741;
        Wed, 01 Jul 2026 19:22:21 -0700 (PDT)
Received: from hu-yutlin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa65asm3279918c88.6.2026.07.01.19.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 19:22:20 -0700 (PDT)
From: Eddie Lin <eddie.lin@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 19:21:59 -0700
Subject: [PATCH v3] misc: fastrpc: fix memory leak in
 fastrpc_channel_ctx_free
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fastrpc-cctx-cleanup-v3-1-3a73c2e4ce1a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEbLRWoC/4WNQQ6CMBBFr0K6tqRTCaAr72FclGGQGqTYFoIh3
 N0WNy40biZ5yZ/3FubIanLsmCzM0qSdNn2A/S5h2Kr+SlzXgZkUMhc5AG+U83ZAjuhnjh2pfhx
 41dRSKFVUpRIsvA6WGj1v2vPlzW6sboQ+uuKi1c4b+9y6E8Tdn8QEHLgsxaHIsgwgx5NxLn2Mq
 kNzv6fhsFia5Ker+OGSwVVRWaCQAJCpL651XV+IpGprHQEAAA==
X-Change-ID: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Eddie Lin <eddie.lin@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAyMSBTYWx0ZWRfXxudSRNOAcr6H
 a8RJ4toW3Gw/nJITzqgCzxt6g10lsU4WTqDaomxyqPh0N2CthMSuV9ca38Cj9iJBbcM8RiD05mD
 8AHCAif2vM6vUaseUYvRJEi3F8WT0jZeKcKG23/huzLaZfFvPJWNnnptg0v3cH6k11/cuJcjA9v
 isspxIdqZUfrxOd25C+8FdV8exzc3FquN9ERHJ8xo8JVltiAq7YdF05eCZux9lj0XfRqv71W2KG
 Zmjw8sz+XNl5okddQf5kYKA+SeLDm0qoQl7NtDWx/i/Y+/JKC5B2sxdmmCZlU1c1o0RmHgaBTHa
 lhT2aCoQKJQ5yau3r3xlFdzbrTOkJhK63XKEId44eWHbmnM4z8yTCNDHVJ7ltEzbChnnLOK81JO
 151tgHG/2dQgxiw5d94A7fisP0++kaCWFc+SylsawlbFDVJQmdA91Rx8vIOx4NfH1YQku8Ovlxk
 a6JM0GULgUWBIK8GT3w==
X-Authority-Analysis: v=2.4 cv=SuGgLvO0 c=1 sm=1 tr=0 ts=6a45cb5f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Rsn1OCey0fvCUy5VNe4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAyMSBTYWx0ZWRfX7Zch7rWV5slT
 5T3z1JfBM9Rja4emeNqVx+A95aSpp5RgvzBegBxNJpV+p/Po/pUu7D7zc+F4pZT+LdLFbgNB9Pr
 ESgKIDRyLSlInvz2+yiflXb6atj4hdg=
X-Proofpoint-ORIG-GUID: 2YSPBKQoiwGjMzKW2-ztQUNjqejsgRFO
X-Proofpoint-GUID: 2YSPBKQoiwGjMzKW2-ztQUNjqejsgRFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020021
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115813-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[eddie.lin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:eddie.lin@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eddie.lin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0894D6F2FBE

The 'ctx_idr' is initialized but never destroyed when
the channel context is freed, leading to a memory leak.
Add idr_destroy() to properly clean up the IDR resources.

Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Cc: stable@vger.kernel.org
Signed-off-by: Eddie Lin <eddie.lin@oss.qualcomm.com>
---
Changes in v3:
- Remove duplicate description from cover letter.
- Link to v2: https://patch.msgid.link/20260617-fastrpc-cctx-cleanup-v2-1-be87c021114a@oss.qualcomm.com

Changes in v2:
- Added Fixes tag.
- Added Cc: stable@vger.kernel.org.
- Removed duplicate description from cover letter.
- Link to v1: https://patch.msgid.link/20260611-fastrpc-cctx-cleanup-v1-1-28097444116c@oss.qualcomm.com
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a9b2ae44c06f..7727850e9240 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -492,6 +492,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
 
 	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
 
+	idr_destroy(&cctx->ctx_idr);
 	kfree(cctx);
 }
 

---
base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
change-id: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0

Best regards,
--  
Eddie Lin <eddie.lin@oss.qualcomm.com>


