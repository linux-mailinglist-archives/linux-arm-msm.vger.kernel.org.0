Return-Path: <linux-arm-msm+bounces-49910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0A0A4AB43
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 14:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B21E63B576C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 13:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61C61DE3CE;
	Sat,  1 Mar 2025 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQmyFtbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9578579CD;
	Sat,  1 Mar 2025 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740836183; cv=none; b=aKfjzYm9DFnd/O9b0MyLSVc6NSIX17iWMVhJKVb5jBnvvrlRE2YteR0R54FsUbptgbZhsDyPJ5Xj8zjO7sRzzXtbVnx0e19na3zRGfAw2quaZq6rUp3Ulbybfqz55pTj9wqTwUJCNvKeI9DaCvPUBrU8Ei+gUl98scxx25JzP4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740836183; c=relaxed/simple;
	bh=+9olZMe927bo25HXvSSkBgPAgO3eFw27jWtLQ6l/+eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzvFN0YSXf+zJx/cohFlVKQ0veI/7Vg2kIXz8y0Y6Wq15JXV/Kfm2ZUR3iIlWbLsYaJNtusWCsLokZyQAbvLmeDfo/iYBDNziT4gcuiJi1HXKNG8eYVQOqkDRvqesOXVof5W86RBV0rswclbKf2HX1QRjCzssiSTNhjrmvELkSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQmyFtbt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA96DC4CEDD;
	Sat,  1 Mar 2025 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740836183;
	bh=+9olZMe927bo25HXvSSkBgPAgO3eFw27jWtLQ6l/+eU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kQmyFtbtDyuo5bbqrr2PvxVxV4WLJ0eUsGg2Vf9cxH8PryGo4faSy7B022DLbwJjU
	 2MkQwpATxW/D213tvfHM1CNNOtt0uxvH7T1fDkrI0VvceeVnCoAMC/UkU62+4CtaM6
	 JAhttLlCy6z5u2VlVuXQeFqRfRuunExO0zt6Ct3qbTzd8VeZwA1h1pli53/PIq1yIN
	 MPhFGA4hzatxFdXZF3h1LtfU/vyo7cPcksPJfBBblhdoZsQ6Bs+X/7dxH65S1Sv6sY
	 M1MWqxx2XrRVqDSokvJJdlsG02ZfSdFNjn3yUGBNe3AjqzgryIyHR9pNYXsy2NlsTK
	 qoEUXpx03IIrQ==
Message-ID: <d5f67734-db1e-4096-98f9-3f026e4bd46b@kernel.org>
Date: Sat, 1 Mar 2025 14:36:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
To: Bjorn Andersson <andersson@kernel.org>,
 Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <2mlmhzllhb5fhcbwtupy2nk74my5hruliayyr3kayrjvmtou25@em5encygrn2i>
 <7b219289-4f3d-4428-a0af-42491acb1cbb@quicinc.com>
 <uohwigzosxv2onh7dtgvhqdkdu2jufiukp6ztxrvfbjoihrypx@cq3apkdx2rhw>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <uohwigzosxv2onh7dtgvhqdkdu2jufiukp6ztxrvfbjoihrypx@cq3apkdx2rhw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/02/2025 15:14, Bjorn Andersson wrote:
> On Fri, Feb 28, 2025 at 11:01:16AM +0530, Yuvaraj Ranganathan wrote:
>> On 2/28/2025 5:56 AM, Bjorn Andersson wrote:
>>> On Thu, Feb 27, 2025 at 11:38:16PM +0530, Yuvaraj Ranganathan wrote:
>>>> The initial QCE node change is reverted by the following patch 
>>>
>>> s/is/was/
>>>
>>>> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
>>>> because of the build warning,
>>>>
>>>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>>>>     ...
>>>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
>>>>
>>>> Add the QCE node back that fix the warnings.
>>>>
>>>
>>> Are you saying that adding this node back will fix the warning?
>>>
>>> I'd expect that you would say something like "The changes to the
>>> Devicetree binding has accepted, so add the node back".
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>> index 23049cc58896..b0d77b109305 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>> @@ -2418,6 +2418,18 @@ cryptobam: dma-controller@1dc4000 {
>>>>  				 <&apps_smmu 0x481 0x00>;
>>>>  		};
>>>>  
>>>> +		crypto: crypto@1dfa000 {
>>>> +			compatible = "qcom,sa8775p-qce", "qcom,sm8150-qce", "qcom,qce";
>>>> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
>>>> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
>>>> +			dma-names = "rx", "tx";
>>>> +			iommus = <&apps_smmu 0x480 0x00>,
>>>> +				 <&apps_smmu 0x481 0x00>;
>>>> +			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0
>>>> +					 &mc_virt SLAVE_EBI1 0>;
>>>> +			interconnect-names = "memory";
>>>> +		};
>>>> +
>>>>  		stm: stm@4002000 {
>>>>  			compatible = "arm,coresight-stm", "arm,primecell";
>>>>  			reg = <0x0 0x4002000 0x0 0x1000>,
>>>> -- 
>>>> 2.34.1
>>>>
>>
>> DeviceTree bindings were accepted but the comptabile string does not
>> properly bind to it. Hence, adding the correct binding string in the
>> compatible has resolved the issue.
>>
> 
> Please then write that in the commit message.
> 
> 
> That said, what did you base this patch on? While I have picked
> Krzysztof's two reverts in my local tree, I have not yet published them.
> So your patch is not even based on v6.14-rc1, which now is 4 weeks old.
> 
> Patches sent upstream should be built and tested on a suitable upstream
> branch!

I sent reverts because author, even though pinged more than once (!),
ignored reported problems.

It seems that reverting the code gets some attention, so maybe author
will fix the original issue and my reverts can be dropped/ignored.

Best regards,
Krzysztof

