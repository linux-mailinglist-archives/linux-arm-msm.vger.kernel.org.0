Return-Path: <linux-arm-msm+bounces-45010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2EEA108BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D139F1884160
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E260313B7A1;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWvS/D86"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5823136E3F;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736863881; cv=none; b=UKDKCGUHUkm9Z+tMYOSZ9gGxRjnHEg6UMCWV+w1xilr1vNFaOfgZfnPQumH8s8qmJ91h7er8MjuvlRMnl+iRCcQsrMUTeAPIXuqKpIfi//7ezOCOq2qH0sacq3c8KCwU7xpIEkg4nOqcePYjqjw9GFeFkbTeksu9OfqtA5rPrGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736863881; c=relaxed/simple;
	bh=wJsHWxYhcsyG5A7Fmu89Lm5IzY+TrzTNbM1pZ6xRyuE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QsC4XJMwQWRBZZMPla+fTmXXYhNByb0X3nc3zj8/G/Nflqq187ikAlQvOmUxmRW/3jQaS8ruySefA6bcCcIBYrKn1+pFA64nzg5G29JG5ksgfN1wSAJ131SX/kMF6YA1Ij6oZlfhAHe5rby7p89rtA7NJfbMJ+yr9wM0e9Vtn+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWvS/D86; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B001C4CEDD;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736863881;
	bh=wJsHWxYhcsyG5A7Fmu89Lm5IzY+TrzTNbM1pZ6xRyuE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XWvS/D86kpOtNiVH7UZOppRWwVTYbQEWnhbIBukunl1BLAGW7hpGMQdPHLlYPQSCT
	 ZJQn47rJBVx/66vUyLZX38H/7XBc1He5ydJmoVyiu/WInLdfhsxBHtFySlzOxsgzzX
	 1ZxsM0qtEqUGN0ca1Ro9d6wpsHUUxZlq7lap3TBRu4QdxRTI42mSyjIrcpFA7zFi6t
	 SL96K3cqLKzTXSkYXX+JtL/1oAu+IWnjj/3khkoPsQPyA5apH+LAsbp8hC4cI+ePxD
	 JXzP+MuiTfPiyKB1S3bM/SEprQLL5JBUCoitDhrQeERbz2o7pvVVBAS3vvaoeVrCTc
	 iNByBpte9z/xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439B7E77188;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Subject: [PATCH 0/3] arm64: dts: qcom: msm8916-xiaoxun-jz0145-v33: Add
 initial device tree
Date: Tue, 14 Jan 2025 22:11:17 +0800
Message-Id: <20250114-xiaoxun-jz0145-v33-v1-0-dc51f7ce3bd8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVwhmcC/x3MMQqAMAxA0atIZgNJqw5eRRykRo1DlRalWLy7x
 fEN/2eIElQi9FWGILdGPXwB1xW4bfKroM7FYMi0xNxg0ulIl8f9IW5avK1FY2dH1LmFLUEJzyC
 Lpn86jO/7AaeUMlpkAAAA
X-Change-ID: 20250114-xiaoxun-jz0145-v33-23dc006cf130
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736863880; l=2342;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=wJsHWxYhcsyG5A7Fmu89Lm5IzY+TrzTNbM1pZ6xRyuE=;
 b=ZAXZ0/J6ksJVo7SKTvqRwfq1e9sErlRm7OX9qB4dMAKAmPD0E5Uc7ajZvbQ9PkPyX9ka/yHbv
 yt1YQ9/4mLACYvsHIOn/sqzdng3Inmggvl2U5jkRbNkwbW7AneC43bQ
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



