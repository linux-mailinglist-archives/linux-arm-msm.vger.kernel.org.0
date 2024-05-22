Return-Path: <linux-arm-msm+bounces-20231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F658CC1CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 15:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D779EB22C6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 13:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AE413E05B;
	Wed, 22 May 2024 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XHhWAFA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7513DDCB
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716383347; cv=none; b=Wzkl7sKtZuTlpHWGHDTTlnc2S53Qdx9pEQM5DeOY3m2vbIvLR+iI8Xjj0DuVGkLafxlMDyxt8xppqPEt7ostDCahWZdogSjfGaHHzrl3dYsk7POoYDXTO3NK35ILoLJ5iw+dkQfpUhx3zDgeOqfwsO8k/WO9MBQvXevaJV59m2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716383347; c=relaxed/simple;
	bh=WS7882mzHgfs2gNdKan30wkPOWoctxrHpnRRZJBBj+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rK502VuNK7Y2IRH4U0cevxzbzIk28YmXXvPGX94+WGdzcFCJx8CtBlji6fas4WfZDgF6oLHd8D18io/kOabUQg5VblA8/+TEzmwwOETrFeECgz2Oa2yq0NtI0bnirj32bDgbVDueyAVoCOR97xWqzWfPeeTcl8WCthSg7qxzLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XHhWAFA5; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5ce2aada130so2164738a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716383344; x=1716988144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjQG+ZVRqA/OwyUtRk8c53CTAn1WGq4lEjgouxEuyEA=;
        b=XHhWAFA5VoeY691VBB15vt0nyBEvac353DKTQrz7n6s9H0Yb1cAP1CCAGubtXINYkS
         P/hSlL1atErlOqv1MXnOCMe/bkXhHEgGaJoqsLLC6tcAyH6eUuJcWXMD+oYsl5X5lmve
         RElVEjw/kWn6q8qKD/1fMsVvOfFynRmtpZGga5FWeMf/MAfL9CbXD4urvUxUA/8pghdQ
         2J19Bm9IczyDUmdxD+zZz0CtPBkkezbrdILM1eNCncA/2DFJAVb6dl4sc1NNIjbmCkD2
         u24pNHQ4aXJ2EQ7GQtdQXDe173vYELAmeIdKyFJaJAIm/ZjV+kSFNBh3qzN02j1+qyU/
         ptww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383344; x=1716988144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjQG+ZVRqA/OwyUtRk8c53CTAn1WGq4lEjgouxEuyEA=;
        b=S3Z9lJ5n2S6dC+RAVNZoglNqL2SFR2v7oW5iATqHYCCjkEb/SbP8dMhkktOpFWvPLp
         3/YPXuQWCpSDMiM61wCu7Q2DZxeOHRb43mexxdeAZw1Ynmsdf5XzcmCGFoLC9ThiUqS6
         kav1p9L77oU72+BRN/CcfWsnKZ0XFWXZiHyz6cysLCuLanot/ksbgjyerez9tkZjnDJw
         gNg64UO63DUyYutEglTXq9pEtbil3p0Pv3nfp7r2xVjKG39ur2c8yipaRE9ESV/Iyljc
         CtLD/KRQNi3JwaJvBc/UTFFEV3u9wC3+sfuxumLwABJjnTg+jL2U9Sc8s7kbBghc6oE5
         taqA==
X-Forwarded-Encrypted: i=1; AJvYcCWHv6aCjzTxhc8aX6SftL+O6QjvZAu/jRvU/tNXy5hqLVhbXtoYprK7r7jTTuFVtjPLdLhQZ+rsESoEaKYE3NkOpBB/lnfOEyZ3spDhOw==
X-Gm-Message-State: AOJu0YwP7dbar24HurPTzlJVoePRlltViuFG7Qs/RsXy5esBNvIXwLdD
	LbRRwpL+ENvJ/bSTBFoViHbLTrpNG+8U+d3mEGLZCD6EE+1HPuTivj3ngys8yS2gTqc+x4RY+Or
	+Y63WyaSDer9kqtswWsrWHW2DALNxPD0qXqkLFQ==
X-Google-Smtp-Source: AGHT+IGGteJsHxgR3EWxIPX4ekmF8FFLzH3yrNtdNkSNiZJoTME0Oi9hJJmhsEioHBJpUK2qncr9PxTJchD7QRrbI6c=
X-Received: by 2002:a17:90a:5982:b0:2bd:8aed:740a with SMTP id
 98e67ed59e1d1-2bd9f483e65mr1871328a91.23.1716383343671; Wed, 22 May 2024
 06:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
 <20240522-topic-lemans-iot-remoteproc-v1-1-af9fab7b27f0@linaro.org>
 <e89c3270-e51f-4d5b-87db-09ff8f0961e6@linaro.org> <CAMRc=MczvfcXnEae__LJh47T=vCTbCz9EHOrNP+QmpTDvdarZw@mail.gmail.com>
 <42ba8472-9d63-4125-b538-39d8090203b4@linaro.org>
In-Reply-To: <42ba8472-9d63-4125-b538-39d8090203b4@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 May 2024 15:08:49 +0200
Message-ID: <CAMRc=Mcd4qoF-BtHdpHSy5DEDDKYV7RK2hCgegf7_63eRoahTQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 the SA8775p ADSP, CDSP and GPDSP
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Alex Elder <elder@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 3:06=E2=80=AFPM <neil.armstrong@linaro.org> wrote:
>
> On 22/05/2024 15:04, Bartosz Golaszewski wrote:
> > On Wed, May 22, 2024 at 2:42=E2=80=AFPM <neil.armstrong@linaro.org> wro=
te:
> >>
> >> On 22/05/2024 14:08, Bartosz Golaszewski wrote:
> >>> From: Tengfei Fan <quic_tengfan@quicinc.com>
> >>>
> >>> Document the compatibles for the components used to boot the ADSP, CD=
SP0,
> >>> CDSP1, GPDSP0 and GPDSP1 on the SA8775p SoC.
> >>>
> >>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> >>> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>>    .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 76 ++++++++++=
+++++++++++-
> >>>    1 file changed, 75 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550=
-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.ya=
ml
> >>> index 73fda7565cd1..9d3a862c39e1 100644
> >>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.ya=
ml
> >>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.ya=
ml
> >>> @@ -16,6 +16,11 @@ description:
> >>>    properties:
> >>>      compatible:
> >>>        enum:
> >>> +      - qcom,sa8775p-adsp-pas
> >>> +      - qcom,sa8775p-cdsp0-pas
> >>> +      - qcom,sa8775p-cdsp1-pas
> >>> +      - qcom,sa8775p-gpdsp0-pas
> >>> +      - qcom,sa8775p-gpdsp1-pas
> >>>          - qcom,sm8550-adsp-pas
> >>>          - qcom,sm8550-cdsp-pas
> >>>          - qcom,sm8550-mpss-pas
> >>> @@ -44,12 +49,13 @@ properties:
> >>>
> >>>      firmware-name:
> >>>        $ref: /schemas/types.yaml#/definitions/string-array
> >>> +    minItems: 1
> >>
> >> This will allow a single firmware name for all compatible,
> >> which is wrong
> >>
> >
> > So increasing the limit from the default under allOf doesn't seem to
> > work, should I instead keep this and make the lower limit stricter for
> > all other models?
>
> Yes add minItems in all the allOf:if: and add the missing allOf:if: for
> the new compatibles to set the minItems, same for memory-region.
>
> Or you may simply spin off a new yaml, this one is getting quite large.
>

Yeah, maybe that's a better idea.

Bart

> Neil
>
> >
> > Bart
> >
> >>>        items:
> >>>          - description: Firmware name of the Hexagon core
> >>>          - description: Firmware name of the Hexagon Devicetree
> >>>
> >>>      memory-region:
> >>> -    minItems: 2
> >>> +    minItems: 1
> >>
> >> Same here
> >>
> >>>        items:
> >>>          - description: Memory region for main Firmware authenticatio=
n
> >>>          - description: Memory region for Devicetree Firmware authent=
ication
> >>> @@ -81,6 +87,21 @@ allOf:
> >>>              maxItems: 5
> >>>            memory-region:
> >>>              maxItems: 2
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - qcom,sa8775p-adsp-pas
> >>> +            - qcom,sa8775p-cdsp0-pas
> >>> +            - qcom,sa8775p-cdsp1-pas
> >>> +            - qcom,sa8775p-gpdsp0-pas
> >>> +            - qcom,sa8775p-gpdsp1-pas
> >>> +    then:
> >>> +      properties:
> >>> +        interrupts:
> >>> +          maxItems: 5
> >>> +        interrupt-names:
> >>> +          maxItems: 5
> >>>      - if:
> >>>          properties:
> >>>            compatible:
> >>> @@ -128,6 +149,7 @@ allOf:
> >>>          properties:
> >>>            compatible:
> >>>              enum:
> >>> +            - qcom,sa8775p-adsp-pas
> >>>                - qcom,sm8550-adsp-pas
> >>>                - qcom,sm8650-adsp-pas
> >>>                - qcom,x1e80100-adsp-pas
> >>> @@ -177,6 +199,58 @@ allOf:
> >>>                - const: cx
> >>>                - const: mxc
> >>>                - const: nsp
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - qcom,sa8775p-cdsp-pas
> >>> +    then:
> >>> +      properties:
> >>> +        power-domains:
> >>> +          items:
> >>> +            - description: CX power domain
> >>> +            - description: MXC power domain
> >>> +            - description: NSP0 power domain
> >>> +        power-domain-names:
> >>> +          items:
> >>> +            - const: cx
> >>> +            - const: mxc
> >>> +            - const: nsp0
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - qcom,sa8775p-cdsp1-pas
> >>> +    then:
> >>> +      properties:
> >>> +        power-domains:
> >>> +          items:
> >>> +            - description: CX power domain
> >>> +            - description: MXC power domain
> >>> +            - description: NSP1 power domain
> >>> +        power-domain-names:
> >>> +          items:
> >>> +            - const: cx
> >>> +            - const: mxc
> >>> +            - const: nsp1
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - qcom,sa8775p-gpdsp0-pas
> >>> +            - qcom,sa8775p-gpdsp1-pas
> >>> +    then:
> >>> +      properties:
> >>> +        power-domains:
> >>> +          items:
> >>> +            - description: CX power domain
> >>> +            - description: MXC power domain
> >>> +        power-domain-names:
> >>> +          items:
> >>> +            - const: cx
> >>> +            - const: mxc
> >>>
> >>>    unevaluatedProperties: false
> >>>
> >>>
> >>
>

