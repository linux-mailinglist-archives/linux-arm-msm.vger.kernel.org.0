Return-Path: <linux-arm-msm+bounces-608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E857EAAEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 08:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB042281077
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 07:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276BC11C81;
	Tue, 14 Nov 2023 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQIIt++7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14D411734;
	Tue, 14 Nov 2023 07:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB654C433C8;
	Tue, 14 Nov 2023 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699947191;
	bh=1jPXW/9gsRNCRI/ogL17H5SYbGmYFfttaj3ESSTXmIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rQIIt++75FqOoAjUbylKmvaXsmHoCIQCguESRHUl38xhUoNOsZ/w1obOtqc9vXYp6
	 f/uD49221oPiVMZfY7mtL1S+DV6Gnhcj/XYliwMnOJKdi8opCJWsQ64GBBwH53V5bO
	 VNjYY+rj+8fhGjJHKlp56dEbLrpYO8PPEK+lMyNOAkNB03+qkSki1yJNKabxydCnP5
	 MhodKFDm0h5pdkIuHMKV3kmje8qa94dDbw1xN0cy8T/tX+TBibB4aizub73HmeNYcU
	 f7eT7/RP50SEuw7aAdodCUM88zUgWY5fmk1Ml7FnWHzJwXIIKt9VxVbGmBi57JeIwq
	 QAyFtZcllQ2lA==
Date: Tue, 14 Nov 2023 13:03:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845: correct Soundwire node name
Message-ID: <ZVMis75+dhUdm3iI@matsya>
References: <20231111095617.16496-1-krzysztof.kozlowski@linaro.org>
 <20231111095617.16496-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111095617.16496-2-krzysztof.kozlowski@linaro.org>

On 11-11-23, 10:56, Krzysztof Kozlowski wrote:
> Soundwire Devicetree bindings expect the Soundwire controller device
> node to be named just "soundwire":
> 
>   sdm845-db845c.dtb: swm@c85: $nodename:0: 'swm@c85' does not match '^soundwire(@.*)?$'

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

