Return-Path: <linux-arm-msm+bounces-116090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qqr0D5yeRmo1aQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 19:23:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8836FB461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 19:23:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HC80EKXR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iQNGBkwL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116090-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116090-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A27C301344F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 17:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FAC34FF78;
	Thu,  2 Jul 2026 17:23:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247F536167B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 17:23:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012998; cv=none; b=Ke8YWCu0iExweIV+fBNZZGdiJcGSo8kmpa0//mzj9F6T2QG7fKHmQd6bbXn9uO0PU39Neg03bl5/EWlzILgjMbpHM9TqoYqLbTL2usUL563NgUxWjEWzJZieyknfKHFoneMmUWpKjLMnydX+mIfWnLlqvgablYEr9otTf7Qhufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012998; c=relaxed/simple;
	bh=xHihuKsqRb/rLYCJXcp8FeKK6FPmsUs9uqScFJUzeYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S70JLLbNN3S+O3AIH5mtKxFaXDIBad0XLQosFuk/CUgq3d7Hd3oCBxVETdo9ljzrfrB/iXmMBaaHtvLfDL8Du2CmgIXGB5acrb9Gx3QvJTAditsP6Xo/+QGuiGb+EdUxdrmLkB4Ezqd8IRPc8KIP5WOpZu7ATCMKvA9GM0uMIzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC80EKXR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQNGBkwL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3Uxn549163
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 17:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYRjVEiEnorh4qnSB7sPARd/kjNZvY/WSq80K2OYPkE=; b=HC80EKXRajJ2DXN8
	6NLG9yZ0Y5esRVSfzJDolcnwq1UVFJRMESi6NYOzC30zwstsRFFstahWlijanuJ5
	O//QM3PMuzA6u7iAm2ga1TMgQdMir4589MXYJZ8OD0XRsSWCLaAXX/CN1A+i4mqf
	ghkpPh4/fRRxeTT8NChgxZ1VQ2VaYH71NczWdkxUYW1EeVXr5em/SUOSTpgSSW/N
	jm0g7oSdmm5fdMqPRrEOwPp8hVz5HjidKz6/TCExyPcc+MpJ2uKhIoITguyaDWqr
	j6e0PC8nDh3fzjB+3LTKPdm1OHDTVQBQNYgh4zAonhyhtHoGVZZxkfAVHMfUIqG9
	aEWZ+A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98jygm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 17:23:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9e9cb6a44so18137515ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012994; x=1783617794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYRjVEiEnorh4qnSB7sPARd/kjNZvY/WSq80K2OYPkE=;
        b=iQNGBkwLwWL37GTsZAgKm78l5Vra+GGdD3QB7CKibujHiR4V3yEB3HLRs4nMzlp/32
         QcqlCjGUQ/+TBJmQRZWx8pBZyhSOcZE9AFBYuG4Dz0RWQoiE9eeJswR5u1rUC60F1Ut4
         Y+Btwr93xl+CNmZMb4HoNIGSdeUp64UgA7jVABRvFBZ+yuo9yZbyRgA858nYzIUpCaOD
         6lsaICXkmp0yDEbnP529otPPqVdNTGizLw0DbgvRPk8YItcnWMym23cpDCuUyWIrNULn
         SBT1saHHxJ39XmuxL9pAoE1t39+xLjEyousaLBZItPskBFzKShr4zNRWWX+Z2cv98wD4
         +boQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012994; x=1783617794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYRjVEiEnorh4qnSB7sPARd/kjNZvY/WSq80K2OYPkE=;
        b=lTd/Qp9M5xA58exVf48QKh4Gfpb6H8ypWR8nuqspDIG2JEveX/eyVxhXtqUzymGb+i
         2WwX/F6NCeIJJM7se4dtMRyjH+mCqBIvzMfu11tvsOcDOY5gvByd2sgbWwSvp0Xf4Iwr
         3Qjf4F90kTIozxtB5VmZk8x3Avzdg0Ic06o1sbP6CKziEFBtKvzD8L86CLyWNSCsa7BL
         mXxt+hJpA31lnNX3IXu6tRCU7GjnQ9WnBb4FI2IF52suu7wTqjy8QOmf98m4977FO43l
         xZHZ5ArX1JXHv0IZe+SQil/jmSbf+jL31lq71pYMyaYGfTOq4AssEvCu1IBtSKqSWX/C
         Ar7w==
X-Forwarded-Encrypted: i=1; AHgh+Rrd2v6cYzzDHF9UpY9pyNsRoi1aibbAdI8YY7N4qBmhLRRWNkAsDHnfyZ8ZI4UMi2CLtOYjYhEATlYTBGBc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg+T1WnZpzoXNJgxNRPym5S+OzbzubGQmZdYNQhvxlI0YoFmva
	WmKAtj01QFgZccAUQyWHjwHC4u3JIv1IcUKAFWTAmEeeRKmopUJE+Jh9gme4dcVJkw0vI2Q8eMk
	5ESLQxSlsLYMVaKUKJw/Gh1p2Fy03FkIFfobakxTsjYVomb+ZVsEMjzLE4Ht4cGPdszis
X-Gm-Gg: AfdE7cmG5Rl4MbLhfCuwzwkHzpSKnSAxsESXJmnoEfCr9JC2uPyFQnUvGn2v0SQy/hM
	XiHS0bkLn0OnT+uGXGe/+M+BUkx3KL38x1FIE7moD9dPjDZSZwboIiQJDvIvvgpAhHiUgc8FxaJ
	tkfPFBOw/f0FbPdmjvjNEODkVxLji4nyn1HVuYn9KEqdw3aKts6yzJEjFU/r3nIql/ctUvSmHmH
	73abpNnrnOMcOTXfx4cntk7b6wCtjgeg4Hb5gk8BVVBqD3cWs0WLzSZAW6mAOubKUPmAoTOjAJG
	Z9MfAqyMIkdOSzBL0AKHUyIfbgAcsAhve1Qh+FKIQX+SXrAP1t8oW4fV51E2/xl9h1gUta3c388
	avWsEq8IsJeKzPLSu/Sj57dIMJvXxtWczFgxGi+NEPapnxw==
X-Received: by 2002:a17:903:2ec6:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2ca90c2d830mr63166845ad.0.1783012993955;
        Thu, 02 Jul 2026 10:23:13 -0700 (PDT)
X-Received: by 2002:a17:903:2ec6:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2ca90c2d830mr63166435ad.0.1783012993376;
        Thu, 02 Jul 2026 10:23:13 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm10564289c88.8.2026.07.02.10.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:23:13 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 22:52:54 +0530
Subject: [PATCH v3 1/4] dt-bindings: power: Add common power limit
 controller schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-qcom_spel_driver_upstream-v3-1-434d50f0c5b0@oss.qualcomm.com>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012984; l=2349;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=xHihuKsqRb/rLYCJXcp8FeKK6FPmsUs9uqScFJUzeYE=;
 b=ABNeavTY+kT8ZxyIY77NcbRhiEzdntQDzxmePHBxRtM+2TkWJ1hgNyXGYvFB/BTzK4UBpNwIA
 8q1tCTAr19TCx0J8GI34RlsAFBejkrWmZr57v79AqQNjEdUaLB4Mvqp
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: SMVWDJqpaJp86Wnax1UBfodCex25wsWJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfXyUbrDtTXy2g0
 SXqf4IaztswU05McAfsoi8inn/7qOXhWNSxV0u7MxQKqOuwbVXed6Llqf5/hfhCE5K40+ZbOIHl
 Zcs8Xpmb34O+7WNBiW8QenrE/73akRi+7kU5QcqOTD9uZcuG6WAgzouqw0fZu03ahZBcqrFh9rK
 I6QF7Sa9ujlctzlXezG52ItyOtmQBtRgdvX0fEI0T90IJBuzlQfZAUQl4j/6fvUYzjn1Z89HEa2
 yvCJ4vDo+unTvhcAn8Pvf4zZ6FDODxcbMBDxy7Nm1vcH2KjJHH63q2eiyB78lqbZtLMqdx2/1J3
 KKvkRCOx4t1v7BQwd+1Xm3hYadjvuW+KdoRsWDv+qBd++WAp10f7fYU8t1HIoVScLJ61+e4Qlaa
 6wbTNZgkK6eelarkFLAZDt1TbKmc1ryPSORSJFenZIqFlJEapx0exEndAnZxxQkVSXxGgQDvADu
 3YwEwIEsOJgrDKdyq3w==
X-Proofpoint-GUID: SMVWDJqpaJp86Wnax1UBfodCex25wsWJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfXwfrs9F/7L6sJ
 DalRCtjrXWEU3BYmmQQLRYTjeAmZDv0Ai74r/WTmc9MSjMkEslHkfkfCP492v99NBUGqIyzN9C4
 8BLm4S7bFNXgqSbk/dcdBVWRe4EKZNw=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a469e82 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=I3Hf97kVh4pfuGT_b_UA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116090-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC8836FB461

Add a common device tree binding schema for power limit controller
devices. This schema defines the base properties and node naming
pattern for hardware blocks that enforce power consumption limits
on SoC power domains.

Power limit controllers typically provide hardware-enforced power
capping, configurable power limits, time window controls, and
power or energy monitoring capabilities to prevent thermal overload
and maintain system stability.

Individual controller bindings should reference this schema and
add device-specific properties.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../power/limits/power-limit-controller.yaml       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml b/Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml
new file mode 100644
index 000000000000..a00548fdc79e
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/limits/power-limit-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Power Limit Controller
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  Power limit controllers are hardware blocks that enforce power consumption
+  limits on SoC power domains to prevent thermal overload, maintain system
+  stability, and comply with platform power budgets.
+
+  These controllers typically provide
+    - Hardware-enforced power capping for one or more power domains
+    - Configurable power limits (e.g., sustained, burst, peak)
+    - Time window controls for power averaging
+    - Energy or power monitoring and reporting capabilities
+    - Power balancing algorithms across domains
+
+  This binding describes the common properties for power limit controller
+  provider nodes. Individual controller bindings should reference this schema
+  and add device-specific properties.
+
+select: false
+
+properties:
+  $nodename:
+    pattern: "^power-limits(@.*)?$"
+
+additionalProperties: true

-- 
2.43.0


