Return-Path: <linux-arm-msm+bounces-45515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E64A16245
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 15:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AA981645F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 14:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088C61DEFF5;
	Sun, 19 Jan 2025 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzANnSus"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9B363CB;
	Sun, 19 Jan 2025 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737298256; cv=none; b=rhlPHvi5KijMch4pzJa45E7hJofRQc9B+X7gWRbxy3lYpZh5OV/RIuneTTTdoVFCLlLgDEoBF6MpGMJtuIZinWBictKDH9OLcrTYFsICwtir3OGy9eboiqXTqTpc2yfjOVU5l4LjQbjIAkVlf46rd6Bm9HifKcjXNnYs0TIuy3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737298256; c=relaxed/simple;
	bh=AX5VJfJx56rXXVQSO+9NkM/PmYBy4kqrprJ7LvyVVn0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hrwu0dzFxvFXta/f7a2t6q0ZQ40QmaCdrGW4w4k29si1WX09l7E4g3modaLMnvkbCGiHp06tVw1y9YgzCRUOGna83HGr8xh+Vhl1/RrYv0CxLefDRr5NMRns5+r8DnZb+OrbcXS5UNzYK9zMoDhPPTKjTq2/YBEeNITV2gwn/+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzANnSus; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49D94C4CED6;
	Sun, 19 Jan 2025 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737298256;
	bh=AX5VJfJx56rXXVQSO+9NkM/PmYBy4kqrprJ7LvyVVn0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BzANnSusYi2ZxWui+ucxnK0XhEdjWmauDeZuygWnkxssJD2MmVaAHhWStwdlPPlWa
	 Pgci+jusvgJzxY+IxW8fzHMt1maZHdkBheseq3XuXQ+hPUjruk/MlOOdiaCbzt5Lpp
	 XniRpfY2rQcpQl8VkbO75vbddm3C39qlAp8jiJEwxI8Kvzo6djv/m67X3ZEOd7SZmr
	 rcObQWsEKretFx8wvtmuDdGOI8OpeVEOKpT29E1HyIRlrwoxe6wBoNToMlt6EybiAq
	 S84+I+2J1pvoO6pGHIe/vOpe9MICknh+qoUUT4YlRJ5NeSSB10qYOrneSU6P50iP9x
	 PQ3umJVmJ7BrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388EEC02187;
	Sun, 19 Jan 2025 14:50:56 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100-vivobook-s15: Add usb a and
 sd-card reader
Date: Sun, 19 Jan 2025 15:50:50 +0100
Message-Id: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEoRjWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0NL3dLipPjE+NzM5KL8+OIUXZNkE3Oz1ERzM8skQyWgpoKi1LTMCrC
 B0bG1tQAlmMaJYAAAAA==
X-Change-ID: 20250119-usb_a_micro_sd-4c476ea769b1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737298255; l=2119;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=AX5VJfJx56rXXVQSO+9NkM/PmYBy4kqrprJ7LvyVVn0=;
 b=kx/NfvnPmOYQw+KpxvPD8lyMcKVtHa8QDaSo3OM8h2zwU8uwivmDT0bxQEI/CA5XMHdoeVvc2
 JQzN9bV4x4/BkBEjSiPAwWZfjZRFWcLOhAvLESNheEu/3pFxhs8uSgf
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

The Asus Vivobook s15 has 2 5gbps usb A ports on the right side which
are controlled by the usb_mp controller enable them and the retimers
required.

There is also a micro sd-card reader on the left side below the two
usb-c ports, this one is attached to the usb_2 controller. Enable it and
the retimer to enable the micro sd-card reader.

The micro sd-card reader seems to have so interesting behaviour, on my
machine and someone elses it kind of half works, but not really, the
same under windows, unusable. Either we both got unlucky with a hardware
defect or there is something else going on, however two other people did
succesfully test it, one of which on (free?)bsd instead of linux even.
One hypothesis is that this area is where the charging circuitry is,
which gets *very* hot while charging and might damage this bit of
hardware. However this is very much speculation and not based on
anything concrete.

Symptoms of dysfunctional sd-card reader:
The sd card will get detected, a usb device will appear as "Genesys Logic
STORAGE DEVICE" 05e3:0747

log:
[ 2456.648075] usb 1-1: new high-speed USB device number 3 using xhci-hcd
[ 2456.792703] usb-storage 1-1:1.0: USB Mass Storage device detected
[ 2456.795530] scsi host0: usb-storage 1-1:1.0
[ 2457.840518] scsi 0:0:0:0: Direct-Access     Generic  MassStorageClass
2402 PQ: 0 ANSI: 6
[ 2458.072281] sd 0:0:0:0: [sda] Media removed, stopped polling
[ 2458.073001] sd 0:0:0:0: [sda] Attached SCSI removable disk

/dev/sda will appear, but it will not do anything, fdisk rejects it etc

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
Maud Spierings (2):
      arm64: dts: qcom: x1e80100-vivobook-s15: Enable USB-A ports
      arm64: dts: qcom: x1e80100-vivobook-s15: Enable micro-sd card reader

 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 142 ++++++++++++++++++++-
 1 file changed, 141 insertions(+), 1 deletion(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250119-usb_a_micro_sd-4c476ea769b1

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



