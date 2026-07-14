Return-Path: <linux-arm-msm+bounces-118946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BLe9GtHQVWqBtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:01:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57F7514C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:01:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XE2SuPem;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118946-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118946-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC1BD30B0D0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50653D9524;
	Tue, 14 Jul 2026 06:00:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE403D8918;
	Tue, 14 Jul 2026 06:00:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008843; cv=none; b=sd0y6jiaGXgZfntU3q4iNmJNv/7/8ZKsZbElq73QYpUIOFR4jOnRvizE8VWLEz6Pnw/t/GAG935o+lPskMA5W/5LNRrGiJj4nfrFxkOG8y//X/7Zvb6okScDXVPq+7kvLVPHKiv713qom8QgG/6zFGTFlLTtPlGiMrgKPqU651k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008843; c=relaxed/simple;
	bh=e9aB/ZlI8Xq3mr4SQWImKJEjarwJPEQonTmB960QU20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejZUHG0l63FNzD6Jn7NfvQdt4XCGDxACMcM+B1xP2OxbCZQ+qbjN4C8hJFE8kLl5sX8iC0G5lfm/8mHMoHxz2LAGg2EUuPgOWgFR4WOr5kIODyTdvTGCXiZMAO7XPOkeUMXPn+z+LHpYLthXBHz1XFp+SatDoILE+e7c/o2/mDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XE2SuPem; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38W7b3417725;
	Tue, 14 Jul 2026 06:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQWV7H6CCnk+v7nl1ytJxq5lv/VVguuPNW7UADfxAe4=; b=XE2SuPemEwc8mg1g
	g4Kg0E/rNvDFx4HlqCZov4Jc1qH7OF7DP5PtHOgykHamF/fCbvbj8fc1F9KjnV1j
	aqT5jh+/FaEPCxypaXxcFE3CHWjfltknZINofhC6pIY/G0DgJvp5/WC9IH+2LWNE
	78DOBJzvqcgz8YSRc7lMmaozpKbQ3MJBjNJ3d3IGWt5BQfPCmYGwGaVXqQwn0+r9
	FBAbD/KcxVr2MEOo6wGF4D+u+7CSU6NOAcusqoaRMTyCfwhE5+CEf3hKrjzcGMmR
	vRqVIJSxAZGMyen8nMgYOdedoL1kN3YxZFeETqWtyrvCaO4cUuZvOWItuhDTprdD
	u0TKTQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j27su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:00:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66E60XsJ005688;
	Tue, 14 Jul 2026 06:00:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewjjhaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:00:33 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66E60X3q005668;
	Tue, 14 Jul 2026 06:00:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-dmantre-hyd.qualcomm.com [10.213.100.203])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66E60XcA005657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:00:33 +0000 (GMT)
Received: from hu-dmantre-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 8DF8D645;
	Tue, 14 Jul 2026 11:30:32 +0530 (+0530)
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:30:17 +0530
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Add QMI TMD cooling support
 for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-shikra-cdsp-v1-1-8402e060809e@oss.qualcomm.com>
References: <20260714-shikra-cdsp-v1-0-8402e060809e@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-cdsp-v1-0-8402e060809e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784008832; l=816;
 i=dipa.mantre@oss.qualcomm.com; s=20260415; h=from:subject:message-id;
 bh=e9aB/ZlI8Xq3mr4SQWImKJEjarwJPEQonTmB960QU20=;
 b=4PaMg566J5cO+wRZ5Gkm9ElOfsAR3dXLpu5n1LLzjTFTB05quLj7vNKEgy7FvdkdPu6oJu8kl
 SlTNymR6QrPAnDxZKZuxHDqpVkudhT9orO49FZD8di/00tIOpOrbdQt
X-Developer-Key: i=dipa.mantre@oss.qualcomm.com; a=ed25519;
 pk=IcrgHu2jFHNILPVydQwFqCQq05WcA8wBixw5s+yRMVI=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfX2SslyV0yQAFg
 QduiNLFSNhzXwGaYnLsIGpb2JpYc/qMH8029GY7wgbQJNL3TitTLxZThRwuAeHRx65sjR7i4B2I
 FmRgTxiEyJlu5a5Pg31EmG+hM6jxZI8=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a55d085 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=sLZXOU717EzAtz-VrkYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: DcGHsjHJ29ALWFSfOOUYzRBfFs4j6ipC
X-Proofpoint-ORIG-GUID: DcGHsjHJ29ALWFSfOOUYzRBfFs4j6ipC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfX87X/EQuw7++N
 EZJsbpbam4RV1exRTBHhjyAuOBn+usEsRqdgA7lObUoal/gsGXb2dWtGonMvY5iamp3JVBBcC3z
 WXzxUT0BrJpDahvYVPDVT9TzlYzgz1Ru+PaTyF5bnLpwoPxINlVxhRkR1JmXBzakyMRwhhGO+1z
 hmm3vc2B1v4wW77p9OF7WQvUyjRpcygGEyVZH/1AFLkVbth8f+HOLnLVCoYwmSxiItpB+lXLTkY
 49eJXSTdqOWFPLsCah0+XZO7IEVGhqTml6GVhZGmR329hQp4CIcryIj4JUcDgx3h4u8Do+Ojmky
 UdE3oYqAi+lx5D/n+wFzKHnZwOYa+xy1PH0J3khVObD5kWfGLpCVRpdXMwUFKKOyq92Jxhrqdm2
 YkAgJ160y8qmlP7U3gslzKBUkhyRQz5OID8JfcYjJi4m+Uk2vBA9duVlqZSogK+i17HJLMISJFh
 oQV06YH2edQFPNUdAZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118946-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: BD57F7514C9

Add QMI TMD instance IDs and cooling device name arrays for CDSP
on Shikra to enable thermal mitigation support.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 60a4337d9e51..aa2add77b832 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1537,6 +1537,9 @@ static const struct qcom_pas_data shikra_cdsp_resource = {
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
 	.smem_host_id = 5,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data shikra_lpaicp_resource = {

-- 
2.34.1


