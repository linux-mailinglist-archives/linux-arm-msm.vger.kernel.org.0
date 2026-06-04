Return-Path: <linux-arm-msm+bounces-111089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3266GubVIGpO8QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:33:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B44DB63C358
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:33:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fo1ujcOa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iaaXdt8C;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111089-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111089-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7140C30207F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 01:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5241F30A9;
	Thu,  4 Jun 2026 01:33:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F1418D636
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 01:33:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536803; cv=none; b=LqwsXOv/hCSYypemsfjUWVSi6TtcwKl8NQ8HIzPd8/HPdrCyq3zDes4QqLqnY3NzW479u3AGRaiPYTvift5hSuFtL1uLXq3sY23IF3wldWhYCxxr/gFo9RGN0VUpkmlahRQk3fry6Z/4M4ElYdoVsWTtAZ22C5//JvFF0vmj3q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536803; c=relaxed/simple;
	bh=uTCKAOimS1e3IAJT8RyhpxQQI0cr7ZclI5yzTrMleqQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OtiYHYGKdk6Eg6HDF7HjsHQESQZQNWqfMG+hNwJOKP+1/LTEHuJtS5WlYulkwBqZMMTu1b3jjLWBnOOd2xm5aUEQMY6I4B5cA8pz4+HnVsVpn+zQbVGeqsFwDddNV0aeJId5nKeBcoZzSJnS2C4b5G8FcYa8q8+NEjjYfwkbJCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fo1ujcOa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaaXdt8C; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540tu8n598150
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 01:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=17PcoNEeNo90Qm4iX3hBk8
	teNDLcrwWXo6ltz+wsj7M=; b=fo1ujcOalTQDpF/eq2+Z0Z52zTm9Xp44jCswuP
	k/SRSAMzpmot8VcqFC0yEXonuqkiUqsSLctpV6yHSTWWGTtGDRfY/XrIWR8tLbG7
	dIpeOwtQbHx9pkBnYAN14yf10t2fU+WiCI9ou2+PS4SXP191cutfqrUOsgODrMRw
	7bFmXu0MoHte303a6Icj6WD4gSxrHbCMcnKaOz6wvb5wav+OfEDIZUj32Z12s5QA
	qg6pq9WJo2ccFzQA7f7tm2MVtz6YETti/AUIaXqAaKbXqFqCW2CtLVH7k8D7SlfJ
	IwF3bCgdgIt2FJc1YFa+mqcFprE0HuRQ0mby3leqF8la+cyQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m0319-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:33:21 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137dd5100c7so267925c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 18:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536801; x=1781141601; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17PcoNEeNo90Qm4iX3hBk8teNDLcrwWXo6ltz+wsj7M=;
        b=iaaXdt8CsJZlAml85UCUs25eghlyI5TWfaAnIfH5FFi1C/+Bo+c9aRKIm4wPjH+CbC
         PZs4ZBWLT9HWE0dcQmTLaR5DpYIKkZYiCSiJK0CNxcfnN5lBBXBriNCqE+viuML2eKTw
         mF8fDh0e0TYtozltQ3nRrB2JQ2S1zPNZaeVSJziRO23zwF/eOFB3m6RrVh2LaHg9CKCC
         fKaI9ix/1PU97M/oytb1vvyqwabt+8Ym7fnhyGsffxSh1vtxmugvcGrTsaYK4ntkmYzM
         cUTF1CI9C/Zg4mTPvvxNvbvdFpS+afJ0UmdRw/yC8Ru0LOdmWj2hQ0XEqOXzpbnZ6VNp
         QxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536801; x=1781141601;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17PcoNEeNo90Qm4iX3hBk8teNDLcrwWXo6ltz+wsj7M=;
        b=BYUcvlcGxs6dMKRrMpy1Q+DgCy/HgOITyJkG2tulero3a+k5T0pymV9x9UobDZJQR6
         vKLM1QL7wx90E06HiGMe6nlUoedz+EPOesB/fqY1nWIx7weA3tnTl0YVLhODv65BsXEG
         7BVqiZ8Jtt1qVjO4LxGat8AMaispgMCU2hR8+nyiXd/LCU+cxN+4VtT6hhXp5Jw2r74U
         aEp9aS7u8FHIrAu2AW2e8ln1lNtbxwSa6ijudyR93P8w5/pJbAfJ3maI6YxvBQxFZARS
         F8CSP7QEDi4O7yCx5wgnKaiPyU2qiDMCeM1pR3HZNSdCGq+eD0Yrw3ViWccIt1LGwXvN
         PPDg==
X-Gm-Message-State: AOJu0YxksNdkzD5vT/JecFi54ioFOgyd+ZK7Un8BKOeBE2sIbvawlVOP
	DuTAGr6cWErCyWA+G4KCV9povkoU0Sm26vLIEWfvPeRtflaQkgXTCEtRYp8t+mQlpQeDK6a4bCj
	EhfQNi4p/9f3qP+i0kOSuzeY/elUsePlU9bEqCoCL6bsqSp8Vwpfh8M2QvbqlbLhEEoepA/mQuR
	gM
X-Gm-Gg: Acq92OFkdGtslMrcd25s7NzR86sdT8Wesy+/b3CodnTtB+9NlIFaQ1D8e9D2blKp9sX
	ZlRGqFBL5F2JhIrdmRYTW/S7gNBXLx5Q0IT8FHCBWl8tIirP/qj8OziFDiH1Pt5PEpBU5rYoYm+
	jRtp2HOv/JUcZHocOO3nGEVJgP98/ocCooPUwgHrHUuqqGdj/VP7CtyBcL4IPriSlsHuwI1A9OH
	ohU9m+EH98WZHzjRuxW1CpHvtKw6BGGWJz1nZp4afogZCC4MArH3Qw7H8jIihVJdoHKL3PmTchv
	cUNuoxxRq0SCS3PrYWmlTwwro/BeJ5wkNnJe6y6qH/UgiMRehZuXv5xJps0X6tzWnOJWLTyJMYl
	FaQaePQAQFSdU37qXIgL6CggbTW6Bmi/yoRSMvj4fzD0naPpWDh1r60Gxqxd+QC/1qZ7kgA==
X-Received: by 2002:a05:7022:1b0c:b0:134:fea9:f107 with SMTP id a92af1059eb24-137f6bd09camr2140783c88.33.1780536801116;
        Wed, 03 Jun 2026 18:33:21 -0700 (PDT)
X-Received: by 2002:a05:7022:1b0c:b0:134:fea9:f107 with SMTP id a92af1059eb24-137f6bd09camr2140762c88.33.1780536800527;
        Wed, 03 Jun 2026 18:33:20 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:18 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v2 00/10] phy: qcom: qmp-pcie: Add PCIe PHY support for
 Hawi
Date: Thu, 04 Jun 2026 01:32:54 +0000
Message-Id: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMbVIGoC/12Nyw6CMBREf4XctSV9AIIr/8OwgHqx1wjFFlBC+
 HcLxo2bSU4yc2YBj47QwylawOFEnmwXQB4i0KbqbsjoGhgklxlPecZM9SLWm5n1mpDJXBVK1Yk
 QCiFseocNvXffpfyyH+s76mGTbA1DfrBu3g8nsfV+7vzPPQnGmVTHOi8SlapGn6338XOsHtq2b
 RwCynVdP5LDLqfDAAAA
X-Change-ID: 20260506-hawi-phy-pcie-283933b4113e
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=3318;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=uTCKAOimS1e3IAJT8RyhpxQQI0cr7ZclI5yzTrMleqQ=;
 b=y8pI9fhwl74kPeC+ouRPoY00C4rw66ueKur/P9ExNw3XdUoF/+dyqbO4Mq2iOdXplm/hJMmew
 2zXpR44WGJVBSah8G000oG3ontyhBmI9upH8Oq2K7z/WTmYnhlxZlN3
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a20d5e1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=JfrnYn6hAAAA:8 a=lrmUyyXwqMAXkeg-CF8A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX7Sugvxp9e53A
 45HjEiNlBy2Sz0ztmtWNB2tEfiokfIBg7fL/HcnX7AVyHBS7ENeQwUZf7jplkpo63vqXBKSnKNj
 FTeJKyMHIW5mXuw+GbAnL69j0uLzyHcon0i9Iq5JMKT+f0cj4Fx9JYVLcIzMjqlsPPrI8goRdat
 +tfXaa2F5/gOAvVG2+bdkbGg16jGs/oR3/EL4RyXICm5hohgRRjVDR0FJ5vth2tzZRqIFeS3APV
 FGC/XGKm/OD0yMa+QunWyVT57ujV2ttw4jtFOPsz7zMWlgfLVoQzXvNAeSHpf4k39Tx7ngNdmZW
 frtrH/ZrECMPjuOdgEhTVcCO74Z9tEkd0KEAuZQub9RKTbW3k1zliHGZhuUhF4XJEqhDx5YC7iK
 9hoQVLRCfVzU07mpPt0YkPvI0UA0342g5pWGs1nSUfjRVLAmsayQ3deruqo2BCrUD9lD8ivFJKF
 c267O2pbjUAEN/Z8Y4g==
X-Proofpoint-GUID: s0-JOt2LVhKzAH9g8Dx07FNxZwwzlRYd
X-Proofpoint-ORIG-GUID: s0-JOt2LVhKzAH9g8Dx07FNxZwwzlRYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111089-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,infradead.org:email];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B44DB63C358

This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.

The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
v10.60 register definitions.

The series adds:
- device tree bindings (patch 1)
- v10 register offset headers (patches 2-5)
- v10.60 register offset headers (patches 6-9)
- driver support with PHY initialization tables for both configurations
  (patch 10)

Overlap:
The series has overlap with "phy: qcom: Introduce USB support for Hawi"
by Ronak Raheja (see link [1]). Both patch series introduce a subset of
v10 registers (this series for PCIe and Ronak's for USB). I have
coordinated with Ronak regarding the overlap, and we can update the
series to resolve any overlap based on the order of merging.

Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Changes in v2:
- Rebased onto v7.1-rc6
- Patch 1: no change (Reviewed-by carried forward)
- Patch 9: rename QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG to
  QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to be consistent with the
  naming convention used in previous pcs-pcie headers
- Patch 10: update usage of renamed macro
- Link to v1: https://patch.msgid.link/20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Matthew Leung (10):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
      phy: qcom-qmp: qserdes-com: Add v10 register offsets
      phy: qcom-qmp: qserdes-txrx: Add v10 register offsets
      phy: qcom-qmp: pcs: Add v10 register offsets
      phy: qcom-qmp: pcs-pcie: Add v10 register offsets
      phy: qcom-qmp: qserdes-com: Add v10.60 register offsets
      phy: qcom-qmp: qserdes-txrx: Add v10.60 register offsets
      phy: qcom-qmp: pcs: Add v10.60 register offsets
      phy: qcom-qmp: pcs-pcie: Add v10.60 register offsets
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 382 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
 11 files changed, 747 insertions(+)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260506-hawi-phy-pcie-283933b4113e

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>


