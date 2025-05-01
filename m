Return-Path: <linux-arm-msm+bounces-56373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF109AA5FD0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 16:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DD3E3A3DA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 14:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEF21F3FE8;
	Thu,  1 May 2025 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="qh/QxvR/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DA3198E6F;
	Thu,  1 May 2025 14:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109248; cv=none; b=pBHHDBKHKgfDtZGjGC+UkVRRaD4h1Jm/EazXX+I1QMW5tzU+liPlGnWqxZVGoHDCdWJ6kBVKtgVXGkwqJEI4w4caxcFjGXpO+kmRdbASUl9gNRdcu93+gb4p2AUpL/vfc5cIgwHJedtkqnXiPIa2+rcjGletGOk31NSDDLl2Y/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109248; c=relaxed/simple;
	bh=1UwSOIDlD3ic60nJ1mkNJNnPI8CaGS+D6mHUgFP9Qv8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oB7tly0UcMqx06+JmA4KrZt2/j0l0UyVEUNur6BGdemLd4JuUumWlfnAmaUB+YzHXKa+EiC4xplf49TXiObtUvzOPfcmK/G5+ZWOcz89O6W0i8AsL+3AVU4A5WObRW+zRTNMRqfSSjrDTnUcpQuQZUrXuLzzglF4i0VuVn4zyHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=qh/QxvR/; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1746108822; bh=1UwSOIDlD3ic60nJ1mkNJNnPI8CaGS+D6mHUgFP9Qv8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=qh/QxvR/kNaj8aKiL4KL/ex5wocOuIwxzTh6HinxhAs7xsP4QRghKdlxZ42jy/bwL
	 CvbOpsuFKspfmy3D/UJFLo9wG867z8CoY2lL8RwkwZHnG8XeDEz7aB95BW0X6eHVvx
	 F0bHsjE7uX4qKhU6hKcdXQ0upwKUE7ig5cUb2bhQ=
Date: Thu, 01 May 2025 16:13:40 +0200
From: Luca Weiss <luca@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, Srinivas Kandagatla <srini@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
CC: Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/5=5D_ASoC=3A_qcom=3A_sm8250?=
 =?US-ASCII?Q?=3A_set_card_driver_name_from_match_data?=
In-Reply-To: <aBNdCRk_fP2q1vxQ@srini-hackbase>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com> <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com> <aBNdCRk_fP2q1vxQ@srini-hackbase>
Message-ID: <91110CA9-6E83-4811-AA04-C0312B99B95E@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Srini,

Srinivas Kandagatla <srini@kernel=2Eorg> schreef op 1 mei 2025 13:37:45 CE=
ST:
>On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
>> Sound machine drivers for Qualcomm SoCs can be reused across multiple
>> SoCs=2E But user space ALSA UCM files depend on the card driver name wh=
ich
>> should be set per board/SoC=2E
>>=20
>> Allow such customization by using driver match data as sound card drive=
r
>> name=2E
>>=20
>> Also while we're already touching these lines, sort the compatibles
>> alphabetically=2E
>>=20
>> Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@oss=2Equalcomm=2Ecom>
>> Reviewed-by: Neil Armstrong <neil=2Earmstrong@linaro=2Eorg>
>> Signed-off-by: Luca Weiss <luca=2Eweiss@fairphone=2Ecom>
>> ---
>>  sound/soc/qcom/sm8250=2Ec | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/sound/soc/qcom/sm8250=2Ec b/sound/soc/qcom/sm8250=2Ec
>> index b70b2a5031dfbf69024666f8a1049c263efcde0a=2E=2Ee920b413b762c803cfc=
c4049f35deba828275478 100644
>> --- a/sound/soc/qcom/sm8250=2Ec
>> +++ b/sound/soc/qcom/sm8250=2Ec
>> @@ -16,7 +16,6 @@
>>  #include "usb_offload_utils=2Eh"
>>  #include "sdw=2Eh"
>> =20
>> -#define DRIVER_NAME		"sm8250"
>>  #define MI2S_BCLK_RATE		1536000
>> =20
>>  struct sm8250_snd_data {
>> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_=
device *pdev)
>>  	if (ret)
>>  		return ret;
>> =20
>> -	card->driver_name =3D DRIVER_NAME;
>> +	card->driver_name =3D of_device_get_match_data(dev);
>>  	sm8250_add_be_ops(card);
>>  	return devm_snd_soc_register_card(dev, card);
>>  }
>> =20
>>  static const struct of_device_id snd_sm8250_dt_match[] =3D {
>> -	{=2Ecompatible =3D "qcom,sm8250-sndcard"},
>> -	{=2Ecompatible =3D "qcom,qrb4210-rb2-sndcard"},
>> -	{=2Ecompatible =3D "qcom,qrb5165-rb5-sndcard"},
>> +	{ =2Ecompatible =3D "qcom,qrb4210-rb2-sndcard", =2Edata =3D "sm8250" =
},
>
>sm4250 for rb2?

Since this name is visible to user space and used for picking the UCM conf=
ig, I don't think it's a good idea to change it=2E

Regards
Luca

>
>> +	{ =2Ecompatible =3D "qcom,qrb5165-rb5-sndcard", =2Edata =3D "sm8250" =
},
>> +	{ =2Ecompatible =3D "qcom,sm8250-sndcard", =2Edata =3D "sm8250" },
>>  	{}
>>  };
>> =20
>>=20
>> --=20
>> 2=2E49=2E0
>>=20

