Return-Path: <linux-arm-msm+bounces-75606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 818C7BADFCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 17:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3840B4C216E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 15:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D5D308F1F;
	Tue, 30 Sep 2025 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HTj2ldqH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E2B20E334
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759247991; cv=none; b=YjwhICSl+gfmx2mo7gebSlD33RG5Qrc8piIfZuauY2hmeRr4rRRUg5tECejKSGuxAKIPyEwm5ilbToPZ+pZHpkaPEWqNJxjvYL02dib9NWvC897NdTVWoPSToXO1eYaWa41vSJqXj781HuwgQWOKTQLbm8d5qsk23zfuOsb22nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759247991; c=relaxed/simple;
	bh=AVM+f6993GG3pPTGXpDB9FNg13zb0loTdcuhSe/D63Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PrEH7yGopWMInRywW/NH55nkEodVDwGZPX/P82jaXcfYY0l7K1UbgFww2GkQxH71eEhFWlrczRqXbLf9LNG4kHVfTehcIyyssh4Z7oAXLEkGUg4bv3vzrxdYW8uwxufWQcLSRPGiW+SR9lvpK1sEh/NU3mODZUWuwfxzXlv+hwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HTj2ldqH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so47103755e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 08:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759247988; x=1759852788; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jewn4YU/vUIZPW/z42z8IyS83UgUexK9MRMwSa8wuVM=;
        b=HTj2ldqHqECeS++YJjG3LkVp9U62Kk2sFTKiNwdeaMizJxBXTU5LmE7bHHHj4WS9pg
         GxVlQJJBYrDCD8Q6kGJzgNodFvLWVxlF7IlrVnp9BlVd0fil4tp2S5zuNMgZ2b87IAOW
         zBCxNKKQ6u4fIcLXUkY10beovm5Zu/Ge7BdXnqYBCN53o8UULCqtqg1stn3Wz3EuapjL
         1vvvDLa6ZuU8VwjmQoXf4tRGWBNp7asa9UoN1lRSWrSEpce3AamM9u6oSKpBsGQiz5su
         sC4JQflC1AeLF4iWOKi8ybFXb/F9QS6Ek5WS1FsgSBhyNDk1Gixqse1hvkqhLqZ4u1hG
         mJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759247988; x=1759852788;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jewn4YU/vUIZPW/z42z8IyS83UgUexK9MRMwSa8wuVM=;
        b=DVz2SbTlzpWudSy6dsNCuR5yGTt48fNJ+IxaKo1KXQv+Mt4U0b8adzgR+2S2S/jAsU
         bh96nt0xlKS7zdPL1k0caaPmq+1IVckmgy8jodZqcR/4Z3AEjCkvdI16KehYn/Jv2Wbo
         PvSfmNeFJzSKvHELi54YITrIMKWNF8Y5rrR107WIcF/SgVxY/YyEGwdnn5wqkOvOWBY6
         kef6I00lUo/JSKf4ieQI/0lA1+C2ZKz+UYbDhYbzGBDEXHayStWD5efIOdrX44vwOlCs
         gY964R6+ZuY8q56xRJrS7cmmmkHhyX2NZqo4ntFiVleR25DaQpcaN7xJ9TuLuxqLRCX2
         JZug==
X-Forwarded-Encrypted: i=1; AJvYcCXrXdOT1Dsa7bHxKqdIe+9dHs8zQa3TjG8lePnwEPA0prBc2vAkiEP5i9x815ioZaHpEp2+0lfy5u5jwYTu@vger.kernel.org
X-Gm-Message-State: AOJu0Yws7B+VYxvZPKr+P+t7QeNGrzXci2suOUrsi4QPBtHQAnOhYqd/
	FPORhwPGtjSgzvjDsYe8JolBkjZ5+29JQaqqT6bUD2zSzsj6ik/tE8QarJO9fXLxLnM=
X-Gm-Gg: ASbGncuEyoQyIBduqXL10f9AZwUwJNY9vZSnogQjXwzgDZ0XnZLDjpy8++aA6Zy7pAM
	OGowJ7AbR/iCAj4080iGtTnlQRW1zP+2n+KLkkR4NFzixBRI/HqvVpg+rEXzDlbFL6tVDozj8Bn
	9cQHnaNx4hP6wRTlmFEsFjw2qyjir4VcaSAW6TV6+7PW3NQO2vv4kcJgO5yYFdhZJNwH7it8jin
	6AITZcEpWvvw5coj0Yf8KXophZncPePWvW7767WyQh5qz9pWRdljQGGBSifJLONpdrFON+LMUVY
	ytHQYEbtoTMJ3jeGkI6bNPua6jyM3ZBztjxP/5UarrkeBuv2rrOYu8Neyllqi4itsqr+aSYSyl1
	I1v2NG6BEioqkqxDO+oFdxz+YwuGo5aBHoS+bUhrEUFQ4k1H4LZCkn2SWUfE=
X-Google-Smtp-Source: AGHT+IGgWhUKC4p7LLQ65Y2Poqvj3Z/K2NZk/M2fzSl7pknsxh6YoTUT2JS4bAKz8Cg2Bjs6T9NXkQ==
X-Received: by 2002:a05:600c:4e48:b0:46e:59f8:8546 with SMTP id 5b1f17b1804b1-46e612674afmr3283495e9.17.1759247988059;
        Tue, 30 Sep 2025 08:59:48 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:248:54ff:fe20:c34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56f53802sm61255805e9.9.2025.09.30.08.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 08:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Sep 2025 16:59:46 +0100
Message-Id: <DD69D3NF9QWG.3NJDD1L5EQFMF@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <srini@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: sound: qcom,sm8250: add RB1 (QCM2290)
 soundcard
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-2-81a87ae1503c@linaro.org>
 <l6itr3k7taiyiokaahcg2mwtaa5lynia4bimxridpsyymk5ml4@loii4h7lhjhz>
In-Reply-To: <l6itr3k7taiyiokaahcg2mwtaa5lynia4bimxridpsyymk5ml4@loii4h7lhjhz>

(update emails, drop old ones)

On Sun Mar 2, 2025 at 8:20 AM GMT, Dmitry Baryshkov wrote:
> On Sun, Mar 02, 2025 at 02:49:52AM +0000, Alexey Klimov wrote:
>> Add soundcard compatible for the soundcard on QRB2210 RB1 platform,
>> which at this point seems to be compatible with soundcard on
>> QRB4210 RB2 platform.
>
> Is it? The RB1 uses PM4125 for audio output, while RB2 uses WCD codec.

That's correct. I also managed to enable hdmi audio, vamacro dmic and
pm4125 line out output keeping it all compatible with qrb4210-rb2-sndcard.

Things are mostly the same between RB1 and RB2 apart from last stage
in the output and analog inputs (non-HDMI and not dmics). The diff can
be described in board-specific device tree, amixer's control commands
and model property.

Is it still need new separate compatible "qcom,qrb2210-rb1-sndcard"?

Thanks,
Alexey

>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/=
Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index b9e33a7429b0c063dc5f5b806925cd541e546cf6..2493ed99268bf2ff83430201=
50c2c9aca4262514 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -21,6 +21,10 @@ properties:
>>                - lenovo,yoga-c630-sndcard
>>                - qcom,db845c-sndcard
>>            - const: qcom,sdm845-sndcard
>> +      - items:
>> +          - enum:
>> +              - qcom,qrb2210-rb1-sndcard
>> +          - const: qcom,qrb4210-rb2-sndcard
>>        - items:
>>            - enum:
>>                - qcom,sm8550-sndcard
>>=20
>> --=20
>> 2.47.2
>>=20


