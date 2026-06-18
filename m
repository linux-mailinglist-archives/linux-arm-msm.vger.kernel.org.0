Return-Path: <linux-arm-msm+bounces-113793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f4wWKispNGoZQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:21:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C1B6A1E4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:21:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dZPMMwbI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XoqKNGE9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113793-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113793-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0407300AB22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 17:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7229A2E7365;
	Thu, 18 Jun 2026 17:21:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7F145BE3
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803290; cv=none; b=CQpHoElqnOYPVX0OqTK0uqPyKI27K7dwnumD/IxqSNgFPW+qDCg/qkCOwW/gp8dZ8TmMuR/LsS3Ioi0/ndKoE1k6eQCpfn5yyDZI6p0u7AqZctRPWuGDDWdKdueYXJz9OUfMgAUgBXRbTd9OZ8bUPjZMGZ3/KZnqNOyeywPijIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803290; c=relaxed/simple;
	bh=LCqQueoooqk1QVlkRvPlmTHpiHm8HjxSiH78KPzgC40=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vFA6XDnH99JnKM9LMksrS0zARUJbj3soVL2sp9yYRwp+dy+Tr6r0/R9h7YaZVBqs8lP0EIVIgVzck11J/wwcLe3T8tvVwbX2F6pxzt1AG5DDvStObHGs24PCrkasP/7J4oWv9mHO7rQHSQu8m+sLW1bdUH1/hzOCuXINVpQbKxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZPMMwbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoqKNGE9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IG4LEr1631858
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TPaQW4JIBNiyx9NXi9UMuQ
	jkYUZLH9jSR0WJTcNOy8U=; b=dZPMMwbIYv3uVzmP8YkVFhpnuZTOP200JY7Pb9
	ooDtdhAz7dZRFXxVKXDTcAW+uGdFJtNjWt0D0vy0pbTrEXGheyYIs4dDYLefHdpH
	YckYIjzq0YCc4MykVjBYQWLKcbjEZphz5GLWCI+fyrxSr0z+GeSbjbu1JfgDFyQu
	HcbUodEPUOEeUczES3oKV9Pzfb4JzCq67oRHYBpaSvaevw78Zg0zl7F6VDULQOFY
	Clki7w44UhKmRPG9BeTKhK0e/bA163NXhG97f0DtzYH93WWLPwlz+3qT3N0R9I/2
	r3jHzIGfpKdsB5j3kAoqFS41QqhwsUE4jm+AxdUgTKMp+8+g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evkvf0b4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c85c9ac50so1077880a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803286; x=1782408086; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPaQW4JIBNiyx9NXi9UMuQjkYUZLH9jSR0WJTcNOy8U=;
        b=XoqKNGE9Gj7cSIRk3UpyXLIW5Cdc6CLQmlz8zbO6S1P3GnjDt1C+ZXT4ENuioVh9iu
         mPbhfMtFo2UjbthIkTUKYvGYlYK1peZ2Y88riX0lUpU0+/vi8rOLF4GAZpOb55Evhl5q
         FJGeU3jHZsbjOSVlek/yxvxDi3PIEGhqU31rxI29nr2WQk6t+dMnfCz448u0Dt4Sdjnu
         AImIELagBi2HXpavIxyWcQoti6ffvo3CDM4aKfZGywReYPsfbUO4h9rr+fZE5l+kSHYF
         N+7oaawB5/3152YMaHiEAJmasXkMV0TXUHymeM1nn4oTQZWfNb9MKYwtWDlRKuO0di3p
         xsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803286; x=1782408086;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPaQW4JIBNiyx9NXi9UMuQjkYUZLH9jSR0WJTcNOy8U=;
        b=rdKsgxdUKu/AcaJ9Mi9CO6I+Tk3GTlCpiNyqs/cKpM3xcR4DlW/k0tTfqYvINj8xKK
         Zq73VfvTLsHy5jUBrMRxofFM9dX95FPiVwEX1LWY63Yb7nXPfSiwr6VFmATSbquqXSIz
         3u2RsQ93L0HPDOhzoqVNlxpWf1+4bI8Qzag0B6SXfq7ooBScJ1Vj6ueSjm4g/EaPT51m
         sSTON0tuQwROpgwHtF6LjKyHOJvCGBKYTjqaeuGWojw8v+Ie1W3Fb3MJiyOpHCN9fkLI
         gp7y/4p7juQYYCODJ0t3tnH99cYuPef7mSaNVr3XWuTq1Tf4WoJjWSUj+E/S/1CS1PFG
         kE2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+jKw/zdZvUAe0gStTQJi3Ys2iw4YaoGGwrMSkGJBlEYpWKjtwGtl1EB4/qItDulSjIMQPDD2f2r11YVcYS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvqb8ff1PJRmLu3rP6N1aEz4cwCNDp4NXeSXiwvuGqarc4qu4I
	3Lx50q1iK4x9YzS6UTG55NYWNAwe23FLSA8waQWfDzpKohmuUwCtTiPvh9ZWDyhd1uhjttS1Z36
	+wNsHmih6RPXKoz5lY2xudgdbESSdgiA5ople8rXvuQ1hi1W7jPLwuYNP6ZFuH5CKSWxH
X-Gm-Gg: AfdE7cm7cI/EdB/ymZbqEO7MjEi80e9cESj3uAeFDO14jvGTGT7AcLcvT8GbUh2ckh+
	q2yY4CIj6dO/rVtgAFhDA6KL/Ue8f2R0wIjnOWACVQF4/wHOSfVLrtgZFjwSoSSHuRCooIyBVek
	XyI6BWejfNGC1XpWoW88g0vnbEiNO1wAj1TrAGV+lIVQLykoyvhD6QutvP0YKVT/4WgiQ96NXSS
	41HwCqkjc8Ar3cvFLN4oC1LCOCXB8/+MWyUlwNdA68M9eh6igH8pbLQH2KaUIL0w60J5fFHZDbh
	rPdGofasXsXWcDrJPoFjji6+Mg97VhNu4Aw6kMpzQM+VpQmjvCl/+g3702rzJO2PFPTbDX6l78E
	Q0UwS5GZkg2LiUxAP1lt/V12jxWdaxz69tDQ=
X-Received: by 2002:a17:90b:538c:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37cdbe3cea1mr4395922a91.17.1781803286551;
        Thu, 18 Jun 2026 10:21:26 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37cdbe3cea1mr4395860a91.17.1781803285974;
        Thu, 18 Jun 2026 10:21:25 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Thu, 18 Jun 2026 22:51:15 +0530
Message-Id: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAspNGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nz3dzEzJzM+My8zJLMxJz45Jz85GzdZPNUoyQTU2ODFAsDJaDOgqL
 UtMwKsKnRsbW1ACwGLx1lAAAA
X-Change-ID: 20260617-maili_initial_clock-c7e2b4530d80
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfXxUQzsl39Q5ld
 HK38YEWoBQGmQdsEObqrtAZ8l11TmJIyecDEeRAHgNsWbmSoYrGN8lfmW7Lk1PNnhqOgB2c1nyl
 r5RIiJMaAYKwPsKGX0AmWz2w3uP9JfA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX82RJZGihWo91
 bLnoUhJXbyFhOH66IQp0/NRsB3fJw/WRtX72xz1kK6Eo/xIietWIMKcrrlO6DU/fBxhyLPyfAyt
 i96CAQedRsHfCWcErVjaXhTsh98eZGy3DBoMAbg0riyR3TQlVjPiU5yJ8mAG9HN4GZzfOpU+osS
 dexxazqswdrSVj8opSrnfHunn9C0kseUgQHinQT1QjRmvoxW7EU0wFepwbj8GNCi258KfGA/0K6
 KbCXoTSVHMbUH5BT9l+F3FiK2m8seIY5eVjtSfIu2Z1CkRlTITBM/RAcFnfmGqOea74mGxH2ySy
 +EVXsWyidnxJa46CrL8o3o1FfrluRlAGCDx0RoeqFNuKSx4LrkyG61clEP0+EFjtzpcAr8QJVzD
 T27LR5JncNrWMxI5ruvNlOHiygitzf/vCYxgRmgw8JH74HgUjyc33OWFxwDWKDSGSgA6EpiYcv9
 U1w1q/mbkWFhI/a1/zQ==
X-Authority-Analysis: v=2.4 cv=H/3rBeYi c=1 sm=1 tr=0 ts=6a342917 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WH5-n01XVsl9kePyjj8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: xk2ta16KALR60199j87CA-yJ3i3VZLPk
X-Proofpoint-GUID: xk2ta16KALR60199j87CA-yJ3i3VZLPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113793-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34C1B6A1E4D

Introduce the initial set of clock controller bindings and driver
support for the upcoming Qualcomm Maili SoC.

Maili is a new mobile SoC from Qualcomm. It is a derivative of the
Hawi SoC and shares most of its clock topology. Where the hardware is
identical, Maili reuses the existing Hawi drivers via fallback
compatible strings. Where Maili diverges — specifically in the Global
Clock Controller (GCC), which carries an additional QUPv3 wrapper
(WRAP5) — the Hawi GCC driver is extended to handle both SoCs.

The series covers the following clock controllers:

  - RPMH clock controller: identical to Hawi; uses qcom,hawi-rpmh-clk
    as fallback.
  - TCSR clock controller: identical to Hawi; uses qcom,hawi-tcsrcc
    as fallback.
  - Global Clock Controller (GCC): extends the Hawi GCC driver with
    eight additional QUPV3 WRAP5 clocks present only on Maili.
  - CPUCP mailbox controller: software-compatible with X1E80100; uses
    qcom,x1e80100-cpucp-mbox as fallback.

The devicetree for Maili will be upstreamed later.

---
Taniya Das (5):
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   4 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  65 +++----
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  34 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 200 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  10 ++
 6 files changed, 269 insertions(+), 45 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


