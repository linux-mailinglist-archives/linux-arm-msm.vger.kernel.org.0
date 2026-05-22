Return-Path: <linux-arm-msm+bounces-109189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJHdNOUIEGpXSwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:42:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B25B0192
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FD4330233C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 07:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F5834DB74;
	Fri, 22 May 2026 07:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTr7RVyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5Vbgaec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E13905E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435744; cv=none; b=k2ZapkA/mX6tIK9SyZvyPIxqps/z66JoatF46IrUfOI7493rLrFj0SYkQjCWMbJPtJVGqfIrDa1W0yZcq6DSFba5tJ5nBoEWyEiEZe/sxXOdTzB5UWDfquiTzooTkiAtlr8tZAAepLJM+Lt6s+Qa5zoa8OODJsl5xKI4DtvMzMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435744; c=relaxed/simple;
	bh=GmdbQtXHlx/dL23XiBLsmK6wApi50guOPUdpigkrk1o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=twZODZ8pJ+My0mCwRsmzCRR+AkiJSQTMiKWvxPz9yBGLDjRIbfdFMntOCutGu4MnqdomfBsNO/U5/lMP/XD0fZEFRjIhQ/n+uW/4CRtaSDDdA2D7HnXZA1xBfdVm4+wJ4swTAsoSbwZlkxjBiX0qFP6f6QlnYs8JUJxFGsfz2Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTr7RVyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5Vbgaec; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M5xB2n777951
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tDa3n1fEJvGA2Q+Cx/J8QD
	0BHw9aFXkjrjQeti4WbaQ=; b=UTr7RVywkz6vBheMFQ+U19l0wBWeHUgHM5A4zm
	QHqGimVZPzL4mPrIkidLtIoG2ccrbC4sDpPSaJ6f82w6CYeh9508OhOhTvbTzE9/
	PFw2JxgPfSf0dvaODm77pZeiaV46a/tWjrVO5/3K3m9+K2ZBjc/RIWVGBvMWKY1o
	3fcU1ikUExojqSJndrYfQCHFdMPephmTmUXU0uPUQXjN1hDOL4wWzLxRQ5g5Y0Ei
	9ah79QqvNXG5agZ76nq2glAbqBzpZ4/N7HnlWTQiNkzTTvYyHlDEUuc5eUzGyJsp
	LeR8QOw07CX6dQBbuVO4naVsVJaPxPwRzDEGkvOvBbPYSA3Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h26q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:42:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso8582348eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 00:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779435740; x=1780040540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDa3n1fEJvGA2Q+Cx/J8QD0BHw9aFXkjrjQeti4WbaQ=;
        b=j5VbgaecgK1PVcKACnHX9y2/EDvoRMevCCir/mMucvJvgV2cLCMxwm3QeU/nvLocL5
         uQlrCIP+b4z9uX5p++Xl1CDlGY4zWW4W3K1mw15GCR9GGRnSXki9PmUYge4GXqBJx2QD
         tlqyr5af/FKY8dewbjaxMtRGYoh266AQkuqId5mnh4B+lYx15x0Z4JDpNxF712xA4Jo/
         zoXDKXI+A3f9mYCjQU2V2OZ8KdmynInSQY/S2bNEcTcg7w07Iftw05tA/GllIYwYV9Cm
         qJVMuHeyofFlyD6fVLtsAllBeu0LQ8sPm+mczuYKDf2tNEAIZ0E1kGoPtBOlhLHsXTgR
         SGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435740; x=1780040540;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDa3n1fEJvGA2Q+Cx/J8QD0BHw9aFXkjrjQeti4WbaQ=;
        b=ofHHumuYqmjWEbplz0jIUwUgWza562iFaR97gy4xQH9Dfnx/5HS+93okXh81HL21yS
         IxemiChqtfkpvHeQERwJFP/oWIhOr5Tg+QIt9NQ11tkD9mwQHgaxVqramt1xEQJw8snI
         jIX/1aLVhp8OoVIB+O4IRiM3qEytq/G82P55/QspF0jmimI9BOHixJC9xEJml1/gie/e
         Z0NXitgWUSxriCL0WtBJUYVlZiQ/9RQFb0cIfYXo0sVEVPB2NCsnztqiKjQIRwEn//kF
         Uxbd83JMagUeYWpIlrDp+ioqWeTxei8aB847wOK1GZ7+vCVdf6tsy6YG/uppQe88VW4m
         x7ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8W+FnmlXqyddL2WSvTV0SkdIXO2KZ1524YORZoZSayZzgyIL5XDdKk8tQVtaiFcz5CltQlPNoC6PTxrHD7@vger.kernel.org
X-Gm-Message-State: AOJu0YyipqWlHv/r2hbXeLf0WKyZqglsXrk5nWJ/LCMbNqMYOB5a7PZC
	30zy8B7HldaLKGrzBm0+Rv6Diq+qAz3nO6v9NZMupsOeqDpDDW/reZLLMgzMoiFnTEkaZM80cJS
	7wTzX5/6Wii8Hkd5pZNToma8YTXyQKYFxaJwzp5s6GsM7oOlazo5S1LUlXP3Bt7a2dBDk
X-Gm-Gg: Acq92OGPgpTjqJmrO0EMwFmj9zcFO8S4+vQhgrHdi0RhScfoq/KfNrvc5ehrjUMRTf+
	jcmzxQNENsL1pNbnaDA/76wtK+lc2JW6wuQnHyKbhm7Hl9AterjFjfpiJMGYq9PZAyUT2yC83RJ
	szqT1Vscr4klsLGvFNXqkvuSYr+yr5rhi3+cquejqP88rBipWeoS5QbNfhbyf0Mn6PIgiJ13V8z
	tubBF6IYFFUnjttCCNWQ2Faesjzz0uJe1AwessCYxN80+XF1VkWDtZMAEc8yt94CZ8gZDGwtvrC
	xa9F5czkthuOETaNYviZVkufN+GWt+hnFGW+95HXsYYiQNsl2qHqhrcnEyrc118kBBE7Ykdkm7x
	irvhIgWlYuNsa1duzBcb2qrHqmgWCOMrlJeYBAnDGHIoQZouQbXcOt7jN8AZnWa2N5umETjMv
X-Received: by 2002:a05:7301:6742:b0:2c4:61be:1d33 with SMTP id 5a478bee46e88-30448f32d08mr1184160eec.6.1779435740360;
        Fri, 22 May 2026 00:42:20 -0700 (PDT)
X-Received: by 2002:a05:7301:6742:b0:2c4:61be:1d33 with SMTP id 5a478bee46e88-30448f32d08mr1184143eec.6.1779435739803;
        Fri, 22 May 2026 00:42:19 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045225b7b6sm529725eec.25.2026.05.22.00.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:42:18 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
Date: Fri, 22 May 2026 00:42:07 -0700
Message-Id: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8IEGoC/x3MwQpAQBCA4VfRnE2xscWryGHsDqZYmpWUvLvl+
 B3+/4bIKhyhzW5QPiXKFhLKPAM3U5gYxSeDKYwtalPiSrII7hLcoQtaGm3lPTVkKkjNrjzK9f+
 6PnmgyDgoBTd/l+8Az/MCVbODlnYAAAA=
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779435738; l=786;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=GmdbQtXHlx/dL23XiBLsmK6wApi50guOPUdpigkrk1o=;
 b=uEq2iQVWQobLKLz0eITogZzpI7xo1ENKZf2iOIqnRBm0cf4JGxM0sSkjl+Jw3tEp71rHbhsWE
 8DDo5MtdIGuBimNSmLxcDEfD2gPBW2oBnVhD71XePg7n/8mZ35EKKue
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: pBFBn8QdNFn6XhghqTcqtsQwR7Lzpf0C
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a1008dd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nvY0XyhO1x3eZiSlIXcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: pBFBn8QdNFn6XhghqTcqtsQwR7Lzpf0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3NSBTYWx0ZWRfX9C2Be1KiElV8
 MOMAk6vliOS8JYP2LaP+IwHd7xZnc8OH7mLugrOQ8N0fWDZPtqps/ZrEO4BSdhHneVOB5ZzFXMC
 qp1pxJxb3Ybd34benGp38AGcH3g551Zh6/OjuKX32V5NjikecyZC3WORUdoFdWqqQVdZKwO+KuA
 9T3dcXMbW+a400Cas0zw4ahJJboW/xHxv2Yu0dbsiKvtX7F5xeP51ILZLZ8DutPHsmfHd4hNX5K
 VcZl+BZY5C6tngRHQBWp/l+aOvt6fxcJcXS+petcImRixbHQ5XsBySSTXMSuC2VbQF5i9fFh03e
 10B5rGhOn9r8JAlP6ksXF8blClnTKhUmLAE483h44hegN+BN3w8GrSFvInRwa2YDd0MGqgZg0/4
 gIewDF/cBM/RySic7s1YLHL73G0rx9/6tT6Ai8M05Kz2vrzI+6icTPT9on0gtFoGp7JMHghmFO5
 e4146A8SvMoO5XBnj6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109189-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F8B25B0192
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce Top Level Mode Multiplexer dt-binding and driver for the
upcoming Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1630 ++++++++++++++++++++
 4 files changed, 1761 insertions(+)
---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260521-maili-pinctrl-6af64dda9a24

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


