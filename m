Return-Path: <linux-arm-msm+bounces-55152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A625A98CA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 16:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34D6B7A378F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 14:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F40A27C17C;
	Wed, 23 Apr 2025 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TI7iLkm1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECDC2798E7;
	Wed, 23 Apr 2025 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417925; cv=none; b=ZNtaucOo3S+syi8DkzTqC52kJqRuHl2o4y80RWZA9g5l/uv2cCTQdQ16rp5mzo2uE30IUIpF2j3YWujiTTz1dnxr3ZRcgWfSIUQce0artpm8hPadR3quwl+al3aQjq8oXGrWHO97PNmK8KQuMbxerf54b+ot1otJQHI8zPHnkAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417925; c=relaxed/simple;
	bh=0YZv48ymyFRIQI61YYoFRv2ZRDOgov4fvmdUKtEHbFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZqD4Ldw5iZIxeKuKn4Xqnxz/iYmDxBltBSvXZAPK+mbUa4FJU/nCO6fD1ckmUg5l9Jc8VZ3agF+MDe/c6z+ulekaWNn6B5y421ItaOoR0dkkw8cedYEpBaRMvEUlSv49GDfsof5pHhMP6+wreU739jaDMyDeUxp9DDQ9vCLF6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TI7iLkm1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD70C4CEE2;
	Wed, 23 Apr 2025 14:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745417923;
	bh=0YZv48ymyFRIQI61YYoFRv2ZRDOgov4fvmdUKtEHbFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TI7iLkm186Ob1fsGeiZO77tw30OHKy43U2ZVAiEDjnPuOD8zIzeg34L9Lfd+d98JO
	 pSlEjIu58+EcoqAIQieVYCk3fvTVB9sDRcMrJMBEfD3qlzagQwRwVXFVdSBU1M91ew
	 CUWH5N2rD+SYeh23ZD47d0o4Wp9MyUQP5JbqrvwnntO7j3FhsTbJxydplP/DYbMVxW
	 hUTNlB8K2yNhJy2l/DnV7iOcgG/k9NhgphBvGOzWC2Gy/dKp/Zc2X4aZ9N4hX05za9
	 TDIuuWBhEQ4L+ZzCc/ssefxkTGJouq9qbCANvleerU3jzUgp7JumTk3N1YMzHAaZB3
	 MBK07ySpivokQ==
Date: Wed, 23 Apr 2025 09:18:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm/cpus: allow up to 3 interconnects
 entries
Message-ID: <174541768602.433651.10640639620501587039.robh@kernel.org>
References: <20250418-topic-sm8x50-upstream-cpu-icc-max3-v1-1-87d9c2713d72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-topic-sm8x50-upstream-cpu-icc-max3-v1-1-87d9c2713d72@linaro.org>


On Fri, 18 Apr 2025 14:56:16 +0200, Neil Armstrong wrote:
> Allow up to 3 entries as used on the Qualcomm SM8650 CPU nodes.
> 
> This fixes the following errors:
> cpu@0: interconnects: [[7, 3, 3, 7, 15, 3], [8, 0, 3, 8, 1, 3], [9, 0, 9, 1]] is too long
> 
> Fixes: 791a3fcd2345 ("dt-bindings: arm/cpus: Add missing properties")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


