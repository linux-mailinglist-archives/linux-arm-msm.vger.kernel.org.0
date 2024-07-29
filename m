Return-Path: <linux-arm-msm+bounces-27187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF93893EC62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 112231C213BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E8C1448DD;
	Mon, 29 Jul 2024 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocVR06Dl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEDE1448C4;
	Mon, 29 Jul 2024 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225546; cv=none; b=mHb26kYngqeMW6SPaKGduF6NlO2NzdTkXt2FvebIfd4YrOTR/mTP7J2V8kh0/s3w4MC5e+zPuvA93vBSGv9S/LJsWfWZ+ZqiWN6xs9Omb7IkoiYzDQ7jeYIT6SaybiEQD4oayGi+DKtpL5IVfPkILfL3Lz0jVPjyAkcGdAHLCWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225546; c=relaxed/simple;
	bh=Kw+LKksax/cUwFQaWVgsl8fW6Fsvsb5kyPWZSS9+pgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nCeBr1pd0htAYTZAzAt5FSJI49GLcPxrNNADTagqCXVlJlAW6Fku/Rrkje0U9rn+M2eVf6ZaX1Y4LwF1Wgm3wJmzfj6s2kVgqAGxzOMLk0paAp8ElTbHHWcXOjTdWHcdbABVQ686YKQsyLmJuY4OvAq+XDJMHGU5voO5FvODX/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocVR06Dl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BD7C32786;
	Mon, 29 Jul 2024 03:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225546;
	bh=Kw+LKksax/cUwFQaWVgsl8fW6Fsvsb5kyPWZSS9+pgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ocVR06Dlg8y1TlOe2OF7p9+MPf3xROSvm6H7EXz0G+EJtEr/uab0g56lEKzvJiKm9
	 Jn5oHBLJs+x815TiLyLsNLqpTOrPqbt7uL7uUPIfwxOyw7+BnXwLqLloTa4FNo48Eh
	 HrHdv6ZHUuq7pw0LGqyFnLCH7Cxezqt7sYJt/Xzw6LCKvgnT13smJ63OYNZgEZFEcU
	 Vfwo8wokYASFOb5hkLA4YncRXBgXGR3dfW8N3RTqObqZLLxgwCCRnyRoCDYXK4DCBP
	 7F+dC2oCigIzwc8gxTW+2B+tt1IGyhIYvXv7Xoi18ytoZzapJVrFuSNVtFzZXI+4+5
	 O3U0M52+Wp3Bw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: qcom: {a,i}pq8064: correct clock-names in sata node
Date: Sun, 28 Jul 2024 22:58:31 -0500
Message-ID: <172222551314.175430.14891938021245477785.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717094914.17931-2-rayyan.ansari@linaro.org>
References: <20240717094914.17931-2-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Jul 2024 10:49:14 +0100, Rayyan Ansari wrote:
> Correct the clock-names in the AHCI SATA controller node to adhere to
> the bindings.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: {a,i}pq8064: correct clock-names in sata node
      commit: 440c3fdbfa7d9a244351a66595d844e64d171640

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

