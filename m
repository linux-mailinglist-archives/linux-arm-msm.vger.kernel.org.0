Return-Path: <linux-arm-msm+bounces-42783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD359F79BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 11:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AA8916BF39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 10:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA68C222572;
	Thu, 19 Dec 2024 10:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="v8tKGaBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E007082B;
	Thu, 19 Dec 2024 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734604860; cv=none; b=NJ+evKJV7GJ3Ew9gfxJgW8370XZJ7rdulEm91uDsITJlB+KBXWfmVALpyMvfSksXNotqZ7sW6gC5SD3LZP6+mr04lJbbJvMsAQI7UzUn6rX/hTlc3zrnpM6mUE4TT8zR0DUK80moN6n56ECMlm0liFzrXY6JtA4AsSGZdDKPdYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734604860; c=relaxed/simple;
	bh=sMmdXymz7YBaKYiiSjGtpcZAn3DO2EPLGhJWt9/xVHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ino2gqbp3nqaq46Q2pG3wXeJ++8ZnNM9KCBFlAoqCH3vEWF4zvBP8s5pE0uIUR8k941NCG2u0DJ76chKmtDeGRM31AgMwbX3FhURMwItior3GO9FqrCwZ0NjKy1gDqA6lrvS/DVWWZCWmhlLhH01+8Qr6RPsvzvghu7EEFRKPUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=v8tKGaBc; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YDRkY6zxgz9tR2;
	Thu, 19 Dec 2024 11:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1734604486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78YyZL7HwCmFSfKx6pbGoLu1tuKjrws9Qj/TkgO1sZw=;
	b=v8tKGaBcZjnrQdikmO5urFf9XX0JUnKPbRV101dEp7+Mwn287U1QrCIpwCs4ks4Qato16d
	bD1zAIJ3gIFV+Zs5tFMKAUCU+2kxjdNKUxVK2JGt8wOi/TM/2SxjKsdKRmWKjXxhm5Diiu
	9wuwY97yw60KmWrKP/Obr0bj7Ou6EH3HclwX6op7dKeCFEr7LiDh588kJeL6UJcvlzZ7iT
	YlTn8EIFrjkXN4N7Ek6Mifdq04a3LK38Va+FcOGlE+0fPeTcJH5Eh9tIFKqcc0XeIKU//F
	LvG1ZL7/v1WmCIMNrMFjYP3uv8/Ajgr0QmmzUgquC1Pj/GFCwDmawgcV6Fs1MQ==
Message-ID: <1b163b6b-3c33-4361-94be-6b8a6d0febe8@mailbox.org>
Date: Thu, 19 Dec 2024 11:34:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid
 switch
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cae52ea6-e86a-4b86-af06-01a8a93d2ca0@mailbox.org>
 <CAO_MupKCUk-w4=-0yDWo4m9XC1-iEuF6YHYnYw4T0oF2aKFxvQ@mail.gmail.com>
Content-Language: en-US
From: Anthony Ruhier <aruhier@mailbox.org>
In-Reply-To: <CAO_MupKCUk-w4=-0yDWo4m9XC1-iEuF6YHYnYw4T0oF2aKFxvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6b20eb1586719c0b27b
X-MBO-RS-META: y4b7ubqimznr7ji8ukj83ewm17i74cgy

Thank you Maya!
I'm sorry, I realized that the patch format is wrong due to a 
misconfiguration of my mail client. Tell me if I should send a v2 of 
this patch fixing it.

On 12/18/24 10:36 PM, Maya Matuszczyk wrote:
> Nice to see it finally working!
> 
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> śr., 18 gru 2024 o 20:02 Anthony Ruhier <aruhier@mailbox.org> napisał(a):
>>
>> Add the lid switch for the Lenovo Yoga Slim 7x.
>>
>> Other x1e80100 laptops use the GPIO pin 92 only, however on the Yoga
>> Slim 7x this pin seems to be bridged with the pin 71. By default, the
>> pin 71 is set as output-high, which blocks any event on pin 92.
>>
>> This patch sets the pin 71 as output-disable and sets the LID switch on
>> pin 92. This is aligned with how they're configured on Windows:
>>       GPIO  71 | 0xf147000 | in | func0 | hi | pull up   | 16 mA |
>> ctl=0x000001c3 io=0x00000003
>>       GPIO  92 | 0xf15c000 | in | func0 | lo | no pull   |  2 mA |
>> ctl=0x00000000 io=0x00000001
>>
>> Signed-off-by: Anthony Ruhier <aruhier@mailbox.org>
>> ---
>>    .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 38 +++++++++++++++++++
>>    1 file changed, 38 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
>> b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
>> index ca5a808f2c7d..311202aa9015 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
>> @@ -6,6 +6,7 @@
>>    /dts-v1/;
>>
>>    #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/gpio-keys.h>
>>    #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>
>>    #include "x1e80100.dtsi"
>> @@ -19,6 +20,21 @@ aliases {
>>                  serial0 = &uart21;
>>          };
>>
>> +       gpio-keys {
>> +               compatible = "gpio-keys";
>> +
>> +               pinctrl-0 = <&hall_int_n_default>;
>> +               pinctrl-names = "default";
>> +
>> +               switch-lid {
>> +                       gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
>> +                       linux,input-type = <EV_SW>;
>> +                       linux,code = <SW_LID>;
>> +                       wakeup-source;
>> +                       wakeup-event-action = <EV_ACT_DEASSERTED>;
>> +               };
>> +       };
>> +
>>          chosen {
>>                  stdout-path = "serial0:115200n8";
>>          };
>> @@ -811,6 +827,28 @@ edp_reg_en: edp-reg-en-state {
>>                  bias-disable;
>>          };
>>
>> +       hall_int_n_default: hall-int-n-state {
>> +               lid-n-pins {
>> +                       pins = "gpio92";
>> +                       function = "gpio";
>> +                       bias-disable;
>> +               };
>> +
>> +               /*
>> +                * Pins 71 and 92 seem to be bridged together (pin 71 and 92 show the
>> same
>> +                * events). By default, pin 71 is set as output-high, which blocks any
>> +                * event on pin 92. Output-disable on pin 71 is necessary to get
>> events on
>> +                * pin 92.
>> +                * The purpose of pin 71 is not yet known; lid-pull is a supposition.
>> +                */
>> +               lid-pull-n-pins {
>> +                       pins = "gpio71";
>> +                       function = "gpio";
>> +                       bias-pull-up;
>> +                       output-disable;
>> +               };
>> +       };
>> +
>>          kybd_default: kybd-default-state {
>>                  pins = "gpio67";
>>                  function = "gpio";
>> --
>> 2.47.1
>>

