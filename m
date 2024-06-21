Return-Path: <linux-arm-msm+bounces-23504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F9911AFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBBFB28434F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3615155329;
	Fri, 21 Jun 2024 06:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElspQL0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F65153BFA;
	Fri, 21 Jun 2024 06:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950295; cv=none; b=kRkN7fN75ymqqSZSO58yyja+wP2UMGs8Y90Q0oxRjWfM7FdbOZQFnLNblSx+iwEC2aCzn//Pt3weSVHDyIr1ewmXqtxYK7opQS8bXKAisQZEuaCeRLRkghrE6ow1QmhuB/2bP9DjUqf+7lxfSOe1AywUZ/yNhYsZ8r6loEe9XbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950295; c=relaxed/simple;
	bh=Cml5C1S7f6/nQZnMLFyS7sOsEvX7W1GC/inrEntxftQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YNd8Gdn8qLTilaXjI98tvJBp6gvh9UcurgZCB/GXbHXJAxHM+8FlmjrsYlezQgFvrMFnXy5/8EPzYkurA23Eobdh3+iYSWxWuzArNdTYHkZKlurQm1mEBy4KJQq4ut4MP5usGthXWamhm+5ZbncJWQAgT85XAe8WmAajtadvpXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElspQL0H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEA9C4AF0D;
	Fri, 21 Jun 2024 06:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950295;
	bh=Cml5C1S7f6/nQZnMLFyS7sOsEvX7W1GC/inrEntxftQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ElspQL0HG1gJGt8TlT9MmebLwlvvghO6OPwtni6rb3gMRDBwH3Nw1VQNVC+Hf1hsC
	 BntmUg6aEu7d18DMYTZKAd8F1Ov9zvbGjPEbaSOGbiKR/MHwCUr6Fui+lJrQlH609v
	 IlLicgp+HdAxA0OgzzyHnLvaB+5se294E23r7rP8EzX6FAoZxUdbGJ7v6lZgxanqCP
	 EvYNgZKgKCjV85N4ELzg6U/BS40uirFDpDeslu5hawYBoNcNiCIde8Pqr6pSSCuMA4
	 DzRCiYcyn4gJm9OpgWg5cte4pH+opQV85JEcoYrHs0IvJ0LjuYAqMuaxj98ymgV7mU
	 e9w0CbOa9qe2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/5] phy: qcom: qmp-pcie: drop second clock-output-names entry
Date: Fri, 21 Jun 2024 01:11:17 -0500
Message-ID: <171895028797.12506.8337547267879269845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614-fix-pcie-phy-compat-v3-0-730d1811acf4@linaro.org>
References: <20240614-fix-pcie-phy-compat-v3-0-730d1811acf4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Jun 2024 13:18:23 +0300, Dmitry Baryshkov wrote:
> While testing the linux-next on SM8450-HDK I noticed that one of the
> PCIe hosts stays in the deferred state, because the corresponding PHY
> isn't probed. A quick debug pointed out that while the patches that
> added support for the PIPE AUX clock to the PHY driver have landed,
> corresponding DT changes were not picked up for 6.10. Restore the
> compatibility with the existing DT files by dropping the second entry in
> the clock-output-names array and always generating the corresponding
> name on the fly.
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: qcom: sm8450: drop second clock name from clock-output-names
      commit: 831f66d3423c22457ec1d686e565e152b10fbd91
[4/5] arm64: dts: qcom: sm8550: drop second clock name from clock-output-names
      commit: 84ea430eb0719ebe4c423bdc9c92e0f94a46a47e
[5/5] arm64: dts: qcom: sm8650: drop second clock name from clock-output-names
      commit: dc323623c3b87c48c99fe8dbbd1962f0129d3da9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

