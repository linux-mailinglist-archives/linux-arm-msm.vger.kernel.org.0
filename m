Return-Path: <linux-arm-msm+bounces-76139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BF185BBFF89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 03:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 42D9034A8D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 01:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DD87464;
	Tue,  7 Oct 2025 01:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ffDmzFJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33BE34BA28
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 01:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759801196; cv=none; b=ZW80Scy658PitQ26P8byCweagclnbagJwPwsvnsnMnvFj9/V/3ST6Ndjpi2XBWz6/e8apkB373T4k/hLsAk1vE4UPdX/gVetfSfPonoSbmmFwksGOubkcBWTm+WU17EUftjPkKXAdNjxP1Z4Y0870yBHE8zMie5r4rw360JEd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759801196; c=relaxed/simple;
	bh=5lqV+ylLnxxR7eQ8mxijlK2NAS5BbPFc0/15e/s8/Ek=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=PDprJaku8T+LAIRO23eC0VKEjueDpqPgVFe7AoBHXUKrF21lu/hY+yxiHZRJFEAANIT4+ec62IWBSBFMsBvfDc/6NI30CWoVaXG4/hvioqNdPHBTR2TThvQhV2R0tZ0VQplLRZKNa3d0TI4ahE3isH6GkkL3FHJj80v5oWVTwcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ffDmzFJZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so52909255e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 18:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759801193; x=1760405993; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWIdECDUUCC2Ce9mQHFr9kZj1FU8R9Q+u4LBmUETnoM=;
        b=ffDmzFJZpsqaunT/rSovqUptN3bRNy87l7BLJXXZ7FaaOkrr1oL3P5tdHane82QkjG
         FnXVf+lmNDSfr/md+TZMYgQ/hJ/UOk/b7a8xA5TF5BP4qbUmdMcnoYPpmTham/uGSZ6o
         P7FBZWmEAq0KZxCvDgAAamacmcWgJQrxpGDIFJpzlApFyc8qufy3cdvV2HWBx4gg+0ug
         GQnRMbNZua3d1Yn0/aL4L4iYykN0wRcPiuDDffXMobFQIb1AgJduZIIW7Mr4p4ST8Zdd
         CkHXBEjZ8+ruavk0m5/7UCemnyhsPS1w3/1VHJihIV1o+/3Jjdwqf4rd8f+XSKiavBvR
         ZEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759801193; x=1760405993;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oWIdECDUUCC2Ce9mQHFr9kZj1FU8R9Q+u4LBmUETnoM=;
        b=V23u9+Fi55rL39/2zoNRORIiWQ1+Xl1lXa/pOYj7mcc5DVgBhrKUU6rCUKpxqR5YVJ
         dzY9ybeZWupBP/BkEf7TLwhIVIU3LAXSUn/0xzpES9l9wpjE1CFuUhrX3SG8I81ijZpA
         fFxMYQg2Oq3fhka4MY2BvzfDebm3ePtFrsCoBAEsHbeFJDPcvcsy4+b+2s08RLRIkWzy
         rbPV/GZysjed9D8t5+40kMso1NgQxsq+YdRhEpt3PKYJCiAZLDcPJoxTedS2HF8ZRRGJ
         M5G+DwNTTOoS+mdTsjpLKpmGAwx0ew7d3D1amLB/iaUe0+KQ5tAMzmhrxIgRQXwKcpg+
         KqQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdC16VJpOq/QLw3q/Sp8+zUz73OYZdxvRfEHx8P7Qw+WT6ddSXZRMhWAii5jYCBCvpf+zHgyvhcjn780fr@vger.kernel.org
X-Gm-Message-State: AOJu0YyvdlDo7CQ0Dxq4ZjhWVAeoYn+CH+3B0qonpI4N31o+6WYr5JUm
	YzLjxdIwJ9B41RBK2ULj+Z/KPDM409xINSySPKYbdiY2+vwYDK7NTdhlkBqmaAh5EImxaCC363L
	lYwB/
X-Gm-Gg: ASbGncuFxu2LXZ4KwuMh7LMXappi2766YX85YOUpo9NJW7GXlwnZ2PHc1QdPB/gEjmI
	1Awj+qrwoDBhRYC4oNuSZMfuaq5a6mluhmLbfn8Ph1jE7p0abv/Acr1SvX0+W/5O229c2Xsb+Yv
	OQki9IIVrdzR5H0EWowDGtcE8ASpo7zLHpTfoi9ksLAAmjgp84NEyKvsxsed+Tk08Z4rK4BIbrw
	ayUtI5hST1xlt1kazsMxR59m+0/iqVQFSm0lWop0U0qU1Fh902UtzGqNIRWhTgeIDH1FTggij37
	5YwaZr+7vPRzJbTtqYa/Ff8k2OZRK/sqTkqIbYpBdJy0JNdLxMXA3NSmddVLbOPVbPR6rOwwPhe
	80R8wETfHi1YNNfQgs8h5/HPrXLdKmNvRWbQ27UEdSonRapKmTHaMbP8PiCIAvSGs3A==
X-Google-Smtp-Source: AGHT+IEP4ZfQ2qXfgkfT08+ifEGZ7mYl7sYutWniRewIAGlV7StrxebqvEk1ShWnLZfyKk8gXlG79w==
X-Received: by 2002:a05:600c:3d90:b0:45f:2bc5:41c3 with SMTP id 5b1f17b1804b1-46e714ac847mr89068835e9.8.1759801193186;
        Mon, 06 Oct 2025 18:39:53 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a265f6sm277651965e9.20.2025.10.06.18.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 02:39:50 +0100
Message-Id: <DDBPGIDN8SKS.2GF6TZC6KGXVI@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 4/6] sm8650-hdk: Enable I2S for HDMI
X-Mailer: aerc 0.20.0
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org> <20251006-topic-sm8x50-next-hdk-i2s-v1-4-184b15a87e0a@linaro.org>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-4-184b15a87e0a@linaro.org>

On Mon Oct 6, 2025 at 7:37 PM BST, Neil Armstrong wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 30 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 +++++++++++++++++++++++++++=
++++++
>  2 files changed, 70 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-hdk.dts
> index 87d7190dc991b11f5d1162aabb693dcadd198c51..1286ce95235d5544322a18772=
92cbdd426298c11 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> @@ -171,6 +171,19 @@ sound {
>  				"TX SWR_INPUT1", "ADC2_OUTPUT",
>  				"TX SWR_INPUT3", "ADC4_OUTPUT";
> =20
> +		pinctrl-0 =3D <&i2s0_default_state>, <&audio_mclk0_default_state>;
> +		pinctrl-names =3D "default";
> +
> +		clocks =3D <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_CO=
UPLE_NO>,
> +			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names =3D "pri-mi2s",
> +			      "pri-mclk";
> +
> +		assigned-clocks =3D <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATT=
RIBUTE_COUPLE_NO>,
> +				  <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		assigned-clock-rates =3D <1536000>,
> +				       <24576000>;
> +
>  		wcd-playback-dai-link {
>  			link-name =3D "WCD Playback";
> =20
> @@ -218,6 +231,22 @@ platform {
>  				sound-dai =3D <&q6apm>;
>  			};
>  		};
> +
> +		pri-mi2s-dai-link {
> +			link-name =3D "Primary MI2S Playback";

Is it HDMI only audio playback or does it have switches to playback it as r=
aw i2s
(when external DAC is needed)?


> +			cpu {
> +				sound-dai =3D <&q6apmbedai PRIMARY_MI2S_RX>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&lt9611_codec 0>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
>  	};

[..]

Best regards,
Alexey

