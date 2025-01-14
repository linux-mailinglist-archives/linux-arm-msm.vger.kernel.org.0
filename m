Return-Path: <linux-arm-msm+bounces-45018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B186CA109B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0FC7169F6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACDC14C5A1;
	Tue, 14 Jan 2025 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7SOd79q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EB913A879;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736866014; cv=none; b=mRXeOFgrdzbZQ5XuMQ0fhplwDDyazT7wNVegaonaPhnGl48UaU6oGpi2L4d3tnGWEkOZxp0S9KWeFhakT4mWM6GqZmqqKxoWLfRlv40T1dM8Yh+IYzy53vgBHMZ9ivciHZBlZJKdzpRULUcGkSx0SKicVZ1/EQvAynWuiFv3bR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736866014; c=relaxed/simple;
	bh=/bE4XzpALQsGRT7BVYVcM1aIJxF5UAB4vSiqb7huymA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ut1TP6bej1HSV8CV7GwJwjEAxYjJn4cFTZou59VtCJhsG2SiqJMU7Ft9VlK9a3eJOJ7pGXWfOa0MYMXxT+NuKlcIa03oGCLdz7UjmvXGByoF07Ao8Hvxq7+jktEOyDHz3woao8H9MINQl9N7acg1g/kmGhqz7uUnlRf6U7+iv80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7SOd79q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60DF6C4CEDD;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736866014;
	bh=/bE4XzpALQsGRT7BVYVcM1aIJxF5UAB4vSiqb7huymA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=q7SOd79qDNurmiThSZ7KaYad6M2JSaMDPreuS7qAzQLXuAFugroog5BJhS/OgkgTi
	 qDQdQWu4NXEyxh0c9dfaub+PMWOiG262DNEWw25bUg0BUynx1cbT4FtnDQ2tw5Q0ty
	 vODsnBKGKPi+uG3wtO2rbU/2GlGZ6iG+g7icGVcyT24g0PwQIlHhScjNhoyTE/Uor+
	 fWuhmhHD9/HletG9uaZdacipjUxm9F1sg1jsYGofihWY6rHZHMthLAvY0wtYPtM1Wp
	 B6KjMiAyLJYgbmnJiodTlmvfc/6ykvZ7SSFJaY6+twrBtLWLc6aWvh6Zsmkf/KTUZs
	 ispQx6rR32DwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5594DC02183;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Subject: [PATCH RESEND v2 0/3] arm64: dts: qcom:
 msm8916-xiaoxun-jz0145-v33: Add initial device tree
Date: Tue, 14 Jan 2025 22:46:47 +0800
Message-Id: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736866013; l=2571;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=/bE4XzpALQsGRT7BVYVcM1aIJxF5UAB4vSiqb7huymA=;
 b=SHxIaPdzGLLDhG7GH9Xp2sO0D5n0X8vIkl2J21qwE2X7tDTvXmrTSv2Kk3l+jywhpx6U5Vw3f
 tdaVZdzKNMDACAWnqfLrRsn50LE6b2zPZjvnTPCsvUuoTJfG2gGM7Ye
X-Developer-Key: i=rcheung844@gmail.com; a=ed25519;
 pk=JjZsSnuDD1xuR4EXY4XGKELgToA++HxxheDlHU/41yI=
X-Endpoint-Received: by B4 Relay for rcheung844@gmail.com/20250114 with
 auth_id=323
X-Original-From: Ricky Cheung <rcheung844@gmail.com>
Reply-To: rcheung844@gmail.com

Good evening.

This patch adds support for the XiaoXun JZ0145 v33 4G LTE WiFi modem
based on the MSM8916 chipset by a new manufacturer / vendor for the
Linux Kernel called called XiaoXun BiCheng Technology. Below is some
information about these changes.

Addition of a new vendor prefix
----------

XiaoXun BiCheng Technology is not well known in that they don't seem
to have a presence in the Western world. I purchased my own modem
on TaoBao, which requires stores to registered as businesses, so
I believe it is justified to add it as a vendor prefix. Note that the
company appears to have shut down just this month.

Status of patch
----------

This device shares many similarities to pre-existing devices within
arch/arm64/boot/dts/msm8916-ufi.dtsi, so I am sure most features would
function with the correct firmware on this device.

However, due to the poor quality of these devices, my unit's EMMC has
failed and I cannot conduct further tests. Previous, the modem was
able to boot with devicetree of a UZ801, albeit with LED and Modem
issues, which is addressed in this patch.

I have sent the code for testing to some kind folks on the Internet with
good outcomes, so do consider this code as ready and functional.

This patch was also reviewed over at the msm8916-mainline organization
and deemed ready by the maintainer:

	https://github.com/msm8916-mainline/linux/pull/386

Note that this is my first patch to the LKML, so if there's something I
did wrong / the patch is missing, please point it out.

Best Regards,
Ricky Cheung
Tipz Team

Signed-off-by: Ricky Cheung <rcheung844@gmail.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250114-xiaoxun-jz0145-v33-v1-0-dc51f7ce3bd8@gmail.com

---
Ricky Cheung (3):
      dt-bindings: vendor-prefixes: Add XiaoXun BiCheng Technology
      dt-bindings: arm: qcom: Add XiaoXun JZ0145 v33
      arm64: dts: qcom: msm8916-xiaoxun-jz0145-v33: Add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 arch/arm64/boot/dts/qcom/Makefile                  |  1 +
 .../boot/dts/qcom/msm8916-xiaoxun-jz0145-v33.dts   | 66 ++++++++++++++++++++++
 4 files changed, 70 insertions(+)
---
base-commit: d390303b28dabbb91b2d32016a4f72da478733b9
change-id: 20250114-xiaoxun-jz0145-v33-23dc006cf130

Best regards,
-- 
Ricky Cheung <rcheung844@gmail.com>



