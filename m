Return-Path: <linux-arm-msm+bounces-30886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646396D7DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88BE81C20C76
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D5319AA53;
	Thu,  5 Sep 2024 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9nRRHl0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B51991B0;
	Thu,  5 Sep 2024 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725537935; cv=none; b=BMatWjw7LviRoXGYJ6nS4a7RPm+y3UQHgZKPAdGaI1xJF3oyGhKszvac6Z1MRf3ipw0zAPoNN2t942fhSnzNAhJILc0fW1XMDfOV2c188EE8ogpv6pLJ50gqnbRw/lZ5W+DDYG+xYUgPlGLo/LgXR1ZwYm1CB69p4CvHq8CGALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725537935; c=relaxed/simple;
	bh=qZMhR/FbVp1+ESf99ozff3bB3yTQnlfi7u0bDq4Qoe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bK1akslCZ+T4UcZyofdD3T/cntL+WQ37Nv/knRTUd2CGuZ/iSE/somo2x88TATTfFhUqrrIAj2yuibXyYO0iUHAuFZ1LCCDBSvvT0Jd1bj0fKurGFgXvn2S1xDtTNAD6HOnCtjxgKEezsOGoUlyE8sM/F6lOvPxfjPZylgWoE5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9nRRHl0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C60C4CEC3;
	Thu,  5 Sep 2024 12:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725537934;
	bh=qZMhR/FbVp1+ESf99ozff3bB3yTQnlfi7u0bDq4Qoe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f9nRRHl0l8KI8ih4MnTH9ILN6L/M2REfxfVLVeM4384fEKLAxPjwQvgk0moASHdqr
	 UT+RVtV6qCnRlXsdmyJa58309PtNrIAi6v30WHvvXjzljSmTcj8AtXXJ9TjMnlmWje
	 gGeZrF0mXoMAOpvGdfVFzFwuwY0CaThoG54lCWLx3rcc9QMsPI1N8v5Vfzg/Ftf3Cs
	 c0g/j1uKpM5OrIKehv2iGs0exfz7cSuC+QOgdwgLT2T6STvz8JHXc+6Y0/6ovRy+XZ
	 4Do75vi/hU5FOmW7/zqpRhGDkRucshUP5ZAiPvWyGDAFloXXN9EOxNF5KkxG2QaleZ
	 N9BmvTaWP344w==
Message-ID: <01ec1a78-4fe9-42d9-9ed2-8f6b8cb2e8fa@kernel.org>
Date: Thu, 5 Sep 2024 14:05:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs6490-rb3gen2: describe secondary
 USB port
To: Caleb Connolly <caleb.connolly@linaro.org>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
 <20240904-b4-rb3gen2-usb2-v1-3-b858e681195e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240904-b4-rb3gen2-usb2-v1-3-b858e681195e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.09.2024 1:16 PM, Caleb Connolly wrote:
> The secondary USB controller on the rb3gen2 is routed directly to a
> mico-USB port where it can be used for EUD debugging or in OTG mode.
> 
> Configure the controller to prefer peripheral mode (as this is almost
> always more useful) and describe the connector, vbus supply, and ID pin.
> 
> OTG/Host mode is untested as I don't have micro-USB OTG cables to hand.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 69 ++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 513d5265bb13..fe66f589cb5b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -62,8 +62,30 @@ hdmi_con: endpoint {
>  			};
>  		};
>  	};
>  
> +	connector-usb2 {
> +		compatible = "gpio-usb-b-connector";
> +		vbus-gpio = <&pm7325_gpios 9 GPIO_ACTIVE_HIGH>;
> +		id-gpio = <&tlmm 61 GPIO_ACTIVE_HIGH>;

I don't think this is right, what's the revision of the board you have?

Konrad

