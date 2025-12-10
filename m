Return-Path: <linux-arm-msm+bounces-84939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE8FCB40C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 22:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 039CA300F9F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 21:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C326032E72E;
	Wed, 10 Dec 2025 21:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTxRCD//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640532E720;
	Wed, 10 Dec 2025 21:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401618; cv=none; b=P8fmxPjgLMwkvMrjCI2jir6J5TCoIwZf2HiTqdWnVIX2YoQon2QdMQyAv7cn1q2Zle8qWR+2gZ70ZdXoq3MmAKbNntLA/ldyvNbIZxkQhuMiXcQx+Z68iH1aicteRfArzcYlGvOHpXcve/yId2fxVcNUkUK5HeS8N8llkjF4I/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401618; c=relaxed/simple;
	bh=WGg+czktn0NTNnavdklinGGScWfiYuPPdJCTzdTBBXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQ5xLtS9ei8ESrY+y+3HRiJPzzONujfjUcZui3LdGi2UC0LcKU9DMjOoOmFj0Z5/szPKBW6kjLY3QyZpiU6IeROAHNwxkV3hWUmewGY46ShMRu7VgLpaZ0KtMJmgnIdjPAvqEH4y1Wx3Rpf7Wy5WpTpofed7u146ZpKXz0rjQ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTxRCD//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B71C4CEF1;
	Wed, 10 Dec 2025 21:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765401618;
	bh=WGg+czktn0NTNnavdklinGGScWfiYuPPdJCTzdTBBXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTxRCD//+c4oClMgWXyh7R4MYjutvX3C9EaaTdnZq+hI1SjsxOsRWrN5OMAkWST8J
	 Nb9hVeX38X4v+j6gvX6S/gSUXsQGI5hA4KnhwCUaOHpK6UL2kPCyJV4oGGD/1Es5+Y
	 /fsNB+amRaN8O8y+k/zCceEKNie/IOErwF/zn6JYZgh4KjjZ8GhHfTR1faWH3IKN/m
	 Lx5/LmdDzv3EGcZkaQSzfXyFWSLBON7H3/SKIpQ4Ui3ghalA5o9/RH/wJK8hrvUftv
	 t+dqKAGmUh4faxRrXO9qVg6WrR/Tk2V+OEoG++tFI9x2QyM4ongloYNvPslnP8xN7M
	 EkuuS315ZRn/w==
Date: Wed, 10 Dec 2025 15:20:15 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, abel.vesa@linaro.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v8 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB
 UNI PHY compatible
Message-ID: <176540161525.3360166.13828719898400995208.robh@kernel.org>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
 <20251209-linux-next-12825-v8-2-42133596bda0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-linux-next-12825-v8-2-42133596bda0@oss.qualcomm.com>


On Tue, 09 Dec 2025 15:09:38 -0800, Wesley Cheng wrote:
> The Glymur USB subsystem contains a multiport controller, which utilizes
> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC, and
> the required clkref clock name.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


