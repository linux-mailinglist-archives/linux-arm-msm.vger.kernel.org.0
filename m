Return-Path: <linux-arm-msm+bounces-86403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 622BCCDA2C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70E79303D897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F2634E74E;
	Tue, 23 Dec 2025 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvjo0HFw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B1134E261;
	Tue, 23 Dec 2025 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511929; cv=none; b=ioUBCvYsDsyiHvwkMCKiz2JYZ7NFiZVMAPJ0myTi1BTgHtZqRvXMfRt+YiSz2ugOV1VtosNJ9KTS0kYAbZLYCZju9yjnC5gJQrkDHOlHr15UAXzg3CD6WNROTvCNC6NDCNoSpNkb08gwovOAlUXYLA2PHskHuXKg3VJRuArZGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511929; c=relaxed/simple;
	bh=D/zqMZMrg5bxSBohWp/OUYz4EvL7ZkwbpOyavwaQjSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PXIjFmBOoaiarM2NWEWZvI36okm7F9R+qI9XNzq4InVIKLPutb1L0NdpChD2DnKeQokr+YaNCYTeRti8IDkEkmMlH5UQ196SC1zr87DsbsXb6pK1zseC/O6wLNphbnSqev88rq0B7CX/Gzee2/p5ThBt6pS3hACDmwjObBs/Q/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvjo0HFw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF73C19421;
	Tue, 23 Dec 2025 17:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511929;
	bh=D/zqMZMrg5bxSBohWp/OUYz4EvL7ZkwbpOyavwaQjSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qvjo0HFwSOOPv6GoxFkZW/BIoZo29KqCcJPwrqC30j3UzKgKac1oXPKBJVt0sXx+h
	 mx+cB4jCnoZDLE3bxmvnCRJK3U+MxwxhwC1a8ldr1l96+4ZyJkXBEl5qNUC21qdsZx
	 YJfxDCJTgEFrRATdqGufZDczbLaLE6dAaorOxqNBWHx08YNwS0fnE9eJAdHuL1XKrN
	 2GZVtnylnFHTDD0dULoLuC/59DfFdzlcJm3MgfsTmk6N1qJvuJQAZBpqfasMTjqMYN
	 YBl/WPdfBVuAjcIRZojgaofYURFPxGrK6X9/vry+47pxh/LidSBf1xF0CZm2m3/ZJD
	 NfIzrLO5RRI2w==
From: Vinod Koul <vkoul@kernel.org>
To: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, robh@kernel.org, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/9] Introduce Glymur USB support
Message-Id: <176651192628.759340.3692338667900024623.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:15:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 09 Dec 2025 15:09:36 -0800, Wesley Cheng wrote:
> **Please consider this for -next
> 
> This series enables the PHY level changes that are required to support
> the type C based controllers and the multiport controller.  The typeC
> ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
> the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
> it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
> PHYs for the HSUSB path.
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
      commit: 2fe80ea29f46332eaf76d8435326e68197bcc9bb
[2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
      commit: 1c0b4539fc6d7cbe352cc12deef8a21d655f9804
[3/9] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
      commit: 0278bbd30f7c326740fdcbc3039ce42d7d921cf8
[4/9] dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
      commit: 18da99126ebce8d8ebc1ee0b84fe983faa138451
[5/9] phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support
      commit: 851dd2c9e91f2da1a60050265507a11aa24c767c
[6/9] phy: qualcomm: qmp-usb: Add support for Glymur USB UNI PHY
      commit: 7dbba9fb560f35bdf1eb44035f793e3b7f2cdcdb
[7/9] phy: qualcomm: Update the QMP clamp register for V6
      commit: c9543cca9417d83f8ca6a8ce0a5279a3fba7a02b
[8/9] phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings
      commit: 5b289913959b9bc93bab9e0beeab269c33c969b7
[9/9] phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms
      commit: d10736db98d25c97bdffacaca69ae0a8d7ca64e3

Best regards,
-- 
~Vinod



