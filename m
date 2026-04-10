Return-Path: <linux-arm-msm+bounces-102714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO2xJ4NE2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:42:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1C3DB829
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74BEF3012CA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1A13E3C54;
	Fri, 10 Apr 2026 18:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yf60hlti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDrfZTk0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5123358A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846527; cv=none; b=mvt3C/awjBBN4xFUS67Pb4D3UMJyX0oYtFZ2vAmIhJ0Hlor6tZOVpDMSwPa7fL0iTOhQ2jI/RxcT0V2KRRk1xqAAgo9ud0VIew6AWZDzeZA1kKWyWIkPO1eLFKws/XAEfuv75fgS/YuSbkQaSYNMxx4d8QYgIr6K3qByAJgjjTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846527; c=relaxed/simple;
	bh=Xii/ErT1Xj1n8XWw7mfOWIQJRcGW4d+b620Dqy3n2wU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GVBpkZKUymvsJtBS9eHr0nCAj02A5YZqZb98WI48c2Usp2FzwgNJIbCGBtoMU4bRJMoV3mbqGpXPvRS8gdZFfHknBbDxFBV4dZ7TxLv7HCcjdM2/A41siFN23awUWdxKgF5ugOdStykhLtgW+euuxebpQpBhXgwlD/4AMZxewoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yf60hlti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDrfZTk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIBX502698373
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LkOHEiyv4wNs2xK1MBQesq
	evDYPBfrfROxl/qZcMhl0=; b=Yf60hltiKqiThivHqk4rtxnqWDiK62w+uYyNjb
	lX5Luzuq2TAi2vSLKlT56hOo8WL3IrXT3oNDsI3HV5eAoEo9qugR2SDfwM2xd3LO
	Ijhm0Y3WavW4edGSuw5V62dVcw08Iby5i+1e/icYEapckfrqWlYSb87snmIYB5e8
	5cNvEwbgsOipzhT1OayzeroeHvQEgCtoUNHA2N1fen0U88I0euD0AWDtTKNonK3r
	HJC3n2ngP8g0W3v6umtyF0O52COAfHTv7tzMuK0qY9jxkAKkbn9wi8pQYLIIYx8i
	vsWPPjH5LFZsmGEgjnZLjvIOG/I7AnXQ7u3VwdFNDQnGqe4Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9v9ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c769e2b1bd0so1252240a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846524; x=1776451324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkOHEiyv4wNs2xK1MBQesqevDYPBfrfROxl/qZcMhl0=;
        b=hDrfZTk0JXmLAe7jNgM2OQUY/zEkhK7J+37YDIj7W9DkJK+dAG3c2ZrYzt1M3MATG8
         SMYxfg8mgvDf5Py2IyKygWqVIQ4mS7LNAruvxeRa1ZYmhywwsCbYeR8d/zToromRKxAf
         7Si7Sy1X1Yhm/rq7Ux10Ge5U9K0bTNTv2h2sjS7CBIimMMcZfv9Y+GfwaMxhae5qhyup
         CJt/dvicPsd8WTKwNBdQj7qqTGxw7SND66CZ6DsJvqvNNgj750RRiJYWp3b3PD3WZU22
         P5piTr89cEsqw4SE13J4WRulwk1wuIT/wDH7j1TSL1Jz396hozIz7ZmqG94BnhTyV2M1
         hQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846524; x=1776451324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkOHEiyv4wNs2xK1MBQesqevDYPBfrfROxl/qZcMhl0=;
        b=NAZqrCjM82waWJtBqnU1hjZor1ECoDmGcVGKwzgUFqTW7xxp/rxXyDHd1SzfGdtKwL
         Q0lQ5QFZHmKdz43G69R5Tn0RDow5Zz1qd9zNlVF7p5fwCi+TBC3q/Aqf7J8UTRVwhNow
         S2mzH9T5AJWimA7gQodiKs3mRabFl32fjzx4/zdXzlqdswEKqlG4alLxo0KXeBS78HEd
         SamiY0847eLf/pxnQX2a9xeFDZGFjuDR5HF+JJWhJ6OR1duLgzJBS73++z8lLhJ9KM2G
         L2KZVYuDUllIuL8nPI6mPkeZcmto53rgqIbl+ZjcdMWh9aYSU3g1cpcwdR8yEYMLHCth
         NCHA==
X-Forwarded-Encrypted: i=1; AJvYcCU741MGUZ1/JBuV5soJU0huan4qMqGVElqwYWtcEJ4I3o7g6n4a+sLCEXkrZIyDCRyXzvaBwECYTVA3uslD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/j5mIbE0Qco9RLi8rllE6VjUQwZpnLcSJnPbIx74eRaPZXsb
	FjM5ym7HIXowTspErOF7kvhQtqoEW8mWizNKoZ548sEfMrIIgStlt9do55hwTEJOimy8vLPtpSK
	JcOyszY0wqVTQMOLGvib/bFadKPEKfVJCU5e7h7UUMbuzvotvOq2ucAbIxNQF3XToUGp/
X-Gm-Gg: AeBDievruAvishtA9Krkgc256UB8AQASlfX3FqhfDM7k1yhYenK3Zsc1n7nTtSQrc7g
	tgxmN0ktwQl7wQoFAMqVlAnvoNr8JOi1op+V76Kl+QiZptRa1Nqw/efGe8Sb1qYm+WMJH6uIk9w
	nVY8yIQfDsmRvHgjc/RrKzaaIL4cVcflCjyPU8MDyKq2wZZxxJid/eDO6myd0qgxVWLofPfgT6/
	Z+9QxnXKFjicbPMYXggRIgoTiXrJFBIXOLwhk7mEnfK9IN2TLOjnXUPRzZqNvDaavdbTyJTBVKB
	u7Q1OGsJ0OSGtUGepWRBTJenD+seLKtBTnudfeQHpZDVWeh0Ebh6ZXMagTfP+m4sE2UyeJC3UIN
	Us9w1zGZDoybO2SgGmnLgZsutgw9/apKQKs77P0A0a3ZZOlkO
X-Received: by 2002:a05:6a00:a223:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-82f0c299062mr4720884b3a.30.1775846523640;
        Fri, 10 Apr 2026 11:42:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:a223:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-82f0c299062mr4720849b3a.30.1775846522803;
        Fri, 10 Apr 2026 11:42:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 00/35] irqchip/qcom-pdc: Clean up register mapping and DT descriptions
Date: Sat, 11 Apr 2026 00:10:37 +0530
Message-ID: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX5ljeKSOw1dpr
 ENDTKnlycSAD3b+94gm0dLi12pRlBi0rthefxHzuv68KKQ3i6dep1q5Kd4CNTQXZ8EJbgFjyxvc
 MSYpibgCre3Fv7D8e/+iDtVyl79ag+6wEpRJALLzt1rAUsIjGKYb0ig9c/NW0Eh0MNxmrkHdd07
 PokChQukT68agoqLwzzIJd5uqfOp1TiuYhUelodL9qtdxTBZGWDbJlIMYDUOgWJDnQ13QDcSccQ
 bPRQhJFRbE9HRhu39nxvc6SoBNnVD2tVTfqyW5qG8k03yZIPJTmgIEvt/SJDibCOa7OBnJT9Yqn
 ZjvG9iXx0dNVloB0r7QEpdRoAQDD4ucOb81Eq6JVJb1cg00q5Sci+poJAFvONVcsh2W/RuXXgM7
 /E/wcnIsbszkJB5y6/YzmSR5tPXp9fzVmmzG27s8Q67VkfcNQVcGTaxRpYcRTdk7vBp7PnF+5gG
 yNp8Bry8SJDOda+NSRw==
X-Proofpoint-ORIG-GUID: 8Uijz7_hE663hRreJFvL6J35St8zJh95
X-Proofpoint-GUID: 8Uijz7_hE663hRreJFvL6J35St8zJh95
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d9447d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=W6bzyTRxDKc9L6jH1-MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102714-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18E1C3DB829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm PDC (Power Domain Controller) hardware exposes multiple DRV
(Driver) regions, each 0x10000 bytes in size, where each region serves a
specific client in the system . Linux only needs access to the APSS DRV
region.

Despite this, the driver was mapping up to 0x30000 bytes (three DRV
regions) via a QCOM_PDC_SIZE clamp introduced as a workaround for old
sm8150 DTs that described a too-small register window. Correspondingly,
most platform DTS files described the PDC reg as 0x30000 in size, and
several also carried a second, entirely unused reg entry pointing at an
unrelated register region that the driver never maps.

This series cleans all of that up in three logical steps:

1. (patches 2-6):

Split __pdc_enable_intr() into two focused per-version helpers
to separate the HW < 3.2 bank-based path from the HW >= 3.2 per-pin
path. Replace the pdc_version global with a function pointer assigned
once at probe time, moving the version check out of the hot path.
Tighten the ioremap clamp from QCOM_PDC_SIZE (0x30000) to PDC_DRV_SIZE
(0x10000) now that the DT fixes below make the workaround unnecessary.
Also add a PDC_VERSION() constructor macro and use FIELD_GET() for bank
index extraction to make the bit encoding self-documenting.

2. (patches 1, 7-28):

All 28 platform DTS files that described the PDC reg window as 0x30000
are corrected to 0x10000, reflecting the single APSS DRV region that
Linux actually maps.

3. (patches 29-35):

Seven platform DTS files (kaanapali, lemans, milos, monaco, sc8280xp,
sdx75, talos) carried a second reg entry pointing at an unrelated
hardware block. The driver only ever calls of_address_to_resource(node,
0, ...) so this second entry was never mapped or accessed. Remove it.

The net result is that every PDC node in the tree now describes exactly
one register region of exactly 0x10000 bytes — the APSS DRV region that
the driver actually uses — and the driver's ioremap clamp matches that
reality.

Mukesh Ojha (35):
  dt-bindings: qcom,pdc: Tighten reg to single APSS DRV region
  irqchip/qcom-pdc: Split __pdc_enable_intr() into per-version helpers
  irqchip/qcom-pdc: Tighten ioremap clamp to single DRV region size
  irqchip/qcom-pdc: Replace pdc_version global with a function pointer
  irqchip/qcom-pdc: Add PDC_VERSION() macro to describe version register
    fields
  irqchip/qcom-pdc: Use FIELD_GET() to extract bank index and bit
    position
  arm64: dts: qcom: sdm845: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sdm670: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sc7180: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sc7280: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sc8180x: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8150: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sc8280xp: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8250: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8350: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8450: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8550: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm8650: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm4450: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: x1e80100: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sm6350: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sar2130p: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: qcs615: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: qcs8300: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sa8775p: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: sdx75: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: milos: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: qdu1000: Fix PDC reg size to single APSS DRV region
  arm64: dts: qcom: kaanapali: Drop unused second PDC reg entry
  arm64: dts: qcom: lemans: Drop unused second PDC reg entry
  arm64: dts: qcom: milos: Drop unused second PDC reg entry
  arm64: dts: qcom: monaco: Drop unused second PDC reg entry
  arm64: dts: qcom: sc8280xp: Drop unused second PDC reg entry
  arm64: dts: qcom: sdx75: Drop unused second PDC reg entry
  arm64: dts: qcom: talos: Drop unused second PDC reg entry

 .../interrupt-controller/qcom,pdc.yaml        |  2 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi           |  2 +-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  3 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/milos.dtsi           |  3 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi        |  2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  2 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi           |  3 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi           |  3 +-
 drivers/irqchip/qcom-pdc.c                    | 56 +++++++++++--------
 25 files changed, 57 insertions(+), 53 deletions(-)

-- 
2.53.0


