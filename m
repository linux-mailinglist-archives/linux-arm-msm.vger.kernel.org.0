Return-Path: <linux-arm-msm+bounces-58013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39774AB783B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3FDD4A7539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B9422370C;
	Wed, 14 May 2025 21:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dO+hI2tE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C8223316;
	Wed, 14 May 2025 21:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259708; cv=none; b=YjbYQ39tm2gEE4laqVe6TMH1ykQSfQZ8CGnxctlqqF3jka5ViODf5qClJYvq6juHGlVvAyYvLUsgCdNkLyEwGqkO8KRuH7S1vC7YpDFTUoRmH0tJRwNFDEgGy2e5MV439yoDQYPsq+gHdbgnEnSWo8LWq9wMuCAaTPw12gK5INc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259708; c=relaxed/simple;
	bh=WFYBeOec3t7SioFHLVzxmxxsHULVEJxgk5kZ80NzcnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMzXGqGzwrlrDe4XBNB5ykoa7YOKOA7HD0ElEZ4vQJ8ihDdF9TDgShiQCOFeU79BGxf00diyZsEZSySLZUf04CoeB/PLwekDeSZ0LuWHB1X7FNAVqW5+eN3s8MtHqdBr00rR29Mvv+sIB63D6zflX6hi4m/O4QiXTYbgsDESM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dO+hI2tE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D291C4CEE3;
	Wed, 14 May 2025 21:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259707;
	bh=WFYBeOec3t7SioFHLVzxmxxsHULVEJxgk5kZ80NzcnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dO+hI2tEfw/gW14U8gMv5GQl+3yhV8wU6pACy1xsDF3OQ5SK5HWUU4x9vo3KAzJRA
	 8XODBFFXsgh7foaQmf68I6ykga+HtDbcduy17NVcla6LRjMGCu0o9i4uX4u42OohKt
	 QRA/RuMIfxFsRE49VkSbxCURFslCGtTHeyxJRGe6X5Vf6gYgFBjQfXtI5HfRxrN78P
	 DQuZlNtTI7Q7cIU5GrwCYlPvdeHYr6KDZY9qmSgs7SyoHF5i55yemMDzCMqiDCahwv
	 OY5oF/UMj4sda8OL61jiHYyFW5CWkqZl5CHTRkmSIuPMzkNPCwdv7e2OLFfQtgeL5M
	 kbDxbp33BooGA==
Date: Wed, 14 May 2025 16:55:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for
 ipq5018
Message-ID: <174725970465.3106098.10580150024417403013.robh@kernel.org>
References: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
 <20250512-ipq5018-syscon-v1-1-eb1ad2414c3c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-ipq5018-syscon-v1-1-eb1ad2414c3c@outlook.com>


On Mon, 12 May 2025 18:36:46 +0400, George Moussalem wrote:
> Document the qcom,tcsr-ipq5018 compatible.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


