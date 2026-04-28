Return-Path: <linux-arm-msm+bounces-105013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJdJBXLW8GkSZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:46:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9664882BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5391A30A9664
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB57A44105C;
	Tue, 28 Apr 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9wFGBxw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5qAoWPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0801F91E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386195; cv=none; b=r/hjulHy1xR0Odud+xk3T/A0/fp07tcjNjBy75ovKVzpOOq8jtuQmD01ugp+g7uWWXaR4Wf7HVqg76cqL10MiYv/kvCJCQ2ZaLW9Lp6yWjxedhLG06JW53bTEWnm7Tw2SivXq8OK7n79IEtyVlNr2J5DI04awORWc1pQ2l0WeJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386195; c=relaxed/simple;
	bh=LijrkjFJMpmtl0RFSav1RQXDYuIS2GNEp12OlC/fnQU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n58e3t/n0y6pdPBMluZAxrsKS1Z/Kke1WEjjyQGvAMMTr354tkXFOX2bdJADwJlM5OxefOIWTY8uGOVqtGOigxBdvisDOHqZwpgrW+CpYe/keRDrFCsfJOpH/nmd7/tyOkzpQKS3ICbDFdkbY5GVLyrrEopMiELtvKaUvZkWIL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9wFGBxw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5qAoWPK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAKNOc1329060
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n4/CmuMpXrsR4zeR3KixXM
	kaiDP4I+U9UFoAoRmEES8=; b=C9wFGBxwZbGqSpHYgzveA7EzaOmjjhvoKBHZZ8
	EZIfHBft9olSpK+OhwZGiP8bPv1yK+KpIVsBI5PUL5E+mu9jB6if/7LVM4B6xmv5
	3hCmLavmsPtblF2qJN5Z1NOuhRr0Qnbt34yW5yE/2skFuZby1sOPsBSR5O7KO0DW
	gLXSq7zvnCVtvzb3q7hj48z9bx1EFTSYAM3m3VgSDG4yMqCqRNW+5hMfKXeZITx8
	nU+eLTWivLYFiAH3TbfvvXf60/bZevkdcOt22fWAwFXS1Q5IfmAaVvBcgp00F08e
	h2DNFP5BZWUTJ1aBVvOKg7Oc1ynB5HzYRSI7gVi2vr4rmqig==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhaj9yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:11 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6961bda4505so5745683eaf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386191; x=1777990991; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n4/CmuMpXrsR4zeR3KixXMkaiDP4I+U9UFoAoRmEES8=;
        b=N5qAoWPKOWvmN7/XT95+5mHqC85xQtO4FyTcWhG0A6lZSOdalWGFzKopMwVKZxWF7I
         cSTbfOhLa/a4+NqasONV6MSBPVWk2bIOdBwImacuG53+KCcdMG9JagefA/r+vDJBhxue
         E9Un6ln62OnBdD+yvCZC7cQT4SMWsm2vg+3Osr3jzUVllXE9kpq5FT8V8wesItkAacef
         KOAfcK9Nv2G9JFeOiVGd81/kC00XQirgO/9PeeyWE2l7xKv0jASOxBVjeEJym9w1UYJf
         ja/ofkXvYIN5Kl0BiKbi6EyamR87IHQ3gXr1ZuEm6JrwtDnMJXCTilPcVmVoorFd2Pe8
         LPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386191; x=1777990991;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4/CmuMpXrsR4zeR3KixXMkaiDP4I+U9UFoAoRmEES8=;
        b=JP7IB5D+/Sb7mL5fbq4TGP4dAfBmvBmj9B3WxLG5h2XjDKSScWgMeNmRLjeHiHW1YN
         ZmqAcVvw+fHUiDCih2LRwHip4gd2vKwyr97bShh4dqc7EUB/EDiuCbdCKT6rP8MGfY6M
         Gm+C8b1hyh/8uvpJL5uxaRlrc9uV5ZK8L2V8M5ehBqpodEW3LFIIFuxF2DhBFmApCuMu
         2ksg7OzEvtiv2AW9s7RSr32IG4sktGa5lqV5MxLOESH1EkizAzYcErWZZumQl2dh+jKZ
         +oWML4EU2Uj4LrRfTXGDtV7ZEoFY7gPZ/kCGS/elosIzM/dSzn8uqrlkTM0xBXmGdemt
         XbqQ==
X-Forwarded-Encrypted: i=1; AFNElJ85khzdINYXIYfcEVi9YjNS/wp0NEU3wDt1S06QXmLWL3MnDnWM4hy70nKkoiJxBrwcHXvXg3FYyglmqEr5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzss0rpqYcvIFlRGnE7ki4hZSRgHD09DTJnuJkMIEA5J48Ivv27
	lrTsgIhrqf+P8VmocnmalVmtiWc46YOQnGcYWy4B5LG4TSMJww2wv7GgLk4qIa0IklzBPtwknPw
	QOWuqZ2NpfiCtWNFWFBOXk/uRCHUXp6+YvlJMfhRWZogD+BrtsX8/O4nnEeyi3NkNLNGD
X-Gm-Gg: AeBDievKYsiId9gj5KlTY1oZ3U8gCZBN/V2FpDBt4dy0mouk6OPKOs8A9Kh5QKk5tmC
	TsLi+xQ222BNjzEYECVrlgMNXpePn7fEHTlmQ67WDoXY6IFi0X+sPoYTyJdfYzX5Ny7ivwyyBob
	BOjbIi8BLadBlue3+JTaARL3XaLN9MRsbF5okl6rtDlG7pXCY9FDgEJ509wIdiqtqxjJ2NPV8L7
	hZ/n59ORuLhkiGdUw63Tq7RMrjHOOTx7bGW1MqxN5Io86clwh/SHBqK49t4ExwRg+Q+9MajNSth
	jm6RruSu3v9l6SPmJf/x+mNfKtnvftEWdASwDul6fH7+OR4cubCEpHxMW6+cyq4ehYRHzYrrSXe
	Gl1U6Cc8nV04TLT0bv3+XvTomfNLwu782uVpZkQGARXut4o+b93gvqxyveOuP31uY+JFyp4TG7n
	gspAvweKB8rXYpw2c2UxUNcxtOFfU=
X-Received: by 2002:a05:6820:1ca6:b0:694:a339:43ac with SMTP id 006d021491bc7-6965cb8b5fdmr1505724eaf.42.1777386190981;
        Tue, 28 Apr 2026 07:23:10 -0700 (PDT)
X-Received: by 2002:a05:6820:1ca6:b0:694:a339:43ac with SMTP id 006d021491bc7-6965cb8b5fdmr1505690eaf.42.1777386190463;
        Tue, 28 Apr 2026 07:23:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/9] Support for block device NVMEM providers
Date: Tue, 28 Apr 2026 16:23:05 +0200
Message-Id: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMnC8GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3aSc/ORs3cRi3byy3NRcXZMkYwOLVIuklETLRCWgpoKi1LTMCrC
 B0bG1tQDuQjwMYAAAAA==
X-Change-ID: 20260428-block-as-nvmem-4b308e8bda9a
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX5AOFY+XvQJAo
 n4DYbgrIHgnGcRSb/8WkswYWMXAk25ytHn0lviGXcj3IFbrufBMiqBvEr8Vfp9dya05x/qThnre
 PmlEi8nCjOaoKVmnPOzZAT2ESbsOUOuYyeX2ZbenL/gNBccPYy7TCOX+HEEzEBwA95sYb1seUa5
 Q7UoW8gEP0TFIRLskINBAAJmdWOFeK+oeXtRG9iDHzMv+UGEMrEqIc7svTvoOJZm2i9a8RmVMup
 F9rmA6PgeD5fUpzcOEpZgJDvqUxEB+YwEx06wwM6ibtPJUsNr3WrlsRwFqk4rUBGUplIKPnBZ4t
 1Cr2UWsER2zua0YRhNVW3fzpL/Jpa9XcZ094Mwf8bwVKg8FOaw9YnZ4aM5XK7khprNGrUrwXwfR
 WlubG3wHv2GqKX9FXscgAyB6zt8wIo2jrQf9ITXydcmGDNU4absfpquy5dm5HtLIybMhXBziTnj
 L1dAaCjSIR2JjrDYqtw==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f0c2cf cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=d2RCo21-rtVxI0NFAHcA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: Q4WLAzrflTYexmOTrb-A_tuNTNBQmanK
X-Proofpoint-ORIG-GUID: Q4WLAzrflTYexmOTrb-A_tuNTNBQmanK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280136
X-Rspamd-Queue-Id: DE9664882BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105013-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On embedded devices, it is common for factory provisioning to store
device-specific information, such as Ethernet or WiFi MAC addresses,
in a dedicated area of an eMMC partition. This avoids the need for
and additional EEPROM/OTP and leverages the persistence of eMMC.

One example is the Arduino UNO-Q, where the WiFi MAC address and the
Bluetooth Device address are stored in the eMMC Boot1 partition.

Until now, accessing this information required a custom bootloader
to read the data and inject it into the Device Tree before handing
control over to the kernel. This approach is fragile and leads to
device-specific workarounds.

Rather than adding a new NVMEM provider specifically to the eMMC
subsystem, the new support operates at the block layer, allowing any
block device to behave like other non-volatile memories such as EEPROM
or OTP.

This series builds on earlier work by Daniel Golle that enables block
devices to act as NVMEM providers:
https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.1709667858.git.daniel@makrotopia.org/

It also introduces an NVMEM layout description for the Arduino UNO-Q,
allowing device-specific data stored in the eMMC Boot1 partition to
be accessed in a standard way.

WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
Bluetooth requires similar support, which is also addressed.

Note that this is currently limited to eMMC-backed block devices, as
only the eMMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Daniel Golle (1):
      block: implement NVMEM provider

Loic Poulain (8):
      dt-bindings: mmc: Document support for nvmem-layout
      arm64: dts: qcom: arduino-imola: Describe boot1 NVMEM layout
      dt-bindings: net: wireless: qcom,ath10k: Add NVMEM MAC address cell
      arm64: dts: qcom: arduino-imola: Get WiFi MAC from NVMEM
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Get Bluetooth BD address from NVMEM

 .../devicetree/bindings/mmc/mmc-card.yaml          |  20 +++
 .../net/bluetooth/qcom,bluetooth-common.yaml       |  10 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  10 ++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  30 ++++
 block/Kconfig                                      |   9 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 164 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |   5 +-
 include/net/bluetooth/hci.h                        |  18 +++
 net/bluetooth/hci_sync.c                           |  56 ++++++-
 10 files changed, 321 insertions(+), 2 deletions(-)
---
base-commit: 47c4835fc0fed583d01d90387b67633950eba2b2
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


