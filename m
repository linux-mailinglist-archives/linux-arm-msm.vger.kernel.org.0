Return-Path: <linux-arm-msm+bounces-87719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDD1CF932B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 16:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 754A5306524F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 15:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A04225417;
	Tue,  6 Jan 2026 15:56:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD75317DFE7;
	Tue,  6 Jan 2026 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714984; cv=none; b=VTQ3cZdnWemw9MPDFx2TFqZ6lLswy3rC67EMSt0MYODjfc6AhQ49JFtRzwrZL8U+E/0KTk19rIBg7jnOkr6OkMzx4bhLM01vEQ/MhuQwVcj9w5tWk9ktoYpTNZA6isCLAgGeVFI5Cp8U3J7KTCFTcqATSOItDvwUfxWrloATqIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714984; c=relaxed/simple;
	bh=sBFuejxIojgle0VSlnZg0eBVi6N2tUXsfGK91fs0GEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPLBBdhS6PJC8WMhLufCYlJMppfXce3BDsk5JwN/v6A3q/lvepgzdq0I9ech+jyMXwfhL6frP59o3UwMxv+ntYKkFZEzmQyLyiy+OGP7Sm/yKR6zKoVDgh3/RKUGfvkNRm8XK9+MwWcZ3js94Eo7XT3i4kCuJJC+DmP7mbQVnCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4B9C19424;
	Tue,  6 Jan 2026 15:56:22 +0000 (UTC)
Message-ID: <b2ac0158-050a-4b3b-a691-c02126935fb3@nxsw.ie>
Date: Tue, 6 Jan 2026 15:56:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm8750-qrd: Enable Iris codec
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
 <Z12PJZkTlm6AT-6BR3mEMxW2FFP6kvJ3CgmyGdZtgTvnIF0PvbkMh_45v8PP9AHS70hGp8A4VzXXK0Qh4_d3ew==@protonmail.internalid>
 <20260106-b4-sm8750-iris-dts-v4-3-97db1d1df3dd@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20260106-b4-sm8750-iris-dts-v4-3-97db1d1df3dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2026 09:07, Krzysztof Kozlowski wrote:
> Enable on SM8750 QRD the Iris video codec for accelerated video
> encoding/decoding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> index 439ffb202599..801c46d55602 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> @@ -858,6 +858,10 @@ vreg_l7n_3p3: ldo7 {
>   	};
>   };
> 
> +&iris {
> +	status = "okay";
> +};
> +
>   &pm8550_flash {
>   	status = "okay";
> 
> 
> --
> 2.51.0
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

