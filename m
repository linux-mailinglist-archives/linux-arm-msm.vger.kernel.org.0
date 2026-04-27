Return-Path: <linux-arm-msm+bounces-104683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GoBEz8172kw+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:06:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C54708E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2B7B300F795
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB723B3880;
	Mon, 27 Apr 2026 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6kQFMjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3SY7lYV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21153B4E9E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284328; cv=none; b=d6pd0nvh5EpoaMT/oUrY7H8fuVzUFCMWTHyDUc7NXOgP87ZBztQ79TWrP7fkJRolDOCH1zbex/mQkbZXCPW8Qm9iyh21qsC9Ka8T+UpsdcJgT21WP9wT3F/z6ejrwiLrWIus5B4lTOnhOiyInSBGd949wTMpbwjiNX+d+lXK63E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284328; c=relaxed/simple;
	bh=PHkaANOFr7hZ9ZlwtR+xj9A/JeS67Oh0agRPInSQ/lo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y3OH6lGIZpWcf6l0X0FoZ37IAT/ESuujyzBS5xhD7fcqkQoZ+kUuKasVQzKcL7WhlOKcJIEH/pzV+F1YMSVoqWP/aoa8+r+ZsKJ9GchxTUKjY6zrnVLVYM1VSKK4trou0+7+WRdF2e6Hlp9fklm2h8oW9DHb4mdF5LMbCmpdW78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6kQFMjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3SY7lYV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TCLp4054556
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8SU+Pd2+C/zxbq3fBIw3KZ
	CTMRCJP0wRZtZ1+mD41kE=; b=L6kQFMjysxbg4R9JVtA6gIjGXIaMJQgwltRi0e
	Ti3adr8B0vM6vz8gCmaUegyN5HWTSbxb1wm2wZRLeHDUlaefh9Dbw2Vh2/zIRDF5
	z7alZnCgTPqAo+vkVMtCxFlMHeeXIIM2MNtd/VYtUyRYa1Bl8wJUKAn/vEVQr2sr
	O7ZDbQ2XNaa/9rei4vnG+QpY0K9Y0MLTJtZPAupZedhw1mT6Ay/mNjuPGT9VW31a
	1rookY02xOab1p4S88fTZmr/qFl76Nlx92HoFdBYiF0BdQI2R4c3vQa4SPdyXdR7
	1BOoKMqdiQcB3+2EBemqVhHDbOTi1SJVuO9j/o4L/zM290lQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxdkr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c79281bd14cso3836102a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284324; x=1777889124; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8SU+Pd2+C/zxbq3fBIw3KZCTMRCJP0wRZtZ1+mD41kE=;
        b=E3SY7lYVMCsphmR7Sk4htKa7Pmf16csfvi1RbZncXWq91eH221qLhdV6lAON/n26XL
         r/zmyGE7kr/sPGiLMLwuInRPyYZQJk1HsTxY7OCdTATHkjzwpSkyuSmPXwOzIi6npvtP
         e/rzhwNCMxMPaUyuVUDkoaIfAZRagEoN6BU1ft73xb17sCzFM2WV0NugeqXpgijO8r90
         z22PaA3O3/v2No6lyzYZiPhDAQB9mTUuRPX8njtjPaSZImYVGS/4C3/nGGcgEZK1UYyF
         fx+XGGn/zj1/SqTIKRJzD1j7z9qEs7BkENnBfD7YBeFeF3nmZH19GlsB6daaMp8PyuNP
         iP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284324; x=1777889124;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SU+Pd2+C/zxbq3fBIw3KZCTMRCJP0wRZtZ1+mD41kE=;
        b=HRMm524jGyAEAbnlfoX69cOOXP1ri1B8XKIqlCyVGxRDJmvyZi8/aFe2x/WjvsY8WG
         JN704XyJ46vugLNUj9mVIFEPZ3EO36YiYYKJLWffBBEo7wuzWxUYTTxyHZqL/G4xZBeM
         uNIUDJgfd9wjWM3E+jlrm3RVPoZAJ78fOFUlqD0GlefM6amNjXeamfA4x1QsZcgqm464
         r1nBlAEm7IKFdf/Be64RY11K/N+cZDEhzfn9WkU57WNZe994YOqbaZ7PUnVL0eE+dNJC
         zpN1kjFU8zz01F21tKr1yeOq/JgN2OTNzRLyzWfwlzPv4H9PmDbvRgnxj13Fa5Wc3Rvm
         GQrg==
X-Gm-Message-State: AOJu0YyT7nW5LSIt8Z/Rx7L3BPhr2htXwdwMn0vEEq9Xg9DXDWKnV6V2
	dWfEnfAOPyKswsDA9YSQ9a5sXAFd+GQ8G4BuxbXj3IV08EU3yZJRQJRVsWdmKVxz274sbltq/JJ
	nO+zWmGuYcqPPAr7AWtG8r1aLEG7IXXT1bfVeYqyGHYGT3DnGARQ6xMHQ84FqMPIx6CVe
X-Gm-Gg: AeBDiev06hkqR2zhMO/T1wqfOlPc3LzauUWLsnHU8/DVIw15LM2n4cbnVlQ+T9UzZZz
	+i4cJovikpJtrYAT70LgmoNZeUuz3LxKxXb00DutiLYdIfQrfM5rf0FbaAGSSLKC8NR3ymcfQnh
	y0KSJfhUAg3ndq3leIsLA923XdfgvS5xZsa7UXlty1yhJyZbnEggD8ob1h/PoLHkKysimf0yP/U
	fRTkYhZs6NLoaycg3RDH0MfjTmMwXE88GYFbsZwZuDBJY+h7SuZ4EOAl29gcRhEzQCjQtgyJ6Jq
	VKkKz5xLJv7h5AeFs3Lla0ZTJXp1pDoGZvPRd7lhVOBX3cBVrKzYFMNH1SReh1tpDbdzr4XqmJw
	LGajR5BWECy1v7ht81UpFRRZC16uEjz2+V5A4BNZnPp/xGXnwXUG/ZNk5uTLBC+PadVV1UGY6f7
	mMvNDV1ynscPogbrPkMKB4V/SmI9IFtq2925nXXAxF4uau
X-Received: by 2002:a05:6a00:a90d:b0:823:9e5:855e with SMTP id d2e1a72fcca58-82f8c2c6390mr42775445b3a.0.1777284324270;
        Mon, 27 Apr 2026 03:05:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:a90d:b0:823:9e5:855e with SMTP id d2e1a72fcca58-82f8c2c6390mr42775414b3a.0.1777284323776;
        Mon, 27 Apr 2026 03:05:23 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:23 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v8 0/6] Add driver for EC found on Qualcomm reference
 devices
Date: Mon, 27 Apr 2026 15:34:51 +0530
Message-Id: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMM072kC/3XOTW4CMQwF4KugrGuUyeSXVe+BWESxUyIVAkmJq
 NDcvQF1MYuwsfQsvc9+sEolUWW7zYMVaqmmfO7BfmxYOPrzF0HCnpngQvOZO/CIgCU1KhBzAQo
 wRy+NjUJLdKz3LoViur/M/aHnY6o/ufy+TjT53P5r0wyNy4HYJHAI3iGniFp4/5lr3V5v/jvk0
 2nbB3vCTa0xM4JUh2aL0xSVkFbpN5BeQUKNIN0hb8lai9xFHt9AZg0NPzIdMtrK4CZFUoQBtCz
 LHzWWCrSYAQAA
X-Change-ID: 20260309-add-driver-for-ec-3fa478f264d9
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=4919;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=tSaaC61RDXxRh36GuSq8rcIvJrH60RK3C2ZyH0EJq44=;
 b=LIdD/EDj1kNL5tZhIOtrxpP7XTTinbtg7UpRL0nUiOfeVaNUiHupYTU8wyI0/TXuHExExmIAF
 GPXKl3L4kXFDNWV7e2eAIFlqAIqF3cm5MBUFS1zm2RazALrsJrUWf2l
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: _oWwiqzyPLsWcRqj6IVRChxU1iTfGcXB
X-Proofpoint-ORIG-GUID: _oWwiqzyPLsWcRqj6IVRChxU1iTfGcXB
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ef34e5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=c7adFyaawyqDMnDWg5EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX9Ll1DOXe60Mz
 JPTQmCZd4wWsRJYdKI1vMfWSq6MdKJ/2ETkUaVeWRV4loPEkWDObN8CiD3dazfzdpuesV4IjW+7
 O+uWdvGswdJo9Kc1Mwy7B5cuBiBjC+sa83By53B4T4uyyHZ2TTGA0FWlctxyldA7GAQ8OWud5S0
 FME+szR5zYdGhlNFioCQsQ8h+++rLwNTDVj9B2nwVOBNPpujWA3xiwESYCb1SZn29z8gmlH6DiL
 siNGYYcQz+JvKZ7sadRg+NRiW/WDouXtyqohaka3v7TMocSHVscI7GPiv0SGeZc9GsHM/sHW0Wg
 JmUNfzZ+gUj6QrHr+cQaKGiLTe8gMlp/iw29SU8hy5K0dCJIMJnvEK793uJkmvLQvM+HpbCoWPz
 27kdEYRPJMompvnjQ5bsNaKnrUEnFNP/TrL8l1gqMTpWfMizEkMJhsV1+HxlIZvGB49mnGJR9hB
 7E9W9KleS5l4g73MrDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270105
X-Rspamd-Queue-Id: B65C54708E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-104683-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the EC.

---
Changes in v8:
  - Add missing linux/dev_printk.h include
  - Fix byte offset typo in EC thermal capabilities comment: 0x3 -> 0x03
  - New patch: enable EC_QCOM_HAMOA in arm64 defconfig
  - Fix suspend/resume notifications inverted: swap EC_MODERN_STANDBY_ENTER/EXIT
    so suspend sends ENTER and resume sends EXIT
  - Add depends on THERMAL to Kconfig
  - Fix MAINTAINERS binding path: qcom,hamoa-ec.yaml -> qcom,hamoa-crd-ec.yaml
  - Move Glymur EC node from glymur-crd.dts to glymur-crd.dtsi
  - Link to v7: https://lore.kernel.org/r/20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com

Changes in v7:
  - Fixed alphabetical ordering of MAINTAINERS entry.
  - Link to v6: https://lore.kernel.org/r/20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com

Changes in v6:
  - Add missing includes: <linux/bits.h>, <linux/device.h>
    and <linux/err.h>.
  - Change the thermistor_mask format specifier from %d to %x.
  - Change loop counter to unsigned int.
  - Replace snprintf() with scnprintf() for safer string handling.
  - Use sizeof(name) instead of the EC_FAN_NAME_SIZE macro directly.
  - Add missing braces.
  - Link to v5: https://lore.kernel.org/r/20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com

Changes in v5:
  - Fix subject line and commit description, drop redundant
    "bindings for".
  - Rename binding file: qcom,hamoa-ec.yaml → qcom,hamoa-crd-ec.yaml
    to match the compatible string.
  - Update $id URI to match the new filename.
  - Add <linux/interrupt.h> and <linux/slab.h> includes.
  - Switch to devm_thermal_of_cooling_device_register, remove manual
    unroll loop.
  - Ratelimit all IRQ handler log messages.
  - Promote unknown EC event log from dev_dbg to dev_notice.
  - Remove redundant error message after devm_request_threaded_irq.
  - Simplify qcom_ec_sci_evt_control, resume, and suspend using direct
    returns.
  - Add dev_warn + early return for zero fan count; driver stays loaded
    for PM notifications.
  - Fix thermistor presence bitmask documentation: 1 = present, 0 = absent.
  - Fix snprintf format specifier to %u to suppress -Wformat-truncation.
  - Remove unused cdev variable from qcom_ec_probe.
  - Fix typo: "exluding" → "excluding" in register map comments.
  - Fix capitalization: "ec" → "EC" in error messages.
  - Link to v4: https://lore.kernel.org/r/20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com

Changes in v4:
  - Fix fan count calculation to use min() instead of max() to correctly
    cap fan_cnt at EC_MAX_FAN_CNT.
  - Remove unnecessary mutex lock/unlock.
  - Disable fan debug mode on ec module removal.
  - Fix issue reported by kernel test robot.
  - Consolidate hamoa-iot-evk specific changes into hamoa-iot-evk.dts.
  - Add board-specific compatible strings as per review comments.
  - Link to v3: https://lore.kernel.org/all/20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
  - Revamp the bindings and driver to support generic ec specification
    that works across Qualcomm Hamoa/Purwa and Glymur reference devices.
  - Add ec nodes to Hamoa/Purwa CRDs and IOT-EVKs.
  - Add ec node to Glymur CRDs.
  - Link to v2: https://lore.kernel.org/lkml/20241219200821.8328-1-maccraft123mc@gmail.com/
  - Link to v1: https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/

---
Anvesh Jain P (1):
      arm64: defconfig: Enable Qualcomm reference device EC driver

Maya Matuszczyk (1):
      dt-bindings: embedded-controller: Add Qualcomm reference device EC description

Sibi Sankar (4):
      platform: arm64: Add driver for EC found on Qualcomm reference devices
      arm64: dts: qcom: glymur-crd: Add Embedded controller node
      arm64: dts: qcom: x1-crd: Add Embedded controller node
      arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node

 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |  56 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  22 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  16 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/platform/arm64/Kconfig                     |  13 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c             | 452 +++++++++++++++++++++
 9 files changed, 585 insertions(+)
---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260309-add-driver-for-ec-3fa478f264d9

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>


