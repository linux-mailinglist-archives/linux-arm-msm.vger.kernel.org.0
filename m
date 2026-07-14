Return-Path: <linux-arm-msm+bounces-118945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dI/9GqbQVWphtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:01:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6AB7514BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:01:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N+nM8Rcd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118945-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118945-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90A32305D815
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035193D8122;
	Tue, 14 Jul 2026 06:00:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7DF277007;
	Tue, 14 Jul 2026 06:00:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008841; cv=none; b=YHKWxoi3HJlaAlsEQxw0PR+gsGInvKnct/8G6YGhQ1CGTyCPjPKDsBFODrIHp042oBqbo21/+MnBoQcSV2N0grywunolyEb81ivzzW1LIgC/7JWXhgsa1MSXUfY7XrAbvnZD6siOMkYNc5xDLBt3qtbwmuzSA7zuA2NP2cHtqMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008841; c=relaxed/simple;
	bh=WvATT4MjjuH+18ljjYBWhuKqy3UFVFvUQskRdeX9EdY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uTax8TbQIKd+KtBaFzU3V1bFlVgZqRrCuQu9pDF1DrJRDUrwhjc2qHae4v+U9RiPuog/vub5o9vTXrcLhIU1m0yUSuED54aXRhgvvYf9Ud7GvurzWVSaFLfyihfe0xvAwOPdekQKBh5waBPKAJE/vtaXo+dcHJVlJYKOi/2pILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+nM8Rcd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Qcb3441495;
	Tue, 14 Jul 2026 06:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KH/nytT5X+VJf07qaCKNYp
	Nv7Q5ivNWhVQeb+o3EpAI=; b=N+nM8RcdWJYHvMe10S7drGkg8MrtwKVltMvVcb
	aFWhvKpZCENHl9HIX7QUdTHYazXnFu704YYTpKhNT+Cjnr70RflMa+Jk+nD2S7dV
	5Ga9471vcURJNVyX/NY8ZZG3UgKxWCjtAkeuzcrMOVK3TXg6/zEJLsOo/JqZf2K6
	4C4oNkYdPRrKnEotztr9P8+TeVELKxRml7mVOow+4IpD8cwnhyC1KzSmXpodUW3b
	oIEZBFbGwCzxuortDzOrn8Wz34nO17agk32Sw8olrL62TxrXIsglurS6vie8cZX8
	pCm829lanySZw1iKpVCOErJuwwUKQb5kJGMwB6JPgMmQ87LQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr48r96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:00:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66E60XIE005689;
	Tue, 14 Jul 2026 06:00:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewjjhab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:00:33 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66E60XY3005670;
	Tue, 14 Jul 2026 06:00:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-dmantre-hyd.qualcomm.com [10.213.100.203])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66E60XPS005659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:00:33 +0000 (GMT)
Received: from hu-dmantre-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 8C354513;
	Tue, 14 Jul 2026 11:30:32 +0530 (+0530)
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Subject: [PATCH 0/2] Add QMI TMD based cooling support for the Shikra CDSP
Date: Tue, 14 Jul 2026 11:30:16 +0530
Message-Id: <20260714-shikra-cdsp-v1-0-8402e060809e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDQVWoC/0WO0WrDMAxFfyX4eS6WHXtOGGP/Ufqg2spqNjeNl
 YZC6b/Pacb2IjgX3SPdBVNJxKJv7qLQkjiN5wrw0ohwwvMnyRQrC620U6/QSj6lr4IyRL5IS8E
 d0QULgURtXAoN6fa07Q8bF5quVTpv4b+zb55Gpzo55STnHKXxJhpFgE5hv7SrMBMz/u6/bS8o8
 1dYWqlqy2vwXYDBm4+ReTdd8TuMOe/qeF8lR2SSa5LmelUPgHpwnTXRhqDQa99adB1qo8GB9Ub
 b6EAcHo8fqPCvxR0BAAA=
X-Change-ID: 20260714-shikra-cdsp-5ec6ba6c51ce
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784008832; l=2383;
 i=dipa.mantre@oss.qualcomm.com; s=20260415; h=from:subject:message-id;
 bh=WvATT4MjjuH+18ljjYBWhuKqy3UFVFvUQskRdeX9EdY=;
 b=lyu1Q/nHMaWEiZEQpX3S146kKLWstDxRmt2KK7D4FPOyWaFH2Cc0uhELKkz32tC1mNR39NHyS
 5HIUHp/Sd29DMQnr03qeID9OqSUucufpDkCJbjSvKuYdLR4gJ07Lxlb
X-Developer-Key: i=dipa.mantre@oss.qualcomm.com; a=ed25519;
 pk=IcrgHu2jFHNILPVydQwFqCQq05WcA8wBixw5s+yRMVI=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: QT3OjC6FSzoiRJGVpzUZ9Ome9vrpJ5-r
X-Proofpoint-ORIG-GUID: QT3OjC6FSzoiRJGVpzUZ9Ome9vrpJ5-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfXweN30v7/cCgS
 C+1p07hTuRs/vd3jf/f0BvEyisN62Cwi2fnxHL6C/r8JgssYjJOlc8mwOkdk4TABsR+Ir/Zexqf
 yV3yjhTj5UEyyRbkSCe0XcwTbbGtGvPZ5HMznIneYz27wlvXqRpFZFZRPPS1lit+0Me7JYUjzM3
 3sLjMIkvLNGCNQRPVObFPh+azxF3vnJAODWq0VwHo8nscYETZQCevZPXwK7BysLPBoJOGPZ1Des
 kd4LxKgYRPuOLziigfdvkezG7O7F3nYczpMONlD1cSUSl/4DMO/SqdfCqVBA8Yqd1IMuFet2Ias
 YknTfmtOED4VLFedI3x27GLdnLynzS/hA+aaLrT2nEtmydxkGIjU7urfjXUjMksHL5WyiFk++ad
 LrMvWK3bYkQi2x7FOIqEP17/pwLBt0K2CZLl0eT9vq/EAiBdnKqHVNkOLfgDhk8XRdbtORJDJiM
 HX6Uvuq+nGl/jhQ/Qcg==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55d085 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=U7XG-BtGj-ViMGvxezYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfXxMwimz7EcFIQ
 HPwyrpqtfsQvA9dVcxfVGHhBHyowGEEIEpDiEUszC1CezrFAIp9vXw1adM/z5tOjwpldbW8KsVD
 YfgHOU9mr0DyrV5BxXDvyXt+PlCSuEI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118945-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:dipa.mantre@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dipa.mantre@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dipa.mantre@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E6AB7514BB

Unlike CPUs, the CDSP does not automatically throttle based on thermal
conditions. Enable CDSP thermal mitigation by adding Shikra CDSP cooling
data to the Qualcomm PAS remoteproc driver and wiring the Shikra NSP
thermal zone passive trip to the CDSP QMI TMD cooling device.

Depends-on: https://lore.kernel.org/all/20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com/

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
Dipa Ramesh Mantre (2):
      remoteproc: qcom_q6v5_pas: Add QMI TMD cooling support for Shikra
      arm64: dts: qcom: shikra: Enable CDSP cooling

 arch/arm64/boot/dts/qcom/shikra.dtsi | 21 ++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c   |  3 +++
 2 files changed, 23 insertions(+), 1 deletion(-)
---
base-commit: 22f1a2f6953d5cc0a82845a69a23216158325d61
change-id: 20260714-shikra-cdsp-5ec6ba6c51ce
prerequisite-change-id: 20260609-qmi-tmd-383d30e1a60a:v4
prerequisite-patch-id: 465c1f2dcefe2e2ffae3ca69296b6a9ec50ab830
prerequisite-patch-id: 26c4e460ce1ef4866e140f38dd2c26509272d337
prerequisite-patch-id: 4e76c812c7b98d649c57f5ace80cd42079cfe754
prerequisite-patch-id: cbbdcc54de760873e4ba1a7788c14968ace935e2
prerequisite-patch-id: 94d3ad39536d12a5623b148e15aa27ecf1abb209
prerequisite-patch-id: bb184f20916f11fde0cb9b8b3fe7cf6344c58ae3
prerequisite-patch-id: cb215c7070ab425fbe181785b831bc69a23e4078
prerequisite-patch-id: 4fa886dd7f7c65daf1f22673adc35a527a84d609
prerequisite-patch-id: b545487026c8f9b853c8b925b9fb097fb9987816
prerequisite-patch-id: 4fcfdb3d75dd21f93880e70cceef9c883f9cd58e
prerequisite-message-id: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
prerequisite-patch-id: 465c1f2dcefe2e2ffae3ca69296b6a9ec50ab830
prerequisite-patch-id: 26c4e460ce1ef4866e140f38dd2c26509272d337
prerequisite-patch-id: 4e76c812c7b98d649c57f5ace80cd42079cfe754
prerequisite-patch-id: cbbdcc54de760873e4ba1a7788c14968ace935e2
prerequisite-patch-id: 94d3ad39536d12a5623b148e15aa27ecf1abb209
prerequisite-patch-id: bb184f20916f11fde0cb9b8b3fe7cf6344c58ae3
prerequisite-patch-id: cb215c7070ab425fbe181785b831bc69a23e4078
prerequisite-patch-id: 4fa886dd7f7c65daf1f22673adc35a527a84d609
prerequisite-patch-id: b545487026c8f9b853c8b925b9fb097fb9987816
prerequisite-patch-id: 4fcfdb3d75dd21f93880e70cceef9c883f9cd58e

Best regards,
-- 
Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>


