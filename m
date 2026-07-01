Return-Path: <linux-arm-msm+bounces-115778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ADWLR1rRWqD/goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 21:31:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4A6F0DD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 21:31:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dAueNVVk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hXCxUj9k;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115778-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115778-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95D8A30356E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 19:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EA83D7D80;
	Wed,  1 Jul 2026 19:30:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD4392C42
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 19:30:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934223; cv=none; b=ONpZkUPVKU3IKVq/f/Bp7vpqjDe9r7gWkQtYZ1H434oHAUbZhj8c3NfsGl1SNZl6cjaQ1haSCt1P2mI8JUjCVn2xPb71ezV4Mj7OAqdKOcTDFHUt2PPnRW1cWIckCMDAnuMqGgu0flvmthRcLZPR+DF7wtEkiXlWsaWHjHrANCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934223; c=relaxed/simple;
	bh=+3usITQGeBP/caOcJ4T87j2VOX2nM25kO9QIY38/XTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nOBF1cEb1M3rF5lQmKEcSca5Ku2r1F7A1nMJBmZg3+rBiDft4U6td1iSHIMG2G/fVU+kV1yKch4OIRxSvBo5+AaM9eRffa5XvFwsUi6kmnFN2CJcW76iOvrgrhOKbWVZvNOF5wO/PuliUepqDqSuFOANcxctyhH1zkVlVdMsGqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAueNVVk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXCxUj9k; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmbHX1712864
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 19:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JP1731msC651BB/VkadNagnugoH7NQWr3Ce
	rTNsZZTQ=; b=dAueNVVkEUzv0SkZwGkwUGB5GoTSViPBT2TU5cjXB8d9NS8t1jt
	Zv9WG4leVSVa0wubhu/PAtWYwd+yLQcXz+vSIZ2v8QMZOrZ/D2QQIa6whbNyVNl5
	t+cRXRDUTSjeMdCAFloDxD9WhQFkypj5NG9jBIZmstMAWWEdKY3LFI+NgUd9DCxe
	PxH5QyjrdghEwAOgo3Bq743rVw40x0ffT06pPU7w77LSjTNau8p6iE0hocTT80Qc
	pvfWifDmRYUC4VQNne3uyTQZpethTiAws6UyBsbIwX5AcNbRLo1klRULzT8qiyHU
	evmsVeuRN24HH/Td7qXHUTRwCBLXl9jr74A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd2bt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 19:30:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b4b575561so147795185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 12:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782934220; x=1783539020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JP1731msC651BB/VkadNagnugoH7NQWr3CerTNsZZTQ=;
        b=hXCxUj9kyOzlQi59MXnMCkk8a0bnbwnOpkorVpvn+xSEH2127vE5KoF0ZM5zeo4psg
         CNTn3xcf53tfAWegFG9D09s8gvHJyKnZkeMsW+iCgISf5uAvncywsfyrHI8Ydvdsh2tg
         zJKZFHHqW//q+hNJGIuB+jLmWXk3EcXrOtFitcZv/Juwplj6cUV8m0pAJXYVMN+k5Pm6
         gcYVfkS1/NDahwMNYSQoSnxHhk7IRdhGIhkP15L9JKPMsYDO1OWpCl5Knqklxq2uM+ew
         H+IXYnkSgt7QCUv8jIm2sO5nMQQP2PW8P3MEUrvywUmmax8qlRt1HfDw0NoHBw8XMq39
         03Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934220; x=1783539020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP1731msC651BB/VkadNagnugoH7NQWr3CerTNsZZTQ=;
        b=IPGZjwjZtC/9CKl4s+phSA4vYdDZx9EPM3LX0i/eUE2Y6uVFbYQI6gdCnTO0jukuTe
         4AubQRxor+R+qHonQ4d3aeCXyLVI2ag3vAt6SqPXn7HK4UT8A61MXmovneuQg/5KpvhL
         4yY0clTmUHovtfPvG31pThxgoreMBRU3YG4xI9nNFYTNRwnj+M9NF+fzdnXAizYem1rw
         WIolKsBoNTrJxmEUAChbbT6sGmnJds2yvF+CtKbmlW02uKvRGhVdeaxHN997k/8XPxk1
         H+NCaTdH9XRvwrn74pP6v4h7B6g111owiDrZQ2NctWZUnjHpZn3OPt9NuzgZP903HzXq
         Rzxg==
X-Forwarded-Encrypted: i=1; AFNElJ+lCK+OFubxvYPXB+iezwxGILRV8re0GvX2IU8HIpxUgFGiniN+DYyMVez9F7O6Vq5YgZpnmjLN8+5irZyS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+AxCOpnt0JvtKK+XpSAlAW3OCw5siIknmw7WXI3bdrdTcWQn9
	f3sXd08smCKmwCkFXCpZfBtuiwDPqpEA1SUo7E8gi4NWhYfCc3wKogdgpBWCU8bc6D/ovFFHlrW
	Lt6/wUCaloZ6Bsj9f5ZE1N2514vkg7On+EPM/Jr+jz9F1qb7LsoGPsmbtiVf7mZ4K0Hpp
X-Gm-Gg: AfdE7cn8ymW0Nxo3MZ0sIu6tluRo/b9RQsQHs+SbpTt4PxBkPw72mPt6v0gr2xyz9fk
	ZZPHGboGhzMOV6GJ0UaXnVucxbixXndfK0g6DjiRnP9iSkJxo5fGOPE/JqT0kFsc1L1Dabv9yVA
	p44SQdqStgFuIxkoO0EYZgvuZrQI+Kut5HnkzwyzyEBNpr4nIljyrfTILKI9mAgfSqhfTFHRZOf
	eGxtDntaJUjovK9a55ZdKRs9dErmga2EQCIu2PRx6Av88Djo+qvnk0bAJpa0kSE7GU0uqi1yR0l
	FJ2xcD66dMFgJPhlmetiCHsBiDYNkW9GFo8Lw1FJNk8AtG1yIiDjO0lzRxX28Qv2gjw2nF3hi0A
	eDIwkTY2MZapOj5yACES7bj0r
X-Received: by 2002:a05:620a:1b8e:b0:915:9eb1:f08a with SMTP id af79cd13be357-92e6971d04amr911842185a.18.1782934219971;
        Wed, 01 Jul 2026 12:30:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8e:b0:915:9eb1:f08a with SMTP id af79cd13be357-92e6971d04amr911834185a.18.1782934219296;
        Wed, 01 Jul 2026 12:30:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef11338sm78261885e9.1.2026.07.01.12.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 12:30:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: vkoul@kernel.org
Cc: srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] soundwire: qcom: Fix port handling bugs
Date: Wed,  1 Jul 2026 20:30:04 +0100
Message-ID: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a456acd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=fR8blbD0ELB2GWmyDQ0A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: waNABLyepKZrAc3VAL7aYLByle1BB5CI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfX0wZrJtH0mh+6
 vCVqCM6EsmhX2A3FEj06IFcoudHBjvPK2DfgWN0Gr9ztQpJiEzayyj9N6omWhgMqnu4fWUzMVsx
 XFJuEsnWWZukNTrM1yM64FNJo5KRS0Y=
X-Proofpoint-GUID: waNABLyepKZrAc3VAL7aYLByle1BB5CI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfX0gqZ11ukvVbu
 jA1Tu3iAM+2wGONAUKm65lpNuWgwBfdIyyo79av7l9R2k53lgw68WQMyyunp/thmHXxCxugA8Xt
 LLjCLGpuKqP9dDgnVOXC5W6nxLwDscyS4TJYo8+CFBtTcpY9vcUOvDU/hhuwA3rRaH7VCSLrpDn
 RdUW97ynoGjlLtT4sbQyvc+C7me9KLTANfr0LmUijyMXgOe56nlfpo6tt5uiQNGy5zELu/mavLt
 VkkLtwmry+/2WBPwO/HmJ5QcmLCKHZmTSx9ULPAt7jVTRWLa2DBX6b1n4KUCrWEHU1YQXXgXPQ5
 Dr8ylYPoaDRZAkxV3fWjMGA5MIxokVys0SWvFhhP+MC8Q1kDNqXBjKtYQ9UjW6TJx3qXh1G4q08
 z6NjKxsVlfpfIadc1aVld0VTf3R7GMwIrL6t3zssfvGjoR2gyvoPylW41jFSElVVFLu8mXkjopt
 xvXSCUk6B5VnsejuKZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010208
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115778-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:srini@kernel.org,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0ED4A6F0DD3

This series fixes two bugs in the Qualcomm SoundWire controller driver
spotted by sashiko-bot:

1. An off-by-one in the port exhaustion check: find_first_zero_bit()
   returns the size argument (not size+1) when no free bit is found, so
   the existing `pn > maxport` guard is never true.  The driver would
   silently assign an out-of-range port instead of returning -EBUSY.

2. The sruntime[] array was sized by a hardcoded SWRM_MAX_DAIS constant
   (0xF = 15), while the actual port count comes from hardware and can
   exceed that with controllers supporting up to 17 ports.  Switch to a
   dynamic allocation at probe time so the limit tracks the hardware
   automatically.

Srinivas Kandagatla (2):
  soundwire: qcom: Fix port exhaustion check in stream_alloc_ports
  soundwire: qcom: Allocate sruntime array dynamically

 drivers/soundwire/qcom.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.53.0


