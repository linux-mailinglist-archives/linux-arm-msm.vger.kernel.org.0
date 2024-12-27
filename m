Return-Path: <linux-arm-msm+bounces-43465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C19FD042
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B20351883773
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E83136671;
	Fri, 27 Dec 2024 04:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KATw6YP3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D35132103;
	Fri, 27 Dec 2024 04:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735274431; cv=none; b=Gsu3GQ+up1nGhA0Pm24r2ooBXsKRDxCWiOoH7R7hx874HBwtwurhcUjN7L35NQxkoOs68VetUBtb66Q0eyTAEzBP+ZAb5/kSbP1m8Oua8D4rIyISgp5CFq2QoFQKssAYfH27xh4UYlVO7g2JxhRUWVrOAumuAoBjMIaLci2XsxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735274431; c=relaxed/simple;
	bh=41PLkt5f8AhOZ+u16eIf8VdCJuNdXY6/KfFMMkR/GF4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SeVFc61bzyqC3D3AJ4L08icEmwjlODKlYKocLjEmSGD1Nw3TjXFBIrZx/4Y9zO/tuSaoUY/SkRUbmTip16w+KvMFqBEG6NPUhywxSJFcU3xS7MAp6uv5ywFHEu9Z1qJuXZpj7Dh5XBam9V6CgJNgcJ2w2KSng/UMFVOi7e5IfYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KATw6YP3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EACC4CED4;
	Fri, 27 Dec 2024 04:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735274431;
	bh=41PLkt5f8AhOZ+u16eIf8VdCJuNdXY6/KfFMMkR/GF4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KATw6YP3i/CoNJbbzw1MPtOPJuX00U5LqUfMl32k7syJ3VsluGyY4zGsrcsUgMYQM
	 Dx3mdBb1ZvPZK2Y6i4XveD0jJNznKcmNBfqXsMV5+5HdxS6biHKCwKd/tWgsOEl3k5
	 xCgoopUDZp2pqnyrCGZbTjkiEmaFi7YMjOVrTIBkjIQJOxq5t9ohUERNp4MKWzkCic
	 Lg4Gb4hoOzEvkbCaBbhJqARlEVAOI61jPjlFCcHrrHyD/kFyAAEJK/IFxklQpv8U4+
	 OtEzZ12oiyX9+yFwE/H5+3Y1duOo6alK3lO9egfXihtPc10a620z6Ym25TiFhTmrMX
	 /XYeSwypDDuXQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ling Xu <quic_lxu5@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Fix CDSP context banks unit addresses
Date: Thu, 26 Dec 2024 22:40:26 -0600
Message-ID: <173527442284.1473071.10343677678222928118.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241104144204.114279-1-krzysztof.kozlowski@linaro.org>
References: <20241104144204.114279-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Nov 2024 15:42:04 +0100, Krzysztof Kozlowski wrote:
> There is a mismatch between 'reg' property and unit address for last
> there CDSP compute context banks.  Current values were taken as-is from
> downstream source.  Considering that 'reg' is used by Linux driver as
> SID of context bank and that least significant bytes of IOMMU value
> match the 'reg', assume the unit-address is wrong and needs fixing.
> This also won't have any practical impact, except adhering to Devicetree
> spec.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Fix CDSP context banks unit addresses
      commit: ff2b76ae689b71e2d7a2e70bfd8d71537c39164d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

