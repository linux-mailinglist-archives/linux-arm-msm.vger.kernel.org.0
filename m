Return-Path: <linux-arm-msm+bounces-113874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hu4BEmypNWqx2gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 22:41:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 973736A7AE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 22:41:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JH8LdBdN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=URZQ8S7R;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113874-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113874-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6CEB30C578B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 20:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0283BE174;
	Fri, 19 Jun 2026 20:39:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1593B42EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781901573; cv=none; b=DLhECwjMcF0aorLooG9GrXch98Ugw7PwOSntHQZhbvJrlLG/woXndr70k/f1DjhFERPt9jvwLnwBN2tEj+kFjBX03WTtYWk5HCqNBjgDd1Kbc5egnjzDhSJPW4UPaMNeNyjgefoZazHrvRKuf10Flr8S/6AQcYIU+KtVY1oP65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781901573; c=relaxed/simple;
	bh=703nbJ9+AremmpLmpfLaXhNDAPkhsejmF/gbf10YyyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLiXkducpH+cDbxYwyYPU3uT+prQJb3At2+a2aYdCUXTYlxdxQKXRVgGilJcdTpY1qi9YZw7XPxN9ssKiZSN9cKGcO1AezXsSp1cZyxeJdBfXYkEI/lKWSl34FN1eBl19wFmp2t+8LCOKcRsYv99vFORMvNOYE70h5z1wBIoLWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JH8LdBdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URZQ8S7R; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JIh7KX1548903
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVaKYynhspx2lTK7GMhim3cT5wvFl+yF3CrSCp59GD4=; b=JH8LdBdN4cxkZhqY
	WLjU25+wJmXS2Oym5uzycc29yXzLsKA6XH54ohHdMA1/Bt8GupVLK4dRcspva8O8
	rMEnxgeee54pHFH/TKdNMMZ2tO9Hhh2J1MwG1stGyqkwp1g14YoAYA+a8LfaRg5Z
	9/agjZZcu+DJYj56cFUJYvk98xno7aKw/naElE3LBZVJ5m/kDDG2mI/TWCHdvEOr
	U1ATF4R60Li616Utv3jOSOLneHvW1vS7lu+6tZjve1QaIdiZiC5dJJ/c8PUIRfmX
	a9lotuTeM1Fby/wwN63dE3//JswfaHgX/FXL3qiZnPJgFT2mQKzCkz2Jm/T6TRVc
	iPDWAA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewb9wgbw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84540c1fff4so3266947b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781901570; x=1782506370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVaKYynhspx2lTK7GMhim3cT5wvFl+yF3CrSCp59GD4=;
        b=URZQ8S7ROCIKIEZ+KjwOcFwYo74289NYZbaaJKYxXLSNoETDkXPHEsiE9SnEwbnLgm
         sdBh1gM6wZ7/Qexjj1niB0k6suopFxALRJ4a6jI/0UKV77DhsWC2MH5Dz84JYboc44o+
         mhXlWqKCHyOQ20iV6wXUm/ApTNfBayujBMXC860ohQZ01ZtX1cjIHHQPZEzNkIqsleqs
         gnwVIUJ06PvxIJ+oAJAaidLDjot25i2mpOx9YHgVuECpYtVRxZmvJpqcu6MH9udkNJ1Z
         bUZO5BZJDR5uJtHdvpF2p0I8vLfaFY2ULZbKLWjRrbdAZ3fMY5/mQu9hSuJWkozRARVW
         wJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781901570; x=1782506370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVaKYynhspx2lTK7GMhim3cT5wvFl+yF3CrSCp59GD4=;
        b=gxiU5H2SHxmjj8MgNqs8iMgx70b8C57kCgw/c6WwogJfR07haw5XNAbNt5XlxokAwT
         gAOixbVvxAjkNQLeBWKgCsuacdb5+uvUQYRjsnGgfrz2tZ2TyaTm18cEXVI9vM2n5TSg
         y1qgrgFVTFL+T8j+QYltyOfHaz0ccXQZgrrkhtDFK7VSaNNOOFxIBJfIN6yBlZDaXomd
         vtL8CIaE6tOCuK/fs/Dgn6bk5ZB5A5EfK7vBsMgX/xxeDjS9/9XOFVjNTmwAb1/jONCg
         LX6cSGMXCifC+8HP1+gdL7Tby2sTSg9Dq6J0dOD+XXURDenSANuIVk/bklN1pyInTD3j
         D1Fw==
X-Forwarded-Encrypted: i=1; AFNElJ+PwZSHgtdDTi28KkzSDDrNO15UwQW6wmExTXLgEJtZKdUxXyTK+tknt5ecOSHp8J1j7gYTxyNE5WsvE0Yc@vger.kernel.org
X-Gm-Message-State: AOJu0YzxjA7Uqb3xOQBXqeqxJ8Mjbui/K55cHSoNoWAV+GEEbq+Ge+LZ
	LJkIBwwDUC4s2tRXL0SXz5hyQtPq9lKczHdxQugfjx/eBDhz9tNVjsoNbKP2ZVCHNa0yESXaUbe
	3hmxiSk+8fqo36ZKSYlL+LooRjjw52kuTqHZ3ob0WoQY3yPhu0IV3mpjDe/lxrh3uChnO
X-Gm-Gg: AfdE7cmDYwWGoZ48X+R3+EYNTUVVnCQ25hdnmqRAb49O+FJji/q05ESF4zxIhlr5SHf
	o2IhN290N2uccT3f2etr3l2GRzsNxEVh+NA6GMjF4TZv1ySgR7qNncxd2skTaepVKUsttjrbpNV
	jGxpx3QlkEzr2V4ZA7b5Akj6K68PlFl3L3iDhCbTIJxtvNxse4SGcbDwpu+71tkJrOUWKaslftv
	74FsffEXuL6eaBwS83xFLoEzkdVjGkJmqXXoYCG7zJfXomTg+JtvrvJf3N/tHCoIvsGyBVqUrVp
	f1DMOeZ2m8JvVXsGcI76llcBpSqqANyRHMuHNywpng/hbozUJ+rciClAwfZFMDKzY3/vI/hA8mi
	y6gO5NjK7epwBV8VC5kGJYosHRFVEIPDLVUNg/IGz9Y1ekg==
X-Received: by 2002:a05:6a00:c8b:b0:845:1715:3b1b with SMTP id d2e1a72fcca58-8455616a5a6mr4495607b3a.35.1781901570170;
        Fri, 19 Jun 2026 13:39:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8b:b0:845:1715:3b1b with SMTP id d2e1a72fcca58-8455616a5a6mr4495581b3a.35.1781901569661;
        Fri, 19 Jun 2026 13:39:29 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd779sm94190b3a.53.2026.06.19.13.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 13:39:29 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Sat, 20 Jun 2026 02:09:08 +0530
Subject: [PATCH v2 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
In-Reply-To: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781901560; l=2547;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=703nbJ9+AremmpLmpfLaXhNDAPkhsejmF/gbf10YyyU=;
 b=+ZgHbBUKa235ZUbytlgNLfOf/qZmqEFOG1cpz5nUuF5rRNTu9E2ny3p5lRwn2iQ/OQWOd3atE
 NhECZb6q6N2D16SQMNyYMVxeJy1Zy10xk69myketaGkJRz8GBVMmSmR
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: BHmySTTAlZiTJ5DmYJ8C4ABX-NTjJsoP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfX9nuAhy/WFnyp
 WEfFugvUyu6lUKuDn/jz6je+5xw/MrOSLGrgXwznLraKEnLkBoyu/5ZrwEY+3BzQl0YJZXtNaWO
 KxooTCbfuk8Q9/kZTWs2IVxyt9ALSKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfX3SiiRvD3ma/q
 TKVvIRuaxLMZWrN06DYMhsX5K8AKQsP2wIpJI/beIkaZZcifKUpFocU3jPI2UXqv5geIdIW0BVI
 2//Bi33M0Y9hO6e9zFCytQn6WvlwgyV6osmtkNNqRSeLGQSJvMLPVwvE7cBOZIhs7GKcrSzQbuc
 BSCyd1NLw5paobzt3hhGmmW9bSDuSDqukLdxFKd+gS1s1rXEiDVih5dKkJGEGkP94c/JGaXh+9W
 GoU9fATktlNCVuSEp2py2FT6NOCINEKWz2BHSklNcsmbCpLe1OBT9CM3RVSsUiRwPa0Xa+iRgfm
 u5poNRiR3k/NIL4M2hkbfzN3Qwwg89q2d4zlm9BEbL9T63j7rijQ6zqsmNE7PfeBlsMSkPzQ+er
 SXl5Gl3Ng6kLDOTxkSZg+33HAM4i/3ie0gD7f9u3IyTPFiVCHAgr4JYxaT3Eoe4NBLwTfChRC/j
 tBdDWc3fnKEJ2/nHYCA==
X-Proofpoint-GUID: BHmySTTAlZiTJ5DmYJ8C4ABX-NTjJsoP
X-Authority-Analysis: v=2.4 cv=D5R37PRj c=1 sm=1 tr=0 ts=6a35a903 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=j4VyU_MS_U4jYmp-Sq8A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113874-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 973736A7AE7

The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various domains.

Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
new file mode 100644
index 000000000000..4c6e6cbfbfe4
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/limits/qcom,spel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoC Power and Electrical Limits (SPEL)
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  The Qualcomm SPEL (SoC Power and Electrical Limits) provides hardware-based
+  power monitoring and limiting capabilities for various power domains in
+  Qualcomm SoCs.
+
+properties:
+  compatible:
+    const: qcom,glymur-spel
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: config
+      - const: constraints
+      - const: nodes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    power-limits@ef3b000 {
+        compatible = "qcom,glymur-spel";
+        reg = <0x0ef3b000 0x1000>,
+              <0x0ef3d000 0x1000>,
+              <0x0ef3e000 0x1000>;
+        reg-names = "config",
+                    "constraints",
+                    "nodes";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3dd58a16f06a..c63f147e8c54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22233,6 +22233,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
 F:	drivers/power/supply/qcom_smbx.c
 
+QUALCOMM SPEL POWERCAP DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
+
 QUALCOMM PPE DRIVER
 M:	Luo Jie <quic_luoj@quicinc.com>
 L:	netdev@vger.kernel.org

-- 
2.43.0


