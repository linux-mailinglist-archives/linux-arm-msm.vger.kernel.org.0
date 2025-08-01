Return-Path: <linux-arm-msm+bounces-67372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E67A1B1833D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 16:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A2017C9B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DC3266B6F;
	Fri,  1 Aug 2025 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tvHcWEnN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA5126738B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754057255; cv=none; b=PJ/ThrzOiNbDQrgnP4GQaw3c88b80XtYbYp2K/+cVEiJK0xCTiFweknYj8CpiOq0YBmtle9O5KB1dVPJEgRuUxm7IYgtsrV3zHvw1So/kdSO6G817GbKC1ZCP1H5Oj7DF2IDdQcYUXvIZNYZlAKcMEs6Tqpa/ipZh91H6lGAZBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754057255; c=relaxed/simple;
	bh=wlC7kP2F/ioJRdEtnIX9BmgqWxNwMFSCwUw9OI+Iwos=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TbQ4ZXm+ouNu9TqJtJb1lCYnbSPyZEGV7Zk3fiUDbDXZ3UP/uldk8IWwRmBOKM1CaxueoHu4HvrhZcjWtNka0Bmo4bFke9QKYbXp6x1pULD5SGlswjAFwSUcqbGuKo/VDUWR9tdsi8cP4ae8pOnJ34O8MK9u4Te+cYrWGnrvNUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tvHcWEnN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af937728c3eso99614066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 07:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754057252; x=1754662052; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuxnvwCqyjcDlHCRDIoiI8J6doFQnIolVgtplDpfZA4=;
        b=tvHcWEnNOWxauXAWCJReRI49W/STR3KojInKcEEqjHgiGNkvYAK67hLujnAEOqsJcs
         +jDUqTi7plSURaQONH0nSXjtl1NPxIDKxr50GJ+OxxjM2EVycefW/O9k5p6gv7Wqit99
         eEkCHyPD7PrQf4FpOmCIDG7hx4XWWgCcY+/sTSmmXVnSyWH0TUQVfgWS6qpuuhDK1c7j
         meoOBbe3OfJ8F/+NCiaED5UejbfqqkIYavH5dI9Ea6B7Q1/mGUzdrHHUKmuwj9WbPQ89
         U3ZE5kRJhUmP+X6NOXZtwsOLKUUlW5DShrMefIqEd3jtM2Eld4RylrYgecAiQsTZWaC3
         CWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754057252; x=1754662052;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuxnvwCqyjcDlHCRDIoiI8J6doFQnIolVgtplDpfZA4=;
        b=rvbP+w8kBLLeqs/3FFGUHVDzPyjgzaUevnGjBfauWCYsXGMt58MqgmsvfZoiASV+eq
         Kgun7PcaOKVUyvxhVp9tB6xY4a/IyslLKsXhOfbLfm4B6g21/fxgE2JyMZjOiWRZmfV1
         4koZ60uWhdmXpUadHsoc6L1ibUkd8ijNaG7CbeK8JyD18CmK34Uz08mUVavjMV3AnBUS
         td4hXNYcclUNtrOLMmHV9ashRjQJ2U2dTxLP4QT6l8JMV5V5wQYh5mi3Pd3aTO7+Zucz
         67Lpza0q+vZra0FUVrBOsVruKM/bLq/Rl6LtAGQ0snkHK6hpjWTyOOr9Bp+z71IBcOGy
         Snww==
X-Forwarded-Encrypted: i=1; AJvYcCXyymZ48uvZ35pk1EF/Yo+yrORhhbhgFidgaPnId3vW+xXJ6riTddzbOqRAI6Kl+1RFD6y7fNsNCP2eZHb5@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJ0fNQKJauOSVcCRY9Nzki1jny6R1GZEYPj9saLW1rpnqLKgV
	PvK3LfSEaENSINDj2tybg/fTTadglqmQZxAmT5jMTI3LHAsm1pxm4qCaWaDhPpv+Rt0=
X-Gm-Gg: ASbGncuxa1DPqoesw6tKQ4CnK9wZv/bMjZ+jtYxtVOH2fUrj/+qdXj2klAdYZ7qjpfd
	tprOgNtoMvVD4X1nsyg9g2pVekdTVEA4ir3Bu1hwqQsCygQ7GkhB9GFxnE3jHy11EnSrC7CQ41G
	KmHdzl2VoDicxJf7bZ6LhLHwu8ngVEfRLqzCl4GMnw8s70z739e7159uRq1y9TrmaTvZ4gLxG03
	AbnuJ12h4cORnS10d4ZbMNWqdDhmfwH9pz9UQUtkge2DsFwec3NPGOT6EMCdbNpeRd4m+VLsvRm
	NiM1q29dnCnTzS1353oiIWKVB1kUt44M+wNVXwvZ8aNJmeBwxOZsbBwaoPZDTM2KJlbW9sC5wuo
	L4nesinmOXRTlsnFfhkMsQ02Xn2YESJwt4jPILwqz0BHuzDeqsVvf5WpHZA3P5mmG0qqyrBrghh
	a+TA==
X-Google-Smtp-Source: AGHT+IFo64qe/in/Kdng7Z9+viykYzIep/glDaze3I4XSMRsdZqXl/DBVMQdd6r4eLj2Ze3mSkAUjA==
X-Received: by 2002:a17:907:7e84:b0:ae1:a69c:ea76 with SMTP id a640c23a62f3a-af91bf2f3damr584753366b.23.1754057252477;
        Fri, 01 Aug 2025 07:07:32 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af93d62bc97sm20517466b.80.2025.08.01.07.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 07:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 16:07:31 +0200
Message-Id: <DBR5EH6T22S3.O4U97PRZF1BI@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable USB
 audio offload support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <cros-qcom-dts-watchers@chromium.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Wesley Cheng"
 <quic_wcheng@quicinc.com>, "Stephan Gerhold" <stephan.gerhold@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
 <20250801-fp5-usb-audio-offload-v1-2-240fc213d3d3@fairphone.com>
 <445317ce-fe20-454c-a564-288372772b74@oss.qualcomm.com>
In-Reply-To: <445317ce-fe20-454c-a564-288372772b74@oss.qualcomm.com>

On Fri Aug 1, 2025 at 4:03 PM CEST, Konrad Dybcio wrote:
> On 8/1/25 3:51 PM, Luca Weiss wrote:
>> Enable USB audio offloading which allows to play audio via a USB-C
>> headset with lower power consumption and enabling some other features.
>>=20
>> This can be used like the following:
>>=20
>>   $ amixer -c0 cset name=3D'USB_RX Audio Mixer MultiMedia1' On
>>   $ aplay --device=3Dplughw:0,0 test.wav
>>=20
>> Compared to regular playback to the USB sound card no xhci-hcd
>> interrupts appear during playback, instead the ADSP will be handling the
>> USB transfers.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 16 +++++++++++++++=
+
>>  1 file changed, 16 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/a=
rm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> index e115b6a52b299ef663ccfb614785f8f89091f39d..d30912f952db271aa4fbc257=
0ca04b771ffef3ca 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> @@ -1176,6 +1176,22 @@ platform {
>>  			sound-dai =3D <&q6routing>;
>>  		};
>>  	};
>> +
>> +	usb-dai-link {
>> +		link-name =3D "USB Playback";
>> +
>> +		codec {
>> +			sound-dai =3D <&q6usbdai USB_RX>;
>> +		};
>> +
>> +		cpu {
>> +			sound-dai =3D <&q6afedai USB_RX>;
>> +		};
>> +
>> +		platform {
>> +			sound-dai =3D <&q6routing>;
>> +		};
>
> Because this is SoC component <-> SoC component mapping, this could live
> in the SoC dtsi.. but then 7280 is a glorious mess with the firmware
> flavors, so I suppose it should stay here..

q6afe definitely doesn't exist on the RB3Gen2 for example with
AudioReach, so yeah... I guess also the sound setup on other (simpler)
platforms can be simplified quite a bit, but it's (unfortunately) not
yet a major concern given the limited number of boards with good and
complete audio support.

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks!

Regards
Luca

>
> Konrad


