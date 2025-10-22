Return-Path: <linux-arm-msm+bounces-78276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D17BFA68F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C2AF406221
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EE32F3C12;
	Wed, 22 Oct 2025 07:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="lOKW89gt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CE32F39B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761116416; cv=none; b=Jg66PMW9O1DKWeANnjl/udcdrSO1RG7T9ARdnV1jx5FDFgEgxtxMBTS3Sb4PXs9SrEYqzmT0lU7hpW8NMb+LYHRVCrxFCRcXeOtW21v9dN5lkkNW3EKh2rDZIX2ReJI0dB8D2mS56KFfjhBKfPV7Trh/wgwVbnT5am9UmOkFTTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761116416; c=relaxed/simple;
	bh=2ovcfzW0TZxfflXJ1CWAc3hKGj0ELxUHga64V8M6ot4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIuWvvuC+a28EMPj4QJ7Mp28Q8M2UVSG3nrKHwSjypb5JPFvwMnwx9/Y6wbzntfJpx8fnDcNUoUKlHR1Gz12RURp/EoY/DN1FRgVuBB/+N8xNwFq8w94DLs78P4mjFWuMB3E++6CZWqdEj7EgzxkFcc+k0sJvK5Potv+2YvcZF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=lOKW89gt; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-88f2aebce7fso936498585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1761116413; x=1761721213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZ0zLiQMjHfWfIrETWEpgf86vfPQWqa3rEBNo24tR5I=;
        b=lOKW89gtGbwipcluEaEJlQSRPk4HOVPDoeTtBsPgzX4VBK4WR0IppUMuRypIaDitkE
         zYz+C3PQ0ZOjl4CeieIT7XgNO90JKwkkn44aUQAlXM/ugqZ0qflvyOYA+LEJPaIYfsSC
         orcFnv0bhf7u6vAlHN6ySJjTQvffohW85jgxpvVcq6zvEiGZRyEguUA3hZfa2GISSJVK
         pmn51Aiu0yGX6Ysj64T7ntOim463s8mqk48IwzDjoEqb5KiRgNRKph7RT6Bm/+LBD2/M
         RFjFlfVMkTNon2LMLAoCc5pSrzXLUZMNff/J9Q+YCciS8hDfv6WCvV1zhvL7EuKNUIoj
         /eaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761116413; x=1761721213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ0zLiQMjHfWfIrETWEpgf86vfPQWqa3rEBNo24tR5I=;
        b=XyeBapv1vL/none2D1imXvYDsaQgqfsCrkKaVNJqPAl3GyAhO2LX51lbOG2Y8XwALL
         FTAo0e6k5jkJOOid527HbyxsiDMwAEywIQTFIRA36jyUDdOtJ9qmWSY96qGRLcvMujpc
         /F0YfIs3+R+oSUMjZOBZrZ9XteOSpEIhDG/EP4e7wJQNcRIE72zpJWOcA5JaNIQMpv2E
         r+DiIShj3xMX2KspFcuFgI1r3We3PzlakZH4HShMMlzwcd2XPHNr5PpgAMWPcEkxSPdf
         13JcAkcotiJpcPiJwovvIzZRTLA6Hg01KRDeV4HAelloTUQz70CnRNTMIa+gPgz6kFGn
         oE0w==
X-Forwarded-Encrypted: i=1; AJvYcCWUXc2RdCCY6lTOsUuQSbUctjY3n5eR75tN2UjHk09ds8UWQXOk0bTgqiXxLLHjE5QFeGukXKT0E0u6Nalz@vger.kernel.org
X-Gm-Message-State: AOJu0YyDwoPCE935a5yHZXZb9twbDeJAwRNC7E6E3NcH1AlDxh7z95EZ
	Sf6ySjUNEWJ2Phf2027Yd7y2rcxqt3k2/0pyl/8t9CHI/FfUnkis2ZBaCwShWo7tMFs=
X-Gm-Gg: ASbGnctpxVBFrg7TJjUmT/0sd7RGD64EOySHXGvAg/itW5afOHAu12GNuFBHhUGvjPj
	K7RODugpVFUMc7ZNcOKUo8nM3O/e8078f59exD5p+kixa/P9I5yvp3gcr2AZJS3QKeXBOVroWSJ
	X5bEJB8klb+vGnttllWzaY7zagjymHIHIrL9hdhxwjVqLxcYeE65Cl/Ja00YgOjKvX6sAluDWgu
	F5zuJ+kWRRNZD8kKroYASozRbwiwpP3rsO09+Fqp+UTFtlnqnwanYVxe18GEueJm4Etya3m3zBh
	b3hJJVgiXsQCMJoQqH73lsbcH5XQcWFCkTH37BO3hIcUStazv7TIwd5hfgNCWXqYPyCWGDDc4ds
	IgKoCvCDhnsmpbNfyHGudt19MzfL0zTEnA/dQA2l5uz+lpRCMinJoBuYCb0o0JoF1ZWXjq9cJ3n
	O3XV6dFPBGsw==
X-Google-Smtp-Source: AGHT+IFP1Egld4e4M3O9ldes+hPt4it1nCGP1bODqWck6WjBakPWZGeujTTjHQoGUKEqPL4vEcQSIw==
X-Received: by 2002:a05:620a:4621:b0:88f:228c:c6a0 with SMTP id af79cd13be357-8906e8af048mr2096261085a.24.1761116412834;
        Wed, 22 Oct 2025 00:00:12 -0700 (PDT)
Received: from [192.168.2.8] ([74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cd6717desm915892985a.26.2025.10.22.00.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 00:00:12 -0700 (PDT)
Message-ID: <77efe2a2-ee81-4096-9145-a76e35954e84@me.ssier.org>
Date: Wed, 22 Oct 2025 03:00:01 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
 <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
 <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
 <41c63020-9226-45d9-979d-429b7299da41@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <41c63020-9226-45d9-979d-429b7299da41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-20 08:02, Konrad Dybcio wrote:
> On 10/12/25 8:03 AM, Alexandre Messier wrote:
>> On 2025-10-07 06:03, Konrad Dybcio wrote:
>>> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>>>> From: Alexandre Messier <alex@me.ssier.org>
>>>>
>>>> Add support for the notification LEDs on the HTC One M8.
>>>>
>>>> Two LEDs are available, one amber and one green.
>>>
>>> Do they form a single notification led, or are they supposed
>>> to act separately?
>>
>> Good point, I had to check the phone user manual to confirm. Indeed, it is
>> referred to as a one logical notification LED. It also mentions the color can
>> be either green or orange, it does not mention using the combined color of
>> the two LEDs.
>>
>> So I would say they are supposed to act separately.
>>
>> Hope this answers your question, and let me know if more details are needed.
>>
>> BTW: I will be sending a V2 to update the color name, since the user
>> manual says the color is orange, not amber.
> 
> Let's describe it as a single LED then:
> 
> multi-led {
>         color = <LED_COLOR_ID_MULTI>; // notice it's not RGB
>         function = LED_FUNCTION_STATUS;
> 
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         led@6 {
>                 reg = <6>;
>                 color = <LED_COLOR_ID_GREEN>;
>         };
> 
>         led@7 {
>                 reg = <7>;
>                 color = <LED_COLOR_ID_ORANGE>;
>         };
> };

Using multi-led is fine for me.

But currently, the "qcom-lpg" driver doesn't support LED_COLOR_ID_MULTI, only
LED_COLOR_ID_RGB. Adding support for LED_COLOR_ID_MULTI is trivial, I tested it
and it works.

Or I can also use the "leds-group-multicolor" driver, using the two individual
LEDs. I also tested this method and it works.

> 
> + Pavel the LED maintainer, please take a look if you think it makes sense

If Pavel agrees using multi-led makes sense, I think the first option is the
best. I will separate the LED patch into a new series, along with the change to
the qcom-lpg driver to support LED_COLOR_ID_MULTI.

Thanks
Alex

> 
> Konrad


