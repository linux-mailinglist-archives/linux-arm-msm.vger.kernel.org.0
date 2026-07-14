Return-Path: <linux-arm-msm+bounces-118974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h0UGBYPjVWoouwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:21:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A6751CAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:21:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e5pxErwf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kcsxGbl4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118974-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118974-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1A5130D2199
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04D73ED5B3;
	Tue, 14 Jul 2026 07:19:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3255C3EC2EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:19:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013599; cv=none; b=JeTrTq1NNRP/61nhCoBw3wlzNggMvuz6F/PWN6qu827b6yLElA3TZhHLslDkRRoYigsjX+yHiqMVBwVmVDWFbjeOAeEfnqH6s34k4l92jJnD6SE+fClnXbfz4SJotmLPupR1hxXKkMKG9cZDQD3wLKMgXU+AJbFNKBn9fJMKmnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013599; c=relaxed/simple;
	bh=6HhvrEpv0MEgcFSVY8yifMFZe3jZZUu5k8mCNQpOdEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sm1HaTU+U50sqciXkY3jeGteXZPfcyoJsVbbD/i+ghzLqBsfxu+Y+xg/kYPsWPLnh2BjdZxwogj9gdceKMYVgd/hKdSBc8eR/rq7avFx0NYAjJYPVDmw6NqQ2h4J3s4KeYgUhXsb0wV41k5RHl9axoNcnKu5x00gPs92qhlUJbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5pxErwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcsxGbl4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6T1k13946698
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rEfm0CzICJn
	l6NHWsWnylP4t4zmHNza9499lYz7Lvlw=; b=e5pxErwfrNoZ5jr8yc/TgPjIYGJ
	31pIaD1z5WYXQNHnUSTLzWp/0RPL0oDQFXFtDa29qB+Bobz/VaPLsuWKcOLsTyJ1
	gXX1pPRgIH9YK0evuMnvVgbl8oWfb/lwDV2iI+hOg4aXs9+4ByGEPZcRfCWNsxjD
	BaOA0Hg8cSMzaYKKohd1o3+lxjjWbIs7lKxwaw02KGiO9mlnR6fJJPCnwZbwtcKY
	vFAbcXVbGD5ysACjYE+Pm3rhfHPNIzTOHj6luSr9uBJINWhkozD6Oe2r5ZdcRC0l
	axya7yH5cbkM6DowjsGm/9CLOqmEC32iD9D2/k4tf/Z71bTvUmqpZevpPkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda4dyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:19:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso97764925ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013596; x=1784618396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEfm0CzICJnl6NHWsWnylP4t4zmHNza9499lYz7Lvlw=;
        b=kcsxGbl4iPlzVXixpdx7LLYYoBi2JgpGlT/UvHep2KdHUFS1fgHfG3I8ymHwRdVcbw
         rzr1WX2cFMV+iSPDeY8mPWbjaoi+fg09DvKzgGz4c1kYw6qs17mXOEJvXcGHx3zBdpxg
         0UdXr2ofqL6pTaiUs6Bfvnk/9Rtz8q5FTU/nViH/a3se2ghyqnkJWPu7Glc34uNlfnqp
         ox/iKebVQNXKHbcEDFx/Y4SkBmaGHYrC5YRK8APxOsQY37eE7u9Qubq7tjZtVuGgpchx
         LbPABI6HiV6h/G73xRdOhmkdtqtQ7i+YEruCaugf939csLa3f3KLxXr9miGH+jLtjTSW
         KiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013596; x=1784618396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rEfm0CzICJnl6NHWsWnylP4t4zmHNza9499lYz7Lvlw=;
        b=caCpZEOhh0e9dToPHwRcvjxcM1fqx/uALIGWX0pxy/cillHV4w6dV3DC/CLxQ54Ch3
         Uv9FxF7DfbrxY4NM7QKDn7qb3TcrUleEr/2O7Egi5E8t+Wlv1+tPVAZDz1Kx7ONNKCl7
         LfVX7vcsL+eC2b5Jp8WLnWijL9X9YLTyvaLdsLT7543rDFRbZ3Ld6Wrb9eeyNeiGvwW1
         h6fdpQWPbw5PA33CGhDUG/bhrYSy6DpaN954k45+u7HLCguqR04Gzls5HIweLOAF9mkt
         g00UNgmkbzbSzBZZEjdj8A62Sh6/Kq+CnpM6Qfvwqb2utc6q89p+l/rVssT3K7YuV/nZ
         Cq0w==
X-Gm-Message-State: AOJu0YwkT7YNS0n0kr00eDxtqhFImqMZ5mUI73XVSOI5x/wiMUhWoL2B
	bjALnm8EDk8Eg/qSepz3BJldH0kyEwIskw5dGY7Oe3UQBYHqUlOyz0Tf6NJsEXe5moqex9KQKPw
	WuludPzE88rHBLTy5koOTcoWQoIMy6d+2XqhFvbFA8DZWuJgc48e3/dmZuYhXx5fwECTp
X-Gm-Gg: AfdE7cnCQ27bv/0FqGvcsRvAT9DsTedfA2hzWh/SJZ/8+4NUokEiyjQwJKrGmIhcPIF
	cZ5ZRzhIRoFn/L3KSCVTnN1wrpCMF2hbTbkvx/bwsaBI+NyCkC/7+XNhmMQqvzCG3ypEIIIDuk2
	OciRRtvd4TgTaHP3BifVlbFFwvVOmpEQyFoYoY2eU7EroPvRtpyNPKtWu2U/jUTAkINaGwWaIUY
	vcrwDn2YlxbbSU3AZJTwwzZtxGoX7kUM16h5glL3UHdIQXCAgHsI22qG0PqttPDjYthmkfu0yMT
	NkBRjdJ7OYton3liwJa2Sx6g60Zvk4F1qw3PlaDEvBiZuzMTEJMDhr85wU6IM/Ax1ykuceWvGFX
	v+Bo9CN3MC7De17T5951fJl8mUSwc1VJo4Gu9AQ==
X-Received: by 2002:a17:902:dacc:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2ce9f05872amr121278715ad.38.1784013596088;
        Tue, 14 Jul 2026 00:19:56 -0700 (PDT)
X-Received: by 2002:a17:902:dacc:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2ce9f05872amr121278235ad.38.1784013595451;
        Tue, 14 Jul 2026 00:19:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm113037435ad.39.2026.07.14.00.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:19:55 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH RESEND v10 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
Date: Tue, 14 Jul 2026 12:49:43 +0530
Message-ID: <20260714071943.2036353-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
References: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX7+qsykA6glLJ
 I3zXH8eIv2CBhimu8PCh7Qs6ZeDQwwbts2V4DF8el0/pS7sncxNy7ZujgmVYVF+DoztDtinJac4
 iv+8hODhKo+9E8xNYyWxToMLCGM2Jo8=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a55e31d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KWviAJoEAPtr9-UugcUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: uRDUoT5SpGmKmAEXL7ipEdwROj84XAmX
X-Proofpoint-ORIG-GUID: uRDUoT5SpGmKmAEXL7ipEdwROj84XAmX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfXwfxY2UHU+vk+
 eIfSkaYTdAK0eUQuzNGsdpZ4Q0jPck3xtQPe1vXqYHDSFdRtusvux+sN//x/jqlNdAIToub0IFe
 qhPZpH7mlzuNwg9nWCClJsCTLxMkkQrsEVSunK9iAMYCuIZXVcfBnAk/Jj+K59Eq/yk/4W9Saqb
 esUSl0xqo1DfzsmnSXN6Jv4kE+o34KQXWtNO0JDno9YWfsruEyNzraJza2sAEpUWmAY9+L7GROd
 NHJ9ci8JX4pKVYgJN+ezUHeMOm/q7OFgMr6Ep8ZD0V2jGA3XJ6c4v9P2LAcmdbMZmvQElVENaoh
 yFZFNXjW6iiB7bA95pKbwqK3vf+dE0+3Ukdf2ag4p+GFNQFEmQ/46zZmr5ImEupgxLzeMP4Ba4n
 1rSms/+8SJ5O1sFG7T0lDDBzRI/dXa/Uebl17gCn5R4EE6R2zMShGHd4pRLh4x5RpxjNbvzRGO4
 1AK5ol4JULe0dQdWfKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118974-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 635A6751CAD

All existing Kodiak board variants run the Gunyah hypervisor, which
means Linux can only boot at EL1 on those devices. It is possible to
boot Linux at EL2 on these devices [1].

When running under Gunyah, remote processor firmware IOMMU streams are
controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
consumer of the DeviceTree. Describe the firmware streams for each
remote processor in an EL2 overlay.

Add an EL2-specific DT overlay and apply it to Kodiak IoT variant
devices to produce a -el2.dtb alongside the standard dtb. Modem and
media subsystems are not yet supported due to missing dependencies.
The GPU zap shader is disabled. In EL2 mode the kernel owns the
hardware watchdog, so it is enabled here. The wifi-firmware child
node describes the IOMMU stream for the WCN6750 firmware; the &wifi
node itself is left untouched so that platforms without WiFi are
unaffected by the overlay.

[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 39 ++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
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
index 000000000000..8daf7f02fd75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
@@ -0,0 +1,39 @@
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
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1c02 0x1>;
+	};
+};
-- 
2.53.0


