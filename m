Return-Path: <linux-arm-msm+bounces-107672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id berrNLLvBWq3dgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:52:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 447AB5444C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 962B9300B752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D83313E34;
	Thu, 14 May 2026 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNzKZ0SB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgqhVL/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B0B314B95
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773864; cv=none; b=FKO+Qip4bGSyMPHvJIXScw/tAO8Fc4BQZPx5F2A0tpNxAzfDXrNGGVHxMCN25te3ARWUeudtyNKy+hKFCHMvTw30CtTwVpNJI6u36oNmiPuzAxkCFAiqYs4KrGPBNnOaNFJBNXSvFMDho98sBeeJATGybSfEFX+thvb9Xjd2yeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773864; c=relaxed/simple;
	bh=fRJ2Fev4fjEht897lEm/0Hbw3BqK0zB9DFzNm0cCzmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYNEaSwj9oael8xffhC1iDYR5XQwDXVDI1uLq870f1OpMAX8usNJcg6FDKHrNtxfsR5slejJPZp8VE38YGq8KOEQcAsQwifrcypF800TGIWW5tEEf4WidwoGvk78semTbZL+Erq5g+FxcaZ8mlqcdhGy1wkxgKLBpGHlDUS8fhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNzKZ0SB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgqhVL/w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeQMq2841032
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JaM+TEwHtLfC7f5MRaUoz5B2nc6Vq24PRov
	VUO5ViaM=; b=UNzKZ0SBnwOr8y6A2EYVtqGqXeujCGwhwJAIvS8akYiPjn64bFk
	KJvh/xUB7238qJAwBe0wweihJe7nSpH0YYKbX6Ci6eYNF3kAI+C++o0jgd1S59VF
	kXRSo2KYJAzmidnt8eYOv0uiwo99b/Z/GXzLba8g2gc4HEPasLnxiVoevL2mPDSO
	W/FTEoy5a6W1cEnl8XOhDQ+oxv1CvzF5FWYmFO7GJdgjTPfzYD4jMOgvb/zVwkp9
	Ovft0HY6EjP31oPHl8f/0kI+ivHrENiizYMgABrU6QjRGPyRCDmKJ86rtumfVEMs
	ob35aQlu0h37hd+rQUGrsf0u4YLDZZTZ7TQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899t4wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:50:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6332db4182dso5709433137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778773858; x=1779378658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JaM+TEwHtLfC7f5MRaUoz5B2nc6Vq24PRovVUO5ViaM=;
        b=CgqhVL/w99SunYZ7bm9TUb0Y1ei3VdlNHuh6cOz0htk4M//yit7PT38FMAwPXxCOCM
         dABO0qNMSO5HESN/VGof34hLTcTkWqEeXE8fvj6O/6OvrZo2QKTFbvM62kzMwgeQDjvC
         8nSPH6IK65SkeN5GmExSFGbQ6Pq1GhEaMoiDZgLR/pue+My+uWp1TkBL6OkvAPzUuFK+
         S9K5Hq+/4+gUsS8z6DcNuj1+RwyANjv/B2E6jitASp+viFSwq70lkB3tNk/sQaHev/gC
         f1cDo9tTlF1DKkDzsQ/3wNFo/2SYOC61OTRt60rspToUcodNTQrbGNqk3fYoCqV+njWA
         U8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773858; x=1779378658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaM+TEwHtLfC7f5MRaUoz5B2nc6Vq24PRovVUO5ViaM=;
        b=a+4Qys19ZpocvOPxR6ZPOgnVhHltOIo6gs7EnJrPbt1YRJJ+rpTK2oKwGwZkthC0Tr
         CQBkfMauBozNfEt6tQTxiVBOX6PbhE+v4wq1x8twsEsZz1jC0eO4XPIjE5m0M1X7vZbg
         Dh9CcJbYTGWztgzSsEpOBsxV5KMBqp3sz/9HShZWpqPKJtyK7PrgHjKRS1s7LtKwT3kV
         KKqO9BBD5jxVN30eIoo7ixTTs0HYGEMumbYojpnlgxt7+f/VSVrtPhNLvk2EP3XiSI9P
         geFCTRkUWDD8bIkcC92L+OnhAvIy5/zhU9njdp0iiMMKVESB51UM2i/Q+7kkzeNr7gLJ
         awvA==
X-Forwarded-Encrypted: i=1; AFNElJ+spdcoNxNE9hITwjlisz4Qy759ZdWPy77ZNsWpqNwWQMvjUhMJijmblhMwAcLQvFfjTsMMutaFYHuAQvBO@vger.kernel.org
X-Gm-Message-State: AOJu0YwQS9mTAkV2qgXTZXpPnG06Btj2+t3+ZCpU+ibPv0ZaHTdrwja4
	IV5iXPuxUYCQ6UTDQzTvVlT4lEWQYKfAD1jSXUPEyS3rIYG/PLhnsuZlxiRNRRbadYadVW2pCTQ
	ZhmgudS6MSpVdYnCi9q6Xlc8onHuRbNbjvxwT715hd5B8iXvBtkw4wvm6xd0PKEDhptcJ
X-Gm-Gg: Acq92OGPLIDhjmjPG1N6g48qPm78hUAq//0f3uIKvhLWJ5tx81+WkmhFKm3g+QbiFdy
	fSDj+dc31U7quxFV0PvKNESuydddtfvJ7NO9jxpWp5KNG7Kpx8kH9hohzfQHdYpbHe31yaMgQUU
	1DXMPYBunlOLOKzL2qBBtOxkgYAdUXvzktbD+y4KiKxclwYWVYHdNlfDInuZ8KkLfQdF2uEnOf9
	I9fLsn77Ej5sIGB71O9RVoiQWt8ur1KdglQ20J8TTPTGIWcIXyzBFitZeuC+zO2TYo3oAmTxN+p
	s/2uy3y6WrZuuLdU4ZvTc1W5z/E10tL8c7x3CXmuzCnETOYH1hDJmIQBZQM1mUREdRtLeGSmeZH
	Vi1RJ4fvACqmybwf22I8HzaSCc96862TtY/2pF0WERSI3bOeiluecp2k=
X-Received: by 2002:a05:6102:3e0b:b0:637:ad7:f57 with SMTP id ada2fe7eead31-637aaa5a6f5mr4188402137.25.1778773858165;
        Thu, 14 May 2026 08:50:58 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0b:b0:637:ad7:f57 with SMTP id ada2fe7eead31-637aaa5a6f5mr4188381137.25.1778773857763;
        Thu, 14 May 2026 08:50:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm6967067f8f.36.2026.05.14.08.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:50:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] soc: qcom: apr: improve RX processing
Date: Thu, 14 May 2026 15:50:48 +0000
Message-ID: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE2MCBTYWx0ZWRfX6SEvtN9XOV8j
 xTqKCYOdq7/W6XA6honCtt5xQfyh/EQdpaDRNXNeKYRsaqC4mB/IzsYz3ebgMUMaDRqhk959swg
 bELnM1I5z6uUzH489oe3TzuLJuyUvX0hiCFupICk8Mtvg6z2NmQXEV6dlUiWBBEjcviHRo4zYJ+
 YLxjEnd3RSH4j7gGkPBBO6rsC6KtIPlMTJ2HK82bLSaLpwNbPhjwXF1CIiT2Se7IT1Nz7UCTDaw
 aTHYMuveohvR8WCfQUtXAXRLrDYn2tW2Ldp0InLNbd7hyx54HsuTibsAg6AHK3F8ZuHeTypcPzU
 0XtsWZHToH7bIxL4ZGzd9kVnZPeIlmBx5SlmomJDjgejT11Afs2KcSa8KVrD6Sl8keSpZXmJl6t
 WDZLeJXmbEFYqLbCnhCEtnrkdUALTr279KvIqM1RqI/9c76A3HZSNmZVUuW7Hj6LAaEJHbc0adV
 arJbiHnbSe5YQo0+hTQ==
X-Proofpoint-ORIG-GUID: YomcVRvdN3UO1KkDhFBPj6Pf45laj14I
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05ef62 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=1WW9EnxB1D7kN0UGs5oA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: YomcVRvdN3UO1KkDhFBPj6Pf45laj14I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140160
X-Rspamd-Queue-Id: 447AB5444C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107672-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi all,

This series contains a couple of APR enhancements and a rework of the RX
processing path.

The first two patches makes code more robust for trival issues in the APR core.

Remove stale service entries from the IDR when apr_add_device()
fails before the device is registered.
Validate incoming packet lengths using the header size appropriate
for the active packet router type (APR or GPR).

The final patch moves RX buffering and work items from the packet
router to individual services.

Today all incoming packets are serialized through a single work item and
a global RX queue. If one service callback blocks or takes a long time
to complete, packet processing for all other services is delayed. This
can lead to command timeouts when responses are stuck behind unrelated
work.

With this change, packets are queued and processed on a per-service
basis, preserving message ordering within each service while allowing
unrelated services to make progress independently. Since queued packets
may outlive service removal, a reference count is added to keep the
service object alive until all queued packets have been processed.

The shared APR workqueue is also converted to an unbound reclaim
workqueue so multiple services can process packets in parallel.

Thanks,
Srini

Srinivas Kandagatla (3):
  soc: qcom: apr: Remove service from IDR before registration failure
  soc: qcom: apr: Check response packet length by router type
  soc: qcom: apr: Process RX messages using per-service work items

 drivers/soc/qcom/apr.c       | 283 ++++++++++++++++++++++++-----------
 include/linux/soc/qcom/apr.h |   6 +
 2 files changed, 200 insertions(+), 89 deletions(-)

-- 
2.47.3


