Return-Path: <linux-arm-msm+bounces-108474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPVmAtBLDGrHdgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:38:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5FD57DCAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A3663083084
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38A549219C;
	Tue, 19 May 2026 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYFPd+AC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ug9ETHGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210B495520
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189729; cv=none; b=M7VnE2hVHbbu/VyNIk8ts2fYn72kDfk2abyfXRueqRAxL46IMPqo2a1vPf1JEaX3MyYCwEoL4joWU9orX+UtZsc+dYRR5GPbOF+l5sQTLKaJ8slRZGxKo0DQd6/6XRWRFzp94eYfLqYv1e9rIjT5dct30XSvMnkgeidJFluelGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189729; c=relaxed/simple;
	bh=3g8T9YormSkYWgDl3F7e5ABiK0nEDaH1HoODH/eUpMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rRbyQVA4sCrW5WxQJkXkPVrqK6NW5+BcLOxLZSKryMkPrIfh95yxGGSH3NYaR7AiMhiamLT0DB0JbVWDMr0w6BbbGJsFETdKGuLAUAobEMf4bJ63BqohSNmD+Od55wq08K7G0T/pJdxrCeDtdO4GYMKoNiX1y2Uf7mR/ebmD9fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYFPd+AC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ug9ETHGm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8EXWX3612662
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VFnf7Qb9NMwwdDofHXDX0FRMIDCIJ2obE1mB5oNsB4=; b=oYFPd+ACqt2Ykgzs
	8Hd7Qm5n+tUyhQS5UpG1D7B+DDz+k8gRBsUc2CBbOk3lu/Q3w9sNjlv6RN/bhRHW
	s15P8Yd48voQEfYITLK8xc22z6brjbxiW6z+1ib7dv1A+JWzRsbrSGXqHFsc2YP6
	eRG42JXR4nkKhvcHHpmbPczvMeojM05kl/o97efakRXhFCu9AIZk05NBpAM4sjDi
	ya/O2LIluYvLKCs3O1HKHZeaFKqWNiW5QWTyiC074Q3QUgn/5j/Z0AsjWldsh/SB
	pCscV2FZy6li74ZzUCpWovJ8nhmqnLs6CnwF0KrsMq9EdYFnU74cEalWjW5TZf7S
	Bxs3gA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8m64rsb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4530a90fdso49198685ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189725; x=1779794525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VFnf7Qb9NMwwdDofHXDX0FRMIDCIJ2obE1mB5oNsB4=;
        b=Ug9ETHGmMcBcJkGabOj+1ZnbSpyClHsK8JGLSiGmW/SnJmQOQuI95QyDNkAW0QnKf8
         ppIQus3w3Z8SgPe7YFsZ7o1oxGSKyNxIta6zTEvqmYmefUk0bMsZNdtkvlNAQaZXtjiJ
         yq7LJxXARpnwbAXgxcCtngSDASNJwGZsbV0LHbnDKJj+vGvUPtiCzIsLySFrVvQdk4n4
         upGMJAMBOH+eJzRVDCzzpHjBbUBFXyQAAO9eusl/dAR9oL/Mf7vDK2YN2xaX9o38D43I
         b2Sso5eJlSJiMVtadbTgs72n3I5QCEcNvc6d3wPDPTz4fYNEYvlERpVdaSsMDdapxLe2
         f2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189725; x=1779794525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6VFnf7Qb9NMwwdDofHXDX0FRMIDCIJ2obE1mB5oNsB4=;
        b=MOKX/Vxf7//9rkn3oFUrD0AFULaIHB4ezcAloYi6umEo2ZfcsZ/8WprhLe6YGpVyFx
         p1Y9EQ1ghLtR6970UWhoMmlfbjQiE+dOQiqHki/TzdTvBlFDyZrC1zxj8SO8NdoHkdBQ
         e/AR6YtJdxuPICwdn8R2xkyPeF4W97IVtVswaEa+cCwqhanhFCJY3h7YoB5cVK+HLYtw
         Rdk5RFlm+Uho25wvu0acN4Q/8VjPmhmOfV05uWtWmjHwx2Zd27Ys7VPMHwhpcraW4Bt2
         KliZgqJ+KF++l2ljj3zMzv+pTCpvHjbdR3d+te1RxllDrG4uFF3n7fdV0sZWWeYdUBns
         auSQ==
X-Gm-Message-State: AOJu0YxAyhWLj7S84IEvVioPhLWXGTGK33DQt2CjjnhH+PRyqzbRukS4
	z9xNHDAn/KlOjuCJ+CJxh3+m7p61Rqtgztp8nNp6260J/Mu/SgeAirg46rbpwEM2nFJGQXWBtyb
	4yUAPT2jFi0KuQ2XXgUUaCl4vHCluRWOVfmwO6oqwCSunOe0hPYZzgmVgjxypM93yCN8h
X-Gm-Gg: Acq92OHWp7CLlgmYZq3SVXuh7gD0W5mtFtDQM1Mq1s/HRXQceKiWEogkVONVyrbuKkx
	n/tJJNkmeNes+kECE27rnmy8Ir0ALG8kchLwv2CPwtNusail/1XfZ4qhqY4U1zFBTwODGKdbXUr
	PE/koVUnC2zhHzVXhUQEHyQyUg1CwsWPcDVlqforemq098K1cAVJ4OJRo/Isgbtg74EGTVB8602
	72nkBnsnQ118ex96eI4lwcoNxOVXHzPsOfTQjELACuxiyLvyiFU58Tc4F7yKOVbyFvL1XDOWuhT
	WdAPt8et2V+S+MJ6XCY86HxFiYjabQUssxGzCEvmhXgaU2mvgtbIbjGciEcs5VFirlvCKJaTTdk
	g9437DNt6eJ7AIggxIGQsAVWs0w3fDjFsr+hW
X-Received: by 2002:a17:903:b10:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2bd7e93871emr210174435ad.31.1779189724692;
        Tue, 19 May 2026 04:22:04 -0700 (PDT)
X-Received: by 2002:a17:903:b10:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2bd7e93871emr210173795ad.31.1779189724077;
        Tue, 19 May 2026 04:22:04 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe78b9sm192743605ad.43.2026.05.19.04.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:22:03 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:51:22 +0530
Subject: [PATCH v2 2/5] arm64: dts: qcom: Introduce Shikra SoC base dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-shikra-dt-v2-2-c01b90fb4395@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779189702; l=27133;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3g8T9YormSkYWgDl3F7e5ABiK0nEDaH1HoODH/eUpMg=;
 b=RPGwoEa8nu4FU4NhbMY7dpHWufPTjVeVg+T3fRiGYOJtPujEarLKoHaDFMqcrAeU/MFGr4HuI
 ao0IchiwhpWCqKB6XPtfxAd6DJ9uolG3ZMo3Vk2k4aR4/4Ji/6rtaci
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfXxqZFEqdeeGNe
 5OXlALp8ITkrejss7EqEyliisQrxL8jeLAjhmCXTWn9oW0zbwPC6VO6Fvxo9xOYdH7l13l4ahw4
 YrZY912ZQh+/4HcBJFlaOi/7bGUhuv2wD43X9nU90racIUe81Chbyk1Ea0OuRvMFXYXRUh40UXP
 Bm9WAyTnkR+mp33Uy70HVg8V8OyoIWAWGWaITfR1Y/WEUMeRuKRdwOT+FgkU3VyZxjV+SM2UfQl
 fAZVcIr6he9Juq5GgKAUgm44iJ1QDtttCQvgeRsqPtVVqxIb+CimNM+5z7DPeDsSI9AwbI+SwWE
 fT2m1JNpGHRFj/0V9DPoVWnfYGglwqz51uIN/c2AkCTq+wU7+JaYtrvJoVz6eY1m0MQViI5NWot
 CyTLso3S2DETNKw8rly7UBSzNwQzfvEkfOoq4tsC0IzPRZc+HPVwxJtjkGPrhAwwv6iCGPqTgrv
 HwiQXg+GCYiiziRyaJg==
X-Proofpoint-GUID: ARNvbCLWvHhfGZGa4n90Vvbkh7bc3_th
X-Proofpoint-ORIG-GUID: ARNvbCLWvHhfGZGa4n90Vvbkh7bc3_th
X-Authority-Analysis: v=2.4 cv=J8aaKgnS c=1 sm=1 tr=0 ts=6a0c47de cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=c5Ed9O7bsO9zGogcny0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108474-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E5FD57DCAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial device tree support for the Qualcomm Shikra SoC,
an IoT-focused platform built around a heterogeneous CPU cluster
(Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.

Enable support for the following peripherals:
  - CPU nodes
  - Global Clock Controller (GCC)
  - RPM-based clock controller (RPMCC) and power domains (RPMPD)
  - Interrupt controller
  - Top Level Mode Multiplexer (TLMM)
  - Debug UART
  - eMMC host controller
  - USB 3.0 controller with QUSB2 and QMP PHYs
  - System timer and watchdog

Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 981 +++++++++++++++++++++++++++++++++++
 1 file changed, 981 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
new file mode 100644
index 000000000000..31d0126e5b3e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -0,0 +1,981 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,rpm-icc.h>
+#include <dt-bindings/interconnect/qcom,shikra.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l3>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l3>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			next-level-cache = <&l3>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78c";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			next-level-cache = <&l2_3>;
+			capacity-dmips-mhz = <1946>;
+			dynamic-power-coefficient = <486>;
+
+			l2_3: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3>;
+				cache-size = <0x40000>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu3>;
+				};
+			};
+		};
+
+		l3: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+			cache-size = <0x80000>;
+		};
+	};
+
+	firmware {
+		scm {
+			compatible = "qcom,scm-shikra", "qcom,scm";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
+			qcom,dload-mode = <&tcsr_regs 0x13000>;
+			#reset-cells = <1>;
+			interconnects = <&system_noc MASTER_CRYPTO_CORE0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+		};
+	};
+
+	memory@a0000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
+	};
+
+	pmu-a78c {
+		compatible = "arm,cortex-a78-pmu";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	rpm: remoteproc {
+		compatible = "qcom,shikra-rpm-proc", "qcom,rpm-proc";
+
+		glink-edge {
+			compatible = "qcom,glink-rpm";
+			interrupts = <GIC_SPI 194 IRQ_TYPE_EDGE_RISING 0>;
+			qcom,rpm-msg-ram = <&rpm_msg_ram>;
+			mboxes = <&apcs_glb 0>;
+
+			rpm_requests: rpm-requests {
+				compatible = "qcom,rpm-shikra", "qcom,glink-smd-rpm";
+				qcom,glink-channels = "rpm_requests";
+
+				rpmcc: clock-controller {
+					compatible = "qcom,rpmcc-shikra", "qcom,rpmcc";
+					clocks = <&xo_board>;
+					clock-names = "xo";
+					#clock-cells = <1>;
+				};
+
+				rpmpd: power-controller {
+					compatible = "qcom,shikra-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+
+					rpmpd_opp_table: opp-table {
+						compatible = "operating-points-v2";
+
+						rpmpd_opp_min_svs: opp1 {
+							opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+						};
+
+						rpmpd_opp_low_svs: opp2 {
+							opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+						};
+
+						rpmpd_opp_svs: opp3 {
+							opp-level = <RPM_SMD_LEVEL_SVS>;
+						};
+
+						rpmpd_opp_svs_plus: opp4 {
+							opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+						};
+
+						rpmpd_opp_nom: opp5 {
+							opp-level = <RPM_SMD_LEVEL_NOM>;
+						};
+
+						rpmpd_opp_nom_plus: opp6 {
+							opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+						};
+
+						rpmpd_opp_turbo: opp7 {
+							opp-level = <RPM_SMD_LEVEL_TURBO>;
+						};
+
+						rpmpd_opp_turbo_plus: opp8 {
+							opp-level = <RPM_SMD_LEVEL_TURBO_NO_CPR>;
+						};
+					};
+				};
+			};
+		};
+
+		mpm: interrupt-controller {
+			compatible = "qcom,mpm";
+			qcom,rpm-msg-ram = <&apss_mpm>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING 0>;
+			mboxes = <&apcs_glb 1>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#power-domain-cells = <0>;
+			interrupt-parent = <&intc>;
+			qcom,mpm-pin-count = <96>;
+			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */
+					   <12 422>, /* DWC3 ss_phy_irq */
+					   <58 272>, /* QUSB2_PHY dmse_hv_vddmx */
+					   <59 273>, /* QUSB2_PHY dpse_hv_vddmx */
+					   <86 183>, /* MPM wake, SPMI */
+					   <90 157>, /* QUSB2_PHY DM */
+					   <91 158>; /* QUSB2_PHY DP */
+		};
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: hyp@80000000 {
+			reg = <0x0 0x80000000 0x0 0x1600000>;
+			no-map;
+		};
+
+		xblboot_mem: xblboot@85e00000 {
+			reg = <0x0 0x85e00000 0x0 0x100000>;
+			no-map;
+		};
+
+		secdata_apss_mem: secdata-apss@85fff000 {
+			reg = <0x0 0x85fff000 0x0 0x1000>;
+			no-map;
+		};
+
+		smem_mem: smem@86000000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x86000000 0x0 0x200000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		audio_heap_mem: audio-heap@86200000 {
+			reg = <0x0 0x86200000 0x0 0x100000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@a0000000 {
+			reg = <0x0 0xa0000000 0x0 0x100000>;
+			no-map;
+		};
+
+		qtee_mem: qtee@a1300000 {
+			reg = <0x0 0xa1300000 0x0 0x500000>;
+			no-map;
+		};
+
+		tz_apps_mem: tz-apps@a1800000 {
+			reg = <0x0 0xa1800000 0x0 0x2100000>;
+			no-map;
+		};
+
+		mpss_wlan_mem: mpss-wlan@ab000000 {
+			reg = <0x0 0xab000000 0x0 0x6e00000>;
+			no-map;
+		};
+
+		wlan_mem: wlan@b2300000 {
+			reg = <0x0 0xb2300000 0x0 0x100000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@b2400000 {
+			reg = <0x0 0xb2400000 0x0 0x1900000>;
+			no-map;
+		};
+
+		gpu_micro_code_mem: gpu-micro-code@b3d00000 {
+			reg = <0x0 0xb3d00000 0x0 0x2000>;
+			no-map;
+		};
+
+		video_mem: video@b3d02000 {
+			reg = <0x0 0xb3d02000 0x0 0x700000>;
+			no-map;
+		};
+
+		lmcu_mem: lmcu@b4402000 {
+			reg = <0x0 0xb4402000 0x0 0x300000>;
+			no-map;
+		};
+
+		lmcu_dtb_mem: lmcu-dtb@b4702000 {
+			reg = <0x0 0xb4702000 0x0 0x40000>;
+			no-map;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+		ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+
+		tcsr_mutex: syscon@340000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x00340000 0x0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		tcsr_regs: syscon@3c0000 {
+			compatible = "qcom,shikra-tcsr", "syscon";
+			reg = <0x0 0x003c0000 0x0 0x40000>;
+		};
+
+		tlmm: pinctrl@500000 {
+			compatible = "qcom,shikra-tlmm";
+			reg = <0x0 0x00500000 0x0 0x700000>;
+
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			gpio-ranges = <&tlmm 0 0 165>;
+			wakeup-parent = <&mpm>;
+
+			qup_uart0_default: qup-uart0-default-state {
+				pins = "gpio0", "gpio1";
+				function = "qup0_se0";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			sdc1_state_on: sdc1-on-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <6>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_state_off: sdc1-off-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-bus-hold;
+				};
+			};
+		};
+
+		mem_noc: interconnect@d00000 {
+			compatible = "qcom,shikra-mem-noc-core";
+			reg = <0x0 0x00d00000 0x0 0x43080>;
+			clocks = <&gcc GCC_DDRSS_GPU_AXI_CLK>;
+			clock-names = "gpu_axi";
+			#interconnect-cells = <2>;
+		};
+
+		llcc: system-cache-controller@e00000 {
+			compatible = "qcom,shikra-llcc";
+			reg = <0x0 0x00e00000 0x0 0x80000>,
+			      <0x0 0x00f00000 0x0 0x80000>,
+			      <0x0 0x01000000 0x0 0x80000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc_broadcast_base";
+			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		gcc: clock-controller@1400000 {
+			compatible = "qcom,shikra-gcc";
+			reg = <0x0 0x01400000 0x0 0x1f0000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		usb_1_hsphy: phy@1613000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01613000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_qmpphy: phy@1615000 {
+			compatible = "qcom,shikra-qmp-usb3-phy";
+			reg = <0x0 0x01615000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "cfg_ahb",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "usb3_phy_pipe_clk_src";
+
+			#phy-cells = <0>;
+			orientation-switch;
+
+			qcom,tcsr-reg = <&tcsr_regs 0xb244>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+
+		system_noc: interconnect@1880000 {
+			compatible = "qcom,shikra-sys-noc";
+			reg = <0x0 0x01880000 0x0 0x6a080>;
+			clocks = <&gcc GCC_EMAC0_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_EMAC1_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_SYS_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>;
+			clock-names = "emac0_axi",
+				      "emac1_axi",
+				      "usb2_axi",
+				      "usb3_axi";
+			#interconnect-cells = <2>;
+
+			clk_virt: interconnect-clk {
+				compatible = "qcom,shikra-clk-virt";
+				#interconnect-cells = <2>;
+			};
+
+			mc_virt: interconnect-mc {
+				compatible = "qcom,shikra-mc-virt";
+				#interconnect-cells = <2>;
+			};
+
+			mmrt_virt: interconnect-mmrt {
+				compatible = "qcom,shikra-mmrt-virt";
+				#interconnect-cells = <2>;
+			};
+
+			mmnrt_virt: interconnect-mmnrt {
+				compatible = "qcom,shikra-mmnrt-virt";
+				#interconnect-cells = <2>;
+			};
+		};
+
+		config_noc: interconnect@1900000 {
+			compatible = "qcom,shikra-config-noc";
+			reg = <0x0 0x01900000 0x0 0x8080>;
+			#interconnect-cells = <2>;
+		};
+
+		qfprom: efuse@1b44000 {
+			compatible = "qcom,shikra-qfprom", "qcom,qfprom";
+			reg = <0x0 0x01b44000 0x0 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qusb2_hstx_trim_1: hstx-trim@25b {
+				reg = <0x25b 0x1>;
+				bits = <1 4>;
+			};
+
+			gpu_speed_bin: gpu-speed-bin@2006 {
+				reg = <0x2006 0x2>;
+				bits = <5 8>;
+			};
+		};
+
+		spmi_bus: spmi@1c40000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x01c40000 0x0 0x1100>,
+			      <0x0 0x01e00000 0x0 0x2000000>,
+			      <0x0 0x03e00000 0x0 0x100000>,
+			      <0x0 0x03f00000 0x0 0xa0000>,
+			      <0x0 0x01c0a000 0x0 0x26000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&mpm 86 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
+		rpm_msg_ram: sram@45f0000 {
+			compatible = "qcom,rpm-msg-ram", "mmio-sram";
+			reg = <0x0 0x045f0000 0x0 0x7000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x0 0x045f0000 0x7000>;
+
+			apss_mpm: sram@1b8 {
+				reg = <0x1b8 0x48>;
+			};
+		};
+
+		sram@4690000 {
+			compatible = "qcom,rpm-stats";
+			reg = <0x0 0x04690000 0x0 0x14000>;
+		};
+
+		sdhc_1: mmc@4744000 {
+			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
+
+			reg = <0x0 0x04744000 0x0 0x1000>,
+			      <0x0 0x04745000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			iommus = <&apps_smmu 0xc0 0x0>;
+
+			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			interconnects = <&system_noc MASTER_SDCC_1 RPM_ALWAYS_TAG
+					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					&config_noc SLAVE_SDCC_1 RPM_ACTIVE_TAG>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmpd QCM2290_VDDCX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
+
+			qcom,dll-config = <0x000f642c>;
+			qcom,ddr-config = <0x80040868>;
+
+			bus-width = <8>;
+
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+
+			resets = <&gcc GCC_SDCC1_BCR>;
+
+			status = "disabled";
+
+			sdhc1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <250000 133320>;
+					opp-avg-kBps = <104000 0>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <800000 300000>;
+					opp-avg-kBps = <400000 0>;
+				};
+			};
+		};
+
+		qupv3_0: geniqup@4ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x04ac0000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			uart0: serial@4a80000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x04a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart0_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+		};
+
+		usb_1: usb@4e00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04e00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_EN>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu 0x120 0x0>;
+
+			phys = <&usb_1_hsphy>, <&usb_qmpphy>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+			snps,usb3_lpm_capable;
+			snps,parkmode-disable-ss-quirk;
+
+			usb-role-switch;
+
+			wakeup-source;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
+		sram@c11e000 {
+			compatible = "qcom,shikra-imem", "mmio-sram";
+			reg = <0x0 0x0c11e000 0x0 0x1000>;
+			ranges = <0x0 0x0 0x0c11e000 0x1000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
+		apps_smmu: iommu@c600000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x0c600000 0x0 0x80000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		intc: interrupt-controller@f200000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0xf200000 0x0 0x10000>,
+			      <0x0 0xf240000 0x0 0x80000>;
+
+			interrupts = <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			#interrupt-cells = <4>;
+			interrupt-controller;
+
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu3>;
+				};
+			};
+		};
+
+		apcs_glb: mailbox@f400000 {
+			compatible = "qcom,shikra-apss-shared", "qcom,sdm845-apss-shared";
+			reg = <0x0 0x0f400000 0x0 0x1000>;
+			#mbox-cells = <1>;
+		};
+
+		watchdog@f410000 {
+			compatible = "qcom,apss-wdt-shikra", "qcom,kpss-wdt";
+			reg = <0x0 0x0f410000 0x0 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&sleep_clk>;
+		};
+
+		timer@f420000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x0f420000  0x0 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x0 0x0 0x10000000>;
+
+			frame@f421000 {
+				reg = <0x0f421000 0x1000>,
+				      <0x0f422000 0x1000>;
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
+			};
+
+			frame@f423000 {
+				reg = <0x0f423000 0x1000>;
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			frame@f425000 {
+				reg = <0x0f425000 0x1000>;
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			frame@f427000 {
+				reg = <0x0f427000 0x1000>;
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			frame@f429000 {
+				reg = <0x0f429000 0x1000>;
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			frame@f42b000 {
+				reg = <0x0f42b000 0x1000>;
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			frame@f42d000 {
+				reg = <0x0f42d000 0x1000>;
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+
+		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+};

-- 
2.34.1


