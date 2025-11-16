Return-Path: <linux-arm-msm+bounces-82009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 38375C61E87
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 23:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BAC7434AB4C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60AC28314B;
	Sun, 16 Nov 2025 22:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="nQOrvtOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861D012B94
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763331812; cv=none; b=Wy7v5zqLjNs2OnUDmGqfYGhl6V8I09Hunebc+D4p+FlRGZRd10TEQnbDB61G7RYeJpVZMfer4J5fJc17khjWEwoUNGufYUF096bftWDdUdNmaOe++47Sj8kmSVqxVQM1J90DKJi+Yf0tIbUL0fneTbUNFYnvcPIZLnaHtgmxKAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763331812; c=relaxed/simple;
	bh=8qVC0rvDvC/plw8QQ8re0AK5rxG5WzVeail7TmfnX2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkakrJZF2ToafEw3M06ZvhLo2bZtis1sROdVKd7ueEZXGYnBd7KpTRWtG2ms66/GX5r4cEjtytF0LNi+eQ1OOKqOXPb0Z6BOjBeiH2xQ9VsanUsf72VSyje+ooxK/21Y/KnANhAXR5Hsj4RnoQFPRvVYIi6Z9ykYsYNu1WGFAbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=nQOrvtOg; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <1edebab7-8f04-49bc-96e0-9f40728ffeca@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1763331798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1RPQzCESMicD27pSXilgJRtOsgM+qs8MHHctXz7PEXM=;
	b=nQOrvtOgrXoqGIlZOgRD3Qiopfhd+I5wlP6HUKEwM9EEuBY7OvXbJ7WCyWgG+zk1+PstmU
	F8niEJn/ED2gR9cToT4g677mXDVbGsr4mPV53QnAscq3vCYhJugevsaabwRfCPTG1hFlof
	etLWTWQlra5qybXpZDAENPFfRJag6Dm3lMF1GLqwu61Yuwq27h+Yi1pl8P015tCDPaFjKT
	87CkW4aia3FhGLJlxUUAeVLev2cj/okDCjz+RJ+eGgZlxTufWFbynSDGncv4YMJu21X41a
	rTL6x9Nj2k4sR57qHwiy/SIGNuLfZTb4yIAtr90eK7SkxQ48FkV5A7UTImjHPA==
Date: Sun, 16 Nov 2025 19:23:01 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Add crypto engine
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org>
 <Z7yJt4ARAM39F9b6@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <Z7yJt4ARAM39F9b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2/24/25 12:01 PM, Stephan Gerhold wrote:

> On Fri, Feb 21, 2025 at 03:07:03PM +0200, Abel Vesa wrote:
>> On X Elite, there is a crypto engine IP block similar to ones found on
>> SM8x50 platforms.
>>
>> Describe the crypto engine and its BAM.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> ---
>> The dt-binding schema update for the x1e80100 compatible is here
>> (already picked up):
>>
>> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
>> ---
>> [..]
> iommus = <&apps_smmu 0x480 0x1> seems to work fine for me, can you try
> again? Not sure if this is related, but make sure to apply
>
> https://lore.kernel.org/linux-arm-msm/20250208223112.142567-1-caleb.connolly@linaro.org/
>
> since that can easily cause crashes for bam_dma. I added this diff for
> testing and it's working fine so far:
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index afb8bd3b6a94..bac3d6a38055 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3732,8 +3732,7 @@ cryptobam: dma-controller@1dc4000 {
>   
>   			#dma-cells = <1>;
>   
> -			iommus = <&apps_smmu 0x480 0>,
> -				 <&apps_smmu 0x481 0>;
> +			iommus = <&apps_smmu 0x480 0x1>;
>   
>   			qcom,ee = <0>;
>   			qcom,num-ees = <4>;
> @@ -3752,8 +3751,7 @@ crypto: crypto@1dfa000 {
>   			dmas = <&cryptobam 4>, <&cryptobam 5>;
>   			dma-names = "rx", "tx";
>   
> -			iommus = <&apps_smmu 0x480 0>,
> -				 <&apps_smmu 0x481 0>;
> +			iommus = <&apps_smmu 0x480 0x1>;
>   		};
>   
>   		tcsr_mutex: hwlock@1f40000 {

Hi, looks like this has been sort of lost to time but I went to test 
this since the runtime PM patch was for the crypto engine got posted 
recently[1] and I wanted to see if making sure this block goes to sleep 
(vs. whatever state UEFI leaves it in) helps with power consumption 
(can't say it did really..) So,

- iommus = <&apps_smmu 0x480 0x1> does NOT work, breaks the boot 
process, display doesn't initialize etc.;
- the original iommus = <&apps_smmu 0x480 0>, <&apps_smmu 0x481 0> DOES 
attach fine:

[    0.207614] platform 1dfa000.crypto: Adding to iommu group 3


[1]: 
https://lore.kernel.org/all/20251115084851.2750446-1-quic_utiwari@quicinc.com/

Thanks,
~val


