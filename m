Return-Path: <linux-arm-msm+bounces-30111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A4396502E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 21:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95F861F24418
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 19:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5838E1BAEED;
	Thu, 29 Aug 2024 19:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRfiYAP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F701BAEDE;
	Thu, 29 Aug 2024 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960696; cv=none; b=euV8/2qNpPKoiLE96NTEVWHKSUKLVnlXE/cuJrhJsQPz80f+urVq16E1q78flWsF64fn63r1BRg52qHXOrtri81svQUiMLILGFnqt0ifi9isvyqkAMGDR6UbnGLWUUO1meRK1KhEChHekmVW9+1RfljXRaB59Lk//mdd13B2QQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960696; c=relaxed/simple;
	bh=k/g00ysHF7KkuUbMODChP4TngDt/vB6+q6ahC1ZjB14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nz0VUU3Cz7nln7L+BCfvEEWF6Z5JXCo+KYsQVGLexV4myzArLhv+T0PlydCxWW+KR3Ga3K3FACaM9ifppHFxWBkwK/UMz98kwSI09XVdLs2DuVPBwgtAA79zuzWrgx2PK26crCLJwe33ypBRryeq65FbOzdttxhLaYpsZ3P899Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRfiYAP7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9E8C4CEC2;
	Thu, 29 Aug 2024 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724960695;
	bh=k/g00ysHF7KkuUbMODChP4TngDt/vB6+q6ahC1ZjB14=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YRfiYAP7VoPoNx/3AAkHbr5Qk8vXD3mE2Vj2EiM2UXXnPBZbGuwHvUr0GBJNv9/cb
	 r2p9aAgV8pSy0lfu1XX6mGJgZfY2A7xPcgSWqguM40AxlzmuwjrP6GXndjzusSOhOf
	 ZgNjxfL/lA25Q+UrG9cLm228FqQy0Uv8B/RHc1wJVmYNiJXaa6haJqDdRNnrxbuZqA
	 Eh4Z3x7TSnr0hz2TAgl7wykB1fHftqmvckZ6d+hdIyIrxLtPKC8Wdca81SbXJ8Ueu9
	 WoYbT/OT2L5McrRT5yoLpV07TjdjQZ6iilvNtvSLa6baA6zIyKSj8906zKeu59drC+
	 8wpfssMv6gM8Q==
Message-ID: <1a1e3d43-27b7-4927-ad4d-25580bd133e7@kernel.org>
Date: Thu, 29 Aug 2024 21:44:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] Revert "soc: qcom: smd-rpm: Match rpmsg channel
 instead of compatible"
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
 linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 stable@vger.kernel.org
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
 <20240729-fix-smd-rpm-v2-1-0776408a94c5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240729-fix-smd-rpm-v2-1-0776408a94c5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 9:52 PM, Dmitry Baryshkov wrote:
> The rpm_requests device nodes have the compatible node. As such the
> rpmsg core uses OF modalias instead of a native rpmsg modalias. Thus if
> smd-rpm is built as a module, it doesn't get autoloaded for the device.
> 
> Revert the commit bcabe1e09135 ("soc: qcom: smd-rpm: Match rpmsg channel
> instead of compatible")
> 
> Fixes: bcabe1e09135 ("soc: qcom: smd-rpm: Match rpmsg channel instead of compatible")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

