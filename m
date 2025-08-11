Return-Path: <linux-arm-msm+bounces-68602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBABB2195C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE0312A6BE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D42285C97;
	Mon, 11 Aug 2025 23:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6bZMjBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E4D285C88;
	Mon, 11 Aug 2025 23:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954860; cv=none; b=YCsf5VDn0d5HEYbEb8KwBobb5rmL31SXYrdF7qqoawJk9VdJWKASy+Fgjbrxw7bksKFrSuWE+6CUQPd0jf8Jv5gV2ADZ51CyKjRV6aQyq9cI3g0klK7I+YX7o4uYxr+IzyLFeoLwPAXvyAYsEdc9BeXLDHu+ZCQ52QaR19hCH94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954860; c=relaxed/simple;
	bh=IGOznMlgt1shLTQwjivrHB2DKFmZCGhtEMMWNKbCxdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LbE4/H4wJtAzPcku1GDqxciFRhWggxFr99/7mDtBw2vA2fXgQybTwOdnhxUIX4sn/vNqN55LEIKwuIl8Y6Zj6kstha6pGVNcXPFhT3pQvFhEe0sUNc//ZvPkKNn/9ShGgg0hX2l94zDvYLXkI6NfHNVfXJl4XbuUMbZbJaYkwwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6bZMjBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9A9C4CEF8;
	Mon, 11 Aug 2025 23:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954859;
	bh=IGOznMlgt1shLTQwjivrHB2DKFmZCGhtEMMWNKbCxdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l6bZMjBrFFLG8ccLP5GfQVUFrVsAgxeh0MK80jIFZu64ArcGjlVk5Xx4pPDImfpKP
	 +iq4KxOOOsriKjVer9l2THp142nnSINTjW6Ejj61yoYXN5xEFxQNtptovROpE3rZuF
	 HYz6sPsGMnwMNh3WZmeihl7f51SxH9m4I6d82NH5z+pGclBhXqT/Etwtw6D39lYDkA
	 jIRoM7bFUSMKG+DYEl0TnYJhzuZVcFEk4+L3Spe+mR7rT6mpBsWk6/2/8K6AHXFFZ2
	 LlQcRGPfdAs4j29YhdWP5OCMar1a/kC2MbpkdJ/NhOYc33TLiOlQsxANXpQxFu495u
	 xxqZ1R2Pn3yYQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-crd: Add USB multiport fingerprint reader
Date: Mon, 11 Aug 2025 18:27:10 -0500
Message-ID: <175495482460.157244.10633328382838060238.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250714-x1e80100-crd-fp-v2-1-3246eb02b679@linaro.org>
References: <20250714-x1e80100-crd-fp-v2-1-3246eb02b679@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Jul 2025 13:48:15 +0200, Stephan Gerhold wrote:
> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> multiport controller on eUSB6. All other ports (including USB super-speed
> pins) are unused.
> 
> Set it up in the device tree together with the NXP PTN3222 repeater.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-crd: Add USB multiport fingerprint reader
      commit: ad9abc9ba4046360f23a410f74ef78e646c08aa1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

