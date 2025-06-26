Return-Path: <linux-arm-msm+bounces-62629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F37AE9C33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E3B21753F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3A3275100;
	Thu, 26 Jun 2025 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7FIelBi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211AE4204E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936142; cv=none; b=qOvy/H8WnAMVB1G5gnx8+5GXlhR/y7xlbjOdvERy2fCILjkbk6dCvQ2LyNlkgvsGZ+1vd5JCS1AVTmR93qra64gppVzuZXTBZK/9JFf6Rvjfxp1EE20FV7NNw0V6w8nQkjUd9PGHoeoWeCWW/c9TGUJzKyw2HIsZ9Hco10RbUPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936142; c=relaxed/simple;
	bh=Jfn0fS2LI3pBix9K0aM+ywu2YM+BVe8pJsIOOMevAyY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=dkvr4T3k3u26fWweX0V0m/3gXcoCbh5ihnuzQOYbAfmhz1QAR1D8J8WMquDDoAz7ezVIzwWbc/qCDcaVX5jihn/JAOQjDGt8/pG5oRDXVT9CWwmnVJkkDJYVpmpqHlR7+K/SdfIqg1mZ2ELZDoOAYQztU9oI0ZVMEzplzGOosFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D7FIelBi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso3009375e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750936138; x=1751540938; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L47FMmq/heBHOm6gQHtGzqnF4x9Cl2uyNAnRXAGiwmw=;
        b=D7FIelBiZ3Hm3+LTCyuURHsgZpIEjay5r+e1ThraOFBaJASP+es927Ydqu6Q+ob0wn
         jcch+eeR2/cwORQiufg1xN/ZvZgydLvD9iiH0R+5puFJgpZJ9hyFY8IecgI6kuVp5Yub
         EKDx18upmAPBClNs2kGYy8ZwfXpB5dIffoMwMWP1qHkSe6dB7/zBYzOt8suOx2xbh4uo
         R72uF97skIr9m4/fn9WR9z8VNykciYtG8X72TCl/1DEX0rTJ6sv6mQGHeGrjdIXZn6UH
         UmdbYQRfFDIysKg5dR1Hc+4Yd7TBhCg1qCAhHi/RReugjouzr6l43xWXERhRHlwVKBct
         TbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750936138; x=1751540938;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L47FMmq/heBHOm6gQHtGzqnF4x9Cl2uyNAnRXAGiwmw=;
        b=n3jRWVxa8Y2Dz/dxi/Xw7kjvrQEPgc/mjEwQO7IukGK6niF8Ej42ojRpfucZUAA7Xc
         nvDDl1tY68gQYY4G2pZy9hmU85haGh1ITS8GhD+kgDqgQo9Ob9rp0VqExhw0IBv6/TMn
         cmYYMpg0zeX5lK4kzLgXq2PXQMQhRnKn7KkKX7HTuNf+pT+9B8BNdr13deOvT55elfW3
         RYQ0jiRlCfykLrKRTnYz44VplXTto0kTAeC6SQILNgrd07R2voqu5eLCmmIhsHQYdYKt
         pesrRgKNvguOheywM/jQjgn8rsm2CEbcAmCY0hgcr/AdY9hw0eFpb9zanMZlsh8bN5Oz
         KKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaAibtHts/uSkjZ30HxwtVLbzZ8i/oTnayCECtbv5J7Ur+gvWv43MYOydnnMGPC6yw2dCSB/EUxQBJKmiU@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1ETNIwY4bhU9rQrTJeZszxqWyKC2Agv5Kw6fmqzLGjIKemRv
	ctUyIv0VgcaLaAQnxgVo6ZyW5ZDsJZERLMkHm1YhcxIDVFvIKuXkoAo/cCmFJ5eS8Y8U/2dLuJD
	gQTCAm2Q=
X-Gm-Gg: ASbGnctYmnamnelf1Zk7jnSBspU9ud/DJhN+a2ir51QY1NNa8K59+Aq2s8KDrFmAj8U
	WUEnqgumGFFInaXpq86Aj+pZC2r0rveZdOEJf6vEgsmu3+CEBI6e6o0j1YwyvnClCPWUcvMIz/n
	YP2C/XiSJps2xlY8L33LiNB3zqwJilYB4Tn0rCQ4oQTs2tFm8k6mqsM4tv2ECThWQSFnSHiMEwA
	2v7m+CrOApP+nuxghIgZyWtnZstxQRCJ7a8MOTOXbkBmq21k8TuMS0o5hjGvOUYYgbzEEO1ipE7
	STS82q4NLNNDmrwJCVbOl5A3nPgk+OzR9fwXMoX52Nx4KsrEKsk600cujx38aXwGa7g=
X-Google-Smtp-Source: AGHT+IELxnFr+7S8k465yXgeM0nKFIFmu+MciekB6iPH5ORG6jBuwjyOj4litHeUFKiMBlazAykM6w==
X-Received: by 2002:a05:600c:1e1e:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-45381b0632dmr72455385e9.31.1750936138307;
        Thu, 26 Jun 2025 04:08:58 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390c88sm17336235e9.8.2025.06.26.04.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 04:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Jun 2025 12:08:56 +0100
Message-Id: <DAWF24I1XW5Q.3FDHE6CS3DZBB@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 <linux-arm-msm@vger.kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Lee Jones" <lee@kernel.org>, <linux-sound@vger.kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
X-Mailer: aerc 0.20.0
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org>
 <175090145961.2702141.17071553013552846812.robh@kernel.org>
In-Reply-To: <175090145961.2702141.17071553013552846812.robh@kernel.org>

On Thu Jun 26, 2025 at 2:30 AM BST, Rob Herring (Arm) wrote:
>
> On Thu, 26 Jun 2025 00:50:29 +0100, Alexey Klimov wrote:
>> The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
>> It has TX and RX soundwire slave devices hence two files
>> are added.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  .../bindings/sound/qcom,pm4125-codec.yaml          | 147 ++++++++++++++=
+++++++
>>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  86 ++++++++++++
>>  2 files changed, 233 insertions(+)
>>=20
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
ound/qcom,pm4125-codec.example.dtb: pmic@0 (qcom,pm8916): audio-codec@f000:=
 'qcom,micbias1-microvolt', 'qcom,micbias2-microvolt', 'qcom,micbias3-micro=
volt', 'qcom,rx-device', 'qcom,tx-device', 'vdd-cp-supply', 'vdd-io-supply'=
, 'vdd-mic-bias-supply', 'vdd-pa-vpos-supply' do not match any of the regex=
es: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
ound/qcom,pm4125-codec.example.dtb: pmic@0 (qcom,pm8916): audio-codec@f000:=
compatible:0: 'qcom,pm8916-wcd-analog-codec' was expected
> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202506=
26-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org

The second patch in the series deals with that. Reordering these two patche=
s
doesn't seem to make a lot of sense so I guess squashing it in here is
a way to go.

Thanks,
Alexey


