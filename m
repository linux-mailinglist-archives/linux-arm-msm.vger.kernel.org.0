Return-Path: <linux-arm-msm+bounces-106751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHUQEFVy/mmjqwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:31:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E00B34FCBDE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01D943018BD3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88C4363096;
	Fri,  8 May 2026 23:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgO4mjZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5SFyknb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0C231D75E
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283087; cv=none; b=bZ3IQP2Z0p071IcxfuOanOp4nJnYeYNJ+uEjoDWh4127R+yF7O0pQfpLLjezJWBMP/kxfdWm8VFjs01BNfZM6U8GcCLN6lHDaEBjvLXf82p9rohIgHaC2nUI5qfE1tuigVmKSJH6PZ7aD29P9ymqeC2OB48P1FJG7n8kk1QoCzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283087; c=relaxed/simple;
	bh=FpOZVILuZdKgJAFxsw9h/rPIUNFgYb8dRtvt8QqP9Z0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O/E1FlLtv9wXGwbW20qcZ314YmoPBWefC74K3pyM6sFFt4x780BurvOrxRv1Rtq5IZSzJw3beTNQhYZ5aLMkRQXRkEbeMfReFZ1XCm5vA8oPCREwW6PlJcdaIC2P6i527SZPBVmuMJTMkkTKpZ8nvi4LO0z52XWDDky/SQrgdwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgO4mjZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5SFyknb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G2wXK724365
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4t92/qX9kUehyfMH3mnM36
	DEtVPBgU9oqlpwHP9gFjs=; b=MgO4mjZpb9vTRGQpEIzHi1/5l83GFRdVDU4IKJ
	hd4AjQZVKpvd0bEOUbD63Gej0nUspthiQglmKa1tD/4KQ160uDXBqi5/CbC4H67e
	i/WfntjqvlES1kQ60CykUDr6buYwSHm5zE61RHkeg2b4E7cx9MogoNoMk2BwneK9
	ydMWAOeymQz9RY3P1WITD5NJkNSJ4SjaUt47zZ+nEEuzMSJDg9dOr1YsFvSBtkNg
	2dGzD2rHBqXGgjH7Ts5dFMwzg0uQEa794QOYnGdL77CHHMlEYeFIqoz1KtvlcEsZ
	ArnL57uVJojkQgFLzqSyPJHbxscaNdi0SbvEBzSUJ0SJOPdw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0uhb0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:31:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ef37c3f773so2972583eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283084; x=1778887884; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4t92/qX9kUehyfMH3mnM36DEtVPBgU9oqlpwHP9gFjs=;
        b=J5SFyknbdq1bwEkRSuAC2dfcRF+X3nqOu6/yiF1eek8BSFYiR47bByYGpoPl/sByZ6
         QmaTFScLcVU1HQOrg9iTeGjucL7ZTr2sicnqgj8d/vcEKyDg7VYFId9fV78iajIdxX2t
         MmWmvYR0w1EvY+PF8o8DYQhpD+GH247cJOL6LHq8qQ4BKv0G8/OwdMEkR2se4mH5xicb
         p6fbmvYr5cd5v5DgrRctNt/wiA3OUkRif7W9VPGpqrTHI41H6rhmNN++nVEybwK5afSE
         8XcSjweyhkAI/0FssDlI9EEhjw5d390QFDI/gXOCon0qQHVBDF4+B+UTNjdc2J2lCkBe
         1UWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283084; x=1778887884;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t92/qX9kUehyfMH3mnM36DEtVPBgU9oqlpwHP9gFjs=;
        b=YQjHR67cJCth9UAP8pYVmWu+8kHu/wCVUzv2xX/WOkOcTkfoSqh3dzmUA3UmwSz+dt
         dirudANuVIG0T1kWaV38qTZTA7u+a/jFBNaNdU5FAlnOsvMU8+IdKKLdZa2nIODl8OZ5
         CHVhemtM7Y+xqxXfTgomRhO8yQwrLb/PUbb5a+tyVrAuoWqCBxoMNIHbDC65uRJmBoVC
         PPlxESkacWU1rudkwDUmhCSi+e/H5kaZxFpS5ltJbOabCelHD2NAQFxpEV+vRHncUT+2
         eYQZQGfzN0GrPv2keonp8I+XC1j0gbos262ZeDH1JE9qq0RBajfeLak1vTE/1UVuxItK
         e2cg==
X-Gm-Message-State: AOJu0Yywhsv3qHUHuQULXhSqAhDiATco+oiOZzvuwJd9EiJOzYeTKWib
	c3YFeUpp8Dd4OPc4AW56yAVUl4kSLe8pXZFGaJAdaEiWZc9iJPI3Our7nCYWNawR/WrCW2Rg28Y
	2BclEj0kqz3hSQxbXgfVaPnSZlPGcc+954TuFbslxKBOsuDmfKObpflc7MAAlqGL/igUN
X-Gm-Gg: Acq92OHNr2a5yNg2FP/spmh2xA1oMWRxkprDuGxRf1jceSH6oLmcJ8mllFf4J7IsZM2
	lz0/yi+/6jsIniyys8UpAgQq7TnJW+0D2k6ewRg7MaT3rB2dwHE7C/yyMN0qfy4Wf9827Zh3qDr
	WzfCgIpowg2GkOMONtLRDLM3oJ7+rioA+/fv1Pi3duU9d6plSWLbEhBkw8X12a8DrB2PzuzVy6v
	Inm7WqlZmh+KsfE9wfR0UuFPyzh+oUZehLb0eivdOI8r/WiYXoEKw+EW/yvqGqlmQiHHAOClOGX
	vFaFa8J0O6hiI/ZGS4CGw3E1l1pqDNHlnSwjhiOvnm4VOeupoAreyduoc15EPV9ck2uv7p6GKEV
	c82dwx2LsdRe79GIdz+XcaEuVQcBP4eKCcPIodk+U8Xaio6onSJSYy7CxL1U=
X-Received: by 2002:a05:7301:3f07:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-2f54b57793bmr7581889eec.34.1778283083894;
        Fri, 08 May 2026 16:31:23 -0700 (PDT)
X-Received: by 2002:a05:7301:3f07:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-2f54b57793bmr7581871eec.34.1778283083309;
        Fri, 08 May 2026 16:31:23 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:22 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH 00/10] phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
Date: Fri, 08 May 2026 23:31:15 +0000
Message-Id: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERy/mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMz3YzE8kzdgoxK3YLkzFRdIwtjS2PjJBNDQ+NUJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAOIItllxAAAA
X-Change-ID: 20260506-hawi-phy-pcie-283933b4113e
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=2557;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=FpOZVILuZdKgJAFxsw9h/rPIUNFgYb8dRtvt8QqP9Z0=;
 b=zISOr8IB5ta3VgjDqkWMsbaZncXLlgITdeAIOxr1F6HLT9iX94noIF3XhYRlttW32yw5rlE5m
 DAb3mVjQeKfCTa88BX+irQNytlAtLaNU8tzuew6K2KAtfaQ+l/vmAye
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe724d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SUFyVy6k7XmgMTdL_LUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Z0p4GhUbSgSguHTLPg88zJ0n_b2XK_my
X-Proofpoint-GUID: Z0p4GhUbSgSguHTLPg88zJ0n_b2XK_my
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX1dugZ60bq8VY
 NhrqHYKq0OjTH60vIsdhvlRJwpN8rndfNvIX4cmlkiVSDiI68ulKGETefMcsCxD8K2ggK2NHbcW
 VvIeEBfGUBvpuBP3WChtf10Ma03RwH/0BG+IxDsl2XCDEKh8HU4XbvWVzCLm7ItoIeiJ8abNdOE
 X7i++yeJhdapGuHeimZABkw1yymM42MesBycSwg1CVGvIhTipfxZCX9HtTgDaMYP5JG7LTDE+VT
 jg+PrpjAEEgYt3KsJnvKNUfZOMNu9uEmN12pI8jXCXi1GuvRJeIOzThg6BGLixB2ZqOGEP+h5Lj
 UygpmwcMrECqZVKN4Qr4XWnoR1k+Vh4ERtavZ7ICyqOKKA4ZejDFlIkYCiO0UNLu2eUYWxGKI9a
 e6GvX07GVaMo1V8LsxRvNZCX9hq5Jsmw1oSS+orECOjm5VXzon5nY0l+RY0ZW5Is50ERMqhKEjy
 WA3KkrJp/ZqB4whV5aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232
X-Rspamd-Queue-Id: E00B34FCBDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106751-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260506-hawi-phy-pcie-283933b4113e

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>


