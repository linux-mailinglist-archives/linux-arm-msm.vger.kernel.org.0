Return-Path: <linux-arm-msm+bounces-36281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 895109B482D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E58A1F2216F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAD0205120;
	Tue, 29 Oct 2024 11:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrxuRkcj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A130204031;
	Tue, 29 Oct 2024 11:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730201002; cv=none; b=ddNbRf9ycgtIUk1ZC+VNgvloRxI8mWDgTnS85onCSuxkbISSmjCVZHszBaVshFWN04VLi85ailroZK4JsMKKItCm6XSFg+/9AkQ5h1vkYe0UxiZV2Q7/VlJYmnLOcPq8vIa0SejXyaR67QecZUaI9dOyn+AavlaZnSyDpcp4tuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730201002; c=relaxed/simple;
	bh=4QBTWXQ4WWovZ78wR62gKkZLq3hvP1nBJqh9vAS7BZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbdadRi7K59gh9E+83TGjUtYw7xmpJIkuHbcl4EeaLqJXaMa9kgs06EioJvwGf7UuYZyrsxiHZGPpiRrm8Bfc8YU9Ssb8KT/ykSmghJPjQWKNeK2Jd1wync22xxHACkKk53db29X1zdAiCBR54lEPPKqVU00wpp3fMukEGpVZr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrxuRkcj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E41C4CEE3;
	Tue, 29 Oct 2024 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730201002;
	bh=4QBTWXQ4WWovZ78wR62gKkZLq3hvP1nBJqh9vAS7BZ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UrxuRkcj88bKi+5QgJMPPPXNFFDlBHbHeWfcao2s31AoiDE/3w8NaO/b/65LUlst0
	 YZJzpKTwnwvdNC/lsOQ0wOH3PtDskY5pbMD52mGVwrJ0jGN+C5OWDNXbNwtapUciHO
	 gZ839VIOZ0RDedWq0k97qdMGGsYZC54247cwJB6PleTviBX8RGl1Z5tbMyqPiFIOIM
	 PGxYAgtTYFOXFYoaMIot7tKTJcw4rCSkxMaDAIzn/0HR78LmKfo0huS2MeC8OcHjp0
	 ZBs1WMeaQsEdpajLqh9wrigitaRi+WMgRQjeij67X3dDL38mplrEn1ZYyK69yA8LJo
	 YqkM5BWF/VW0g==
Message-ID: <c0e96797-ae44-4e19-9775-ff9ee01e4d67@kernel.org>
Date: Tue, 29 Oct 2024 12:23:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] arm64: dts: qcom: sm8650: Add ICE algorithm
 entries
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
 manivannan.sadhasivam@linaro.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_narepall@quicinc.com, quic_nitirawa@quicinc.com
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
 <20241005064307.18972-3-quic_rdwivedi@quicinc.com>
 <070bd760-9095-496b-8f46-1825c592754c@kernel.org>
 <75589588-ed41-42f6-b7fa-c6f0359ba4cd@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <75589588-ed41-42f6-b7fa-c6f0359ba4cd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2024 12:06, Ram Kumar Dwivedi wrote:
> 
> 
> On 06-Oct-24 2:02 PM, Krzysztof Kozlowski wrote:
>> On 05/10/2024 08:43, Ram Kumar Dwivedi wrote:
>>> There are three algorithms supported for inline crypto engine:
>>> Floor based, Static and Instantaneous algorithm.
>>>
>>> Add ice algorithm entries and enable instantaneous algorithm
>>> by default.
>>>
>>> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
>>> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
>>> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> index 9d9bbb9aca64..56a7ca6a3af4 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> @@ -2590,6 +2590,25 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>  			#reset-cells = <1>;
>>>  
>>>  			status = "disabled";
>>> +
>>> +			ice_cfg: ice-config {
>>> +				alg1 {
>>> +					alg-name = "alg1";
>>> +					rx-alloc-percent = <60>;
>>> +					status = "disabled";
>>> +				};
>>> +
>>> +				alg2 {
>>> +					alg-name = "alg2";
>>> +					status = "disabled";
>>> +				};
>>> +
>>> +				alg3 {
>>> +					alg-name = "alg3";
>>> +					num-core = <28 28 15 13>;
>>> +					status = "ok";
>>
>> NAK. This has so many issues... First, describes OS policy. Second,
>> there is no "ok".
>>
> Hi Krzysztof,
> 	I have updated the status to "okay" in latest patchset

Still no. Why this node needs it?

> and updated the alg-name with actual allocator name.

Please wrap your replies according to mailing list style.

But anyway, all your algs sound like OS policy.


> 	I have already mentioned default allocator as instantaneous. Sorry, I did not understand OS policy comment, could you please explain?

This looks like OS policy, OS choice. DT does not describe such things.

Best regards,
Krzysztof


