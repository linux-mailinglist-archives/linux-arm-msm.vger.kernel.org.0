Return-Path: <linux-arm-msm+bounces-116667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VPDKCkpkS2qWQgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:16:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C42670DFF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:16:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UMnyBI+f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OgAc+Uxk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116667-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116667-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C75603078D8E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17213D8131;
	Mon,  6 Jul 2026 07:11:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67EB3E44F0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:11:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321890; cv=none; b=EYKsWM5hRSG3Og+klvwCjAL3t3QvAHiYqzt6AYxbO4CQEoRpWedtcX11a7sx7CmTFFZn9f3dpIXSyIz+Xsr5bb+/7Rk91D/FXVWzzMCSyZ3L0MrutYg3CgD2T5DDmuUjiFo51i9tCF3lOdHvlQa6o20UuyX+SBWeXgLPSETGlVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321890; c=relaxed/simple;
	bh=KKXZeb1RE0r005VvQQ7JENvpHu510rqjXgwKJAo5iQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nj2InNuweI6mZKLDJF8vlu+zQrXNnGNCWCrLBANFW1uIvOQ7nKSPj+bir6XbVlW2gVSpjID/8ypp0Tf24hsnyGxJPwPSDMJPa3UCFplv2R7mqVDbm08kovWhOdNfGUQWfULFOKtvJYTqSLRveJJTNeTFM4NjN21JLjgOwKfKimw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMnyBI+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OgAc+Uxk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66678Kfp3976564
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KjE3aY0Hltr
	ecpTkRxum+Wgatm3vTg9XNPg/fbiZ22s=; b=UMnyBI+fLa7buZofz48salBJNU2
	JqbWnckE4T1F7ExiGYmWiIwpTAp/Pb8YMZFscaxNenoQIcZ3tRT+OTA5Yl+K2YQW
	6NUUEkGJ6yYlLS8Nq86P4qxeQLoxFABvXZE2yqXcdOGaftxrCu05axg81W/VU2vF
	U2IkbXiDnpROHMTuHVjKhFA3dYERcYXT4a5vhR5jzMXOb2VUK6P8dStr45xo7Ixh
	LjKUASyWcPAKQKgv1C2okskM+91Y6BwkAcaHwz9EP7PXEmeKXWk3Bw9kIYoczlj0
	aeKX91pmbQ4sROA+m+xtFtf01fKrkGbaTM9ySViOqA5pbAwqwWOO0Q7mHzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7g0a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:11:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e7ee64b25so463561685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321881; x=1783926681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjE3aY0HltrecpTkRxum+Wgatm3vTg9XNPg/fbiZ22s=;
        b=OgAc+UxkmaoobJ10e5CWqEALgyUwmr5TUOC40BI5+owf3lw59C2+dWx/EtCjvfbdXS
         SZZwG3qI+DM9Yc4Yu0Rziwcew7wwdRyGVafUB1cCusoUnBvEIgX1MctlE3gRnM2wm2CZ
         yz50xb6JGFGXr9q7klf/juk3qv2GY8ITQ/qNQMCLFNDiaagqhaoRRlM7aYtQtwvhThPQ
         eok3fpsKzrxtDL5gGc0nA+TJZE0hAQlJLPRofL5uNfjpqmVj48iLzlfxa5CqjMqmS7u0
         Gc+yuOFXxI7YR69s5V9DS3xPWqB7VgtvMbpBlAByb59mCvVRZ14AP8wBGSbQwp0ewLgk
         p/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321881; x=1783926681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjE3aY0HltrecpTkRxum+Wgatm3vTg9XNPg/fbiZ22s=;
        b=dULeYfy01v6W3WyfyIX1r9vUjdmbMMR2MbY4UCroUwUx0rq7Dp7JkcpKeTfjPoz52j
         KJjph/u/SNZjE2N69oDj0De9ySDmdvzwMlyDGkP268MoNBUcr2e3fgpPLMw4WWxplBpp
         e/bngQStJnV22shCUJxuZYVn++ko0OOHlw1/apw0GmBAfLDQ+uGTCXqgZ+U8EhP5wyX/
         kzV2CEWe9W4zhNsGeQFvfaPrqRPmoMKAr0tFXs/K0fbhLsjjX/TqMU9r9g5cIhjrFpKL
         XTXRQFatHoof77BhF4cWTTiSZp1YNZFTk85gHHKqgp7bPlarjovw5rkI8/O4jQc3P8Yj
         MkFA==
X-Forwarded-Encrypted: i=1; AHgh+RpTkxKfBm1PcUeVbuFxrVRNVBayfC9y4RpTRtbyB4Ve1rA95tUYJ8jt5qw60q9BkgP/Xc55oyX2Kgu9u3do@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1R4OXfVUdhhwk+5LFid9gBy5wW3EmP18SLXpodOLUZ3cl9XdU
	vZ1hVxx/yWq6NmgjtlAUibd9otSO+CrHyykBIZUt2fghUcMHZz40WCq4oZf9NRd5L8z3a/aD1TM
	UTS2c9+QuPwlWt1mo/PhvE2ioqliRScUKXz2U2/wHiTXrjq07UB+jJfQj0WZ5+uhk9Jq/
X-Gm-Gg: AfdE7ckrLfI2edAS87KxBfSvlcae1mJk0YUnq9eX+i5jSBS9+SWOPLo7b0fj2rBbKvW
	3Wp9qoD6835r0f7aClVW+mNMcLvTpFtxCFpiJBweHVgwIbM08EjF9Cyv8P7mSV6RK7apsj3VrAL
	q70jGgFtb1cUNml/IVgKqoFsuvfBAf7n1Kt4BaBxgx7ehSN1NbocwnDKWil05X5LknbqMPEz/DL
	GeTfyD0BpDDLsY6lWWFIRrYrJz6D7jl2VwvcWih4mC1/qsy1SYGBEba6qMSJQ+QpIr+Z3K4WqmF
	mAs+ioxzxeOYOPjunVfNKS7txPM01X2OKQDRp4jgkhFid0jdtoAhgvfi8SiXGlPykhM8LtaYKof
	GimomNZzJvD1FWtW3E8AQLzuxisL4dGsmBUk=
X-Received: by 2002:a05:620a:4624:b0:92e:68be:1c5 with SMTP id af79cd13be357-92e9a34e907mr1295276985a.21.1783321880854;
        Mon, 06 Jul 2026 00:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4624:b0:92e:68be:1c5 with SMTP id af79cd13be357-92e9a34e907mr1295274885a.21.1783321880427;
        Mon, 06 Jul 2026 00:11:20 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:19 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 2/5] dt-bindings: media: qcom,sm8250-camss: allow JPEG encoder child node
Date: Mon,  6 Jul 2026 10:11:10 +0300
Message-Id: <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX4dJWbAi88SBv
 wI6QniCaZ97Qj+8AVlZTso4ncvuRNCawiqHuhroZJYSBjSzdw4p9JQkhy2QTa2N6YyhjCSo1qch
 qYcnk85kEE1/hxq7Rj6p+GCAmZE5yQj5RViqoqlBtlofCstU+xDpyW98nIUkImp+L57Nw6eo/kO
 yKxB/y5yjZWN64pRKqz0Bgb78oEzcetJN094ZqqP3ANcZR7rfMeoVkoMYEWUgwOURBWZ+oFJzPH
 Pg4LbyRJB0XMD8ArYqElQjLAv7Uu8n8XEtvFXVhZrHODQfjDp0GiTzL1KP9eu9skDkD5+IzHGQQ
 7croe4aJ0JDtXYGniDqCdPzkW6iE81WA19nGfsDht7AG0R4zV+9E/yYYnZbZyzAR90qoUBaQ891
 HNqoQEq7OzOxgde09sNlNIiNOkn/iXl6NbWGej9/kQeHGxOqPr54K6vLxF5jeh2cmDYKXARhBR8
 obkRCxKEfr1fYFlfBJg==
X-Proofpoint-ORIG-GUID: M0Jiyk61ZL9OtOxiy_Nbfmy_sNQAdlRh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfXwM6t51Vr0LPt
 C/w02/nE4Fx1jUHeCZ4uCrB9OAwrMYpPY1C8Z2TvEAjOAQ7OyWqOBL3a5S7J8Ag1l5NG8KVU/6M
 CzABo4t2enoFQbvYuNx7F4866R6FP64=
X-Proofpoint-GUID: M0Jiyk61ZL9OtOxiy_Nbfmy_sNQAdlRh
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b5519 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=60vvH-AHyAWEQOE588EA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116667-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C42670DFF7

The CAMSS node uses #address-cells = <2>, #size-cells = <2> and ranges
to act as a bus for child IP blocks such as the JPEG encoder. Add these
properties to the binding so that dtbs_check does not reject them.

Use unevaluatedProperties: false instead of additionalProperties: false
so that child nodes are validated against their own schema (matched by
compatible) without requiring the parent binding to enumerate each child
type explicitly. This is the correct approach for a bus-like container
node and avoids updating the camss binding for every new child device
added in the future.

No functional change.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-camss.yaml   | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index a509d4bbcb4a..6008938ee369 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -102,6 +102,14 @@ properties:
       - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
       - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
 
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -317,7 +325,7 @@ required:
   - vdda-phy-supply
   - vdda-pll-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


