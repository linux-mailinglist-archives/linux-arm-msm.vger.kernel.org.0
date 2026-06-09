Return-Path: <linux-arm-msm+bounces-112119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zbQ+BQTqJ2oR4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:25:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDBF65ED7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:25:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oK1vEgCw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MRZfMCua;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112119-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112119-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 814E73040DA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595F73EFFC1;
	Tue,  9 Jun 2026 10:23:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D4D313E34
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000587; cv=none; b=qQBWgOqO/4JMu5c1aevUVM5XSmHN7VRBHaWPO1+n6jyH0hMBwEv3QIYsinJw6Ir7rQ0Bs+41cYgWFdZ38Br7RotpmhTD6j9Nzj9TENQzWEpURk6TuIDRK6GJOxUUxHqAP3ZejhKgM35oc+djUAfJn2s5C6y7pWPzYun+Se7gVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000587; c=relaxed/simple;
	bh=7x8beBIojNECtEqJiYHYHNuMd5/1w962WKF8Uqh9EuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=df9vjJFpjz0bvImvs6kBUoiezqBLiVlVbgwDZKYr22CLUCSENpPjdAdr0bFXzpM8/nRnl1JDkPNn9P+lZzJ9TbaNJONBi4+8TQrjRekHIcH3NoZ5wAe9EOuC7T8mTUeRqa1l//+5ApauL2X3qVcCUiz03f/OJ1DExz8UYzPpTPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oK1vEgCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRZfMCua; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xKvK2208710
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oGapPqde/L8XcWbgwW8R8f
	ZSYz2OachDKg2LbyV/LTA=; b=oK1vEgCwMRWmWTdRU+YtNKprw5kl2WGsT2ZTwe
	5ysNuCmaARcWHlq04CnAsMhVuqEuScYuJIgau+RL6AS6T1/SNrn/O/UyGAMfOJDR
	li+aozatQnJUL1PC6/geZtl5VcqjrevGJgGaHFSP/4oWmJuOS8J/RZ9LcLmx0gBi
	153WJkDPROS5loJgNSnGBWA0pg14sY4Wm9XWcG3DkG/RTRFfRGewubj8wakRuAOd
	EGskiursJ4hUYqAFDAh7LYn5LAdx8OtLJld36oiQXlmXBBg5mRUv6nqxrdAAgoMA
	Za/KXn36Oai48YwPHXJ2oShYa9iZwIVkHNj/C6YI/WbFVrng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4gq72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso56874185ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000583; x=1781605383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oGapPqde/L8XcWbgwW8R8fZSYz2OachDKg2LbyV/LTA=;
        b=MRZfMCuaSV1arBcw9hBblGd4J+vfcvOdLZ8nxYqbnosxFz5utSy7PEZsYkek2FTU76
         idk+dmG+W0WHfvl3Xl6Rk2wmLELpMDJbIbBsruBXtmpZoVDYk4VhWlWw+L8cjNXdX5te
         5/hIPubiyg77guhOoIfLvRPkys8u3yd9d/36I+uWDYUh/RtzYifHfd3Fz873cNoSsJXC
         hnHC0wV7YlFqYPdgyAkqSA6WBPFh3NaHkOVHnkoS99UZaM77oYa651l+5KeiDI5kRVxI
         BnnisIx5cfqkTZQQ2pIX+wyNi+hxb+w3jBO2U3uDV5L42/BH/q7taWiJN5jRFfU2Iq8m
         FEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000583; x=1781605383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGapPqde/L8XcWbgwW8R8fZSYz2OachDKg2LbyV/LTA=;
        b=Vr9Y6nh1KitFcIRzUnfj5czNYa3CxVBMGS6tjVFO2bA1loXSQptGgdJB3SeWeFwXMF
         CLpwgHHKZrjJ4IwyKLAz1Y4iGsL5pQg6TGLkHLWrmaLGQY2ncQBKNNpL45JTyIHHammH
         6fgfdYGnG2QV3OD5ha7DOVOQsIDyBTNGJjditoNvP01Q+/KmZcRsC25GJ+iot73yPBNA
         Z+8ee8/HBJ5MwaiYdtBLZ7fSBGHjVHBX6+OPc2R/RPH/FcEBv6uUnprhgF1QwPy4b2eu
         +C8G+KfT2MqEYI9wLVIdOhhf515KxRlG6Fy4sFljTcD17RIfZ90M1shEgOfIHJOVtv2l
         +OEQ==
X-Gm-Message-State: AOJu0YwAO9T+V47gWtTMqIXQOddLImLlD2gcHe0PGH1n6+CHcEy5zU6C
	GnZQAK1xNb8LYyw+UAsrD/KH37VNcKCaZtPuW4WHbSHCrj2pNEF/zwzSolYhOr8ThP3ugrlfASm
	H2rFnzWVOkjiaCQK01sqj9czOnHlC0DLCTlCPCLHmdDG6LcfkvbwIJpaiGulCaxRmAMnN
X-Gm-Gg: Acq92OEQq+LL3vhI2kqKNr8KYAVkFccV3wm82cjWOWUM1YdgDGyayEL/oa6k94UQIB9
	AzA7ZUypxh6l4KpXOqd6gAws6+Ni8fWMqZGxpQdsLSJsgNJoMHRzhbnPpnG6v3dwNJX33/oDpJu
	t77CqXW1QBIJrdsYrLfwnXPSUaHdQx0ISkwvqYZrZo4MI9d9p3QHLzSMw6GxrTgTiVlbS4X8vio
	wev/mb5SwtuIe/5bNjkTsgtRAMBovIQspIP9iTRtch+3oQ3pLfvfw3zgXuJWCHG34lYTyLfsMZZ
	YRtxxWB5djPRuSB8D8mU4ofaK25UcXkP1vtKDUxO8SVsn7cmse3IJvw1l2TYY4PzvFD5bC7XApP
	h+R1aAMPDTr2O1jJYhoi41N2ZppcAXaL6a0VCovKlRMpJgiGxNYxRPSfsgWQ=
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr207447095ad.6.1781000582764;
        Tue, 09 Jun 2026 03:23:02 -0700 (PDT)
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr207446785ad.6.1781000582247;
        Tue, 09 Jun 2026 03:23:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/3] remoteproc: fix silent teardown failures and prevent SMMU faults on hung DSP
Date: Tue,  9 Jun 2026 15:52:50 +0530
Message-ID: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27e987 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=oORZlF2qDzti3-ymW0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: IeMJ4XqZviXXRXMj5BqAQRMSz9_qPuaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NiBTYWx0ZWRfX6KGPSj4nAYHV
 Y6gKZQ0+A/lAh+e8YWkNb2MQZfgzWLq2LOh3mwujCNiEydxfKuDiP0sYvO/aC9WaIeEEY5YX9Fl
 u5aSXpAvXrdSBU78MTcHtP4+Vn84UzOcVZNRDWGEF0ABw9XmlHKr1H4Kr8GLU7XMp1YybiDJ1ZZ
 EBwa0LRqc+Y4l+7huC2VdzIaW6KegOJYmUmqTY/V2LxmU1eTt8/5YW8uhJkJmSaLwCAM84OkMFW
 oVYttF/yFz0dFS8aU060jXCdFJffRsznYv7jS3Ho0GSABxHJ2V4lOGfmjRPO95eq8RxnwSMhhh0
 S3gBIe8fLhtaj3et4R7GbF+xVpByP27mF6/O9R0oDFX68LH6x6AD1DOtrDgdBuBk0HJhgmAoSpC
 dEhI457ZIyj8VohHq+alU4iYWsjK48zWbxQ25+4ir386s2+CgcELIvSG+eEmoKkz6reyrA2LpTi
 cCpOi4LnUeD8tTWReHg==
X-Proofpoint-ORIG-GUID: IeMJ4XqZviXXRXMj5BqAQRMSz9_qPuaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112119-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:mukesh.ojha@oss.qualcomm.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CDBF65ED7B

When a DSP hangs without triggering its own crash handler, a graceful
shutdown via sysmon times out.  Before this series, two things went
wrong:

  1. The stop() and unprepare() callbacks in struct rproc_subdev were
     void.  Implementations had no way to surface failures, and callers
     discarded any internal error state silently.

  2. Even if an error had been detectable, rproc_stop_subdevices() kept
     iterating after a failed stop.  This meant glink and ssr subdevices
     were torn down regardless, causing HLOS to unregister and unmap the
     shared memory regions.  If the remote still had DMA in flight
     against those regions — as is often the case with a hung DSP — the
     result was an SMMU fault.

This series fixes both problems in three steps.

Patch 1 changes stop() and unprepare() from void to int, matching
prepare() and start().  Most implementations gain a trivial return 0;
rproc_vdev_do_stop() now surfaces the error it was already computing.
Callers warn on failure but continue iterating (best-effort).

Patch 2 changes rproc_stop_subdevices() to abort and return error on the
first failing subdev, propagating through rproc_stop() and
__rproc_detach().

Patch 3 makes sysmon_stop() return -ETIMEDOUT when the remote does not
acknowledge a graceful shutdown request.  Combined with patch 2, this
prevents glink and ssr from unmapping shared memory against a hung DSP.

Mukesh Ojha (3):
  remoteproc: check return value of subdev stop and unprepare callbacks
  remoteproc: abort subdev stop sequence on first failure
  remoteproc: qcom_sysmon: abort stop on unacknowledged shutdown

 drivers/remoteproc/qcom_common.c       | 26 ++++++++++++++-----
 drivers/remoteproc/qcom_sysmon.c       | 15 ++++++++---
 drivers/remoteproc/remoteproc_core.c   | 36 +++++++++++++++++++++-----
 drivers/remoteproc/remoteproc_virtio.c |  4 ++-
 drivers/rpmsg/mtk_rpmsg.c              |  8 ++++--
 include/linux/remoteproc.h             |  4 +--
 6 files changed, 71 insertions(+), 22 deletions(-)

-- 
2.53.0


