Return-Path: <linux-arm-msm+bounces-89709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C26ED3AFAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99A84309BC29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A3E38BF83;
	Mon, 19 Jan 2026 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sDA2oJMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC1C3596F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837949; cv=none; b=M6j1zFN1F9Gbj93qke/nG6zxYKRTBN+OwgDpYUbDfjNF4CgjVC+OZRdwvTwgr5yZ2FQt3NnNciTXhCAbvn3AIQgwZbN9XAkDjULfmhBhRe182apTmdE4kLQPDwR3cPUmeC1ZSjku8+G92apv8vJ506olIISwAiEFtoFLPIcOZ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837949; c=relaxed/simple;
	bh=hmFWkaNjPJg0ioPLpbxNfZVs6zemNfl3UQ9lpEvUopw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=tJ9jBeWVdDeA/3tU20zSr0FeUq1fI2ATE3LZKHqc73rejorjpn3MYpAvg8OvoC3Yy1OQcBJcBIS28XMppkF1Zj7ZZELYd9I1WX9UzFDBGy4IueG2Yr/V7OCBfjV+AAKaaye93/f8Kun4QS0yoZwGfsMBHcz98VrvTJJxyMUlMvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sDA2oJMU; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so778472966b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768837945; x=1769442745; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydzLNmqrNw79cznaWxcj/vU4qCKsfInZqdkzuOLukEY=;
        b=sDA2oJMUN0WLSPzOzyP+whoU+Mfyqsz4btnURPSZZszzL79YJPr4lNqtAkhuOJXziZ
         iHbq40ya5d6jt2cTKgmU1xrRvwbJmIgvWL/01iT5A35P1AL6nJaA6xgxk73Q4v6nwP/w
         poGBTBfFFYf7x3DKlQUe0XFF8FQEADES5r3dypoX2FPoiGVD7f+x1m5cHbLUtOwLS1vX
         c0zBIELGJDlESedyPaOqi9mLP9psfWEt4QA+4SQbv4AxKyDwzBbs3vo1wkzayb4OsMKK
         fXm+0X5g2fMKROOZUKteRUeDgg5VNAz9iKes7Ak9pz8SNLU7f7k62HdethtIA0Oh76uF
         6xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768837945; x=1769442745;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydzLNmqrNw79cznaWxcj/vU4qCKsfInZqdkzuOLukEY=;
        b=wCi7MEPW2fN48xEsocnbszzTeneja6bPfBX0mjYrG29zREULVTxqYnG0yJ10NW6uPK
         dBPTToC7K+B61r3hRS4ePn+D45zlFH+C2I4pZKN9WfpFwsn9m8qOZV8ktF/vFq/3cnoU
         DoWOQ5SxYTclFD2YAdhRz3Ev7iGy1Ec9oXfoiEorccYQ/jQ1GlQDtm5O0i+fKfJGBhou
         /SNHWK1q9RbQwW092U6yoIfGn3zuDU4G4ASkFSWcPdFfnZaoPk9JtAOlDA3gJ7py8ql4
         koM4htkU0ThpnF/kBqwNz5R608SnqQXDJm5MsTMY80f128gqs6Ih4GKPpKaKMWlTYg+K
         1KaA==
X-Forwarded-Encrypted: i=1; AJvYcCVIiGNi7btumgeeUqfn8G0dcKFDw/Ml7XF6DAIqYCbgmxhafErK7A/tfXGbmhg2KmkJ2tc56ltFyxtSc2GL@vger.kernel.org
X-Gm-Message-State: AOJu0YwSC8FSCpQrvS3/IWwUGKYxOubQjt1SydejosdjH7HPOm6gkOma
	BeBsPQsDhEGFZgZiyX7qyEF1hN3qBMps/35FOf7N7XJSBKLBxzvrV29Ln6tkMPQUo/0=
X-Gm-Gg: AY/fxX6nZcupfDFOAT2eI7VXKNQpRlTzIoSYWFtl/Xg1wDeP4gWJpDDZh7z9iK9qp3K
	hICcmt6SHQ01DHUPXT8nF6OsV9RFdf1I1b/hBSAH29HbHuMtmP3Zx4e8qunvE8i1N7yxduTJ3Fj
	Fs+r3wllk2upRj1+MwJcX4fvqAD8eZ8v6+GfX+Dab7Jp0GgyUWJUzj+gSK484aUr9USYLo0R7Rx
	fU18VUntct6auWDwWuzFAx8a6EIG6UMGnS95MZ5dWOZtezmrrH4Q2m+y00z+6JIVfNXDbK/vY47
	bqRps41smwOgeqPzMFOfPS++WpfG6d92k3mqoGYhmqK0FGVqg3Y6caZgl9Ya4XZMVmlJbBSdMwe
	nN6TsRVzW6Bx94Coddk1rYpqZuunJH32UozLZRl7lsWmuYP/B0r3Er3AbCPVX9KBewydHQ4n6SZ
	Gv15eMb1ixt4+KzBD6MLs77q68hSB4CiouIaMhBvn0lqm4P6P7S3XYkEklr+Bucs4WqQE=
X-Received: by 2002:a17:906:ef05:b0:b87:1064:4ea1 with SMTP id a640c23a62f3a-b879302d388mr921496066b.65.1768837944673;
        Mon, 19 Jan 2026 07:52:24 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9fbbsm1159645266b.38.2026.01.19.07.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 07:52:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:52:23 +0100
Message-Id: <DFSOPXFSOUY2.2Z6XCLCD796Q@fairphone.com>
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
 <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>
In-Reply-To: <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>

On Mon Jan 19, 2026 at 3:41 PM CET, Konrad Dybcio wrote:
> On 1/16/26 3:22 PM, Luca Weiss wrote:
>> Add a node for the Hall Effect sensor, used to detect whether the Flip
>> Cover is closed or not.
>>=20
>> The sensor is powered through vreg_l10b, so let's put a
>> regulator-always-on on that to make sure the sensor gets power.
>
> Is there anything else on L10B? Can we turn it off if the hall sensor
> is e.g. user-disabled?

It's the voltage source for pull-up of sensor I2C bus (so
ADSP-managed?), DVDD for amplifiers and VDD for a most sensors like
the gyro.

So realistically, it'll probably be (nearly) always on anyways. And I
don't want to shave another yak by adding vdd support to gpio-keys...

Regards
Luca

>
> Konrad
>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index 7629ceddde2a..98b3fc654206 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -32,6 +32,16 @@ gpio-keys {
>>  		pinctrl-0 =3D <&volume_up_default>;
>>  		pinctrl-names =3D "default";
>> =20
>> +		/* Powered by the always-on vreg_l10b */
>> +		event-hall-sensor {
>> +			label =3D "Hall Effect Sensor";
>> +			gpios =3D <&tlmm 70 GPIO_ACTIVE_LOW>;
>> +			linux,input-type =3D <EV_SW>;
>> +			linux,code =3D <SW_LID>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +
>>  		key-volume-up {
>>  			label =3D "Volume Up";
>>  			gpios =3D <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
>> @@ -316,6 +326,8 @@ vreg_l10b: ldo10 {
>>  			regulator-min-microvolt =3D <1800000>;
>>  			regulator-max-microvolt =3D <1800000>;
>>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +			/* Hall sensor VDD */
>> +			regulator-always-on;
>>  		};
>> =20
>>  		vreg_l11b: ldo11 {
>>=20
>> ---
>> base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
>> change-id: 20260116-fp6-hall-sensor-1049f2f872ac
>>=20
>> Best regards,


