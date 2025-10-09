Return-Path: <linux-arm-msm+bounces-76601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 473B7BC869C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 12:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 31B634E8D80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 10:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1812D9EF8;
	Thu,  9 Oct 2025 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Vc+9kMgs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304FA2D879B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004638; cv=none; b=ESnJia4SHuKripv7EjFDRevHzhtUn6PxN3HHGVLGN4Rektd8itfW/qstYzt33v8fZxAPkjfG+C3mPSislNgIRJ8bdB/bsKksqSwjiO9jIXmAvKz36GcfwlhVe0XA0TkubmB/w5Q/GMAa07nRggvQEAiw81VINFYkhzVR5zAbkvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004638; c=relaxed/simple;
	bh=gG4uos5u7JZYKZN9sVpZMjMGBZVjLgLK+l61W+7327M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FZzELfa5hVYsOuaZZapdtDf5DT7qnsT+2uMCsYy05R1DmZUJ6BiLtehh8UjLjVlLhA2HthDfX3m9eWmGgpO7p0ducxUysl4bGA6YxdM90dUIDEx/xYVjjAd98QBKbGcyF2tkJtZMSkt+5uHmCbqkFVju7EHkCaSCNOL8oJcp39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Vc+9kMgs; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so1545983a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 03:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760004634; x=1760609434; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viQs/zJlFXUzbGPc0YC6fbKblNDfZ3K6sukiP7yGwdA=;
        b=Vc+9kMgsIuD+EPFwhTPJRM3ETJLY+5xhBq6fHJL+NQO1JMT55AeQ0euergmAZNMFHh
         FjqSA152TXjMzTDqgw5X8N9U1vOcNWRfPQqD8YOoaltg3YtLg6RQgQEbE6V5mzXDi2Tn
         +6AbmCnlD3nsaNrl/1o889LGizsjF+sMuBZLtlmrLY60mD6VufMlt/us830IwRubUu1+
         UssuUPtfw/QbqkRaPurP5p1N/JIhJYCh73Ylky3ImPWGi36foOBpsc9Xv1CslboiyyZz
         yWB759KdXeZh/fAmuCBl8MNgLeS84pHnEpIpoCRyU+8o5es7TinxldV0Y67/UShoy3Oo
         R/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004634; x=1760609434;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=viQs/zJlFXUzbGPc0YC6fbKblNDfZ3K6sukiP7yGwdA=;
        b=w5YOpyR5VXK5ZEug58Ue5rU4owcTsZ8pJXLFsKeJRcrvHEAKGLeNoNEMWyQRyHDb4z
         c7ZRV6iN94MZY62ebEdJerT3ue3BhemqA2lAZ0RiLwv08LsPQtjg0T4JGTcw3qhpxQrC
         9XHDWEf/7NwwP+K7shap00CLJ6s/Eael4DXs9lwO4RSMV05qxJu9wCDud88m1tbv47mV
         Ol+Qvku6yEUEROu72+6xDnomUkZ2i2pvUGuElkwnZgLhjGeAOjpa66jUOihir0PE3j2r
         CjyXsV5EZnEb6UA3PR11DJblNWy63Q/3yIH4gqPKXf+f72Vq1Cg5QicaEy2OO5Fl9rNU
         7RpA==
X-Forwarded-Encrypted: i=1; AJvYcCXKpDVmL2IivbzTBeFKl8Ge/W75sxufzzlofw/J82nUrCSahgikAmK9kioI9F4yHEk2aFhKfV0m+rSZZYOf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3utZt6LALxEA/uF3/ovepm7Do9kj/I+rLa0OEzHUIayFZXABe
	/9dHcSGNWsCNlmyZaWInePjS2m2RyfAgwth2RqxSkBVzq3utEq6S5XFhPDshjW23Dis=
X-Gm-Gg: ASbGncsuVwGuM3GEdWkd4EwjQw3jRfRIj4aK50cB8MgtLbzx6Wym3Tlx+uZod3x08Sl
	bIfKgcLh9hMB/DNGuzdtvAAIzAXUS1rLJpnWKPoZS8DoMYzotuMadiE3BAPkrPbRxih1RnTa9EU
	sv9zEyweJDulxl4IjxYFOQVtqYUwEZ/8RK7hemFQWUaX4lPuxf5V+Dd37MGN5yLzvooppXZbSDH
	cb7Vk489x1qqSYcv7rs0G2goP5X8GevYrfchgtXUhs7js9Zwrb4PfBTgNY0mATj3Il6PWRlVJY5
	YYh2xaWAEI45IiroNJZxqE+72Isjk+ypZx8nfgxZTyhwCMIQz63WEmTiO4QYRAGvs/2gf+n9BnN
	r6tf7Stsncm8ZnyC8mly18QiwkZSdLD/FIJbgodHlNB5Dw2s+RVCaZdmT9NbU040Ygf7/vKWnDN
	/ufkSK7oXSwceDA/f3tNmGOWHMK5Y=
X-Google-Smtp-Source: AGHT+IFKo/O79Io0+uRDFxUtJz1dvwc4fUBNTtl0a5vuuzbIOA2sW+cayD8+0hP+Jrhv2ADqtpK2hA==
X-Received: by 2002:a17:907:d86:b0:b49:5103:c0b4 with SMTP id a640c23a62f3a-b50ac5d07f2mr831965466b.56.1760004634280;
        Thu, 09 Oct 2025 03:10:34 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e77427sm1905317166b.36.2025.10.09.03.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 12:10:33 +0200
Message-Id: <DDDPKMMSAMJR.1JIQMK3W2Y40V@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 VTOF_LDO_2P8 regulator
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Marijn Suijten" <marijn.suijten@somainline.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-2-5a45923ef705@fairphone.com>
 <ac1c0d1a-36a9-4542-b879-06c017f7f2c4@oss.qualcomm.com>
 <DDDOF3F8K5WQ.FTJ0F6E6DLPG@fairphone.com>
 <8e452e51-3a95-49e6-91e3-53aa46fcfe2e@oss.qualcomm.com>
In-Reply-To: <8e452e51-3a95-49e6-91e3-53aa46fcfe2e@oss.qualcomm.com>

On Thu Oct 9, 2025 at 11:22 AM CEST, Konrad Dybcio wrote:
> On 10/9/25 11:16 AM, Luca Weiss wrote:
>> Hi Konrad,
>>=20
>> On Wed Oct 1, 2025 at 10:30 AM CEST, Konrad Dybcio wrote:
>>> On 9/30/25 3:57 PM, Luca Weiss wrote:
>>>> Describe yet another regulator-fixed on this board, powering the ToF
>>>> sensor.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch=
/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>> index 36d5750584831d66b4c2faf6042e4cbb3274eca7..0a64e5721e092d1f3e4bb7=
329335704eee567761 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>> @@ -195,6 +195,19 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
>>>>  		pinctrl-names =3D "default";
>>>>  	};
>>>> =20
>>>> +	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
>>>> +		compatible =3D "regulator-fixed";
>>>> +		regulator-name =3D "VTOF_LDO_2P8";
>>>> +		regulator-min-microvolt =3D <2800000>;
>>>> +		regulator-max-microvolt =3D <2800000>;
>>>> +		regulator-enable-ramp-delay =3D <233>;
>>>> +
>>>> +		gpio =3D <&tlmm 141 GPIO_ACTIVE_HIGH>;
>>>
>>> You may want to define the pincfg/mux config for this gpio too
>>=20
>> While I wouldn't say it's not good to have it, there's plenty of GPIOs
>> that have no pinctrl for it. Downstream doesn't set anything for gpio141
>> either.
>>=20
>> I honestly wouldn't even know what the 'default' for a GPIO is in the
>> first place, or could I query the runtime state from the kernel? Is
>> /sys/kernel/debug/pinctrl/f100000.pinctrl/pinconf-groups trustworthy to
>> solidify this in the dts?
>
> I normally use /sys/kernel/debug/gpios

Oh, if that works at least the path is a bit more memorable. I needed to
check quite some files in this directory to find the correct one.

>
>>=20
>> 141 (gpio141): input bias disabled, output drive strength (2 mA), output=
 enabled, pin output (0 level)
>
> but this seems to be formatted very similarly if not identically
>
> Generally it reads out HW state, via (among other things)
> msm_config_group_get()

So, you recommend setting a pinctrl for every single GPIO that's
referenced in the dts? Shall I send a patch to add all the missing ones?

Regards
Luca

>
> Konrad


