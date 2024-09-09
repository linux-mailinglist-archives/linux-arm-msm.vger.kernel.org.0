Return-Path: <linux-arm-msm+bounces-31281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C626797163B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8D891C22946
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721701B4C5E;
	Mon,  9 Sep 2024 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0Fku5bt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D821AF4FA;
	Mon,  9 Sep 2024 11:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879995; cv=none; b=AkdSdP9+5kWgBQucK/b8fiVOf8xaeMAc3FyMa/RzZ6LvizP232+Sb+jTJE5g3PVzobWwBmx5SdF1onu3gcZkay6dJchZb277TrSZy6n0gjjq8Xy+VlTzK+LBe1ki5ctJq41cezjMHur/mJjvE8QLfRrTCt9N9wtvZV8bn7ULcXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879995; c=relaxed/simple;
	bh=pxMOnEiqo8vGK+qUmIREH+UCsyz7ca3QVk8OPK5MMqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4ISVbQAoy75OoC8WwSSC/+A4J8CY9k1uMDwJ1lthpWRLtWRpotk4kTIQt3fNUhjpTv72+qJQhiEc6QGFQ+PgzGQaHEqAPGDY/s6SlfQpe4cyHNNfyx9gCXSTioWGPzF8Jiu8r4s0EAknzXeRVS7/ecjTfDS8F6vdp+13hL8cxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0Fku5bt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE72C4CEC5;
	Mon,  9 Sep 2024 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879994;
	bh=pxMOnEiqo8vGK+qUmIREH+UCsyz7ca3QVk8OPK5MMqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e0Fku5btv/Nm24Ww6mOaYMHWzmLwLQz0SurG/87j1nl6K7ofLbDxFf0j5UTEeeB9o
	 oqB9/oK9caLq7tc7sxULSTqS2/YHm9iujz3Bnu9YtRchTaRtln5Q3N27PQxuW7kT+M
	 icSVxx363dLXwYPz/+meZ7pPA6Z6FpnaUlLoYAGMO/gh7o51IXocQ/JmRjGIXe5lPT
	 5wd5Zax6RkHpvTcq+t5b7aU+OhDU+Z8y3squu3zTET8ASBti24KF39lODGnmkiDo6F
	 vn5UyLNUby+EiWDvrrBXfGrfpacSDWb3VDLQpq6UhgPRyx+YaSrSm7wCyxw4tjhsak
	 l2iwmszrsY+6g==
Message-ID: <eefa6678-fbf8-4683-9cca-cbca45997ffe@kernel.org>
Date: Mon, 9 Sep 2024 13:06:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: drop underscore in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
 <20240905-dts-cleanup-v1-1-f4c5f7b2c8c2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240905-dts-cleanup-v1-1-f4c5f7b2c8c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.09.2024 5:46 PM, Krzysztof Kozlowski wrote:
> Underscores should not be used in node names (dtc with W=2 warns about
> them), so replace them with hyphens.  Use also generic name for
> avago,apds9930 node, because generic naming is favored by Devicetree
> spec.
> 
> Functional impact checked with comparing before/after DTBs with dtx_diff
> and fdtdump.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

