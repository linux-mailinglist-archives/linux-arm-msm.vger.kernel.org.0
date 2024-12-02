Return-Path: <linux-arm-msm+bounces-39849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D65FE9E00C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 12:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DCD3281CDD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F4E1FA244;
	Mon,  2 Dec 2024 11:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PARdwWvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883C41FDE22
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733139527; cv=none; b=BDYxJkq9rvbJEQS4x91a2cwzZ713WDiltTLwRQ5SwNYNxLM6Eu3ZMk+lUglwzOWBsVjaAh9CxndXGx1mcsE7b5ofkWadnNe/8SW59SVv6cE3K3JArGoQGDCmPf1t94n9uZqT+5TNOqX1s2FoyXO3uNKdwUqSjlhf0v+ldhyPfgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733139527; c=relaxed/simple;
	bh=VHpsjdX+mFBKbpBkSvt3k5S8qv4fIuY67V0z8HafAuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WStougzNSmGwK5qimedVOJuI3vsAn7vE69UyNK59P64B+FsscKCQTAE6dXynkG6MFUEuyfOYrVbJISk56dw9SwICyQiU437Q8niB7UxYToX7K0aPx5amlCU+r4IIKeBF78sctanYh+8YSnRGGZ8xthuGThNvJtFuuxtmIIoCyMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PARdwWvm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53dd668c5easo4371801e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 03:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733139524; x=1733744324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bvhHF3GkAtduvqLl3j8Ag11hKjyOarRlGM6h2Ek1Z5g=;
        b=PARdwWvm/Bnu4eLMgvBfk51/WcyHbfr/jkRk9QfdN/icPDkqWNNnIlRjTA0XH4QBgp
         kLLvhATw0fUP2z5ryBKTjFrR4JZT0QHEuIVbjlOG79sfDbSX4ebkd4vHdmJ/scR8X9u8
         Fb6rc4BEXtaMyl6ndPZP9QLotrlji5x7ugiLuEIXlzBVGJApQf1jSsI5U+rUs3J87mKT
         aSmJwfjKlImpCr0SQOWf9wRcMLUGNRcwNxLdeEGTrYvUV4gZdwbaTINQ57zVbODZj72e
         6k3Uk3Z3TuNuV3xraTWHawH34FARRZ1rtA01pZsNHLGQo/opd8af/Dm/qDXawEjgMcbz
         npCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733139524; x=1733744324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvhHF3GkAtduvqLl3j8Ag11hKjyOarRlGM6h2Ek1Z5g=;
        b=RIzNCCtKzfSx8xEblw2S7L/mKTVg/Ksk1hycd/7zx8kdXwi02Uz05OGoDFQbwoO4B+
         uyrpVG0aiItIShqn7pPh/MVVJUw/uZgqQnZzgQeBAn/7MGaUOz7aSBNJ0N4oAJr94psX
         wAUAuYBtzHNTpIIdPvLggHSPVNoWDLQXqKKnS1CcxvlJWMaZnjA6ElYG/CGNyqe8Jgtb
         XPECKydjWRBqCnwVz7ahM7EGocX4DqQOsQmURcRyGoJY+fyJziksUQC4P1wWx1uHE2xY
         n+Ypyyr20nfAbcKjYkclcTcULxu9FW2/QCrZXjEFU138kW1gHNdAAnNgrZ2WSrcM5vBo
         QPmA==
X-Forwarded-Encrypted: i=1; AJvYcCWB8R8dhKyq4qt+JZW/WefbPZlnZKnYzzRxVBCcKPyLntVXoE4/jjCKb5+9Uk/ojU7B56AZRu+ybphEHMh1@vger.kernel.org
X-Gm-Message-State: AOJu0YyhFHKBCtrNZmD/rTOwtzTAiB3ZAMOO5RNig7Jk0Ng8ICQg/U+V
	ccPW7Q1YE/b3iXmuE44Qrf2qIbDq6H6/shGufMHzbhFc4gQZnOK4WajgakgQnvo=
X-Gm-Gg: ASbGncvWjIvHEk9m1Krgbn00fJugebPowNfT47ac9Iv5ByUUEQQzihSLAVT+bpwaF0A
	0CHNHyvIBcs5JdilAuUXJSNnRIN4aasdIgldE9xZ4axgCpWUzmU0Bf6rsO1iAoALhTdN4yYiBkO
	Z/VE6Tv5g4F9R0G6vCxJVeEXWKGCSAIxlu4JysHoJNspPtTK/MALeYnCa9+dSBpnMY0gx9g6Bp0
	Nsp8fW6E6lT/GRUg8tpDIMeUFfEfPwxk+Y7eQw8o08IbPGYHX8so6vKkcmjgd9kgpnMdlhULk9F
	78yJ+FqTv1J1HMnD/Cz4qVV/CzOvJg==
X-Google-Smtp-Source: AGHT+IGr9uMxo93wJGxFzArfg+pP1wZ9tCEQ5bUA25+sg+xbIvGjRMQfn/tHm4PwS77Cqpq1oIootg==
X-Received: by 2002:a05:6512:230d:b0:53d:f5e9:ec4b with SMTP id 2adb3069b0e04-53df5e9ed27mr6247121e87.0.1733139523571;
        Mon, 02 Dec 2024 03:38:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6430ea0sm1450279e87.18.2024.12.02.03.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:38:42 -0800 (PST)
Date: Mon, 2 Dec 2024 13:38:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, quic_zijuhu@quicinc.com, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_mohamull@quicinc.com
Subject: Re: [PATCH v2 1/4] dt-bindings: bluetooth: add 'qcom,product-variant'
Message-ID: <qsaiic4jvhf6nqe7efchxvja6tjvsiquem6ofsgq52iygfflya@huv6x7kz6emd>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-2-quic_chejiang@quicinc.com>
 <454tdpuglu23nmxfqqesv42h5rk3vqiji7spo3naf2djqwojqt@6x3ram3lnlkq>
 <fb5bc38b-83b3-4924-b1d0-39219a2927b4@quicinc.com>
 <CAA8EJpqAOD_+SLG2LbiodWOs28_rquvMefmSH5CY1yB_rkiZPg@mail.gmail.com>
 <a7ec9426-8c8a-49b3-9916-4c2660c38e49@quicinc.com>
 <CAA8EJpqpzwGL38F_MYUJVuAT8q96QZO7CSh00ZpNBU5cGWUqqA@mail.gmail.com>
 <944fdc7f-313e-48b9-8917-370942d4f073@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <944fdc7f-313e-48b9-8917-370942d4f073@quicinc.com>

On Mon, Dec 02, 2024 at 10:22:52AM +0800, Cheng Jiang (IOE) wrote:
> Hi Dmitry,
> 
> On 11/30/2024 4:24 PM, Dmitry Baryshkov wrote:
> > On Sat, 30 Nov 2024 at 05:48, Cheng Jiang (IOE)
> > <quic_chejiang@quicinc.com> wrote:
> >>
> >> Hi Dmitry,
> >>
> >> On 11/21/2024 12:38 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 21 Nov 2024 at 06:02, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
> >>>>
> >>>> Hi Dmitry,
> >>>>
> >>>> On 11/20/2024 6:43 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Nov 20, 2024 at 05:54:25PM +0800, Cheng Jiang wrote:
> >>>>>> Several Qualcomm projects will use the same Bluetooth chip, each
> >>>>>> focusing on different features. For instance, consumer projects
> >>>>>> prioritize the A2DP SRC feature, while IoT projects focus on the A2DP
> >>>>>> SINK feature, which may have more optimizations for coexistence when
> >>>>>> acting as a SINK. Due to the patch size, it is not feasible to include
> >>>>>> all features in a single firmware.
> >>>>>>
> >>>>>> Therefore, the 'product-variant' devicetree property is used to provide
> >>>>>> product information for the Bluetooth driver to load the appropriate
> >>>>>> firmware.
> >>>>>>
> >>>>>> If this property is not defined, the default firmware will be loaded,
> >>>>>> ensuring there are no backward compatibility issues with older
> >>>>>> devicetrees.
> >>>>>>
> >>>>>> The product-variant defines like this:
> >>>>>>   0 - 15 (16 bits) are product line specific definitions
> >>>>>>   16 - 23 (8 bits) are for the product line.
> >>>>>>   24 - 31 (8 bits) are reserved for future use, 0 currently
> >>>>>
> >>>>> Please use text strings instead of encoding this information into random
> >>>>> integers and then using just 3 bits out of 32.
> >>>> Ack. Originally intended to make it more flexible for future use. It can be
> >>>> text strings for current requirement.
> >>>
> >>> No, fixed-format data isn't flexible. Fine-grained properties are.
> >>> Please define exactly what is necessary rather than leaving empty
> >>> holes "for future expansion".=
> >>>
> >>>>>
> >>>>>>
> >>>>>> |---------------------------------------------------------------------|
> >>>>>> |                       32 Bits                                       |
> >>>>>> |---------------------------------------------------------------------|
> >>>>>> |  31 - 24 (bits)   |    23 - 16 (bits)   | 15 - 0 (16 bits)          |
> >>>>>> |---------------------------------------------------------------------|
> >>>>>> |   Reserved        |    0: default       | 0: default                |
> >>>>>> |                   |    1: CE            |                           |
> >>>>>> |                   |    2: IoT           |                           |
> >>>>>> |                   |    3: Auto          |                           |
> >>>>>> |                   |    4: Reserved      |                           |
> >>>>>> |---------------------------------------------------------------------|
> >>>>>>
> >>>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> >>>>>> ---
> >>>>>>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml          | 6 ++++++
> >>>>>>  1 file changed, 6 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> >>>>>> index 7bb68311c609..9019fe7bcdc6 100644
> >>>>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> >>>>>> @@ -110,6 +110,12 @@ properties:
> >>>>>>      description:
> >>>>>>        boot firmware is incorrectly passing the address in big-endian order
> >>>>>>
> >>>>>> +  qcom,product-variant:
> >>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>>>> +    description:
> >>>>>> +      specify the product information for driver to load the appropriate firmware
> >>>>>
> >>>>> DT describes hardware. Is this a hardware property?
> >>>>
> >>>> It has been added to identify the firmware image for the platform. The driver
> >>>> parses it, and then the rampatch is selected from a specify directory. Currently,
> >>>> there is a 'firmware-name' parameter, but it is only used to specify the NVM
> >>>> (config) file. We also need to specify the rampatch (TLV file).
> >>>>
> >>>>
> >>>> Can we re-use the "firmware-name"? add two segments like the following?
> >>>> firmware-name = "rampatch_xx.tlv",  "nvm_xx.bin";
> >>>
> >>> I think this is the better solution
> >>>
> >> How about the following logic for handling 'firmware-name' property:
> >> 1. If there is only one string in firmware-name, it must be the NVM file, which is used
> >>    for backward compatibility.
> >>
> >> 2. If there are two strings in firmware-name, the first string is for the rampatch, and
> >>    the second string is for the NVM.
> > 
> > I'd say, other way around: the first one is always NVM, the second one
> > is rampatch and it is optional.
> > 
> OK, Got it.
> >>
> >> 3. Due to variations in RF performance of chips from different foundries, different NVM
> >>    configurations are used based on the board ID. If the second string ends with boardid,
> >>    the NVM file will be selected according to the board ID.
> > 
> > Is there a reason why you can not use the exact firmware name? The
> > firmware name is a part of the board DT file. I assume you know the
> > board ID that has been used for the board.
> > 
> The boardid is the connectivity board's id. NVM is a board specific configuration file, 
> it's related to the connectivity board. We may attach different connectivity board on the
> same platform. For example, we have connectivity boards based on the QCA6698 chipset that
> can support either a two-antenna or three-antenna solution. Both boards work fine on the
> sa8775p-ride platform. 

Please add such an info to the commit messages (plural for it being a
generic feedback: please describe the reasons for your design
decisions),

I really don't like the .boardid template. What if we change property
behaviour in the following way: if there is no file extension then .bNN
will be probed, falling back to .bin. This will require reading board ID
for all the platforms that support it (do wcn3990 have board ID?)

> >>
> >>
> >> Here are two examples:
> >>
> >>  firmware-name = "qca/QCA6698/hpbtfw21.tlv",  "qca/QCA6698/hpnv21.bin";
> >> In this configuration, the driver will use the two files directly.
> >>
> >>
> >>  firmware-name = "qca/QCA6698/hpbtfw21.tlv",  "qca/QCA6698/hpnv21.boardid";
> >> In this configuration, the driver will replace boardid with the actual board information.
> >> If the board id is 0x0206, the nvm file name will be qca/QCA6698/hpnv21.b0206
> >>
> >>>>
> >>>> Or add a new property to specify the rampatch file?
> >>>> rampatch-name = "rampatch_xx.tlv";
> >>>>
> >>>>>
> >>>>>> +
> >>>>>> +
> >>>>>>  required:
> >>>>>>    - compatible
> >>>>>>
> >>>>>> --
> >>>>>> 2.25.1
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>>
> >>
> > 
> > --
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry

