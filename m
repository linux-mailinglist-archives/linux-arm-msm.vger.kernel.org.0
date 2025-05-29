Return-Path: <linux-arm-msm+bounces-59798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 903AAAC7B03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68CE91BC6890
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AB221C9E5;
	Thu, 29 May 2025 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8nrfUTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C0A55;
	Thu, 29 May 2025 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510900; cv=none; b=Q2jZFC2VD1bcvo+jHVvyaX5dntgLmtwFn9xjL25ge1Lp/nfOTDCSWaDNBLn+5DPRpT5QMSeQFsIZ7NWd51b0sJxgMVnWpijjkIEjo0GbDZjr7SG2ktsVIldog+DXha+KeWsA8z7xyQbZ65S7dbx04ax7yEc4Y9GRBNXr9M+HE+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510900; c=relaxed/simple;
	bh=GqXDmeFmD2ik+LcndWUifRDtUXoED7RebqU4zoRBe74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGBQlpFNmp+kWu+J0i7whIMcoanc103G6rv9wVmn7o7YlfxIAM779fS2KGtW1+5NGCpa9Icy7thOU5+FdjhS87wjsEpTfSxsXUGYAQMzIOtI0+KzNPnW8fxAKQo5vvHjtoYScgwJ1xEJtJkMKA6ZJnUjbsguKUUwCiusnUT2jOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8nrfUTT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDBBC4CEE7;
	Thu, 29 May 2025 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748510896;
	bh=GqXDmeFmD2ik+LcndWUifRDtUXoED7RebqU4zoRBe74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8nrfUTTDwl0/JWcyloWkBVbTcstmf37bbMhAi+5lF4yWoN3CaaHXkUCSYKcBCei5
	 DWmxQSulzo0bTdPhPpSIBLJohlk4PsBplmSiHjlmuasNQc89OdUC0luaH6L/jlp92R
	 AD4JOvMXMyeUwJto3unNZHT3d5e1nxivUqFO6nEe+U2ZOw/I2MqIBarjHUAYZGh+TX
	 ApWGbhmP/I05oxlf4hD+xdK2YLo6n9f11khDbpXMa1Um8T1uzFun5U1gPWsg7dWf7S
	 2/QWE1rYbLQrobGCNnZvVpFaifV13tvlJyGbQXj6FkF4D+f+Aas6TkJAVupGVjxfKo
	 9O/WE+o8ogWGA==
Date: Thu, 29 May 2025 11:28:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 01/10] dt-bindings: sram: qcom,imem: Add a number of
 missing compatibles
Message-ID: <20250529-quaint-warping-sunfish-9b93d1@kuoka>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-1-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-1-f7aa94fac1ab@oss.qualcomm.com>

On Fri, May 23, 2025 at 01:18:16AM GMT, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently described or not, IMEM is present on *all* Qualcomm SoCs.
> Preemptively add a number of compatibles to ease integration.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


