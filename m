Return-Path: <linux-arm-msm+bounces-78039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F9BF22E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 17:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A3554F31C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDE5264FB5;
	Mon, 20 Oct 2025 15:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="N6x64HsH";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="2AlGBteH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9D9191F92;
	Mon, 20 Oct 2025 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975039; cv=none; b=Se7UEoN7+vHSrCtHNj1mv/LYiKnsMQCfPl4IEvcYM5cpwCXCDuPSvWsmC/i7aFHh+IJwccKA9o7ifwe5Usr03eeFbeVOCgO9MooX8hZIyXwHIbzOKp3EvJw8a2t7RugyBA+H21oBB1kvNEAXFT65rvaBojCzP2xPz9PE3/RLcIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975039; c=relaxed/simple;
	bh=BNCDto48OwZRW5G0q/c7kJsRkRtTkkRC6uKKTY551+8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KjjbkLF/nB2ixlhV9kv9E0q91aFzCaXgyVdKnYJJ85YHtdORksBSApmIEDcLIdoJAtjZvK1v9kLbusWcO3CGpUaeNxk6zsydm+jhYNE1NF8NOXa2UBR0tKElVS3+M/rsDEDktyKNnal07FY995XdP62TuxKgm6LdaWtwc1WfXY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=N6x64HsH; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=2AlGBteH; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1760974980; bh=DZCJNs+CdY6rTEejBzqgFNJ
	i6TRNFeL8vgF21AsKfW4=; b=N6x64HsHRjUHM/bMjHwTaOhaZUVZNzsR1+MxY/hdLjFif/ap2y
	fKL22isRf754Kg1cGV7iXPcvBdv/jYOT/++Cnq5cWTBTeANu6pys4iXnBcQft3OLSNOUYEs+sCK
	DY3Z1M213xHvqnpyHIt2duAPmSRQdY4ltwsqgGCAJxpqREx2lu0U5LtKJvVjTXDNiB8UaicDJo9
	iiIPSbL0BXAt7kUXtHntF24K/lnnvcEA4bZ71agonSQ9qtNoVPVhQDB+9qSIoQPxvkzUH7P0pEB
	S2cmLNTbsUO0Hbtebc3bSV0CswW/TfptEN0Ec6bdFNSMRAnW+GpQ/d6+ULg0bgNzcqw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1760974980; bh=DZCJNs+CdY6rTEejBzqgFNJ
	i6TRNFeL8vgF21AsKfW4=; b=2AlGBteHgd7hvA/pQhI4+A46bdz/nqXhcazxc1RsvqIq42hUcR
	RF47yzsAHsxQiQM5LKWrBoggYIVPjpTrRWAg==;
Message-ID: <0ca0bdfe-b228-49be-9ef7-71482d372e0f@mainlining.org>
Date: Mon, 20 Oct 2025 18:42:59 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
From: Nickolay Goppen <setotau@mainlining.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
 <20251019-qcom-sdm660-cdsp-adsp-dts-v1-1-9ab5f2865a6e@mainlining.org>
 <5hbc24lihvau7s2opzcxxgxkzugmbqmdtqwy23m45j4po23lnh@jyjlbgfjaddw>
 <f8daddfd-e0ec-4acd-afc5-cf0969aebb9f@mainlining.org>
Content-Language: ru-RU, en-US
In-Reply-To: <f8daddfd-e0ec-4acd-afc5-cf0969aebb9f@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


20.10.2025 18:27, Nickolay Goppen пишет:
>
> 20.10.2025 16:14, Dmitry Baryshkov пишет:
>> On Sun, Oct 19, 2025 at 07:27:06PM +0300, Nickolay Goppen wrote:
>>> In order to enable CDSP support for SDM660 SoC:
>>>   * add shared memory p2p nodes for CDSP
>>>   * add CDSP-specific smmu node
>>>   * add CDSP peripheral image loader node
>>>
>>> Memory region for CDSP in SDM660 occupies the same spot as
>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>> cdsp_region, which is also larger in size.
>>>
>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>> related nodes and add buffer_mem back.
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi |   2 +-
>>>   arch/arm64/boot/dts/qcom/sdm636.dtsi |  14 ++++
>>>   arch/arm64/boot/dts/qcom/sdm660.dtsi | 152 
>>> +++++++++++++++++++++++++++++++++++
>>>   3 files changed, 167 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index 8b1a45a4e56e..a6a1933229b9 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -563,7 +563,7 @@ modem_smp2p_in: slave-kernel {
>>>           };
>>>       };
>>>   -    soc@0 {
>>> +    soc: soc@0 {
>>>           #address-cells = <1>;
>>>           #size-cells = <1>;
>>>           ranges = <0 0 0 0xffffffff>;
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sdm636.dtsi
>>> index ae15d81fa3f9..41e4e97f7747 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
>>> @@ -16,6 +16,20 @@
>>>    * be addressed when the aforementioned
>>>    * peripherals will be enabled upstream.
>>>    */
>>> +/delete-node/ &cdsp_pil;
>>> +/delete-node/ &cdsp_smmu;
>>> +/delete-node/ &cdsp_region;
>>> +
>>> +/ {
>>> +    /delete-node/ smp2p-cdsp;
>>> +
>>> +    reserved-memory {
>>> +        buffer_mem: tzbuffer@94a00000 {
>>> +            reg = <0x00 0x94a00000 0x00 0x100000>;
>>> +            no-map;
>>> +        };
>>> +    };
>>> +};
>> This probably means that we need to invert things and make SDM636
>> inherit SDM630 and SDM660 inherit SDM636. Would you mind doing that as a
>> part of this patchset?
> I'd mind
Konrad decided to do the split this way for some reason initially
>>>     &adreno_gpu {
>>>       compatible = "qcom,adreno-509.0", "qcom,adreno";
>
-- 
Best regards,
Nickolay


