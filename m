Return-Path: <linux-arm-msm+bounces-32249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA089842FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0E7A281EFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F8C15B56E;
	Tue, 24 Sep 2024 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1WCrUHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF7713B780;
	Tue, 24 Sep 2024 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172315; cv=none; b=Pmz8k8qdN9dTBwulP7yQv6JgrSnFx/akDNlchxL35+52nR16hVPTEnltZlYVlWiK4T4tlMls6rdyMm8FQWDibYGY32aTS46/oySBrhfLa0KRxxXLekubouU5wdnfiiiq6YhoCVg3jik2QH3/UpT4kq598LSHKprvnK77yxf4wOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172315; c=relaxed/simple;
	bh=PHa6jSVqw7T8R28BxoE12a8nZOi02Cof+pFsVjOMPS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaXToUFVuzfJjVl9MYomMdH7bz9leya3NHFr7/jAJH/KOTbdolwzaYOrmq8YuAvKWWfdmbLcUHtAfMRVIIx+EDVOc0d7C5oLXviygdBzhaA3HRkAVH/GbUMHC4sSYZ/1RkL8rk4FD434uNyOskDk2zKKOoowErC9Hp+pd4x25wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1WCrUHh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F53C4CEC5;
	Tue, 24 Sep 2024 10:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727172314;
	bh=PHa6jSVqw7T8R28BxoE12a8nZOi02Cof+pFsVjOMPS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1WCrUHhA4a6gqPwoI9o22GhVYh3z8LJMMy1WiIWVbQf18CU+0pwwDFFamjFtRaJV
	 7Fxpcoua9LLOpCY3DRGaJvYvzqV/W3dxoRAz5T2tZDKOz9ENEsjZWiTmW+Ji1lMELa
	 ZssWmlcVeOOeYjOR23cTyFhjqtAb/WXJG6ETV84kBQ+VgPkaCn/AdjsKmHSkZL3dCC
	 +vVd7bWpL/Ktjd3wgP6AaiCLATc/OFZYoFym3AzAe5OfEKAw3H7FgaYdDIZ9EGIIwk
	 /fmuUsqpNiiow0yYIqeiaAaCAlxz2T1bHXn+nSDiw1uqBgGOgqSw5Sel6pf7qePFzB
	 /Mb4amebxoMZQ==
Date: Tue, 24 Sep 2024 12:05:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Merck Hung <merckhung@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Message-ID: <xtzesp4oh6x2ukaqbfhxvgbqagjmtoevhsr5keat2pnncg64qu@zf2zb7ci56o7>
References: <20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz>
 <20240920-jg-blackrock-for-upstream-v2-2-9bf2f1b2191c@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920-jg-blackrock-for-upstream-v2-2-9bf2f1b2191c@oldschoolsolutions.biz>

On Fri, Sep 20, 2024 at 07:47:25PM +0200, Jens Glathe wrote:
> Add compatible values for WDK2023 with its codename "blackrock"

What is WDK2023? Extend hardware description. Who manufactured it? What
is this device?

> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Bindings are always before their users.

Best regards,
Krzysztof


