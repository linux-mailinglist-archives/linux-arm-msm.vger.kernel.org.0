Return-Path: <linux-arm-msm+bounces-114184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zE//IcptOmpg8wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:28:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BB61A6B6B53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:28:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CbMpPu4W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f5cqbli+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114184-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114184-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3DEE7303CEC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261F43D4107;
	Tue, 23 Jun 2026 11:28:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E353D3CE5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:28:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214088; cv=none; b=jW+OZxp99aaBIj8XjsvAoJFvVqkAJhiHDWqkmf8x2qjab3EUhumoqnQlYHOOXnoE0gt6PpvH3C2Itur5/uro9cDovKOJBWm27GB/GjcgSEn9kVTFM/rw9P9/I9uBOLAj1okFoFgpd9l1luixbJnt5n3kosjPn3XQKabvvMU6Owg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214088; c=relaxed/simple;
	bh=0JW0N3Q4UlyE0reK4VigsjGA+015U3nhEVQ43DeE6tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kxWm6EUGU4rUiwScXyQksAqzOG2UGtpaqHJE4HZP7mh5JsNHBpI/Wxys8ZpUbKMN7IaM+lcU9gFFGr9pqcoiarUydCEry/x7LCuwTQv13x/f3OokFY5btmATzuUu1665JghK4hNNhqNkAn16OFb9uhbbFQb8Y4ih9UE0ttLKuJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbMpPu4W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f5cqbli+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsk014152372
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5VWldt/+uc2oUyaeqdyF9lfgKwjuBPX1Pj+
	C0OR0h08=; b=CbMpPu4W0H/XVEcKz9EIVW0RTzWydISDlBHWgYvB8of4e/WBecH
	uRSIblKddWiqdvBymM19raBEJeCp9nbKorcUPcI0bLOF3HOsp4Qw7u+bkIKPLWr4
	4qWDIwWSpxlxy4RltVFVWmEUMRv2Sp2XN61W6y3tsIp6gDFBbu0fQ/C4ilKJepp7
	7VFfLU1D1gmiamfeKmlTJppqxp8oCuAMu6Q19wsGc1hjo3mTlK8/kWk7F/SjhbbX
	v/9mdyg2n19psibdBRkH3OaiXkHo5WmPjL8VLjmRwVGVHTPoNAby+E/bBQ6P39xq
	P6QSQn1MdhUe8xDL1BgGiG95DuCehkJMsEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44h4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:28:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157f453a27so859064985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214085; x=1782818885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VWldt/+uc2oUyaeqdyF9lfgKwjuBPX1Pj+C0OR0h08=;
        b=f5cqbli+xeLOD+bnwBDvtrhIFplblLQbeJmaP0u6uZtpNruFCRRAdl2ODqXJMu9brO
         6ohnzbDXQJ8Mf26D9NGNKcr7o0Ml/deyFuKnXdDu1j87helMk4MEikI0wZN0+1UKagFt
         VZw0/PtiFlxZhb1mEXO2F4EUpDWP8kD0JQU5X5F6KjoVZPE0IdX/hbTQ/uKn20pL9YRO
         hf33J/8vIFhbUZMhynhCYCywVV6yvPVDJCDFORPSG5HkoCrEPCvmO2tqSF1RTlKee82l
         xpi/LnrBo/Yr59LRo+vORu4mcEAfE33wuXQMNdqcNz6gD6qddJBFggY0vnQ3MCL79wIA
         PxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214085; x=1782818885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VWldt/+uc2oUyaeqdyF9lfgKwjuBPX1Pj+C0OR0h08=;
        b=OlyhC7Un/4Ar+fcNkj7uca62XO516xz28MaljCMUfHjMCCyJrtIHejEfNED9Mud6qG
         jFe8RxDJncPCFKSL+FyYvSxHOpFaqlWLa9JBo23hsQoZBCKEUkCSaPhKKnzk4XBnf/GH
         algpDBqH4RdOMLOfmrzwf8AXgWBrimImLrSZlr4g329CPZqiADXtvOqEnuCyyT4e6Nz+
         Vn1XivmIa+Oh5VsKUbT/+qiCiV0VbBZ49dJJ2Con+deQcrr7IWHcpStEMLmSPdsuhD79
         R9xODT/6OFQj4FpjYZJuOPKI4ge2SkqMWmMtVpEFkm1pcGiSNhjdaxmXHpFHrJbf/6Qz
         BeDA==
X-Forwarded-Encrypted: i=1; AFNElJ8qpYj+MezmUjNZFPB5ef0h7W16w+fjAgWcFMeA5jDjdR8pIV68346M9a0xecVClOhaiRGzKb1rV94cHPEd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4lYv6u+0PYZamOYNaqq7moZluLwI9isIPzidU/jlZq0FAxgiS
	hbkErZa0fK8Qe0Bnmt1zn79MJx71ZQfEdZEZfMGhITevqxA7z7yzNe2kq9r/nvtc6RXE/VzOIyn
	MMjARROrGH1KRX9mUmJtRb/7wDDMpMONKjRjijEsyN4QpfBUP416f+q9cpXReGYpJ7w2Zq1SGHX
	0W
X-Gm-Gg: AfdE7clPs6/8VN4PEXBzG0wCTCVYkdevqsTf/vcXPKkyU3S36WkIXw/2YP22+4XXSCz
	xehGX1BZQuuPiss4Pwx7JW7f6m/y0Tl5p9G9utSC6xRd7PMVTlv7JQjybS0sMWVh97MJZQUxG1K
	8iDDWK8SgdFTYKDFaV5CY7qvXNI/mF4mkg4jfxnb9CHVucFbZKmZDW7HqB6Rj6x5cqocDKPMbV+
	V7tdf1h9b/xvV6R2BUGP+K3yhD/4/cL3loRZ6Tjz8hY306hYPPNG6nJwrs1BSbZGgfvCuxW43KS
	IXJoJrAUE6f954LlAODkogsD7cK11pg+RCFQnJV9yP/FONvRr9g5wbXdF1wFEUTp8bpPpaL70zk
	FaSfszMRxkrIOgalLO+SDLWa27RI=
X-Received: by 2002:a05:620a:6483:b0:915:6437:bc41 with SMTP id af79cd13be357-92645da02ccmr449477885a.15.1782214085015;
        Tue, 23 Jun 2026 04:28:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6483:b0:915:6437:bc41 with SMTP id af79cd13be357-92645da02ccmr449472985a.15.1782214084590;
        Tue, 23 Jun 2026 04:28:04 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fc47720sm631624255e9.0.2026.06.23.04.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:28:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG stall on Eliza EVK
Date: Tue, 23 Jun 2026 13:27:56 +0200
Message-ID: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2259; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0JW0N3Q4UlyE0reK4VigsjGA+015U3nhEVQ43DeE6tQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOm27YWxVYhku4jfQi1KWy5rqh3uMm/wNgDCK0
 tMZ1BWehsSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajptuwAKCRDBN2bmhouD
 1/hbD/0Ts1iY5FRnzexs+6q38qgX4iwn5lNzupoulP16MTKbuvl1DXyqG240NPgdqW6CHQZIhO1
 hFVbDoTMJrN54s+qXqW/Snjv7WiGs9LoS5Pg54hHF3ygLbDqRhmNff9lJvXGHQLkZKuXIUBgAZb
 tLZ9on0BGCVIKFpWGW2LeLmprva6sXRuXMGURA2OSf5LSHG/T37F90koJBy0FoAy8Gsgk/0yBmw
 ijspbpSdCLkRrdwBAE7z3C6LVJl+nEJLYa9tM8HYcnFZLX4c7sslOdRw5t8vIUEaHk3c9sRkT1R
 EYFELN/m6S48xJzflYqlDbeHYQZAGC7ylLpVGy/UjwyIaPUwN3MlCqlyXu2n+MqA/C/+E07V5FG
 1Os8g/It4F7Si0FKEdIaXcd7XBkrE9cgqPlwmkWrpF6BTOJrhNaiOpZp54jvVRRvKTGHXnuS+h6
 zDWcWseBRueDVn4ZJl3gJs92/y34JwOAbxN7YVVXDAunmukIToOyVmDzw1ocqJ6Qe7jO82ePfrV
 m7CzbuDRL4yUrcnAKwKnj/DMX3LctUcLjDDvSQ8PeM5jyU605tN+u2MrWDxXf2GEambUOP/pJoQ
 IKk12kFIw0s5Umliv13H4w3j7pYVJz3gjWcG1ObNEIFv6b0vVLORuIl8GpitybJ8L6y/PMnTQoK LzDyiZVae4hk8ZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfXw8PnymQpB4eW
 TocG0Pc3q7W7f4RtZXgburRvaGB6sCvBheocb8AroKPz+Cbkfnn7gtZSuqNoux1FjZj/NJ+yA5H
 mF8TQWK6sHrCiJHWB57SGNRr4K+h1BI=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a6dc5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=EhBrT-q2SLtfKhaW8CsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GRS1-zOpDoLSS16Alwzg-233Kem5uVe5
X-Proofpoint-GUID: GRS1-zOpDoLSS16Alwzg-233Kem5uVe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX3SUEdvpEkIWZ
 TLteice0AJYzAgeLSr8MoTTkFUosbqrVpheS6bHTRJAdVsEKA1o02iBhYmVTet/cMHbr7S8DMYs
 33kLIra+1DnSItd3N+fJiSw4pQW6voFeTLWpCgkZx5Xd3dwWrpXR4TxbqUD3baY/cXPQeSYGdzg
 +2mgnVAX7ctC216lNLTlJzrteXe/jYaDHTEfPFcX5hbYT+zSkDnH0RcrreeofuumsP+dCn4SpuL
 uzB+RBBVL4H9Ma4QfuQTiKXMrjxX9gsyGJZ1OEvLHG5gLz80JFcA+MB+qa8r+F+E7/nohlCNFjd
 KajdsRrxuIeBmhiEmqCQFcyTEkHNDhJg4UKYa2G4devyip4erJRj1w92HJlwv6wpWUxK7By5wo7
 WVpydDZUef7fEUKKl2MJsc1/WGtVd4kp/R40XYNNiGvkO6m5XbdXqLB5XP3Vw30+Sj0UTbGkAtM
 sIFjgCkakqyJK9XPJaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114184-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB61A6B6B53

Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
Display Clock Controller is enabled and references parent clocks from
DSI PHYs.  Devices which in base DTSI do not have all required resources
available (e.g. because they are simply disabled), should not be enabled
in the first place.

Having DISPCC enabled without DSI PHYs causes clock reparenting issues
and warning on Eliza EVK:

  disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
  WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
  ...
    update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
    clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
    clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
    __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
    devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
    devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
    qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
    qcom_cc_probe (drivers/clk/qcom/common.c:445)
    disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
    platform_probe (drivers/base/platform.c:1432)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 7b42e37e5bf8..28063e952f69 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -425,6 +425,10 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&dispcc {
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index aa72d5f042a7..5b62272e242f 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3220,6 +3220,7 @@ dispcc: clock-controller@af00000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			status = "disabled";
 		};
 
 		videocc: clock-controller@aaf0000 {
-- 
2.53.0


