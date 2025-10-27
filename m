Return-Path: <linux-arm-msm+bounces-79068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBDAC11DBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05C4E3AA7CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE3334DB48;
	Mon, 27 Oct 2025 22:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pS7qBZCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8744F34DB41;
	Mon, 27 Oct 2025 22:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604536; cv=none; b=H6Nlv4CCVUFBivDbRyDR7MIXPkxCrhncFdM1R0pjpLMZPPe/lhkJdzJKyj399BGCuybS1Ty0sigNp1oQuFSMqFVS+KbPMGOh0eLKPsDfRomQ2p255eZa7iv6af0hCJY+3bbBhvrb2v8sDoo8yCA3UbI0wIRDxKchELqCvt3hH/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604536; c=relaxed/simple;
	bh=SVJCxNGsaI95elWpT8WcKJXJTbbj3hdQhGF/fhb0pn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bkj7GyTdzR2ZI5DxXSlYANVCyBIdFzeH+d6ndQvkCX+7Fx9f00EfAHXH7VY6A87fSZJHfB0Z0v+h5sRgMPV3m5600W4qBR8MZEhk5iDOPdNNVZ3zLNivwU4Av8EF7uOHVECvet/l7TX6uGTURvnUpZmeQeReX5zPTioaFSS0tvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pS7qBZCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38550C4CEFB;
	Mon, 27 Oct 2025 22:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604536;
	bh=SVJCxNGsaI95elWpT8WcKJXJTbbj3hdQhGF/fhb0pn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pS7qBZCE7KWwxBdukMshdMX8ZzP35RJ9mrTCVZs5PGe4BIEuQwxURqqcBVtYRz+W7
	 fqu9BGlycoW6vKkoa1d5dUFbnO0yNeIkt+Lw7bi03r0opY7qx2UwqggAwtdHuo7Vzk
	 Tx9Nee/bXB5xM2AFZiFEdhLSROU6ndjJIkieQOluilzraDYSyO/5KO63zNrEzuRv3d
	 L99DIoTVB8amF/CBmddrYwGc2da2HtxQ3o4+HXhb/oymgwbZMP0ZIGq2c+yBEWtQ9R
	 VNgEiXfpunbU8VKuk+IVNihQvvS0y5SO6M5IMWhzBJ+VYWm6mdcSoGbPxqfw0cvC/q
	 18XEwkJro9b5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	Val Packett <val@packett.cool>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-dell-thena: remove dp data-lanes
Date: Mon, 27 Oct 2025 17:37:28 -0500
Message-ID: <176160465217.73268.7464752003289987581.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012224909.14988-1-val@packett.cool>
References: <20251012224909.14988-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 12 Oct 2025 19:48:07 -0300, Val Packett wrote:
> The commit 458de584248a ("arm64: dts: qcom: x1e80100: move dp0/1/2
> data-lanes to SoC dtsi") has landed before this file was added, so
> the data-lanes lines here remained.
> 
> Remove them to enable 4-lane DP on the X1E Dell Inspiron/Latitude.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1-dell-thena: remove dp data-lanes
      commit: 147d5eefab8f0e17e9951fb5e0c4c77bada34558

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

