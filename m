Return-Path: <linux-arm-msm+bounces-21243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C90A8D5F15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC1FA2835A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBC91411FC;
	Fri, 31 May 2024 09:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hYCGEWcO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302EA14263B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149502; cv=none; b=FYFSoznegwcsS22QBVqfKJ9jY9idJph4GsKpaGh1qCzYqVW4jZ6AuW/KHDyZN0ktOPfGd6EAMLgi5vWpMHGDtY2pdDPm48hwflxqIcBmNQ/9ZiKrEBfHSfO5E4blVt+7pujRVC1VRebClNuKwjxnRWCkSq3jIw+7zm6i25mSFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149502; c=relaxed/simple;
	bh=Ea4m4EmsBzvUxnNWy5QLJCJS1X+Oji6ca0jQLxkoPv4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kQCoIwKUtfirH9IwEucYTaYn5mHCMQKMNMv7uekwsyr51fjvgQUAh12a0fPaGYkKOoHIwy9+hQ2G+epIVBpkyCNs2xqZXUJlvKHdYFDlVwKoamhKq2jX/EUQSXbIwSLViSvdOO528+EtKeoV2BldLGC1ipQyiuVe8nffZ8FUQFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hYCGEWcO; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso163635666b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1717149497; x=1717754297; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyBdQ1giefiqSyIC3NfbzMQlfjGB07yddrZiRGX5tiA=;
        b=hYCGEWcONNNwPa6sCANY+I3DQimb+DOhmSg+sIm3z3UDZv7YqrIN74FHih0kFORKI2
         zN0gqr8tsUTEdQEgZFdyVVqdm7NKkpjK9ellJY6vuJ9uk9KRPg3DHYytte8P27V516V7
         mDXSEjfLHVbrocQLU2THdUpp20AHC73XDXVzfhRRWE1J3RiCSkZN6vV35+x/fiVAEGBM
         frPXlDoIf6N7ephsemnMUwUQ26aAOf5i5xdfBn3ArWiR1MzKN3Z8C9UrMLmoMj9ZJ7fo
         DUYVEXiukBRc+igRPfSeriio5N0+Xj2SIBj6+OC71jtvyXb5JQMEa4ELnk15CHCxOkQV
         O5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717149497; x=1717754297;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KyBdQ1giefiqSyIC3NfbzMQlfjGB07yddrZiRGX5tiA=;
        b=jH8gQB8dc+t1OZpASYGQDIgAxxQXFk8SQBbXSoZoQOHnIdJ5eTEzvqvQsPJDSibg5s
         vttiLig6VcpDY/0qEl66vN+kwgBnH4yy31HSw8fwyVB4twinT7oQk3sSpTBI5Fwz8oqx
         iPAUbI96hOLsXVFD3yUL5XFt1dnIzxpa8ewfrh15tTmIcSPlcGoOmcB342+2tOJsxXB2
         n3XFaZFrhQ5TBlVhoSdyWoFaOYL9A1BHq7rL0MFx2W241+vUJ7ZtjHvfg7RkcIobYEI1
         uN1BTZvGSF0GwkT6aCjFrRgHEdoHVxYIdnZAlS47T9KJMyD+D8A8ei4euIHlrluS1jMD
         5+Hw==
X-Gm-Message-State: AOJu0YzjPlQrO775Wp+Qm+aCWC8BzIc+A+1coxab/P8/nHp88fHkIXJw
	b4dbHeAmVQg5sUxhmhHxpmrHtzbr4NV3LufsX+r4whpuN348cFcvWWCz83BnUEI=
X-Google-Smtp-Source: AGHT+IG6H8G8r+vcR9GCR3uUp0/41DCkdZdVI0T3+W5qXfXIs/lpm1fZnLMxqHCcetS4Pi1XrDwzVQ==
X-Received: by 2002:a17:906:6091:b0:a66:e009:eb56 with SMTP id a640c23a62f3a-a682022caffmr77773066b.24.1717149497428;
        Fri, 31 May 2024 02:58:17 -0700 (PDT)
Received: from localhost (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl. [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1a5sm68937166b.53.2024.05.31.02.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 02:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 May 2024 11:58:16 +0200
Message-Id: <D1NQP0JSOAKH.LKPK7EBODNP3@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <quic_tdas@quicinc.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-2-quic_tdas@quicinc.com>
 <CZWOT0K3AE2F.1BUND7M9Q5RXO@fairphone.com>
 <d66ed568-8264-4430-a070-f353879f6b65@quicinc.com>
In-Reply-To: <d66ed568-8264-4430-a070-f353879f6b65@quicinc.com>

On Fri May 31, 2024 at 11:28 AM CEST, Taniya Das wrote:
>
>
> On 3/18/2024 12:41 PM, Luca Weiss wrote:
> > On Mon Mar 18, 2024 at 6:35 AM CET, Taniya Das wrote:
> >> Add the new QCM6490 compatible to support the reset functionality for
> >> Low Power Audio subsystem.
> >>
> >> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >> ---
> >>   .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml       | 1=
 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpass=
corecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscore=
cc.yaml
> >> index deee5423d66e..861b41933525 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.=
yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.=
yaml
> >> @@ -30,6 +30,7 @@ properties:
> >>         - qcom,sc7280-lpassaudiocc
> >>         - qcom,sc7280-lpasscorecc
> >>         - qcom,sc7280-lpasshm
> >> +      - qcom,qcm6490-lpassaudiocc
> >=20
> > So QCM6490 and SM7325 and SC7280 with non-CrOS firmware (maybe some WoA
> > devices?) are supposed to use qcom,qcm6490-lpassaudiocc then? Is this
> > what is intended?
> >=20
>
> Sorry for the very late response on this thread, On QCM6490-IPD and=20
> QCS690-RB3Gen2 boards, will require only reset functionality for Low=20
> Power Audio subsystem and other clock controller functionality is not=20
> supported from HLOS, as LPASS firmware takes care of it.
> Hence added new compatible to support only resets.

Hi Taniya,

My question was more if the *qcm6490* compatible should then also be
used on regular SM7325 devices for example since they'll reuse
sc7280.dtsi just like qc[ms]6490.

And also Windows-on-ARM SC7280 devices presumably have these clocks
locked behind the LPASS firmware so then also such a device would use
the qcm6490 compatible?

Regards
Luca

>
> > Regards
> > Luca
> >=20
> >>
> >>     power-domains:
> >>       maxItems: 1
> >> --
> >> 2.17.1
> >=20


