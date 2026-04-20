Return-Path: <linux-arm-msm+bounces-103807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH9qHupc5mmtvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:05:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E95BD430889
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1765130A432B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F92E34CFDA;
	Mon, 20 Apr 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1fBtnRQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibZudol+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC78280CD2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702596; cv=none; b=aAzYQAOSQbsgcfSHDWyxLhOkfRywuwEptAFlIlmUnwulYHEtf8b0PP7ViUqctQkf36VV5dpAf8RMoR2VwqncHuuvXKS978fHsowwDP0DmBJi5sgETv4brWvcoABn2K6PTgRy7Vi/hb4Dv3kY2Su9P0uKcXD/EfHDVTdmc23jfT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702596; c=relaxed/simple;
	bh=R+cnwwKh6gMxYvBMtYkKztMY9ceDmfHMAWSwMq36ZjQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q7SGbYJlpbqh5s1tPgq33UnuCQqJHr/rh1HtbqYpWqThkT0OV7O8NyrvM2UOuXkA0PlA9aelcEWQeWz99N86I1FdDUtZtRk2M+uEv9wXpDahUzOjWMkp/aJ5pBzozW0Gpu94bvxLyZXO052PAH4MREumAyzlaQNT/QG1nyEYELU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1fBtnRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibZudol+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBdEas3212149
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sVskgqgdYaRh1WgsIQp10h
	RnRPGXP1X79hpcIG03a8E=; b=W1fBtnRQoq1p7JrrBLKoGTqC0B/esxHZE1aFqv
	vEG22iRmSeGhuGv84ssZ3/mnBB5ABZhfZ1XEXp8x9SuMfDN39c3vh30AKjlpHYVs
	UdaWN974lDpzbMr968YIIRdv/rk1W78tmZpdp96jZAUVXAiVm/XZXcq8gJW6K6fT
	COXUxPLls5UBOUopwIP74flLijOA4EyoSIMUlBV3+hu1cvkLHgrj6RLFDcfehX+f
	e6LDzFIC+ASogmOxpYc/4syd2DFSnmxceO3yTjY28iT2bcOufXnoMAv6IdKazT6w
	jcz/UiwqUvlTkrux8JywD1T7EOcvY2P0uszxfEt9ClOTmWzw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfjb3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:29:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso2092368b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702583; x=1777307383; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVskgqgdYaRh1WgsIQp10hRnRPGXP1X79hpcIG03a8E=;
        b=ibZudol+BYc9eL+VKOa7djQhHJUhhBFeKve7innJovDajReTZxLRtC9IFOSqZdrbsA
         D/B8a587OSwKU5IcuR0IwDIlHISsz0ESLQ3Cl7m7FvbeMD4n874Mdqrb4t8QxsuzgvWc
         bT5f4LHFlzSQSBJTviQfX51URDep4HQgKi11KhoNKiPcjIrFWNluO7f6G+HQNhjm4IpE
         ZZBWbMU4g78GY3msaoLjE2SYWz6H7aW7w6xOJx3sHuy4b9r2S/I8aIknl+urOKpEzPNF
         Q5HbUgvDkZj/5SVOUXtrzEyp0mvKdYdqwugcW58yt/SZMUeX/OtmX1bitOOacZdWSumw
         Me6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702583; x=1777307383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVskgqgdYaRh1WgsIQp10hRnRPGXP1X79hpcIG03a8E=;
        b=DVFAWComa7SXLspocPIFPA2guaObEBI2seCXIBKn+rC1b4SFbNsomQOWQHMAROTi7/
         kNbXdtmuRyzpaNSXnWfpdSDQ18x65eJF4J0eiEtfuiWBuLpgoixx6BKY751xbEGiWM6K
         pKnotjDnNFDFaHFtizgIG9nvM8+zjK2Myv5a/Yy2GMXcDzLrheXhc/lV0+h2YBo5aeAp
         7FWVyoK9EYRRmVVv2glYSlodV65Y7xiUsJ1AK6H6NoNpNcXYwQStCU9Kj8OeLTA5hK6Q
         vBszWANsC/lCCEtlXypchR+6GtX3c+MwqzuuQ5RuBB4am7fVOD+m3ZDikgNuyFQFv2l3
         fMGA==
X-Forwarded-Encrypted: i=1; AFNElJ98SvQ0JO1qfLKKWWq+wGGEV4s+CCeHPsvLbvS5xpFpN1r4kSuhhuUeNcHwQH3nByT7MF3TnQpjREMziZNp@vger.kernel.org
X-Gm-Message-State: AOJu0YyAIG88QdeqWhvWVvrb3vrSBsOapdCGzjlqRLwEhO1AblqXLDrd
	1jZTD8EIgLhlufm9F0B9n/7DUXnwF6nKPGgZqhMjfk/12sQJB7EC4ufkU54vWSM5wziWoE0SxLg
	1CtXGEcekkEhbhfIe07UX0TaaMEcA9OwVuYAo3GbXeIlCSoZCo6mwgjerNXiqR1aFEQzp
X-Gm-Gg: AeBDieu4dLspVpsT9JEaEUjnHdxVFDKQFPfLnvOYSUjvq/JyBCQoq8IdLO57wtXEHnC
	QCXZOIuLtmYsmQ4n2AwU2HkI+LTK7r5h7plwkt//hwX9mZfrPOiufLlTvyg1KesT86TpRcRtCOE
	EzXTbXbM5bpz16Lk/1wkn+SUc3iXu9MYA7J0hfuRcdeoa9YMnJi5O1XxsOQph2aKx5SuKco3cxK
	Mg97OdFZjzCxppC8Y82N4LhA+WNyJO1GBYPwZySr5fS+nxF8+G7KIvrwCDBI36qB3uAOfpkmhgf
	1FTpmXWspC01BeoR7DkguBpwGJDoZKQZ5SrqjEBU6QMCtN12TTrZA6YxlSde+85tnTXjpXmQK1F
	Q8VdLWHi8XTP3lTljesf8iFDzcT+pbLD/p/3+ZpuNbTV3u9M96xixoJFSsLejFig=
X-Received: by 2002:a05:6a00:850b:b0:82f:948f:d1db with SMTP id d2e1a72fcca58-82f949f19f4mr7553862b3a.44.1776702583131;
        Mon, 20 Apr 2026 09:29:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:850b:b0:82f:948f:d1db with SMTP id d2e1a72fcca58-82f949f19f4mr7553834b3a.44.1776702582586;
        Mon, 20 Apr 2026 09:29:42 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:29:42 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 00/13] Add support to control clocks using CESTA Resource
 manager
Date: Mon, 20 Apr 2026 21:58:53 +0530
Message-Id: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVU5mkC/x3MSQqAMAxA0atI1gZqbZ2uIi5qjZqFA42IULy7x
 eVb/B9BKDAJdFmEQDcLH3tCkWfgV7cvhDwlg1a6UqZo0ZNcDmVraoUTy+k9WjKzG2s92pIghWe
 gmZ9/2g/v+wEZawYEZAAAAA==
X-Change-ID: 20260419-cesta-sm870-dispcc-5e4fab72b53e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX0bhZvOwb068b
 UCWuKQ6ezjN9hsVTbITJ/h/+Gj2QD7AKet3HrtlkX/CMknYlTnaAQE1YrftGIMSk4ubbJtQwHBm
 LPN9/EAOwzwEvRM95mRazZe5ZPfEVjr8tlghXOvOhCPo+F53psYSxG1pV6gwfl6wQuvcVJmmwqt
 VIvf2V5hBzOPVYjtCGWYw9MPjDmBkexh21ZtnL8pYZpbvNW4pYI0Eijsn7rON/CSOqsA0+ThD0J
 UimlXuBAwf4/pjxgh/lSyynOwcbaGrKEbzfb/ntTUjV9wNOTYrrXLoBF5U8B96f+H6KVVjTeMVs
 Es9dGqtM43/4Kc9DRErZbH2t01wsjnU31RnYmHkyX3SWwQcs2gCil7QfOuKjhQrrZktSBXRQA4o
 I9XmjzA+2i7LN+AGCoUSCSZxTwvgiFic15fEglQ4hAKIvsrr4GJ2aBOB3qvZKBRoacOzUNCh4Mf
 oS5fFaaUwbbtHOFbmrg==
X-Proofpoint-ORIG-GUID: lEQBGwBZ889XE19pUbj_A6VUAcU18xx-
X-Proofpoint-GUID: lEQBGwBZ889XE19pUbj_A6VUAcU18xx-
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e65478 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_r1upjipn-BL6pxEU20A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103807-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E95BD430889
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for managing SM8750 DISPCC MDP clocks through
CESTA (Client-side State Aggregation). CESTA provides resource management
(e.g clocks) for local subsystem resources.

Without CESTA, the clock driver directly programs the clock tree (PLLs,
RCGs, CBCs). With CESTA, the clock driver instead sends a performance
level request to the CESTA Resource Manager (CRM) driver. The CESTA
hardware then aggregates requests and scales clocks to the required
frequencies.

Without CESTA (direct clock programming)
----------------------------------------

+------------------+
|   Clock driver   |
+------------------+
          |
          |  programs PLLs / RCGs / CBCs directly
          v
+------------------+      +------------------+      +------------------+
|       PLLs       | ---> |       RCGs       | ---> |       CBCs       |
+------------------+      +------------------+      +------------------+

With CESTA (clock driver invokes CRM API's)
------------------------------------

+------------------+
|   Clock driver   |
+------------------+
          |
          |   sends perf_level request
          v
+------------------+
|    CRM driver    |
+------------------+
          |
          |   sends received request to CESTA HW 
          |  (CESTA HW programs PLLs / RCGs / CBCs)
          v
+------------------+      +------------------+      +------------------+
|       PLLs       | ---> |       RCGs       | ---> |       CBCs       |
+------------------+      +------------------+      +------------------+

This series includes:
1) Base support for the CRM drivers
2) Clock drivers support to communicate with CRM and control clocks via
CESTA
3) SM8750 DISPCC changes to control the DISPCC MDP clock and display PLL0
using CESTA

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (9):
      dt-bindings: clock: qcom,sm8550-dispcc: Add display CESTA support on SM8750
      dt-bindings: mfd: syscon: Add qcom,crmc-syscon compatible
      clk: qcom: common: Add helpers to control clocks using CRM
      clk: qcom: clk-alpha-pll: Add support for CRM based PLL ops
      clk: qcom: clk-alpha-pll: Add support to skip PLL configuration
      clk: qcom: clk-rcg2: Add support for CRM based RCG ops
      clk: qcom: common: Add support to register and control clocks using CRM
      clk: qcom: dispcc-sm8750: Add support to control MDP clocks using CESTA
      arm64: dts: qcom: sm8750: Add disp_crmc node and CRM properties to dispcc

Maulik Shah (4):
      dt-bindings: soc: Introduce device bindings for CESTA Resource Manager
      soc: qcom: Introduce CESTA resource manager driver
      arm64: dts: qcom: sm8750: Add Display CRM device
      arm64: defconfig: Enable Qualcomm CESTA Resource Manager

 .../bindings/clock/qcom,sm8550-dispcc.yaml         |  48 +
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   2 +
 .../devicetree/bindings/soc/qcom/qcom,crm.yaml     |  83 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  23 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  15 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/clk-rcg.h                         |  23 +-
 drivers/clk/qcom/clk-rcg2.c                        | 242 +++++
 drivers/clk/qcom/common.c                          |  93 ++
 drivers/clk/qcom/common.h                          |  57 +-
 drivers/clk/qcom/dispcc-sm8750.c                   |  89 +-
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   2 +
 drivers/soc/qcom/crm.c                             | 996 +++++++++++++++++++++
 drivers/soc/qcom/trace-crm.h                       | 111 +++
 include/soc/qcom/crm.h                             |  72 ++
 17 files changed, 1834 insertions(+), 36 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260419-cesta-sm870-dispcc-5e4fab72b53e

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


