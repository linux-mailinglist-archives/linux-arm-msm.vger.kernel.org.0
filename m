Return-Path: <linux-arm-msm+bounces-84416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2DACA6261
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 06:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 290D8313D3DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 05:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ACE2DE719;
	Fri,  5 Dec 2025 05:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsWPZpwk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4C11A9FA4
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 05:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764912510; cv=none; b=TliXGvY0q5/V1/nMkI53Jphbf7GnYzNhOZxEgR1UcJS2AUCeeGPpF6CmW3cCqX4INe738iUpF9QVfxz2bv2nMEko6USPCuSN3mTiZ+ACIpQFCAHi1zDtI+Bc0rwyE4tu2qZzM3lcBm82Ue9Gkz0lKW+vZ8ROzuixdQjx78fbfg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764912510; c=relaxed/simple;
	bh=7gXapAmmg7JO5h5KwY3a05VY5D9/ieP/cPlJk8qhjEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDH8JwAUQjLeFcAUxQsmH4Y7yjyxvv/dj8y7E5DGqd/ktX9SPsf47Yifbq0AKJ0caQ+NoTPEYTIZPh1WJQUaiwTPbsmkRqZAqUPZhkJuVEjEz7CiHFfB/nmyw4IQdufK8WzQqzqAkso/5rmsysZqKUKI0Al20TXhgm6aW/B9u6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsWPZpwk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3436a97f092so2126356a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 21:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764912508; x=1765517308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7ukqL3aXDaN3u+bo8BQ1doi7S9aNK9IMN6SCGWsRl0=;
        b=AsWPZpwkHo2dSntuvVs8VHaIIVQ+sFO40+BZEzbcjJoZYalV5mW1l35U7P5QQxwjDF
         /tmbezy1iSXpUv5n9qz4+A2M9TUgUTfHeFY8i1A9VuOR71L6LnK9j5dlS+mMxhTUt0Jj
         yk79DggWert655ZqEiyAECoZy2N2JyKNRObwJdB5drLuhlp57f8Q2NbrXSc0et6nkblW
         q/h7IBw9sliLuMFxI1dOShDRbpa3/o1ghFLOJzsM4Ei1Q9giE/2Xe4NsaUpvwpt3oPfR
         olZzwNTtKTBjWrDEXfheMfi8BLaQJS/i1HUglVtqjXD+qBxKT7zSMvJ5SLbUK+h0moE7
         Qs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764912508; x=1765517308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7ukqL3aXDaN3u+bo8BQ1doi7S9aNK9IMN6SCGWsRl0=;
        b=COt/4/49lF+c2D/arrI9d6vLbLee+97BXyB0lTTxKahrewfZaQ4IQ4/kqMolGSNP12
         /PdBZST53ubJlvoK4rIMln6DNAVbDxTmQ8ageOH7FoKsjToDrfTQdfQjtUwrGpNOXX0j
         sONLFjYrmWN5r7I+Id65DtIsXm9pTRr9SLR+2zyS1IRV5G6t+H5Duomc5Mcvuho+a+pm
         dW+HoxicFPSFBjWwKnZ6wvmzetyPpejhdwuOQ3ybl2KDSPj+Z0iVN1oLHxQyBv0bKbGd
         rd7LfU1+c4nMI94pcOLTSmiaQZZoZiDTOAasgR77iT5KsU+/FMpBc9IDZMS+T9T/I5xu
         wZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV27dyZl8UAWP3h7zJsNjrGk6BdjBGOukOWY0F4dD73UiJVoru4ZDsDp70FmS+SQolK41mzTjb7tV4z7q6K@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGu040rsDv/CEtN2IP9DHdcckUSoVDUKRoJKgl67HJjUSgBtH
	6jzIAwTVA2nTXvYfS5XELCourx8RSFbknzzIcW8FAsCIgpUagTb4vBCh
X-Gm-Gg: ASbGncur5IY3xhdZ6wryVJzpRyrD+etX+7zOwla99QRN6i4La2SZ29MJQJ3grSZvqjK
	xf1/CZqMnFxuxSSGAIHZFaH0UEvbTpQO77yOhz4JE1syTUoyKP9bwy7hskcw1W5QB9leNNpeS6D
	Lumkw2lJWH/gzkDiGG/lRw18e1LfUkYo9cOnysf13b7uCKwBTAXL9uil29Kd4CDw8+752dvy8tZ
	RDWxxkwfNm773cMZDRcjjb8ZTMCUTTHOIuchtjsnex2HCP7hzBh4gozpa2X5U4UnyOHgRR8ls5x
	MDodnPt+8CaoMMtUqgWfTaHU7agjCz8si0s0wRLIl47tGXA1v3Z6UDZxZ4pnAUzpxmbN/i8qAo7
	D2W3WagmVDRTIgXA/qatDDxLmBjs8vaKILic6c3SmVZsvCoRBupHnF8YK9e0ha+oThh/E3xSLjq
	l7iTAWX5TENvoVvqxBqSAFp4Q6XYrR09Bf6NI=
X-Google-Smtp-Source: AGHT+IHlHZvA4y6v+ARlFqNBbUIVjTd9uUIJEqpgZP4hHxgtuG/UijD7JAA4UG4LD9m1uwGAWQhsTw==
X-Received: by 2002:a17:90b:1802:b0:343:e082:b327 with SMTP id 98e67ed59e1d1-34947f0a2f2mr6100920a91.31.1764912507772;
        Thu, 04 Dec 2025 21:28:27 -0800 (PST)
Received: from [172.16.20.12] ([136.226.244.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494e836bc3sm3400589a91.1.2025.12.04.21.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 21:28:27 -0800 (PST)
Message-ID: <9b0c7cac-3577-4190-883b-7de26790b8bc@gmail.com>
Date: Fri, 5 Dec 2025 10:58:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251107105735.1491273-1-tessolveupstream@gmail.com>
 <20251107105735.1491273-3-tessolveupstream@gmail.com>
 <badmoityubqmjsxune27vrh2e6htwkhvnak4uj7iiixnxhjpkm@qi56e6kilyt2>
 <db3edb31-4a1c-4512-ac46-ca3b4e9f187e@gmail.com>
 <CAO9ioeUVx_qf3no9aLgZ3OQQPQ7nG-2aTx8SHaEN5DUf02USWA@mail.gmail.com>
Content-Language: en-US
From: Anusha Ajithkumar <tessolveupstream@gmail.com>
In-Reply-To: <CAO9ioeUVx_qf3no9aLgZ3OQQPQ7nG-2aTx8SHaEN5DUf02USWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03-12-2025 02:36, Dmitry Baryshkov wrote:
> On Tue, 18 Nov 2025 at 12:16, <tessolveupstream@gmail.com> wrote:
>>
>>
>>
>> On 14-11-2025 01:38, Dmitry Baryshkov wrote:
>>> On Fri, Nov 07, 2025 at 04:27:35PM +0530, Sudarshan Shetty wrote:
> 
>>>> +
>>>> +&uart0 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_hsphy {
>>>> +    vdd-supply = <&vreg_l5a>;
>>>> +    vdda-pll-supply = <&vreg_l12a>;
>>>> +    vdda-phy-dpdm-supply = <&vreg_l13a>;
>>>> +
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&usb_qmpphy {
>>>> +    vdda-phy-supply = <&vreg_l5a>;
>>>> +    vdda-pll-supply = <&vreg_l12a>;
>>>> +
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_dwc3 {
>>>> +    dr_mode = "host";
>>>> +};
>>>> +
>>>> +&usb_hsphy_2 {
>>>
>>> So, the labels are usb_1_hsphy, but usb_hsphy_2? That's not logical,
>>> please fix one of them. Then please fix the order of nodes here.
>>
>> The node names come directly from the included talos.dtsi, where they
>> are defined as usb_1_hsphy & usb_hsphy_2.
>> To avoid breaking inherited definitions, we kept the same labels
>> in our board DTS.
> 
> Please fix them in the base DT.
>

The inconsistent naming originates from talos.dtsi, which is 
outside the scope of this patch series. Modifying these labels 
in our board DTS would break the inherited node references 
from talos.dtsi. >> However, I will reorder the nodes so they appear in a logical and
>> consistent sequence.
> 
> This is a prerequisite, no questions.
> 


