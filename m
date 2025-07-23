Return-Path: <linux-arm-msm+bounces-66200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A573B0ED35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA5781C23136
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 08:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD122A95C;
	Wed, 23 Jul 2025 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3XTApcN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EA227990C;
	Wed, 23 Jul 2025 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259354; cv=none; b=bSMva54aK14znflxh9/nEbj0V4iKUeW25asli9McIkceSBHcJ+cZcisHwtozbaWTFNwwD333E7M8uDWAGuaLX3Ov0B577B/m5GW2Xz6pSwMgQbJnSXeeMbcFjypU06njC65jft4ju/GNmqU3TIOHQISk/8rD9+5iLfF8M7oEqXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259354; c=relaxed/simple;
	bh=SJ8fc2NpnCO+no1eSN/RzEnPIgifibyaw8VNSVwphgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PE9VGJ3Iyslzo5soG4hMoUvpG3N4iF0yROYzzbm0z5lUzI2QKwUU3oJfy6jjz7boZEAdhNtcvVl/Sj2o1hkA+ljlW5pRMlpChxv3a7t/tTWCsKsUxlAHMgrhIGCcPEq03YhPPqzxpeL0sI/ZTbgn2KPiV2ph4vNWOTucw9xBdks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3XTApcN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFFAC4CEE7;
	Wed, 23 Jul 2025 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753259354;
	bh=SJ8fc2NpnCO+no1eSN/RzEnPIgifibyaw8VNSVwphgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3XTApcNWd1pc3mPG8K5ztgs6uCHnGz1/oExjWITCGHivkYc0nk5s7d0YtkUSrGZC
	 cQIbzh/vP89MG37vfY1FOUHkT5kcLyMWTT2+mjcJUmpCCEIfXrQHuk0HgIWVh5RD8i
	 4oVcAPPOlrz2ANTg3qY0jAAlcvYrQYpQOwlE31mwXAGc80jfP54N528mjU5n1hpQNa
	 2bdybs6fVpaIwkjii1nDaYd1W/42J7niU+rgk5omiNgktxnTNV+Yjy22SpaU9L4W2q
	 PkkLjGfX3uKBw2L0wMHN1UOibsBNFLyfGoTVgtQg73IBQRMJ9iKKWHopvGVcVk0OQB
	 CGPiKOyD+eucA==
Date: Wed, 23 Jul 2025 10:29:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
Message-ID: <20250723-swinging-chirpy-hornet-eed2f2@kuoka>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>

On Tue, Jul 22, 2025 at 08:19:20PM +0530, Wasim Nazir wrote:
> SA8775P, QCS9100 and QCS9075 are all variants of the same die,
> collectively referred to as lemans. Most notably, the last of them
> has the SAIL (Safety Island) fused off, but remains identical
> otherwise.
> 
> In an effort to streamline the codebase, rename the SoC DTSI, moving
> away from less meaningful numerical model identifiers.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} | 0
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi             | 2 +-

No, stop with this rename.

There is no policy of renaming existing files. It's ridicilous. Just
because you introduced a new naming model for NEW SOC, does not mean you
now going to rename all boards which you already upstreamed.

Best regards,
Krzysztof


