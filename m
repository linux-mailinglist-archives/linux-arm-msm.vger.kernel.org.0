Return-Path: <linux-arm-msm+bounces-27250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 382DB93F4CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30C1C28147B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C620146A63;
	Mon, 29 Jul 2024 12:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R42JEzSH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D8143752;
	Mon, 29 Jul 2024 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722254601; cv=none; b=s4Cr4GntsEpYS1fIX8GF4omQomHppYj53XTBYDFDVjJjwxI1+FEdlHty7a8aCktarLfUAqTSzT9GP3mlYjN9FZF6VhR5xZEyWGVhFj2erhAo5m3IMhbtR1MOY5+5jk917stYaIj0Q1cviORpZqIun9i1Yklwsl15Gys5Hq8zB50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722254601; c=relaxed/simple;
	bh=lXf72ckhhbgg5O3Y7wY7iYMZFSmYWB3p3X2wf1yGDdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOGvpCFBatvASPzlhUsxNyCCxvu8M8QpEuUcc1KB2oWv22kjn5IwsSjL7gHLvCP6bcW9s+W18U0iT22sSi6JMBCXPBlpIJiRbepacl9WDJl13Md+PweEGPjXAj/ZEVzVskTXCZ1ysaIIEUu4PJYB+t5+XbXniIB6KnZTrOokRiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R42JEzSH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D46C4AF0A;
	Mon, 29 Jul 2024 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722254600;
	bh=lXf72ckhhbgg5O3Y7wY7iYMZFSmYWB3p3X2wf1yGDdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R42JEzSHdRhncXb5jmbBQ7FQckeyskXB9yTXuYjH8/CLaG4+zKgIanX2tYGc7BDAv
	 W0S8cI7e51U5+FtAWVlz3bUiCtOBqnU1nzO+3dt0f99J58TicPdvOJDREgo8+up+Iw
	 O7BQM5xP7h2BqTJXKlYl0yITUXOwzN0M/O1jSH4DchK9Z8hEM9+3n3QpBGLTx4vgKe
	 b9qMngnnNz8LjzbT884qOOWCBCwaMIVJQyXA0pbeJONMHqIfQMzlIIEycr1lOUAevc
	 7+u1YR3bhwHexSYgYYrlQGHbe+KHBeApqCkHIxugvOu97+E9HwU6xFGIz5B7U1MHQE
	 O3l/WMprLMc0Q==
Message-ID: <a1dae393-7951-4dcc-9340-484ea9a5d404@kernel.org>
Date: Mon, 29 Jul 2024 14:03:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] arm64: dts: qcom: sm6115-pro1x: Add Hall Switch
 and Camera Button
To: Dang Huynh <danct12@riseup.net>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
 <20240725-qx1050-feature-expansion-v2-1-5fac4bbd946f@riseup.net>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 JDZelR9Xqh8=
In-Reply-To: <20240725-qx1050-feature-expansion-v2-1-5fac4bbd946f@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2024 3:42 AM, Dang Huynh wrote:
> The Pro1X has a flip keyboard and a single-state camera button.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---

[...]


>  
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <14 4>;
> +
> +	hall_sensor_n: hall-sensor-n {

These must end in -state to pass binding checks (also in other
patches)

Also,

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

suggests to sort these nodes by gpio number

Konrad

