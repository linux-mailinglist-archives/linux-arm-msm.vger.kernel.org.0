Return-Path: <linux-arm-msm+bounces-113758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fq8/GgLYM2qfHAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:35:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F128A69FC6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:35:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hCbRN0Rr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Fw/5LK8Z";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113758-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113758-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42F543016773
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C4E3C4575;
	Thu, 18 Jun 2026 11:35:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E13909BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:35:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782528; cv=none; b=GpZUg/pE5y9g/gjQcZJrVblAvURczPniQVKVBih7OsT0TfSv/P/bSVjc07ZTe0rw7J6pN9oDm8QGpEohmD/3yHOa6kjDPccIQnjHYDKcDUI2eU0g7JGNuykLrTz70nNOZGAwm2oUWerhs5990bpepwA7Lpyf0c8NLuv5/7vxFR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782528; c=relaxed/simple;
	bh=xt4eYTZfu8Hg026U46Go6DOS1/L8i+khRCb4Z5za1+w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AAL34E5C1lfVRNxlDddS/QT5q9/ny5OEaD+JaE4p64bhKJdG06Ur6xMC0RwugAFVX0IAmP3yCW1bm7CyWU8I3kIViXUNPH5EHovzGUuGNzwBLCa5jEf1d+Hcbirou2/WWlIundtIxvMFHNBTUHPWlUGNfqkxfsNUHMiR77fvApU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCbRN0Rr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fw/5LK8Z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAtg5B1375340
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VDnjEl4ukVvyiu9fhR0zPkCMRxi77h1Jelx
	f+o8GBqs=; b=hCbRN0Rr20NMY141bKBkEMyyE7i7C3PLDCLWdk07UibAiIghnVT
	jd3M/aojRi7VF9FxhA00PGvzP3hoGkHo1wWqizmlMH0zJRRQE/zBwTAMZZz3UJdi
	7w2Jbr1dFefkDgs8z64HaIR1aiVxYS17/fv5sxM4lpAqmXWvcu550skVFJmYOxqV
	mfbpVzVFBOS/s6Be17Mr77LTR1+p6swVFlqdn3VDajHv6j0J8t1SVFPBOjZCwX82
	RnXv+EVWKvMEIbahe3GIJjx9NN8KQknc3aAjB60FczfQrcE9eogYaPOn2evGRg/f
	9I9QG1wzUfUkGcH28hGUFPE/s2KBdUOrb/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rtu1wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:35:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c64f7ff48so1000043a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781782525; x=1782387325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDnjEl4ukVvyiu9fhR0zPkCMRxi77h1Jelxf+o8GBqs=;
        b=Fw/5LK8ZeancCqhKTRgF968iAfOZR4OaM91MZ+L0XHRBjdmaS253Gc1OYbhh1Wt5Gd
         /4H+Uo7Vzo7HHvtA1BrMpu3YSqQZUh7w1y4NiTKXS61hbF/xcLpqf2WE2Py1dTBbf2lg
         0SaOO+U+L6id6inS/ZTVef4E/AOYbm9e+UCQQUz7VaGp6EGi6cCLyaT8FFB1KDxtdaxe
         rYsqwGE6jjRwCjoC/78RcJim3kg0G6QQb3S4Q4LR5Wrjufu5cfpBufVZt3SMeIal3FL2
         OyleWnNXYQuBb+cyEDlCNCh8zMLfiwLfyowpxq8FtiUuuat9D+57sQrMc9YlR7+BdbNQ
         nHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782525; x=1782387325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDnjEl4ukVvyiu9fhR0zPkCMRxi77h1Jelxf+o8GBqs=;
        b=Ap9u82ThC1pqvCYJ47+JEBwdyvHseOgPPaE4Z6WiBP+m1U13h19APfI5lK55UWY7w/
         Y9A9EeV7a50o+L638uLeRNrYmpDg57nE3MUSZltGRbbHEvfmX95CC2btIYBbz5PZZ4j8
         63Xcnq9V9JKKdoWIbgO/CIw1YZnYh1A//Es57oleQa6nkTnY50fE4NtZ5I7/3S8HdBhd
         JNKupDuDxciCVrRCwzF6PU9r1Z9twqocvRM4omBMR6O3m3Nupv8KN6Jg9BNOd6l2s9Y6
         wKPC1Afv+SXlEjaULkP51fGwBtWABT6WPtQDC8Bre01oXNNupk5n5dX0EQKjwxDmLiwO
         xT3g==
X-Gm-Message-State: AOJu0Yyomk/ERtveCWuoSQ6xm8OrE0eXdU5L6/gYutImX+cwOwstMAsl
	laauZ2BAR3bX+/ORyWQPaYMUsSU5kODxoXd5cZtIwp6SJ1k5WefLSqAT4gr2L3eoIEea0058ejS
	Ctokz2WteZh7+n3qagymISiZ25qo3kDQepprwc5V/go4dVTjW83o5z6sginY2MEGvyY7V
X-Gm-Gg: AfdE7cnJegjLQKPchE4ttqY2PA6K/wplGgBTVZpmaFZ+pzcNFOxjPlPSg7sDJ31N30l
	Q0LWg07mxr6V1RabRuvFzxb3JIhn5QN8BaA2YRhhezpgund0iJqJZlNppHEKV+6oBJc8Os14aKM
	JDJFGGShD0EVhk9Gmeq96vX8fpwtVQvs10yy1aKEUtNSFvp20DNg5uev1FPXVLG+i6TlwL68sKW
	HdJMdc6Zo5xA+fMYrD4tZRWEgDpT4ZGqWIv5f0cV/ncYObAjWznYtCmUsNuzqmzUM8mEtV7SP9r
	NHI9cmIMYVELgJw/RjCKZYp2UCtD+pj5ZksI72SlFsWr244Ybf8QazplzFhRWz4ARCrKYlukQYh
	V77pcmprm6m9rbcrC2Lp2//Nwte1uQ4AKpShgzv8=
X-Received: by 2002:a17:90b:3844:b0:36b:8873:d96d with SMTP id 98e67ed59e1d1-37c9ddcada8mr8215156a91.11.1781782524978;
        Thu, 18 Jun 2026 04:35:24 -0700 (PDT)
X-Received: by 2002:a17:90b:3844:b0:36b:8873:d96d with SMTP id 98e67ed59e1d1-37c9ddcada8mr8215101a91.11.1781782524349;
        Thu, 18 Jun 2026 04:35:24 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ca7a7sm9067856a91.7.2026.06.18.04.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:35:23 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH 0/2] Add MDSP carveout memory-region support for Q6 APM on Shikra
Date: Thu, 18 Jun 2026 17:05:07 +0530
Message-Id: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a33d7fd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xj269_gYMs8TCH6HuGcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX02B/FdFqHANF
 u5ei0VADYmVhYfXYPOWFxzdfF+wnLpWAO5llU/gtJUgSznACQmJtjfYXMA2QXUyFrlzqGDBesP4
 0Zi+oIsd5nvjmxME8x6fUxKPTb8VOBvmQ65isLB7xoWEXVXdaTm7A2RV9Xn4DoRnpYGpa91tLAg
 kRt/a7Nf4Xjx5JL/ZTQt9Nm9uu0jN/cF2LOIXlf5jBBmIoaTOH3jq1Ee6Axh9RJ9KRXty6Up1J9
 RGA/FtigU4+pIaZkDr4rj5nAGJ6k2JHvF6gf8RRmzRppIhFSHSWlpyh/fNETuZ4OH0scw2zi6E1
 fJSSOYPVHoGCHTn7mq+CjmpS3TOuKwbXXOycAbHC5B1tOZ9dW59IDdX6BXvbhVQ50LZ2KHYIpP+
 xLm83EZbYsYiBn9wjbQiBeGLyRGyVvQzervAhw/A+1QYR1cYhJV52npp4CDdfM8e/E9x8PM3VNz
 3O2V3oH71mKs1jL3Zdw==
X-Proofpoint-ORIG-GUID: vuzeVaS0DqTWHMnXvUsrwzq8d6HZUMQa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfXyLJ5qcT1GC0c
 YSJMBF8Ph9YB1nYC/rBJ5TD9kfRxUUFAXe5ga7D94OZFYPnSOWopaQwmO52h/JsdclM5NACP1cb
 ZofhQ522aqb2Gw/V3fW7S+gjTC4CDHk=
X-Proofpoint-GUID: vuzeVaS0DqTWHMnXvUsrwzq8d6HZUMQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113758-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F128A69FC6C

Unlike most Qualcomm targets where audio runs on the ADSP, the Shikra
target runs its audio use cases on the MDSP. The MDSP operates in an S2
(stage-2) protected/secured memory context, so any buffer shared with
it must reside in a dedicated carveout that is SCM-assigned to the
MDSP's VMID before use. Without this assignment the MDSP cannot access
the buffers and APM communication between APSS and MDSP fails.

This series wires up that flow for the Q6 APM DAI:

Patch 1 documents a new optional "memory-region" property in the
qcom,q6apm-dai binding. It accepts one or more reserved-memory carveout
phandles that get SCM-assigned to the VMIDs listed in "qcom,vmid".
Index 0 is the control-path buffer; subsequent entries are data-path
buffers. The property is only valid together with "qcom,vmid"
(enforced via dependentRequired).

Patch 2 adds a dedicated MDSP carveout reserved-memory region on Shikra,
marks both the existing audio heap and the new MDSP carveout as
shared-dma-pool, and points the Q6 APM DAI node at both regions: index 0
for control-path buffers and index 1 for MDSP data-path buffers. This
provides the secured carveout the MDSP needs once it is SCM-assigned to
its VMID.

Depends-on: https://lore.kernel.org/all/20260609064038.492641-1-ajay.nandam@oss.qualcomm.com/
Depends-on: https://lore.kernel.org/all/20260618112810.2009847-1-ajay.nandam@oss.qualcomm.com/

Ajay Kumar Nandam (2):
  dt-bindings: sound: qcom,q6apm-dai: add memory-region property
  arm64: dts: qcom: shikra: Add MDSP carveout memory and update APM DAIs
    memory regions

 .../bindings/sound/qcom,q6apm-dai.yaml        | 38 +++++++++++++++++--
 arch/arm64/boot/dts/qcom/shikra.dtsi          | 14 ++++++-
 2 files changed, 47 insertions(+), 5 deletions(-)


base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2
prerequisite-patch-id: fb821179cbe1fb1a97b987d04acb5a656aee9c14
prerequisite-patch-id: 42248b68d3392d122eab7441ae451981851c87fb
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
prerequisite-patch-id: 960421b3afdc01064a337eaadd6a53ce1afb8005
prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
prerequisite-patch-id: dbf7ba8aca718414ced7604061ac60879a4e92b6
prerequisite-patch-id: 67fa5f31ee5109470da23db3b513721580f4c86f
prerequisite-patch-id: 0e79e46bc5a88849a2f0a410b39c08f3244dfed3
prerequisite-patch-id: 0396ac157aba73a5afd7ba4a8a744847f5a7b433
prerequisite-patch-id: 2b1aecd97b9c073a1b323138cd7a98cb34e3715f
prerequisite-patch-id: 823bc7bc713f6fce1b9de47a266307f1829636b9
prerequisite-patch-id: e409bf71b615ed23828696cc9c1c6085b631c479
prerequisite-patch-id: 5b89b41d7c729c23b3b1fff9b5f572f4baa915ca
prerequisite-patch-id: acd08e91e5e2c6f4799879e48481b07167c0a400
prerequisite-patch-id: c9f2942207341ad4f450b20f049199f35188c02a
prerequisite-patch-id: dd62ebff6be6a2e2d32743812d35ec54daf91d00
prerequisite-patch-id: 3a6e9752793f2d7b084008b47daed10ea572064a
prerequisite-patch-id: 3338cdc5915c1e6b991067d3a7afb734c182663e
prerequisite-patch-id: a3026c858ffdfd3bfafc837e72c67fffe46021eb
prerequisite-patch-id: d16278d739341083377fb2a98862ba1932ad6ced
prerequisite-patch-id: 0a3f6abb3fe8634d297cf87f9cbec00664608ba4
prerequisite-patch-id: a54681edd36e35393b7b1906fca59e2106c6e313
prerequisite-patch-id: f45e9442cfb4307f9c4180c90da9e997a253da63
prerequisite-patch-id: 09258ed9eead7a956528f2d790be5cacb4e5fc03
prerequisite-patch-id: a5227c41a691f66e5b1c7e1259a101ec7345724d
prerequisite-patch-id: 0ff2d43b5d614f9fd8b4e6fb871bef2fda4ef3bf
prerequisite-patch-id: e4cb4b9831d278facc73913d3283038fdbe59ee0
prerequisite-patch-id: 003035cc99f02794043818256ba0ef657872d511
prerequisite-patch-id: c0e0e2054f26cdec216778d6e1aa8b51aa3210a6
prerequisite-patch-id: 5d23c938843176de2a02987d2832f31fe5df7fcf
prerequisite-patch-id: 539c31d705de3729782b86aeb7ca9dfd00d04208
prerequisite-patch-id: 430488f50f36039338965ab1fc28d83f02dbc9fd
prerequisite-patch-id: 359ddad8a3fb36f171c96da5ce5ffacd7dd63e8f
prerequisite-patch-id: a98885b9d0e0655bb3161dc2c31fd92a844a5e4e
prerequisite-patch-id: 63e6b911ad6700c1039802235c0a6d5870957f8c
prerequisite-patch-id: 6d481dd14afe58a17230318f418ec3fe0d327faf
prerequisite-patch-id: 7675b5ea6f01d7dadb8df43c8532daa4167fc92f
prerequisite-patch-id: 3fcc510f8f38ce63b24f02d48257ce8d7079b61e
prerequisite-patch-id: 037f677639a12a986e024f9a66df2def301925d4
prerequisite-patch-id: 888f7d13f882fdd0a01bc3fcbe008e9e56394bd3
prerequisite-patch-id: 7db9bb6a1d3de3667a0880f8a75c24ce62e52ecd
prerequisite-patch-id: b898d117a21bddc176ae19937b03e733df72f821
prerequisite-patch-id: 3ca81fae4cb388c4970e908fb63cc99bc1cdd008
prerequisite-patch-id: 80aead6484e36f52cb6cc7fd7d9e0326d8296860
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043
prerequisite-patch-id: 047b4fb1894b92109aa7afcebd7d5c7988ec5379
prerequisite-patch-id: 222630a15afc952683d954a3c66617a223546de0
prerequisite-patch-id: 3c55edb41f1e25920a350ce1c6f31fde67fee45a
prerequisite-patch-id: 99977ae9253a961b85331b9808c1feff0c2cc38e
prerequisite-patch-id: ab1dc085eeaaca2d88d4ffa3bb7a9eb70d479473
prerequisite-patch-id: 9e3edab83e9fc008b2dc254fb3b548ddd8f8b5f8
prerequisite-patch-id: 53c415b2ee6aae7cc5f446903fd6fb68b22d5692
prerequisite-patch-id: 0de75678d071f174c865afa2915be4df1aef8c8d
prerequisite-patch-id: 14840d7e2441e2110c1e147941744be637c9595f
prerequisite-patch-id: a7706e25f5951ec41e6b662c1704df8d20662d77
prerequisite-patch-id: 1e1be31d7ddc47eec9193164defa3e5c473b6ef1
prerequisite-patch-id: d13035abab3ff342753f5bf87b53bbf06a02c6a1
prerequisite-patch-id: 79fcbe1428667a6e0059cea9cbfd62d38d114930
prerequisite-patch-id: 591dd358a559fa83d46149f74f80ff0f2a98da7f
prerequisite-patch-id: 4d40e704139dc4b0ec2529c49f096d86a4e4dc5f
prerequisite-patch-id: c02813140f0c1c3d783f5643e34ef8e175cb20ea
prerequisite-patch-id: af52b9126b3ecbb6a39d855c2396a92fce275385
prerequisite-patch-id: f03075f14ae8d9a70c222abd747e07cca7f4ec09
prerequisite-patch-id: fab5ed6c3e94e533cca876424d076c8fd375e97b
prerequisite-patch-id: 97e013b8da4107d9634013a64189b101c0386301
prerequisite-patch-id: 68714bb4df41ab5d509440bf271e87e53d6aeb12
prerequisite-patch-id: 6df2cd98d019fffab2dc6d5a9ace72818107e0c5
prerequisite-patch-id: 5b9d4eeccd5ade672fbe3c40ef8e6f57f454fec0
prerequisite-patch-id: d4299778bdefe71a07621fdd7a3bd6c9bb6e241f
prerequisite-patch-id: f6872077ea6857f304dc5b1918827e84675c4c21
-- 
2.34.1


