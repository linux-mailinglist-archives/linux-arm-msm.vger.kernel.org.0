Return-Path: <linux-arm-msm+bounces-103679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP7sOUDZ5WlvogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:44:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B463427DB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D649D30413B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731CC385538;
	Mon, 20 Apr 2026 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZ7ualqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ipl1DCrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AE4376BC1
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670978; cv=none; b=Qjwu9GnmsbCAw8e8hBV4GYXP86nSIznNNfke6eadls+bcnQqRzKPUAY18e2earEid5Gvkx2/WAfU0ookTOlxgt2H7b5GJzOyZmvXhuk3FshpYGufcFk4r9zn74c/hSwpFBXZdy9HGZqFym1BBoxTH8nXBWQkLTtgjalyf1Q2fAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670978; c=relaxed/simple;
	bh=Gp9hl/qygyT8nufAcRH6NwgUpIKC+o6FY1Q5k14mclk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F6S6l4uow9KKNhmh9DD078up5TRDsnxfBsS0CBbottUlh3vhvLA1IdOdyPS4bSo7KM50tmsheSDOntKFKM1AdNaNHyuwMDvamX4GvglKpx843Jv/OBsZg5WMKlWeQ8VF1IHAvj/HgiHsg1zFf7O0uuuNaWIho4I9lOZKcIU0Zmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZ7ualqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ipl1DCrz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K79GfP1598294
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y9as6UYVJzlCPi2ljbc6Lf
	dgeuy7aPmwBy9AAlewefI=; b=cZ7ualqqs0b14WOrAk2RuJlLq6WxlbT+ZdHp1J
	21heqw3kgkioKqG5KqnjLf2n4XPTonMNuYFYlD8OixYk56r73SIxj/OasjY2QijV
	WD8yrxrvs2qEobS9h00oxu66+uYHTiJg8LJJ5pIGvwV9JmrcxacUidSBsTGqBLyx
	n+rqCBMXru3iZc3miUhuHs95Sudo8NsbXGE60u+/+uSx+LtrzIHsuLc3RaLd4TwY
	UFAqDl9av3miLdNB5eBYxWT+HeL6kIncykUYAZmH7NsWkobQxcdvUV9U/srh6yCL
	h567du212H50lNUDdK5LYbmlCQFiM+Jzl3rRDAtGAihQxP4Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgng6pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:55 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c20d5d7f4so4769199c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670975; x=1777275775; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9as6UYVJzlCPi2ljbc6Lfdgeuy7aPmwBy9AAlewefI=;
        b=Ipl1DCrz8LLyH0UpZ/qN9wnvWNK7eIwn8zME4thkvlIsRsI1nwX92Pun6jBltM2RIw
         V8S2v1bK0g8MLSeht5sY5Ub+ww5VK1m+OKfLxAIAR2zD+kvZ3c332+glAoFxCpjQmG0y
         XoSEr75Kz1QtM8EPdERFktRUFmz/QySgK8GfQn/DC8fhG5GpTarch6T1BfHE/YQLsL4s
         iXGNfAH86WeTurj5mHty8o5ZHBjE4McJosEJQbKbPgvd/iXR1QEUiR9DIMn5QJblMW4q
         jELW4EGRDpMswrMwRs3eQ/sg+9uMNxEzm7VGQ7hlk3i5YeVkhS70rpLLQMD75Pawvqzi
         S25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670975; x=1777275775;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9as6UYVJzlCPi2ljbc6Lfdgeuy7aPmwBy9AAlewefI=;
        b=KVSX7VOfNQeAYVMgcKVRSujTbl3+0DsIHvtN8ovp/tOqyeyzq+NmerJ2Q0zGtwDPCA
         2zAtUjvnh6GLutbPpURKLddfCVyqdChtDy6rYZ00Qgh48esZJoElPYYV4dq72NLGqaij
         a/w9zjqSDG/iSEKLYRG/gwwJW23Bk+XkjdWPnHLGuGb+LtGTcRHt502tkbvIysMUDExb
         DH+ofZtIrBQX92mwT1ccYCBhXyhu2UIXvsj/zGIS9LaQ/Owm5dSPuE/UwV+EPJdSHKYa
         fc1zq5Y2+V9NSEZPgf679xKUcfOBRPF61MQyVth5h4CZLs1DLSfG6MLIP7VWhbyzDx38
         pthw==
X-Gm-Message-State: AOJu0Yzy8mPCcRp6+Ir5rHN1ygOBzj+FCMG3deuUjcWheGeLXVon0dc9
	YM0wqnRKhI+LwFz0HoEYtRawty7Lv045JlU/DPy9ogPGF1xorxpSb8H8wY658hoWufm90s8Dy43
	WbwJj1gnYAwhs7Fi0pCr5vldKKYMOpicLhz9FRJYo1zjdT8TcFu0uoYOumpRkVRixO/Fq
X-Gm-Gg: AeBDievLUgyNueypr6PMlIN/KFObNS14QymIGDDqAdwjEyzBsnjcZAXvcjFMyf+u5Ej
	BPQKx8FoF9BddjFrwZLmnoPHcD07uZpU1+WdzG0Pb2GcdASNzrpmryG7fU7bKP0IxHohSaeulzL
	n3EPT/lA/2gXNLzUMW1N0u9VjxA4fJy2mqGoAaEi0s7hcFzCYknZNCEXMMjfjvXFdiZrow7AOve
	3T1U202cLtSInR/yHkT5S6rquwAdJLaldQ1r1922CmxfajabIpEC2zHI/MrkAvZjSHiN922/igf
	ZOUWqybsAMJ1Vfqrpjv24EekFzxJrKnnLr5P0QY/IN684a0skx3iaL+EU3dBTWMsfy8IKCYmnLN
	lpIU/dn2MJ9Vv+woWgMWyc93xxkLYr67gV5Kcsnfa3LogYlv643JeXCOukOZypkqyojETogxRcQ
	blqfU=
X-Received: by 2002:a05:7022:985:b0:128:d7a7:526b with SMTP id a92af1059eb24-12c73f957c5mr5685427c88.22.1776670975169;
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
X-Received: by 2002:a05:7022:985:b0:128:d7a7:526b with SMTP id a92af1059eb24-12c73f957c5mr5685398c88.22.1776670974609;
        Mon, 20 Apr 2026 00:42:54 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19866217c88.10.2026.04.20.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:54 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add common clkref support and migrate
 Glymur
Date: Mon, 20 Apr 2026 00:42:51 -0700
Message-Id: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvY5WkC/x2MQQqAIBAAvxJ7TjCpqL4SIbJttRctDQnCv7d0H
 IaZFxJFpgRT9UKkzImDFzB1BXg4v5PiVRiMNr1um1HlcJO9Im2Wvb0xRUSFuulW1GgcDSDlKZq
 f/zovpXxbuNaNZQAAAA==
X-Change-ID: 20260419-vote_qref_in_tcsrcc-c015dc0c2ae8
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776670973; l=2526;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Gp9hl/qygyT8nufAcRH6NwgUpIKC+o6FY1Q5k14mclk=;
 b=ASsH0+d130F38rzjqZx9LyYhFBlJkNSoHetHKiIix+pbijRVbsZsTnCqYikEFAu5S6U5nWsPu
 EFuTZukNSAxAlmrtx1SyCQz0kgw8cEbXHsb6Duvkre5NGmUP1GZWrjz
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: Jl5Yhh37CffRFO8C2s6M2Vrh2hTdeQIO
X-Proofpoint-GUID: Jl5Yhh37CffRFO8C2s6M2Vrh2hTdeQIO
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e5d8ff cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=gTLHQjeEnPAAWBE9dSMA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NCBTYWx0ZWRfX28OWHItEOYpD
 hv2IB0QjwifK0G0AuNV9uEiFcRtIqmh3G5iJad442Z4eqI4ixTvlfxRWAhClJgYRo2m0JBokpoe
 qzgKgOFroyq6t0tRvkd+0O5p41OYr+sY5zxLDAnFqSrfKeRgtco1wbXl2RS9GKqyp2lmKPngc5A
 HIBrxSlbMzcaeGDoBFRkxfUDI/96nRTo8brutiZ4+m6H8EsRvDxqVqvHVvqnQTmNJ5oWCytED2j
 TnDrr6dg03ssiBI7eIqhzlA4S1X6AtnY2xXO7b69/Ky41p5VkFkUCtHJNK8OJMioUpWLCzmkSCe
 bnho+iCQNXgN9iISTaEMJLBRmrKdIGp+EEBmAPNZyRqseHGseHjNU7h5KwKNmg2cCx/kCVYkVka
 6llbPhkAMpPJYMkPWxou4KTnvYlzPw2myrw99SiA1jIlKZiIILPOC4FWHjrcBt8EWOTA66AzoZd
 F2XjEBDIa91hq6JRUeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103679-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B463427DB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds a common clkref_en implementation and converts glymur to
use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur gate the QREF block which provides
reference clocks to the PCIe PHYs. QREF requires LDO supplies and a
reference voltage from the refgen block to operate. The refgen block
itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
PHY directly. Based on that feedback, this series keeps the regulator
handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Changes in v2:
- RFC tag dropped
- Changed back to additionalProperties: false
- Moved all Glymur supply properties into top-level properties so they are explicitly defined.
- Link to v1: https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (4):
      dt-bindings: clock: qcom: Add QREF regulator supplies for glymur
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Migrate tcsr_pcie_N_clkref_en to clk_ref common helper
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  40 +++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  19 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 202 ++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 340 ++++++---------------
 include/linux/clk/qcom.h                           |  69 +++++
 6 files changed, 424 insertions(+), 247 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260419-vote_qref_in_tcsrcc-c015dc0c2ae8

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


