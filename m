Return-Path: <linux-arm-msm+bounces-105256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG1KNKk68mlypAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:06:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1350F497F82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAEB9302676D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55542410D1F;
	Wed, 29 Apr 2026 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4LyWxxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSn+jtB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F2441B371
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482110; cv=none; b=GekvyMwY/QP2PapoPkj/DxiWUhqBJ6gXg65bW7pOdxmZk5RD/dpIv9iQZ/P/xyZn0jDCjmy2mzx9CqcHlQGZj50+iJI1lFRx6krYUl8Og6SmzLzGySPSNIdvwPLRq4YLaF3+p5wtOwThp/F9eV7oZ5NEkWIKgYGLAWZucfBfoqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482110; c=relaxed/simple;
	bh=SXa4NSNdU/XIj9zZigyMpKZ4wZlS2vJhYXIJ/TlKKfM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OMDAxUmoLmf+yCqTM7HX44gI8SLOVNeSXPglJnB98Dn+XmF1q123gi0JG3Gt6VkT7aQAToETMc/hOSm6nPCfVUGyYC0DmlkdV6JRaNOxMMS7rBqb71EK3OSJSYta0T0mKS4xrJtffByrUR30+0UHvBexseyn4h3k/hrIExBGaX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4LyWxxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSn+jtB9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF5AUB3752381
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k/k1EVZf1KXzwkXQ6Y6mGr
	bzNF1yCRYykNpkpO+q6c8=; b=I4LyWxxUTmh0r9izokM2KOb0oFQvB0dtvhRJ7o
	MIWDRR9VzBzl8XysB3O2KrO8R6lptrpR14KNR/kYnBS42GmUM7jIz0zxzKJQC+Oz
	1RgTwQzw8JvYuaWLdUbnLvwLJItpst1NjnQfkypXB7+tmoKgiInklO2/UFRmSBCO
	9XkDwGIIf8KGR8vjFiij/9rPdsNIMcl6+Uu06SScXCWnBmT0/lVDIBKX0bsaZTdW
	G1Gzn+V+dxkfolLR61q7CiUCzTgCJGM6lAyItt7s/r1x9h7lJKysIZ6CXS029U+p
	B0fvC9rsiDP37rr6Z5GXQeGUh1LTbMcJ01WwDtkGA1wfyjUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1jn33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:01:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249541063so45945ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482107; x=1778086907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/k1EVZf1KXzwkXQ6Y6mGrbzNF1yCRYykNpkpO+q6c8=;
        b=RSn+jtB9O3xCsH6pOgydwU8YJWF8oeVdLUGkYOUngWsxWI6idtmSlOOwyKFvnMc8Gf
         l0ljXfTVsXpqcJQTIuirxPKh2ODnfU0pAKzfarTDcf9wdEkhKWwhRXwkufIPE/NEOVSN
         cckt6ZHxKdO+GdBv9BiUCVczOwjHlf4QQfhH1Z50iPg1icEZqXvAPW143qHAeYFIfRg5
         /IN4DZkXbxHctU8gvFNLNdwiVsPw1Gkxckyq5JIADKa3Pml76TCw4PRG/rdE8r1wMyFD
         5SnWOQl7uuYhKAcj5SQRfv3KmdcU1r45sjikAHPJP2FwznP45XahLUPf7mCxnCOZWyUa
         UXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482107; x=1778086907;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/k1EVZf1KXzwkXQ6Y6mGrbzNF1yCRYykNpkpO+q6c8=;
        b=B34SB4ur3iYOgmMd95ldKZ7XD46ux5bro42ksJvLI0rQBqzRiNYfRy5LLEaIU6C/h3
         oNDezKtUw+FgQfP/IdlJAslWZjnBmYRJjJa7DYbdaLUGwbsusoYRTlNqzvTIZxo3mOgq
         w9bymyVFXQwK6i0XiZWoaBs6p0AXZipxF7aNnx6XKpA6HnZBj7EyqxrQtqqp8XtT2OO9
         IFmvle/frvXnV56C7UejJIXLYv6HrWGUXoAN+YP91LlDAS7U87kO0shgIfeZPhBTU3CX
         jwjV6UqCvXHnif/zyC2FCZqpNy7rf3YoM5OT56PPepH+d1synGHDq+9v8qODBhkbsTIS
         Er+w==
X-Gm-Message-State: AOJu0YyLFdBbq4IL32fbExOzms9h+JEQ63zyw2GpWSsMkIJ7ZSdWxI5G
	wc5/OBRxC7jdxF+j4BfKbFIRtjL2z9kgMhYt80wihCB8An684StS0C+0u+x+3LXhCQ91nAb6izQ
	wYHVVJt1H4/hK7AlR0hZWprIrIH8su0SAUo0f1pLbWntsYj4KFeKn7gwyejGTDcxXXbuK
X-Gm-Gg: AeBDiete5TAPv4DAvA6uyNIxUPuSKxl6oE/tVb9yxXG5ADQFv3abxzTdFIDS5HEZPSU
	sLuvBI3pgEHp2I4J7tPxFg5rX8OYOyzSFHi2HV+pJhCULheV3uEoICbo2WA0WGHGos+UcG6EWBb
	SSpl72PBfUFN33+nEzTCeKufb//c2DnPlRjSCqIMBBmlnOxHTRjcWz8DjoTs5Myi22fwWePNKPZ
	5AewMTVy6qTHorSTvJkBsX9LzFskDMW7OiyAGWM1XOBYz9UIW5DDk9zGlaDqAXWkEbiNWQMJ7nS
	ikj2/8vfxy9Shrv7DwvXNb5tCoc4qNuHn0EPoRvM4MYvSAluXHCv7DGPlbRNlEMQKRzBqLmVY86
	++DFlKIfc4TEyAvQHEEUjZj4RjwxiUTta0Vs15fSUkCG/++856hFdFTD5KxLzu33rxU9M
X-Received: by 2002:a17:903:a90:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b97c4c8995mr75298595ad.27.1777482106128;
        Wed, 29 Apr 2026 10:01:46 -0700 (PDT)
X-Received: by 2002:a17:903:a90:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b97c4c8995mr75298015ad.27.1777482105417;
        Wed, 29 Apr 2026 10:01:45 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:01:44 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v5 0/7] Add QSPI support for QCS615 and improve
 interconnect handling
Date: Wed, 29 Apr 2026 22:31:35 +0530
Message-Id: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG858mkC/3XOTQ7CIBAF4KsY1mKGPw2uvIdxAXSqGC0VtNE0v
 btQF22ibkhe8r439CRh9JjIdtGTiJ1PPjQ5qOWCuJNpjkh9lTPhwNcguKSp9bQJkYJ260ojVAi
 K5HYbsfbPcWl/+OT0sGd098JL4+TTPcTXeKpjpfe92jEKVGCNSjvmGNO7kNLq9jAXF67XVX5IG
 e/4xCWbcZ65dc7I/C9pVf2HixnnMHGR+aZCwZXhGhj84XLO9cRl4aK2zBoLwpoffBiGN/39MNN
 0AQAA
X-Change-ID: 20260324-spi-nor-09c6d9e0de05
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=4134;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=SXa4NSNdU/XIj9zZigyMpKZ4wZlS2vJhYXIJ/TlKKfM=;
 b=G98i6QTKkKi4+Bxo87HTfyTzT+uLlQ1DtZTgTG3Rqj8KVwRYPMcNwYs7f0t9zCiAMDmijwhGj
 Janz0fxJOKyBSKEOOmnZij/ux5QmMrULgiqEALp31RPzvYxkPoLUimb
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f2397b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=YsM2utnLYs980cnplJsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX74tRdNexPoPl
 ZrQeSR4iJJZBFg3GAUoEGlgshy47AFrebvMT02lyHtJd8mTgF/HuDIxYhVWi1Wbc90F+0FsPWs0
 bu+d+v6tlaSxkDg3s6OyAPYsDtI47d/YcOYQ560Aw3mmCMve2JAQ1ft3/IcrAa1E/nduQfhY9aA
 YXVLQX1hDGEy5Or0u0Dr70V2HquRdGlbk9UQxqmSHgdT5kga3OSP6hfZJWpEDBv9r2xjtsKdwvy
 Iw8c4NNuRu/TaakLzcs2LoBv6bPp1hsplmBGmAhsiaxZmecU+GS6BkRVhsy86lokx6aG4WI48Jp
 7KltZ347t09CXA289owfAijq4bCnyISYu2rFuU9BARmsZzZpMll8450lk9i3dQcaWgI4jI6f/bP
 6ew6vjtQeL3iqnpOiYMaBagh+40PgPXlPPTw06xCEN80bzkVycu2bhxLgcK65GViuBnQmpk8Rwu
 WPLC27h+wMSt9lpyVmg==
X-Proofpoint-GUID: L9g-72f0StzpPJ1OWNJO1IvCiHPQa1OE
X-Proofpoint-ORIG-GUID: L9g-72f0StzpPJ1OWNJO1IvCiHPQa1OE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290171
X-Rspamd-Queue-Id: 1350F497F82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-105256-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add QSPI controller support for the QCS615 (Talos) platform and improve
interconnect bandwidth management for QSPI controllers across multiple
Qualcomm SoCs.

The series consists of:

1. Add QCS615 compatible string to device tree bindings.
2. Add qspi-memory interconnect path support to the driver for proper DMA
   bandwidth allocation.
3. Add QSPI support to QCS615 platform including OPP table, pinmux, and
   controller node.
4. Enable QSPI controller and SPI-NOR flash on QCS615-RIDE board.
5. Add QSPI memory interconnect paths to existing SC7180 and Kodiak
   platforms.

The key improvement in this series is adding the qspi-memory interconnect
path. Previously, the QSPI driver only managed the CPU-to-QSPI
configuration path. Add support for the QSPI-to-memory path, which is
essential for proper bandwidth allocation during DMA operations when the
QSPI controller transfers data to/from system memory.

Set the memory path bandwidth equal to the transfer speed, matching the
existing pattern used for the CPU path. Enable and disable both paths
properly during runtime PM transitions to ensure efficient power
management.

Apply this change to existing platforms (SC7180/Kodiak) as well as the
newly added QCS615 platform to ensure consistent interconnect handling
across all QSPI-enabled SoCs.

Testing:
- Verified QSPI functionality on QCS615-RIDE with SPI-NOR flash
- Confirmed proper interconnect bandwidth voting during transfers
- Validated runtime PM transitions with both interconnect paths 

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v5:
- Rebased on top of current mainline to apply cleanly.
- Link to v4: https://patch.msgid.link/20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com

Changes in v4:
- Made qspi-memory node handling optional to gracefully fall back to legacy
  single-region behavior when the node is absent in older Device trees.
- Checked return value of clk_bulk_prepare_enable() and logged error on
  failure in resume error path.
- Fixed subject line style to match subsystem conventions
- Link to v3: https://patch.msgid.link/20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com

Changes in v3:
- Added missing interconnect-names constraint for qcom,qcs615-qspi.
- Changed interconnect tags for qspi-memory path to QCOM_ICC_TAG_ALWAYS
- Fixed suspend sequence: now disables clocks before dropping performance
  state to avoid brownout risk
- Link to v2: https://patch.msgid.link/20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com

Changes in v2:
- Moved allOf section to bottom of binding schema
- Added if:then constraint requiring minimum 2 interconnects for qcs615
- Fixed runtime PM error handling with complete goto-based cleanup
- Added proper error paths in suspend/resume functions
- Changed interconnect tags from raw 0 to QCOM_ICC_TAG_ACTIVE_ONLY
- Link to v1: https://patch.msgid.link/20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com

---
Viken Dadhaniya (7):
      spi: dt-bindings: qcom,spi-qcom-qspi: Add qcom,qcs615-qspi compatible
      spi: spi-qcom-qspi: Fix incomplete error handling in runtime PM
      spi: spi-qcom-qspi: Add interconnect support for memory path
      arm64: dts: qcom: talos: Add QSPI support
      arm64: dts: qcom: qcs615-ride: Enable QSPI and NOR flash
      arm64: dts: qcom: kodiak: Add QSPI memory interconnect path
      arm64: dts: qcom: sc7180: Add QSPI memory interconnect path

 .../bindings/spi/qcom,spi-qcom-qspi.yaml           | 21 +++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  9 ++-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 12 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  9 ++-
 arch/arm64/boot/dts/qcom/talos.dtsi                | 80 ++++++++++++++++++++++
 drivers/spi/spi-qcom-qspi.c                        | 80 +++++++++++++++++++---
 6 files changed, 192 insertions(+), 19 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260324-spi-nor-09c6d9e0de05

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


