Return-Path: <linux-arm-msm+bounces-28797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD41954AB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 15:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 946B1284648
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 13:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92351B0108;
	Fri, 16 Aug 2024 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xrssL67v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FF71B9B29
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813321; cv=none; b=K0kiNf847UZEzqu50K9bNO7ErJ+A15sBQzD0Qb6lN/yIttNmwoi/cYGDQ3gYUFAxpMo48Dz/hDtvcCCTE43mHc9Gf/vlaD5Hqt2LbT06yGyC0IlVw5d/lvsNq7umIukBzS41Z3DB3xh9UElzjCiKYW/k0a3vxt1pExEklAgcR5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813321; c=relaxed/simple;
	bh=khItFkdPe6+8AnUWSIBzujIiebw+Nuk9cyt0caKbISM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=CSfcoc9ZKTV1eUPBakvCNNaMmWGV/IZGIp5kDjZ8GlvBixmmZpJYamXRaYoxhwsyyL97CvQ7kA8Xzwog++IgkQJJz9ApzYlFyTWi3vFLSPd84bqt30C6wUqvzxmfJArEn6xjRhjlPqQKRIOfZGbah+pyDiM3YuoB7t9ObrfE3Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xrssL67v; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-710dc3015bfso1397322b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723813319; x=1724418119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mPU1rnCHLqIEChVLFEm2mkyxzxBNVaRrpxa3cQaix6w=;
        b=xrssL67vF8rYvtuOQFq0QaBX2U7KnbvBxTNLUBvBzw8ZX4hLasMTB4mKvRzEmtDfSZ
         9EokJTSTqgCOa8XQF8wc9VGLoB1j+m2xD++zbgWvc58IUFwHU3sGb+kthrdC7rRIp0/+
         boUgrSRvcmUDnvP7TLlqx9TeCWc2OslQmwh7nlXayL3jxmUwcrd+VWc/lEnaFBV5gZpO
         PH0O2Gt2FOX4UO7lBOWUGGaQBurrdV88t2AfG0vkMJsdEpLF/LhYOfLVf+AaWJvMAGG+
         ZaOxw0InYsDZXiCTUCAhpWy2hgYHGdaOQrxsclOFiLu0iqV05g67URkNFFDgFdCS7FRF
         Stcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723813319; x=1724418119;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPU1rnCHLqIEChVLFEm2mkyxzxBNVaRrpxa3cQaix6w=;
        b=bQ0wT92lG9eEXvZer43e/0b4AOavEYw4bCLw94oizIWvSat7nfGSbTGoj1PRaa2+ta
         n1PZS7ZTKQwQaz7dsUtjM0bgZW5XLD3IcJ/lGKwe5m5gd1rhx0j/XiIW2UBRRhiI4noT
         LqVzO1C3jvYU21Q6dCZeorVZN8a3C0UyoghzTTt6/+pLlUsv5TpXb2OBYyh65ciMxtl9
         zB03yLhjdAyHg+g7mMzkjoXhuiqdTmHJO6q3OjY9CU65SWWufTFuYMYx1PbJzo2DKDjW
         Y7jOs6BoroC0hlG9HZY61h6AdSbNY5ZaxYmyF/nrlP0a4kqDe4mHxhs1LH0Y+9/uducd
         C80A==
X-Forwarded-Encrypted: i=1; AJvYcCWo4gxLR/etgmXp2kdZQ3pfFVZMTKklkt+i6JEKLFJrVQNHBMFtyY7/vzcxKSayyH/IFltOFLtr32B2VhUAExgFCAqeEFhb49IMT7H37Q==
X-Gm-Message-State: AOJu0YyK04vHgbJ1ayvoJXI+uuNpzHxvpJk7FQJG/NrMEICb6x+/E7w/
	AOR3/kPCUGSytY/cwYH3sYjotewd1wDkCrRDwIdOFOzvpN6mJZWSQDhI5aWfbW0=
X-Google-Smtp-Source: AGHT+IEAzyKCcegktmRWULTqmzWKQOEhfSig6I0+YXOYjRvGYuG38xHEoXFzBN1iG/qYhq6ro+penA==
X-Received: by 2002:a05:6a20:9f0a:b0:1c4:779b:fb02 with SMTP id adf61e73a8af0-1c9aacfbbf5mr3850835637.21.1723813319242;
        Fri, 16 Aug 2024 06:01:59 -0700 (PDT)
Received: from [127.0.0.1] ([49.230.136.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add728bsm2580288b3a.33.2024.08.16.06.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 06:01:58 -0700 (PDT)
Date: Fri, 16 Aug 2024 20:01:52 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
CC: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_ASoC=3A_codecs=3A_lpass-va-macro=3A?=
 =?US-ASCII?Q?_set_the_default_codec_version_for_sm8250?=
User-Agent: K-9 Mail for Android
In-Reply-To: <de0a9cf2-c656-430e-8c56-ca2975c73c0e@linaro.org>
References: <20240815164903.18400-1-srinivas.kandagatla@linaro.org> <F07BF288-66F4-497A-A581-5FE4B7B432BD@linaro.org> <18DCA30B-273D-415A-81EF-EA02CEBDAA94@linaro.org> <de0a9cf2-c656-430e-8c56-ca2975c73c0e@linaro.org>
Message-ID: <632B6187-5CB7-45E3-8EB1-3C4C932834E1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 16, 2024 3:59:18 PM GMT+07:00, Srinivas Kandagatla <srinivas=2Eka=
ndagatla@linaro=2Eorg> wrote:
>
>
>On 15/08/2024 22:22, Dmitry Baryshkov wrote:
>> On August 16, 2024 4:07:10 AM GMT+07:00, Dmitry Baryshkov <dmitry=2Ebar=
yshkov@linaro=2Eorg> wrote:
>>> On August 15, 2024 11:49:03 PM GMT+07:00, srinivas=2Ekandagatla@linaro=
=2Eorg wrote:
>>>> From: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>>>>=20
>>>> sm8250 and sc7280 have lpass codec version 1=2E0, as these are very o=
ld
>>>> platforms, they do not have a reliable way to get the codec version
>>> >from core_id registers=2E
>>=20
>> I wrote that it looked good, but maybe you can also describe, why core_=
id registers are not reliable? Are they just not present on those platforms=
 or is there any other issue?
>>=20
>Sure, the comment is correct because the registers are available to read =
however the values of those registers are not fit for dynamically detecting=
 the version, like what we do in the driver=2E

If I remember correctly, on sm8250 these registers read 0x0 /0xf /0x0=2E A=
re you saying that there are several revision that will have these values? =
Do we need to know that it is exactly 1=2E0 or 1=2Ex is going to be enough?

>
>one of the reasons is that the codec evolved over time, I think starting =
from v2 it has values made more sense to determine the version info from th=
ese registers=2E This is also evident in the current code=2E
>
>
>Let me add this detail the commit log and send a v2=2E
>
>--srini
>>=20
>>>>=20
>>>> Add the version info into of_data, so that it does not need to use
>>>> core_id registers to get version number=2E
>>>>=20
>>>> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get c=
odec version")
>>>> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to =
accomdate new codec versions")
>>>> Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support =
for newer v2=2E5 version")
>>>=20
>>> Which commit introduced the issue? I think having just the first tag i=
s enough=2E
>>>=20
>>> LGTM otherwise=2E
>>>=20
>>>> Signed-off-by: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eor=
g>
>>>> ---
>>>> sound/soc/codecs/lpass-va-macro=2Ec | 11 ++++++++++-
>>>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/sound/soc/codecs/lpass-va-macro=2Ec b/sound/soc/codecs/l=
pass-va-macro=2Ec
>>>> index 8454193ed22a=2E=2Ee95d1f29ef18 100644
>>>> --- a/sound/soc/codecs/lpass-va-macro=2Ec
>>>> +++ b/sound/soc/codecs/lpass-va-macro=2Ec
>>>> @@ -228,11 +228,13 @@ struct va_macro {
>>>> struct va_macro_data {
>>>> 	bool has_swr_master;
>>>> 	bool has_npl_clk;
>>>> +	int version;
>>>> };
>>>>=20
>>>> static const struct va_macro_data sm8250_va_data =3D {
>>>> 	=2Ehas_swr_master =3D false,
>>>> 	=2Ehas_npl_clk =3D false,
>>>> +	=2Eversion =3D LPASS_CODEC_VERSION_1_0,
>>>> };
>>>>=20
>>>> static const struct va_macro_data sm8450_va_data =3D {
>>>> @@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_devi=
ce *pdev)
>>>> 			goto err_npl;
>>>> 	}
>>>>=20
>>>> -	va_macro_set_lpass_codec_version(va);
>>>> +	/**
>>>> +	 * old version of codecs do not have a reliable way to determine th=
e
>>>> +	 * version from registers, get them from soc specific data
>>>> +	 */
>>>> +	if (data->version)
>>>> +		lpass_macro_set_codec_version(data->version);
>>>> +	else /* read version from register */
>>>> +		va_macro_set_lpass_codec_version(va);
>>>>=20
>>>> 	if (va->has_swr_master) {
>>>> 		/* Set default CLK div to 1 */
>>>=20
>>>=20
>>=20
>>=20


--=20
With best wishes
Dmitry

