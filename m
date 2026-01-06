Return-Path: <linux-arm-msm+bounces-87641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EFCCF709F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 08:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5677302E3C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 07:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9988C307AC6;
	Tue,  6 Jan 2026 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bur3yb8k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6556042AA3;
	Tue,  6 Jan 2026 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767684775; cv=none; b=M7RKtEBBWiAvbw8uCvACg9uR4c9lSsfnRyfTpfMfGD8LlS0lIZIBAQH3Qv7v3SXuCv2xS4YNxlgaSX0CAY31Aib3aA3sqspBw89HGnYnmZGMdp6OaU0i7pfuROcE+qu1gFC21YQTllo7ts9DjlLphqUVglD+bpa9noBeRH/SvG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767684775; c=relaxed/simple;
	bh=BGcwdH2AZcgbbKhfbfSssEoXRyTGTHTkrAq0xNhjD7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eta2AKfpvua2LSlnnw3LJmsLEfWU3qoite9tqvoeRbkI2/IEO3fe2t9ebHopT+WIRj0ipTCxgREaIlyCUz78ICM8aKPzihpU0JGnGdr7psj4lgbpHw3EiaRgdBT7wv7JoTTfuG0DCKaCRSK+qVvEGqjxYCZpWqWHo0rKRBrCYxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bur3yb8k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D426C116C6;
	Tue,  6 Jan 2026 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767684774;
	bh=BGcwdH2AZcgbbKhfbfSssEoXRyTGTHTkrAq0xNhjD7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bur3yb8kv1ugmxkILUn4SkfX3o/VzevKXIbmTgWm1a4fqlduq6v3plPILSf3gy+iZ
	 HV/DI4UAlAzKIjkgvobS6xIG39CXWyTD8E/4JTHTxe5p/vrGLwtLmFTbXvTuAc2oeY
	 ddnywqdqBZKeVZwT7EZjz1bRuzKg/2Vm1j1DxAqjRUGT+lPrnEXnYTl/5zoxWYOIVA
	 IuB1DAeOrc2fDT9oNxuNFyfmQbU/7GHFgN9RChNz3+8nyAkLypecuwM5bf1KFIJYR9
	 NS6la/EA8XDKusir1ORjxXhDtjWCjbYtBq0qj6iwGar982fe3VKg7Rq2PivD+amjju
	 R+MEnH3MoUk1Q==
Date: Tue, 6 Jan 2026 08:32:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com, 
	andersson@kernel.org, konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, manivannan.sadhasivam@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V3 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 QMP UFS PHY compatible
Message-ID: <20260106-huge-radical-bear-aeb732@quoll>
References: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260105144643.669344-2-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105144643.669344-2-pradeep.pragallapati@oss.qualcomm.com>

On Mon, Jan 05, 2026 at 08:16:40PM +0530, Pradeep P V K wrote:
> Document QMP UFS PHY compatible for x1e80100 SoC. Use SM8550 as a
> fallback since x1e80100 is fully compatible with it.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


