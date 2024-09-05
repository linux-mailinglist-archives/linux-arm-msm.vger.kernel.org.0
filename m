Return-Path: <linux-arm-msm+bounces-30898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D095F96D8AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CFEAB21E6A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4506A19B3CE;
	Thu,  5 Sep 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czp7UcSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C3A19AA72;
	Thu,  5 Sep 2024 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725539684; cv=none; b=Xvsru86lvQqCxx3umBxru5Un6zCnH/0mRBwoZqf5dZVDlN+38Tx//pGNrm7FBONv9oOB70Ygchfs9YNhW+76QsKjfkmFPwbJZy2vZ0XZj8gGb2k0MYW49rF5a8t18nVIvL0mKVyi4Op5uvRvUC9pG9EhqkCrcysVIrfKWtTmYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725539684; c=relaxed/simple;
	bh=9UtN4ul2mOkhlyOoWLiXXaDNdUgrr+CKMftwb+/ru/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtIvbjKz5783qaQMHOpqJgXMrRyJkF4YHr5z4VB1mBytjZzIZA8DwTUrZFvkrFVbYnlxWhZBGasfMc2rWW5AY0xT3W3yHNEdSjN5vH3JVhGcrGEfll2LcVtzNk9z3VK93pWZ3i1Uz+SkgpzUxYkW5pSsa3mqAxTtWc4ANDaHeXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czp7UcSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59218C4CEC3;
	Thu,  5 Sep 2024 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725539683;
	bh=9UtN4ul2mOkhlyOoWLiXXaDNdUgrr+CKMftwb+/ru/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=czp7UcSLFnnwXRewzkiR1rXjOBE2rs601nhxLiOYgAuEwsNxWikzvOuY5VH1iQCRU
	 O+KqxmUbnOI39J4xitsJrl4wUtQD1XrFZibb0YNv/pXOCdU26gLZ/rmmQGvWnh3im+
	 WUIUhlt8IwcvX8huLlvyHY4XG8IZsFS7W+UKRJEsAScJ78/+WvzNtdZOeX+Jl6lFgO
	 G4FuFBhisMmMX6EqQu3X9N14XIYOQKpiVgv0CNpKJsK8HPVVRJOlM5pU4YZVu3uu7M
	 LWvY2haeYYIuOLADqRXFAWbT9fBBfiBwzlx4TmPD62NfeUXgsa6VpIN0x1ptXRvPvQ
	 PQ5XwJCOGspRA==
Message-ID: <06895dff-bdbf-4dfd-8f00-ee850297ec12@kernel.org>
Date: Thu, 5 Sep 2024 14:34:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: add CPU idle states
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240807-sa8775p-idle-states-v1-1-f2b5fcdfa0b0@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240807-sa8775p-idle-states-v1-1-f2b5fcdfa0b0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.08.2024 3:31 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add CPU idle-state nodes and power-domains to the .dtsi for SA8775P.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]


> +		CLUSTER_0_PD: power-domain-cluster0 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_2_PD>;
> +			domain-idle-states = <&CLUSTER_SLEEP_GOLD>;
> +		};
> +
> +		CLUSTER_1_PD: power-domain-cluster1 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_2_PD>;
> +			domain-idle-states = <&CLUSTER_SLEEP_GOLD>;
> +		};
> +
> +		CLUSTER_2_PD: power-domain-cluster2 {
> +			#power-domain-cells = <0>;
> +			domain-idle-states = <&CLUSTER_SLEEP_APSS_RSC_PC>;
> +		};

[...]

You want to define a SYSTEM_PD that's parent to the CLUSTER domains, like
in x1e, then APSS_RSC_PC would be an idle state of that pd

Konrad

