Return-Path: <linux-arm-msm+bounces-76231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B340BC1F41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 17:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86407189D2C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 15:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F071F3BBB;
	Tue,  7 Oct 2025 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xDm5i9zk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8642E284A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759851547; cv=none; b=R8+g5VsuGyM2hA2X67XWVYidOf7xrRHjnAD1Q6m73MkpUn3d64WGphCXs28sWv5Ua3EdyIbdgW3nLyKLHUORNRIEpBse/DJDz73LqohLdtQC4UpTPvE5mGvaIB891392HNpPe9fUSG0jLDBcHSCc3uTPohwjinJf38IecV6bnKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759851547; c=relaxed/simple;
	bh=ai4LGPuL3rEMggixLNvM6kWUprS+X4rTlrv1/oQ6sJ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=b0/Xavmo6lgRp36Rma6eSmm3tMzmxVP3mzsrKVh+IS/f6HmHcp89Eud4ZXgw0fE4sGHzbGQ20LkGSeceU3Bb+Cu/SGmw0GHIAx3akWWlafVQh25v52fBu+/FNeIkLocbHoQGsx3pLpSFo7YjkMl6wFtjDcQzNE15+etMTLcTAHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xDm5i9zk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso3895923f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759851543; x=1760456343; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8DX9q0w9bvA3uWv/K5h42L9FfWuzySG8u4E46pyKaU=;
        b=xDm5i9zkOCUoD7QiwqfKRCqDhRV5uv80wOLiF4mrKd8VDiuFsVyyMCO+vn5+LZRzcd
         kZbTmFYeUFD8QZQnnRR2bSSP4fksoQ3DUHdYtJhK/MZKwi/kqYkxS/Ave8QXSNpw8iHX
         HAOi4zLQzqhRloJUzGrNv8T5ps+yz2YQxm64syS1CDh9R2Nny8bDINY+RmC9OADWDX41
         mZOj2zI7U1CvyBrVJ4EWKHVZVVA11uH0rTS+aguSpqBedbYyZJ78pdx98v+C/ENxvexl
         eQJVX9U60k4ZnSRqxZdjSjtKXTOFwmtmDwOZHBRt3DStY3eVb/RPNaLAuidLZEa2cBR2
         lZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759851543; x=1760456343;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k8DX9q0w9bvA3uWv/K5h42L9FfWuzySG8u4E46pyKaU=;
        b=narkOXnqrgbrOfj163CzDaOK0+HOGIuC+4BNhkNNtJ6LTOplbYtqPloIYmy3sOMitk
         ZyAIkw20muqOJLtLzo3pDEdkHwzf6iBeHFx0PXpDcmwtptUcSNjOHIlIGlYQY9vKai0M
         ajk5D4pkub8JTgk6Wz6IICsdFytauFk43oitD72kOx9KcoUBHEO5cQQ+TR0Y9HQFF/xE
         g6+QSL4ztzDET6JQJ3RQQdZGmg5EzyehziUDvnHAar9TIfFAOEjhybXD2k6CpIyWLwCd
         4cQe/cG7amYW3UI4RRz2h0nQZwHEiTvKP5NEat39gJdLHC/6sYBIAiOtB0iaxtJhKbVf
         a/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmJ947FmRM8qONUm9UJcl3IT55hYv5fdA8iVpiAlnGp5ARtOfkGF5SrSOKvMYjSZJm+t0/5xd+dYVKfqYk@vger.kernel.org
X-Gm-Message-State: AOJu0YzZL/HXqCnVN2ZbaVDvbm2IxOTW8xjyQSO/m9EIfl7gipDbdRnT
	dD/9ob1fQf+ihMW2dv+sbjX3+Yc/4V+Clc4Cbl4E8V1hPnkwgyhYXEQOzbf30sIUDLo=
X-Gm-Gg: ASbGncuUeo8xxUOrzK7ZKwzaBsbGu+4Iu195exdiDuHO5+J7tAO0tSOuQY19jtXqjIT
	7SV4EhBlRyWNPIf2zuVtoDBVeo0XIa14WbW+QuVrdA1uhMsdsKPH1qn8P2lZoZNaD2G9jL7YRny
	wMmb15+ppLvQXWLDXbx/QnYLwGgE78+eBjESztOxN7tosRjg8iiGdnW+jnPMMHlrU0qnrYWQO1X
	ocdhpBgCnsHJZdxWZKq+fVYreKQi0kRIgyYHdFrtJAuYENo7Fhs1EY2PZn+zyeMpYwlY3+8f0Jy
	PnD+nNxSke3vusewN//Lcw0qRTipBbrT9h4eLLXeTQsqNwPAeGJus99p+IpJt93T2Owixmca6FT
	7ifA3oaIW9jeQilV0SqHj45nWukCHcv6O4yo3JmfJ2KdPY88wb/V+JW41x+v10v4Gmw==
X-Google-Smtp-Source: AGHT+IGPYTEBM7rthUf88Ia5HZrtFvZ/rrQd5/6C2vMcuGkG3ki1p9x7pdGI+whXVL1GGpI4sFIxqg==
X-Received: by 2002:a05:6000:240b:b0:3eb:ad27:9802 with SMTP id ffacd0b85a97d-425829a5a91mr2835454f8f.2.1759851542939;
        Tue, 07 Oct 2025 08:39:02 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97fbsm25787403f8f.34.2025.10.07.08.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 08:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 16:39:01 +0100
Message-Id: <DDC7B1BDTZCN.D7JXN4RVKYHM@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 4/6] sm8650-hdk: Enable I2S for HDMI
X-Mailer: aerc 0.20.0
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org> <20251006-topic-sm8x50-next-hdk-i2s-v1-4-184b15a87e0a@linaro.org> <DDBPGIDN8SKS.2GF6TZC6KGXVI@linaro.org> <de955ab3-26de-43ed-a450-d58ffe0df7af@linaro.org>
In-Reply-To: <de955ab3-26de-43ed-a450-d58ffe0df7af@linaro.org>

On Tue Oct 7, 2025 at 8:04 AM BST, Neil Armstrong wrote:
> On 10/7/25 03:39, Alexey Klimov wrote:
>> On Mon Oct 6, 2025 at 7:37 PM BST, Neil Armstrong wrote:
>>> Add the necessary nodes to configure the right I2S interface
>>> to output audio via the DSI HDMI bridge.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 30 ++++++++++++++++++++++++=
+
>>>   arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 ++++++++++++++++++++++++=
+++++++++
>>>   2 files changed, 70 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/=
dts/qcom/sm8650-hdk.dts
>>> index 87d7190dc991b11f5d1162aabb693dcadd198c51..1286ce95235d5544322a187=
7292cbdd426298c11 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>>> @@ -171,6 +171,19 @@ sound {
>>>   				"TX SWR_INPUT1", "ADC2_OUTPUT",
>>>   				"TX SWR_INPUT3", "ADC4_OUTPUT";
>>>  =20
>>> +		pinctrl-0 =3D <&i2s0_default_state>, <&audio_mclk0_default_state>;
>>> +		pinctrl-names =3D "default";
>>> +
>>> +		clocks =3D <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_=
COUPLE_NO>,
>>> +			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +		clock-names =3D "pri-mi2s",
>>> +			      "pri-mclk";
>>> +
>>> +		assigned-clocks =3D <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_A=
TTRIBUTE_COUPLE_NO>,
>>> +				  <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +		assigned-clock-rates =3D <1536000>,
>>> +				       <24576000>;
>>> +
>>>   		wcd-playback-dai-link {
>>>   			link-name =3D "WCD Playback";
>>>  =20
>>> @@ -218,6 +231,22 @@ platform {
>>>   				sound-dai =3D <&q6apm>;
>>>   			};
>>>   		};
>>> +
>>> +		pri-mi2s-dai-link {
>>> +			link-name =3D "Primary MI2S Playback";
>>=20
>> Is it HDMI only audio playback or does it have switches to playback it a=
s raw i2s
>> (when external DAC is needed)?
>
> The HDK has i2s lines of the secondary i2s on the LS connector, but witho=
ut any additional
> boards connected it has no on-board i2s dacs.

Ah, like on RB3 and RB5 boards.

In such case the suggestion is to add mention of HDMI here in the link name=
,
otherwise it might be not clear what this multi i2s playback is about.
Maybe "Primary MI2S/HDMI Playback" will do.

Thanks,
Alexey


