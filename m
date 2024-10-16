Return-Path: <linux-arm-msm+bounces-34616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B18C89A0E4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676AF1F23E3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF7A21262A;
	Wed, 16 Oct 2024 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdtJ2uR/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7371210C38;
	Wed, 16 Oct 2024 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092741; cv=none; b=pQ0J428N8VpM1Z898i3jQ1FDBk9FPW7vAoyz14lW26DJPsGOidVTUJrv0lV+Y77bKBvEYOhlkXQo3eFBpL8R5oDVemEGgnFx7m59Z2O6UhF35Tub4PxyH9hNOiDpURL5DoXrvNg0YRVpctiPgPcUDyo8J1xYgMKHy3e/uX5SDFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092741; c=relaxed/simple;
	bh=iOdIWcmLMyMBHx4nlOKfoU7BpqjbSxaB775DmzilGiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jCo49jBAKgYvhhUVP0uKo7yk+isUluZ8BFpVPHiLxZTHHb9/xk9nMkGOoh8TY4Me6KHOZE9YF56KrA7Zph6nSuzluN0+CZL4qAlIyC1SOH+f7DVNGpPM0Hm4bZdCH51pRtRhIoubU97eElHfmeJ7VMsoIrj0OqRMWpsD32Rsf60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdtJ2uR/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFCCC4CEC7;
	Wed, 16 Oct 2024 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729092741;
	bh=iOdIWcmLMyMBHx4nlOKfoU7BpqjbSxaB775DmzilGiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mdtJ2uR/izbvFPwgjp9zfubCElADJeEHGXGiILIx5Dir+YyknYpZ3bDB/rXyJz/WD
	 lsoHPqdsl1ctGHAVM9GhXXNFxm69/B7UoafcpyN1RrPo5n9r1GrYcAnd9h6IbRfyW4
	 dKZOeMJ2UW44DGVXrnYSey9pgCQAm+l7SQpkXUGYcwEvAqyh2RRF3sRYEGIWNL0jdT
	 HxfPd6Bv9MuitAHSLmgxr/gbXMFzC2YLsr5H/LtAlIq8SAEJ7e6C13TK1JwKyLJc5/
	 n2VDMV8z8PFFnCqdzMXC1Nesp4AwvmVQ0O0Eg4hjH+1wYdlQr0WJa8ODuegzpIn2AF
	 y+jaQPYYC//aQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
Date: Wed, 16 Oct 2024 10:32:16 -0500
Message-ID: <172909273712.703216.9083554221438336956.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009161715.14994-1-johan+linaro@kernel.org>
References: <20241009161715.14994-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Oct 2024 18:17:15 +0200, Johan Hovold wrote:
> The DWC PCIe controller can be used with its internal MSI controller or
> with an external one such as the GICv3 Interrupt Translation Service
> (ITS).
> 
> Add the msi-map properties needed to use the GIC ITS. This will also
> make Linux switch to the ITS implementation, which allows for assigning
> affinity to individual MSIs. This specifically allows NVMe and Wi-Fi
> interrupts to be processed on all cores (and not just on CPU0).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
      commit: 9c4cd0aef259d41355f90e0dbb2d3574f3830de9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

