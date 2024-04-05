Return-Path: <linux-arm-msm+bounces-16512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5426899B26
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 12:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE5A282A99
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 10:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8978516087B;
	Fri,  5 Apr 2024 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGWwebyO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5571552F9
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712313981; cv=none; b=QBDi4d+9lhI1QkJXoRCVouG5A4iekb6SuNRDKd9efNtDqjIuU2KmoRENY18qjgmZlP6gNhrujIoSPUvvckMahCeAwBSPtp41FjHc6ny7WnOOW1prZbisRUSeteYU8hz5jIsbo+Y8G7+FKkgpt7ulNS+6J1rSNBxEYJdIdG5muag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712313981; c=relaxed/simple;
	bh=L4E8p/GV0Ds3nAyTGC7XhelVlzhjjV+Qy3Ty0PI9xhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/hUV5576zHFcThiEe6DZ7jF+hh1G44Fh6+thWaCDz3d3V1CTz17jzCrbTPDAsMtHw0wCLg04aafrV47AgFZelyKnuNQuD2EV+Ye3mtbtlPC46YUZN9LNAFZ/AbCKaitSB19xeXMRwIrnRXQor1fQFDOZwicIKsbZzlw4CovC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGWwebyO; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-615038fc5baso21449967b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712313978; x=1712918778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q464s0pydIE+zRv4fDUf6M5jc7NXRIaMdUPXgVeAtAQ=;
        b=GGWwebyODwX1q83KcA6XibR/TAUUryUs9RAXB6qHCP44ebWZzZS5aIXNPQWAxE1AO7
         gYKsazdPwfBfDJvbTpgXc68DiPMoCz+dqMq9Q0M1hIaJnwpCyA9SrtkIubiAXlCAMcsS
         78goY38sLNRvBNY95rZKbN0OHqZytgDZd+TFDwzZvnl6+F9Nvu3hDdFSvn/ovsPPgNkm
         OI6GYMzBW4EXmaee6BavjZ9WetJnuyyzm1Hm4oXdkWhqAlr93wPkIbuAb8bvH9ofV9qt
         gpwBNontvPPV6cDagbQqe7sMvoItWqAjbq/YWvIHiu5HYF6PabV77Yavag1P+VUnamnX
         Hadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712313978; x=1712918778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q464s0pydIE+zRv4fDUf6M5jc7NXRIaMdUPXgVeAtAQ=;
        b=s7K1aJpy4iLeJ6Fz5vz6RAyaMftyix9CFfWkAQ2S1sdrhj6+lAHT/KvOFMz9q8bkHj
         kTxESzRpGjwQb1WXJADe+aAaeDOL7DceSfpb0foCGyLVFMh41D0C0tWHCXnYcMFpvKSb
         K+1dt7Jf3rKg/C5t6e3XAZf5bL6dehlHJsDJAwkVVEGfzyqLeUvpOiZNpNltbS9ZqEri
         jZ1imylrNQH2XZsJXY5V2cosEtsnT9H+BcKpBDytA79ilZDD6bwBjAzypvrqMo3ZQHEA
         6DYHE0+lxvMmJwmK3IBwsyaSreuLwqQdVSVAPE1syFUI4eoO+tYXGx5Grx1j2QZsxqUx
         STeA==
X-Forwarded-Encrypted: i=1; AJvYcCU8yT7qsbTH9V9pAo5rsgzNKvFK6lwlWePmkfwQIPxX2is1FzCpJzsotz3IFw1f3cdnSF8HvAYNgMX1wE5TM3hmMRhum4ZZg1bxGOKb/g==
X-Gm-Message-State: AOJu0YwUxPRlJTbVpf5D4aJBOBy125p2kfOwzVjk9LQm+S771LkZ6JVF
	UqfDx5pkcH4lurjCaT5NCnBOVFUY/gQKks9UWkA8Jqe/dyAHFhpmbNiGh8/J3pOJg9C3VJwuudC
	fPw5Wu3gDRDVKc7Kydx7MDQjQoGc6lkRMuQRxqA==
X-Google-Smtp-Source: AGHT+IFD4lOAA6OE545MWaALDTv8kewFB0UhOTHwNBgdOdA/c4Xh5GLbUDrWS+o4QO2az8mbVpwytUQzz3UDkLFdfw8=
X-Received: by 2002:a25:bc85:0:b0:dcc:44d7:5c7f with SMTP id
 e5-20020a25bc85000000b00dcc44d75c7fmr782319ybk.62.1712313978067; Fri, 05 Apr
 2024 03:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404084631.417779-1-quic_mohs@quicinc.com>
 <20240404084631.417779-2-quic_mohs@quicinc.com> <CAA8EJpqWaYhzPKgTREtJnfdNZ4oSFZaRFM7Jhg+qd3AqadGOkA@mail.gmail.com>
 <797d67b9-9e09-8b84-9abc-dd4a4a2a40f5@quicinc.com>
In-Reply-To: <797d67b9-9e09-8b84-9abc-dd4a4a2a40f5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 13:46:07 +0300
Message-ID: <CAA8EJpo2__vcpqq1zofyyZ6UwPPn7Ed0R=TPcMZ25+JHwRExwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd
 QCS6490 sound card
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_rohkumar@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 08:56, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> On 4/4/2024 2:23 PM, Dmitry Baryshkov wrote:
> > On Thu, 4 Apr 2024 at 11:48, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
> >>
> >> Document the bindings for the Qualcomm QCM6490 IDP and QCS6490 RB3Gen2
> >> soc platforms sound card.
> >>
> >> The bindings are the same as for other newer Qualcomm ADSP sound cards,
> >> thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
> >> is separate.
> >>
> >> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> >> ---
> >>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> index 2ab6871e89e5..ff1a27f26bc2 100644
> >> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> @@ -29,6 +29,8 @@ properties:
> >>         - enum:
> >>             - qcom,apq8016-sbc-sndcard
> >>             - qcom,msm8916-qdsp6-sndcard
> >> +          - qcom,qcm6490-sndcard
> >> +          - qcom,qcs6490-rb3gen2-sndcard
> >
> > My 2c: you are adding one soundcard for the SoC family (qcm6490) and
> > another one for the particular board kind (qcs6490-rb3gen2). That
> > doesn't seem logical.
>
> The qcm6490-sndcard compatible for enabling soundcard on
> qcm6490 IDP boards.
>
> Will change compatible name as qcom,qcm6490-idp-sndcard.

Any consistent way is fine with me.


-- 
With best wishes
Dmitry

