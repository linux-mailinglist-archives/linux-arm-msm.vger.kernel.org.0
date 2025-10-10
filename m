Return-Path: <linux-arm-msm+bounces-76794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E8BCD818
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 16:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 66F57347E15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 14:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9932F533F;
	Fri, 10 Oct 2025 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/2bOU4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C2A2673B0;
	Fri, 10 Oct 2025 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760106247; cv=none; b=cXB/hoVY2+kRPWBiAXp3Y+cE+UwpWxvmKqSplhJNwC+pnIP5kCyPZTK9hl3myLQXiepFELMYHuSbOypRETZ+HpfpzLP1E4ah8hjJZQy3DgmZlKR8jTG/UklaArPYdUQs9ekHDB0g+c6RrirfweD3FmrRTEkCPx2iAAY475wa3po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760106247; c=relaxed/simple;
	bh=g/CCLFYJth2UWZIRrD9Q/CZFla4xPgWxZ+t6woi5ZUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGQ7LqgdWErb41HS8+FCZOsr0o33b3OrsPoiwcYXmb6E8rH8ID2VUAy6RQ86R0B7SpIv9jg0qC1USn2Z/WAjJV8raPsntuWKbsCFYclyJJkUxePsNRM/AhxuxY1NIrZT30NWpDXbizRfS6WvRrUk5qa0Yj8w7zflCg8F4NhpkrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/2bOU4q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2F5C4CEF8;
	Fri, 10 Oct 2025 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760106246;
	bh=g/CCLFYJth2UWZIRrD9Q/CZFla4xPgWxZ+t6woi5ZUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/2bOU4qvv1Y1gvxd3uTWsxHGG33oTre9jFhgeoxJHjbyXyZAiS8W37Ctp154law9
	 54a9B5TRQTsaKdqbxbcaZbhc71O2kbXk+qxLJznBInC0xTCSFNq8IZekTVfmvB+Zpr
	 XufCbxrS0vI3UJGh6EJsuFsjZYufbIHU/CSQWU2O8xmb1Cc5pe0LNJDWrSukj3Syxc
	 zs25Nn94Qrl4JxxfRaPIfa3v9ezQPVb3NVzzq55gVQPHk+j8JIO4CK5g5JMdIT3/FR
	 tUeiA09ul6mTekNTbpDA0MiABz4wluy9gIQLe7NtT8aEhwlVuP4gvG/s9iCBdOynec
	 c1LKn/XYNcT3g==
Date: Fri, 10 Oct 2025 09:24:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, quic_nguyenb@quicinc.com,
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
	linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
	devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
	quic_sayalil@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, quic_rampraka@quicinc.com,
	Ulf Hansson <ulf.hansson@linaro.org>, quic_pragalla@quicinc.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 1/3] dt-bindings: mmc: sdhci-msm: Add sm8750 compatible
Message-ID: <176010624404.239496.14425678947212580288.robh@kernel.org>
References: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
 <20251007054445.4096630-2-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007054445.4096630-2-sarthak.garg@oss.qualcomm.com>


On Tue, 07 Oct 2025 11:14:43 +0530, Sarthak Garg wrote:
> Document the compatible string for the SDHCI controller on the
> sm8750 platform.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


