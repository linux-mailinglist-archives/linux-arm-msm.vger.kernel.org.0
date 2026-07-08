Return-Path: <linux-arm-msm+bounces-117464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GAzYNwDLTWoF+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 05:58:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 174FE721829
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 05:58:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A3Ocbh1i;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZHcOQl0D;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117464-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117464-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFB45300878B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 03:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CE637A843;
	Wed,  8 Jul 2026 03:58:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED65A377550
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 03:58:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783483134; cv=none; b=AnaOqzzJVfZPo8ofHjPNmD073UdAwppQS4FnTjP6RFgLEpUC8JoBnVbG5/+NRLg+Oa0roOWMyBzKUOD6EBuWT/GYPMWoxfJasswMb/aICJe26AyYilNgJzKFu8jqYes5RKFbNNwYQdzXG5UBHSY8SH2DodfOG+HXALDCEWd09oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783483134; c=relaxed/simple;
	bh=SbFJVCbDW7thUo9wl/zKc1WGlXsEXTKlcJaCWKyiayw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HChxEeL70HTzIQFGJKdOtfZBUYL0AhzNGRca4HhA4q+28CPhwj+oggtnGATFcDTf8C4Jg0M8r6j1RbkIuckjfqvPw+y7rf+vtFgsu31ooJ1iU2eLW2GWv/ymOybWyVKIiwCcpVJquXgQ/bJaVt6QseEo4HUWejmV6AOsQQ/ZXcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3Ocbh1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHcOQl0D; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Md5nr974364
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 03:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rxlhybev86/Ln0YkgAASFU
	CG3bTQ0usUH7X+nPUzF8w=; b=A3Ocbh1iQrO1/9dZMyrEXEl+zWYK3yIUOtEtv4
	mPIbldorCNXYVq+DwoLj/uAX7HVfCPjAgYUJfDBDGgyLswTraYETv/iNXQrT163E
	8IaNJfSoK15XYttvndGwAhxOBSTFPKp7dc/AF+86YXlH689S7uq+duR1ygoxBepv
	e0UwwRgGQNL+yJEu0ASqeW+HMbkySkMEbE1/1qOH5fTJeVusSbj4HI56oNbCutFL
	fDyFK0JVfxeihYb8FxB7i9gy3AJ3jdGEhsxtiUINgpZZ29zcEhmY8Kw/Li1q33P5
	Fym2QF4i6V7xvCOW7+GuaijxNVAFrfAA9J5pVkgQ/6oYOHwg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5tfyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:58:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce406883eso2871035ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 20:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783483131; x=1784087931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rxlhybev86/Ln0YkgAASFUCG3bTQ0usUH7X+nPUzF8w=;
        b=ZHcOQl0Dk9LTlesSNLR8jVAkhV/Vv2a0UOUt9Do4NYhu1nXCNORv8ZDvm7TaJNu8wC
         ulvmU3GJf300OG+8Utq9yIePtUNDMb5i1927hE54AYN1+dgkaEowXl2YTz2UES05/1hN
         HOENxppFU6hPlnWxeG1b6KK5v6JhF5m82lUrfDQYNzC3RqZmSG4rzji83U+5ArSrIxyl
         KOa67oMej3eVzPKY39dpBU5rk2letyzsoNrnNF8n35ZBme/yLW5Pint5dMjwaaQz4mw/
         MtluBRvPhVUL7/28Pu4gFB6W4F168bryy59K9V26DjkUuF5m8Dk6LkgfPpVEulbZyIm6
         GS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783483131; x=1784087931;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rxlhybev86/Ln0YkgAASFUCG3bTQ0usUH7X+nPUzF8w=;
        b=WFRwRkoQ9P6VN6EojiYLhNBY1oSFa81AQI9Nt9C1+mcyYxXdJiUbOCEOi5+JhxBouj
         fR6/729ojrtLEe1kTiQFxbHQ1egKJGFf8zcSp9kajsToYCRAlHiPpH3k6ZNOTCPwP96t
         nrQWSBAxsVpG4oWmTna240PFGf2UIb9G4cLS1apNpmCg1DhUOF4m9ppF2YbCD7bpjGuV
         8O+n1oBrMinMw4YIWkq6vwJB7/BGKL1VQ9dx2kPOuLIiT4h/RsZ1KG+hzQAx/uxMTENh
         zTioJyVton+4JBHC0NLn+LbHQJwafUaYBrW7/hdhSUlY4ZyTm9LZFABqX+SoERVFW8do
         Qr9Q==
X-Gm-Message-State: AOJu0YxAPFlOx4sC0VQlI5JZ+f4Y/5rJ+YriOKdP7WKn+f8aabXr1ylf
	4PQEFm0//YBe/drDJWLgHOG44BN2DiwzNnwO8OXOo+EcwpzBcfzkDLTtqbcrBquTca0UUSm5e7R
	gjINGWy0AERhLCQh+qdbZOLkjIoUeVqXI/VTokePUOxEYRWEEgRfmyrzdczvKlP+SOpgE
X-Gm-Gg: AfdE7ck42lXST6pGW7/IkKxea4ufcmunklspRrfXlN9VcT1kOcp7/GbI92npMzen+pB
	KEu0UpY1VFZEaC5zRZoYBsc/mC89nupn34p24UdCfEFdXV9yfPREz6QYduZOHcI/cMNidvL/PcG
	n/sWNYUcQhP0J3oQkmHTo5BKZBnNIqMXHr0zfamy2HyGd1uA66BEgyfBOOgM3N65KZC8Dp7LOSi
	WOI6jufPkb7UXAVgfVp+GrZP6lt8t/BQ6M8Vj4jJfPCsLXacQS51yPYTeq/4MLYdV/6Q7S4NJlT
	+lY2ccZRd9kA1GCaGdYaLfpq5iacTNHEKFb4y4p2tVpx8QTiBbAwZvEUOv6MlQlVQPaUBdKuaKE
	VYzUZoV9ZJ+H8L6ISJUUGB77ystHyGh/UprwoMIUS6nHh
X-Received: by 2002:a17:90b:3ecd:b0:380:925:aa25 with SMTP id 98e67ed59e1d1-3893f97ccbfmr851409a91.5.1783483130818;
        Tue, 07 Jul 2026 20:58:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3ecd:b0:380:925:aa25 with SMTP id 98e67ed59e1d1-3893f97ccbfmr851373a91.5.1783483130327;
        Tue, 07 Jul 2026 20:58:50 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm14487136eec.3.2026.07.07.20.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:58:49 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v2 0/2] misc: fastrpc: move ADSP duplicate session creation
 to the driver
Date: Wed, 08 Jul 2026 09:28:31 +0530
Message-Id: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOfKTWoC/3WMwQqDMBBEf0X23EgSJZCe+h/FwxrXGqjGZmtok
 fx7o/deBt4w83Zgip4YrtUOkZJnH5YC+lKBm3B5kPBDYdBSG2mkFcO2CiY+diwINTpEp6xtoVz
 WSKP/nLp7V3jy/A7xe9qTOto/oqSEEtrYpsW+tyM2t8BcvzZ8ujDPdQnocs4/8WHQuK8AAAA=
X-Change-ID: 20260609-dup-sessions-ea2acaac1994
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783483125; l=1994;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=SbFJVCbDW7thUo9wl/zKc1WGlXsEXTKlcJaCWKyiayw=;
 b=NlQ/Wx8ghJtoXpDr4R4K/wZQviwH9phco0+9hlqjH3VcWj42wvZmZqtTKeCGVfiFlBNaey4ta
 RJ9xaiX2aNhDIW4TidCfeUr8VjsT9iD57/kakbMukZ/K/7BxmalIsrJ
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: YsFL4sh5KXvFNkjmbpormJy4Zub87zLh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfX7/dQoB9RO7jr
 WNgtK3EfYIMxM8kYr1HjkagCpGKMExXiCkJOoJuxui9OZfb4qCi9ZdsXcpAXIeiT+tCbjoR8QZI
 n7bZSLP3F7EVcX0aKdREY58+CuWVPRk=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4dcafb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xEkKumbzGPLJN7pZj7kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: YsFL4sh5KXvFNkjmbpormJy4Zub87zLh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfX2MXrXpTPlRqX
 gjnq55Z5eD0yykIiG7ydxMGoULBud8K4xTjnm8h6Zqb3a02ufW6s+CEhO3fSU+9ac6M9yyT2/0f
 /H42T5acgzeSUnnKfrTEwdFR6Ar4tfK67iw1mlBzLkU1AzeqF1VK8gUdXVIgGGBJ1SHV9q435rT
 vA0pk6J4AGjXxrOkdWZau7eR62D2zsGBJRd1e20wf2cDgtD/BFxmU/mmu/+e5aSsdsol8HqWjGA
 HVYJR98BA99WKdYg2gl39qcKfI8qa2vw9aqYfAuZvAZIHER0qBmGOilS42L0ilISoHe+YNToZSr
 p6tpOS0tO2B3+9EiuA81Xpbz/HS1ZyXuGIwiPM9cgrY5sMEll402vFQiv6MvXVZ5PYpgI4Xb3P9
 QcfMawwU9NT2j54vciFsdrThTuJf67g/7MdCNy7PFyy7r/8X9xPIwGQF5bRgi0V8nOZ+UIsyta0
 2zmBZ9fXegdaTrOy/Ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080035
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117464-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:vinayak.katoch@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 174FE721829

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, some Device Tree sources set:
  qcom,nsessions = <5>;
which duplicated sessions inline during fastrpc_cb_probe(). Upstream
feedback indicated that this policy does not belong in DT and should be
handled at the driver level instead.

This series removes the per-CB DT-driven duplication and replaces it with
a fixed driver-side post-probe step: after of_platform_populate() returns
in fastrpc_rpmsg_probe() — once all compute-CB child nodes have been
probed and the session array is fully populated — FASTRPC_DUP_SESSIONS (4)
copies of the last probed session are appended for the ADSP domain. This
keeps the per-CB probe path simple and ensures duplicates are always
derived from a stable, fully-initialised session state.

The qcom,nsessions binding is deprecated in the same series.

Patch [v1]: https://lore.kernel.org/r/20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v2:
- Added patch to deprecate the qcom,nsessions dt-binding.
- Kept the logic unchanged; only split into two patches.

---
Vinayak Katoch (2):
      dt-bindings: misc: qcom,fastrpc: deprecate qcom,nsessions
      misc: fastrpc: create duplicate sessions after all CB probing

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |  2 ++
 drivers/misc/fastrpc.c                             | 30 ++++++++++++----------
 2 files changed, 19 insertions(+), 13 deletions(-)
---
base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
change-id: 20260609-dup-sessions-ea2acaac1994

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>


