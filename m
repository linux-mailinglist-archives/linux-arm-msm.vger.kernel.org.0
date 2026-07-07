Return-Path: <linux-arm-msm+bounces-117156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KM3eDvakTGoyngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:04:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97985718400
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:04:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XrKfhp8G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cqgu+jit;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117156-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117156-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2DB0306AD13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876973A0B1D;
	Tue,  7 Jul 2026 06:55:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC73C4141
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:55:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407340; cv=none; b=oM1OPyLavKrDlmL5mQOWLtRIgYxCjjCPy9XuwHHCWK0D5Qgq3VWJrmnrYwYMCImcrC4jIQ5Xe0J3iZPTyK1Ifa0hrnyS4MWmeV5hmH0AqwfUAeg7RBHTsemlB8s77RN1SqceR8cO0/x90Ty4fLVRNW+qBPPaKqav0sifuj9XXWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407340; c=relaxed/simple;
	bh=5aqaw6YW4IIMZcy7fC05XqRq1jJUB6isccswDaJb1rM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ns91JNczhOcWVo3vKUiU6571p42QFvC7uOzy9PE40+0IMHe/pS4KBfeg+70dIeEMGM2aj8pQ+sIMTEIxzIJB5zP47t+HvBNt9m1WGkYfGR2HK8jMNTA5lL7lGWf/UUXvlOOcXXc6VhxEPGeCd9qlBxSI3k4+jcPa7I6WaiZCazE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrKfhp8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cqgu+jit; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6676KTDN2922475
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=plZmmgW/vfRTlgrCgxSjmy
	yjMpbVJtQhI7sienHZwio=; b=XrKfhp8GnFmsxDsWTi2OQVe9UeoQghwh0iI8QC
	ol2G+E3IqPduXGgeO6nwMMBqOJrToUIlXTDfWmjg/+U29z0/keDH7DlOPZRPseB0
	Dr0NHRRksIAa2Iuwqavoj9Lsst3q6p13aEyxXkKpb/5sKpzk921GgcxZoUXnSQJg
	RvsrdwwiWp0hqtc9BkeI20LKHoPXcYHrW/AsQyL7p/8Jnt11GqWw9tt7UbDkehBZ
	lT/nxhoHIDatwGFOUe2q4g2rl3vHXU3UU3o4k82DWc/UAJjKBZggssWDwsADHDg8
	eJLp7eMIRGt8fTksn3hkPXW/3ZgPEC+4cWu7VvIKwk0e6Glw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t840r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:55:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3810960140eso6304513a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407334; x=1784012134; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=plZmmgW/vfRTlgrCgxSjmyyjMpbVJtQhI7sienHZwio=;
        b=Cqgu+jitaydOCCGE8EM78FflkOYfhVf5wtibCMw+jfS8exRraV4TQiRfTTFHoP5QT5
         rcb8w2Ch6LIM2ZPlqpSUD6F67bDo02VYmCpqhcahHCs6Aq47ao5yRbBTNNword4z5314
         GFGCvoMvZu7db/3dNiRpZgfY/zNNCTd38Ihf6iMTHiL7R/ktPHM+HNZys71yaYGg3L6v
         7S+M7ap5vmrNqaee3vKR3sIrqz33Tdcn7UCE7av45tcf6G6A9wfSWml84bWVTB7e8oqL
         t/IV8uHPPkIMIyv5yk1qMHb4O71j0x0fFp58rN5gWC6e/bXWltfKF2lxy98SKpZqPSHW
         2A/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407334; x=1784012134;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plZmmgW/vfRTlgrCgxSjmyyjMpbVJtQhI7sienHZwio=;
        b=KwTqihWl22KHKq2eFvY0k80f8Oe2dj5ktQQ7lRpYN3TrzOodbrPm3MiY3waiU7S4Q4
         ZXbaf0pr2EmqQgRdU+HK0cbL+U7/LGqkDwmXingp5OnpKjl6MsBZo2ecBfxv/Kk+XrSj
         DSjYp5tkCKyGMQVR6jTxOYtsF4lNVwtqrU/hiKegDLwcS+qknqkouP2mK3FyrrLD3QIm
         94cTdrhERgoBDdgm2F+wDV33IztDJvGZ5Ivx+uyKHdjGj6Eu+Pbykase06tlKO7hkiLq
         sQhbA5r+OiUYhcQmt8udD3X2wmZrz2FNYMgGOCo6WuglzSftMRColJoVv6wg4Vkc8mi/
         bgOg==
X-Gm-Message-State: AOJu0Yw+bPCSKSLPeoHzAbFMX15dwwtaNvS+jPs159AuYomsT735AaV6
	bH81vCxED34bbH/L++B6nw2AXmx3dArNsX/2SVbumvugaHGmRMvRfL9oZYF/NK5jYGxD2GhlJ8M
	Gxi20LdiRPJlVSwDoRmUBPT/QP9bhYJsgjs9WdqBYCpRTYpOmrXJQkWmi7VlfjjiIWhmySAG30W
	gI
X-Gm-Gg: AfdE7clz8YJWmG7zUkBE0fJVP4dslbE2xki3IUmLXpWMIT5a+ZirBk/2wQ4r4o/NZWk
	Hdz1hUhCleBSrsmqlChaAP+o4t4i/H8XsLQixC3TReKBfKnE2qBUyVGr4w0nmqSF/JI09URzLTv
	O74HiIIN30Gopwpfc4rbTzog902J0d5e+0/b9N4BvdLEDJ+MdkcG/uU0ORxzhAls5lGlapHIYdQ
	aNTJbuf/PGYE07bmQ5fShDt7ajK1HqEjajufKpWwgId3UWcecuc3ryRt0x6myrnV/FJpEPDSCJP
	j4WE5DQGoud5BR704L1vm1XEYq2hIJSY1Oe5RRGrVUfkROnjuQHTxyoc28O9EN6YeUwnztpYQdv
	UxDlQ6TGKeolFp4hxMThTe6CB0fu+nx1LKPn8d7o+mqtoO5uzPkFmiwLanMIjELhIHyNT8gUWmb
	lDsStVHB93vmJ6n3Uz7h9wzzwG25O61KPQApLSmQpG77hizw==
X-Received: by 2002:a17:90b:4d81:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-38755c4aae4mr4027503a91.8.1783407334204;
        Mon, 06 Jul 2026 23:55:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4d81:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-38755c4aae4mr4027454a91.8.1783407333717;
        Mon, 06 Jul 2026 23:55:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm5055480eec.13.2026.07.06.23.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:55:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add the clocks needed for the REFGEN block
Date: Tue, 07 Jul 2026 12:25:22 +0530
Message-Id: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANqiTGoC/yXM0Q6CMAyF4VchvXZJBVmcr2IMgVKwasZYhZgsv
 DtTL7+cnD+BchRWuBQJIq+iMvmM46EAurd+ZCN9NpRYWrQVmu5kJMzO1thEHkb2Db0meqqpHJ2
 xH5xtyUG+hzzL55e+3v7WpXswvb892LYdF7wPh3wAAAA=
X-Change-ID: 20260630-b4-ipq9650_refgen_clocks-39c80df96ac9
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: zc5NVgr_fJ933U5sDsaGpya-q2tgTLTe
X-Proofpoint-ORIG-GUID: zc5NVgr_fJ933U5sDsaGpya-q2tgTLTe
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4ca2e7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fnfbLKXFiFqjf_-Ytq4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX0TEx0iykcG4c
 g06hKRsTPKoO7dUEq1LBNBW5TQc8V9ZC1e8exn2QWHAKtXYiYXqUQHUtQKmMVPzrtwIz9fB8SCs
 OxKAPRAQm/47V+eWFUKcV7tCgqp3Xz68oxKPXftIit6LloEMt6u4y9VjcjryQgdDNIRXBtf8pp5
 ni30aEXLnGoW+Cnb5vgkXY8Kto0zO2dBzE6l4X/O5E64egMjf3ZQNZ1cT6ffQalq6vJf0230YXQ
 Zj7/lIreXspqwNfwfIYSKK4l5NJ8Pg6BBHrZuxm8YsrzVZ6fqgXXrMNkSzBH6qrFcMS0CH7N/53
 LMjVCGBwX4XwhcNGWSY6mYYgt8yI2w8nJrBcgTg8uIEMx5a+VihRZNUGdJ/fhNJNwGUoQYUWCCR
 ZlW0pysIx3P14Wp4S6/nXF7o6s2OMpUzWCAw89lICTbchHRafbJF7wIhvjqyC906ZCAJwCGBCVa
 E1U/wR13aeneDu9Dojg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX/jgzx6MN1Ppr
 pARco2XopRMB3X1QQ8jjLGB0oixcPfj5dDEcPadsRu6TjCKXwXZkUoanZ4gnNAyK1APwn5IYb9z
 p1HvB0xcLhaLOwZGa+gRcwLm5Pe/BVc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117156-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 97985718400

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to
the PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block
is enabled on power up but that's not the case for IPQ9650 and we have
to explicitly enable those clocks. Add the required clocks for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
---
Kathiravan Thirumoorthy (2):
      dt-bindings: clock: qcom: Add IPQ9650 REFGEN clock IDs
      clk: qcom: ipq9650: Add clocks for the REFGEN block

 drivers/clk/qcom/gcc-ipq9650.c               | 89 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h |  5 ++
 2 files changed, 94 insertions(+)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260630-b4-ipq9650_refgen_clocks-39c80df96ac9

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


