Return-Path: <linux-arm-msm+bounces-113893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id INpMF61tN2p0NgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 06:50:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1676AA37C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 06:50:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ocu4pmkc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CLUkdMqm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113893-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113893-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 262EA3012EB5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 04:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C31175A8B;
	Sun, 21 Jun 2026 04:50:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608BE35972
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 04:50:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782017449; cv=none; b=M+qaihC7DDxmZAE6EvNUpTajXyHN0Qw0rABnzt0mYYqrzF+s1KWMFq6kr/N2z3u/b+6OCdtq/lVJZ66aaWwGTBg6B2HotMPrq0zL5xFmuuRrtzBHMgGSyPgk0jpLMMFk/1OIe7rC43Vz+UyqePX7z2PXdcnBkG0pKFnijOYbqZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782017449; c=relaxed/simple;
	bh=8PqTckff/2KhW/R7+QkKppL9C5bFkVcBlbCim+KEtu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QjplOH7S3tsltJcYlSnNAsv4skDbOaW09odA+dxG106/0YQyeCba4ldLOdGtiLkGm5Jqy1vz3IItT84SF5ymXldzGgmw051P42sF6lh1bJ7F1zuQDYrBs1uk5UOsofpF058EaM4WWK6oqSRoncOeZ+5VOV7FpWOx1YtMZ/DhA0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ocu4pmkc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLUkdMqm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KNl5aq595797
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 04:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YDrLLj2W4IrIxTKEPCyhj6
	9pADZA/AxiNEQg7MK4I68=; b=Ocu4pmkc/K96EKeYYeisJ84fQHIEfUpph4cOh7
	WE+KkXddqHyR5AyaTXe+WQDPZ3dj975jycWdnvrNaFYPAeP2o/eyTLaO2ATDqRMw
	X6cN21iq3+Yxcrz567TJ6Dy99MU05SgOMEgiv0ibXGr2UgG1BF4PecwBV1ol/jN8
	LgPTZTW59VNjf3nA0MMIiTzGKlSEJzFvB9K8eetZiJ+OBIeqd1VlRKGxwpJdRvaQ
	14On1WRRjKMPgRsE2zEtVXfPu4saVMxlv3JsF9Y+1CXU1bXS25S1wRgAc4w4dnyu
	qe/9MLC7aCr1n7AEx8lloXGJKV7mHhK66zKsMYf8EZVcCYaA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk8827t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 04:50:47 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7fe4308afe2so38654927b3.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 21:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782017447; x=1782622247; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDrLLj2W4IrIxTKEPCyhj69pADZA/AxiNEQg7MK4I68=;
        b=CLUkdMqmBNBF/kt642r2qCEzY5Lk5haguaiP8/aMwzFH+vOeuHWtihxJXrheOWtSKH
         jkiahRkOey2F9PGxw43NOKuTAkv1cxQR6LIDrHDZPK966TdSvCfSTpF9jHBgAOXCBF3X
         wVHaWHq+Y/XjXXQuhT9kG2RsKkebkWftzrBBfNHA9wNOOTxnLTM2TgPH90Umh2KcDf/s
         J6n7XvTeCDyIu+uTw7Xb7xhoWfo+D3SjZ7y7WblLG42TMYz4mNf0wV/wI1ThOh+FFebl
         T/yXaFs2khlQYSEUcqgg/aZP2bSxvFS8APsJToFQTpwuCbF811UP4fp5eLFB+N+RDExp
         h4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782017447; x=1782622247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDrLLj2W4IrIxTKEPCyhj69pADZA/AxiNEQg7MK4I68=;
        b=E8n1c0jQL3cFU5R9tR+e11tvJXhC+EAnYe38JhJ3kTzyBq5ITpD8id8KvKjGZ7K4bJ
         VdrZ72qiougIOs2WEaHcPDIMrqQucA0es9fmBfsruKeDMORHYpPNEG2HCNtmTHEuA0vx
         +K0pE6O9af5i+d4NWRRtJMCc0Edf6Nlz9Do3K4UQEoDWtl3Toh5E6n78dzIPuNMRcS+A
         y9Tmvga3APT43kKKzYAqSiBTmHdIuq+JSkv5u1Vxbx/8Ga2T/MqZSLq8ZY6Rk84blT4q
         3G82WaVcvkluHOCLihVTjj7Yu5whdYrDU9dz75pWVldjVCD5viZgwkF2zzc7vyL1yG8P
         HAng==
X-Gm-Message-State: AOJu0Yxlnr31L9vQoZiywLm1SNJVS+g0ZBmZ8bLSFSGvV2vOHGe+//LF
	o7WrT5WbwmMJUA16HM6b0QKTki83DFo+SpBjEDYMghp27aq1pW/vpvBicmCtGmESoeJ+a44aMI5
	hnCiJuCBCYMiYTcPaMQCDHiq+G3M3QfYXgDsXP1oJjlZV6echznHRNZy1Q5OFcI0ZBQeC
X-Gm-Gg: AfdE7cm4ZT0PoncFIt/t5vEhc3gVkQPRp2sJJWzV5F5LsfFPJW8jksbQ7XktG2GBTu0
	qRVcncONWy9PHG4R54Xwkga1XqB1bkJ9l1IfOe6HPKCsYakfF/AuwbCPW2N017gpDFEg+SIOTT5
	OO0Z+mAclDQrH7ihQeNEOVPVAYE+l36D0nnHOarleBLvFaWIpnaT7MGcYgsn1JOjs6L1VJwxj3Q
	n7AaFRVpgrP7Wp2xE+M06qfG0LpSclq2dJ0s7WNnLjfcYVyo19Rv2FMhQoXfG7Ycdr1twXVAxmg
	1WZHy/flvIuw0+eiuwbl0kzDo8sPwjamP4jpN2e29nsLPjGZBWmylx5IxSgsq3lSjimAlkjQCam
	514BP+hwY8UbZmp+yAZJN49WAPyyq5DCBBo8GwNuVnb7T0ykUGQq1dAT7tcZm1Nb7ypCJJI2MT3
	sltrdfR+qqj253PU/3ofwbwPIRPsFfzWdwEf55IabqNZqf2TGnLLdk/QI=
X-Received: by 2002:a05:690c:91:b0:7e4:3bf3:76d0 with SMTP id 00721157ae682-80122eb8254mr73532337b3.18.1782017446791;
        Sat, 20 Jun 2026 21:50:46 -0700 (PDT)
X-Received: by 2002:a05:690c:91:b0:7e4:3bf3:76d0 with SMTP id 00721157ae682-80122eb8254mr73532197b3.18.1782017446360;
        Sat, 20 Jun 2026 21:50:46 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:855e:5925:800e:2644])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8026089574fsm17226837b3.44.2026.06.20.21.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 21:50:45 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH 0/3] X2 Elite HP EliteBook X G2q support
Date: Sat, 20 Jun 2026 21:50:40 -0700
Message-Id: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJtN2oC/42S3UoDMRCFX2XZa1Nm8jPJFhHfQ0QmyURX7bZut
 qKI727aakHwwpvACXO+OZzko68yj1L7dffRz/I61nE7NYEXXZ8eeLoXNeamew2agHBQ98/vm/2
 sqkxZIRrK2hpGDX1z7GYp49uRdnN70nUfHyUtB8T3xCwv+7ZmOY31O17SQ1uy7gwVG6P3Fkoml
 wOEwkTBxSQ2gvFDYGd9KUfO2QXOkkEIOlmXDUeD6IuzWCDbPEAkgszJm98uLhhYCmjfbBpNQoz
 WkLdU2GA0kSSKpXhwbaRWPhax7i6PPdhzD3d5p15RoeKMQJ6DNOz1ttbVy56f03azWbXj6m+M0
 waCc4gr7YwmGhqnjnFcVZ6eeP43pqV5mnaqblNqaUiBSsVlEBxsdOW/GAvm/Lgnkml5CkjIzpf
 WD/9NilxFHW7GZd1N8raon7/S335+fgEBVFfyYQIAAA==
X-Change-ID: 20260619-glymur-send-1136d243a120
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX5sqWczzEE9U/
 c5pkakxM9baMs6Fj6Jrpwf+xK4VVrEOmgskYDoCgWR4wC0LMrCKQxd7S1YW11JdfeLRaAr13gRG
 FSVSKKa6GwM2zpnuwTDVaRXYoXP46pK/B/XZtLw75hWVVHAU4umWiR0Uks6PcWdHdwkSfO8j1wf
 r+aYPNyAh4/ODuaL3tTGwXcgZAHs2q+6kbLBcXylGBCuehu8YnjmTP7Jsj693Lpk7NYcroEJrhK
 PLEZpRQn+iWZMrH9PaSt5WXT8tboQeaht7iWie9eKpc6Z/eM0dQjRgqvu0dgwW+pe7upPPL/Vrv
 dn6HkPqfx4VnXZU6p5ZVjrJ7GbgaNYZNg4gYixylF+211t1WZKXNvBH4hZjturRbv1VW7YhQNAa
 dL2pe6qK+s8/ZDVNxQ2LpHoatRmShHZweXoD9mAF4HP/ICIb/iu0vd/v3KaxUy/KrpD5uwXrGQY
 3a8WSG+MaXSp4N0DMrA==
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a376da7 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rKAgd0ua8hRQMlgXrsgA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: 1LoEB0W_igicHUK011SEzrljoOhZXUjS
X-Proofpoint-ORIG-GUID: 1LoEB0W_igicHUK011SEzrljoOhZXUjS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX6lopxlcHwK19
 eiUc2nEiuhgWfBoOooP4SopHQkKphC1Bk8XIYHduSa67Y/5gm0Ncx8SAqR5afIwD3vUU19U07qB
 KYAo+AIXpXefPIxdKwGuDXwVtjjoHIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113893-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C1676AA37C

This series adds initial device-tree support for the HP EliteBook X G2q
14" Next Gen AI PC (product SKU C4JG0AV, board 8E91), a Snapdragon X2
Elite (Glymur) laptop.

The board was brought up and validated on real hardware. The electrical
description (PMIC rails, PHY supplies, the HDMI bridge wiring) was
verified against the live unit rather than copied from a Glymur CRD.

Working on this laptop with this series applied:

  - Internal eDP panel (samsung,atna33xc20)
  - 2x USB Type-C with DisplayPort alt-mode and USB
  - Chassis HDMI output
  - Chassis USB-A host port
  - Fingerprint reader
  - NVMe SSD on PCIe5
  - Wi-Fi, Bluetooth
  - Keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture

This patch series builds upon the recent work of Qualcomm engineers to
enable another Glymur-based laptop.

Like its peer submissions, the camera support is missing today.

This has the same known dependencies as other boards on this
platform (audio, GPU, SoCCP series).

The GPU device-tree patches come from the partially merged Glymur GPU DT
v5 series at
https://lore.kernel.org/all/20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com/

SCMI on this configuration needs CONFIG_QCOM_CPUCP_MBOX built in (=y).

The bindings patch is independent and can be reviewed/applied on its own.
The board patch can be reviewed in parallel with the GPU, LPASS and SoCCP
SoC series. Until those land in the target tree, it will trip the expected
"Label or path ... not found" dtc error. As with the X2 Elite Lenovo Yoga
Slim 7x submission, this v1 is expected to trigger some dt-bindings warnings
that come from the in-flight dependency series, not from the board patch
itself.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Jason Pettit (3):
      dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
      arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 977 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 980 insertions(+)
---
base-commit: c52dce2340e79e98cf4aa05606edc8db1759e026
change-id: 20260619-glymur-send-1136d243a120
prerequisite-patch-id: 36f4bb7740fd65d808fa6685bce4b03798a547ff
prerequisite-patch-id: 054631082c45d3ab3117f541f0d4d90b660dac73
prerequisite-patch-id: af18aef027c45213c11b436746fa31b3b6ebe46b
prerequisite-message-id: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
prerequisite-patch-id: 7cb9a168c33491bf91ece900a2218aa7b4b68ddd
prerequisite-message-id: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
prerequisite-patch-id: 43e96d8a5063f51e2b5ee75fc8c9e10682e5670c
prerequisite-patch-id: 2e71d345f84a821d89da2a6064954409fdb1277d
prerequisite-patch-id: 0b9f5995044bb3d3ffda227ac986b755fa118c63
prerequisite-message-id: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
prerequisite-patch-id: 8459bcae98ac156f6576657fe9233badcd385218
prerequisite-patch-id: 9ab2b37c0a11c3a9590be921fefc8709ebebf6a3
prerequisite-patch-id: 21440dddcc340d35558010fe88bad9265e43c6ac
prerequisite-patch-id: 162f8b373ead5344ae0f29c92432db57a0d75f39
prerequisite-patch-id: bf5532cd5c8b66127e20be0677adbbbb3bd9578f
prerequisite-patch-id: fa7954f6fd2d27a6f0e805c9643b70e7e201c503
prerequisite-message-id: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
prerequisite-patch-id: 48c26c428cbeaa674a615704d1abeb87e4e965c8

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>


