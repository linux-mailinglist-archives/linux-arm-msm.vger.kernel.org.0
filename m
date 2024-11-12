Return-Path: <linux-arm-msm+bounces-37635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7D29C5C03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 16:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578D51F22C43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 15:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820252022CC;
	Tue, 12 Nov 2024 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2nakeSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575ED2022CA;
	Tue, 12 Nov 2024 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731425746; cv=none; b=XRa15vsMhoqGXy4kwTAk0rY0rDMQwjKCIehJJ99B3417qgl3J+/BEo7vFgM0PFS8Qfl/xO95vjhmIR6WHNeY0LXXPvR75LRV/W33v0twhpJYM1RdYHD82T6HTUUCfQQYOUVYYjLuw9oyWftjR5dNj0KhjIEzEw2chHDkUpSVwWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731425746; c=relaxed/simple;
	bh=FBFO1tOymXIFvICjZQsH7NTICcSbX1UxsWRrYW+Dj+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2E5oA2vtQrkgFKwGzqpti2Uazz48t50pQnkFB935uW3YRHL08CwoSlK8CQxQIsixT31iAvSh+7vChl+xC4Na9N7bGkpt9tu9iNrxGs/Gjdj8p6CTCQv8Rd07+k61CGNPb6Zu005iVPJ43zRMWIl+7YzzswWG8M8bhoI02sUlv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2nakeSf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B550C4CECD;
	Tue, 12 Nov 2024 15:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731425745;
	bh=FBFO1tOymXIFvICjZQsH7NTICcSbX1UxsWRrYW+Dj+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2nakeSfOj53qGVyLxlgQ/NH1+wpFMgXNGju6fqmKggkU4IMfr8ysiEnShk2GsGwQ
	 9M6ZYS/RxxjymK1vl2wT5i0OOkhuAdXUo4mxoc7c2tMyd0rd8WK5/RXkgofzcIKZGu
	 t75kSfxY6NEMc+EoC7fcqop9NGH7AEBfv13hLv/2uQXw6A3Opu25PKUMBPIF7D0dU4
	 Q/s7jRLeIXf/04xf1skazu4r6F9XhUEa7z6Jl1/CIvkt5AfdEDt33xGQO0kGZr6skd
	 dRdCAigmt0r76uc1wlmF/Ar2QjdWiRburnm17gcaL26vOETKoPM2f4DlMQTb/hv66O
	 ZSTAvO8yIklpQ==
Date: Tue, 12 Nov 2024 09:35:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: arm: qcom: Document rb8/ride/ride-r3 on
 QCS9075
Message-ID: <173142574295.951085.7523517676553074543.robh@kernel.org>
References: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
 <20241110145339.3635437-4-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241110145339.3635437-4-quic_wasimn@quicinc.com>


On Sun, 10 Nov 2024 20:23:37 +0530, Wasim Nazir wrote:
> qcs9075 rb8, ride & ride-r3 boards are based on QCS9075 SoC.
> 
> QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
> without safety monitorng feature of SAfety-IsLand subsystem.
> This subsystem continues to supports other features like built-in
> self-test, error-detection, reset-handling, etc.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


