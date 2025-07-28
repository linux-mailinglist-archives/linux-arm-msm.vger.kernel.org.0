Return-Path: <linux-arm-msm+bounces-66866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D3B13C79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0173540A8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79BB283FE5;
	Mon, 28 Jul 2025 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KiNI+HKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1866283FC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753710965; cv=none; b=l2HWxlz7KJCP6ztFDrDDASL/3RDfNduIjyvRw0iVtgCaUgEZ+KqMGJzBvjiKaOCPpdCPIu7o/Ta6rUCFY3AZp0wd5wt6V8DzCsgc5+dzAd+Qp2DXr1c3nBDoP5iP80qs137cAL7fNuzp5R38ihTS/6VW4EMQPb2RRIFHsTrwjf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753710965; c=relaxed/simple;
	bh=ypSzciL2jkJ+Mog3EIhQdI7vmqYVGIRiOmTYgtOu+Fk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SX1hPY+bq1X6YdC79HYQnbhjidNjxyQOqkPDWh3/hM/BsGM3HJ5B4AKPWHBE5XefkApBOqKLMg13JW0xhn2SHlKQZIidxG/TcBy6IfzLDrGZNGOnkRhTpRZLJd7i5fyDZGb6GAoIn6dcYULw/CJV6xzoiCZw73LL/Uvhrm+IE9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KiNI+HKV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45629702e52so18735545e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 06:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753710962; x=1754315762; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EV0p8ZNhxkQtgdsERR4qTiYCDN9W/4GIw/qe1A8PF14=;
        b=KiNI+HKVEPezd0gTl+RaSybfvWwFpJ/GZrmflnNS4MeQ2FZIm4BNz4JoseAe0EwrmA
         nibGuBGlrl8Tlsm8kxkCElU6+km7FSlRaTvgf0DG4AY2KlPOtqFrHo7nEYwWGSxtgGYl
         LkuIjBWp3qIQmBFAYYL2irytbZfzYDxMyPtupGsEkZmyMQM4PJO9pN5bN7jl8WGlZ6yq
         G34CnoFX1XnYYPR1d4f6hQkdguqlRrwslcrGB4g/uO2iMZtb8/vE6YxKNQcUrF88lyBS
         QUcn1HZvPC5ixo9fLG5nuK63OgKQVGeAHDvK2evq0SeXda1OCe289PWMurSd/pYv1Z3v
         Fi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710962; x=1754315762;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EV0p8ZNhxkQtgdsERR4qTiYCDN9W/4GIw/qe1A8PF14=;
        b=VZ2AR6GhtfTk9/JM/qjl3drYt6HiZvdn8az4xSfwKEkNemQ7m0aTrhc71sNiWrsVpe
         w8Pg6KaTY2fkOi8TxYjEFHr2bYV2t5MZZOVobbRn+ctaptDbynelMV5DjjaRQiTNCpE3
         7hVuzMWyINF7i3kcOIB94F602fEov61lNbuHO70oNGwT/fJvd+lU63oM+fsgzs4e5NE/
         r7C8eMIiIvOBoC7B0oeEs79FCGD4+0urIaxhvnPXvvl3rMWyBQevkIFiVOssLh9qJeNi
         Bn0/w4Sa7Ho0pTrjiKydq4c5bmfy1FLzBEwzCydqgai5F2Kth2EKU+fWYzd3RWZFL5vc
         wYPw==
X-Gm-Message-State: AOJu0YzCkEoYyMbBQDxKu7GdzBH5Vc620vWATEpxsXfRWe09aUDbuXkx
	MQD8NbSxPC4Wzn/SRLozjei0XsG50JfrOjRZd1NmKmvqvgrQxfJOp36DkEFWLP1EUjd3iu/1yy1
	dhXtV
X-Gm-Gg: ASbGncsX0CSpGpmKCHs6apFNTYhQQAyJ1CtDk1QbPLkO6pce62LmtHbp8gvAMygKRuw
	gr95uHOOjBTUA2pFEVCBqdm8Nyk/FgaeLRpTt99dkwKI9cM/Jr4tqLB3ttcRBzQ1227V3Gw0OMl
	hCXbVRkbS0hfhC8pkQAM91iQJgP1Eu4aCDrYbHEIbmphunRlsDIjhjRsGPsneAs9H1Z+CJ9djna
	nvVS7iw3x8OqAmwXpHNRugHaRbaWBRmms6wWHjrPk9P02zhVn6znoKCJyb4uET+I4BwYKs30YKn
	ghp0zqG9bxpkLspGCZOCgH08ZLqq+jREzDSSmq8B/BI0ndGGIK37+bZdc22Kv2Tr+JZnnTAyt3J
	w+JwKG+malGWot8OyijnQXV3WYaI=
X-Google-Smtp-Source: AGHT+IHSRNjCsvA+a17XVvG0X0bD2L2S+7tCdoJMe7B6ypVA2l90htjyJerFVwbt0qj0fz/EWvewhA==
X-Received: by 2002:a05:600c:35c6:b0:456:1d06:f38b with SMTP id 5b1f17b1804b1-4587d335362mr66236365e9.8.1753710961839;
        Mon, 28 Jul 2025 06:56:01 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:ef61:42d3:92bc:95e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705bcbe8sm162665305e9.17.2025.07.28.06.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 06:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Jul 2025 14:56:00 +0100
Message-Id: <DBNQNHBU5D4Y.1YB8M6DTKR6E9@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add initial audio support for
 Hamoa-IOT-EVK
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <leqi@qti.qualcomm.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250728-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v2-1-58aa30b60c7b@qti.qualcomm.com>
In-Reply-To: <20250728-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v2-1-58aa30b60c7b@qti.qualcomm.com>

On Mon Jul 28, 2025 at 8:16 AM BST, leqi via B4 Relay wrote:
> From: leqi <leqi@qti.qualcomm.com>
>
> This patch adds initial audio codec support for the Hamoa-IOT-EVK board,
> including WCD9385 configuration, micbias voltage settings, GPIO reset,
> and power supply bindings. It enables basic audio functionality for
> further development. Basic test is good in Hamoa-IOT-EVK board.
>
> Signed-off-by: leqi <leqi@qti.qualcomm.com>
> ---
> Changes in v2:
> - Updated author email address to leqi@qti.qualcomm.com.
> - Clarified that audio is validated with this change.
> - Link to v1: https://lore.kernel.org/all/20250723-initial_audio_support_=
for_qualcomm_hamoa_iot_evk_board-v1-1-816991701952@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 232 +++++++++++++++++++++++=
++++++
>  1 file changed, 232 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/hamoa-iot-evk.dts
> index 843f39c9d59286a9303a545411b2518d7649a059..91618e22e86c46c698b3639f6=
0bc19314705b391 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -124,6 +124,94 @@ pmic_glink_ss2_con_sbu_in: endpoint {
>  		};
>  	};
> =20
> +	sound {
> +		compatible =3D "qcom,x1e80100-sndcard";
> +		model =3D "X1E80100-EVK";
> +		audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",

Could you please check/confirm that above routing path
"WooferRight IN" -> "WSA2 WSA_SPK2 OUT" is correct?

Left path get input from both WSA_SPK{1,2} while the right one only uses
WSA_SPK2.


> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS3",
> +				"VA DMIC1", "MIC BIAS3",
> +				"VA DMIC2", "MIC BIAS1",
> +				"VA DMIC3", "MIC BIAS1",
> +				"VA DMIC0", "VA MIC BIAS3",
> +				"VA DMIC1", "VA MIC BIAS3",
> +				"VA DMIC2", "VA MIC BIAS1",
> +				"VA DMIC3", "VA MIC BIAS1",
> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
> +
> +		wcd-playback-dai-link {
> +			link-name =3D "WCD Playback";
> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};

Please sort subnodes alphabetically here and below.

> +		wcd-capture-dai-link {
> +			link-name =3D "WCD Capture";
> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai TX_CODEC_DMA_TX_3>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
> +

[...]

Best regards,
Alexey

