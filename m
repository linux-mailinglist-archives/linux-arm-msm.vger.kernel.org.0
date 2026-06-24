Return-Path: <linux-arm-msm+bounces-114387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rnoCJkkrPGprkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:08:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5C06C0E0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:08:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jv4FSojX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B2pudJYs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114387-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114387-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBABC302E7FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6962201113;
	Wed, 24 Jun 2026 19:08:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98533BBD9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328127; cv=none; b=WWGdguFZJtM/SME2aK8GSR3y1Qwg+nBObVTDZyqphPyQBdMEGILdidXZXvpj2/oc/9ZLVk1Na8QB+AURWdhAlaejWvnnU0EOuHnlxx3mQPBzX5aMmDmnz3p5W9a2SXfZrk/i+lpHrTjwUN0lUROvDLVt9zqTrLcVgPs/uQjnL4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328127; c=relaxed/simple;
	bh=uDyDiM58JjijY2HKPnD+fbcwUCQLH2/YD09zBcqaO38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1G5aVstV+dzA+uJl9qmmawd5Q8LVVi/jbwW3EG0626VTMTXCwVdOtdJNc7aS4qw5T+ndylHrBUyLBjF2OaB+RqwbezXWXe17+j9idilXzkGHk6KL09Iv6bm51xqLE4dhk+jWq4k9evrKNYDxdrsJPIOrupeCg4XvMiaNn0Am1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jv4FSojX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2pudJYs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHixGh4032722
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JRvoDrIlXka
	8ORynuHZb0j5k1Yv44H6hdSFgcEbeu/I=; b=jv4FSojXY5Tg5dRVKyF/YX/JGin
	2KoHxt7YnwXChaXjroCTJxKUwvBPUEz8yodfup/yiJXns/EsWLqD+SsUgDLzjp9u
	/NGl5axTrAbG3M9lpjRaHcUHm82F0U26+sq6T8WroC4zZ/DsprwbICPgX3x/oJNJ
	9gkP9eIWnI1ZPRfd+sDZd3cscoergQccnSww0pirHW3TP1thRunfkdhYyOb6S91D
	Oc5jPXJIBDi2TqaCpAql9sKT7K3NEZ5wHMSfApBR0gPD9sesXfEKIJUfPDKOYpZA
	wROLfOHUmMRPbLk4DklUXsxE5YHWB7o9mw+ENAl2R2NTbqzCYmQ+ks5LOvg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar3ujh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845438fbd9cso1382286b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328123; x=1782932923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRvoDrIlXka8ORynuHZb0j5k1Yv44H6hdSFgcEbeu/I=;
        b=B2pudJYsZ+8uMBTOqui8yLdBXeKl5HpYEsHjLZ+wu9jHAtOBzHyqXkCPorMWsm1YVS
         rKKH/xRR9mxUjx9SDb4ZRTfIT0jkA5rElVCvf1gegkHZ5Q+NyphEqb3A7abIqyPgvA3E
         chTjRnsa6fVvm901MDrIhmc7+7SPA8zyq+YLGCrQJDMWWRaJvvJXtkwvGKOdYoiyxUmC
         q+SeUvLNZBSIAaTHGbopbV98K7EAJf9ZuInzCn36OgSlgLovfCW9B7187dJ4OTOZ6RBb
         HNMp8m2qUOa/MNMp+0bs7kn7SezXWUvfSSp1CbVM2NNgzHVuhBxZoZTk+iti7qoBmgZ7
         cOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328123; x=1782932923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JRvoDrIlXka8ORynuHZb0j5k1Yv44H6hdSFgcEbeu/I=;
        b=Mg1u7Nrhi/bIVLY7tx8zsD00DLxKc1qwUxdBoN2jJglr3mRtSEKF7FjCa050ZD2ZQm
         q1srARRpC8H29nvK/KyPB2oCMq4/ns+BzchJui75MaEsLW7HTHEDwrItRktpuUeUeGMN
         /e53/YyafSTRNBrKc7pqqTIDGlZFlG4qKYNZgPg2KZIpQTbQqnbuocDj9Com6YHckJ30
         DdQc9An/ix9yG0mcrdQ0ilEKvGMdJQ/jnS6zMeQgz1Ts4+bgUpwNsjODV28DNCF5E1jj
         jCDJ2lvA6crr/TymMWrK7a/oH0haS7zwSqCnNSBdGdzM9B9SciYB5UGfo5fPNaunA40m
         uKag==
X-Forwarded-Encrypted: i=1; AFNElJ+8EPk/nPtlAXydLIUf7VeMpltUrx/2r3Z8bxQtJbp5Elqievad0HlFJzhO4547PMgYr9IAU4gIUTu5ax5k@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3uzYLt+C/bzbILnlcvx+THN8kFzqw6DWt0e8Lko4NJXrMJPPc
	xbejHK2rinGsY7UONu2JdHlpKAJv7OVidXsMajeroPcsqTawzY8fQ8WYR1V30cjjLTN2V9czN+A
	FOev94knpN08OdHiCIlcuXjmEjt/ZgH3M8nc6M6PEE36Us1jC7/wdUAQkKhhHdpzQzVdC
X-Gm-Gg: AfdE7cnuHUSrQSABIgTYQzkIjJKcuoR8mvnVb9peoup10Y0EKB1A/4vvtImR4VXyJHm
	FmC8cHeCHRT3klgHtnUb94WDhdefjj55J36tl2zdvIjJ1OKfX9Ws/82FCB339ZxMioMyMp22N7K
	WAwmfOgqlZEVg146hSsQYSriIXd5YSmOQKKAESDsb4QBjIwZn4Sxf6enCcJ0XKpkKt9GGvrNnDr
	vtbeEV+yblq1Ng2pnLkR8W8jX+ju58yVUhjxgUfVvqdnIOqMniWdbbBv/KkZd9LaibkBaIf5GIR
	QkLbiTI2gqP/98wL+443TTNLAHoKLi7ELTlmUoaVp69dz1uyImlF5p8D9nYzrcO3eOWwKeJQ5I3
	7CuWNGDC3B2VlyocBTpOf+j0vlHuTx5oUdLWyyg==
X-Received: by 2002:a05:6a00:4210:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845a2c7d835mr4824700b3a.34.1782328123331;
        Wed, 24 Jun 2026 12:08:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:4210:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845a2c7d835mr4824660b3a.34.1782328122793;
        Wed, 24 Jun 2026 12:08:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 01/19] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
Date: Thu, 25 Jun 2026 00:38:12 +0530
Message-ID: <20260624190830.3131112-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oyK85NecTGbTkvIXF5Rrr8hoQgvGplgm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX7I77+Vxtgln2
 aHdG9AnZD4t9GPGWzzfV08pYkDYa/3t8Xy7v2PKS+yYBHAODYMrqujSEsX2PQW3N3AYoKyQVhE5
 9CJKrF6JQJD0vT4LkvJBhyC/YZUeXAY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX3pu1xN0q5Dit
 dqRo8h43Dv7ss4HsMKBEzvJnqXDNWBIKTh+NecpJpDyilavLycbT/SbJXxCTxZZ3DlLkXS4c77W
 7ojESGv1AiAvAOLd4fG0rPv2qQ4TUsLvTCMAI6/A1d/5M0y65OPzX1Hj+9quVZQ09YwJwoKWvK5
 MB1WDRZzPXqfb7Mv0cnJxbDz2XCR9ayYzPGID+RxkXAzXlecoVhnWZWvcTs3hT8dNgZFiwwPii5
 laB9vZdXyz9rrrN4n2XzMfpAYxSrPRGzu8W9BP+QipIsOtZ6KLVXu4J23/hFUbSgjANLfEi6IqV
 rlY3qAGoVFeJIXmLku8ukBHLOawvsgtCZiH/mzpLjlhn+s/5UQL0l6hQqZGr0NCw17rUU2pndKd
 dcjtJsKomxXuRHB7yy4oE31kdnsxBA==
X-Proofpoint-GUID: oyK85NecTGbTkvIXF5Rrr8hoQgvGplgm
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3c2b3c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QTM5EVxPqlECRIyyHGYA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114387-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E5C06C0E0C

On Qualcomm SoCs that support minidump, a word in always-on SRAM
is shared between the Operating System(HLOS) and boot firmware.
OS is expected to select the minidump download destination
either USB upload to a host PC or save to on-device storage.
Boot firmware will reads this word before DDR is initialized
on the warm reset following a crash to decide where to deliver
the minidump.

Add a 'sram' property to the SCM binding to allow the OS to
identify this SRAM region via a phandle.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacbc91..2d68b4065341 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -129,6 +129,13 @@ properties:
           - description: offset of the download mode control register
     description: TCSR hardware block
 
+  sram:
+    description:
+      Phandle to a region in always-on SRAM used to store the download
+      mode value for boot firmware to read before DDR is initialised on
+      the next warm reset.
+    maxItems: 1
+
 allOf:
   # Clocks
   - if:
-- 
2.53.0


