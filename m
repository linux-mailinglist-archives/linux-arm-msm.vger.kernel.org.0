Return-Path: <linux-arm-msm+bounces-34707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 529BC9A1D61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 10:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CD511C21812
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 08:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9DA1D5175;
	Thu, 17 Oct 2024 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qEOcB46s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4961D47BD;
	Thu, 17 Oct 2024 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729154370; cv=none; b=oEfmu+/u9pfhkSl6n5WTUmshkKq1TD3kB0Ow9IPQuMHTOYDTLjOCDI5reCiMQr170j9yTNYApSSGXyFcRXEn54akir0cVJxbd7+EkuoyaH6cuCkrcV7MQpnITz7ctGK+IpBB4vK9S8YNZvrz7uO99CM/Bw/fxuCu+uE13Z13Qj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729154370; c=relaxed/simple;
	bh=C6I82LSVUX4hIke8nj8utVE8xSYycvRksb0sGggUz1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaXP+BGyNkehz6nC0d5jQnZELm7gMOUJ9zpZY8QwDUxzgvWyNUsbOIDQOlgT6wNMYPYmts3tmR8kZT4uJqeyvd3r+MSq9fqKjw3L+tGrs4qg9m6yRK3Nkcq9jGQkjc4EYKLwgkyL3Hs/VNl0yTy1CKO7E4+veeOd0o1AahnnPa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qEOcB46s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEC4C4CEC3;
	Thu, 17 Oct 2024 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729154370;
	bh=C6I82LSVUX4hIke8nj8utVE8xSYycvRksb0sGggUz1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qEOcB46sq1KDs4di9fEJ/F+WFDgLgvT8xAk1DNmg/YUzTHnWDmrLTwhPS8MlsK3fe
	 lIkGtE4fdmoX6UNXOYSzGK0016KQB4pXr2NEEBkD6URurtL21GajvHifMnR8+mq6kv
	 tC1B9cxUchunmSUS9il93TZfDTf8ubPPOWEDaCwhJ3zJy5B0bpAdGwmDI219i5j0Z0
	 U4Y+kz9xQ+/DKbjn0GAwBrsJm+dhja8rEg2+pPnhFqgCevPHDs2iqiVriCmKbFUxvd
	 0+DD8Mzx3dkmErcs/wvdLQJTl3JKOUYtPUGN4ydTtjf3T86ve0ZdcCJ4p7uoZsgO8W
	 nsODmpUvyC53A==
Date: Thu, 17 Oct 2024 10:39:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, srinivas.kandagatla@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: Add Qualcomm SM6115 LPASS
 clock controller
Message-ID: <n4nbzwostn6i5ygskjfr4o7haqujodadxd2kspvlk2gccxoaen@pk3qj7rxvspf>
References: <20241017005800.1175419-1-alexey.klimov@linaro.org>
 <20241017005800.1175419-2-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017005800.1175419-2-alexey.klimov@linaro.org>

On Thu, Oct 17, 2024 at 01:57:59AM +0100, Alexey Klimov wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> SM6115 (and its derivatives or similar SoCs) has an LPASS clock
> controller block which provides audio-related resets.
> 
> Add bindings for it.

That's a v2.

> 
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [alexey.klimov] slightly changed the commit message
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

My tag?

> ---
>  .../bindings/clock/qcom,sm6115-lpasscc.yaml   | 53 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,sm6115-lpasscc.h   | 15 ++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h
> +examples:
> +  - |
> +    lpass_audiocc: clock-controller@a6a9000 {
> +        compatible = "qcom,sm6115-lpassaudiocc";
> +        reg = <0x0a6a9000 0x1000>;
> +        #reset-cells = <1>;
> +    };
> +
> +  - |
> +    lpasscc: clock-controller@a7ec000 {
> +        compatible = "qcom,sm6115-lpasscc";
> +        reg = <0x0a7ec000 0x1000>;
> +        #reset-cells = <1>;
> +    };

Not much improved. Don't send same code from whatever repo you got, but
go via mailing list.

Best regards,
Krzysztof


