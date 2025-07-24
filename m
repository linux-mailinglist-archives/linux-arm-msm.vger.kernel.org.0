Return-Path: <linux-arm-msm+bounces-66600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4249B10E75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 17:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C901C26A09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CAB2E9748;
	Thu, 24 Jul 2025 15:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhjY7Olt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E7423A984
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753370225; cv=none; b=U+FMNFV8YmYs8kQu4tpvuo89xDUdzlrsFxGYHt0LC5mv2OXeWYfF+eBAHdZfSyF/lihrnKDfyx5OmA+W/SyNeW0dZvMyLNxBPkoTqTMXJZ9FBAdlHOGsoRHfoyCn2tYfQL79U73bI1VQzk+vOoqez9jMKLF5kI+7oJ2p7h0/UAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753370225; c=relaxed/simple;
	bh=rRtJDDGQNkuc0IDMIF8Hm5MSrjYukLVoLEvXaEsR1bY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oHVj+pABv7N/07pDRL20TBT5XpzQXyCZIfUudh9MK4cACLhB9P9yFsYmQkvRT7tFQfM0q0P3yMKQ+P4ocH6QrX2BS6zmaXPGbGSEw5ufdqJSkfVNGcLelIFLCLN/klOeW3PrQXotUouobxiP5dygCmlCKBpE4j5PGnwGfc2sjqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dhjY7Olt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b611665b96so677398f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753370222; x=1753975022; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZljJ9jOeuFt5jY4KeARy4p3x6G+xgYYvDLqDLNf7nc=;
        b=dhjY7OltHsxm/AGoY3QSsmkF2UkF/PFkRg/gZZrLCWFX7Hjvyr5WOO6WCvgSxdr76w
         3Fpicaep8bZzv6FoD0NEmDpE90pdhTq3l+KQDSK/ypv+2rK9S2iZ9TeG5JNnfougRLre
         nRZqm48H6ngL5rcIsVpMn+X+g+B2eHzuPce1J3T/zZfug4QPPgFSAo3Z9KHW1Un78gik
         k7GAHek8eH0PAmZ5M+B+fVSGNFJr2h7Yhc+5LnBv/fEifosmSQc14lK0kaYhJXEsorFD
         hxXvVxqRrYmrvBEpOkJplngc4NaP5eZpVnvto64gxhjFsSDmsr/FjNrowryW6Ozf2j1X
         NKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753370222; x=1753975022;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ZljJ9jOeuFt5jY4KeARy4p3x6G+xgYYvDLqDLNf7nc=;
        b=qsT2CXejKYQOtGin/NiV0yeoXUr9BvJf9tyb5k0Qfftv7BfhX+Q/YN1GtiHZdVIpzu
         1OsNKyn2+5XYjBWUexNepeHWrufd1HDYAiASEk6YU9IDdZUT6/oH+swybd0+MoPJ5dqo
         E22R4QTkL2NxO5lw5eGEdBuXrF0Sbdmq2AMpsCxLQdAw3NgLfR3fziYFxslgAsjyd6RE
         k72iYuKn+KfpYKM7KUxAQ6IphrY05OkcyuT6XrJ5CgZDl+if0p5DkIl9vuClIObUETLu
         cKf1y2c5aMXSSZ5TMjNa/yX5/qB+ablxCfjf58InCWbM4mYWTQJkAL0sFA8+71NANNxI
         XdBw==
X-Forwarded-Encrypted: i=1; AJvYcCXh7v99Me74A73Fe3zInMuCXkFeE140m7p5RsDPKpMXeDycQkGmskWezu0FbsiQn3UvAJ2+UwaBJ2+5mZEe@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqsObqpWUuxl1sHsPypcsqm0+iwtH8iNHE+NYxC8fGB1j6zhW
	Yq3vd7ROO4bjbdrM4TPjcXQWIWEKgwbwOF1aQjSzC4hATBmhbW+zlvq62vMWMKqTBlo=
X-Gm-Gg: ASbGncu/QrcTnnOW2rn05kUP+XXO2gJYfqjrDAhOFwqxaE//QlBLp9Fwg6sx1vwC+jX
	+gupKWMZraSrnB22We6LyXO6sTOTu/LQrO+ArWcymr7sfPeOcUIXQ7wXtbOsYJttcIQ2CcSFTP1
	0XFANZCKHpjqdw4Cv9uh0Demyd39/9ws3sD12jq6B71NIUjhXO01x/kviioZrgOiUm4GeM6rRab
	PTttGGLMVNnqbXzLi1vgod3EzAgBto0941shxLSwc/5qtDLunKrW38q+HJF5bb/ILTJAGUP1Scz
	fTg3G7gq6jF4VkQxSO1Pm8eLeDcBuJVdRhTN9z1l4M17cDInIPmS5djB1mPoMQ9rBrXyueS1NaJ
	wDpnfJeyMhccIfkzubQ6tJwiy3Sw=
X-Google-Smtp-Source: AGHT+IGJIwXjAl0x8bo9+v9cZ8DYgapXIAGw1HX/4H1PrXe4j7vZaMGeCQer0wRpipUiu61pr3zj2g==
X-Received: by 2002:a05:6000:26c9:b0:3b3:9cb4:43f9 with SMTP id ffacd0b85a97d-3b768cb12c7mr6437878f8f.16.1753370221540;
        Thu, 24 Jul 2025 08:17:01 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b77078b1absm2257447f8f.1.2025.07.24.08.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 08:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 16:17:00 +0100
Message-Id: <DBKDVB96ZC98.NOF39E05HZ8H@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: add bindings for pm4125
 audio codec
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Lee Jones" <lee@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-1-13e6f835677a@linaro.org>
 <20250718134334.GF11056@google.com>
In-Reply-To: <20250718134334.GF11056@google.com>

On Fri Jul 18, 2025 at 2:43 PM BST, Lee Jones wrote:
> On Fri, 11 Jul 2025, Alexey Klimov wrote:
>
>> The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
>> It has TX and RX soundwire slave devices hence two files are added.
>>=20
>> While at this, also add pattern for respecive node in mfd
>> qcom,spmi-pmic schema so the devicetree for this audio block of
>> PMIC can be validated properly.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +-
>>  .../bindings/sound/qcom,pm4125-codec.yaml          | 134 ++++++++++++++=
+++++++
>>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  79 ++++++++++++
>
> Do you have to submit these all in a single patch?

qcom,pm4125-codec.yaml and qcom,pm4125-sdw.yaml describe one device (sub-de=
vice)
and change for qcom,spmi-pmic.yaml is needed to avoid failing dtbs check.

In theory I can split soundwire slave bindings from IC bindings itself and
I may get questions why bindgings for one device is submitted in two steps.

If you really want me to do this, then please let me know.
Otherwise I don't see huge benefits of splitting it since they
are logically and physically connected.

BR,
Alexey

