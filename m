Return-Path: <linux-arm-msm+bounces-61434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 692F8ADAF12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36EBB1889C67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AB22E0B7E;
	Mon, 16 Jun 2025 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oo/LIOIc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B232D9EE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074644; cv=none; b=BhLMB97uXFv8QDnfTaMEkSBsbAcE9NK1P3HmTYH4o1DZHLQKyj0giY7IPGgMu/04selW+CO5+VUcY9Q0LWwt/Uw2O2naKQeE3nf75YpFIIXGN946uLCWTrExaJQcgD2ZMhvEDrZZ73+z5nfUKJlUwSz+btYOxIQ9WAuVOhBjcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074644; c=relaxed/simple;
	bh=2TXIdS0DrtcJ/aN3kEEgXsku4ahxNSy7vjY6kQ9nPJg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RQsts6l2yqIJJzEJnu7lTpSdNHDUalwKsdXp5Jn7QU5CGff+q6nK5mQEbGzSnXGzQd7HJVib0ferzAKESBwBr9mWlCgbylSilbHIekhZjEparBoFsvQgacycfLrSj5L1iTSMck82t1iqfs26iGhWh/b9Rbfw8cH2kbbOpTqpur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oo/LIOIc; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso655935866b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750074641; x=1750679441; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuSf6RLaP8+rHWDi/+Q9MWXI6iUycqZnVn3e8MQYPzQ=;
        b=oo/LIOIc2AQwaEDw6APuTipI/APVrhhgtlAsZ3ROG3hWKiqdKtvrC7/4wnuu6ST/gl
         4RUBfH7JWJ9IJDei/bjaou8yfr9IFsoIH/7C2BVWQOLFk8tfhay/OPF5NCpHn7HBN9i1
         obNRXcs04fi/1yLNYVMBcFqPcS/Y4RvLI/Df/4pcaqpjlgru9XizUAr94iitKLxW5IDL
         9oeXy/3A2yQq/oXUoPzPirRXVQb93Uq17BHJo0VHpvRWtxY8Txy3VToxSyQPp22tIKiQ
         IuZiDfQk7W5nKh0WOkH+oq+f7bFjXjvxfO2EJwtjtb18xV9ccIR5/cNr1vdpYyHjnYdh
         BmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074641; x=1750679441;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xuSf6RLaP8+rHWDi/+Q9MWXI6iUycqZnVn3e8MQYPzQ=;
        b=kUbA3qPxqO7XhVBtSrmDa9YJjO/Tr795YZQKN1y77C6J3erAiqayw8ElyN0Lk6SKMR
         coBofPb6Vxp/QuyrP6hLxjsyEYLMXGmzPOvOxDYvjX5ESDW9DypvyvUcr/LvLpYQuB0R
         /9TQ7mhDUT3yzNZ9MajsRplks2+6lA3vrOc09A4DwEAyWup6vEJWPwTSI4riTvSQcoeJ
         7OA013oBBhxvo/wdYVDp2/3G38A7ZlFrSGR5z423pkmq1/vMdXXPjGS6HtUsnMrDbIYv
         Iok1oIhlHd0D88QMre2fvICHh28qHJjgtMTFhBhpMJuMMz9RGRmIQK3Vx/mmOjLvEA/X
         DzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEc0gk5nbL4FcI83vfygbZpxSWsBErD0w95DYaIGRWbsHCDavN4/E9El9rPC4vwHY9759Ip7Sh/RKezUtF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlp5rj/1RTDJ898kZltHuUpgvuAR0yd0BFb02hNa/gVm+NFp2p
	e7D7MiCZKO9KmyHohHr7E6j3Zg/pPlLJXd6djwtDdV06wzqDoX8SACkbkId/wfJSHs8=
X-Gm-Gg: ASbGncuV8EJwebcvFmO1jT7z03BU3Q3MLL49kAmJbKKevjZyMlHD25kpOqQMxz37g+E
	Nvd5POPUemV8QKp2ZliHMEel1VCUPrK/PWp2p5O45dSAN1yZjxgUYbbeZBwmwbGljLNROl6g1vR
	x3ek+wKzYUXecB26nj/SKiIDX0i5WWR6VLgt6TvL/RxCVNmNzpaUeJf6Ysb4z/oFk5MMdSvbuMW
	/r5mzdbq5rSwMrrI7SlMAVE5eCNAft+sk22Prt0InD/Xivs+AffxpmV1MpsmZ9MN0CzA6bSJdmn
	Fn6kt8lgPs0KTJHR7x9BnffXPcM2ZjSeN7slKkShqSNEJaVJTmQ7P0dzadaGmNdIvTd1bLmPQyu
	b93vCDT9bYyBRCc6gIqTy3H2VkZY7kJw=
X-Google-Smtp-Source: AGHT+IEw/IbSDxrPrp5P71189l+YICG0EEl5mwsAYurOHLofD+R6bizDKSfCRwi4sa9axsT85oX+fQ==
X-Received: by 2002:a17:907:6d0d:b0:adb:2bb2:ee2 with SMTP id a640c23a62f3a-adfad451438mr946727766b.41.1750074640652;
        Mon, 16 Jun 2025 04:50:40 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88ff5d3sm657753466b.101.2025.06.16.04.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 13:50:39 +0200
Message-Id: <DANXOMLSCTUE.149W1NJZ0U8M0@fairphone.com>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Kishon Vijay Abraham I"
 <kishon@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Abel Vesa"
 <abel.vesa@linaro.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: Don't
 zero-out registers
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250616-eusb2-repeater-tuning-v1-0-9457ff0fbf75@fairphone.com>
 <20250616-eusb2-repeater-tuning-v1-2-9457ff0fbf75@fairphone.com>
 <qmcoh5lysln46mg7tbmeelmnzc7s6o7bssir3a7r3n3x5lnboq@cizzodjel4ut>
In-Reply-To: <qmcoh5lysln46mg7tbmeelmnzc7s6o7bssir3a7r3n3x5lnboq@cizzodjel4ut>

On Mon Jun 16, 2025 at 1:40 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Jun 16, 2025 at 11:45:12AM +0200, Luca Weiss wrote:
>> Zeroing out registers does not happen in the downstream kernel, and will
>> "tune" the repeater in surely unexpected ways since most registers don't
>> have a reset value of 0x0.
>>=20
>> Stop doing that and instead just set the registers that are in the init
>> sequence (though long term I don't think there's actually PMIC-specific
>> init sequences, there's board specific tuning, but that's a story for
>> another day).
>>=20
>> Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out u=
ntouched tuning regs")
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 63 +++++++++++++------=
-------
>>  1 file changed, 32 insertions(+), 31 deletions(-)
>>=20
>> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/ph=
y/qualcomm/phy-qcom-eusb2-repeater.c
>> index 6bd1b3c75c779d2db2744703262e132cc439f76e..a246c897fedb2edfd376ac5f=
dc0423607f8c562b 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> @@ -61,8 +61,13 @@ enum eusb2_reg_layout {
>>  	LAYOUT_SIZE,
>>  };
>> =20
>> +struct eusb2_repeater_init_tbl_reg {
>> +	u8 reg;
>> +	u8 value;
>> +};
>> +
>>  struct eusb2_repeater_cfg {
>> -	const u32 *init_tbl;
>> +	const struct eusb2_repeater_init_tbl_reg *init_tbl;
>>  	int init_tbl_num;
>>  	const char * const *vreg_list;
>>  	int num_vregs;
>> @@ -82,16 +87,16 @@ static const char * const pm8550b_vreg_l[] =3D {
>>  	"vdd18", "vdd3",
>>  };
>> =20
>> -static const u32 pm8550b_init_tbl[NUM_TUNE_FIELDS] =3D {
>> -	[TUNE_IUSB2] =3D 0x8,
>> -	[TUNE_SQUELCH_U] =3D 0x3,
>> -	[TUNE_USB2_PREEM] =3D 0x5,
>> +static const struct eusb2_repeater_init_tbl_reg pm8550b_init_tbl[] =3D =
{
>> +	{ TUNE_IUSB2, 0x8 },
>> +	{ TUNE_SQUELCH_U, 0x3 },
>> +	{ TUNE_USB2_PREEM, 0x5 },
>>  };
>> =20
>> -static const u32 smb2360_init_tbl[NUM_TUNE_FIELDS] =3D {
>> -	[TUNE_IUSB2] =3D 0x5,
>> -	[TUNE_SQUELCH_U] =3D 0x3,
>> -	[TUNE_USB2_PREEM] =3D 0x2,
>> +static const struct eusb2_repeater_init_tbl_reg smb2360_init_tbl[] =3D =
{
>> +	{ TUNE_IUSB2, 0x5 },
>> +	{ TUNE_SQUELCH_U, 0x3 },
>> +	{ TUNE_USB2_PREEM, 0x2 },
>>  };
>> =20
>>  static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg =3D {
>> @@ -129,17 +134,10 @@ static int eusb2_repeater_init(struct phy *phy)
>>  	struct eusb2_repeater *rptr =3D phy_get_drvdata(phy);
>>  	struct device_node *np =3D rptr->dev->of_node;
>>  	struct regmap *regmap =3D rptr->regmap;
>> -	const u32 *init_tbl =3D rptr->cfg->init_tbl;
>> -	u8 tune_usb2_preem =3D init_tbl[TUNE_USB2_PREEM];
>> -	u8 tune_hsdisc =3D init_tbl[TUNE_HSDISC];
>> -	u8 tune_iusb2 =3D init_tbl[TUNE_IUSB2];
>>  	u32 base =3D rptr->base;
>> -	u32 val;
>> +	u32 poll_val;
>>  	int ret;
>> -
>> -	of_property_read_u8(np, "qcom,tune-usb2-amplitude", &tune_iusb2);
>> -	of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &tune_hsdisc);
>> -	of_property_read_u8(np, "qcom,tune-usb2-preem", &tune_usb2_preem);
>> +	u8 val;
>> =20
>>  	ret =3D regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
>>  	if (ret)
>> @@ -147,21 +145,24 @@ static int eusb2_repeater_init(struct phy *phy)
>> =20
>>  	regmap_write(regmap, base + EUSB2_EN_CTL1, EUSB2_RPTR_EN);
>> =20
>> -	regmap_write(regmap, base + EUSB2_TUNE_EUSB_HS_COMP_CUR, init_tbl[TUNE=
_EUSB_HS_COMP_CUR]);
>> -	regmap_write(regmap, base + EUSB2_TUNE_EUSB_EQU, init_tbl[TUNE_EUSB_EQ=
U]);
>> -	regmap_write(regmap, base + EUSB2_TUNE_EUSB_SLEW, init_tbl[TUNE_EUSB_S=
LEW]);
>> -	regmap_write(regmap, base + EUSB2_TUNE_USB2_HS_COMP_CUR, init_tbl[TUNE=
_USB2_HS_COMP_CUR]);
>> -	regmap_write(regmap, base + EUSB2_TUNE_USB2_EQU, init_tbl[TUNE_USB2_EQ=
U]);
>> -	regmap_write(regmap, base + EUSB2_TUNE_USB2_SLEW, init_tbl[TUNE_USB2_S=
LEW]);
>> -	regmap_write(regmap, base + EUSB2_TUNE_SQUELCH_U, init_tbl[TUNE_SQUELC=
H_U]);
>> -	regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, init_tbl[TUNE_RES_FS=
DIF]);
>> -	regmap_write(regmap, base + EUSB2_TUNE_USB2_CROSSOVER, init_tbl[TUNE_U=
SB2_CROSSOVER]);
>> +	/* Write registers from init table */
>> +	for (int i =3D 0; i < rptr->cfg->init_tbl_num; i++)
>> +		regmap_write(regmap, base + rptr->cfg->init_tbl[i].reg,
>
> Init tables have TUNE_foo values in the .reg field instead of
> EUSB2_TUNE_foo, which means that writes go to a random location.

Right, stupid mistake. Thanks for spotting!

I will fix the init tables to use EUSB2_TUNE_*, and probably drop this
"enum eusb2_reg_layout" completely.

Regards
Luca

>
>> +			     rptr->cfg->init_tbl[i].value);
>> =20
>> -	regmap_write(regmap, base + EUSB2_TUNE_USB2_PREEM, tune_usb2_preem);
>> -	regmap_write(regmap, base + EUSB2_TUNE_HSDISC, tune_hsdisc);
>> -	regmap_write(regmap, base + EUSB2_TUNE_IUSB2, tune_iusb2);
>> +	/* Override registers from devicetree values */
>> +	if (!of_property_read_u8(np, "qcom,tune-usb2-amplitude", &val))
>> +		regmap_write(regmap, base + EUSB2_TUNE_USB2_PREEM, val);
>> =20
>> -	ret =3D regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, val=
, val & RPTR_OK, 10, 5);
>> +	if (!of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &val))
>> +		regmap_write(regmap, base + EUSB2_TUNE_HSDISC, val);
>> +
>> +	if (!of_property_read_u8(np, "qcom,tune-usb2-preem", &val))
>> +		regmap_write(regmap, base + EUSB2_TUNE_IUSB2, val);
>> +
>> +	/* Wait for status OK */
>> +	ret =3D regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, pol=
l_val,
>> +				       poll_val & RPTR_OK, 10, 5);
>>  	if (ret)
>>  		dev_err(rptr->dev, "initialization timed-out\n");
>> =20
>>=20
>> --=20
>> 2.49.0
>>=20


