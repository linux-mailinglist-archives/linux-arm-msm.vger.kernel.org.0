Return-Path: <linux-arm-msm+bounces-115671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P+S3AKfzRGqo3woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:01:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 842346EC7EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:01:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n8Ufmywx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115671-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115671-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D143304F17F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC4644D02B;
	Wed,  1 Jul 2026 10:58:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A740644BCB1;
	Wed,  1 Jul 2026 10:58:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903507; cv=none; b=Q41wKG4AvWgFsY63bb2zqUmnpOn5MgqmNl5oxwxQ0ctnYKFCBmu9LxKfpKP7DPvbfeJJ8pa0Jg3f86HE1Yxn2Vsqxjst9z4AuCzUN6eEnuyWmXmdDoPyPe1h5GB0dwtIjrcKPLQ9G0LLpi5NLQCle/I9uHviB4TIBOaI0i3BDMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903507; c=relaxed/simple;
	bh=8isK/wX6cEjw60htLkUFSb45rDr1K/PpF3SuqOkP3fY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nqbOzhHxGC1/PFbACHUdP90TxYw/TCWeuy/cHGBFkCM/zPa2+XaiO0CT3K4AM2vu3u9h2OnfFyVSmzQbc9tZhFqIfh2Cjxg2SiO3yIw9OGQClbBk24cavSg7h+gqLQSY34lr7qS1qgfAY3BQ9pvoMQn5QqWIfrYAh/j3BWdxth0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8Ufmywx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGJEX793847;
	Wed, 1 Jul 2026 10:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JcMXX5JmIXo
	Rh534qQlBYuxwBr8D2+SJ4dkI5oK6uKo=; b=n8Ufmywxz4D8eYk8ir+Bhmo87pp
	s9Zt+grbdSii+aDgGbyAEZVcHwQNWKHBOjlkY+nEyto42mFfPE76iz72Wm/Zh2qV
	1o9JZjXbYxqVDOh/UwZH1FT5eiQPc2oDaw2oWfYNh6N+tiEmd/GXkMfdIx/jSxNL
	ue9iz6t4EFagv+5ucUbPUpMMixS41FfDTjJRpR6TkwWcP5t4OdxlRDbsCadeYA+/
	43petB6Z+wcQvb4FC/f13tIu9FQN7wLz6Sv+kYD0dXQNofVuHzF15pArYTPpclwE
	764KjHtuPwvFd0OhJOTs64CtewuPeDyIFcJeYW8/Pmhxnqb9d8j9cy0QIPQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ag615-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 10:58:24 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 661Aw2JF011886;
	Wed, 1 Jul 2026 10:58:20 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] MAINTAINERS: Add Qualcomm QAIF driver entry
Date: Wed,  1 Jul 2026 16:27:57 +0530
Message-Id: <20260701105757.2779738-12-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-GUID: J5khxe35qyrzaHVXfPNwum6ll11l8P7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXy0uroBjbbAjO
 DRZy5i/vHF0+1YxhRyWYI1ljVtsb20vaPJcRhTOdsXVA1jt9P1ygFO9+YhVyYK5uI827Bxb2hfh
 zs7AtzGOot4AsC+2Vz2w2/1N+VprUE0Um+YTDjEnMUoamAACxUyF7a2n3MID5wvIP9AnqKwDAI8
 8zeABZtoz6AfmlZloMLU81/hZHpMm+leCS5YeoCIyuPTAE719aT30BzEj8xHWcX1qScaCv6w/Qv
 VM6TM8fAPywD5OhD/ROfz87KnqHaWnaaQMiRhY4/FowJb4GtzJGZuttaP8WrvzMaSvva9XerE8K
 +nXpttePsoWZuapSDCTOSgPj5z4Ksgmk3Cliv/ZW1g9cS3eG7OoNz7SSzT7vaF4aXLC4snayZcl
 9DAKUPgL3sG9Dm5GylUA9oagv1TH+FJDUdlEJOhAuD4Z6K3rmatKXb1gZOXmIFJ6YDK/QywNAsD
 r/8x6PhqfYVo5MAvdhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX5epVU5tcr6yT
 MROuxYsBeS3GwsdjgOcJ8dL4Ybqax7qmHFCAYyMEWJ2uIBm/ZLfmEElCFHEEQrcHhrDCCEJf7Nc
 qP0CsBFKJHTSWbrRlebNMAjd51sPjis=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a44f2d0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=5TfRDjBtmgYofzZU2EMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J5khxe35qyrzaHVXfPNwum6ll11l8P7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115671-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 842346EC7EA

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
+F:	Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
+F:	include/dt-bindings/sound/qcom,qaif.h
+F:	sound/soc/qcom/qaif*
+
 QCOM EMBEDDED USB DEBUGGER (EUD)
 M:	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.34.1


