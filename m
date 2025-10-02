Return-Path: <linux-arm-msm+bounces-75815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A877BB3FE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 15:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C0E32A1208
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 13:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7B330E827;
	Thu,  2 Oct 2025 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oNSIoVly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBD42FFDFC
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759410858; cv=none; b=LXHY4tdWRoJZHkZZv41A+gSDyELmwcPvyMCHTLNjMsMP7Mg1c5qKKNX+Zpky57M5w5m1Ui4Jc5OGTPUILf45b527eiYHImQAWshSBQ2IMlcv0uwuLRWK27KawngV7SUnZD286+7Q/XemPwa3Pr6nTPDak0CM1KS2hsV+kbrOLxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759410858; c=relaxed/simple;
	bh=abn3PG8XEoGYwcyzS9IOIA5hdgX+qSfZsqs7WVvuQUk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eKv8KASppKkLKn+eTc0duVqRB+RMapAfRzFc3UaBxS/mPbmEGwV+ioljAWUnuzxkiqwDY6PKp5isH4D6tvROJ1a48lZpVLM1vnqF38vqcfwOoyE+KnotvCklbAuPWxB4DeXJ3RHE5RFDCt19mtsPoRqZeQPto8VjhrgBUf5rSjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oNSIoVly; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7a16441so179768966b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 06:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759410855; x=1760015655; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqfTggLDM2JL6k3wlUbLdqaGH8N69rA5/6pVtkxsZXM=;
        b=oNSIoVly8WAY8ECxlj73sDNml9qZPGLVVqB5sn5bHKVtZlVyfyaGy6bFKQz7ObjVry
         sDN2p0Ro6RMNzLgr17wcuFSrylh1l1POEvR1fuRhyWjbhrHnj5CilepQoBa+W3ZgDA4B
         D0m1f+l9VomdMHfHTaQLll7rify2cX56m/kFWPvXc1C6SCqnn2D1h3swKWA46m6eeeKz
         kI79JorICoNLqz+95+iWGI5RdIeeoZ6+nHZ2KB1A/+Cz2d8orkIRJpaaN3GqRV499Fx2
         R0M5SyPhxbeT7ErZ6fY2gy/j2Hg9OUihC+TQf7Gi05rlSUmRPX3xRxL8CIjOf9SyMSRa
         yESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759410855; x=1760015655;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yqfTggLDM2JL6k3wlUbLdqaGH8N69rA5/6pVtkxsZXM=;
        b=JyIV45Hs/ca7ZgDWRMVWgk+LVCwUWFyOlCXaOrXR3py++8cLx3vGmwRHKubfRS672B
         lKVlSPiXk90mif4DX4GvjYvG2yDxLKnfb5IfQX/d1yFYCBXTUPvPxf/sKBIvzr/znmbN
         CpnJoRHnx/OcTqohChZaVdonSKMmUXTdIUTqoCNJxDhcmZnpO1KTq/ENheI4RkVm8d2M
         8m92rvJmDgU6aaNEgRe+C4nUL/uai2RW32eXlZbWzj8lgoygUeaETOQoGIpqRW8dBXlT
         8RUZW3qLEuY20pSB5J2NidoguO8nUWarc4+6V0Jg7E0FlliQpMnM9iI2XD+S1EYgi9bI
         HdWA==
X-Forwarded-Encrypted: i=1; AJvYcCUCKRIgcm6MPK+vcs69/gjYRYZUo80EbItpQg5TNu3c9/E+BFa6vy1h85bcOzs7LLXhxzLJy6T3OSiBOUGt@vger.kernel.org
X-Gm-Message-State: AOJu0YxoIo8a32e3AJE9oHDoUCgOBLegzo3ibxDq67DOb/kjqdVDaZ/L
	dbmufWobhrkUMOYyfBdpzAlUCJPs6WFWoZAxtJUigkwiN2Kjb4clSA5P3xB0KnZyLqg=
X-Gm-Gg: ASbGnctx7moH4EFzwhxRiekrg9Rf26bdEB2N86JHXWv8B6EJPHxRfk1RYh9RHdZW+MW
	kK9BkTj43yFOap3LRjUp9wOpgquh5DISTwFyUEmOJSXh/JepyR0MdeNq0sGXeoOgqdiWqsFC2ng
	pDEoU/qZx6Jot2v78sCB8xAbSRqbN840KdROxktiW00EnPT4A9D15462JNzUvWgEBFPlFJF5f76
	F4rg1d9qUYUnxgac6+20IS6tBlHaDWeFsmxh0eglD6+xPDhr+pfTO3uQ5+BrqcpNjXkaJzr5/LE
	qKSzbayxGGnMGKQ3GUDN/mH/wk+vDppO96/yQHc+rMzxe5G4fZFUyTv7GJPVmzTwX/RNEKiR/Nm
	9uOJ3l/P59g2FOZdUzwZQA2KPwTTGoS+6K2gCQfDpukVoH+ExNy1+3Ug0rLkWjiAb3MqScNxK5B
	+XPXRajewGdnFJverl/5L2BY1r+84=
X-Google-Smtp-Source: AGHT+IHdC79LilPtaS8UDTu8UX4x3ltn3xPSSVu5zWW7q/miLeA66hPm/5CSpLhwtBO8hi4Phex1ug==
X-Received: by 2002:a17:907:3e92:b0:b3d:30d8:b897 with SMTP id a640c23a62f3a-b46e1767bf4mr871148066b.14.1759410854778;
        Thu, 02 Oct 2025 06:14:14 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4d9f5sm210176266b.66.2025.10.02.06.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 06:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 15:14:13 +0200
Message-Id: <DD7V3G4RLB2I.QYT4BWT1LA5U@fairphone.com>
Cc: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 pull-up
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Griffin
 Kroah-Hartman" <griffin.kroah@fairphone.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, "Daniel Scally" <djrscally@gmail.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Wolfram Sang" <wsa@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-3-c305328e44f0@fairphone.com>
 <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>
In-Reply-To: <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>

Hi Konrad,

Answering on behalf of Griffin :)

On Thu Oct 2, 2025 at 2:45 PM CEST, Konrad Dybcio wrote:
> On 10/2/25 12:15 PM, Griffin Kroah-Hartman wrote:
>> Enable vreg_l6p which is used as a pull-up for the CCI busses, to make
>> sure I2C communication works as expected.
>>=20
>> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>> ---
>
> Makes me wonder if we should maybe extend the CCI definition
> (or maybe the common i2c-bus binding?) to accept an external
> pull-up supply, as this is a common problem.. (+Bryan, Wolfram)

Yes!

Unfortunately though this effort has stalled some years ago. There is
"struct regulator *bus_regulator;" in "struct i2c_adapter" already and
vbus-supply is documented in i2c-mt65xx but afaik this not functional
because some code was ripped out ago because of some AMDGPU regressions.

> We could then shut down the regulator when cameras are not
> in use, preserving some trace amounts of power.
>
> Or maybe L6P is already used as a pull-up supply for more things
> onboard and should be always-on either way? Could you please
> check that, Griffin?

L6P is only used as pull-up reg for cci0, cci1 and cci3; and as power
for stuff in the camera modules. So if everything camera-related is off,
turning it off is actually a good idea.

Regards
Luca

>
> Konrad
>
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/a=
rm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> index e115b6a52b299ef663ccfb614785f8f89091f39d..2dd2c452592aa6b0ac826f19=
eb9cb1a8b90cee47 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> @@ -749,6 +749,8 @@ vreg_l6p: ldo6 {
>>  				regulator-name =3D "vreg_l6p";
>>  				regulator-min-microvolt =3D <1700000>;
>>  				regulator-max-microvolt =3D <1904000>;
>> +				/* Pull-up for CCI I2C busses */
>> +				regulator-always-on;
>>  			};
>> =20
>>  			vreg_l7p: ldo7 {
>>=20


