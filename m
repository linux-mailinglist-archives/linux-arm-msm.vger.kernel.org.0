Return-Path: <linux-arm-msm+bounces-27378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 185A2940ACF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 10:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97503B252D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 08:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9B418732A;
	Tue, 30 Jul 2024 08:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meTEJv6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6361944E;
	Tue, 30 Jul 2024 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722326986; cv=none; b=VTgwSzEW7wnYDuJqVUj/VXfx7wepll9BlUsO3XKz8GseA5wgIm9ueYkJGTIt5QIYLtsbJSuwM0LEGvExyhVQpETnMd3lxXLs3NL9O5jRQlGupruW5Rx2Xp1godGT0zepWJJG+O6vFtGbVmJanLuj8zzwtPAsqF9Dc1lOO1judNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722326986; c=relaxed/simple;
	bh=pGfbsjPkzDQWdarjPWtEdxA2P5ZPqH1+LvVjqWPH8FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gh8G51R1tbgC64fe5oxpHlAjspsohixU+KqchQAKUe4LZyXXpMKoZ5OZyBofAQ3VoUf0Sgz/XkF3DI3aQBP3eKKRQsajmHoKQGAHLPXOtayAwUSbQI5syCxv+mBEnFHd/uZGawEV6loJfz9gOBcVuh+IAcvPAilhKg3jdrdaZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meTEJv6/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FEDC32782;
	Tue, 30 Jul 2024 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722326985;
	bh=pGfbsjPkzDQWdarjPWtEdxA2P5ZPqH1+LvVjqWPH8FU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=meTEJv6/Ir/HB6Oags5XL7XnO89LiZT6T8zgv6c3lnIt6N1ItQ24luJhDumJPjLZ4
	 MkLr0Rsq7x+VVxtmfpa+T/eF+8F4DP6wcruSqTaMlA7KzrLoz/MjR0ST2Dak0NJ0DG
	 cySdUqD068Rb88DXPf+hmbjOw9zO2WCxyvThUnvuZPBdrnqjxlyAxUbRubDGwITx5K
	 2pEX16LrAvEIGFYp7sjAQwNz7woCr9h9CXEM5I/gsepodPBRWVZeeuhsbFME9qZY1d
	 o8RPKLuUL/KgHwGSPgnEMMD7PtV+toc/tQS615wtJhU5PvPGQ99AqHE6tm4FjcJ8yc
	 QXUPsNNnIVniA==
Message-ID: <b0036dbf-e0ba-48ed-8fc7-13582b75db6c@kernel.org>
Date: Tue, 30 Jul 2024 10:09:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: add generic compat string to RPM
 glink channels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
 <20240729-fix-smd-rpm-v2-5-0776408a94c5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240729-fix-smd-rpm-v2-5-0776408a94c5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 9:52 PM, Dmitry Baryshkov wrote:
> Add the generic qcom,smd-rpm / qcom,glink-smd-rpm compatible to RPM
> nodes to follow the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

