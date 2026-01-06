Return-Path: <linux-arm-msm+bounces-87718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A92CF9304
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 16:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BFED3010538
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 15:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900B623BD1F;
	Tue,  6 Jan 2026 15:56:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA4922A1D5;
	Tue,  6 Jan 2026 15:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714975; cv=none; b=bpcPajphLAmJcNuC+LfOLns7J0/qqT/2sA/+Re98tKJiJS/+nhWQUea0CaOUFrZVTqJOByoLgCdSykQbAl0LiswwiMJhBDthyEqBUDjdoP4ZtXVSf33Qic/4QkeBBqwZoY6jV6K2gcOQtE44blVl1uAqYsGv22v3S9ep/z/hQn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714975; c=relaxed/simple;
	bh=jM7wgW1dljj5mfbRtN76gBya8YVmdUSCrC8+Phnu65M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Df1YjeESrH6RT84gpjqNS6/is7hrf3/bWA1LgFxda40rtnOYvrPqVrgefXo6DpimnchoAEl+jh/+AXt7YTz5Yn7j41GKwqV+yoUOWxQ1c1WeVWRgB1CS296N36zB0z/OOU8oC43saoyZxIV76aEWMe7x9xv6m9j3tZy7TAju0IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23871C2BCAF;
	Tue,  6 Jan 2026 15:56:12 +0000 (UTC)
Message-ID: <c7f22b91-081c-4f40-af50-3bfa6cde1b74@nxsw.ie>
Date: Tue, 6 Jan 2026 15:56:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: sm8750-mtp: Enable Iris codec
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
 <hdy4Zu2xPWOmh6Pyds7Y8cBhui9IBBPHzkXSUWBfbhwukPxoXMNs9IaExy1wLe5Cm4DRFAOvL0dIiRDNTpshOw==@protonmail.internalid>
 <20260106-b4-sm8750-iris-dts-v4-2-97db1d1df3dd@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20260106-b4-sm8750-iris-dts-v4-2-97db1d1df3dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2026 09:07, Krzysztof Kozlowski wrote:
> Enable on SM8750 MTP the Iris video codec for accelerated video
> encoding/decoding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index e77fe0ce91ca..cb718331496e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -925,6 +925,10 @@ vreg_l7n_3p3: ldo7 {
>   	};
>   };
> 
> +&iris {
> +	status = "okay";
> +};
> +
>   &lpass_vamacro {
>   	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
>   	pinctrl-names = "default";
> 
> --
> 2.51.0
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

