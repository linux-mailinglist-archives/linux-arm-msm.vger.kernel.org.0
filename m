Return-Path: <linux-arm-msm+bounces-75646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480DBAFA27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B16F51941957
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6C927FB0E;
	Wed,  1 Oct 2025 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jXr4/wlO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E10284681
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307436; cv=none; b=R8ILt0Uwp3bXJG3jnPuzZMQXDT6/2b9nwwZ+bI/TOlC7FEJV7tGgAaphvFe+9FYHYnYIY2oDRe+AgWdTAb81IysFuChhlp2NG3Y8NywWhKsIFDdLo7rpouRbgP6MN/Wj0pCxM7C1UpsWywJI7lS6pVj8DnPQ2rYLqDB2S3PQCtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307436; c=relaxed/simple;
	bh=aTV9DJ4X7CNRdvh2CbVxN/SzInF2XKP4CHkbj/CtYyI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=pqyuZyl3hemq90vHED72s1uZNaDAqK44iBszp5YBJ44yLSkMmQpa6K4VciUx9tYWdjm/4CHb1WelSgluVgRygf8o6fQXPND5EVe4nVei4Z3IxLzsxIYnsO+6Tf7rKRCZTVb9dSKRfIHpGRTc2k6D8wUFWj4/9GO3XfaHC988wz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jXr4/wlO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7ae31caso1023780866b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759307433; x=1759912233; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sp5MBlUIUhjs/PyEtVVLwD5jMkZMg5ArpTjJ0W4Ld0=;
        b=jXr4/wlOXPJxJVUtIidlhK0+XB9rgQV5Ai1Op2CnCYjL6+RGJwFnfSQlxEQCrkzrRd
         kU2RH1w8yJjR0u5BfNTtqpA+XqHpFC/a53srwMkx5I3guA6Xkxz4+SCvomLZN99W1j6C
         D8vdspdxjUvTMyOh9LnQEvMwHSulpVpq6Ejf4ledMzE4nPcXD6n2/BiZQ362bSIhJSjZ
         fXrzXugNEx3y0piasPKI7GBe+HHwSXGTnfaWBwBcTxTgcuNJhtCTGEtfE+Ev0QUwuTWN
         78sjxRuiWXu1laj9GWbwsZfupMfc9hqtDtzmqv228uMGr+se+fVf5aXIc3yWBnTDZFlu
         5KDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307433; x=1759912233;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4sp5MBlUIUhjs/PyEtVVLwD5jMkZMg5ArpTjJ0W4Ld0=;
        b=ty+Zx9LbbdPFtAvqzolFnXifgFTm5o7spaXMSbAwDdHDtosT4E9XDXDs3WjsRuvX64
         /t9kNMB3ASXPuap7H6hylwUB3Jl4uiyuxVboOBPNlyRkpC/qQA2nQUOkF4F2hf3+1BOY
         AlKxr34ywSp52es2luyErPGrFDRsToJqzOFXORPKknRwxApctKgDBgXmn0lCXSRcGusH
         w1xYRpnoIRyiZdMowTSeNOiDZpG6EOlSQ5suaElhpTjCIgU0itojF2VQ91htEijMPcfW
         gdaaaIe8NfmMQgGvHA0UIadhXkePM9C7/gNNDECTM9vB6iLWN7LIO4q7yBovEt6A9IRL
         8eig==
X-Forwarded-Encrypted: i=1; AJvYcCXqUXSO4c5EdqxUO7a4qAZBGsGqx2rHCnWRFFV1b92Z/B0voEg+91uCMY2TfADlZIxwMN703OhHraeUVbg2@vger.kernel.org
X-Gm-Message-State: AOJu0YxoZMZwtD6Siuyv/RQF8PsyFWcwKvh1GoJDjZ/XoYVW8T/QQb2Q
	H4wup8PMm+pTYugW35BnmP1sb5ltkBl6mIhkSvmYs34D+F6tt2SedPTMOsE6lIJG8sU=
X-Gm-Gg: ASbGnctdncsO0YXqCaPth0J4SZnV2lIBWJmWmTJ39UzEP1M88HSUnFVu6qvtZg6pqYc
	x+UETFWBGBMuZ093VN4OAnYAVH3vE3h1CNlVykonk6M45KpNXU8e21EJVayJFijPJ/7kKIyjDeR
	EPZI208IyNc4pmYMPM95aRf6PcNClmzabcy4BV+GzWDvsuZp61fPdEm347ONKQLO3YuU5Vapbiy
	LoGd1huf2ogy6tP1MX40QOS96h88bKVPNd3xL+K2N3cqAJmuhyITGPksSfabP/FD5kT/Pto9orJ
	8f3fHLrbH7jHNW8ySfbyemQUNYh3rOxxWClbSoLUVhoYHJFXpGnhFAc9XuPL+SoD41EIU4UkSQc
	sH1y+6aBptkhx5uJWi5dRy+XNEQk1zy52ulFrGdfHAI0p6FoFEsfiu0hpEYCf3PlfS+bZA5vo0n
	lufMS5jUK5cUdVk9L2
X-Google-Smtp-Source: AGHT+IEo+e2rUvArQhzF5eV5Lh+i9AY1uOMcpk2GIpqm4c0ralkRiKHWzmcmVJzcPnQvOl2COH3sJg==
X-Received: by 2002:a17:907:9709:b0:b42:f7df:a2ec with SMTP id a640c23a62f3a-b46e4b8f700mr308378766b.9.1759307433006;
        Wed, 01 Oct 2025 01:30:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3f1b54c4fesm566437966b.86.2025.10.01.01.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Oct 2025 10:30:32 +0200
Message-Id: <DD6UFOT1KRFG.3M6QJRGYRAJF9@fairphone.com>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB
 LED
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Casey Connolly" <casey.connolly@linaro.org>,
 "Alexander Martinz" <amartinz@shiftphones.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Luca Weiss" <luca@lucaweiss.eu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-5-7fe66f653900@fairphone.com>
 <fc5d2d9c-7200-416f-ad89-4c1907e313c9@oss.qualcomm.com>
In-Reply-To: <fc5d2d9c-7200-416f-ad89-4c1907e313c9@oss.qualcomm.com>

On Wed Oct 1, 2025 at 10:29 AM CEST, Konrad Dybcio wrote:
> On 9/30/25 4:32 PM, Luca Weiss wrote:
>> From: Luca Weiss <luca@lucaweiss.eu>
>>=20
>> Enable the RGB LED connected to the PM7350C (PM8350C).
>>=20
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 +++++++++++++++++=
+++++++
>>  1 file changed, 27 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm=
64/boot/dts/qcom/qcm6490-shift-otter.dts
>> index 36cc67469615974c193ea3a9db1b2362869d56bb..b4c69dc50ed0f0b3cb45341a=
01c89210bd261993 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
>> @@ -632,6 +632,33 @@ led-0 {
>>  	};
>>  };
>> =20
>> +&pm8350c_pwm {
>> +	status =3D "okay";
>> +
>> +	multi-led {
>> +		color =3D <LED_COLOR_ID_RGB>;
>> +		function =3D LED_FUNCTION_STATUS;
>> +
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		led@1 {
>> +			reg =3D <1>;
>> +			color =3D <LED_COLOR_ID_RED>;
>> +		};
>> +
>> +		led@2 {
>> +			reg =3D <2>;
>> +			color =3D <LED_COLOR_ID_GREEN>;
>> +		};
>> +
>> +		led@3 {
>> +			reg =3D <3>;
>> +			color =3D <LED_COLOR_ID_BLUE>;
>> +		};
>
> I assume you managed to confirm these mappings are correct.. sometimes
> they are not what you'd expect

If you mean, that red =3D=3D red, green =3D=3D green and blue =3D=3D blue, =
yes. The
RGB configured from user space matches the color on the LED.

Regards
Luca

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


