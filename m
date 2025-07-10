Return-Path: <linux-arm-msm+bounces-64413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82314B00768
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D804C3B2013
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7ACD27586F;
	Thu, 10 Jul 2025 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cFfR0/cm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6320275866
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 15:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752161865; cv=none; b=rFJhx58JReJRlxUkOUHkb2MTvQg/kJREpqN9JQPycekyYJJ9Py+SW5BDtvCLKhqBAiQp6dFCtma5ERacSPBBZtFUyK/g45WrnfaelA4cwUj2PMBzr2AdwBB00cYHfle1jX4JT46Fgo/9J6OsSKEWV9qNhW0LHN/xDNE4782t81M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752161865; c=relaxed/simple;
	bh=QwOQObB2pctndAzOHsW+e0d5hzIcqwrg+o1Xv3mv1Ck=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CZvU8jU1QV4a6SGkGWHlS69O8q4Uk3zMMiOoJx/viwOFAVk/r+U1AOB0Y8ygk39XR9gyUv9++ioyneAu7C4TSertzXXzE8Cag+80otsgw/u14IpmZDzMiILcrEsZ2kF1ISslMTAVvK2QOOafueaD05QY29UV7BbupoL7gwtUvnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cFfR0/cm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso692303f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 08:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752161861; x=1752766661; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GCMYIRIYYP0/PAurGhaaMN0CHgGvBkGkwVspybvVpo=;
        b=cFfR0/cmJ5FwwMV4LCTX/c9A3wp/L+ANymfqAaVa8X0oyur3NMbaXYG2hNOlccUbQ3
         nC88DrR6wGIOqZrqONe9VBhS7mdtlKrnnDY1uIOTRPD2GyfJaQdR19DpZD0YZ8gRBDIM
         JXu6HmvoTUrO1CdA2hW113LWh39mZgwGkbYHPHn6GOQzB53DexyJc6oEEzD6O3B6opyw
         AqCiL7N0OcgL09zMfdeU/ailbFvl7o+px+hNCnAnUMxL945CzST2FrxT+BqhBhnRuwra
         1V2hopI13ukDL/b+yPgX7n2HM82BVMHdvDUqry489jf3Zmy3b+AdU8JT+2mmuhIYJEe/
         Lo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752161861; x=1752766661;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1GCMYIRIYYP0/PAurGhaaMN0CHgGvBkGkwVspybvVpo=;
        b=h2Ld8EzffOktznZmCTHQwtHNkuQ815SRdiykm7joc0F5TTmfQJ9SZKmdn6BXdK094I
         Y9bltRHUlnyVymiGtS/wfusKyNO5pHMRPiyO8CMUBuICrSYaKHIiSRIyTsuyEw3nncdh
         X4xrct7wZGDZhLs97tQjxOFahndSF07ExKOoZTsE3smvrUlwyo03RlOewKA1/GRS5inw
         NsNTOt0XzRxsrRzHzQut5M/U4Nrs08HMRpFmyP258VtBrJ/s2eZ3wAbVtJaCDmfVjD5p
         flJh0Q5pbSmzDvhcKZoC2UdVdg9vhBbexjhLNU4tYe/qN8zLMPX4ancYDgztTKos1x3Y
         tqmA==
X-Forwarded-Encrypted: i=1; AJvYcCUamdzp5SXmZr9hGUV3loxTCSbit5brC+6er1hE5vF/aNbJKKbTEUphWfKL6a36jZUSEnCZMyOEC289PO6W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/AjnyBa54qtVbMgtu/ZmtHRlcb+HvW3bz2S3zHdokIBVZK/5r
	cUQBCzg6a5Pw0h6jEO7WJxkAYf6le9YXiM6OBJXIRhfwd9bKLnWsk9+4SHLLeaLdvoI=
X-Gm-Gg: ASbGnctFG38PR9RYiOw+Pt3xu9BkGVPsIgV8A0MqMKzRq0eAVNaLYJx6L9/tZW4IGP+
	gaWLk74kqYeMG23jG7V3ivtyYNs2kT7wri1g04Sks7Lfe1AxZMmn4XNSc7Zt5Tvo9UUgYiX3tCG
	lvXho3UL2m4Bxc3QG3C50pvyp/KNtl2CVQbehnKaERwZDqlzknZFpmRbq6mfmgDVwcGtZ+WPykO
	rvM8QluqTknpC0bntLDOM9QxyL7LOJQs9Ocq0prsugFyENB2e9EyNUAy5roo4+88k+27wFGuYSw
	9xMnyG1Q+EHT2aj4v5Om71ckEg6/j/YqT1RwiNJTGNl1U5UKLpWgzbFZ3PS/3+rgwPk=
X-Google-Smtp-Source: AGHT+IGw7DVfZ3GZxj+qHwr1y0PJneaT93zpwe7OGfPSm+0CYQeA+WTJUdUF6Ib1mvex15f2hc3lew==
X-Received: by 2002:a05:6000:400e:b0:3aa:34f4:d437 with SMTP id ffacd0b85a97d-3b5e4529684mr5959353f8f.37.1752161861054;
        Thu, 10 Jul 2025 08:37:41 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cdb549absm65784495e9.1.2025.07.10.08.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 08:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Jul 2025 16:37:39 +0100
Message-Id: <DB8HJI3YCZ9X.282HCM2QSGY0D@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] ASoC: codecs: add new pm4125 audio codec driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
 <rr2qf7hw7lkwqozguz3cv4tg7eewzk4jkxx5bieydukemjko2h@pwtrakslklvn>
In-Reply-To: <rr2qf7hw7lkwqozguz3cv4tg7eewzk4jkxx5bieydukemjko2h@pwtrakslklvn>

On Thu Jun 26, 2025 at 7:19 AM BST, Krzysztof Kozlowski wrote:
> On Thu, Jun 26, 2025 at 12:50:31AM +0100, Alexey Klimov wrote:
>> +
>> +static int pm4125_add_slave_components(struct pm4125_priv *pm4125,
>> +				       struct device *dev,
>> +				       struct component_match **matchptr)
>> +{
>> +	struct device_node *np =3D dev->of_node;
>> +
>> +	pm4125->rxnode =3D of_parse_phandle(np, "qcom,rx-device", 0);
>> +	if (!pm4125->rxnode) {
>> +		dev_err(dev, "Couldn't parse phandle to qcom,rx-device!\n");
>> +		return -ENODEV;
>> +	}
>> +	of_node_get(pm4125->rxnode);
>
> Where  do you clean this up?

Please don't tell me that this is a bug that being copied from driver
to driver.

I changed it to such flow for the next version since it seems that referenc=
e
should be decremented after of_parse_phandle() returns with it incremented:

rxnode =3D of_parse_phandle();
if (!rxnode)
	return dev_err_probe(...);

component_match_add_release(..., rxnode);
of_node_put(rxnode);


>> +	component_match_add_release(dev, matchptr, component_release_of,
>> +				    component_compare_of, pm4125->rxnode);
>> +
>> +	pm4125->txnode =3D of_parse_phandle(np, "qcom,tx-device", 0);
>> +	if (!pm4125->txnode) {
>> +		dev_err(dev, "Couldn't parse phandle to qcom,tx-device\n");
>> +			return -ENODEV;
>
> Messed indent. This should be anyway just one line as always - return
> dev_err_probe.

I changed it for the next version as you suggested. Thanks.

>> +	}
>> +	of_node_get(pm4125->txnode);
>
> And this?
>
>> +	component_match_add_release(dev, matchptr, component_release_of,
>> +				    component_compare_of, pm4125->txnode);
>> +
>> +	return 0;
>> +}
>> +
>> +static int pm4125_probe(struct platform_device *pdev)
>> +{
>> +	struct component_match *match =3D NULL;
>> +	struct device *dev =3D &pdev->dev;
>> +	struct pm4125_priv *pm4125;
>> +	struct wcd_mbhc_config *cfg;
>> +	int ret;
>> +
>> +	pm4125 =3D devm_kzalloc(dev, sizeof(*pm4125), GFP_KERNEL);
>> +	if (!pm4125)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(dev, pm4125);
>> +
>> +	cfg =3D &pm4125->mbhc_cfg;
>> +	cfg->swap_gnd_mic =3D pm4125_swap_gnd_mic;
>> +
>> +	pm4125->supplies[0].supply =3D "vdd-io";
>> +	pm4125->supplies[1].supply =3D "vdd-cp";
>> +	pm4125->supplies[2].supply =3D "vdd-mic-bias";
>> +	pm4125->supplies[3].supply =3D "vdd-pa-vpos";
>> +
>> +	ret =3D devm_regulator_bulk_get(dev, PM4125_MAX_BULK_SUPPLY, pm4125->s=
upplies);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get supplies\n");
>> +
>> +	ret =3D regulator_bulk_enable(PM4125_MAX_BULK_SUPPLY, pm4125->supplies=
);
>> +	if (ret) {
>> +		regulator_bulk_free(PM4125_MAX_BULK_SUPPLY, pm4125->supplies);
>
> Double free.

Thanks.

>> +		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
>> +	}
>> +
>> +	pm4125_dt_parse_micbias_info(dev, pm4125);
>> +
>> +	cfg->mbhc_micbias =3D MIC_BIAS_2;
>> +	cfg->anc_micbias =3D MIC_BIAS_2;
>> +	cfg->v_hs_max =3D WCD_MBHC_HS_V_MAX;
>> +	cfg->num_btn =3D PM4125_MBHC_MAX_BUTTONS;
>> +	cfg->micb_mv =3D pm4125->micb2_mv;
>> +	cfg->linein_th =3D 5000;
>> +	cfg->hs_thr =3D 1700;
>> +	cfg->hph_thr =3D 50;

[..]

>> +#if defined(CONFIG_OF)
>> +static const struct of_device_id pm4125_of_match[] =3D {
>> +	{ .compatible =3D "qcom,pm4125-codec" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, pm4125_of_match);
>> +#endif
>> +
>> +static struct platform_driver pm4125_codec_driver =3D {
>> +	.probe =3D pm4125_probe,
>> +	.remove =3D pm4125_remove,
>> +	.driver =3D {
>> +		.name =3D "pm4125_codec",
>> +		.of_match_table =3D of_match_ptr(pm4125_of_match),
>
> Drop of_match_ptr and #if. We just removed it (or trying to )
> everywhere, so why re-introducing it...

Will remove it. Thanks.

>> +		.suppress_bind_attrs =3D true,
>> +	},
>> +};
>> +
>> +module_platform_driver(pm4125_codec_driver);
>> +MODULE_DESCRIPTION("PM4125 audio codec driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/sound/soc/codecs/pm4125.h b/sound/soc/codecs/pm4125.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2c5e8218202d92a0adc49341=
3368991a406471b0
>> --- /dev/null
>> +++ b/sound/soc/codecs/pm4125.h

[...]

>> +const u8 pm4125_reg_access_analog[
>
> No, you cannot have data defined in the header. This is neither style of
> C, nor Linux kernel, nor makes any sense. What if this will be included
> by some other unit? This is some terrible downstream style.
>
> Heh... you actually do include it twice, so you would see all the
> duplicated data for no reason at all.

I pulled in the change that fixes this for the next version.
Thank you.

Best regards,
Alexey


