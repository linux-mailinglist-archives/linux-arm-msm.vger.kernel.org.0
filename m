Return-Path: <linux-arm-msm+bounces-117770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id liCQJIF8TmriNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:36:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2771728C71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:36:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RSMWIvQb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c5Iz+ShG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117770-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117770-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2A5C3035253
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 16:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C78B314D18;
	Wed,  8 Jul 2026 16:12:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44226439356
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 16:12:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527153; cv=none; b=VFjPrZtgOs3zQdm7WO5EfcNryf1tqUOndqJRY+fkDpMtaWg+y820a+4Eb6OkdnDzHEPbf0/lPzgLZB4l8/q/12dTh2NVgtwicE6hsqlh+NM+plvuenR/OvCF7cys0yRG8Potyt/+R3mhU3h5dgkfuptM4QV3HBpyVLCT+6gXTcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527153; c=relaxed/simple;
	bh=DRPHpA0PcYSTa8zAdV3+q6D/HchbdQTr81CBfrevzEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mMLJojzrMiisvoKCjw2x/yVZt/ABY1M1vU0Zcu0iFnFvA30YgfR6zofpe7RGWmDoVqiRa8afLb2eqMhFSqHAC/oxnKjeHXntoPzxgtw4TiBxuYvZlQc+gWDNxuK1BupwxHTTX77b3A7qbSQLvfl6ATZ+cKF8SvQ/zaBC4GIS4rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSMWIvQb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5Iz+ShG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668G2ldG3302582
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 16:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wqs+8YbqkvRcq4HCqQ5wAXXwbA5CZfg1L6a
	bLA9qIwI=; b=RSMWIvQbO6+J+TAgCvvNsWD9T6KV4a1Kjmh2wWl2H7mE60BUa98
	dV9VCgHzjWrBnBdVKdrOxvCFh05kpjNuAqIsBCzAAueIYM13eZ6h/y4To2qE1pqO
	LEKxRBy3RNgsAiZGraxU5T744NLHTrNYhTvModog75SS3YBrEGlx26+qvnWfMKUB
	WDYqmtcpPdKhtbyKQbhV9V/wug9bIEuHRNsED5stj3P+kuF0nYN+piUJMcy97Jj4
	P0twZ2PKvMVi3ixMHuK3HW6WkTwZW2KKXpevISzBYaRsSy3W1JU8GkrxjkSOuVHI
	/CqNQH9K9EoKePqH5m1ju7rfOr3LjBOBT1w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqs81md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 16:12:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso1136648a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783527150; x=1784131950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wqs+8YbqkvRcq4HCqQ5wAXXwbA5CZfg1L6abLA9qIwI=;
        b=c5Iz+ShGXeR4+perdtwjDnh1wTikUbypZaq9FL3psI5CB4wxO/UtxPw5tkwMITQ1j9
         Mq2ckLgYUkxnQU/rz3lqTQRAaPcWJ9Vb9YdXQfkt8hoSzq8unfFLDf2e5L0fRU3MW/PG
         lOi2hK/+msx0KgsjiYyN6qCJ3JyKl7MzobrNYtHmo1o4x336DmPx5Jsi82kSJzTpym3Q
         U2gKWIN9F3SLCU7eEv8kLxjPgoDN8FDltggar7x+lSFD3cZ0NDClK5u0aGqZ7kequNYF
         cTTAoYNqnD73WrM1dTbInJVcid4+WbWfCB/BV1Hmfnc/leyAE2RNRWYonrVzsDV1tCRO
         uETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527150; x=1784131950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wqs+8YbqkvRcq4HCqQ5wAXXwbA5CZfg1L6abLA9qIwI=;
        b=XWMf1V7vr2rspcXka8Uv6wPxTtGfxL1U2ZHKpJ8beof6AoHeZQOdOLLNb92X56C+Or
         zv5RktOXbAk85ifTmLMy+jcJouarbn09X+7LXeM2FJsi/QgyEOb9R2MRwTyGp9zsbZod
         oxtmfNfJzYX257bo/Po0KxAZDyPPPip0R5DX9wocPls2gG4xXJxc6/t9qakGyYBMtGyq
         XCsQccSjR+4Ave2oedLgruPiJirD9BmGbuKTFOq01O1ao9mJqSy5AGPm/6pXA6iOg+T4
         H44kCHUbpHj8Rdphr6rHKIbdwOIQ1/8HTRqNceKjv0aKGOYKLtAfbr+/WdF31JG/i4zQ
         68xA==
X-Forwarded-Encrypted: i=1; AHgh+Rpod2lB0yYp8DLacaRX4QBH/6VnoAKRMmUOkObt6E8Rc8US3+F/Ud+dHf8SHDqUdfgfGloR/w397eudO+Ze@vger.kernel.org
X-Gm-Message-State: AOJu0YzYj0KykT9Yze7RQZCp8Mtt9y8RMrhd/W1K8PK+c8QEkGsLqWj/
	IYqfgjMZU94F8ZqBzQ541cOlJw1M7mFDSqQknJ0TPp6AXHS9oTWsjkCJhpNm66fZPyrVarLa9ro
	i3btQUx9+a/wl84jVc0b0vBJZUxiYI9pr4Caup++YVEWmHFgKsodp9GedniCP4NQsTTz9ytI5sK
	+S
X-Gm-Gg: AfdE7cnpLxEVqCccTl3qCTsGVBC/M6DM0yekICoLyGJOKWr8/rKPjeRjeCSWiZIrI7y
	wdscdPvnpBIc7Ai+g892Qq9OxQkklJYJT5GrKYK0pDT9x3sQTUrgNrHMLxxpHODTs1WQevQCSiI
	F4nCwZCHWkef9g+0JM+dhXjX1kPMFMWWhDXXzX56cQGUz0+FsXfyfnEdT8ZcS/2ucEeTbB6EJW8
	K8zKeHofWvzbXpX5VR6+2aK7//AMGL0R0vcqh42ZQiWGjqq/7wR9QcmcFxmSoTtsEj2BxchkKi2
	lKxM+jIsMBMQ598Tuw3tvXdg4sDkiiQnWYI7+7I+EQcSBtxQwqqdWz+x/xbU4XJgjmFAOUbjk6S
	NZEv/4r4O1iyACyzCLM3LVU8JPygZST+WSbEjc2IaJJCHpdE0KYyYe0v1lA==
X-Received: by 2002:a05:6a00:18aa:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-84842f2af0cmr3368355b3a.20.1783527150243;
        Wed, 08 Jul 2026 09:12:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:18aa:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-84842f2af0cmr3368315b3a.20.1783527149663;
        Wed, 08 Jul 2026 09:12:29 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3a2e420sm2600974a12.29.2026.07.08.09.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:12:29 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH v2 0/2] tests/msm: Add PERFCNTR_CONFIG ioctl
Date: Wed,  8 Jul 2026 09:12:22 -0700
Message-ID: <20260708161224.507091-1-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfXwaQ4nSVNw/Qr
 gDD/4eqqR3D+zcimnQPCPWlRLx0WovJi9nyX/sxi520ocrtbVXyLG+K7agWw496w9hdKhfhCmyt
 TVTf3b0Q/omIIIGkh1qhpCEYR4YaT+w=
X-Proofpoint-GUID: QG8sn9bglncZBbI6V4C4Js6loVsdd4wK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfXyfgsgFvRyT0x
 Lwx3lBJ83KoEPWe4+I1hbYMUpUKRC8b8hSVInBAOsx6Mbn50xRb4pbSYPgcZb6UEWBY3tE41dmj
 w0gLr8A5B0DiRfEk8A9RCDV/33wTrlBFLUZ4PweoDhFmdfRwx7T4Ls9EBtYuoxzajYSlntVaI4h
 TfSEcTql8lbuMWcntSQoZ6nsEQ3oj1HtC6eM0Hwteluvt2jDoe9A4Wz3L714aseVAyjwddWc7dm
 YMaMIwtPNuEfqBmVxj+reuiUBoTfRzK7LMNSY14wDnOYe5EwkmXqwyzpBNrzR7LdQcv1v3kJpKT
 9mOYGN7Y/x3szjv1NGqN5SvUkb7wgvXrExAFh5kvTCm7CPQfJubuNgPc3m9HOPbyfF6wqOVzUuO
 kG7TIuyOq5ThD2LTR4roK6oWLYDjDBq4dTHJ9oKCkUqXi508V7bRxMrveMrGOutNbfAR4kmFVjk
 gVpBT56eT+IV0N7Z/7g==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4e76ef cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=ojyeN04l4yA0XdsW6-wA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: QG8sn9bglncZBbI6V4C4Js6loVsdd4wK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117770-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:igt-dev@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:rob.clark@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2771728C71

Now that the new UABI is merged for v7.2, here are tests.

Rob Clark (2):
  drm-uapi: Sync msm_drm.h
  tests/msm: Add perfcntrs test

 include/drm-uapi/msm_drm.h | 204 ++++++++++++++++++++++++++++++++++---
 tests/msm/meson.build      |   1 +
 tests/msm/msm_perfcntrs.c  | 196 +++++++++++++++++++++++++++++++++++
 3 files changed, 385 insertions(+), 16 deletions(-)
 create mode 100644 tests/msm/msm_perfcntrs.c

-- 
2.55.0


