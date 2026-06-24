Return-Path: <linux-arm-msm+bounces-114283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lo0/K+l7O2piYggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:40:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5650E6BBD4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:40:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n6K6XxPy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JiejGuzM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114283-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114283-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8933B3060771
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 06:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF49A389E07;
	Wed, 24 Jun 2026 06:40:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F833290D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:40:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782283204; cv=none; b=FPeKN4eD/gEgN1arzHQBJ4m57A8D4tFyhz1JYrVCFm8wlxep7GVNDyELOd1cwsVrW24TWiJ1vGhnamB3jlnZ51T80c0WnSmMEYSJG5cIPD8Dt/6ZdCwu2fHr0j2QBHWJkMCWbGaWMJ1R8xOyo12RQ4NtQAstbqYyoMhACh2/+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782283204; c=relaxed/simple;
	bh=6feugmZ8bNJk9b/HM4ICoyHz6MHMMqZybXTRcj5zU84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7ZtQco/VqIuVYgxUzdwwoQA+wdgNMkLORpjo/dd0sv2W89Gk54IPfQbPidekVeiI/E/t8SK3LqJynloa6932VvIfx8s4MKtbUEGxGioWSsWOpnT6iIzc905+xUmumjSMaxaTi+hEWUc4b6aGCmr4Jlefh+Wc+5RBcPv6PYBrBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6K6XxPy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JiejGuzM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u5US3566515
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VcqlmyXQNPVzDdAFTTniN2yAIMyXe+8Mn9t
	IsU4N1wM=; b=n6K6XxPyfdwSKt6zunNK26OS/ZSDIMCAdcEk3pkQOA7k0iLo7k0
	Xybr+AazOue8vKkzlP77zSUnlrwsa2wJd+Yzva6DLHsePN7TGHzQt72q0rr7sg6r
	N3I2fva1hKE9jHvjCUMYM/OCch68geKYifMfTuLMHPn0xfKNHu7MKI+AzHHOzybx
	bGQKEJhZlcoH0zA1D4l50vjVnHPd5/TZFR3/9aNVpIFx1kKSs1dAOlgxdPrmp6D2
	Fgm6mbQgwtvtc3PmOyons60n56zmeWB05ojZSHzoWPYOh4u+cW4V7pBP9Aa5XzXW
	sh6PdPBGv1ZXIbEKwvCd54djkHuEe1ikZ2A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28v5bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:40:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c725d3e886so10839575ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 23:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782283202; x=1782888002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcqlmyXQNPVzDdAFTTniN2yAIMyXe+8Mn9tIsU4N1wM=;
        b=JiejGuzMP1F9p9z8aUseUS1UTe7fnIchNLx8FSm5Yo/FMRTNXGhbnto2KTgiMb9aA3
         Mk9ZRDgGreaC8/LvLzCqwchpVdkUF/gcmvTpWGuduGSk6J97U9o+3Cokclm677v/AR/j
         GvtwvTmy/i39Y3vAPdRNT9U2js0ZM3uu28SJgDbb0UJ+MEKFKo7BuoQgJVrjQUREH6ph
         GJuWjLDVPYatOuBbudL27U2Vu+Cme59t9tiTeDm+scB9y3aICwryggwx7cB+Rh7yBwwR
         c3HJUKX9DZUUYU0i5gqNoocVA7FqkAoB6DnotoXxl8qgOQU9HDwcV8WQN083cKg5WPvx
         yGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782283202; x=1782888002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcqlmyXQNPVzDdAFTTniN2yAIMyXe+8Mn9tIsU4N1wM=;
        b=JSASOj4aobw/kJaZKTeXtHpGLpRXZ1w/v4Q7BXjexTA29HO5BdPGcGMVL4Lo537hg3
         4ClY36zsL3Ci2D0BcjFf0uqCyDR3VqGqFGGa2tzcCGHLQ73Nhzi5fPoPdQkN78bGeTCi
         aXMtNDqhAwWlet5aXGvpBF+RlDHWjGbKlSaouJ2jpPv1c8OXnQQhuG/sHo6/mbhC6tXp
         v4DEl9icYr/1CaSfPkwA3JfVBBgrPA0ajcRbcO93fIcSk8jy0oya1TUQ8mdb60GESBr9
         JfyQLl0IKeqVG7NYkM0aYijC3+HdjMZwo63Pr+gDWAR1xr1S3GQ8H0fpmM5tzbfReJkV
         6+Pw==
X-Gm-Message-State: AOJu0Yxh0igiwssgH2Liye+QZlEtLDKBXg26ipjLX7QjGeNe2Drpy3YU
	sp40hcUCrEnBSeZDzs9a1QWnsG7YFOHPDxWKTAqbeoD4WXtKS6zEFXLdmQHaTd3ZW1WcILUyzte
	pCXrZS8n8m0E8j92G3/CV4A8wRmDjLQgGNpwwKXh9NPJODCyeWgwv5dHIT4ipHmxzz08g
X-Gm-Gg: AfdE7ck5KCAD10WgCLORFCNEzWqyRffkhtGbGiwN2NSYVBHw0W6PTz0mv9m/z18p7Fs
	Zlid1nAt9tCHA6qWDcG49FiprYP4V48wiNfTibV55ALxsYGRIL/vYQ/sasBWarQkOK2tfnzQAkn
	8v/mwss3QXotdSxW0So/LbRdvlo15PgsDVtalytJMz60hIS6Fgl9ZXB3WYzYrje7JzJaF7XJnHU
	KUknVsBNEj1jPgjO17OaTwlpDVAI6CMs36YZtZhno2X/vVNfr/3zJK+RDKjJUG+BzlN8Ov+KytO
	UpPUmFqV0rh+cJ8T8YP3+R62yTFVWXomLrzk6kciD+JnS0gL9NQcUkVkJfsXBYVh+1TzEAe/JJh
	MSR98lJMs4Odu1Ho01fwRcuFLa0r+FbKIXJKWRA==
X-Received: by 2002:a17:903:1987:b0:2c6:afd8:5704 with SMTP id d9443c01a7336-2c7e14572e4mr24145975ad.4.1782283201525;
        Tue, 23 Jun 2026 23:40:01 -0700 (PDT)
X-Received: by 2002:a17:903:1987:b0:2c6:afd8:5704 with SMTP id d9443c01a7336-2c7e14572e4mr24145645ad.4.1782283200929;
        Tue, 23 Jun 2026 23:40:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d37absm131023215ad.20.2026.06.23.23.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:40:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
Date: Wed, 24 Jun 2026 12:09:52 +0530
Message-ID: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1MyBTYWx0ZWRfX1BejO2GoqIkP
 5+Ny6jtSxBvqtlQ/jzg7v5RPySqAwVbVZNZpuSBAh4nR4YJKJOG+0doYScp88CK9v3mu2Fadrh4
 7XAskxB1xJw1u/0U4GJx0TNv2Ma02pk=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3b7bc2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=DWn6f056a08p-O0o_nMA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: mxDaCPnbBW6WVdIz3m9vT3x4WvsnavV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1MyBTYWx0ZWRfX6DIANBPn99oZ
 gTmYhAIxDvpop4keHpDJqIJaoMhi4Tg+usgEMJPsAS2gf986CUI0wd6DIQ9RNztSutxwxVAsL/P
 /DhC/Z9KDR9CtTYUnIqAtTxyTBFqO0BhpvgFYjJJIwADfLRnxkSw+V/V2MKvmUjgAbU4neczYsW
 0oKOVJmPX9Y9hSuAzosqW1gg0qyGWkHHE4K+M8nPl5p2CSN5fwWjIR7wbgm3+utOihwdg0rsUvP
 t5irTVXEkllbZ7a8GMos9URHzWb+RemcABDgujQ/kBDD8Ng7ruJjIeUa1lSkOT3+4afFQCce46/
 uEqGSbRL69L4Ee3PJrr9ue/k94eBtv0aR9bC+qOqwPgORaScUxlLQtboPZKf15XzTRlNVMpH/sX
 49BIPh5RF5IfuDnB8OI/X9cQfTFRTqTZmJHz60sgkrVF25G2Sa5TDHgMQTplP9E9nj0UjM+NYjT
 HXNUnzMlCTX+LTMqaBA==
X-Proofpoint-ORIG-GUID: mxDaCPnbBW6WVdIz3m9vT3x4WvsnavV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114283-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5650E6BBD4C

All the existing variants Kodiak boards are using Gunyah hypervisor
which means that, so far, Linux-based OS could only boot in EL1 on those
devices.  However, it is possible for us to boot Linux at EL2 on these
devices [1].

When running under Gunyah, the remote processor firmware IOMMU
streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
managed by the consumer of this DeviceTree. Therefore, describe the
firmware streams for each remote processor.

Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
devices to create -el2.dtb for each of them alongside "normal" dtb.

Note that modem and media subsystems haven't been supported yet due
to missing dependencies. For GPU to work, zap shader is disabled and
in EL2 mode the kernel owns hardware watchdog which is enabled here.
And for wifi to work wpss copy engine memory need to be mapped for
WPSS firmware to work which is aligning with sc7280 chrome.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/  
 - Added a wpss copy engine memory similar to chrome for Wifi to work.
 - WPSS does not have firmware Stream, so that was removed.
 - Added wifi streams similar to chrome for wifi to work.
 - Removed this patch from Generic Pas patch series, can be followed
   separately.
 - Moved Sumit as co-author as part of modification done to the patch
   in the past.
 - Added some more kodiak's board variants in the makefile.

Changes in v1-v7:
 - mpss was disabled and will be enabled once the dependencies patches
  get merged.

 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 52 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi     |  2 +-
 3 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..d2cee1190954 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -164,7 +164,11 @@ purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
+qcm6490-idp-el2-dtbs := qcm6490-idp.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-particle-tachyon.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
@@ -176,12 +180,20 @@ qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
+qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb
 
 qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+qcs6490-rb3gen2-industrial-mezzanine-el2-dtbs := qcs6490-rb3gen2-industrial-mezzanine.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
+qcs6490-rb3gen2-vision-mezzanine-el2-dtbs := qcs6490-rb3gen2-vision-mezzanine.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
new file mode 100644
index 000000000000..91e4cda45b49
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Kodiak specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1800 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x11a0 0x0400>;
+};
+
+&remoteproc_mpss {
+	status = "disabled";
+};
+
+&reserved_memory {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	wlan_ce_mem: wlan-ce@4cd000 {
+		no-map;
+		reg = <0x0 0x004cd000 0x0 0x1000>;
+	};
+};
+
+&venus {
+	status = "disabled";
+};
+
+&watchdog {
+	status = "okay";
+};
+
+&wifi {
+	memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
+	status = "okay";
+
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1c02 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..2486d15fa2ba 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -91,7 +91,7 @@ sleep_clk: sleep-clk {
 		};
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-- 
2.53.0


