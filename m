Return-Path: <linux-arm-msm+bounces-39636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB3D9DED18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 23:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42C3D1638AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 22:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0961A257C;
	Fri, 29 Nov 2024 22:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzhEDfL8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CF6AD23;
	Fri, 29 Nov 2024 22:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732918377; cv=none; b=KyhlHgHNxUZUzW1SFnT/0OCWBmF61jK9zn5xm8SY/D/wPLGCEirgXRwC15nng95/wqWZy/djfTsIz9GfVdUH6asIEGdiNb9wE7e/yYVdHYHoRZoPRq1iseVPQRjskuTMuvjMAHFFn26Ku7QzEWSdHYFlA3t4G1kAzNYBSftE4LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732918377; c=relaxed/simple;
	bh=zGm9KEcOsFag+1nqaXt/RVMepJX6tnVExnRjsWPI1ls=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bVEsT5mT+X1IzPd1osT2qgKB0E5d5u728oMBcN8BaB8xJPX4aXIhGNvOHr4SqltvQxoMWhaDOljuh4bNZ4xw+SMyRN2S2iu0wJDqbyL4LBgZVe30r/R0mI7OUhRuzRsWzQ+GrNqjPu+amXqmcjcMesYOCrMAyM++xNhqnYvl/l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzhEDfL8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A88C4CECF;
	Fri, 29 Nov 2024 22:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732918376;
	bh=zGm9KEcOsFag+1nqaXt/RVMepJX6tnVExnRjsWPI1ls=;
	h=From:Subject:Date:To:Cc:From;
	b=FzhEDfL8UKUpUh7Ce/AsAZCKhjKatFl2NYfQeRoVQ+PjchmTWWAnxN06MJu3m+Xmz
	 y30aEI4hHFoWxTpbNNQD4RNzijfRKKH1lO+TdFLnWSF9wTNSe/jKCLDm+fTnchW8zp
	 4715TUXF+RX9m3J/orOoWEtnLkJEQgs70Uxg0iWylx0VoA178cQh9v5Bga/oz7L1EB
	 aeP0/zv1j55tu1kas0C/ojdn4iG0UPo1D3ftkMmPwPrGGasQQ1Bdh56g1sUq6D0PrT
	 bLzaTnGqD80GMfkSD/SAORwTl0CPggFOFbe9TBfxTAFD8mmEqfXsxF2JrbDbrQdF2r
	 yZzKVs9h1icsQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFT PATCH 0/4] More QC DWC3 fixups
Date: Fri, 29 Nov 2024 23:12:44 +0100
Message-Id: <20241129-topic-qcom_usb_dtb_fixup-v1-0-cba24120c058@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFw8SmcC/x2M0QpAQBAAf0X77MpuR/Ir0sVZ7AN37pCSf3d5n
 KaZByIH4QhN9kDgS6K4LQHmGdil32ZWMiYGKkgjEqnDebFqt241ZxzMeAxmkvv0iqpS14haY8W
 Qch84iX/ddu/7AQW9j/9qAAAA
X-Change-ID: 20241122-topic-qcom_usb_dtb_fixup-26548114416e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>, 
 Alexander Reimelt <alexander.reimelt@posteo.de>, 
 Dominik Kobinski <dominikkobinski314@gmail.com>, 
 Harry Austen <hpausten@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732918371; l=1068;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=zGm9KEcOsFag+1nqaXt/RVMepJX6tnVExnRjsWPI1ls=;
 b=emeCx25B48XXUrPPo42WWOCKDdM4fGbs+FmC3mq0Gcfp+zAymxAsF5DwBOPkcrDaK6ijhLYif
 /gBuX9u8Tg5AN3MHA3DC5Q/b3JTWV/YtLrv7B50w0Kur9N8qmZKsXcP
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Squashed a couple more warnings, the remaining ones I'll try to figure
out soon.

This is all based on what I was able to make out from docs. Couldn't get
any 8994 or 8996 boards I have access to booting reliably :(
Ccing some folks that I'm hoping could help out testing this

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (4):
      dt-bindings: usb: qcom,dwc3: Make ss_phy_irq optional for MSM8996
      dt-bindings: usb: qcom,dwc3: Fix MSM8994 interrupt spec
      arm64: dts: qcom: msm8996: Fix up USB3 interrupts
      arm64: dts: qcom: msm8994: Describe USB interrupts

 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 ++-
 arch/arm64/boot/dts/qcom/msm8994.dtsi                | 9 +++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi                | 9 +++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241122-topic-qcom_usb_dtb_fixup-26548114416e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


