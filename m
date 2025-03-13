Return-Path: <linux-arm-msm+bounces-51253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C576FA5EDF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 09:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5BBE17B899
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 08:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7F2260A33;
	Thu, 13 Mar 2025 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NL/EN3ET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC351EA7FC;
	Thu, 13 Mar 2025 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741854308; cv=none; b=LpT5g59fNJcs+ZkvveT8SLwz1wCYstf3pCXEvsbOmS02zNltf2JXgAMHDJ88yaSPMNJUH8U+IimbN3zqh7pD0FZa+HONkDrbMNxAJpbz9nE6ExsinadrbvDX619yeg+ymuU1EIq5J6P2PTITqih6dMU7WDtgf3DvSaU9bKwm9OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741854308; c=relaxed/simple;
	bh=tP7pYcJ7IaS/Md1BK9deqaULsuj+tHBEOo4Z7ziQAkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFVkNh4WAsnkrREJJYYRb5gFrBlaNWnmV5GrzSHR71h/QjyY1dAEgpu6smVnsmF/Ni2s/teOtJNL2+AG+TGfX0n4mGrkFxhRuHA/iqNFXdxH3NlWkBumUgtUGSWdcg0anQ/Cr0Ya0jsPzMnDrhrGEEnm43HaPodynKQuc5ZI8vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NL/EN3ET; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEBAC4CEDD;
	Thu, 13 Mar 2025 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741854308;
	bh=tP7pYcJ7IaS/Md1BK9deqaULsuj+tHBEOo4Z7ziQAkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NL/EN3ETQnY+Lz19/9hMJ+OGvvE3x/RWN3cE++EjFWmiPKO2VWc17YDgkqU7jHUhZ
	 akNjOqPnK/HBghunrcZXXkWXN3tnq37IF33FljFlzOv6ne9wX3CNFqmTi5e942R2yi
	 CczyHgyQ+o+nuF57BGEK25KVtBcxhn8V7zJ3qxgmWSniA968DR3M90meO5LKQwX75Y
	 LDPe7AnucVsGwLxJaacHVdqW3isQj4EjfXPWD5uXBdqSe7v6MSCQys7sEoBNv70Hq4
	 J2fqzNAWKTtE33cnG6TsabQzsnu58qMCexpuhWG7H0l4bsov8uXYrTa6ZbHJyIb3UH
	 gdkeK+qdUIewg==
Date: Thu, 13 Mar 2025 09:25:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <20250313-mottled-quoll-of-vastness-3f3c6b@krzk-bin>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-4-ebf4b9a5e916@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-qcs615-v5-mm-cc-v6-4-ebf4b9a5e916@quicinc.com>

On Thu, Mar 13, 2025 at 12:29:41PM +0530, Taniya Das wrote:
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'

Also no qcom,gcc.yaml. Why?

Best regards,
Krzysztof


