Return-Path: <linux-arm-msm+bounces-117157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gsdeM2+kTGocngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:02:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3608D7183C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:02:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FCnqNWa+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U4veI2su;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117157-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117157-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F0FD309D4FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA613CF026;
	Tue,  7 Jul 2026 06:55:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A563BE647
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:55:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407346; cv=none; b=hl+oinGguucoYYGWeQM/q+3/zqawdgzXm+922zSGjl7CvpM+W6ko19j3u40j/L42xGvNZWFbHl4qjGmAxZ/SoKeEW2z8VjpNvvCweETWWPDbBjiRgnWeqPFXsSRtyGKZcZJn/9TSePpwuemBhcuoZqlXll5rxU9kmaSTpSxWhrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407346; c=relaxed/simple;
	bh=6scFAplSDWvq390EfKwCS0q8qQMAFjHSWaPuzf2+Lo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjNKHhm4MdDe4a4NMcXbS0pnRndv2iciv4qxUNuTBOjE5zLndj84V45jrTAc/Mwi9aki1c4hSTuJJOyfdy+Oyo/WZNQIhPo+iUuSQQwXruEL7ijPHHzPaSODoEZcg4RpQGVdSMtGtEV3tRWGIW4B88SyCq/Wl4/c78uIfnBzlcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCnqNWa+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4veI2su; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748X2T2514295
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxMxApdb9aRLVD+Bcbc+ocNyw8VP6JGFS5XkjZmyyu4=; b=FCnqNWa+Tbu3Bsav
	p0qEapJmMVUxWDb925ZG6Wir/h+ebKDI/fPCZTVSGuFwIbVjdstOAWsc6KYs3BW3
	UMtr398SK6+3gvCAPUOwce1ht2+AS8Ug3tQWS9D6HFr77lFBnA10dYEfSrqi5gBe
	xkKX2WsX9DzgYNRqkAc0JQ4/YwlU7dYcFS2yrpzW9397LYr2gLWaFQlp78CAoTAN
	//oLkm7XS3X/aOfL7U+8BuaRPLVT7DRJISEVifXLY4Oa33t1xvO3UZTuK9WaZxCr
	4TwqBaPRp/3qcKzAdhECdFAVEMN3+HQj/s2ZIZsQVvDQbWYeCDqXrt4jo/vZdmII
	VJrfvQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8gn3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:55:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88d7a75507so6428418a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407339; x=1784012139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxMxApdb9aRLVD+Bcbc+ocNyw8VP6JGFS5XkjZmyyu4=;
        b=U4veI2suERBXqA4BLFMWa4h3QPwwb3kHWQ2H2DVU80fxLzewG3nUUNbMw1Mr7BDJUA
         V9abyMcbcXMTjclMz/nwlh0SnAsByhQqddH5RMOfAIV8Pntefy8CLW4BzDdCh4VMsVPt
         PRHtj7yB9GK+HgVWdRN62SosygTjAIwkYrQrK6u5cHPGL//t4m7rMjDFujzO1krqVqnm
         n1SGOrNaAvA/wu5yjzdg+rvRL8tOLuuDVPa+bAz3rUKVndCaL27Bk46P5M4xlyCHhVQh
         6WTAmwJ+X8Fb0SSNB2L4PbC/jcJsFBYvgYuZUTX57yclwMRto3PVqenaaxe4jlOaz4jJ
         OoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407339; x=1784012139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxMxApdb9aRLVD+Bcbc+ocNyw8VP6JGFS5XkjZmyyu4=;
        b=o4ROquPOJSsgzEm/YOugRDeP4+Bn8CarlcsWvAH346ZBrYqwFzKYBRBvw4bfio5gHm
         NOnaBHaPmhW5jyUgO6AttVv+DdNWB1g2j4rh2ANkp5HherOhrY/9SKtUP7hBtu0qaIiu
         dOADsCUQVARZMhlEPn09WslhH/fLsMUTOxUX4uYhTordEiG+ATJ6l1eUQsuZkv1/ofCo
         Zsm9iJ7PM3rrIC5QkC0FGIuNT+wpbT/iB3R5SZp4jOvDa+0W331Bb53Z3z3oPrz14C7B
         B9LIY9AdrQpReXxEWGba+pwf6N6b4zZEvhQA1JBXYe5RnA8TIvvat4fZm6PSYv1qA8pz
         XgXA==
X-Gm-Message-State: AOJu0Yw3F2TdJZXnuz2DTo+Re1WlZPWAy4CnGa2Y3xfwOQ6KRE6hlL1b
	i4UbZzEdrAQKvYxqHIZp/1FGvzMcSzfwu9F7GTNxhXU6IN3sjkwIjSiEs58kbcTrNFPsu1L5gT8
	s/ZvFW7suWQgcSMgnAsH1RPUSYI+kSewOd/uVgRVuMtKKl3q4XDl38Gt2nwPPto9r8Bs8
X-Gm-Gg: AfdE7cmflwXGZdU1m9OkjxBO64HJ7JHi46cUOAsL0/xUl/hUnbQD3gt+xd7h3H+T8yz
	9bIvGNChjZFRbfE+La06SCiZT/4rZf1oY0GQXinehu/o7FbHJEz5NHn2GbKDhs2u0gHPD3NMM4S
	mcOyfRDiFbJQjPQMhBgWwX6fzJuxxVVCYAh3m6lxo9YCEPu5uut0OYnxpL0w3mJw3uGOWLBO3pf
	bVmcCRXCRbYsFyI6NwrK3lGr78YqM35TyximGq9vwH1r1KiqaYm8u5Pesqw32f9w6B0S6chQvkO
	hhL4gCD3DTSQpIy66ukmzcQyjHfVy1eVbXoo6xI75ogaM4pq5g6V/xxS+VvV4MXepIOHBTF6Eor
	e+LgpsMB1+5z19U5wXiRmhZ0aD2VZ5F54sJ2rqldrTCKklMffF729z6ay3gdv8kT93QmgADGH02
	GSzU9b/tx/6AQl73bhKbZwAVXeN8RWMLqc8YxwbRwzr+HPRg==
X-Received: by 2002:a05:6a20:a103:b0:3c0:9c19:6585 with SMTP id adf61e73a8af0-3c09c1966d7mr2006040637.63.1783407338806;
        Mon, 06 Jul 2026 23:55:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:a103:b0:3c0:9c19:6585 with SMTP id adf61e73a8af0-3c09c1966d7mr2006006637.63.1783407338339;
        Mon, 06 Jul 2026 23:55:38 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm5055480eec.13.2026.07.06.23.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:55:37 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:25:23 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add IPQ9650 REFGEN clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-b4-ipq9650_refgen_clocks-v1-1-e070624d03d2@oss.qualcomm.com>
References: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
In-Reply-To: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX0/TPT74UwrPU
 e2j5UJMKNsFNS3E9C0aKao6wIGq8X0FDdQYjaRd419pOL5yJUsHV0F2T0QLw59iR/Dl4oiFn79b
 tA5ZUryd2sBXELzq2Bw6MT/ZY7yIun8yE/lqOwXVYIyrrmSDW1Z7PIVZXavkaFEnR8qMK+ywP3G
 9q4exDaO7jBOvpewS7Yr4OZIgnzR0umLBLTMf8b5OBhUGMAjlCvvG3TK4YaORMSFkzNjajf1RTZ
 tQWLS0ByBfTVPvdH6MEF9VANwOZXqnVdyeWX/+X6HT8H8vVrytfWszoN/J7LgbpqUz6Znv3Dhg4
 1OHRsE0J0xKzq+WtQjvruF1YXuMAEED41jYEAzDAn75IG6/zigyWk90PM8PF0a8Nmxuh5HRFnWT
 EyeqEpSiiL8wL1j1Lm+GoAEH6Ct7YNZDrU6BEka9glOt1ipaoO4CsmnwqTiuh0tVF65MVX5HGY8
 mJabTZhKQjrrQ5R+eWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXyVhBDcFQHdw2
 oEX+1jVXFERbJZQafJYhz0EKdUOV+m5Zk962g0TaIxvpIcMFoOSJ1Zos9/x5yB8DDRqBqO4mzb3
 qIM+kypfuZPKah6GxxN00HIzmcIy/IQ=
X-Proofpoint-GUID: s7rGj0Tjr7FZXX094I5PF5Bx00RW2kNh
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4ca2eb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kFjMkesOqst5SjKo_mUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: s7rGj0Tjr7FZXX094I5PF5Bx00RW2kNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070064
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
	TAGGED_FROM(0.00)[bounces-117157-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3608D7183C1

Add the REFGEN clock IDs for the IPQ9650 SoC. These clocks are used
to enable the REFGEN block, which provides the reference current to
the PHYs in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,ipq9650-gcc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,ipq9650-gcc.h b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
index afd17c00d96e..2d43ca36c09c 100644
--- a/include/dt-bindings/clock/qcom,ipq9650-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
@@ -169,4 +169,9 @@
 #define GPLL2							160
 #define GPLL2_OUT_MAIN						161
 #define GPLL4							162
+#define GCC_REFGEN_CORE_CLK_SRC					163
+#define GCC_REFGEN_PCIE_CORE_CLK				164
+#define GCC_REFGEN_PCIE_HCLK					165
+#define GCC_REFGEN_CMN_UPHY_HCLK				166
+#define GCC_REFGEN_CMN_UPHY_CORE_CLK				167
 #endif

-- 
2.34.1


