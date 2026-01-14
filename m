Return-Path: <linux-arm-msm+bounces-89018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C7D1F4E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 15:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E96BE30C8935
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 14:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919472D6E75;
	Wed, 14 Jan 2026 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfUeG8OS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3942C0F97;
	Wed, 14 Jan 2026 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399313; cv=none; b=r3FpPICCXqt3WoNfnuSaRSzly7WpW8zO4jqLnGSywBOBTRePyV6MdG8z2wyGpbvj2inSdeDdiMJqlp+ei8sI+tjSfI7co5/Wn5FEgGDTQzxid3Rj63BFhdOnhSExzumPTupCFRmGhEvPLx7ZTiNEFEzvR2Iw4XlVh/6unzZJv3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399313; c=relaxed/simple;
	bh=MHTXNpJPFQg545t1nBhA5Hxy7M5eBdT3G3Q2/R91vrg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JncTW+XDbKbff6GdL7AWh05GgeZ32KMA4rpZoRb/GOVFyrEM7CU0xKlT7kWLhKd9sXlOFLM4s/YofKvvO715Oz0rFu9DMZ/eCbH7g0K6uZW6fw/8V9qGw26wZpksLoMG6OE0YjjVqZuSVYylHIdgQzve7AVERyUOn2J2cSnWeJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfUeG8OS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E76C4CEF7;
	Wed, 14 Jan 2026 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399313;
	bh=MHTXNpJPFQg545t1nBhA5Hxy7M5eBdT3G3Q2/R91vrg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JfUeG8OSOyzDoS4QPo9ky/aPctN9gJfNsdyjk7jpxexuz61MJXVMw8gnHapVtPMMF
	 wu9c8mZKBdpzDKEFVg8fONBD3CTGM342NEg5jgUtYqkUezB7eIHo/3ijqXd3vKI21T
	 UMEiTMRfIwBVTq1Tsc4oYYFF0pE9EAZhT27ZZz4Z3wyZ/3dknoF/GOnefW183UsRjb
	 8Q48XXVVvZlM2aklxbvo/AgaRmXKPERS7dADnUvKF98XWFEWxjORpuKlVrO1i+oq35
	 3DNY6LIriBPWSeNO8vdjy9RGK01/EcGVh7mhln2ZSGCctnkqd58jpVr8x5fd1siln5
	 FtWU/4GQR/LkA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
References: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] phy: qcom: Introduce USB support for Kaanapali
Message-Id: <176839931031.937923.8605452740220301145.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 19:31:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 08 Jan 2026 10:54:57 +0530, Krishna Kurapati wrote:
> Add support for the PHYs used for USB on Kaanapali SoCs.
> 
> On v2, the usb controller bindings have been split and v3 was sent and it
> got merged.
> 
> The m31 eusb2 defconfig patch also got merged.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Kaanapali QMP PHY
      commit: 69efc71162b5742381de29f661c913013b254c2b
[2/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Kaanapali
      commit: a6a9aeaba36f42ed6dc4cdb865ae6b7ded4e855b

Best regards,
-- 
~Vinod



