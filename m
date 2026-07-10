Return-Path: <linux-arm-msm+bounces-118365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sBirF09IUWpUBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 21:30:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD773DC8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 21:30:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dbzvZFUr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JUk8L1qx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118365-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118365-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 496753014777
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAC127727;
	Fri, 10 Jul 2026 19:27:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B4F382299
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 19:27:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711668; cv=none; b=QxaWDz4keXKcrpvbvMCoe8a5ajJFqCG9WNORyHPyjIhOopFcx6NeOhh3FuCQUWjZa/xSUCFB81QEA5Y4ewJPXPxKX7yHkJMpL5z62VBYHwAtsd2M58npNi9ACjMBWn7K09WkIc9tOhSUEmHboiIPQK8KRNai5xqVKtI7PFmXcs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711668; c=relaxed/simple;
	bh=35hLHc2b/IQ8hICngb2fk5Ut8HJYVBZcjh5HU6E5GD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEVYgpNTkRBdx35G2UstXpoiJiyzUUygsgDt4AXPftgMC9DV5bVuIjLW+WjV0wEUk8DtOFzpbpJ44aqF6KCjTDG/3He7GeoZq8h9yolMFWo6gD34k54MgY6fyNjeN3etL9h3oqjucH2uQ7XkrlDPN0MIRB8KNNl7YgY5Hy2DUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbzvZFUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUk8L1qx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3lav1307259
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 19:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=p3MbDHiDYlrOTzVBICqzsrmh6cPzGyKK6S1
	kNRIY/CA=; b=dbzvZFUrSyMfS39s70Li9NfQtd6RN3iB96qfN/5SGJEgmKknCwd
	s5YGJhTZM9K+MgquB4lHwdlCI2QF1BWApyR4ly6jG5XuUAVV60hyorcJKk37jIZR
	AKBMHMNqntb3nRfiA2nibkOhNNMUX4L2OU1+467oDh29vSiyQkiMIDqZSqIWyP0D
	tYZUFNSl5iFidL+Iuk/29PIW9cH9pkDvZFGgdP1BxC9YOz4WYm0s81JOD0twB5RX
	rEk2SIcrzobLHg0Yb7+CBkAawY1dBlUQWEnx/DZe+SuSb3I4qQC9HlzWNC8Cm5CI
	LmWu3M+HhVO0m84RVVbWJi3DQh3OLTHaTaA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dj5kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 19:27:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso16531535ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783711665; x=1784316465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3MbDHiDYlrOTzVBICqzsrmh6cPzGyKK6S1kNRIY/CA=;
        b=JUk8L1qxpusamFInjIqS3mnS3wCORAI8akIavU1/5MbGwBUNNRKqBZKZTaqXSdLJxE
         G2yyYyOX0fF1mM8ARI6pteo6I+hzA4DVGfMOmODFk6CZcoqckMc0j0ajVigdXN2D3gEM
         XaKXKfxx8fs4uAvWc9NnAurPeSss2L5HfYlxQXfQZD9gZCDIJ0/dAXMP7OCOHR8ScMJs
         1Y1DZ/8R3i9GFAmhjzvFkqSnkT+fV4NxF98o1/PVfD1R0YQGO4qB7iS0B0b961dzYdgT
         SLyW6H0fFXdShlZMBjXfxk4DQ68tPlvhz5oh7y3szXsdeNSaX1+M8p4qRwC0M5Buyazy
         A/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783711665; x=1784316465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3MbDHiDYlrOTzVBICqzsrmh6cPzGyKK6S1kNRIY/CA=;
        b=ISGapFdPW1bABtPTp3GT01rf6XtxiiH5gcrxw+0KPu3TLI+0BL6nGovP2GxR1qjkx7
         gMSWSOvgqAg99R8SIBA2iNAVG3loblkGvrjRJxzjoF5tNTltwujxe0RSE8eu9CPcZPXB
         mWpVt2A91hz5nuVkeVV2anUTGxlZrJXnMz48u6IwsOqRwsh3nV18aWmA5/P3AkprWV/8
         fBxKDvTCC/G8DJ8zZV9xMF79hka9uJdXzrxTePTc3eBUq/cG7lKAW6B2OmcqDTHqPCIm
         OZCUdZ8TOZkoagAN7esp6yJ+/u/QAhlJ33o7RM3RA3D22SY09tOfbRbs5M6dviZah4ME
         0qTQ==
X-Gm-Message-State: AOJu0Yx3yOrN51GzRYE04gL0wsW3m5spT4rT5asyvc8KtMIS9tcXkn1t
	5K6Ah9/V2V0HaCrteTeseAq0NBH8KqebdZ5uCRyz9JNHRHt4QLKwSeyECThUJjc5SIIZN+HqNFL
	bE4JYkwVuOOzrOvL/XqtVC03hkYkEt/lvNfVU3sZ/9p7QpQdZaZNWCXpdT0lIHticYs9b
X-Gm-Gg: AfdE7clSGlJ3da4gnsMpuzHtmelQznD8I44stxULH6+ttY/E7kYZdfxLzUuWMOrMKV3
	KZXA+FZWYXDH7HhmmbJUf7qSJElIX/uJrbq0u1BMlX9ukc8rprT7wR1uK26zTg+a1MJpyFhrZ8i
	+KAMDfMNxeuA5O98G+gRHAJdm3f9OvtZ/4opr02tMflf7FhLVup7SVejN31/nXwkP/3D9fgPbGp
	lDlQ+5qb7T6wiHpSOPv25GUO+eaqvtspWX4+dvf4SdTh1ILRlJamYrio3G/Zy6+7iz+PUXW0k2d
	AJGnyaWlfT3PA5AnkV4LeT4MvC32PqsQ2HY38m66xjyVdy3wqVRvWMskdddY89pRzgB9od0FHu5
	RYBTM5tRJ6eXjQVA3z+qCwkCDXELMvtkTbA2WdA==
X-Received: by 2002:a17:90b:5585:b0:37f:ad5c:d18 with SMTP id 98e67ed59e1d1-38dc75ed90dmr278460a91.11.1783711665119;
        Fri, 10 Jul 2026 12:27:45 -0700 (PDT)
X-Received: by 2002:a17:90b:5585:b0:37f:ad5c:d18 with SMTP id 98e67ed59e1d1-38dc75ed90dmr278424a91.11.1783711664432;
        Fri, 10 Jul 2026 12:27:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm45817907eec.27.2026.07.10.12.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:27:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Hawi and Maili SoCs
Date: Sat, 11 Jul 2026 00:57:37 +0530
Message-ID: <20260710192737.1689453-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE5NSBTYWx0ZWRfX85owbh9blxhh
 ypSCjZ4NddJJL29tBgDXawydkz2tIobiLn+LyekEzOHQNu625Y+KsEkt5H27GCTAWe3uge40Jmf
 RPisicZ2lY60LEl04l8+NZ6pfySR4h8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE5NSBTYWx0ZWRfXxrKxXNw4vogp
 DJTPwhUntz1Q74RXnKjRAOKrqGZsVxWGSrhx+KUe6yKmAhK2ZB8S+Tzz7Dr5gVBztdcowHhL5xt
 7M+eV6PWFxKZz4fA26AMDjEdRJvs/W51FlHsPDom1rPP2v0zpGOFLySCTFW0iKPCwHBSO/jgoF6
 txnm/C8rkHbROq38nonSQjhYow0u8aiNKbv4dH0yzpfwUBtpmF46f9OY5jNoFqBaEjEI8yeDdh4
 dTCrKHjQGyC9LZP8RwvBzT+gjICPQazUspryH2664LR/ECKPxqgGVrPh6nN7CYCWjbj7l9M+1ba
 eHIc3YZhvO7jTuMKjzWN6PV6UqEGIUw0jOZoOgkxCSIqynozRZEa6bufXL6hYWYmib8B8nk/ycE
 9b7jb3GsYYjB0lhLqv8WcLS3nGwGVk5RCdAcgpm0ZWQCz2uT27/Uz/96Q3WYIpdvD9voTatMWMZ
 qX0knRlIiHt88XDz4sw==
X-Proofpoint-GUID: Ho_J_YT609iPJ5M2KrdegZjMhB_HLR76
X-Proofpoint-ORIG-GUID: Ho_J_YT609iPJ5M2KrdegZjMhB_HLR76
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a5147b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=w03f12j0Wgemb4Z29XEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118365-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:mfd@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7DD773DC8B

Document Top Control and Status Register (TCSR) controller for
Qualcomm Hawi and Maili SoCs.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 7dd2fe035e6d..297e91a54a1f 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,hawi-tcsr
+          - qcom,maili-tcsr
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
           - qcom,nord-tcsr
-- 
2.53.0


