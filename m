Return-Path: <linux-arm-msm+bounces-117765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PrRRMp10Tmp+NAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:02:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF13B72866A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:02:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hIE6YVKF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dMfqh9B4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117765-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117765-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA269310F990
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBEA409268;
	Wed,  8 Jul 2026 15:49:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D8B41CB5F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:49:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525791; cv=none; b=I2LvZ/1/2YWkt2Nkw5gMwbBMULcOlDmPwau+bRFXRzbdGfQnMliBBKRXBCe4GXr2r5PsYMhSajIc554xwxH2fX164sKIlKJjoLLAO4ElJIyLepEuuQlZH31TQBdRhiPLQQvB6JX1U4x8mRdTDHMx3F1S19lAQMIuLmJTMt4qYDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525791; c=relaxed/simple;
	bh=B0qAMxMUxakLtjM29Uge2pBkNuWyrdgF54ZAFwO2Vxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJobiOsu9/kEagUJsdwYIo1MZxwoYYTZ+0WR6qTLJ3c55dmVKqRUyIaTyi1a89OCu/UzKQoAORuKnS6QqxYvakhnT9mZ6lyqoZuZrRnL4+XM1um7YZ7RoNrA6xEMBhIUQ7Nc0PltwNCKHqGEgtJuUCPuLashnnbFlw/7KONqFvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIE6YVKF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMfqh9B4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Lbe2579475
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+knUZlT7aRA5hJsd/Z6sxKnytUyL9DpWzdJmSwOvbV8=; b=hIE6YVKFRIjrWhg+
	eVfDGwinmvp1U0CgWglKin7iM36Al3xqFkjEqyI66wAXEasxFyAOdi0Qk958oAdS
	31UqiLo9BDv5f03ZYn/uhzskZ/fz4DMaPYc51FegtHWpO2YFkAI+XgpwEvcdOGqj
	qeTvOCyNkD4izJNeXF4LRkHY0S4Ef2bUQbpdF+GeDJgxHTNb8cm909ToTP/feV0z
	N6A2Cpgs/LcPeRP0zXJJXFwcEbptxumYVw3NZBrP5cxBw/NN5eVLraTgPqhS+Ga+
	L+2HMEux4PKL1V7Btn0+AUJhq/vTwbCw9TjGggIT/I4+DXVO3jtHyR8lGBUkMQEM
	UnGXKA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gbkax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:49:49 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4489d5b6876so966193fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525788; x=1784130588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+knUZlT7aRA5hJsd/Z6sxKnytUyL9DpWzdJmSwOvbV8=;
        b=dMfqh9B45K/vKc7lMSYHgUQOHxNJy4tfmucJsXXyI694kjcmKaiiwg/98QDu+oviGe
         aMwVosMchBL5DgvlZn/x7i2bDdVdFjc/kDBddmU3lcJxI/HA49q3+vJVsCKeKBg6bTCx
         ipd81N1/H5MwQR2gS4Mocnb6TTFK3/sp17SJ4iU6AZUi9lFqcOu/A2Q/JCblWutSFFmZ
         C+pY/v/M2JUwoBhe0hjYT8oK/qvCC1wc8gt/Dpyr1hgPwLqsoRRneHklKdrbnHOkLrIA
         1r4OeU7Kd3uQiAr8GqAMxkFsLPmcJSfySz+LpyWr7pAGjggds2iA5OLNMoC5m9tqeJsc
         l7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525788; x=1784130588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+knUZlT7aRA5hJsd/Z6sxKnytUyL9DpWzdJmSwOvbV8=;
        b=WW9GIzqVBJVe46WhAXXdhR1Q6KAhtSUUluTgihq3whsGGiMGqE/0qZZkqjeP5N+mQj
         JlpQeQcUp005vLO/J6WgXjyt/nUM+v/N+oTAwH9LgnmH09yREgyWhMn1js0JWQZqYG/N
         H6ogKAnGLhMDzaxw9koV3jOoiRHisudoZxcIvjJUMbKJxOuMUZK/pOtGt5e+F01iSaVH
         m2DJNhlRoFs53sZ6DR289UU5bBAZ2SvkJhDda3GzO21pd9l09jRKga10EP3anCgsafZT
         jU4Dbtqfcqdhih0oCUxSii1yAERqPJKKp+0W1msnfg10Qj+ESTfURwxxgr5OJdJll316
         LQCw==
X-Gm-Message-State: AOJu0YwppqfiMBpIiE1GZsrJ2HTx4RK7K9om3jMqk1BXqD59jjOXzCsQ
	1n6K064zZzISN3z6OttTyjDUpduIFg7MgZQhnsyD0UAg34+JMZerne1qhxui1RGfWafg62dLiBn
	zCLjHOeQPsUTKJ9E+LgYPFw8jOeeBvvvD/a29PAJhE3bAOmRrSHIY1u4Rt5MSJFyyYow7
X-Gm-Gg: AfdE7clNYqyBtZ9Gw4hQexDFGrV6J5oQdlGktwQfdsJhpYLSHXM5y66l3QNRembyOXl
	TZafpOPM6rsHgy6P38xlPIm5JJSsMStZqYmede9NN4QYbhBEPvL9lWDDuR8jfA+sPY3QONrStNb
	BVuECU+TuCRtMtxix0eepyk5YFI3gjwDm6w3KYv7NBgmMl5qFYmCEYhjLtJavDtstrOi7cHbty+
	WhSgcdZ8nGOM93wyR0ye3AbzN1XGci9PquPGosSnXiac5hvpG6jBV4EZk0nXodqHrn4cZLjWE5K
	FCtBG9AisBk4O//LH4r/XFBFQspAX8HfEVuI249XJatVboTWiD9I3HOp89WXDLd/DBzpre+nTKN
	es2NaXrVVMf460LbvK3ip6Wwyw/ZBuaFTvbewl20E
X-Received: by 2002:a05:6870:231a:b0:440:67b1:b59b with SMTP id 586e51a60fabf-45162e399c1mr1784237fac.0.1783525787937;
        Wed, 08 Jul 2026 08:49:47 -0700 (PDT)
X-Received: by 2002:a05:6870:231a:b0:440:67b1:b59b with SMTP id 586e51a60fabf-45162e399c1mr1784147fac.0.1783525784134;
        Wed, 08 Jul 2026 08:49:44 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1d1ff0sm17014022fac.7.2026.07.08.08.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:49:43 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 21:19:12 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
In-Reply-To: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783525766; l=884;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=B0qAMxMUxakLtjM29Uge2pBkNuWyrdgF54ZAFwO2Vxc=;
 b=Nn+bmF0tdQ8WrBXh2CYVLaCFL/LoFR0Lm5No9JE+PQv+N55ncp5yRqhDJeF9sLe3jKoLJ168l
 BQe3/FU6D8SB7exu5wx6oRNJ3zSc4/4aCfLwcu0G0fexPSo3MAKBO2B
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX7biGR0E4WfV0
 A/FYssVmyWTHmphvaeIRjzQrEIiiTTiGENJybBVbovIB37978sNUNxf0Hi25SICcwWa0SoVBN/8
 k9veIXs3XPI5tHaAyG9ryeh7+g3YLJk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX3bEpVlA8Nuov
 StqHd75bDQ7WEys7pgRqC4z2RnbsTDZlMg5CMc9Ph8OnbqzTUanD3Q+heQp2vgTDOW4DgJlZBY9
 n8IF7Zl7PdqlU+m0cMXo467OmARftBCSpKImTMXbuHnIFpYO59UwyjtnaUUwivRfTotdfY5dXCy
 G21nyHj1kx+QoWLFysl3lJvrAEtouJmUINoiEUkUPL8rUoncjZS0DHYF/Iyser0elGX2+qIX5ej
 Fz16la2tvlfTlgwlvcmaRxqe+sqmO0NqKhFtM04jOhRSQygZd2zWrTO6xuF8EPSxlpjcEZVf6w9
 em8EBuxEDaaRSPlkwng3NIPKt0AtMO/2Q4EhhsbrwCY2zpvdD2/vanTPkpBBOEY8JbNcivzYu5+
 dy6GDe49B3MRIeHekSvNj8T5V8kVfCkT4sEJpBCRmdut28hJO+CHIZnMZkYjMe4WkD734HL+f1j
 FnjvaLpPx2F8u7dJEmA==
X-Proofpoint-ORIG-GUID: oEeLda868twft6fJvX7oRgnf2bVxM2Z7
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e719d cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DU1Wev2QKLRUMiDuaJkA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: oEeLda868twft6fJvX7oRgnf2bVxM2Z7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117765-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF13B72866A

A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
stats like vmin and vlow.

Shikra SoC specific compatible allows reading individual subsystem level
LPM stats along with SoC level LPM stats. Change it.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..53f40283a3b70bccdc510716b39251d377be7d24 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
 		};
 
 		sram@4690000 {
-			compatible = "qcom,rpm-stats";
+			compatible = "qcom,shikra-rpm-stats";
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 

-- 
2.34.1


