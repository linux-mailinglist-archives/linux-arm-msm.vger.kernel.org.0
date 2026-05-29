Return-Path: <linux-arm-msm+bounces-110230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDAmBlxLGWrzuQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:16:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7311A5FF0ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5E4731CBC38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 08:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30ED53451B3;
	Fri, 29 May 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOF6g0Hi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB56E348C4B;
	Fri, 29 May 2026 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042275; cv=none; b=nLvpposdrZgCo9VyuD14MHGu9pRO6vihKDCxqnNgnIaIzL/Oz+rXr8GlCErHZOlcAUtv31Oq0d6p2YngzMSbnEss8VVgtWqg5/iDerithk6m7+SWVPWidE43+p12QlU9biPtRUEwf2PmSk/2qCTw2a/rYTpKBx155RD2F6mOVN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042275; c=relaxed/simple;
	bh=flJfWzYRJhycIiawzUDf+c0ZT4a985J416Q4MS82tUE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ew5R7njHkcYo9V0uWt37Cr4cNCFCPHBD9de/nvJvg2mwEa9tg8dZLwnzEf1lauimQsk+JetoecLdCrSEeGJlvm1mm8kZ6baaOG6HB4jZI4x75VolqrYM6Am9CluSo5tYery3HAK1KN0H50cGbWA30MaZ++RxgjPbg4PvGiHZH2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOF6g0Hi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0AE1P1495941;
	Fri, 29 May 2026 08:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h2rMRRlMfCpBVaLywiZddCmfbOWqCZ7zwEM
	nr+jIjZ0=; b=UOF6g0Hiih+Z0dpGYWc3RhhnZA2ysWEK1p59p7QD3XkLYwbBKdn
	ybfNZJ28F38ugrhg5RuPGwxcpHNEJQXcQca7y6yxp7w/ZIJbvFoklk4bd0FZs8gj
	tqY/j+qsIK48FKlaRTffot/b30sT1WFag2ySCJssGtzkXFUv1/0SSu8HiM7F/Jp5
	yUvRvHMcEp1wMtcMX7x1zfz/eUNFc+boKD9UivFxP3RqP93GzPri/RhzE+if48vS
	Oax3uhctXXoQ+8hqz1Ivqn0EUCDK+/x7w3U71WmFvQAPNq5hqX2A+odWJQsMXEyB
	pJVjOgr3PWplp+CuL0ldJWp1/bVzsNVWf1g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef0159k3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 08:11:11 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64T8B7hn002159;
	Fri, 29 May 2026 08:11:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4eb5akbqaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 08:11:07 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64T8B7o6002154;
	Fri, 29 May 2026 08:11:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64T8B6GC002153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 08:11:07 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id C0139628; Fri, 29 May 2026 13:41:05 +0530 (+0530)
From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, konrad.dybcio@oss.qualcomm.com,
        abhinaba.rakshit@oss.qualcomm.com
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com,
        Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
Subject: [PATCH v1 0/1] mmc: sdhci-msm: Set ice clk rate
Date: Fri, 29 May 2026 13:40:44 +0530
Message-Id: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: WnwPYjdvCYGeqCsd_4SqWROmJoi6ofH8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3OCBTYWx0ZWRfX7912kufS9iTB
 xkq6K0bW7/18jB28Y/04Koqv6s55LdWxAp40eihYfM3jDRQ5bysuzXSO1pUB948vHCMyM8Y2V7v
 z2dAtqHmChpxQFI8XJXwCT1XfxBwNsRNAZ4Tb9CNhZoCJvLLkraOzfnXW3g+qUoVOTmuylsYwGg
 nyk220YgBHJ5jjV9Z/SbhQ+/NtBt4Ay9BNuFL8yl1JnC6fXXvl5B7oV/OAeEL4Uhwe96Z/xDTnH
 nyt5ZS1+Ju4UYnXrIP/Y459gv1ENzKsAD1wartYrOVwMB6JNl9mJI7ItijFLtFOVYHidtJQyJqo
 OE7kyyLTqpXRXrev5QTs4pHI3yIZHcUixkG64O8O5uLkEdayCH+/e4g6tgs5mq/fC3EyuoxuOOf
 N1ASSfy0m8qCkDnq7jkuas9mG2l7DYaUSPRqaI23vsTmqwLBshaxj535Ea8weFS8fAjimtlVSys
 +wU13LcSWAHyiSi1AyA==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a194a1f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=J77kmSgnQlSNxOV-0D8A:9
X-Proofpoint-GUID: WnwPYjdvCYGeqCsd_4SqWROmJoi6ofH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290078
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110230-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ram.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7311A5FF0ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support to configure the ICE clock to the maximum supported frequency
to address the review comments from the below ICE upsteaming discussion:
https://lore.kernel.org/all/7a0db353-02f7-4188-b2d7-9098548f1920@oss.qualcomm.com/

And also to address performance degradation of ~50%-70%.
https://lore.kernel.org/all/aTpbZHRUj6QF3KSE@hu-arakshit-hyd.qualcomm.com/

Below is the link for the ICE upstreaming where ice clock is being
configured to max frequency:
https://lore.kernel.org/all/20251121-enable-ufs-ice-clock-scaling-v2-3-66cb72998041@oss.qualcomm.com/


Ram Prakash Gupta (1):
  mmc: sdhci-msm: Set ice clk rate

 drivers/mmc/host/sdhci-msm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.34.1


