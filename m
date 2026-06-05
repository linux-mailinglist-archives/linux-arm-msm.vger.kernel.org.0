Return-Path: <linux-arm-msm+bounces-111345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id byhxO6aZImr6agEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:40:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A45646F18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:40:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DXnVRVuj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111345-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111345-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4672A3048203
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 09:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7F74192EE;
	Fri,  5 Jun 2026 09:28:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F594192EA;
	Fri,  5 Jun 2026 09:28:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651703; cv=none; b=jMSvJNftBq98hjON/gjl3tdMmcOZXugQTuyn6d2in92NUdBrEcx/FXNZ++QG1B5fds7RFuiXYGbAjdvhrpc/tkZdqRj04lAQpS6vv910bnX+bPu3aBXePo6C2b4myBcWlrwfOKWxr4CsxHbFMULKwxkPvyytB7rEKbCgju9yNjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651703; c=relaxed/simple;
	bh=4Es5sfYbwQZhb93vJ56KJlF7i8tvfzwz/N94rpHYzto=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oQHULy+mUqMmjQYl1n/2H5iQOvP/JIFwOP8ZZF6nCzafq+gIDNonXCvLRxvGbL9iSFgar9HBaqi1mx+dSGanQ0XcPji30JMiOLjhMQDI+gJN8JBU/eF/65tAZ3btCRQabO/BgqP5CrQ9v1xBeTT10wsYoi+EyEpcKe6ytZbn/bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXnVRVuj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6554Nh1a2667178;
	Fri, 5 Jun 2026 09:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zXK14D9q3COyqLppOTSP8tKbHrMzRxjLbyy
	hl+TpXqc=; b=DXnVRVujT/sJZpw19dWzmF8gcrbv2atlhOOmFFBhB0NqshD15Yv
	YX3LTDzL7pTMgdnr+P4f74+umABpqSMVkoA4Mq/nQn4TL2OZfXbHUT754qLKbblm
	rkIG8zjboEYJlalYdhCfL2WReOHNAUxyp06roxaWKSxqaDm0dZSAlLciWvTyMaCY
	70dr0BQ3XdGelvHBQ6kDvSgwbdCase8BS40eKDp4rQJ87GNIlslEY0Tj2C2uQo0K
	mzcsEIWVjUEyNKz0v1i8SHO4QVub/7QCgq1LzCm7dxI/tsvXkZDTlGIMCfLP0tHH
	UYhzeIvNxK3FNb9WBClaOTwQXmafRKqOEsg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekemyu7t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 09:28:18 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6559SFK9004866;
	Fri, 5 Jun 2026 09:28:15 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: qcom: Refactor of_xlate_dai_name into common helper
Date: Fri,  5 Jun 2026 14:58:10 +0530
Message-Id: <20260605092812.3495852-1-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-GUID: _TomDGOZw8WbtuN0XjSM8QDlLmNJgtFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5MSBTYWx0ZWRfXyq4AdddgwS4S
 rGm/bNABAiQU9OWG95D6r6S03YP+m+lv/YMVyCk+aB+2KxKXznUqKKPIx1HuBlpSauim2Yc3Qb1
 /XR+qhobgPXZjsUYqnfVCIRk7GhzBlH5VsWPWkBqMml7khLgSbhlf7DPco9qfyt66KF6Xmi1kxB
 HDrCfG2FvAVYlqww5LsjctYaPZM8TS6Abqo+LbtyAGyFNPQBh83B1blJNY1+BJ0cO1sBE0o7YAs
 tkgVdq6lRRxzneR9HA+iudnl920Ab5kSE4qEp5MsQ9VtglEgbOILSxU3yJFcpGiqa57lvtm4ui/
 /bXiU/yBtT+xWbCi8puStGJBQDuXPkUekGdTS+9fL6SRf+3MQHisi5mekOwyqlJPUKQa32WkeRe
 dELHBVqfLAS9QrGymnznxsAOBod6NaHnYeQQ2ntmK7rDY+CFadrlLE+8GbecqXrJI+Qgfl87u4e
 ajHQT23wh5rSrfyNpyg==
X-Authority-Analysis: v=2.4 cv=K/wS2SWI c=1 sm=1 tr=0 ts=6a2296b2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=yT37FkYLDUihy_KEagMA:9
X-Proofpoint-ORIG-GUID: _TomDGOZw8WbtuN0XjSM8QDlLmNJgtFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111345-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90A45646F18

Multiple Qualcomm ASoC CPU DAI drivers implement the same logic to
resolve a sound-dai phandle argument to a DAI name: iterate the
component's DAI driver array and match by ID. This is currently
duplicated between lpass-cpu.c and qaif-cpu.c.

This series extracts the common logic into a shared helper
asoc_qcom_of_xlate_dai_name() in common.c and refactors lpass-cpu.c
to use it. The QAIF driver (in a separate series) will also use this
helper instead of its own private implementation.

Patch 1: Add asoc_qcom_of_xlate_dai_name() to common.c/h
Patch 2: Refactor lpass-cpu.c to use the new helper

Harendra Gautam (2):
  ASoC: qcom: Add generic of_xlate_dai_name helper to common
  ASoC: qcom: lpass-cpu: Use asoc_qcom_of_xlate_dai_name helper

 sound/soc/qcom/common.c    | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h    |  5 +++++
 sound/soc/qcom/lpass-cpu.c | 19 +++++--------------
 3 files changed, 44 insertions(+), 14 deletions(-)

-- 
2.34.1


