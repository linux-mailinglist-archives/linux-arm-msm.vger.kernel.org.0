Return-Path: <linux-arm-msm+bounces-104856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLUbOGMw8GltPgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:58:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FABD47D3EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38E163055E31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 03:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603E63002AB;
	Tue, 28 Apr 2026 03:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfBqo+VN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8bmy1kd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B7033ADB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348588; cv=none; b=jb3nxYfxYKopy0UYqR8QxoMo/bFfFazOQxrQygk0frz7a7zzhLeUnlsg2qqhQLxznahBEQLtaSzbP3fjsbKiUm/TSqs+grWtxat1L7Pd7eoPywERcsuuz57wXrJAFZ6SzjvWGc4Z0GDKZTWAaLNaenHYo2P6bLqy9ZW6DG71PVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348588; c=relaxed/simple;
	bh=B3HL64Au0aEXfS2Kn2bLGfzZAIxzxv1nhUwhmU2OkmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGIxLZlATbu7n1HGVlDezfWoqkInhvaIxVbfLifNx2tOXLoqTPUKKhe+H/TVkqq2e4utUgPF9xkrcKzBgtLYIws0NTrZiJMKl3Qq++ac4T89NhX3H4IwXWoUUKenfI7yT3PUvdW4IGquJwAPK/iUQIUvxVk+AJ6BMRJI35zF99Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfBqo+VN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8bmy1kd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S1B3AN3123484
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRQKBOvpIQQtqM4o6WXiH6tq8ETJefi9sBfIx2EGNi4=; b=bfBqo+VN3FtzyMS8
	CbXsV1xSN8HzlZLfin41kpB8HSiV6JXvskknW6u6+LOO0C8hqseecqQ7tFeVAp+K
	JL+K1rLKVVn13NfqAG9wc/wWb0HtL6kzxfIQX7+7g3fv3f3J/r7HAAGJoO9dZ3bH
	k1x23WyXop7exHkTgz6BNfe2Jz520uDvlS/Oeg5kxt7ImyzYbKs/zqXAM8gPgip8
	G9AZ7tdGQMSloh2HJobcq5BLMZ1RiDeQawAdyY8fAu+9c35Y/1aRn1WGmjS61MBu
	dejT0rZtKDG/h+QfRsLe0KYip8EYn2KrO4CP3I1O+PYjhsA7sB5pg63NCoECM3x7
	BGFmvw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgkmb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:56:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so12863719a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 20:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348586; x=1777953386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRQKBOvpIQQtqM4o6WXiH6tq8ETJefi9sBfIx2EGNi4=;
        b=X8bmy1kdDrj6Oi9wBjudkjV2Osc/Qvegkdd3K0dnjmncweAMOiitPiKLVC1d7sU05C
         7WtMEZ8U572/Ce0rbLPZsRrpaS06ZY6NDT6OUDPjhtmS1heSQ1dFP/FYRW5fslr3u1gn
         o++2FrVoirwlZHaV63c4di41szjw3/JccT0jECo4GB7ddrClxe6GcnwDI9KuapSpqiEk
         xzqvxmaqVuDTn72GtDaEbTxEHV+uAwBcvIeidagnAN672Fy24V82ZVqA4dbYwenGu+oK
         FPWlV5Ey1+jm2ov7/9lxhkZjVU2dayQ1cJL2R3P/s8JZD01g5xE8mpABo2gfBWynXM5z
         4Umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348586; x=1777953386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dRQKBOvpIQQtqM4o6WXiH6tq8ETJefi9sBfIx2EGNi4=;
        b=AD8EDsJTiT0qQqy1+TcI8ax5SRjtMk0KifAWtvrFKiVmD8svQO9Dh9hNLgNTDla+4c
         lk3l9B7ZWlsLPtd51H8pNdRgNWOtBl8JF3dddBlXd6BJgoXE9aN8h70+bZ3lCA7ch4qf
         mzENz/FBn9UxLk/9dm11Ldl1oxAOCLKFebGUiTkQddtaA4a2sRxFVht6BApj+UIo4myO
         +2lStP3QrarYd8OUDrZ5Erb5dHUzBdGvCUBsdn3jwUlhnBLTTA8LKT5IUSob/afrZb5n
         1WJwiiAluCavRQnzfth2fWyD01eM7tOWnhYR0srLon25sPOh2Pcyl9O1PuPC41Sf4OJK
         H0sw==
X-Forwarded-Encrypted: i=1; AFNElJ8vTJ4UrtBXuBZwoaIENB5puvRTpY3CSdiGF5Paycdot9FFSn27NmK2W7soG9KtB1CIzOv8HTM40JdlRr8x@vger.kernel.org
X-Gm-Message-State: AOJu0YwfzfzC+BHkkmHMWsiaRzbkY+r8Tw/Wbso+H1oB2KbeiiHPRpru
	88H2o4mSSYQQevm/xJkkJxudJoeN8BOUNr1iB3GTuYhMt4vAoC0ClZVYGky1fzofh+KKdSX+daM
	TT0SHjQHQCpHqx14ymSaWPqEazBaB2Uh5qE1oneyvKbn0y1c0q4IKb/Ow4C6w8dXPYAr0
X-Gm-Gg: AeBDies6RGrMntBOJQADaeqDDBJtmVkmAzmgZ61ZWZoxIH9tscbKLwwnEPi2MjcJGf2
	5hZDa20DmRNYcHlAmd79dyNgbVlZR9YVEK12R766Wlna+wEiftrrzosUxZKLtLvH0hM0H6x87zr
	rp0wDHTl9FLfQi2wwYOt3gW2NcKqHw51aBX+oeiaLExBeJ6e7x00qKC77DeTTRMU7POfp55JPNd
	IKGE9xTgYqcWhf5nAq3WXCldkhRqm6bd98Zo8nBIiwiIk7aWOCTTFl1B3NkvK+3v2q8+UShDq9X
	Wa0JM12l3/MA7+eSlR64Ox6Y8RdCIC+KzWr77R6dhLOYQWSZEP2MGHFhMIL4h4kNfGIZWu7WLxp
	baQyMl5CoX0VQI1q1aeLF9l36bqqSuWYJefJYEz7LaEUvA7knrlJ1+O32y5GftB0aIg==
X-Received: by 2002:a17:90b:380f:b0:35b:e51a:ec77 with SMTP id 98e67ed59e1d1-364920307f6mr1308418a91.16.1777348585846;
        Mon, 27 Apr 2026 20:56:25 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:35b:e51a:ec77 with SMTP id 98e67ed59e1d1-364920307f6mr1308394a91.16.1777348585379;
        Mon, 27 Apr 2026 20:56:25 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:25 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:10 +0530
Subject: [PATCH v3 04/12] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-4-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=1065;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=DydqIdia9cmT4zC+axscUwQlMujOYL3SDRWZ2LaadIU=;
 b=uv7UAzu7sAsuZDPmxAxOCzv9xYKtBDu7s/YBLJf5okHY+Wt6mzYtJY0/tliLYjMr090ZkEP4M
 nDwoGlXzeIwDq/ZRKXbzxUNySSWceRrt6Bw8UYVepbM2jUG97uOCMTh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfXxcwPw92BdaPY
 f7O0BbTBQUBYxTPL11LFxdTzb9H/sMczIt3pL5BKNCc4kcCSHd/IUQKBwByQtwHjhAlIwEvFNL2
 L7OnkPeQcelbRZynAWJA7aWOtRKwsZrEtAEBbkgx4tkzF1/lFYQD1l8GOO84EVZwYoEq249JpaG
 T5zPZYkwEyXIMIwrKNaPBSqe5YCQwE6UL8zCK9pbpcLANpO2CZtKBgTvirlgw+2OJ0fZdT9P0/e
 MXAKAuNEc2CxQC1k/ABgsMbelbaOYEWRTj11B126FK01vAxqWvygrMj2D0A5yPLQal1T35IDEEd
 SxjuMffjIJftXLyS7kgjhY04Y7TB/y5M7qIo9hQyjTMk4LmD7/sR5mxhaLOkl2EnNSQ2sLmyr9t
 a4jJGpyTkqxDiLrBHoK+Ks7ldA1SsLa6/zazVvRuzyUuq+9t3OSUzuQIFhBl8dH2nGBN4uU3A9d
 1xkldf550rr/+sb8T9A==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69f02fea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HQKoClRO7b2jHrqM0cUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Ck7Ci3FL6xZ-WuTZmUf_H8m92jKP03IO
X-Proofpoint-ORIG-GUID: Ck7Ci3FL6xZ-WuTZmUf_H8m92jKP03IO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280033
X-Rspamd-Queue-Id: 7FABD47D3EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104856-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
for device add and removal events. This ensures that when a device is
registered on iris-vpu-bus, the notifier triggers dma_configure(),
which sets up the IOMMU context for that device.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 61c12ba78206..d8ed6ef70ecd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


