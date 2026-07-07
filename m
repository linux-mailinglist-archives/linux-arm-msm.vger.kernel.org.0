Return-Path: <linux-arm-msm+bounces-117310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QXllCYLzTGrosQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:39:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A239771B6E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:39:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KWD1N0er;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gOS0vPZX;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117310-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117310-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22F36303E4DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 12:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC47D40D56B;
	Tue,  7 Jul 2026 12:39:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB6404BFE
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 12:39:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427967; cv=none; b=gTIwl8EbmWzAMvFQEjqvFfaXlXKjh/cD3rzEWv86p9qID3TRWxSGFtLA7ObcTkUG5ZHa3L6Wk2ffSwJOr60pfW+vUs/MbJO/ScRhgAOAj2VOLiz389ad1aOag7W2GjWdPXOJaN/LxKpGSLikqtAoZoLVCpIdgwaTfWjxtzv5UHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427967; c=relaxed/simple;
	bh=LTIMHvuK3M9tT1SxrJYkj0HNZwJ0ICb6uzn8EiJHg3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uUOQH5JKz8qpMByZ9MeJMtIqgF19O/LwuHtPUNyXP6NhWEvk/7GfVGLptjgugFjW8zjKUilzDMpp8USIo90HYhR0pWnZWXS88XJIR2A6IyoPRDqj88LNNoOxAJE2a+5l9u5vj5MC/w8TzuiMN6l8l6G4xIBx3H3GBzyAa4TPU3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWD1N0er; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOS0vPZX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8ZCD3783380
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 12:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WA6g8A45s/DNa2YvVJag4x
	GtW+Okp5/lWtz6/DOOUls=; b=KWD1N0erpn5UpRn7A3gk0x7kZqD51/eoMNJ9jL
	X5fkv7cnsdFw8riwPkLqlE+qtGPhfISqQrey80EbaBP7jqEtxRmfrgQ5jHkQBXMT
	i+mB+P+ntBCFJoZUSFrrKF64EmF7bW9Vp2BVJK0YItIf7m7ZZp9t9Gwzt4KuagFI
	gxOgOfmQ0BCMTcnz466jEO4odABfXhTlS/NSlet+wKuN/Sapc+xkPzuKjOFfRtiG
	gNgCxGSbysTu/8WQg2mNUqzM64h77+ezNtbwkMdYyvE3XbOiayldahMR+7rwTp+x
	EbEkdo+gtlOZ0ymiYwo6F1kpXOVlMYYXXmYuQY0U2cbXgCXA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11s77c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:39:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso88974626d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427964; x=1784032764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WA6g8A45s/DNa2YvVJag4xGtW+Okp5/lWtz6/DOOUls=;
        b=gOS0vPZX9w7KzTE9bSb+rrS1Etdxtq7tB0ci1Tzm8jf7MGJXwpoggn088G9B7zbMPy
         UxgGl001KZvhKDyLKrh9V/PSCMAdo2TryFUnwd7C+Cz8h6k16kuuj+2Ft/Ks8Tu7dW5g
         HOSPjQ0DvfmtxibiIEZl+SkwGHmQOLwPQIUear5fSrh9PSburw7pkSJ0eIXkF2xgwhmS
         hFa85fL4kVCq3ThJ1FlxAtunk+LNezPexxXkGFuBCMaEOhnAGoP9MYPCniUogB1794oe
         FpFHXt9EwASowK40+bA2mi8FzEbw8i5q7IRortWCbolTaaiVPjwT/z3cInytusfzLtze
         c/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427964; x=1784032764;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WA6g8A45s/DNa2YvVJag4xGtW+Okp5/lWtz6/DOOUls=;
        b=m9l6Jy7xZWSB/zCfIPZ5MRDebnXHlHxZCZhVdCMq4TuikDOOwGFyRDHehuuU5qEAg7
         IbxEg6cfNxYA5Fh20iHjmwI8ul5QniWj2hwQEhq0S8d13mGJl5NToRUOkWmzHbjs6U4x
         8tEZJh2/7lPrL2rQtUxKXrvXnBN9W9nmS5gvL8t4UvFcWecKLIInlXazg/MwQEdgC4Tr
         ah4oVB0bfJ6m0/aN5l2/+VcVT/DqcHluzxrXnWsq9lpEuFU/LtjQda+weIP8/pAjyOfr
         cTPc2qoqUMqmC4ZTSDVq/UJfZaja91lZK4SLqPEBaW5MeFVIBQESBYuoH1vBJhBpaEZM
         Sh0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpYeYTMHvyYH+9aMmcmd75M2kK/k2oc/JvRG/4cH5l05zdAI+3zBvrSB9lM4g10ufkfs4lTyw4n6Mrpj6w7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+EjeuH6e+s8QNU3qosLQv/tc+75OvQ3OWPzzV7bTZxOqVyuGo
	YS5ADcxrIbkiclVpBQVBU+CaNB5XbX7PQkWrKHnkDDZVVzntKTdeNpciAC5BbJHpLcjn+r4xJEx
	X4MN5FpmZxt/PE+MmN0spvJmdOLJxSUG53lXHuxrRqlL1/YVAPSXrPKczsq598A/HdnDDAo8UaB
	Aq
X-Gm-Gg: AfdE7cmXcxnustgcFubM3Hn01sjgnU70H/GYQXdCzqOnPixzxL4SKKyFlhY2NNPTogg
	sVE2IMBf5qeZrsa1AhuxhqSWr0v7QzT5ofth4FaAZgubY2g87E+caHvwbbVYf0Em9VKvRoGnC4b
	tSimx+em2SH5CXVQd2W7v1+kJDx47GajVyGjrVHILbrzhsQDY/wjBICJUPdWjbvP+wROXpemEPF
	1TH6BMqh6NN/+JCrRv1j/zEymO4G7IC7xw7gCvIRXFNHgdydcW/Jwe9DDaiO6rhAcj/Ggi+ZUug
	P4dyl8TkDT3oVItN0hzFD896UO6iV03YJcn95tCU0aiFUupgEvKq+ISPAwQbLyjBUJ15reWyK/6
	QjJA/2UCOXvHqSLJKSMFvykClKuXJsSsieiMbT82I/f+ojwvI+ETXerhvrNG+F738K16ZMgU=
X-Received: by 2002:ad4:4ea6:0:b0:8e9:f5de:d614 with SMTP id 6a1803df08f44-8fcb4fe941bmr55595496d6.51.1783427963952;
        Tue, 07 Jul 2026 05:39:23 -0700 (PDT)
X-Received: by 2002:ad4:4ea6:0:b0:8e9:f5de:d614 with SMTP id 6a1803df08f44-8fcb4fe941bmr55595126d6.51.1783427963523;
        Tue, 07 Jul 2026 05:39:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46ea3ff80sm159724616d6.15.2026.07.07.05.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:39:23 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add initial device trees for Nord SA8797P
Date: Tue,  7 Jul 2026 20:38:58 +0800
Message-ID: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cf37d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x_pV9o5FX07ATpUlUboA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Ga6X7qKkUazLxhRE4P5s7Vi5mhOlHk_H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX2UmD3a3z8AD3
 92cI8C1TtIc+IB4c6hTJs9Qn2T6olJ/0zBXsefw6dsvQNQDYUmjvMq4NoSbOXQlZZptdCrRFKU/
 CuTYpT7FhiUxKNXc2zj+CKB4Om7sjW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX6VrNEWD91tzH
 NlqYRjFQNwuh7p6E3CTBd1BfZjA0EQheuaeX5KACWm8P3PC54vxfvCzQEQNXfdXGE4MaawfwXKW
 HYJ/H5Ld8N9ynAd+vszRt23XDPnIcPJD5CZ8iy3kKbz/mEDJkL1yFicEFVjd9ClKSVy31nMpIRJ
 acLfG/wKJzxSWpvGkQZBdUab+RVhnMSkA/DK7o/DnLL60Cd1G196Fv8Gz0BYiVaJVHZN0ALRIJ7
 NwiGB2uIfS6Bt2oVJI0ofoCg9/PEZL2vWKQqvxg8zRir5DFaWhJ8u1udMdyFadDJeZahPby/l4z
 RfP6YMied64FZPrQZOvk/xT/47OFfd6Azb2Dmbj0SKfQNAGvVq/PGLMBzCsiznbtgc8ivk4835m
 DNe8Phf84d4WwLA0eXoJicCWEZ3zsoljJwjfGoD/hsMV09tfdGRNPFCuQbU3lxGMkugsgM7ygYR
 h+RFTeYIakYEU2GN7KQ==
X-Proofpoint-ORIG-GUID: Ga6X7qKkUazLxhRE4P5s7Vi5mhOlHk_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117310-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A239771B6E2

This series adds initial device tree support for Qualcomm's Nord SA8797P
SoC and the SA8797P Ride reference board.

The Nord is a new generation of SoC series from Qualcomm built around
18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
is the automotive variant in the family.  The IoT variant IQ-10 will be
added later, by sharing the base nord.dtsi with SA8797P.

Binding Dependencies:
- ICE: https://lore.kernel.org/all/20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com/
- I2C: https://lore.kernel.org/all/20260707095708.3801043-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Rebase on next-20260706
- 1/4: Drop unuseful comments from arm,gic-v3 reg property
- 1/4: One triple per line for qcom,pdc-ranges
- 2/4: Improve commit log as suggested by Konrad
- 4/4: Drop 0 polling-delay as that's the default value
- 4/4: Name PMIC thermal zones with prefix "pmic" rather than "pm"
- 4/4: Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
  at 125 C
- 4/4: Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
  and SDRAM thermal zones

Changes for v3:
- Rebase on next-20260525 and drop patches/dependencies that hit linux-next
- Improve commit log of "Document SA8797P Ride board" to explain the need
  of SA8797P model compatible
- Fix the real issues reported by sashiko-bot
  - Fix unit address of pdp0_a2p node
  - Add missing compatible for i2c15 and spi15
  - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
  - Update commit log of "Add device tree for Nord SA8797P SoC" to match
    code change
  - Sort sa8797p-ride thermal trips in ascending order of temperature
  - Fix sa8797p-ride thermal zones with identical trip0 and trip1
- Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord SA8797P SoC
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (2):
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi    |  937 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4516 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  240 +
 arch/arm64/boot/dts/qcom/scmi-common.dtsi     | 1918 +++++++
 6 files changed, 7618 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/scmi-common.dtsi

-- 
2.43.0


