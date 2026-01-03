Return-Path: <linux-arm-msm+bounces-87293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4AECEFC3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 08:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0EDC301E217
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 07:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5B329E0FD;
	Sat,  3 Jan 2026 07:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rNyzPj+J";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="v5y3Sqfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2024E29B8C7;
	Sat,  3 Jan 2026 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767426076; cv=none; b=mE3ulUQWk9+s8O3fBoA7B6bLl/KIVbHXE8aMeuvPiuS5QT99MZRI83hJTeBUHweyE4Bf9a8PrDba0/siFbcA/mingW5rZUYGbycnG3lyGXNmyrTjMoUkmX0QydWbtJyFrXCPyn0BzozFexSue3ABIPsNOsZ9686OggVqE27QUrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767426076; c=relaxed/simple;
	bh=VhcEvPbKUCvMSJ5HG3Gz+nnOwUWvfOml3AhVHogk8eg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=BRmUFGs2/pw7OceiwsB2IPgRD4xkv9UO8ajbFNa8Ve8e4c3FljYayPtxXzW4nf43X9LtPjU8faqxf4mGzRmo9Y3KMZYG/3hwnY3Uylw6rFzXhBPtgotjMZOAwtsu/ikVnaEJvgrl1nH4ZWhrHln75ANG3EUknYDDhoZ+hT2vB0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rNyzPj+J; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=v5y3Sqfe; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767426061; bh=NBb6TpNSoCwFXPgQi4mLqE9
	rhUUN5RA4BSIU6zTshNs=; b=rNyzPj+Jcy2PypPw0hYzfn5+NqdpXJSrTHCqYoD5ZCnu8R6oa4
	1ahq3AQvG3QRlzpT8PwntIHt0jCdkwdeJTAUfD0dsWxoA49J1JN/CZ6hjXbcNvV5kTBxeGpsRsU
	bbOTjOpbs0FOLKKw2loQMvzU1QNqMNHcb6zI1mxitxM3bbDjbOfCYUI45LRFbqCg5lP5xewJPZR
	jLvILtf/STexaB8mRdYbiOqdu59bnleAYzBrSTVEO5WtxtkF+r5LR/MVUia1Jq4iW7sq8zvBD4R
	swOmtk1vO8q9ze6ngLutF4kOdIqurneeQsWixQfVdD6OK7mDs1cgYtnTxSV3ejyn/pw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767426061; bh=NBb6TpNSoCwFXPgQi4mLqE9
	rhUUN5RA4BSIU6zTshNs=; b=v5y3Sqfeb2PaDWbKGZ6S5jjcUis5XSjt4/b2AOoS9rfWywHlg4
	PAG15VnHQsOTDRmtO/WqkKxUWMeD8SwBKgAg==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 08:41:01 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
In-Reply-To: <1440e47e-2d7b-4d49-97c4-a717fadd3fb6@oss.qualcomm.com>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
 <DEGDp05xNKls7EO30mtT70wJFIkDT0-248vPaBikWJGkFf--YvzpyJ_h5sc7RSH1y9hkCKdFRBIJwQUNE9Rlzw==@protonmail.internalid>
 <a627abcaa38c0ba11c76c1f0c42b0c6b@mainlining.org>
 <d3bcaf7d-06ae-4410-8d7c-970fdb196c47@kernel.org>
 <1440e47e-2d7b-4d49-97c4-a717fadd3fb6@oss.qualcomm.com>
Message-ID: <af693a39a3ad88a573e2d97b3ab411b3@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-02 13:00, Konrad Dybcio wrote:
> On 1/1/26 9:58 PM, Bryan O'Donoghue wrote:
>> On 01/01/2026 13:50, barnabas.czeman@mainlining.org wrote:
>>>>> +                for (; i >= 0; i--) {
>>>>> +                    val |= BIT(i);
>>>>> +                    writel(val, qproc->reg_base + mem_pwr_ctl);
>>>>> +                    /*
>>>>> +                     * Read back value to ensure the write is done 
>>>>> then
>>>>> +                     * wait for 1us for both memory peripheral and 
>>>>> data
>>>>> +                     * array to turn on.
>>>>> +                     */
>>>>> +                    val |= readl(qproc->reg_base + mem_pwr_ctl);
>>>>> +                    udelay(1);
>>>> Isn't the logic here inverted ?
>>>> 
>>>> i.e. you've written a thing and ostensibly require a delay for that
>>>> thing to take effect, the power to switch on in this case.
>>>> 
>>>> It makes more sense to write, delay and read back rather than write,
>>>> readback and delay surely...
>>> This is the original reset sequence without modification, i have just
>>> moved it in a else case when it is not an MDM9607, MSM8917 or 
>>> MSM8937.
>> 
>> Doesn't make it correct, we fix upstream logic bugs all the time...
>> 
>> For example a read-back to ensure write completion is only required 
>> for posted memory transactions.
>> 
>> Is this a posted write ?
>> 
>> Is there an io-fabric in the world which exceeds 1 microsecond to 
>> perform a write transaction ?
> 
> Writes on arm64 aren't usually observable from the remote endpoint when
> you would expect them to, they can be buffered unless there's an 
> explicit
> readback right afterwards (which creates a dependency that the 
> processor
> will fulfill)
> 
> Now I don't like that this driver is going
> 
> val |= BIT(i);
> writel(val, foo);
> // val is "altered" but not really
> val |= readl(foo);
> 
> I didn't notice we were just doing a readback for the sake of a 
> readback
> in the last revision. MDM9607 should most definitely have it too..
In this case I should go back to previous inrush current mitigation from 
v2.
> Perhaps I should have just read the comment
> 
> Konrad

