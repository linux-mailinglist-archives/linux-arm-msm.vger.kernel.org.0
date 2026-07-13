Return-Path: <linux-arm-msm+bounces-118693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IXK/HlirVGqXpAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:09:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2BA749223
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:09:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X8YwEQk7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dDOHevKa;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118693-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118693-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F944307F1FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2643DC4D9;
	Mon, 13 Jul 2026 09:04:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED36F3DCDA2
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933462; cv=none; b=SnkABHWTuiJUML9ZMc307oIhbEffHoy2jAP9xBYe5ZEKG3gYKecc34PhAmby/EMzyuvVO9DNY0XcPe0E/OyBHtZXBQOzDIiSGvx5XoHzKXrJ9Z5xdg+Nni/4sp5F1WTQ+l20ys7y8POZdFWL1nCPOjjRFyo9GX3uiASlpLH2u7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933462; c=relaxed/simple;
	bh=9BRmdFzW8oYEC9eBqhv0oyUu5gc72FbmneAGMeEP6Ow=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JTOFCZ/Cg/bhRLLxPDoweWNGqM4mtHxP1il5FEr7UWxSoVTLl6dEuapsSvw4ne5Ugok57KTF9o+Q9LrO5O8xHbB1Q0dgQ8WNC3uHtbJ80W8MphZD6xBV7PH9T7uZxvvZn0fv81/6/RDut0wZMZgtrFv1Dw5TETEtyhUYljF8d20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8YwEQk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDOHevKa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nufk568068
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4ECQjdaHnTc+TTRzlxH3WM
	4pEczV6dL3FXSVILHJzk0=; b=X8YwEQk7XcVpYrn07QBbKRKs+J2f3oHL1FM1JL
	b0wp6eQQSI8JA0hmZMG+BIO04Yb3VMjrEQBN/DCZTqinluj5obKfr2Y+i0jdaKSJ
	84vfCNAqyuTkTiRWrvQFYEg0djOhUsdtrw6r2GoDPYIoE39TE37CB6SoS7xyUVS9
	huUAdazIR8yzEZFu40OvioBdToAaetst0FK1Eq69KwIiYUQkRM6Y218RF1AfFA5H
	HBx+BsSob3yyAIgnex08AszjSb4XElr5QMT33KF/R/9ofDX3B7jJKTbHYW0AQNvJ
	VLudjzf4NQn42sDeJuRFn3FNvOa3m6eKjBF+Qr3Ex2ik2c2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe915asr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e095fd889so853287a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933459; x=1784538259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ECQjdaHnTc+TTRzlxH3WM4pEczV6dL3FXSVILHJzk0=;
        b=dDOHevKaKfQBhLacn5yjsJTUR9/XeCc+gCX8LFKQ3wEXIL/rPyHlqSOhhHedBqUa5W
         JzZRiZZfRDWy5wQ9zKny2jUQAThjgVm1ZCg5m4Ji+6XK1jXf9dWu8vxoeE09yHaYa/Gs
         o3LzKgfufUQdq5EG2FLpUlxCY7FF7fc4M9bfKfrWLZFtZwJc1tBc8QG+koBE865ZbgaO
         OLpA2DW0AMadD1ztLh8nLJRHUf2eoDCCgzeWKdAgJtlGN0r0LIJU430H72ud0EPl3jyg
         K6kU052cy4tT78UWkw3jI4spGNspMgxBJSXQvr5+iJHBajkZsD5jCG+VCtH8syNmmIRZ
         Urpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933459; x=1784538259;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4ECQjdaHnTc+TTRzlxH3WM4pEczV6dL3FXSVILHJzk0=;
        b=SiG9F0YTWAiZyHIDlzbbex1e9gRLMQa+9dZbQ8IcmDSR5VimvP5LhbRJlVy7aoltK6
         xjh87Kay099+lSroy6aJPGFhL00q5BkefMYR8Pxfu/oCHlcAuIVAHG6VWa+YhMK8dB8Y
         W280rTzGrZ1X/Z/wph7crz9yhXraOOynETcoNWy7diosjGsllgYgQUMXbTklWbs6fRrO
         ud7qweKFO6ALugVcIuAx6arQw7AIMTOS5VXMbfaSuWQsj34mgv0sgUFzAiRTXzrA8Swf
         5pnmI8NR5lfPLYkUROGDJ9zrRxttSfzGhTrw6AFErmV9aN3lznwbUawK9+MKpPteB2eA
         YqQg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9uFXclLThCa/0o5siTfDEj9YwxO4SzgLuP6nVGblfCNDDaP9C9INpBUvpjuFkO/h9CoetldNgrs8fE7KP@vger.kernel.org
X-Gm-Message-State: AOJu0YwnjEicDX+Y/XH4/ZxSXEdqNOOI1RNagLwdcUwwyIeclO51xekB
	9GjewbClpsYoIrZecWKtb1l07r8BjFxffgNhCNOyTA0Fp5pRC3aHaQ1QQ/LBSYdUHhqMVQHeDYl
	Rkl0y2kwLWV/DCc5WwHrtCpWdXs5vGTTWWpaqhE/2YYwyIj69kOey+ewW7k3OAnbmywgh
X-Gm-Gg: AfdE7ckfBDXaJmw2bAG835LRiEyrdFSEkDehefCP5GRXj5jmI9VdywoVyMf/axyDdWM
	QgZxx6L1j4+hPJMgB8zcN8smyypYljsyQbcO63sizJ4RNBoRBwmNZH/W2kjJKO6sXRdwk2LO9KU
	ZxlNXD8XSNzHzuEHTjdrkiuRFRh67prR33nfkaL8/E7uBQkt7pjYGotnA1owvArIcB2NkBlMac1
	1Jxbmd/2rFNimZCr2w41CDZs6thlOpauZpMRFNAcsmMGN4cjj01cN0VsJdNF4+UcPIPIBrrmF7K
	4xSwBk1hmNS+oaHkarOadRILPf2qk30pr+GSZ+88ZYP5wCHw2fz5ajjR4tPFuYjVb114unZgx/a
	MbItB11lkH+HuoKeLFonTR7fC5e1GXmwCvdg=
X-Received: by 2002:a17:90b:33c8:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-38dc77993c3mr7931699a91.42.1783933458973;
        Mon, 13 Jul 2026 02:04:18 -0700 (PDT)
X-Received: by 2002:a17:90b:33c8:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-38dc77993c3mr7931675a91.42.1783933458528;
        Mon, 13 Jul 2026 02:04:18 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Mon, 13 Jul 2026 14:34:06 +0530
Message-Id: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAaqVGoC/22NywrCMBREf6XctSlJah+48j+klJhc7cU00aQGp
 fTfjQV3bgbOwJxZIGIgjHAoFgiYKJJ3GeSuAD0qd0VGJjNILhveiJZNiiwN5GgmZQdtvb4x3aI
 87+uKm45DXt4DXui1WU995pHi7MN7O0ni2/583V9fEowz06BBXtVSiOroYywfT2W1n6YyB/Tru
 n4A95k1uL0AAAA=
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a54aa13 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kp3T8kGXBi3sce7iFlAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX+HHxpaxbFl4k
 DLfsY7XgGKM5PVE5UCsH1I8M3aOBwIhZy9pfovISC/EI8AicdVye1FtUcaiXqEWhzyvQ9QGnEaY
 2Gjj+RHgCTE1UC0jelOvjbVf/GEd8ug=
X-Proofpoint-GUID: 2Fct3X7dyDkuMBIX9TP4TEL0rM3ZFIXi
X-Proofpoint-ORIG-GUID: 2Fct3X7dyDkuMBIX9TP4TEL0rM3ZFIXi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX4WuQjGDvKO6h
 lW4mUslX2hQu99uFnz5Hq+G43az1/2Ss107STk4g1qRpTiLdBuYFuj6tgVu1FzRstOMJ5jMfKwq
 dTiWZEJO8DxsCcGKEngcAtpcWtL/MXGAxT0mVW7z6ioev848dXKftIeICsJwKsdfpNaZMJomZr0
 sjfT2SaAb9N0GSc55SENlHnwGqAJCaCN/dZSQUjREpqnASOS2eOhV6wRDjhid3f2u585M7OcL3K
 88dBtOC/IJSekCJcoLfCOhoYTA2g8Rv9BuFDHvZiSMNOENdrug1gCf3v3eWBUa4GWh3CYL8lOM0
 BasymJ/Tisf5lIPIseWxhXiCZZfbM9+3EZOQzRZXEaexWIeqj4ToJks6ASKgxLXKT2DOti7l6vL
 1+AZ/BPQVHNGqwJjMRRH5VTwD4a2h4M4ZGqxwZXICNaUvKqA6QMO5xdUuP1vCzt49FXQQty6qNf
 Dg9LUQ5Hnpphe/cr3cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118693-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 1E2BA749223

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

 Changes in v2:
  - Split the new Maili-only QUPv3 WRAP5 clock IDs out of
    qcom,hawi-gcc.h into a new qcom,maili-gcc.h header (which includes
    qcom,hawi-gcc.h), instead of adding them directly to the Hawi
    header. [Krzysztof]
  - Update the GCC driver to include the maili-gcc header.
  - Link to v1: https://lore.kernel.org/r/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com

---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com

---
Taniya Das (5):
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  11 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  65 ++++---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  34 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 201 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-gcc.h         |  21 +++
 6 files changed, 286 insertions(+), 47 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


