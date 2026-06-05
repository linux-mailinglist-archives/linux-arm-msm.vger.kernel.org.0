Return-Path: <linux-arm-msm+bounces-111369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F9iNHWqrImpwbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:56:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D8E6478C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:56:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eByTKZ3V;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111369-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111369-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAD8D30A5585
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBB8494A08;
	Fri,  5 Jun 2026 10:37:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D27947DD4D;
	Fri,  5 Jun 2026 10:37:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655877; cv=none; b=OxmcKkdN1DRL4P2xAvQd0SDCrYsxcC6Rgbyn7tyYnZetnyu2XSW2XfJJ5hz3Q4fd7FyB0MmxoCrp5Z97KZuq3meVA3CTbWB0Gv3mmp076vAAgkAzrIo4AAudftd/HN4r/ykSUp82r/d4ZN1qz7zoIMv2+2IW7NzRYLJ4b9ZvllQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655877; c=relaxed/simple;
	bh=S+zkRagjBtegqBMgsgui4iIZplI9wRsbjfCBDj8tPzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UhFxKFDSVycOBlgbZZ2vssAE+Yg8IxmBg0PAqVkOWGUFMDlEukFUKgyHbBu5DzxIlAUkoIwOTeSYStfI5TUuYNUq/zr2tzrWmG961XJvRGjKELlUv4wukfAkJF+GODqVIRI+M5LgB/nlm0EN/ONcrQkmCSqdH/UX4zS4LCDaHsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eByTKZ3V; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655757lM3529086;
	Fri, 5 Jun 2026 10:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oL5PHBGnrYW
	std8r84qxXLacC3Z6sAdPjyiNdFMVLb4=; b=eByTKZ3VEmaNXRkR3wnoFKGJHxT
	AYLEpOmcZ3ND0esEbNmert7vE9XdlUOK2KZNu6c1+APm2s9K1YQRlvqTAxCMLMCW
	EtU1WBvgM9bb+Q0EufHCnIzfOuWtVlfRxgcTx8V984ItOmYKs52x1cDrLM7EnFWr
	r/3RhANEetVCXjsa+61lYMNH+NNWEZ8WvMiiY6l0mISVlA4qkhE6lh3gyPafLU87
	UPHosirOIBbbEHyg2P3Q+JMlSUbYhiaV2qYk6UwI2lWLtUo2/wRBL0t/V0VlkZ7K
	mEq3Agvbjp3ISa124hk3beTznrpsivi6qS3WcIifZjn8C7qYJQeMqNR5lEA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrp8tmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:37:53 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6o011714;
	Fri, 5 Jun 2026 10:37:50 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/13] MAINTAINERS: Add Qualcomm QAIF driver entry
Date: Fri,  5 Jun 2026 16:07:29 +0530
Message-Id: <20260605103739.3557573-4-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-GUID: e39XlA5FrT11Zej7XoSr7udHXQMF_0oN
X-Proofpoint-ORIG-GUID: e39XlA5FrT11Zej7XoSr7udHXQMF_0oN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfXzpEDS8QrjiaB
 yxRhQh5245Eakky+fBazfy0IQ1Kqlkns8id8E24baeC14LVtxcrxcqaiTJb/UgPIFOyXI/7+Lxg
 Hlv3vqnbJ01OqSiZLTisjQWpQJWNs3FWFb3dNnV3VWyPYzmPT/6lGsVWdrXT9hfTuZkCv3ruKP2
 /7E/10M6Z5KkX0J+Wby/UQefelpi74YZUX/VUuyTGs25Wu4XV0VOBel+EHyGuTEWv6g5SBlweOx
 pIBFC44XB7s4e+CRFXsNMC2AoiKMAqYt33ybLmiGdrMf04o2E7bEd0vOxS4ZYw9Kw3xxIjAdMoQ
 GkeAvaFs3oHV6eivL6mVd3HJtqFBCtK0YYgcsK0UmmWwWP71bAM2gHVA+fF/bytt1uESzYOdApK
 BL4ZMLkpgTquXWUg8E/aTTUgmD5PxEGYhuJGi7tHu/hRkSG1kX2ByZuoeHsCw23oUJA6T3SupvC
 wJ7yTxCk7nYXZhGVuBA==
X-Authority-Analysis: v=2.4 cv=bJEm5v+Z c=1 sm=1 tr=0 ts=6a22a702 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=5TfRDjBtmgYofzZU2EMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111369-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1D8E6478C6

Add MAINTAINERS coverage for the Qualcomm Audio Interface (QAIF) driver
so changes to its devicetree binding, CPU DAI driver, and PCM platform
driver are routed to the Qualcomm ASoC maintainers and lists.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f877e5aaf2c7..b38f03680ef3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21707,6 +21707,16 @@ F:	sound/soc/codecs/wcd93*.*
 F:	sound/soc/codecs/wsa88*.*
 F:	sound/soc/qcom/
 
+QCOM AUDIO INTERFACE (QAIF) DRIVER
+M:	Harendra Gautam <harendra.gautam@oss.qualcomm.com>
+M:	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+L:	linux-sound@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/sound/qcom,qaif.yaml
+F:	include/dt-bindings/sound/qcom,qaif.h
+F:	sound/soc/qcom/qaif*
+
 QCOM EMBEDDED USB DEBUGGER (EUD)
 M:	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
--
2.34.1

