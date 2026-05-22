Return-Path: <linux-arm-msm+bounces-109401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDI7HpO1EGohcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:59:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8585B9CC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57E7C303CD23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBC537DE8A;
	Fri, 22 May 2026 19:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLImMkLb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dl1J9Ict"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6324437DE9F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479652; cv=none; b=KZZMTo5TyauBgsqv2pxfNKzqKmEZtB7F3k5qCos+YilVQ3X3+uKzdK9W5bDcjEG+kSRxmuCJeLnlzND9Gzrgo3aQ/4J8wOh4yLeZgdSTmLoxLcBNST83mMUToeQgfcQ4+23kBFVnE380cFoXk2V//PoUO0sphWsaR1ZrPasBHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479652; c=relaxed/simple;
	bh=Ir5UQ6m0XZACy/aa3aVE/G9MiH/ns+zTC94Ny++IQMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtxMltEvbBCBEkqP/bPTYpglwHTXn1OF7RwgU3w1yUwM2EzaorsFWgCpVkNdux2omNAcQfqf+eDg/A4LxWmBriAc8ZwmvbFAVm46ac1Rb7U21EKPHNT1Vsf1RsL9Ei+wcHsEBO9H6JqIurEdampzMcBpoIQ2pBoobmN+VEQ/CJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLImMkLb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dl1J9Ict; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MCYFMa779483
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TfTnIol6t8Z
	6QvjjgxBhVOVknkQUpX65xcktnI9WvMM=; b=DLImMkLb3teqvttEzlDCaZYkCGe
	CWn5ygW5PsD0vX3NjSmZiaqoRG9hXnaD+Nb+Y2DdtOP8aeRxrq4HEb/5Z1Tk0Wt4
	CicJw4A+/XC08rVubEkiG0ax9SiNjVjfVdSU8JC+0D6OqRcrjTbnX5kfap/623ht
	tJNJA3zJwV21kVDMuZG2cWTE9v2TL0zUIhbTpo31WIxkGWgF5dGm4ZYBapReTo2Q
	pXGqi9PaAUVnIzD443F5XI873WF3kkTkQ0kUNaq/HruBOM0NYsMoWxnQBoB8i/zv
	9IqF9jw/UDCoUXHZL1mtBcP3o3AGepL6zKTQu8AJFM8J9gN5X2HRqzppIkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7avd5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba224c3ffdso181865505ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479646; x=1780084446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfTnIol6t8Z6QvjjgxBhVOVknkQUpX65xcktnI9WvMM=;
        b=Dl1J9IctWd74Z+iHxRKuv0MBqDjmyShhHesIigW2P+5stwPsZLHBImJ4oYXCDV9XUl
         JSL/fNwNguc4yj+kxsdNiveymsSe9tPqQkn7PvRaehF2fU6gxm0i3dagFLDroorkr+Iz
         49XQD+aF/59yUVCBA4UQWUwdlRxFdSk9LzRVSyV+YLn9aVVDiEKFT2+VIm7GqQnrQT/q
         +5bQtPdlCxcSSbRkmwecbrEtvHIHCER4qypvISWnVrar8NwU+uGKc+IgAM6BRux5IY4s
         +j3x/Yqzr2m25DZ/r2KkAebOaHUZPNecj/HNXpeKyJmxuWO3RFZoeauyn55rwWHTFI4S
         N9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479646; x=1780084446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TfTnIol6t8Z6QvjjgxBhVOVknkQUpX65xcktnI9WvMM=;
        b=cHci/FCVDVxp74FLXhbOM50SWk/j607g6BPlKFzpO6/FzlHB6THY9oEONidvG+cs7T
         VhXPUJWl6G5D8+CbDxq2aTuj1OTPmOo5gtPprzcdSl/eMYDKsLkEKEoiDhHa5Jz+1qtU
         kWEmXxJpfz8PBh5C/e5OzfULCvaMkj0X8HKv44+g0XIHRe4Dkeohl5K3ob5v8RhTR47W
         GvnC4ax/KNAiDkphv1Xr95eTtgQRI2/RenSq90Ml2a0XSBWf1tflLbz4iO3QIZ219To9
         p1rOHW9pIA5OW6Df0UuFnBwo7wUQjNvaI1XItDGlm59M5g+6C9GPt6O6vxYt0SLwO7zw
         VFDw==
X-Forwarded-Encrypted: i=1; AFNElJ9JR8V+6TRGXUntsG54CNdE03oKT/ShEhQwvj01f208n+bAP23AAH7lpftZpcHgG0FYMWoCuk/qKUuQNcYX@vger.kernel.org
X-Gm-Message-State: AOJu0YywdEg03AzKM3TXGTzWNOWOp+13f/JaG7VfRLKGowUUh2fujG6A
	7ksHznzBCfw0G3kQQOYPJnheSqgZ7tbkqcroLkHvimkv3M+padhy068cIcs7QWPB8wxQocJmluu
	eD5oCzZJoWbeuKbpBvmKrFYhAZeuSdr6F6e/PmZym9Ro+HjADsy2CAf4ATYU2B1gV3xUWdIkAPG
	lr
X-Gm-Gg: Acq92OGh693AXIjah4P4T+5zlV46V0oVCn5AUx9csm93dlVmteFPozqbgDNpHa83YI0
	xKvUaAcL91tt22GunBm6imANRx2Yhr8mJ0EfzMEbA0wizGCgp3ZCO0QOfW+FuXOZukLVUfcE0hL
	WKp5chUxrvT9f1o1ZbAoy2LMCDi2cgdpSTQKf1ILHbLpKTqyhA+WAQRHv0y6I3PXFGX/8EKHOsn
	4J3njfJJi+TzMU0FiMQuYhGfo+UrKp99V9KZ+TnUbAdPoYNrouFnZxuxV8ldPPqaa09wBhkPQes
	MIt0yei/kA2DC7j35izDAEFt/Un1SkjVoCqAmJZWZX2vq1DxcLO8zkEuK23qu1vq6KFyU2L6Nsu
	bmDoLGF8702q/tVle3aSLo7Rxpya7+LpLY5OY8rSztKrUsXFABHs48p5SO50=
X-Received: by 2002:a17:903:2f4c:b0:2bd:61e8:1ee with SMTP id d9443c01a7336-2beb05d9fa4mr59101905ad.21.1779479646010;
        Fri, 22 May 2026 12:54:06 -0700 (PDT)
X-Received: by 2002:a17:903:2f4c:b0:2bd:61e8:1ee with SMTP id d9443c01a7336-2beb05d9fa4mr59101565ad.21.1779479645452;
        Fri, 22 May 2026 12:54:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 01/18] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
Date: Sat, 23 May 2026 01:19:52 +0530
Message-ID: <20260522195009.2961022-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mPAzmvfHSlv3NI6GtpWvjEgorG0SgAwA
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a10b45f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Uf9RHLb8GrDHKnSoJrcA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: mPAzmvfHSlv3NI6GtpWvjEgorG0SgAwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX27ol8EIpvCMc
 Zl/rOdrbDmMoKUasoYlCplN2ceOaPHe81WQkjAIttQYrL7+XOgSoJNcuBTaaglq6UeE7oBviO6E
 obyTLuhCBzCUgZpyVFKsnyQS8BJsH2R9XCBLBg95D+oNZhNDSHiddEb/qkM7DSJT62+ZmW2B/0N
 KHLz3nxsZDtxONB/Tech0K3s8T5NPBGvTBX0GIhDIb7iyYqL4VsywIuISMw3nG7cuOadRTR3VUN
 U2neSTONa/jXkpr4ZPcCii6IEmlt1HRZIcgIKalz0z5aQ/bAABgnJEpHmCEiMSU5w0fERmlAPtt
 Yktoh+nc+l8rTtlM0cELRiU+yRwoYXZPbiORhcgImb6Sq5SDa4rIzF4O/5grmnGwjwxCktdYsfz
 8VwKGErrlsfdRkuL6whEKPjEVVB0k0R8WARipJ/YjGVisTn6WtDDGztw5KuaEYnfu0au6FSTyzK
 GtZDFIqBbnPScBvsIrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109401-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.987];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF8585B9CC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
 to deliver it (USB upload to a host, or save to local storage).

Add a 'sram' property to the SCM binding to describe a region in
always-on SRAM where the minidump download destination value could be
written. Boot firmware reads it before DDR is initialised on a warm
reset to decide where to store the minidump either to host PC or to
on device storage.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacbc91..2d68b4065341 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -129,6 +129,13 @@ properties:
           - description: offset of the download mode control register
     description: TCSR hardware block
 
+  sram:
+    description:
+      Phandle to a region in always-on SRAM used to store the download
+      mode value for boot firmware to read before DDR is initialised on
+      the next warm reset.
+    maxItems: 1
+
 allOf:
   # Clocks
   - if:
-- 
2.53.0


