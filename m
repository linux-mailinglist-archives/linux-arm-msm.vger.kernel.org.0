Return-Path: <linux-arm-msm+bounces-114388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TIdpC78rPGqNkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:10:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D836C0E6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:10:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GuG4wush;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kv6yPpYU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114388-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114388-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0458C30D116B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA96A33E374;
	Wed, 24 Jun 2026 19:08:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA85D334692
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328131; cv=none; b=IFZJQZ3yIFuJBMMwAbRvut6Jj8ExwwsCHDkFpOARI1x7PIJB45t5BKLNolBf+GyN9saG2qQJPkw/J8qeS3F/HquUYENA0GXH3sugtqzqrKxIyZlZsHdLo2TgNXI17oylWJUQlekhwKZHil1mKSP5GxWUsz2jhFRI7L8BPLLbBP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328131; c=relaxed/simple;
	bh=6w/k2iZsk3MHudpmix28SmiBhWovkM+5Ozoexf0PRds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uq6pKXfgI8eCi5LQNAUOpx5Kq9c8Vbdj8A2BMFD9wzAWOf+wlHm1cBIYat9tggCBAshx70TsLuBmqLo6eEdb1cvlZKFIkcSvuzrfnhlNfOgWrVbpuET9LvmK+1wP1zIRR791p9ZdNkU6wsYxrN/5EuvrSondn2e7MYME1rAJ/7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuG4wush; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kv6yPpYU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj1pA978289
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=altI44UPf5A
	n4jjMofr32B/jFu/GgoEljN19CjyDurM=; b=GuG4wushMiAea4Rvc4OLKxvUhhC
	jde3yODfVtYiO7oLyxkzuL1ku56RfceROXtlqWu2BmQPT6BbrUYSFYsjvF+dcGHL
	EDwNMwAR0qK/2Vnd8pJwv22xYwqd/0Q5gg6a30k6B5OUutTrNhOb2vGYUtlNBqRE
	3TEVAJ8EY5ov/vy8IsQBTCNUutSPOD4+7JYlxk/7F3KjSO0iPx4paPtgO8wRGIXM
	RBqwc4gXGgA0GCLrzI6MxVslREEsO5huKIPl5HW8qsA2reWD7r0lDiUijqeAYkIf
	dn2sjmusXT+3Nv5nQDHhOGASzUB6vl4lK8PDk6o+VbSuAdYg1y3nzH8Ykkg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqpau3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894391f000so1605368a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328127; x=1782932927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=altI44UPf5An4jjMofr32B/jFu/GgoEljN19CjyDurM=;
        b=kv6yPpYUmdwfr6Rv+BzRydNeMotx7RvEFlLEEm+rrzmf8T9VI0R1iX6V8g8p6hcUpJ
         qwyH1Vfhty9UU5aTAqmvh5sipMFun1nAf8UaPaitbeqVi38MGYkqd2/nO35t1BYWIHAB
         i1fnYqmSuIP3zwj/JGbifnUO0fKFmRWLVDN/z2fWKdHX8yR4cupELQYR9NlfD1pauMC1
         K00l3iqf5KoHsP1YFtSYNFox+r8VRM58GXGG47+xd/I21E0PKUU/eLdDeHfj7aSKQIK5
         PtMNb7pvJt3IteTq68K51+Od82n2WV/Iw3x+f3KeClUZXZEpzWzncY+4DqyTrfs2wdU9
         xZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328127; x=1782932927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=altI44UPf5An4jjMofr32B/jFu/GgoEljN19CjyDurM=;
        b=cSpywGPXjFLgDb4lZ2YdugWQC+3P2FhUafIr+VEc0QVJIiUQLvcZh1VvuUE2FxP/uo
         8UkIuVpgS0qUhRR+FbZGCjUHBxqeSTl1UtvTlUdmzHrltWfwzIdD2T9obwKAd94pYu1O
         pQBAEXx+285OC2zpjxe2zwTIAQA3VkrsetczqUNdxSy2ymoqR+nEUIXaqJ2zS36qUdyX
         /u8MMmXxgEtADM/gOmqP0qcAs/r1P6C7RxDjXVpJlIqPHccxC4TuRg/tmshonOsbKDrN
         XcLfmSfD+7RwY578DHJdzyq+2J0lYRxrhktlQMwH3RElkVeDUNemkK1XFyBmEb9pTiaU
         bHDg==
X-Forwarded-Encrypted: i=1; AFNElJ8V4zrAv6EfiQ91rx4ci8UraNPkOWm0Lj334KofsjR1vTd1yMwr4A5+/KXteAGldEdEIqa0u/GgaAGOekAM@vger.kernel.org
X-Gm-Message-State: AOJu0YwDbRtwiRbx5VYdOZ5RGKmZ0Oa+ADybyM1MiAjkz23D4ssEVPJl
	DMGQmA3yv7x+lgGTClmP6Tv8EcuHgPhJlpA1VnrhrbcIaGj/1J3otFjoW6pTDwQrRxtXlOyi6Nv
	IAir3UCmWCxyuaONfjdjMJCDIgjoF0O/hOCs3FQoYDxFk209s7hEdyxUlbvIfkqPw+WwO
X-Gm-Gg: AfdE7cnm4v6ET+RN6j6Lg/6QXRxMWpPHkpbb8vGVZyRyDW3CUE0qx37ozni6pI/mrMb
	6Wa/wx1bf1gB9MWZ4+NVtC2vXb+YuC1hY4eSFsj1IU30PjnDHJ13JGLCBA47LlyCsHGlgRe51TD
	4rJRSHc8B+Rrejou+CwQwNrqZNBqhwVEWGDiQtOjcX6pNxdD905xyTjMtIYJ4DirstyiZM4gAsj
	6Kd3vO6WqPsr2KDvLn8uLb01OmjKMcJ+8vuSULoqmzgf3XIn0MtR9eN2t8vhAiz4Vbv+CcrsNKV
	HWqDoQLQtfk613qgog+WTBuGDAoo4fiF7AMs3IWmxt+NN+GGbJWSFWaFGL9K3jErg7r20hibZr7
	r0C3d+d7Ohzoja2VVBMWQbF/taeJwI8lN/PyvRQ==
X-Received: by 2002:a05:6a00:1f05:b0:83e:d427:9817 with SMTP id d2e1a72fcca58-845a2ae1b29mr5333905b3a.11.1782328127407;
        Wed, 24 Jun 2026 12:08:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f05:b0:83e:d427:9817 with SMTP id d2e1a72fcca58-845a2ae1b29mr5333866b3a.11.1782328126825;
        Wed, 24 Jun 2026 12:08:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 02/19] dt-bindings: sram: qcom,imem: Add minidump-sram pattern property
Date: Thu, 25 Jun 2026 00:38:13 +0530
Message-ID: <20260624190830.3131112-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: cJzbpqu8zeQWY8oUOX5JFV-MLFrZMwPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX81HmOazyeSpv
 Ft7fNbBxp7Ht1pPD+d1HG27/JJbXgiUidaPmjJLhUCzPZMjOuar1stSOMPp7ecYyUxbOpZ+BxsQ
 p9L7Xy+VOvII+NpJ9mZKL08apVqbUmFOHpzUGoftUJV0c2Gze5/EBZuJItyKZNwp7eQo318Si5o
 fmRk8QUjdQMRgohZD/1kgEhKdaeqtherF2ouEb5uB4p9dBb5tol55NukCYqualYj3h/B4djJYcj
 9W0Mmd8xeetRRCf3kcLXS8omzIvQmKFts9sMoshYBovAKvN3f1iWBEg60OK5PKeUODQ4Mzf8OT8
 mdGqqmAE8BgvMLS7dvib2RNipC1Z/J3W7c87BIuoFCXH3Fzb3J3rLdwSt6p2ai2RLlcfXRZq0dC
 Kl69JUF+mBJoUGHn3FSEcxOfqIfz5Q==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3c2b40 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=CxA_GxxwRcnTusB8hbgA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX7z0sE8JvwFyY
 1ZYCaPixGEgQTEjyps3Pl+srUTV0K31gRhVfEkKM08T3FYIwUFn2vAYvBOkHdf0dgXgdnMJhGZA
 1rP7tQmz9WfJPpqmo5nIIunyEYGpmYs=
X-Proofpoint-GUID: cJzbpqu8zeQWY8oUOX5JFV-MLFrZMwPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114388-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5D836C0E6E

The qcom,imem binding describes a single word in always-on SRAM shared
between the operating system (OS) and boot firmware. Before DDR is
initialized on the warm reset following a crash, firmware reads this
word to decide where to deliver the minidump, and the OS is expected to
select one of the destinations: either USB upload to a host PC or save
to on-device storage. If nothing is selected by the OS, USB is the
default.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/sram/qcom,imem.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index c63026904061..17adced6d3a4 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -67,6 +67,22 @@ properties:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
 
 patternProperties:
+  "^minidump-sram@[0-9a-f]+$":
+    type: object
+    description:
+      A word in always-on SRAM shared between the kernel and boot firmware.
+      Before DDR is initialised on the warm reset following a crash, firmware
+      reads this word to decide where to deliver the minidump (USB or storage).
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+    additionalProperties: false
+
   "^modem-tables@[0-9a-f]+$":
     type: object
     description:
-- 
2.53.0


