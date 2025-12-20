Return-Path: <linux-arm-msm+bounces-86017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D09C3CD2E4E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 12:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28F943014A1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 11:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748223090EE;
	Sat, 20 Dec 2025 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnhVTffi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487F81A9B24;
	Sat, 20 Dec 2025 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766230740; cv=none; b=I2zAU0w92/f37qhH4pbMQYjnp8Qlou0qh2nZibQzwvhMuxKE0jKEaLUrE5EY5xqEX0NUQPeqBdn3NlDT0TXe/oEpytSYFZj1kV5YWP0g59023NwrAnG8UOs8ytyRbX4Yrvli539/c3HiCFlQBsqW6kXSRkjX4ThqPrHrq2sk4OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766230740; c=relaxed/simple;
	bh=TGiVH1O1BaiBopdUw2gkpw7DmrxZfIrUFSr5F56AaSY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ahzJ9Nmx8DWm097krdWztOhmD3DApbywI7SUMqQFwBtoPQfFvOR7d+LA438oZokykkBahZxyYwGlvdRrpkalqQeLPDDgqc4d2CYyW1WX0HNX5ZQLZF0HDgqqSPgb9bWyimESnmhDYCoG0S7to1lKJuT043yqHEo7lnTfHiI8CVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnhVTffi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9AA8C4CEF5;
	Sat, 20 Dec 2025 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766230739;
	bh=TGiVH1O1BaiBopdUw2gkpw7DmrxZfIrUFSr5F56AaSY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NnhVTffit68eDXsvrwsf5MBbzZxemcEO0jhPFlG+yjdg8SgAUejijQaRmrgmEXmMN
	 ftF0D0K4gXurl3VZqIsL8qxkEID/oyM9BGs8Jdqru0X8agctw2VvQSr+P3yTOgZAMx
	 zt5PY7LLhQ+ZZ19QpirneyDBajcVa1zVqfI4IS/KbDSrEyQZf9ZwIexkZdioI+TmdV
	 RGQ5gWzpwHw8od2j1kZkLXcsZ78CbAqjwYlLKKc93D7CDLHBcjjHiHAdIX8J/u7lNO
	 ODnKmAE1aPZb14kAxder3XrmGa4DxZpVZ49HkV4wv++VojMdaeQie17If1iDOrkluy
	 0HPR/SJZt1GDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C1AD78797;
	Sat, 20 Dec 2025 11:38:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: x1e80100-vivobook-s15: add more
 missing features
Date: Sat, 20 Dec 2025 12:38:56 +0100
Message-Id: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCKRmkC/12NzQ6CMBAGX4X0bE1/oKGefA9jSClbaSIUW2g0h
 He34EHxON9mZmcUwFsI6JTNyEO0wbo+AT9kSLeqvwG2TWLECCuIoDlWYQrVFGpdNQMmjHDFcqa
 FLFFSBg/GPrfc5fphD48pVcfv2NowOv/aXka6rludUkL39UgxwdI0OdRS8gLKc+vGTtn7UbsOr
 anIfnQq/nSWdK1Lk25caGn2+rIsb9Xtudf+AAAA
X-Change-ID: 20250614-asus_usbc_dp-0203a242c698
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766230738; l=1498;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=TGiVH1O1BaiBopdUw2gkpw7DmrxZfIrUFSr5F56AaSY=;
 b=F8/YRwOlXoGGF5HmjbtgIHp/0i7lIYXo5TLYYwg8+F1iZG0IGp2fsyJ4YHYtN0xAKYFWweLEH
 AviZ9MPR6JEBB8uWD1POJx0tpsfnkSXovMthf/fnVhob/c24RpHDl03
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

There are still many missing features on this machine, add the ps8830
retimers for display over usb-c, the simple bridge/HDMI port and set up
to use IRIS.

Currently IRIS gives a ETIMEDOUT, not sure what that is coming from.

lots of these patches are very strongly based on the work of other
maintainers of these snapdragon machines, like the HDMI part on that of
Neil Armstrong, many thanks to those who laid the baseline for me to
follow.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
Changes in v3:
- drop merged patches
- drop nvmem patch as it wasn't tested properly and didn't seem to work
- update tags
- rebase on the latest next as there was a conflict
- Link to v2: https://lore.kernel.org/r/20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com

Changes in v2:
- Fix the place of the rtmr regs to maintain alphabetical order
- Link to v1: https://lore.kernel.org/r/20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com

---
Maud Spierings (3):
      arm64: dts: qcom: x1e80100-vivobook-s15: enable ps8830 retimers
      arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI port
      arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS

 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 396 ++++++++++++++++++++-
 1 file changed, 388 insertions(+), 8 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20250614-asus_usbc_dp-0203a242c698

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



