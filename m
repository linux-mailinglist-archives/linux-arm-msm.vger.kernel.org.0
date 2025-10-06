Return-Path: <linux-arm-msm+bounces-76025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B46BBD7AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 11:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 712084E3DE7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 09:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FC61F873B;
	Mon,  6 Oct 2025 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="a5mSsHUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CC91F4168
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759743879; cv=none; b=XR8/jDvmrz8rh5Pt8SAqJXULk2+VTFQsYiLagol6O5OzDfOKylpB/TaoRqIm7upJweTt34zzxDtWUa7EdQcPtDS9rbwnWaxJyR1jiDF5F+nu2LY5pr6CiWEcps3PXm1sE+FcQ6C6LeZfCSZ+Jfavox+pO5xntrkiIGvpjPFW8vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759743879; c=relaxed/simple;
	bh=MvXtf65bnEuClKbWJkEN8SYPRB0VB5jdN4kz//IO70M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mrfDSBwu69nKB1LFWTQFN4xQq5Ua0zSqenlLtLEj7UEcC44dzW//OllOjutjwaiCAWdYQvlmhSedRT87XUc6Pj0t7BGPZxNL5PQ0tJ0vibD2catyWiijU3vtA0TQD+23nIgbHn/Z0N7dzg+CpBahcmaRZFRe4iuBBLcrGTVMFNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=a5mSsHUA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42421b1514fso2171181f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 02:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759743875; x=1760348675; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CcE947gZ6W0sbf7VvCWTggrTIyTkHIFkzfAcLajFas=;
        b=a5mSsHUAfVXrAdz0NQmYHe8SrWX+c5qkCcozMg1TZewplpKuSVHgqnpz3CQBpubum6
         fIe1TSccmcNGZByoXPdJbXaFvIKCsWONbGlGk5rE+33z/vhCmhhGmRcKuWLuACrOCPLz
         8aY6Ye3R4Q59TzNYc/ffc2KL1fXNAbDFVQkP/46Bz5xiWSV4pNYi2tHwEphe+hfGzIUD
         NkAkl0MzJdvqdhuwdIOdi3E0XVtVCX5PQNYWa6Tuiy6Hb7sSbHiirar45gAVI84FTynG
         aIb2eOpwr9qEqDwA8rfBtytXraBewejQewHp3cXaAZSFCnTfxF7k9deYJv99OSQL6mb2
         ickg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759743875; x=1760348675;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7CcE947gZ6W0sbf7VvCWTggrTIyTkHIFkzfAcLajFas=;
        b=u7fYwPekV46V88EKoJTGvYmvdMt69It9XWv8b4Nas63yOIcotAuye1UuLmfuGyQ0YA
         g+S1wPzN/kRTJ7ACpX5kdUgffRZymX8DLHP7Alxtj87dkaSG4K8ATjir9LEocPd7sgcy
         ZY560Cu0iWGm+Ii+8G5B1NkNUlKccFvBJZDg8LaTz66kYCboWv1OCtQcH0hNtlbZaEFu
         cyW2p8Y/CBBUN6vQhdp0bKQNfjxEMDQcMvIScePISF8KKBKhNj6EvN28uDTve4oakDN/
         1bZcTAQGLdPCwHm7TtlLiLkLodwe7+qS93jQMQmIT9XWhruAvb3Xru3dSfEOol7+Cm1O
         BX4A==
X-Forwarded-Encrypted: i=1; AJvYcCXBWLFj1fQaFSpQggXW/cBu1CfyiiaPP1224zrfAdD8WSFXgcrUsLs4n8FB/Uwcv5vKVInA775yyseR3MgW@vger.kernel.org
X-Gm-Message-State: AOJu0YzYPDqpzSlDO4Br+7HhTlakDrw186QaQuZPhcsvaaNCnR+a5STq
	iKecMobERgx7iireWhVAPB/2WGEwtytd1JB1vhBlJoIw/Msx0SKr6m5ufEKQkpOLAn4=
X-Gm-Gg: ASbGncv4if7ooVEUnKj4zl26mXBLct8ZpMPQNl40/q+Jn6o1H/WOyuCXQz97AxB2XY2
	kqIN/Fz3kFpibiVgQU04s5M886DThimKitycdVSGl+HVj0klYh1u/bwwicDHYTr6ZrT+bVHtG6N
	Jnj+tj9fGD2kVWIOWWXqewhodpt3sqT3Dku22MTFCNdcroQpCrYakmYy1yJtoccoP0iT8rw9UHU
	825KWVT1xY/9F3PVNtfgroNxaL7+Zdnq/0ap8mN0OoFHvRx/gJpwykcyjBp4CDVhL6Pf90CJIk2
	0I/4JA/3zTvl+sdSCfTdTV3Uf/qZ1T+ZYADDVBlx+tGzDBcBymxm4uyKX6ulI0leyYRfBndPNxH
	72ZCJ5MYHiZpjAwlcnmbgd92EkblHBkyfjyUyUfasDEd2LF1Fx1dvOa5kznrZXByAKvT8wjPr3T
	CDnZOZVjvw9mY=
X-Google-Smtp-Source: AGHT+IH9WtXT37tlC5B2tzxDbJy1Vvge3ED9gBQtVklsT4u+uNG3AW/fSGCPppGvpB9zN4GOAz+5Sw==
X-Received: by 2002:a5d:588e:0:b0:3ec:d7c4:25d5 with SMTP id ffacd0b85a97d-425671b27c6mr6490559f8f.50.1759743875402;
        Mon, 06 Oct 2025 02:44:35 -0700 (PDT)
Received: from localhost (pekko.lucaweiss.eu. [5.180.148.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c4dd9e4sm137604575e9.10.2025.10.06.02.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 11:44:33 +0200
Message-Id: <DDB553DRF89P.15C4AKUO7IQXH@fairphone.com>
Cc: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam
 actuator
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Griffin
 Kroah-Hartman" <griffin.kroah@fairphone.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, "Daniel Scally" <djrscally@gmail.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-4-c305328e44f0@fairphone.com>
 <dfc093a1-e13b-4342-9015-5a896bf18d5a@oss.qualcomm.com>
In-Reply-To: <dfc093a1-e13b-4342-9015-5a896bf18d5a@oss.qualcomm.com>

Hi Konrad,

On Mon Oct 6, 2025 at 11:20 AM CEST, Konrad Dybcio wrote:
> On 10/2/25 12:15 PM, Griffin Kroah-Hartman wrote:
>> Add a node for the Dongwoon DW9800K actuator, used for focus of the
>> ultra-wide camera sensor.
>>=20
>> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/a=
rm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> index 2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47..0e86cd5ff527925c7dba15c4=
e0ee5fc409fe4ce6 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> @@ -627,6 +627,15 @@ eeprom@50 {
>>  };
>> =20
>>  &cci0_i2c1 {
>> +	camera_imx858_dw9800k: actuator@e {
>> +		compatible =3D "dongwoon,dw9800k";
>> +		reg =3D <0x0e>;
>> +		vdd-supply =3D <&vreg_afvdd_2p8>;
>> +
>> +		dongwoon,sac-mode =3D <1>;
>
> This property exists, but isn't documented (you need to extend the bindin=
gs)

Please see the patchset this one depends on, which adds dt-bindings and
adds prerequisite driver support:

https://lore.kernel.org/lkml/20250920-dw9719-v2-1-028cdaa156e5@apitzsch.eu/

Regards
Luca

>
>> +		dongwoon,vcm-prescale =3D <16>;
>
> This property is neither documented, nor consumed by the driver (it may
> or may not matter to you, check against what your presumably-BSP driver
> does with it)
>
> Konrad


