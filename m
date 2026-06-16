Return-Path: <linux-arm-msm+bounces-113363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QTl8I+wgMWpmcAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:09:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D3068DEDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:09:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="nJ/Tt68t";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dof+0+24;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113363-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113363-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA5E23068866
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511C8426EB6;
	Tue, 16 Jun 2026 10:08:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC85426D0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604521; cv=none; b=d37ysOrDnNkLf9W9o+xwJdekYmZ4p9q6hEWDRa7tvzdnBhhUSDl2vR+zPuHxRmD33FrbibYcIvLNrQO4tqgoIV8FDxHUNh7HyKxjIgnZqIdGF+RnQKqxN0qGMP8Bt7S8OFnWCLZ5r26a2FhszO5dktHiKB17ZA8O/S1KnjcXnPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604521; c=relaxed/simple;
	bh=xcXbiVUbCo1OEDQ4lHPTqD8yyIpF++LPdD4e5tkw35I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDNRYptN+8W6BWi9xfWNtvyGb/qfmdo/8F4tIVVUaCP8BxhR5YMvPPCb4qMlPcDOEZXMGx+5k8B+maOUjFZOM7z/3ZKH7uFFHOdKeQ4uhQJ93cLtILYS5ZORQ7BHo0yV+mQgv6PiUG4iY1t8HIuiGbHUPQKKJKsbdEWbbUu5js0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJ/Tt68t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dof+0+24; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA4HaM3439175
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p4hdSubR9/EBgDIPi7F1kHMDLKprgVmn2VEkBkC3r90=; b=nJ/Tt68t5uavXKel
	pm/PGCbCbszXN51nlNp/M0OlOidRAjGRtRIIGVcuXxRDXH4mOr1nq651M8DBF4Qj
	71Sd7Szhk1C6SDj1ZZFLr9o/gTZ/9xV5Hi80brSRQ0etRbLLs05T0bLWL1/evDpU
	6bhxLDXA4qarDBzkI+Pi384LS/l5v3r3IYkzUL+ZX8DtigNBYIW9fJ9BlxKvzGQZ
	8iuoG9RDKN3KMw2JWkih6UFfNNFdJCMMzaH0fiFFV1vdMAHuPamByjqrA/2YGQx9
	HoxOIAU6De9TpxXpz/iW8lMorlHjW9+oxcIvnfK05ViqjVbG4CzAyYf7B9xjX0Gh
	r/QO3Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkg0ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304d8613efbso5129448eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604517; x=1782209317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4hdSubR9/EBgDIPi7F1kHMDLKprgVmn2VEkBkC3r90=;
        b=dof+0+245fBJ6IaDe/67vZeZboRj/gug+IgYtxAz+RUjE7zJOr2+8WWvqQ0WRq4Eqr
         FzGFt9Dm+L2rgAM99PqANU3vgAOj1kwy86z+iXt452XS/t9WMA/R6olrm2qh5msVsfjk
         Tgyi60ZTp3uAWKHu8ywFK0s58ZZY+058DF0NdTavKtC12iDGCAPh8R4OwIAIm15/dhmh
         EOTj5r5zyoFzIJYDMWoh91TA5mluHLB6LEu+U3qCPWMgBBsazNmVN9YugI7kxL3RNSN1
         ncjhdQCBQVNEemk6IEwes2cCL/h9OJmnSl/NrNYH5uV2JAcCny1v5rXgW0blPO88o6IW
         HegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604517; x=1782209317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p4hdSubR9/EBgDIPi7F1kHMDLKprgVmn2VEkBkC3r90=;
        b=tNrDfGY1yu3RaP2D+SFHYq4QXAycURhGzxkTTqW4tMS+s9Id/HjcJeh/CsKV7AL57t
         Ucl2zA1U8DDehl9g//E/nEwKVEXkOgkXpH4JEVD/188XwdtH7Fa08GJdk5twXf95YjM0
         SKGXEScIuRlutPfy5pJcL+aPb7sx3VG+FkWZiEAhCvHlplJpd0VWQl4wPGfS42xo1wHG
         t21CU/a3pKXW6bi1KrNJrh6jXo/LVAs5GvZ7u8zYabqrFAtA8qee9KJ5comhQuLpMh8C
         PARAqolD34JWQ98RVIctLses5zr6zba98Qz7U5oj4qHgmA+RN6SX6zBsxoi/Mz2ffELa
         9Igw==
X-Gm-Message-State: AOJu0YwG1Cv1WaPWDZKcSR+Is1wVGn2diPOegHOA0cU1hFhR0Llt8N7i
	G3WsCchdVQDDkKnUDyXAWVA7FwnAGeI+iehFR+Be+zhg4PESDbA8pZouZi1fitFSrVqYxVdI/JW
	CIfehaM57gdYv4qUIbaR2RH9rWIS/anQGcvc8AF+GMiP/VA/N53z7UsmBapQ3hoZxz1nT
X-Gm-Gg: Acq92OGnZiPCe+LQtYcREJQyTnXLXOHJN9clRP9uSMvVfJGUdhaq8wAdz4gUThm5HCm
	ovBhMHESy/RMnMJ6+Lao/HzSY5vwtPCh65Eo4tZ4f57/6whBCZS+PrJ0wte22Syqoopv3X9Kfdw
	5hgfPZqg9qUQyn4h7CaGqNyDrEsG+MXHXLNALttCezt7usYnXHCVylnAD/jrO0+c4WgdGec9HUS
	Z6X2AEk+Zmw9iaqHX5SrZbwrWRvxb1nNdvAbYOAIDTt4rvHSFbK0FMvdGV1ZcGHngMTdk/D6hHV
	ct6YhOdCtHKA1P+Yh83mHQvXZXOVm+9MpLIWUskE/Ka30XdLrsDW0ajOBlwpGKiVlqI+wwDJh9F
	V9ozlW1hMxMOBywdtTv33VQzOurJmkALLkOLBBYvrjzql0LApSWhbqX+NtqGeLWOOuoQ7I/00DQ
	==
X-Received: by 2002:a05:7300:542:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30ba5fc1526mr1941864eec.29.1781604517516;
        Tue, 16 Jun 2026 03:08:37 -0700 (PDT)
X-Received: by 2002:a05:7300:542:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30ba5fc1526mr1941838eec.29.1781604516991;
        Tue, 16 Jun 2026 03:08:36 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48bfa7sm18401484eec.5.2026.06.16.03.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:08:36 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:08:24 -0700
Subject: [PATCH 1/4] dt-bindings: input: Add binding for Qualcomm SPMI PMIC
 haptics
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-qcom-spmi-haptics-v1-1-d24e422de6b4@oss.qualcomm.com>
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781604514; l=5192;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=xcXbiVUbCo1OEDQ4lHPTqD8yyIpF++LPdD4e5tkw35I=;
 b=VTDa0vhYlRhNzb+qLgS3SkvvhUIYfDglm1CadbzyU8vIhpZTw4oR8N2T0UXPfiHq1pMgvJpZE
 Dk4Ez3+yVyUCejHdbHOuAC/9gVC8gCNFKaeCIUwX0uHyLvAk8hKmax/
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: nhSq7dqUWrGuu6-rXG6481ny_Zwp5cio
X-Proofpoint-ORIG-GUID: nhSq7dqUWrGuu6-rXG6481ny_Zwp5cio
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a3120a6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=e6y1SXZLuqwm2ytIXeIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX32blyi/y+Cc6
 iCBuhlsBCN5wfNLNw98suffKpnUfeJ2nxjbsRDM6AOCAnGOJDurMb1Hl8BfSJawbNYfbp3eegB0
 OOd/5BcE2DWupusYI3Zl9RaN5fmI4BY3yLJ0RVfHO+HZv6e4vbnIYpbnm42sJK60ThTjHWaU7QY
 YsN8cTGtSwDr8nmYCU6lA1Nz2gUtjMX0NgUz2khD7xRfTvXaPN8kHRakVtfMxUwGVwoEqyrwQD/
 gN/QTLHp9M41YZC4n+D2wQKSy7jfOYTWAgC51nWpq/0BWFykMY+LaWaJD1BJfnQBr+sZP8jSFPJ
 pvwb6dG0PTERDYmh2Tp1YdeGYFf1M5lYMZlNEugF+2ms8ZhNaegowvsSKXeO+KOCZtO5qN903kM
 yklotrpPiqRQZXM0573DdOzA3J4xQUtX+qU7cJst1/esVoDezakAJ0j/jhpziOSKHNDilVPxgEx
 v0vH4T81jPApEoi38eA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX7gejbqOsjeOx
 PRIJAxZUFkfTGS0S9VxOOJYKIOZn7HOv6iA798rKPzmM/cXrcUo/T0WwyEeFYHYtS4oQH9gD16S
 dIgOuAoaKirq5JZ9wBTgu1cKKCi+u58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113363-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32D3068DEDF

Add binding document for the haptics module inside Qualcomm PMIH010X.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/input/qcom,spmi-haptics.yaml          | 119 +++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
new file mode 100644
index 000000000000..0e26d68563dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Haptics device inside Qualcomm Technologies, Inc. PMIH010X
+
+maintainers:
+  - Fenglin Wu <fenglin.wu@oss.qualcomm.com>
+
+description: |
+  The Qualcomm PMIH010X PMIC integrates a haptics module (HAP530_HV) that
+  drives an LRA (Linear Resonant Actuator) with output voltage up to 10 V.
+  Two play modes are supported:
+
+    DIRECT_PLAY: The hardware outputs sinusoidal waveforms whose period is
+      defined by lra-period-us and whose peak voltage is defined by vmax-mv.
+      The driving amplitude can be scaled in the range [0, 255] via a single
+      register byte.  Hardware-based LRA auto-resonance tracking is enabled by
+      default in this mode, allowing the haptics engine to follow the actual
+      resonant frequency of the LRA and update the driving period accordingly
+      to achieve stronger vibration magnitude.
+
+    FIFO streaming: The hardware can play an arbitrary waveform composed of a
+      sequence of 8-bit samples at a configurable play rate.  Samples are
+      pre-filled into the internal FIFO memory of the haptics module and
+      continuously replenished via the FIFO-empty IRQ until all samples have
+      been played.  The following play rate values are accepted:
+        -- 0(T_LRA): each FIFO byte drives one full sinusoidal cycle with the
+          period defined in lra-period-us.
+        -- 1/2/3(T_LRA_DIV_2/4/8): each FIFO byte drives a half/quarter/eighth
+          sinusoidal cycle with the period defined in lra-period-us.
+        -- 8/9/10/11/12/13(8KHz/16KHz/24KHz/32KHz/44.1KHz/48KHz): the FIFO
+          data is treated as PCM samples and drives the output with an
+          arbitrarily shaped waveform.  This mode is typically used to define
+          custom driving waveforms for specific vibration effects such as fast
+          attack, crisp brake, etc.
+
+      In FIFO streaming mode, hardware-based LRA auto-resonance tracking is
+      disabled by default.  Because this mode is intended to drive arbitrary
+      waveforms that may not follow the resonant frequency, autonomous hardware
+      resonance correction would interfere with the intended output.
+
+      In the driver, FIFO streaming is implemented using an FF_PERIODIC effect
+      with an FF_CUSTOM waveform.  The expected custom data layout is:
+        custom_data[0]   = play rate code (see qcom,wf-play-rate values below)
+        custom_data[1]   = vmax in mV; 0 = use device default (qcom,vmax-mv)
+        custom_data[2..] = signed 8-bit PCM samples (at least one required)
+
+properties:
+  compatible:
+    const: qcom,pmih010x-haptics
+
+  reg:
+    items:
+      - description: HAP_CFG module base address
+      - description: HAP_PTN module base address
+
+  reg-names:
+    items:
+      - const: hap-cfg
+      - const: hap-ptn
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: fifo-empty
+
+  qcom,vmax-mv:
+    description:
+      Maximum allowed output driving voltage in millivolts, rounded to the
+      nearest 50 mV step. This is the peak driving voltage in DIRECT_PLAY mode
+      which outputs sinusoidal waveforms. The value should be equal to the square
+      root of 2 times the Vrms voltage of the LRA.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 50
+    maximum: 10000
+
+  qcom,lra-period-us:
+    description:
+      LRA actuator initial resonance period in microseconds
+      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
+      rates and the auto-resonance zero-crossing window.
+    minimum: 5
+    maximum: 20475
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - qcom,vmax-mv
+  - qcom,lra-period-us
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptics@f000 {
+            compatible = "qcom,pmih010x-haptics";
+            reg = <0xf000>, <0xf100>;
+            reg-names = "hap-cfg", "hap-ptn";
+            interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "fifo-empty";
+
+            qcom,vmax-mv = <1300>;
+            qcom,lra-period-us = <5880>;
+        };
+    };

-- 
2.43.0


