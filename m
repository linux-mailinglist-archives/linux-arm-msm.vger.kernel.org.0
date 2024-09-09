Return-Path: <linux-arm-msm+bounces-31284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A623971648
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 448491F22BE7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440371B5EB7;
	Mon,  9 Sep 2024 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYJ6aEqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D9C1B5EB0;
	Mon,  9 Sep 2024 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725880078; cv=none; b=XzoLG+LfS7MsXCwcOP8Fo0xb7bl+r3OKUQnMucCAZ7+D9xoX+pnsLv7VqliE7PytnJTSoXpsLlnB68aTSIhcT0oxsDAO+azXCxv1wDPB60CARYV1k3gDztvCAzWrN0mP8Df5E8iWxHPIX4XqggEF/87I9NPCsbNmKjaXTf8YiPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725880078; c=relaxed/simple;
	bh=aupY+0oSPkeitQsAJBhhfvG9jRV61A8WWI0ihf6eBz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaTLJWiXOGb92XqtivlVl2gEzpQhobnlc55TJnvozhPnOCF2270w2CPAOTbMrgtyhFcirIHTa6L4EVwiSut/RhA/wgx6LoxXATx8rlhO7sErzv/iF9vR8mok2AR59Uogw3c6/05JKj3hPFotN/JJHLvDEy0D0S4SJoERO9Qn1tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYJ6aEqT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CC2C4CEC5;
	Mon,  9 Sep 2024 11:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725880077;
	bh=aupY+0oSPkeitQsAJBhhfvG9jRV61A8WWI0ihf6eBz0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uYJ6aEqTNEqq7RkqaTk1Prb9FMZrUdZY6ZNod9/Q582JLBx5V11nOEhlHQyDGW0y6
	 PE8LhutlH0Y4FV9EHaiq1vvHigj0+GNxk38oBXD5Bx/p5+RQ0tWDaZHt3YN/eOInd/
	 S5ytZ/J4s6OmlyHjGzvM4LBm6tUycydVD50eJ1/PjTwqJ7G66CPIM/tuC2vNMG2hsb
	 0cYJCOuxsU4apHoEIUVW6JYeh3fnT97lfMJeLzPFIw1Go92LTXSREbLLRHXzm34/Ss
	 tOUfp4mV2CcZFZNbkTdjQ+YgMolcb09UUM4FXR14qHuUb0KWrrL97cHZvRE33RC4Bn
	 IO/uSjK0zAs3Q==
Message-ID: <ea2610fe-08e4-4697-acdb-e16dd4127f1a@kernel.org>
Date: Mon, 9 Sep 2024 13:07:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
 <20240905-dts-cleanup-v1-4-f4c5f7b2c8c2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240905-dts-cleanup-v1-4-f4c5f7b2c8c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.09.2024 5:46 PM, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

