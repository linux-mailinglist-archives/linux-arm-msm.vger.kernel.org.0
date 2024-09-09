Return-Path: <linux-arm-msm+bounces-31283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7B971643
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61EE5B26B46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CFE1B581F;
	Mon,  9 Sep 2024 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ruqzPKPF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184131AF4FA;
	Mon,  9 Sep 2024 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725880049; cv=none; b=Kq0qgFHtY70+VHpnwPHvSL79/O3iCtRMlVmXXto8t9YzjxS2f2lCxA0ccQeLneMT6R/SdmCEbEf7gqhIiarYyxbcNuZUjHmoBh+iKYB1FRoFIRKrhnAxRC+73+z0PXw63RDnLZkRarSO9UapK8Bw2m4FuksD+u23SyjYV6OtXNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725880049; c=relaxed/simple;
	bh=2PEVa/INoGtM5L2lNhGDFfzfyz11xo086QUQwcnBppk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+rSipN02H4zght8SMSxr6rmJEAHH287uOCCS/7yOlFzK/Wpmye/YA9Oatrj32cC4QUCL8aE439elmt3otNGlIJxxcNcHNeAOqNjYB17Aaw4Wyys+KZ82DydjNRq/4YcOJZwSK5rO0pUc4G8u1Sh3hl3ff7ExZONzcxsa8KDzN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ruqzPKPF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E39C4CEC5;
	Mon,  9 Sep 2024 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725880048;
	bh=2PEVa/INoGtM5L2lNhGDFfzfyz11xo086QUQwcnBppk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ruqzPKPFmN154So6fAY6C9jlsda84mMCDHTPr9fXvJAUgDo2vEKeebV9iDLDoyRgQ
	 2lPFbMV9oi0eM/Ichcg2kNsVnN2BTffmqy2Nbonc8dQ94NteehsDcvG+/NdolnFfXr
	 zA0MuQCUtqQE8BMJZMHzRFyZVaPBwNsJ5t4ALsE5uRGC/fvKlrT7XkXtYPBETF3z1I
	 QHkxzNBlPODcAFVcYgOcECb4XhjBlGxZbVE+VilxxMtHjxmkdaloyZ2vW0VmeP+ee+
	 V6e2h+yPwaDSIhgYv0Q1ldCYXUfXBvP68VNncQ6AIQGXg4suSV5+qkt8c9tzBwYiLE
	 ha2xdFGRrdC3g==
Message-ID: <97447ca6-690d-47a4-9c01-b5d1fb669391@kernel.org>
Date: Mon, 9 Sep 2024 13:07:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: drop underscore in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
 <20240905-dts-cleanup-v1-3-f4c5f7b2c8c2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240905-dts-cleanup-v1-3-f4c5f7b2c8c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.09.2024 5:46 PM, Krzysztof Kozlowski wrote:
> Underscores should not be used in node names (dtc with W=2 warns about
> them), so replace them with hyphens.
> 
> Functional impact checked with comparing before/after DTBs with dtx_diff
> and fdtdump.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

