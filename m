Return-Path: <linux-arm-msm+bounces-81978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C2DC61676
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 15:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BEEFD35514B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 14:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0381E5205;
	Sun, 16 Nov 2025 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5Xx6azY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B94E1DA23
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301927; cv=none; b=ag9BaWaI+t6AzMB78fruOo9zr7w6/Ma0mzOW2ZzBaMddRjKC48fOqAOqrWezD6Co8On27OyrrGmyEDAFV3iBcsSHfaYSKEZ3kHx5VWrTu+ificdYEEaP2n2ue38TC4GFXxbMH9jRT9vwjPP16zYWZoN1mawz4J9SuwqG7LXPGPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301927; c=relaxed/simple;
	bh=33PsQ/AUwCz47Q2ktn9ehaEhowKUCamtoyxGLZNVHbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9wBzQzCH76sVcnFuayeka8BGx57FNDNpU/+jkdKLZV3tDUmTcWo5VvqRLaxgQ3Zsn3qPlIkzPCmR+ckPrFgONKabJR57MqQthsM6mWuHQgAw/xWEfgbv589CBJQIj+9HwhdGd19VUMSW+m2bTnDlCU/qQ9IR3e5rNtecBvi46g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K5Xx6azY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so11167145e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 06:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763301924; x=1763906724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=esnGEzkzX0sNjqmrcTq8CE3mLuOzfAPZ58BKs3L8zSY=;
        b=K5Xx6azY6CiiLH3TyMOB1jAjRN8zh9DpVd9pRVJbgGdq0n0k98XNHIU4IwjezrQINz
         0zGsad18mM8WjiLWKEUnF1XAobDBZC1S8BpxyG6y+p97BlPiWkZpq2u6dB16RUYtwW10
         Yvb3/hOzuqjgjUjeIkhYhPlo9ZuDSTKN9n+16rAwkfhygMP+zENg/T4cg+NngPY46qxu
         PpteisL6ZIAR/coCqBXKbsaO+xXf27PEwBQ6WxLmdHSN4EJrS2RZRsPvN9bhid2kLDBU
         uj2Noa3ICf6Rx6+IgBIV0N2gTGUOrWLcp7Cmo/Nuw9Oegck0jorx2ELC78Uq1QAKZPjr
         mSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763301924; x=1763906724;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esnGEzkzX0sNjqmrcTq8CE3mLuOzfAPZ58BKs3L8zSY=;
        b=pT1LYnEmwLM/GOVJySEwhRAZshXGzJ4mwMeR9hI6uPPJ9SqFoKqUgi7eAnG1930RH6
         dCN0/sgUdjjoaKUHIdnRC+idem1oagIzO5xhsk/x4dPofJM2chO08LAmUzLzJwW5ca4F
         1MOEwlxG/6Z1joMIGHwgnc0avRJ1EfL+1x96+uPgRrWbbxQNpH3LKYYqFz8hJCeGu+dz
         swi5GlxuRt93ocqm97M1ke9px0dcfJmP9PCsnJFAUzak/QbQW2JPnPffJqBfAwMxZbg8
         V7NVWHbIE5LgNQtgfldknyhAUpHIy7jzGoer4aYtELClyl6F8XVRZOVroIE6/C446SWl
         VESw==
X-Forwarded-Encrypted: i=1; AJvYcCWiWp+8xm5206phMBd3FVCpK5WjjdxM+QL7STI9NnED7syKvetDC3AfrBXObbHBrwN6DYEHUMv25HD0s/nx@vger.kernel.org
X-Gm-Message-State: AOJu0YyRVpL+HXrt1meU7czUX7HFFCmYn088u89XUA3o2BLnKQkMrrg/
	j1jXMQIsxQ8q/MDmMxZ9csIrYBQwuZAuvoIGJRC6rHaqbIKNcyQJYC5nTHALE5OXrHU=
X-Gm-Gg: ASbGncvtYbnF6QFxgM2XIHZRxg6jlYYmVelNl+Myw9TxSWAN00DIF+xBhnZRJ4Rhw3U
	kZmLsZNF59yHegzwCAW0Ndms8eeOttirlcaqKqVP5Sh4XLXznA7DAoJdiak2UqohgTmcnQHLJJI
	DxWiCILDotKE6E+FQvI8KljeRN2x6FTw7uJ+4QLQvkAXLFd0B02zyegquq7smlRebTyxf5j04g3
	ZjCd/iz9yMISFkg8YSc79Y2uYF4YmZFKKIkVTVgIgI8pWp9GBt6hcQBJwxgzvnEWR9+Fcqk5UXt
	RxbwFDnZAfGrrW+u7ou13fbophKENRaDZ2sBwgypXSEeOth6jAKlruEsmQZxAFu5Z5Y7NsGgzWx
	LUkR+qPTfm7gixt6MFKMNcPNLDVhyQULq1ZNuYLksnJzjUiwP7xJFbBfVKo+DmICSJtnwpaxu5L
	MBtm0qOD/JlolfRKVAqTzKJEatKUTT2RtYRUOMktY97RbR78+quS6vRj1lB6W5+eJfNpCKQfQOW
	Q==
X-Google-Smtp-Source: AGHT+IE3mxx6tPSCmtFXKoJKqSi4TG4BM2tsrg1pYC1GBPuLQl9xVgLREUBWwVTx+ulT9jDCuzJmog==
X-Received: by 2002:a05:600c:1c16:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-4778fe49c3bmr92644605e9.11.1763301923841;
        Sun, 16 Nov 2025 06:05:23 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm265181565e9.9.2025.11.16.06.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 06:05:23 -0800 (PST)
Message-ID: <272d039c-25a0-4db5-96a3-c28907882cd2@linaro.org>
Date: Sun, 16 Nov 2025 14:05:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
 <de7ad562-80bc-498e-a6fb-cc26bb6343f0@linaro.org>
 <r6EgtiSu8pqs2ouFERTw7fx8kYZ3RcSbGklwd17UPxNGGd3sbRDl2BPyplkABZVu3qyfrIzRMisa0qTSrm89BA==@protonmail.internalid>
 <DE8FV81S45S5.CH6K1QAX940D@fairphone.com>
 <a428f8b9-c338-4404-8dc1-da6daae37d5c@kernel.org>
 <d7dfeb7e-c0b2-426e-8572-023715c33674@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <d7dfeb7e-c0b2-426e-8572-023715c33674@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/11/2025 17:06, Vladimir Zapolskiy wrote:
> On 11/14/25 18:09, Bryan O'Donoghue wrote:
>> On 14/11/2025 13:06, Luca Weiss wrote:
>>> Hi Vladimir,
>>>
>>> On Fri Nov 14, 2025 at 1:40 PM CET, Vladimir Zapolskiy wrote:
>>>> Hi Luca.
>>>>
>>>> On 11/14/25 13:15, Luca Weiss wrote:
>>>>> Add bindings for the Camera Subsystem on the SM6350 SoC.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>     .../bindings/media/qcom,sm6350-camss.yaml          | 349 ++++++ 
>>>>> +++++++++++++++
>>>>>     1 file changed, 349 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350- 
>>>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350- 
>>>>> camss.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..d812b5b50c05
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
>>>>> @@ -0,0 +1,349 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Luca Weiss <luca.weiss@fairphone.com>
>>>>> +
>>>>> +description:
>>>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm 
>>>>> platforms.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,sm6350-camss
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 12
>>>>> +
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: csid0
>>>>> +      - const: csid1
>>>>> +      - const: csid2
>>>>> +      - const: csid_lite
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy3
>>>>> +      - const: vfe0
>>>>> +      - const: vfe1
>>>>> +      - const: vfe2
>>>>> +      - const: vfe_lite
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 30
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: cam_ahb_clk
>>>>> +      - const: cam_axi
>>>>> +      - const: soc_ahb
>>>>> +      - const: camnoc_axi
>>>>> +      - const: core_ahb
>>>>> +      - const: cpas_ahb
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy0_timer
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy1_timer
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy2_timer
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy3_timer
>>>>> +      - const: slow_ahb_src
>>>>> +      - const: vfe0_axi
>>>>> +      - const: vfe0
>>>>> +      - const: vfe0_cphy_rx
>>>>> +      - const: vfe0_csid
>>>>> +      - const: vfe1_axi
>>>>> +      - const: vfe1
>>>>> +      - const: vfe1_cphy_rx
>>>>> +      - const: vfe1_csid
>>>>> +      - const: vfe2_axi
>>>>> +      - const: vfe2
>>>>> +      - const: vfe2_cphy_rx
>>>>> +      - const: vfe2_csid
>>>>> +      - const: vfe_lite
>>>>> +      - const: vfe_lite_cphy_rx
>>>>> +      - const: vfe_lite_csid
>>>>
>>>> The sorting order of this list does not follow the sorting order 
>>>> accepted
>>>> in the past.
>>>
>>> What file should I best reference?
>>
>> Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>>
>>>>
>>>> I'm very sorry for the vagueness, but I can not pronounce the accepted
>>>> sorting order name, because it triggers people.
>>>>
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 12
>>>>> +
>>>>> +  interrupt-names:
>>>>> +    items:
>>>>> +      - const: csid0
>>>>> +      - const: csid1
>>>>> +      - const: csid2
>>>>> +      - const: csid_lite
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy3
>>>>> +      - const: vfe0
>>>>> +      - const: vfe1
>>>>> +      - const: vfe2
>>>>> +      - const: vfe_lite
>>>>> +
>>>>> +  interconnects:
>>>>> +    maxItems: 4
>>>>> +
>>>>> +  interconnect-names:
>>>>> +    items:
>>>>> +      - const: ahb
>>>>> +      - const: hf_mnoc
>>>>> +      - const: sf_mnoc
>>>>> +      - const: sf_icp_mnoc
>>>>
>>>> Please remove sf_mnoc and sf_icp_mnoc, they are not needed for enabling
>>>> IP to produce raw images, and one day you may use them somewhere else.
>>>
>>> Ack, will give it a try.
>>
>> Disagree with this.
>>
>> See the Kanaapali patches. I'm asking new submissions to be as complete
>> as possible, instead of limiting the hardware description to the RDI.
>>
>> So listing the ICP noc is the right thing to do.
>>
>> So please include register banks for
>>
>> - bps
>> - cdm
>> - icp
>> - ipe
>> - jpeg
>> - lrme
> 
> This suggests to get a DT backward compatibility lock forever, 

I'm not entirely sure what this comment means.

The objective here is to get a full and complete DT describing camera 
hardware that can be consumed by

- CAMSS RDI
- CAMSS RDI + future goodness
- FreeBSD
- Any other DT consumer of upstream data perhaps even CamX
which
> makes it
> a very bad advice, which is favourable for just the single interested 
> party,
> which offers an alternative to the upstream CAMSS.
> 
> Anybody who wants to get support of any CAMSS ISP functionality above RAW
> images shall not add anything unrelated and unsupported.
> 
> The asked inclusion shall be done later on safely, if ever needed.

As I say the objective is to fully describe the hardware in DT, not to 
describe only the RDI path.

>>>> I believe this clock is critical, and it is set so in the SM6350 GCC 
>>>> driver,
>>>> therefore it should not be added here.
>>>
>>> True, gcc_camera_ahb_clk has CLK_IS_CRITICAL in gcc-sm6350.c
>>
>> DT describes hardware, not the happenstance of Linux driver setup.
>>
>> On that basis omitting <&gcc GCC_CAMERA_AHB_CLK> from the clock list is
>> not correct.
> 
> This has been already discussed, an enumerous amount of Qualcomm/MSM
> specific resourced like clocks enabled in ABL, Linux etc. are considered
> critical and not described in the dtb.

I still think the argument for that is tenuous wrong in fact but, I know 
you are right, this is a lost argument.

@Luca please _do_ include the full array of registers/clocks/nocs as you 
find them and yeah drop the AXI clock from that description because reasons.

https://lore.kernel.org/linux-arm-msm/20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com/

  ---
bod

