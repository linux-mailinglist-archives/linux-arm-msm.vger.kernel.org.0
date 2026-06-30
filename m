Return-Path: <linux-arm-msm+bounces-115550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9irQDuk9RGq/rAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 00:06:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 327C16E847A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 00:06:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Q/Esn+TY";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115550-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115550-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D4303014E61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 22:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D6B32470F;
	Tue, 30 Jun 2026 22:06:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40331E82F;
	Tue, 30 Jun 2026 22:06:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857164; cv=none; b=gVH9Kh9bfKPFZp5EWP1jjgqOQzmtTa0cU7F+3kE0QFlv0MBU2HgU+p+UhjCxk11IiQ3UpQ2nT2uhNc/MQ0coaklDJKx6+7Se+A5CkkoaqzXC+gxntvLreLpJ3XgXUU/qf8nKwV3bOcD8noNRbG9iSYwhHZuGgxIPosBK6VDwcnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857164; c=relaxed/simple;
	bh=jcLVXZ6J9LDnAuX8C9UUyl1LJIteICftPcbtMybLwbc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dAmKLEOkmqsHHh6hGZmohAQelTohPlwR7EdQ4vPGegEl4Lvq/LyfDJ1DQeGSxZ3G67c00BNoK+tC903nzPb8k8pox9hbgtu6EVe3YM/QYUJC6ov9awBOTHqPCi8n6RyvX5daCLbJnVyx9kRdFRhnIrq1cqyTWZCqFx7RL2rkAvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/Esn+TY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDc3b2920057;
	Tue, 30 Jun 2026 22:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MVLf5yOGlF0Qr/w2ariyhwbRiWxtWVXLgjV
	lJr+nzYg=; b=Q/Esn+TYH7Nn6YXyZQ1V3Vs/2mmO1uc8CYlm+vuJx/AbuXmx7/2
	ZDuRUwXns/lXpQGN8SJyek1oAxG3pVxvXzlAFZjKbZs510PzMhb6TU6D/SLxMSeL
	Gy7TmB3TRgCY3LIicya3JlhRTJ7nMQLnfSkZh+dn4FuAJ311TYtqlpatUa4UFPpM
	3/Yv5x2S4RWaIXJzEJxB2MEnYwr9577v5+2qWVmpx4Hp1HyZOEH/CC7q8vgfCySZ
	DhlWLRS1PyQKWy5mvQpT72+NuJLmqrFUOWey7Qvl5xLMGiVhbJkP1paev6YWbmg+
	+inSMblD9bDaYzS/3xMXLAtHeQ8v73nw18A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvw8us1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 22:05:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65UM5eAe003657;
	Tue, 30 Jun 2026 22:05:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kjw6jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 22:05:40 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65UM5eWT003649;
	Tue, 30 Jun 2026 22:05:40 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65UM5dgA003646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 22:05:40 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id 3A85362B; Wed,  1 Jul 2026 03:35:39 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: krzk+dt@kernel.org, robh@kernel.org, andersson@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, avri.altman@wdc.com,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: [PATCH V1] scsi: ufs: dt-bindings: Document the Maili UFS Controller
Date: Wed,  1 Jul 2026 03:35:36 +0530
Message-Id: <20260630220536.3803984-1-nitin.rawat@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: vgpb_EijJ1YQtl4DTOwwUQ5uszEZGn3z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNSBTYWx0ZWRfX43w3TIk5OBCN
 ooDNXQgQwK7ypT9U0YXMQ12U7spI+DwpZK0DZAutzq8h5U0+E2TB2Nw4CjG6IUCp2J2gZpvJCtU
 WoHf3oHFag3H26rzt6yp991f6bl0X4k=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a443db7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=dkR0I6OD3irOzcp_LXMA:9
X-Proofpoint-GUID: vgpb_EijJ1YQtl4DTOwwUQ5uszEZGn3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNSBTYWx0ZWRfX1RrUFYaS+RhY
 DB7/JKdUEKKSxmhB417LRhk9mvE1SrUQ/XfQWHwTcuyytIgKNmmj9HPHy6UiXQH7AtvFO2IbR+b
 rQk4ObQmFTKb3rgz3GRpIiRxsNlHRSUoE+qWuZNRscTvkymY15PcxuDHRlB8C8oq5ZtQ/dW8p7e
 8TtFhfeONJLSfb8kiRHMBalaNKosRPb86b8kgK2MHAP7bPDTmzfTcFKFqGZEAmXwdxmWPvfx83a
 NHT+BzPMfc28t1u0sBFrONBmkCS5GElaNQdkyoLEjiIY4SbejL89MBGgCFUT62j6MaBc1BedGoB
 yVnvXEFWht70VNg/8uYfyMCDNLaGBdcTSsCPmM5xzSabhocpNnsEJzX2YbX4APEq/5n0e9+2u8O
 TNVJecUQL+kc3bGUo8K+lBgF7mjn4blyFek7zfQk7qpdJKO0K4jDquj57VUMQV7DDIVWtWdiXra
 AULzjz7ZgzljBEYU9xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300215
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115550-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk+dt@kernel.org,m:robh@kernel.org,m:andersson@kernel.org,m:mani@kernel.org,m:alim.akhtar@samsung.com,m:bvanassche@acm.org,m:avri.altman@wdc.com,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 327C16E847A

Document the UFS Controller on Maili SoC.

Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index b441f0d26081..fea89e522f35 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -18,6 +18,7 @@ select:
           - qcom,eliza-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
+          - qcom,maili-ufshc
           - qcom,nord-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
@@ -31,6 +32,7 @@ properties:
           - qcom,eliza-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
+          - qcom,maili-ufshc
           - qcom,nord-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
--
2.34.1


