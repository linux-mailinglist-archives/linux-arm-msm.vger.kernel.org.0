Return-Path: <linux-arm-msm+bounces-102995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLvPL7M43Wk3awkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:40:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B3D3F22BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1FEE3005676
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA3338F647;
	Mon, 13 Apr 2026 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="Yinr1tDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A5B38F64E;
	Mon, 13 Apr 2026 18:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776105645; cv=pass; b=aFJ4pt3yok52fiUy9lBQA/8hLy4uD/HatA2YF7xqiFtHz7zs7+b/OrdMLcrFNb6Mzth5Cpky1Vpjsp+re9namhRrIL+2Ccrrugybi3c+XRTVN3dan01G7tHWsSNSFHAj8bR907hpyspdL7i3UuDhGF3iDlMciF4T9t/4Vyjlxbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776105645; c=relaxed/simple;
	bh=52sN7cxj/7Bd4nf5gMwyPBNngTDrvT+m5lyiAdubMvU=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=sU39YJiu/0HD/KxuJexvgCVtOuBfZw3u4cm8gtboO+gDG0l7GG8xDNS7prlRapvoVr0EwY+zJhcW8m43xAtfY1glN+Bu3YZxwQ0Jlb249/BM4fWD/nHLVZpZktyl2gItWRqNFQm8vAdd6ocVYoyz0pu67WpYC2+JnpB4Z2GQu3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=Yinr1tDX; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 55285443094;
	Mon, 13 Apr 2026 18:33:00 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (trex-green-5.trex.outbound.svc.cluster.local [100.103.3.248])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 566C6442DA1;
	Mon, 13 Apr 2026 18:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776105178;
	b=1War/9gLfY9ckwAul+BHzYyNjuXwl0H5NtWyyKgIJDC7YEE6l/v3JgSV0dmCfXgRyZICp5
	0znDaSJEUWVCtGGN9q0606Dk1F+5hDYwRLr+K7eeaxTcuTRbvV5oKVo/iCtcBGmzI5UljI
	SV8vwuhSumiramJKY/ypdUVIMU6A4rt0mzIGZX00bHZHVMbceRZowh7zffenkyVUCHx3J8
	O8a+SaACZzAY5tOTdJOvPvdfTp9CeqE/mn3VbMeScqqy8FgyzuGt1zeM+7xSclFTCivS6Y
	B1D0AT3Zj/AnZva3PZdSZs95kqLENiAXVuhXHmfydke5EwnVTA6g+ohw8zmE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776105178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=5VmPqTvLOfUwbsB9JR/cj2dmOe8UgYkfqn/CCYd62ps=;
	b=pdSZJS/w3l46x/Daoe2zQ93hyU247wKZ7ejA3cZX7sQMdHJ/TqmRGuDYITkZdFH5hLcPLX
	KUeHs7IJ8GpGbhi8F5VOpPuw5wW/ti9Uyno37ohbkfyU+9ynbkuWhSvuvvQUbkntqRqnRX
	YuGsjLCFyTMqSYyPD5lFPAseELMFZExDlFSRR7hwJxwbZwPvMvU9Dn2T0LPuom3LmKbuC6
	2QqTP3Tlyi/jRr7Z2sC/up8qmFM0tKz39xN2hvRqVyXzJS0IjD4n6NnTUtz/4JKrkLAPwA
	dIkROn9bUUu8WKNhcEaHOwmZWpqbay/pM4qEmCz+SwNsfM7hPz4GBqKDQy5Isg==
ARC-Authentication-Results: i=1;
	rspamd-7d86dcc447-brlgt;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Inform-Vacuous: 5ab0c4dc75ed8708_1776105180110_2651789384
X-MC-Loop-Signature: 1776105180110:4023615666
X-MC-Ingress-Time: 1776105180110
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.3.248 (trex/7.1.5);
	Mon, 13 Apr 2026 18:33:00 +0000
Received: from [172.17.0.2] (unknown [180.247.251.74])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fvbcf14N3z1xvd;
	Mon, 13 Apr 2026 18:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776105173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5VmPqTvLOfUwbsB9JR/cj2dmOe8UgYkfqn/CCYd62ps=;
	b=Yinr1tDXrBCda5iPxXoTm5zo9f/kxFu100uO1w60Arm9cnsOfELLOcYuvrNoEwkdEaDKSR
	Tgpjf2Mb1V7dYYsCkxPpZ+2+4XnRa3q5XlF3F4CcqrxQ0bt5XoSh5V2+nYSmlUhLerz8cL
	YIO0JgBrW7BotryFXGYtaNvVF02jN+FZQt8b2T0lApQB+rOqRypxoaH6Rru6NNXiXEkOA9
	5NuUq1NKeISYUqU7NQJlOJJt5TN0knzMvKvzTHw+TRCWaN+qaXiUP48eaIViLLeA1ghieC
	DVIzLpxxlK5BvgLO775jPJ7ILPfOBm1DyrJDIfQwo5Y2UnIK7Ru91LcyJwi5Mw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 00/10] ARM: qcom: msm8960: enable WCNSS (Bluetooth & Wi-Fi)
Message-Id: <20260414-msm8960-wifi-v1-0-01c081e54610@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACY23WkC/x3MQQ5AQAxA0atI15rQ0OAqYsEouhhkmiCRubuJ5
 Vv8/4JJUDHosheCXGp67AllnoHbxn0V1DkZqKC6JGL05puWC7x1UZxE3NyyY64YUnIGWfT5d/0
 Q4wdy1J4oXgAAAA==
X-Change-ID: 20251226-msm8960-wifi-beecd96c6646
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776105169; l=2609;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=52sN7cxj/7Bd4nf5gMwyPBNngTDrvT+m5lyiAdubMvU=;
 b=ldTK2rqmxkwGe8TRHFcJ+AGxmJktLlOckn2dgPw0i8VOGS1Q3Oe8nulUmUHDGrp2k4OZE0pbf
 oNcginx8YPbA2HNBeDPyGFX8m5MB5X8VCrTsoR/+iTXDpoLyYEJUC77
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Mon, 13 Apr 2026 18:32:49 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=69dd36d5 a=iMBLmzX4nuXcozcv68JNPw==:117 a=iMBLmzX4nuXcozcv68JNPw==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=wxLWbCv9AAAA:8 a=1XrRl8l2ajt_F3_S8g0A:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfOENm35fBi4cnyIyIiaBILKk8BZuKifS1T1DeSonUwk1/pgaLGxwi87AVe4eXJlArbtnNgoeE5vuh47JV+DU/PXmm1pxesoLZRYUMyS1CcNSDGHrGjrO PK8zoz+w7rxdGjjFPagx2TZZEBJi0mgc4twApQHdZmRIMo9ooeAYtyYOs6kNHK2lloV0oibATei19Y7RpEZz3hvju2xbkiP4zaHjvNnojfrWQs9U5xHW/34D NQa67CmAqYyjKVbH35TFYBwrhintUdK3DCGIWkMzyQLBP3+RHEhd/CKMw3FgSAxJuxr6z7WTE4/Dr7YMgm6oHEnvYGIKoo4Oio3W0gxJ/ILuCApAhyiw69rH kdtTmgS+WoyLL20Q8IzwhdDgd8e1MeVDd5ObKVojnocmQ7y+8b8LNLywbONYQxHUjIzcIeA7V7aUhHcSdvToP+rTzxFKUxq3eCq7+pjIbuk2UVuXFwln+KvC HApZeVW2WsSMe76uWupYhR11BLIVb0lhOXt7TZGCYBCWRobHJfsS2dn8QIFgIQX2u2j9LvjIdi76hgYh2FGUt0huDowIfABx6tpMh3L4LvcmOsuvKL+nBf51 Rw2J8ku3Q0XpNRMLx4FdvQjhW5iHS4HcbvzwXm2mnEyKzk2PUoEoJ7pyuy9RAnTdSMirvQMNWDBZ2/BJWN+cRat4
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102995-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[smankusors.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34B3D3F22BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the WCNSS (Riva) subsystem on MSM8960-based devices to support
Bluetooth and Wi-Fi.

Add the required device tree nodes and resources, including memory
regions, clocks, interconnects, and communication interfaces used by
the WCNSS firmware and drivers.

Changes:
- Add Riva (WCNSS) nodes: firmware memory, WCN3660 iris radio,
  Bluetooth and Wi-Fi subdevices, and pinctrl states
- Add SMSM and SPS nodes for coordination with the WCNSS subsystem
- Add shared memory and hardware mutex for inter-processor communication
- Add SCM node for secure channel manager interaction
- Add RPM clock controller and required QDSS clock resource
- Add bindings for SPS interrupt controller and RPM clocks

Known limitations (not addressed in this series):
The wcn36xx driver appears to misclassify 2.4 GHz networks as 5 GHz
during hardware scanning, preventing association with 2.4 GHz networks.
This issue has also been observed on MSM8916 and MSM8953 platforms
using WCN3620 [1][2].

Tested on:
- Sony Xperia SP
- Samsung Galaxy Express (SGH-I437) - secure firmware loading not yet
  functional (separate series pending)

[1] https://github.com/msm8916-mainline/linux/commit/cc4abc694fcf2c942410136bc58a61e79bf21e83
[2] https://github.com/msm8953-mainline/linux/commit/779c9627ec0b971bf466588e64fe530cf78a414d

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
Antony Kurniawan Soemardi (10):
      dt-bindings: clock: qcom,rpmcc: add msm8960 compatible
      dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
      mfd: qcom_rpm: add msm8960 QDSS clock resource
      clk: qcom: clk-rpm: add msm8960 compatible
      ARM: dts: qcom: msm8960: add RPM clock controller and fix USB clocks
      ARM: dts: qcom: msm8960: add SCM
      ARM: dts: qcom: msm8960: add SMEM & hwmutex
      ARM: dts: qcom: msm8960: add SMSM & SPS
      ARM: dts: qcom: msm8960: add Riva
      ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and Bluetooth

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   5 +-
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   2 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |  19 +++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 157 ++++++++++++++++++++-
 drivers/clk/qcom/clk-rpm.c                         |   1 +
 drivers/mfd/qcom_rpm.c                             |   1 +
 6 files changed, 182 insertions(+), 3 deletions(-)
---
base-commit: 978e0d8216cae014f10326c9a257890cf98a6398
change-id: 20251226-msm8960-wifi-beecd96c6646

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


