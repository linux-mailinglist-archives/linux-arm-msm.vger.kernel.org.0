Return-Path: <linux-arm-msm+bounces-118847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JdoTGN0pVWrxkgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:09:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F9274E54F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:09:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JIkXVhKz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118847-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118847-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8264F301D941
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F248E3537CD;
	Mon, 13 Jul 2026 18:09:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17316344D9D;
	Mon, 13 Jul 2026 18:09:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783966166; cv=none; b=FqVxiyGK3Sg7gjKNi7h8sAvkZK5hZlSqbqI0gcI4N1T4K4mR1em25Inlv/fDd5KJYoU0ymHqU9PZM08oT8/CTWEA8GHkUvFzFHjAozJucuBfB+PIkstoLTaUSLVOWocEL6m/YBFHUzZoSfEkK7UsGcg//CZyMZ9KNVukSTIzP3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783966166; c=relaxed/simple;
	bh=6WweQGhUWhGKMcXxQTJf2DfYkxMP4imE5jIop3ay/0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G5687e9+R3brpxg5W6Ms0nkECNQXmKg3/LwoHubtfkgldvDGon8vv7mh1zybnMV4fBZY3vGRLsO28nAUFPph+GM393R9xOwjgwOowENKKuVVJTh5wZg/6dWmrkTLTJPbB6PXklZlDQ5A6ViHEiy1EJtJIe20R3F+v+Bjt0Aznw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIkXVhKz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DH6NUp2191573;
	Mon, 13 Jul 2026 18:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sptPSOgMPIH
	H/wGcMHcQCSoTru2yRrB6UPfGLL6YUmM=; b=JIkXVhKzndfp3NWRti144tqHC8M
	H23ymU1kSWz/Vs6FAD3ss5UOtlm0e29C8sMIFCQI+9cLZ9nUBuc+SWuUYwQUH+kV
	tKfWH2iIFxU9CEe8J+D9rO5Y6K+mj6yNH1sQsNCnPwgRlhbIx4Wk4WeONLmd1rzW
	mUq2NiH4OCiifc12VaDOvz2uewmI7FukJh763YXqqnfGOuMmc+KNJlQXm40yxiz5
	wgk+cP2H94qF05al6a4RsaCd8wTIGlDhss8I3EKOzDuvAvOVn2DPDqqtgH2rRDjj
	2UrVjY9ViutdvhAMjFQPoNisfwuY+LGVMGCVCjctP+Q/vukInYzoKfUU3Zg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jr7wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:09:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DI9AMf007198;
	Mon, 13 Jul 2026 18:09:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fbewj8p3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:09:10 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66DI9A3i007183;
	Mon, 13 Jul 2026 18:09:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66DI9Adm007181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:09:10 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 7566661D; Mon, 13 Jul 2026 23:39:09 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add Hawi sound card
Date: Mon, 13 Jul 2026 23:39:06 +0530
Message-Id: <20260713180907.874954-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: qLaY963TakP-XwjYtjY-Dm3c0ab4Asiz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4NyBTYWx0ZWRfX0RzD61lFvj5t
 UUqTFqzqIfZdHcIy7sM8zEZfBMDfeK4lzgTkGBAiPJEqB6X6GgN6QVmhieahF/32ov2JpKWzn1x
 vjXr2GDv8q8CRFezc9q7gVuJBGJ2b3jZpAi7xZOYquGwcTdIlythowLAoev/eWl0yl9dLEgkKES
 2EPUUY4vnPqWf7ueO91jxaNVDE6ieaq1IgTsr2QQYq+Lr7aZcr7bL3ymZNuh5pEUUNfi66DknnT
 UNavqtUNN5Nh/G8iASPy48nlMRyQ8PuglVhI+78Ln5+EAOELAm++SHFQ5YvMc6yyQHbjACL6ve0
 3Wn4Hix6auyV5Q/qLWJqJQm6ocQq505T7Om8gh5qo0OuTdhHcjdWE2nA90sNApi/PpKJlw6WCcq
 Jawq+fkW7tF63bGAle+kTG4iOiWqX0VbpO5PtHEzoQ30cidluPViRc5mXdVMezq4svXcFeS4FP9
 tJN9tZtW6bUXvFnyYlQ==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a5529ca cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=-aGvUFeC1W0Hxpz-LhEA:9
 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: qLaY963TakP-XwjYtjY-Dm3c0ab4Asiz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4NyBTYWx0ZWRfX0O9OWt/HP76u
 19O2PBgyE3914hoCMNVPCWJaDtLZzWxQUIW7R/PU3mGseXg5frMf/Qfq7EN0lqz5UcajMOAN1yw
 VOhr7355erKWxMkg7aDGOV5Fifzb/M8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130187
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118847-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0F9274E54F

Add bindings for Hawi sound card, which is compatible with
the existing SM8450.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 28cf9289a..817ef5bf7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-sndcard
+              - qcom,hawi-sndcard
               - qcom,kaanapali-sndcard
               - qcom,sm8550-sndcard
               - qcom,sm8650-sndcard
-- 
2.34.1


