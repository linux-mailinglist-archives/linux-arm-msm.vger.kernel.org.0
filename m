Return-Path: <linux-arm-msm+bounces-39709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD789DF026
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 12:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89D2C1638F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 11:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7259189F5C;
	Sat, 30 Nov 2024 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noznAvTz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D648141987;
	Sat, 30 Nov 2024 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732966510; cv=none; b=lWliv3AwZDX/5xRowIC8aUIaaPOue9SiCVOPBUhWvnTQZhnX26Wo7BzG5fMLL7w9L0399/rpk++aC6Fije88pbkt6HuPIXn4j9OnT1oOPUL8nT2QA4y7IJoH1H7qnuZ8SGj8feYDn5HZf8P1BbkevA1ShHbAjPAIzacaRN1PIxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732966510; c=relaxed/simple;
	bh=4mKUgRZefasJ1JIzQreXBbGxRktCpSzRvmcINfOabW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glp/vP/FjUVKinT42FCVo0izb4QRKm5BVOHVVlvS3lUOnYumiTg+4Dt73S5UG/bBrHNLBaHAC3FwZ47zpykb5BxOsAAPkJHCL0d+O58iagOqQi/mxW+B91x3u31QDjaz4pYlJ0yomFRfHYFwTXqTio2h5WI2an3D6pGdUwzpNvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noznAvTz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3428DC4CECC;
	Sat, 30 Nov 2024 11:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732966510;
	bh=4mKUgRZefasJ1JIzQreXBbGxRktCpSzRvmcINfOabW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=noznAvTzciGgC+5xIkJh3AkV0sNi8HqQjNGfIPmmHtx51N1BAz0NDZeYUeZl5V130
	 ZMHZDAmlKk/Z9XTlYzrDsnrLLbS4enKyEo3w29Q+KS3uDBXHp8AxmL16MTzQgKeKKj
	 y85yf0BY8f4EBNH7t9aQmIRD9PoPMGKflCZh1sYe6jvVK75nYrJD7+ZvEjkHglfzyL
	 jhXPkS721/e2GBgs2x9IhkRUqwmsBKDmpi0WNmMW0eJuX+rCRDBYsdUZA4p+AX/RNV
	 KF8fGcAy5MpEZMIeAqZKVYDqkW6sDo7Cj2e3yaH0gQqVBWnw2J7FR/QH7GOaQ/Lrp3
	 WqUdh0hTb2lpw==
Message-ID: <aad1fa32-0b23-4c32-b7dc-154c07907603@kernel.org>
Date: Sat, 30 Nov 2024 12:35:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: Drop Bhupesh Sharma from maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Bhupesh Sharma <bhupesh.linux@gmail.com>
References: <20241130094758.15553-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20241130094758.15553-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.11.2024 10:47 AM, Krzysztof Kozlowski wrote:
> For more than a year all emails to Bhupesh Sharma's Linaro emails bounce
> and there were no updates to mailmap.  No reviews from Bhupesh, either,
> so change the maintainer to Bjorn and Konrad (Qualcomm SoC maintainers).
> 
> Cc: Bhupesh Sharma <bhupesh.linux@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

