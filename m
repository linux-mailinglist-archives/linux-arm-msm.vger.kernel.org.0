Return-Path: <linux-arm-msm+bounces-118921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4cI+BlfCVWoJsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:00:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA877750F63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:00:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E1HwWIGP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="TLM/aQaA";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118921-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118921-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C863B3014E46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429992E282B;
	Tue, 14 Jul 2026 04:59:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC82E739C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005195; cv=none; b=Q1tRehfNURPGvdclOUutbTCrMF8QTiIIFjNEcd+DijqobUCBCBEmUbbZoa52BQM1obaldwIbAXI9XtfVG6KQ3ZOJ0cZSJ76LhJEEdtu0gRgSEeFgUpka43khvan18tCex0kCwvEzddqQ9XlcMH6jUIQ110y2qDOGNCZo1x2Ehmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005195; c=relaxed/simple;
	bh=v2LF2JjTn8nWjxUScg6pd9H3AntKK6RoIFy61MF5jl0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YJRHtJrRTC0XZHhadpglRr01z2T/w/ee9IgJ6+SF5XofM9eIXletSbxFF6O9ro9iT9MjrkJNs13D8IYcW66JTti5s3juALtELQStJe+SmJWaeUipB/3g1VLMaJYuoGu117DH32sBDemvOMIXomDAyAYDHuGqFdokFfH7RFyxaTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1HwWIGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLM/aQaA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38PYQ3499047
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RX5ambPkVARTusLAr/sDZe
	qiMYsUAGeyyNWMuuDZqPg=; b=E1HwWIGP1TM0NCk63Yt0o8J4NOTDkhm4VS4Kyd
	JZyqpWZrnvnwt3GplHqZqVH+Zw6EzY2nOuh8yMw+aLxGbWQBikO4FmWNDi1iL3QW
	NnsBre8pc1o45PYoWo17/4umOWzQraNkwb++3ntrXDc+KIklPrswUXR+xPQgIimV
	eIxH2vrZt9JnLia3szp+axYGTZK+qdoe4662IWbdsbqr5jaQaPIS0ABwbFsSS3Od
	HcL/TOYwPztOz83KkQXSCsrWV8pr8Ovy777ZFBm2bmvZm6WjrRuVWzFQ4rlGnjxm
	8+moZ3LN+UsuxcTxusqqCQKdrXMKySbaKN2OkcC0fC6WuyJA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda3vvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5914612a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005191; x=1784609991; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RX5ambPkVARTusLAr/sDZeqiMYsUAGeyyNWMuuDZqPg=;
        b=TLM/aQaADku/5qtWnjbADZu/2IetSdvCXXjRlkFVlGBUWJRD8Z2zqvCYD/Kh8iIMwd
         3kigt3W/Tv4VR01cT+mzdRrFKeSoO4PEM6hSe4Nn/wp5uCkMycYfX+KF6Sm5I0gLkA/W
         qDsLf5XZBXdIC7j7S6VDvqDQwopqjGG8vOMsH8/q5MfercDbANZJrD/3qzQFN7S41wHe
         k4d23Tp3ZhDU9RrScRlOPGLw/YzOHGGrZCvjHfRLpyxNAYhJByOpYwHG+xwTR24ICcMR
         oJESXhm+BwwjMHAx+gOfKQCFr4ggZ2AP9KjuUX46S6MuDE0S4RVNFLtj126Xx8VnGR23
         LLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005191; x=1784609991;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RX5ambPkVARTusLAr/sDZeqiMYsUAGeyyNWMuuDZqPg=;
        b=ljGGfJA3cvvVYfLfDYKIj52iNbiPBgpfIoeFhhsF+8dGbIG/8B64EetcpnQyzIsei7
         RAihfg9sugeBSE+ZAb8mCeNeeQCxid2lorwujnugJJcoGaG8mcHWhv7rC65to+jNeW0u
         n4xC5h06H8KPscqgzY5cbwg6quXaFIQEGNszWcVbmtkH7b6N4pbNcMDEPC3T0HzdU8Bu
         2nxY0gAPPY+hPU3t+Pgp/cBJ1x0rtTe68BsJjixV3zVKf7y8yQKDOIquX5qkn1aj9Nsx
         rnHqi8X/O4qCo1Bws5iq7WvZoprMin95PTCHz87uFNdEa9OlSNojrv2f/MLr64BpY0Cu
         4Y9g==
X-Gm-Message-State: AOJu0Yz0PSedgS9i8sFniexFqhN8PXSo6QzLc5qIzqGnEr00Ahd4RSXD
	sZWuYVBa3TxIkAzP4GDpBsvRq/6KZbVIFGV69YOARuHEbC/9/WAJGnF4CJif/pw+U+xq37sxaAK
	X5HvFu98K2j1VKwBko2Fp2TvX8NS/oZC69P0t7AM4hiplh2RRoYqhahEG+fQ+t0zoQ9ZN
X-Gm-Gg: AfdE7clTgQ7AyJGNRJ495/8No0G3cIiQ9EbfS0z6x3VDLQd6zCQRTBawvcevhIAk4y/
	TEqfwsd4ylqq9hV8BjbnqcAG3xpf91rN64oeQ07o7ygbgRF51s4gBRcI2Am6Sri4rdp5eO1h0ka
	jrTzcyZs/6nUXa30t9Ng3KRwd0PAs3WwvQSHpLrlZ/pXUt8EM12eQ4iUxWCW6WltOwGEfB2jMBQ
	oLujhE0zx0X6ksk2/N3cVeWHBMBUnhbJ+3SrjByN2DnlEdJw4ArZePIx2voeQFQ4WJlkfSTX3s6
	wiEUAqbqJh9Oou/bI7JPRQcZqWFTly3UM59IYN7IBgXjjeNNjv/JtW4XTsZq1wJfZdbeJpnRJPh
	U3lW69A4X6X7RGLb62+57se3gvViqCQVAcrqEbMTzJAgChMmYVI+501/Sxg==
X-Received: by 2002:a05:6a21:6da4:b0:3c0:9c19:6587 with SMTP id adf61e73a8af0-3c357650324mr1078577637.65.1784005190944;
        Mon, 13 Jul 2026 21:59:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da4:b0:3c0:9c19:6587 with SMTP id adf61e73a8af0-3c357650324mr1078550637.65.1784005190525;
        Mon, 13 Jul 2026 21:59:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:50 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v9 0/7] clk: qcom: Add common clkref support and migrate
 Glymur and Mahua
Date: Mon, 13 Jul 2026 21:59:35 -0700
Message-Id: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjCVWoC/yXM3QpAQBCG4VvRHNtaSzZuRRJrMA787CAl925w+
 PT1vRcwekKGPLjA40FM8yTIwgDcUE89KmrFYLRJtY1itTn21eqxq4SJ0ojGNi4xtbYgp0UWOr9
 gUf7mvRnRbW8F7vsBJxayM3IAAAA=
X-Change-ID: 20260713-tcsr_qref_0714-0ee27bc42a07
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=5997;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=v2LF2JjTn8nWjxUScg6pd9H3AntKK6RoIFy61MF5jl0=;
 b=9IXHLRpuLRU5/jAga1ulgfzDd7QrKdgcHx382LayI4D/gaKrwZbkVMgZ3HYZwnTCb8rNKe/Ya
 xydyyjjC/RwBw1gYdVSj5lp9rDEUJPHPsJY87gOR3VL+A7WqwrWz+/P
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX1YddEQKlMImp
 pP7T/+y7wmLlHYTZtrH6T5iMYHe1mDYIBO5AZW7K35A+EqOye7niIg6ld/H0RzsZ00pzNYp3NBD
 aMgobeUhJkDAv6SpLhUmS4nX6y/jEj8=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a55c248 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=VBF_zcjmYl_iqrD6TbIA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=xwnAI6pc5liRhupp6brZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: e-40tifW3KSQerB6exZGfw4c8Rgea1q5
X-Proofpoint-ORIG-GUID: e-40tifW3KSQerB6exZGfw4c8Rgea1q5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX3jwTKnDjH6E6
 WDacOivak3bBMyuqrh2S5AAnh+gzcnKApTcaQF/o0olkC7Y66rFUFH3RVzDSIoWozj7rm0+mCQ6
 JgyhQbiobEs2jdVYrRCBhseF0k4uu9yn+lfD0HQdgbaXx8+okK4L2lUhNJYOQbTLvGHv3CvMnBb
 VNho+a2hydIEG0x2jlx3CzjfD9VIWAY083OHJ/8n7o3/Y+MLyvb5BvjbFYsN/EAwtfSser42W9s
 M+RxQ99RFalY3HjMvon7fQ6wfool52q82YjYFVREWcaUNNtPBsrjqG6yKLXrYKsyUvtB9EkTFBg
 y75/799VCjlYTr1JyeXd8MVUN7FaUFNzg/oXiNzZzqS0X5lPwXo4mariwKnhpM/r5f/vI6ViMNn
 qpKqqZkhRRpDQ4b++Fd52fSAVpSuOxAwxY9sbwPyt5n0I6tdcRJeosufAvCTUAUMzxh0ybGu7N/
 JKk7XMbmjx9QO8q+QhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118921-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA877750F63

This series adds a common clkref_en implementation and converts glymur
and mahua to use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur and Mahua gate the QREF block which
provides reference clocks to the PCIe PHYs. QREF requires LDO supplies
and a reference voltage from the refgen block to operate. The refgen
block itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to
function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
the PHY directly. Based on that feedback, this series keeps the
regulator handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

Glymur and Mahua share the same QREF TX/RPT/RX component naming but
have different PCIe QREF topologies. Both are handled in tcsrcc-glymur.c
via match_data to select the correct descriptor table per compatible.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Changes in v9:
  - Add reviewed-by tags, no code change.
  - Link to v8: https://lore.kernel.org/all/20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com/

Changes in v8:
  - Define refs with __counted_by(num_refs) and make provider a single allocation
  - Use mahua_tcsr_tx1_rpt012_rx2_regulators for PCIe6.
  - Link to v7: https://lore.kernel.org/all/20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com/

Changes in v7:
  - Define compatible as an enum and add the per-compatible allOf/if/then block upfront for glymur. Reword commit msg for patch1
  - Drop Krzysztof's Reviewed-by since the patch changed substantially from what he reviewed.
  - Added a comment noting that on Mahua the REFGEN4 block is supplied by the vdda-refgen3-* regulators, and mentioned this in the commit message for patch2.
  - Change the descriptor array to an array of pointers (const struct qcom_clk_ref_desc * const *). Skip unpopulated indices with if (!desc)
  - Convert tcsr_cc_glymur_clk_descs[] and tcsr_cc_mahua_clk_descs[] to a pointer array.
  - Add regulator lists for clkref_en on Mahua.
  - Null-check device_get_match_data() result in probe.
  - Add rx0 regulator in mahua tcsr node
  - Squashed the former patch 8 (switch pcie5_phy ref clock to RPMH_CXO_CLK) into patch7, so Mahua PCIe probes at every commit.
 - Link to v6: https://lore.kernel.org/all/20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com/

Changes in v6:
- Split dt-bindings patch into two: one to move glymur-tcsr to its own
  binding file, and one to add mahua support
- Use regmap_set_bits()/regmap_clear_bits() instead of regmap_update_bits()
  in clk-ref.c
- Move clk_init_data from struct qcom_clk_ref to a stack variable in
  qcom_clk_ref_register()
- Add Co-developed-by/Reviewed-by tags from Konrad Dybcio
- Add missing regulator supplies for EDP and USB clkref_en on glymur
- Link to v5: https://patch.msgid.link/20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com

Changes in v5:
- Return 0 if regmap_read fail
- Add a separate file for glymur-tcsr and mahua-tcsr
- Link to v4: https://patch.msgid.link/20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com

Changes in v4:
- Add mahua QREF support (binding, driver, DTS) to avoid dtb check error
- Override pcie5_phy ref clock to RPMH_CXO_CLK on mahua since
  TCSR_PCIE_1_CLKREF_EN is not available
- Rename regulator arrays to topology-based names and merge duplicates
- Remove else: false blocks from binding
- Sort supply properties alphabetically in binding and DTS
- Link to v3: https://lore.kernel.org/all/20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com/

Changes in v3:
- Fix dtb check error: allOf:0: 'then' is a dependency of 'if'.
- Link to v2: https://lore.kernel.org/all/20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com/

Changes in v2:
- RFC tag dropped
- Changed back to additionalProperties: false
- Moved all Glymur supply properties into top-level properties so they are explicitly defined.
- Link to v1: https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (7):
      dt-bindings: clock: qcom: Move glymur TCSR to own binding
      dt-bindings: clock: qcom,glymur-tcsr: Add mahua support
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Add regulator supplies and migrate to clk_ref helper
      clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator support
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Add QREF regulator supplies to TCSR

 .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 +++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  20 +
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  16 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  13 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 205 +++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 471 +++++++++++----------
 include/linux/clk/qcom.h                           |  67 +++
 9 files changed, 704 insertions(+), 237 deletions(-)
---
base-commit: 3da905eb243cad56200f09bb7eaa060537aed0cc
change-id: 20260713-tcsr_qref_0714-0ee27bc42a07

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


