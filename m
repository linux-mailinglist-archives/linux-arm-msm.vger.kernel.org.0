Return-Path: <linux-arm-msm+bounces-116957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mZf7ECHWS2qIbAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:21:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7F7132A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:21:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Tk/31WvD";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VDbSvW8h;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116957-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116957-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D8483003D02
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC67D42254E;
	Mon,  6 Jul 2026 16:14:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599DC40683F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:14:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354480; cv=none; b=ZceyRyCafLNGMQbf9TfGobpGeljpMIOxKfWjvdB3gKTXS9AvLVJjx2BH4lp8vuFooyA52RtwONBXMlFaSzoqHLj6+5R/+QNirwc0BLNGdKm/aHRrSyxNRDNHcGyr8w8Vd5usW3zHlw/rU8CsET+dAOJrwEsb6pA7JhV0hSkGZGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354480; c=relaxed/simple;
	bh=20HwkMC9gwkEM2VZHp9aUv9EBzJvaY9vztOC/M8OIjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Td1qwjE5qFS6HZQoYfMe6+A8n/Vq3imX6HTXnsepqoIAc52uXI08jGKrAQLnEkytx2G7Tqg7n1Q2c/ZKuNkjGAvqFoP46h+h1LpQ+zoMsFUBHOgepPkcBSeuBA8OCygGsLwzGPHPSxemtK/wDAJI1r3PNYODVzRiJ7zPU8gzQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tk/31WvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDbSvW8h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFGiK809794
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GIdzVAZfEz/3bVoeE9ZzBHSMtW0QCEGCoyc
	XI4YxZv4=; b=Tk/31WvDhlds2Tm4DaWGQqfzeVq4CvW3m1G1vWX63KHm8hJeGA0
	T3jW7Ac63ZmhlauWZTjcKVtsgz0eS5qEJztdhS6W0sZtQhD04+P6g/SZRaIYAF+d
	o/m3GIQssWHVTjtjXeEhXOQYdVrLc4D2RGUV7hcAB0H9yI+jx5OQI1YoEyOSJ78s
	FNjNXIVxytAOKngE/0FesoavlqpVyeLVB0LEy61hC7Yyjrj/ZIrYFMMl+Pf3bved
	YswfBv6/Pz+AAsLBbAH3dW1YGvQ2ZK+mhAv2dFZr9a7MSBRpA8HoSONFYYuthORJ
	6SuH1nabpBqtJ87fB7X9IMbeyjBY/BiD3hw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsa7e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:14:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso8542085ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354477; x=1783959277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIdzVAZfEz/3bVoeE9ZzBHSMtW0QCEGCoycXI4YxZv4=;
        b=VDbSvW8h8hOARmIUSreVd1SYTBFwrWL+MZ+MIx96WaVpyM8E6PxqLzLp5qJTgb3fr/
         yt9MYHsmYVBVB0HCZEGfkiBbge5asC20ff9LDGqeoX9OwRrprNbCZI9do3HN7BHqwdPq
         SS3Tf+y0XV7HlzHcVIQUALYf+38614ZtDzna0z00SvlpJAL5I2clgMKI8v4qdGyScrHP
         G3mbwXkXqCQln67ix6nd1+ivmSYy32WSgxC7zLCvnN9n06FAwXrWAUSVlvZ8K9sxYPxK
         pxEre+14rJ1FlZCCWZRTjxZmmoMyJpmi4we4aPRY/VjLQ4u88Xpd3vJ7Yn6+qn/1kfV1
         mIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354477; x=1783959277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIdzVAZfEz/3bVoeE9ZzBHSMtW0QCEGCoycXI4YxZv4=;
        b=nKOFUQDhHlhkouppXraZRynrqTQ+c9Pc94rf1YrTEuLUMFb37ixaoPn544lsekA3T2
         ExCjD5fu39NRa+N21GGnj3FHhPaymLEkvYskgQDnaLNGjo4pyihy57P4PmBJhVkLl5Dy
         0QmU68mCsLpWp6E277lTBXoIOCQfuCkf5bLziUfLOOh9jZhd9JHAwQDc61awpdt52zlQ
         0Xe/qP09EPKTli/tXlE5Em4UG9sKTxzB7GcUt5K+QIYXmyysUMnDaX/0s6WKqoMwKzt2
         Csddr29YtIhBFDU4xlKb+NMKnug80VlMBFj2VePSrkY1qqCTxAdPQPir3OlAFo1QT+33
         Focg==
X-Gm-Message-State: AOJu0YwcKlachlEki7+4X6KUBwU1q0n1A7t9Eqw7KCSPXbC9Al599W8e
	vn7Z4KORxIV9wF4dUCl58Z4/7n1zIYPFMPC0Sblm0ro3u+ZFuJG8ZP7cPABIMZ9hKUT5ytX3PBc
	TozKaXev7EwH7snkEdIzLRkGUGqNrG6AZIweF/FaP/h0WEB/1jbGprJ1m4iKucQ+AlAVU
X-Gm-Gg: AfdE7clPQaFMbkGjNIQu61fUjKiOPAw3L6Ujz4yL5N8gvhwe/ZxaBLyPIhxy/fweexR
	cR/3tg3qNhCTh7LIPvnAk5X95rQkFUsK/Y270tB2hpuRsDuAwi4PkTUTahfSNCwv1Ii7QmVebXB
	QPGd9icESSXsdfB3GoBih/zcodjbr8k+eY8QtyGzjLVPiBYhzamEFTaqrijcbzSc5it0j21+gFb
	cB/7JkShpKpRBtGpxwhrYDGzvdguO9fvsYECXNBN1rjX/ATSPOfhuo8CAQyudWTZXv1tg5dpwIq
	o0cGXNIIvliiL8Aafrbig7kxdKhte7kOwf0h0tY4n3yose1eRwprSzv8S8IME4gqhtxqMCUlISS
	BdcLziZQgeBvKblKPQNwsDDWo/xGYzbWsTeLBnQ==
X-Received: by 2002:a17:902:d4cb:b0:2cc:9473:9799 with SMTP id d9443c01a7336-2ccbe71f6abmr13213645ad.17.1783354477153;
        Mon, 06 Jul 2026 09:14:37 -0700 (PDT)
X-Received: by 2002:a17:902:d4cb:b0:2cc:9473:9799 with SMTP id d9443c01a7336-2ccbe71f6abmr13212965ad.17.1783354476316;
        Mon, 06 Jul 2026 09:14:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm86083468c88.9.2026.07.06.09.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:14:35 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v9] arm64: dts: qcom: kodiak: Add EL2 overlay
Date: Mon,  6 Jul 2026 21:44:28 +0530
Message-ID: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VFsD-6mCehPGhoWzBsnp2w75IfQ8KlE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NSBTYWx0ZWRfX2pOqzWGoXmT9
 6eSfp/ITlEgPIHAgN4LbeksGGmH8Y5M4c1DZT+figd2edxCa9X0x1WpW17/Zj/dUw3BIGquLERN
 KizDmnrn0RnVz6LRR6BIG+vwCx00aT34dciQIR/Cgb3vld3qsmOSrMHt8cOrE+ibh2Eyvd1fXsC
 Oi4siVYQ4VXEp7AeFx3EZPmj44GFUxknJke1dJcY9AV7X68iUODawZsg877Z1G6FFkUfvOHl4fG
 vW/KY5gI4XTzLPpzrlAVOFvWGUHrLQXCCFguwgqIqINHIN5xNKt288MKZfQf2YTxKveihmkOb69
 wS7WzLECwHGJ3vTd/2L18HJoGPNAmvTvLtn+/gL6uh6rPrcYY4H+i6y3KROyuxqv5jevmQ+QeMp
 wy1Jui0htugWXr/sCJ8K2Xi5pVh7p1E649et2kFiF6PGp/a6vBL+YecnFucQluz4qaOXtsI+yLp
 PRvJ99wazfEAd5niDjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NSBTYWx0ZWRfX1BF0587m9y3e
 MiHXt9XV2pSLQREuyGJz9kltsg7nO9v2dDZsKo1T2FmTTtuJZXIdRa+8Uta0/YUWXJRk+OQ+y2h
 EaeEhpK7jz4/D+FIsPmZDljFJvqePpY=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bd46e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=OmtaVqwek3-yi6n--wEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: VFsD-6mCehPGhoWzBsnp2w75IfQ8KlE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116957-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8D7F7132A9

All the existing Kodiak board variants run the Gunyah hypervisor, which
means Linux can only boot at EL1 on those devices. It is possible to
boot Linux at EL2 on these devices [1].

When running under Gunyah, remote processor firmware IOMMU streams are
controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
consumer of the DeviceTree. Describe the firmware streams for each
remote processor in the EL2 overlay.

Add an EL2-specific DT overlay and apply it to Kodiak IoT variant devices
to create -el2.dtb for each alongside the standard dtb.

Note that modem and media subsystems are not yet supported due to
missing support are not there. For GPU to work, zap shader is
disabled. In EL2 mode the kernel owns the hardware watchdog,
which is enabled here. For WiFi, the wlan_ce_mem and wlan_fw_mem
regions are needed by the WCN6750 firmware.

Remove the erroneous deletion of wlan_ce_mem from qcm6490-idp.dts
and qcs6490-rb3gen2.dts as this is device memory and should be
present even for EL1 configurations, whether or not the
underlying OS uses it.

[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
 - Remove reserve memory change of adding copy engine device
    memory back in el2  overlay file instead do not remove
     wpss ce device memory from el1 configurations for idp 
     or rb3gen2 device tree. [Miaoqing ]

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

 arch/arm64/boot/dts/qcom/Makefile            | 12 ++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso     | 41 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     |  2 -
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts |  2 -
 4 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c857bd7991b..22076579a50f 100644
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
index 000000000000..37a906218d17
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
@@ -0,0 +1,41 @@
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
+&venus {
+	status = "disabled";
+};
+
+&watchdog {
+	status = "okay";
+};
+
+&wifi {
+	status = "okay";
+
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1c02 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..6ab1bbdc0a62 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -25,7 +25,6 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &video_mem;
-/delete-node/ &wlan_ce_mem;
 /delete-node/ &wpss_mem;
 /delete-node/ &xbl_mem;
 
@@ -1148,7 +1147,6 @@ &usb_1_qmpphy {
 };
 
 &wifi {
-	memory-region = <&wlan_fw_mem>;
 	qcom,calibration-variant = "Qualcomm_qcm6490idp";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 9c24802e476e..c3eaa196a473 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -26,7 +26,6 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &video_mem;
-/delete-node/ &wlan_ce_mem;
 /delete-node/ &wpss_mem;
 /delete-node/ &xbl_mem;
 
@@ -1464,7 +1463,6 @@ &venus {
 };
 
 &wifi {
-	memory-region = <&wlan_fw_mem>;
 	qcom,calibration-variant = "Qualcomm_rb3gen2";
 
 	status = "okay";
-- 
2.53.0


