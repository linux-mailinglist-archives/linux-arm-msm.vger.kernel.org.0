Return-Path: <linux-arm-msm+bounces-111153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kq3GHcQzIWr9AgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:13:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C887663DE80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:13:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MOYqBtJR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HDoqeJ1O;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111153-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111153-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4BF23057D74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 08:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA88C3A5437;
	Thu,  4 Jun 2026 08:00:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA593859FF
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 08:00:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560053; cv=none; b=RdsvS/rnUkR4BbUGi4Cu0Rn3fGD5FI0vE+4GwCTJrq8Hj/xvYzXYWroik4+9YxAHzyrf9nB/JhBNHdTHcpWB8M4y9kw4O72l2TFears7fw3tKhBBEqcJODmlr7ZZ9rcz5NnwMXU9oPW+QkF3QHq0/TSD+DRE6uehHxro4SZ8moc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560053; c=relaxed/simple;
	bh=oJ1ytt/FOpmYZCFLanZOIYvwzrmmHZQbwMng2Zl3qts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L1fmr5omugRhSLwyfQGEfqeSKo7g8VhZWUvUMMxbPrEEj+KHSr6soq/O7KsEzJFMrR30BVthlv8Rr3/sxaQOsHJaBReKLhQKotRS9QpCR5ConG0Bz37/qoVidX9ZFMwboREYlJj6eGj5L9QnHbWU9C/NycxvwrBdOSHVMJmU4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOYqBtJR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDoqeJ1O; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546mrV81476762
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 08:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PGkUic8oCRlwGh4ari41i/
	ESitpvFp86ehcfav6zcZw=; b=MOYqBtJRjoN2L7AzbCG5m6BbdQaxbj02O3P6H/
	wCOTDx59tGEjMaaeaATOErclNZEprkycgEviEmdgJFpMPftgeeGly1PUE2EDZs4K
	ekLlkL1UqQsSJgb8FkfRp1d3cEXerY8Vj+4ACl9o41QdCBjlJja4zdoIaEIN5/z0
	b/b+dqPxkdzTYPf6wK0gp9sdEHi2H8STjwAhmIpcWVp9MntTpZx93eLKcmOu5YB7
	NnUagHfuxsAHV64rcbaGgPR/Pm+TKBW4Oj6Sq3haQeD3PVsPQLEM/ru1KewE8hBW
	bg3Y5BTzdHlXRfD/ktLlu0oArXyytyaVY2Q49dhCcgzj/7iA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nunwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 08:00:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32259e0eso6668165ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560051; x=1781164851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGkUic8oCRlwGh4ari41i/ESitpvFp86ehcfav6zcZw=;
        b=HDoqeJ1OcuYsCNhYgE0wOb/s4rNxGv7dPE6iwg7r1UKK1eyEPYiJiXvOGD3qj/kBCa
         OyELCCcHJf7CLr573eDfEFIhbkfk2GxurJysie1k+a+9XT/c70/LSLJWFWdKYWKa7iM2
         zXuKG8thRoj4SFiR94SaoIGYucjDkOiqD9ECqPzlVLb5u+UFWYGAysetmThNajz8p8i4
         CUlpdTX8DDBOgmaCxG05yZiiUHA2rKEb/QVrQ082CdJ4/VvH+YYosg+8bYy9UWVVfD9L
         +Yig9nl7Mm8AeP8MTJKxQcwFZ6IQDGQ0NhG2BD/aBWedDseUsbvCrNAYIr8vFq5sRvIu
         LW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560051; x=1781164851;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGkUic8oCRlwGh4ari41i/ESitpvFp86ehcfav6zcZw=;
        b=P3ElyNIHi5VOL3sygVw4aOO2p6KsYGINHjyEUopikd2k1B5UH9OZmarAl4mbp1zR0V
         oJvP3K1cuqi711CMxwXahGjY+KiwXUiDYdzkmppp7QT+502Z6HQa8Xq+jM9uBSPZE6/8
         /8nzBV5BzdOQY+Hy6yG2/16xjM78JHoGfUj3fPcHfklpq7Ay6rbmvTLHZkz4LOty3W4f
         HTc1bzYj/XW4w5Muod+ZsxLKM6ZyBO4IPgvkOsFC5Q+N0aPvH7JZL0CJ5SD8rZsj0EGk
         597oGHtPf5o02Py80eaXeNgGva9g6czvOb7uuCbxVsB7x6pHmggMzk248Hee4uYA3+LV
         NC+A==
X-Forwarded-Encrypted: i=1; AFNElJ9zppEEjDF5SLAR9dBLgw68IIY26GAyZPO0ul4bjmVC0cMHXYiNJJwNrQJYzqNjeXInnytp4In60p4Ri57u@vger.kernel.org
X-Gm-Message-State: AOJu0YyTbjO9bHGDGCgWdRXahTfIlJKqyniGzK6AhOtIbeXTPnJ3Anxk
	NRSarTiB2Rv3oruB3GKAs1wVX4e0tYYmVpedIqTEaixZeDvpDO/qL9RfvIQmILCQS7jTzQgtPPg
	txOT9GETwju9S6n56F0IJCePnKDqFYzeU2tD8AY1khBHTVgRllwxYy2Zb/fFZE1Rv4iXQ
X-Gm-Gg: Acq92OHSi6qI8u4jBPj+wLZvgKXBpTqpmVQVQDeaqhDEEqrQLu2dIIe6BOmqsxpvm5G
	a/O6+ITcr/Z4LxRxI9ZlSSeqgjrbj8s1jOwywYjORZl20Q/yIEsU9viu0iRzzLxtGyFgWCDrZtl
	LJAXHAnIAm77pfytdVCNsdLxf4f+zlXbNZJTeca9gIUNV3BjU9Q3AH1m2IxDMTKWUt+V4F2GYyT
	0FZCtFa6TJpGak/vRVRjH1TG2ujI+wDO3n7vNLAZCRK9Tdz2TnJN9H1CflXL7Nfj4jMbZ4NsJo8
	xMY/n6ivZPYdsdfZ3gz6l7P0bnEKbi/nC+AZLTaIG2xV0lk3odo5apWtLjfNRKbtqA1MKGqlPcj
	I1zVEoGuKoe+sj4W3IcTr6nXZS/5zXv2NbzGRzo2ZkD7sHVE6fnx7TXknIQrfBN3/rzh/Gtv7S7
	z/StZayvvz/ABEmfvpD7HFWvUQcLUwOzQ=
X-Received: by 2002:a17:903:1209:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c163a242e3mr69054195ad.5.1780560049256;
        Thu, 04 Jun 2026 01:00:49 -0700 (PDT)
X-Received: by 2002:a17:903:1209:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c163a242e3mr69049385ad.5.1780560044851;
        Thu, 04 Jun 2026 01:00:44 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm49374565ad.3.2026.06.04.01.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:00:44 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: iris: add dynamic encoder properties
Date: Thu, 04 Jun 2026 16:00:37 +0800
Message-Id: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKUwIWoC/22OzWrDMBAGX8XoXAX9WLKVU9+jhLBerRtBbSWSY
 xKC372y3VPbi+ATzOy8WKYUKLNj9WKJ5pBDHMtQbxXDC4yfxIMvmymhrKhlw/1zhCHgmUaMnrh
 ujASrrSBfswJdE/XhsQk/TvtOdLsX77R/sg4ycYzDEKZjBUoZBEDU1tQWhDOtJU1I2qLQUsvaU
 uPBsdV1CXmK6bm1znKT7VlK/M6aJRdcSdWik0b2gt5jzofbHb7Wy4fyrLE/tPuXRtd31knfdhr
 +0qdlWb4BtXPjtT0BAAA=
X-Change-ID: 20260417-dynamic_encode-3751a6360ed4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560041; l=1510;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=oJ1ytt/FOpmYZCFLanZOIYvwzrmmHZQbwMng2Zl3qts=;
 b=X57JDngHEePDSG+Z5Efjop2FJdIGCuRL2z5mC3lMOD9ovGQR6UG8gRlmr44zh+rnaRUiOrhZd
 xMaFPYOR/5QDKrkT4WNYuFviNSrYTjnCjyUW6smiIQqEex/ibT7CwC7
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: OcTQBcATx3oQKRA9LWrgqMQyIG0pr6iP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NiBTYWx0ZWRfXz/HEDYL3xItA
 hrX73kFv4O4mhFpN1KLRMm/a0qboeZBsgY/AC6gle7b/tQ+NB5jEzVAM66Dh1kGKya63Wlve7r/
 VlWDNHy8tL5dFW1gZ9dou/VgU2dHdoP5HgL3irDZQ3K5TNCum9wkr7WcJiV0WPm4dYhEWVLwq6e
 Aw4yvVYQIqWFqNYfHX7ik5nWNfnel419wDHs2KIotGSPV6UNONdc/dOcW8nrKkZnzOe0dYnAhYn
 lSXBlgYKh7+rl2Tydv+yPRhPBTyqdwnIwsD2Rd9WAvKuZ1pk49vU8WfdWD55v56i1tC7QeBTfA2
 Yf2fONwS6pybcpmrfMv+6N2CDz3ObYBDxya3hf3l3DO94nwEZ4DnvfZlfrhgJ1V9u73iSDu5OIZ
 hRJPafHQuA51OIOLAkn6BXv57BKmpqHW4tUH6w/0am/N//iq/+YrA9o8DxvPp8Xu7EUbmtP/wZ0
 n0q1aewzUXza0DYpr+Q==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a2130b3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7J5Ww17mAtRdPOrEpzAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: OcTQBcATx3oQKRA9LWrgqMQyIG0pr6iP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040076
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
	TAGGED_FROM(0.00)[bounces-111153-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C887663DE80

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
video encoding features.

All patches have been tested with iris_test_app on gen1:QCS6490,
gen2:QCS9100, X1E80100.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v2:
- Rebased due to a conflict with commit 'media: qcom: iris: split HFI session ops from core ops' (35da0884068226ca3a53371dbf685db6e0d74658).
- Link to v1: https://lore.kernel.org/r/20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com

---
Wangao Wang (2):
      media: qcom: iris: Add gop size support for gen1 encoder
      media: qcom: iris: Add request key frame support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 24 +++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 26 ++++++++++++----------
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 8 files changed, 61 insertions(+), 15 deletions(-)
---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260417-dynamic_encode-3751a6360ed4

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


