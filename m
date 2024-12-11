Return-Path: <linux-arm-msm+bounces-41555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D939ED682
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 20:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5451B2826AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 19:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632B51C460A;
	Wed, 11 Dec 2024 19:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BHXkqup9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD6F2594B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 19:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733945336; cv=none; b=OMDjjR0OO8moQuRZ/vJ1y8zBmZh5parMblk0BTLFLwo6DI1pvGi/Iz+ZjTPX3w4RA35N9RPzE8+TAEk2BPRP4oBjXvLCnioUfWHsY9LMIlefrFF7Km/LQ3wlTVAZNIT9fun84nyAiDpOwvrz5rHCNRn+MadgIgYw8p7Hfl+6TKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733945336; c=relaxed/simple;
	bh=saI+TJ4WwQAKgDdrklhcfnFFyZMNGfi+r+nYwnAQ5lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hlj29xzhmglECfoNsXVx/G9x9UD2+UXvjk5+WZw7PTzEWedTSRkt4AXeHLCJ4qIPnGyDR9oN8Uk0LAA3C3WMCA9WRJjlbq+UJdoGb6ti3LQXtjgm8PR03KrLTMS5ek9lbWanhCKznlyPmqGXCGR9hShkwu5+7oTpBDvZZyy44/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BHXkqup9; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso4868079e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 11:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733945332; x=1734550132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aNVz/ArW/lLNjVQfl87+kX9B15NlodHN27QuCLAE0kw=;
        b=BHXkqup9Y/cmRamG56yF+N9RKYHjpfdvEZA40eLUkK4wV74ALF7+EX3b+Mq/wa66W8
         xGmeGp1cD+f2QWkkm5R6RjjDyINZ+fmcB8m5U3nAKDkJObjt47InkBlZYnQrXShUdOkS
         DQ8cr+iPdpFeYiLR5yFworFlJKZ9ePZrMPI4HxoX0QSDCoMA1Nv9oq2//POsxzWndCKs
         DydgprNCHQ23jWUDIuCl82DMHnt+sLh/rEFKI+1M9RVYsoWVKovXsJMcbEgp+Kg8KjGa
         pLhdPyLWEgIBeoLwmsWPgzAbdVYLfKuXCtivx6eSlH00GjLjdoeelow20g+NeVgOM80y
         pgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733945332; x=1734550132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNVz/ArW/lLNjVQfl87+kX9B15NlodHN27QuCLAE0kw=;
        b=a+b87dAMFiOHMNf0e2KUt7l0Xn0QJUA6/J1rNQ6dcJYlCr8F/+eLVdhVg5zOwFZXyN
         JUR0PJ2LT6JNrlzvFGoL+tMiMTicJQhHrC3vj9JqVYTeZNg5YcLaETpmxVKjI0r1uAs1
         DY2BLkE806F+KJmQYqieSZy+RXYFXdGcfy4ecV6SGeT33vibqPrF4bsQGhr77PAmi5b1
         5nqQXSfzN4nkFoXt9xSmQlSTSs6zn+wuQkTyBOebZQ/Lcc5OTmuo5YaNC6MVcM08cA65
         MYr2XV91ar3whwFKN9HF/bfvW6J9DuUIBN5KGtI3lP11JCWqoBTE5AFWoPhLnerLF0wu
         sjNg==
X-Forwarded-Encrypted: i=1; AJvYcCXkiKQ+iCX+TeDkf58Oq96J9OKhyJaHAA9AN5qRMANhxIs7+Jb85nnaY13z26pFegPKf9wY/CbU75Bvwryb@vger.kernel.org
X-Gm-Message-State: AOJu0YwenzBINWHbQOARiLDIiYchQcxRGDNfNsi/LFEBwQ9VSXvRZJjE
	Bd0du61WjfYyVvWkLzkGvCBeTWjd92chbFh0wGxxGubf4iRJ8IJv0GLAznwOkNM=
X-Gm-Gg: ASbGncuLSwa3sqEmpktYKYa4Dppm9vM3XAQbuWq9hslXcytlk+ursSyTn1U2Zi0wBFl
	kzdCAOVedZr5+bwgSR1kPyNYSvpFnPt2Frv5ZTwyuIdUl6Qwh2kMe5MLOzdK7uenKE1KK6HQZi4
	VB2rz/5Vu4pDE4Dc6x/zmm5K+gVrabAdXma2Qb+WCzFNrlgiL6j6G5/kauQfrZvW9y+Mhj1OvsG
	Z+ld9KTHUzuzw6tZzi1EP/bpQRnu4qE58w7f1Ylf2uE/cWGkqdITZuMO68MH9jUPEUm7rdSZF4B
	5AugL0qnVKlSg8Gib6SV3E5+gDhD3dKIPA==
X-Google-Smtp-Source: AGHT+IGOfbXPT4dn2jZV1RKLOlrX7K+m2akt+BVMHTUk1WVTQ0bQV6RFUx4RBGUDnQfN4dhyAyjPRA==
X-Received: by 2002:a05:6512:1391:b0:53e:20af:db96 with SMTP id 2adb3069b0e04-5402a5d3993mr1464865e87.10.1733945331546;
        Wed, 11 Dec 2024 11:28:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2fbbb0c0sm1773317e87.191.2024.12.11.11.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 11:28:50 -0800 (PST)
Date: Wed, 11 Dec 2024 21:28:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_jiaymao@quicinc.com, 
	quic_shuaz@quicinc.com, quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: Re: [PATCH v4 1/4] dt-bindings: net: bluetooth: qca: Expand
 firmware-name property
Message-ID: <dukhhbf22w2hcr32jtjuvminpuzgi3a3tkkux7pd32j4d4gzkx@mvgckzd22she>
References: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
 <20241210151636.2474809-2-quic_chejiang@quicinc.com>
 <vbwg7djb4me6i4ow2q74ltqjxvkxeulhzyq4n6ak7aifhtf36f@x66pjje2iu6u>
 <62afbaea-67b1-4572-9e78-d1dbe5fae20a@quicinc.com>
 <f818f089-0490-42da-9aee-1a7006c11978@kernel.org>
 <65fd0932-4519-44ac-ba9d-55ee97b43233@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65fd0932-4519-44ac-ba9d-55ee97b43233@quicinc.com>

On Wed, Dec 11, 2024 at 06:16:44PM +0800, Cheng Jiang (IOE) wrote:
> Hi Krzysztof,
> 
> On 12/11/2024 5:48 PM, Krzysztof Kozlowski wrote:
> > On 11/12/2024 10:39, Cheng Jiang (IOE) wrote:
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> >>>> index 7bb68311c..2782d2325 100644
> >>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> >>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> >>>> @@ -101,7 +101,10 @@ properties:
> >>>>    max-speed: true
> >>>>  
> >>>>    firmware-name:
> >>>> -    description: specify the name of nvm firmware to load
> >>>> +    description:
> >>>> +      If one item is present, specify the name of the NVM firmware to load.
> >>>> +      If two items are present, the first item specifies the name of the NVM,
> >>>> +      and the second specifies the name of the rampatch firmware to load.
> >>>
> >>> Don't repeat constraints in free form text. Use proper constraints so
> >>> you can validate your DTS. And then actually do validate your DTS...
> >>>
> >> It seems unnecessary to add this description, so I will drop this change. Is that okay?
> > 
> > You need to list the items and describe them. See how all other bindings
> > do it.
> > 
> The firmware names are not fixed strings; they vary depending on the chip, board, or platform.
> 
> How about the following description? Thank you!
> 
>   firmware-name:
>     $ref: /schemas/types.yaml#/definitions/string
>     description: |
>       List of firmware names. The first item is the name of the NVM firmware
>       to load. The second item is the name of the rampatch firmware to load,
>       if present.
>     minItems: 1
>     maxItems: 2

I think this is better:

firmware-name:
  minItems: 1
  items:
    - description: NVM firmware to load (extend the desription)
    - description: rampatch (extend the description)

> > Best regards,
> > Krzysztof
> 

-- 
With best wishes
Dmitry

