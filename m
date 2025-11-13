Return-Path: <linux-arm-msm+bounces-81680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAECC59491
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 18:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 52126566DA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AC6365A10;
	Thu, 13 Nov 2025 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9AAfvNc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DCE365A0B;
	Thu, 13 Nov 2025 16:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763053162; cv=none; b=kwZLc+pdwRneH1scKGFuWoPwRbOX+hH4i05w+iA6IPsWl+xDScAUboqmKXH83I57lFZyqlNtXMWVs1/SgztGzwL3L63Sc16I+h7PXWoyNIg4jC2D72cPCXsYdecXG2WbipPYQU7hJKE5kP3mAO4CFLKxBWooiqPMcnvtIfAanKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763053162; c=relaxed/simple;
	bh=OMYHotzwnQ9Jn+pXN2MThObQ/Bn1rk7IsAevZUEnsCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KO214Phsh9M11GDSCnH1Wu2LNnYSnbtpuKTaaAZLXlrAlvF4teS5S5e0nHlas8N36JAJc8DxTA5WZOwjiqodf8F6KVnKH/zBtkIZnvIzc8syiUnG/zU8xeGtk3edwQfQd7FOBB3TbSrWrC7K+od+lR1tXeA/ukgEbVnNrjheIEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9AAfvNc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A668CC4CEF5;
	Thu, 13 Nov 2025 16:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763053161;
	bh=OMYHotzwnQ9Jn+pXN2MThObQ/Bn1rk7IsAevZUEnsCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r9AAfvNcxjYhk/rzmC32QHx5YYpTooQuj2/nDgOYfuZkzYJAUfWPAfAk7CjZTePe2
	 xgK1pkFsK6OQDnP2MonYdb+5oto31OBcvpJmQkEWB2XuDdkzTV0qb+GpooEko7VElR
	 scWzSUTlUtVPTy0nDAzCeYgJtl77JSLdLmvxwG/v0lf+4tpt4PdfOEH+mECgB07syZ
	 N7yHCqoA2PYGSR8QzOM+AhflvTrdFVz3aBcEStVC2OYI/YUjrX6Kd7ZtH2ipUEoE4u
	 MS8A48zxGm3nwCJlODzBJzIq6xQRlrvNA05V2bE5rrzL8NOlGpdIiG7zXf/417dLmp
	 oBEIYE1K4YaIA==
Message-ID: <4a6f7c18-82d1-499c-af9c-9681e16a0db6@kernel.org>
Date: Thu, 13 Nov 2025 17:59:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
 <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>
 <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
 <ad00835e-bc20-4f97-aba6-e1b4f5e97191@oss.qualcomm.com>
 <f2q7a7r7quq6pplcn3kklwrhdc6hxa5zvc7osygshtyurwyvi4@t5iyragt7irh>
 <b5ecf5e7-4dc4-41ac-9b56-7c52afacb950@oss.qualcomm.com>
 <01de9616-825b-4fbb-83cf-e0bf91e8cf39@oss.qualcomm.com>
 <81174278-c3c4-4dc6-856e-b58aa2cb6fea@oss.qualcomm.com>
 <br3fmilhh7fihv4atnf4olvy4w66z4p7sh4ypicuc3766ky6tb@pppfdynfhfz7>
 <bf706156-1413-42cb-a463-803063c347fc@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <bf706156-1413-42cb-a463-803063c347fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2025 11:03, Aiqun(Maria) Yu wrote:
> On 11/12/2025 12:05 AM, Bjorn Andersson wrote:
>> On Tue, Nov 11, 2025 at 08:27:17PM +0800, Aiqun(Maria) Yu wrote:
>>> On 11/7/2025 12:24 AM, Konrad Dybcio wrote:
>>>> On 11/6/25 11:16 AM, Aiqun(Maria) Yu wrote:
>>>>> On 11/6/2025 5:06 AM, Bjorn Andersson wrote:
>>>>>> On Tue, Nov 04, 2025 at 01:35:01PM +0800, Jingyi Wang wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 11/4/2025 12:02 PM, Bjorn Andersson wrote:
>>>>>>>> On Tue, Nov 04, 2025 at 11:34:25AM +0800, Aiqun(Maria) Yu wrote:
>>>>>>>>> On 9/25/2025 7:23 AM, Jingyi Wang wrote:
>>>>>>>>>> Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
>>>>>>>>>> control and status functions for their peripherals.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>>>>>> ---
>>>>>>>>>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>>>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>>>>>> index 14ae3f00ef7e..ae55b0a70766 100644
>>>>>>>>>> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>>>>>> @@ -48,6 +48,7 @@ properties:
>>>>>>>>>>            - qcom,tcsr-ipq8064
>>>>>>>>>>            - qcom,tcsr-ipq8074
>>>>>>>>>>            - qcom,tcsr-ipq9574
>>>>>>>>>> +          - qcom,tcsr-kaanapali
>>>>>>>>>
>>>>>>>>> It looks good to me. Glymur didn't have this functionality verified yet.
>>>>>>>>
>>>>>>>> You spelled Reviewed-by: Aiqun Yu <..> wrong.
>>>>>>>>
>>>>>>>>> Remind for review.
>>>>>>>>
>>>>>>>> No need for that, reviewers will review when they have time.
>>>>>>>>
>>>>>>>>>
>>>>>>>
>>>>>>> Hi Bjorn,
>>>>>>>
>>>>>>>>
>>>>>>>> But that said, most modern additions to this binding follow the common
>>>>>>>> format of qcom,<soc>-<block>.
>>>>>>>>
>>>>>>>> So I would prefer this to be qcom,kaanapali-tcsr.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Bjorn
>>>>>>>>
>>>>>>>
>>>>>>> qcom,tcsr-kaanapali is used to distinguish with binding for GCC:
>>>>>>> https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
>>>>>>>
>>>>>>
>>>>>> So, qcom,kaanapali-tcsr is the clock controller region of TCSR and
>>>>>> qcom,tcsr-kaanapali is the non-clock controller region of TCSR?
>>>>>>
>>>>>> Sorry for not understanding that earlier, but this doesn't work for me.
>>>>>>
>>>>>> It's a bit of a lie that TCSR_MUTEX is a separate node in devicetree,
>>>>>> but it's always an nice chunk of 256K in the beginning (or end in some
>>>>>> cases?) of TCSR. But for the rest, there should be a single tcsr node in
>>>>>> DeviceTree and that one node should be a syscon and a clock controller.
>>>>>
>>>>> I've been dive deeply on this tcsr block. And actually the tcsr clock
>>>>> controller part is a very small trunk size(0x1c) of the tcsr block. And
>>>>> this block have contain other multiple purposed sys registers. So maybe
>>>>> we can have a more discussion on how to have device tree node describe
>>>>> this situation? It is not straight forward that to have a non-tcsrcc
>>>>> related area being described in tcsrcc.
>>>>>
>>>>> What about option 1 (tcsr_mutex + tcsr_dload_syscon + tcsrcc):>> tcsr_mutex: hwlock@1f40000 {
>>>>> 	compatible = "qcom,tcsr-mutex";
>>>>> 	reg = <0x0 0x01f40000 0x0 0x20000>;
>>>>> 	#hwlock-cells = <1>;
>>>>> };
>>>>>
>>>>> tcsr_dload: syscon@1fc0000 {
>>>>> 	compatible = "qcom,tcsr-kaanapali", "syscon";
>>>>> 	reg = <0x0 0x1fc0000 0x0 0x30000>;
>>>>> };
>>>>>
>>>>> tcsrcc: clock-controller@1fd5044 {
>>>>> 	compatible = "qcom,kaanapali-tcsr", "syscon";
>>>
>>> Remove "syscon" here. Not need for tcsrcc fallback to "syscon".
>>>
>>>>> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
>>>>> ...
>>>>> };
>>>>>
>>>>> What about option 2 (tcsr whole block + tcsr_mutex  + tcsrcc):
>>>>>
>>>>> tcsr: syscon@1f40000 {
>>>>> 	compatible = "qcom,tcsr-kaanapali", "syscon";
>>>>> 	reg = <0x0 0x1f40000 0x0 0xC0000>; //align with the whole hardware
>>>>> block design.
>>>>> };
>>>>>
>>>>> tcsr_mutex: hwlock@1f40000 {
>>>>> 	compatible = "qcom,tcsr-mutex";
>>>>> 	reg = <0x0 0x01f40000 0x0 0x20000>;
>>>>> 	#hwlock-cells = <1>;
>>>>> };
>>>>>
>>>>> tcsrcc: clock-controller@1fd5044 {
>>>>> 	compatible = "qcom,kaanapali-tcsr", "syscon";
>>>
>>> Same here, don't need to have "syscon" here.
>>>
>>>>> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
>>>>> ...
>>>>> };
>>>>
>>>> Is there anything wrong with what we have done for x1e80100?
>>>> ______________________
>>>> |             |       |
>>>> | TCSR_MUTEX  | mutex |
>>>> |_____________|_______|
>>>> |	      |       |
>>>> | RANDOM_REGS |       |
>>>> |_____________|       |
>>>> |	      |       |
>>>> | TCSR_CLKS   | tcsr  |
>>>> |_____________|       |
>>>> |	      |       |
>>>> | RANDOM_REGS |       |
>>>> |_____________|_______|
>>>>
>>>
>>> Second you! We can firstly have a option selected for kaanapali, and
>>> then other platform can be followed or fixed afterwards.
>>>
>>> Here suggest to have option 2 which is remove "syscon" from tcsr clocks,
>>> and only add the whole "syscon" to "tcsr" whole block.
>>>
>>
>> I think you misunderstood Konrad, or perhaps I misunderstand you.
> 
> Maybe let Konrad help to explain more here. I thought the chart below is
> very clearly indicate the tcsr_clks is only part of the tcsr block.
> 
>>
>> This is what we have for Hamoa:
>>
>> tcsr_mutex: hwlock@1f40000 {
>>         compatible = "qcom,tcsr-mutex";
>>         reg = <0 0x01f40000 0 0x20000>;
>>         #hwlock-cells = <1>;
>> };
>>
>> tcsr: clock-controller@1fc0000 {
> 
> 
> It is not a clock-controller start from 0x1fc0000.
> 
>>         compatible = "qcom,x1e80100-tcsr", "syscon";
>>         reg = <0 0x01fc0000 0 0x30000>;
> 
> This is what we have a discussion initialized here:
> "qcom,<platform>-tcsr" is only a tcsr clock controller binder, reference
> from [1].
> "qcom,tcsr-<platform>" is a common tcsr block. reference current binding
> patch.
> 
> For below hardware block information, is it really a recommendation to
> combine the tscr block with tcsr clock controller all together?
> ______________________
> |             |       |
> | TCSR_MUTEX  | mutex |
> |_____________|_______|
> |	      |       |
> | RANDOM_REGS |       |
> |_____________|       |
> |	      |       |
> | TCSR_CLKS   | tcsr  |
> |_____________|       |
> |	      |       |
> | RANDOM_REGS |       |
> |_____________|_______|
> 
> [1]https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
> 
> 
>>         clocks = <&rpmhcc RPMH_CXO_CLK>;
>>         #clock-cells = <1>;
>>         #reset-cells = <1>;
>> };
>>
>> This is exactly what I suggested above and Konrad is asking you why
>> this doesn't work for Kaanapali. The addresses are even the same, what
>> is the problem?
> 
> The problem is the current patchset document a separate tcsr block as a
> mfd. While the suggestion here is to use the tcsr clock controller

There is no MFD. Don't use that term in context of supporting a change.
But regardless, this documents only random regs.

> binding to document the whole tcsr block which is not belonged to tcsr
> clock controller.

I don't understand whether you claim this patch as "this suggestion" or
something else.


Best regards,
Krzysztof

