Return-Path: <linux-arm-msm+bounces-32459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC801985611
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 11:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27891B231E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 09:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B27615B118;
	Wed, 25 Sep 2024 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMeJsReF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D4715AD96
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727255230; cv=none; b=jXx/Xx7l2lB6XyjIkdDHMQOn+jowFMKp5G7FiqiRwJErfproSnjSzS3D3EdTBb6DUK5wtW2fSGRIRgtVfdQtDi6ToBNyBxyvtwDeszDAHLjYNXvNN7H9b0bqFcH0tYI8QMG5FsIv5Huo5JTNFqiSmhtt51KkCGKnSdYwpl0VBiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727255230; c=relaxed/simple;
	bh=0+5X/NfbYD2dkRK1zy5X4k/dPkx9lpuT3S65Jov3390=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQM+TbqT0Sb7ojuijvmmE7V4wJoCuLOsr24lSwhN61LIpS7rkqBRmDy1xU4ckW+C6fM/p6ZhTyVKVypSMh2wp0od+b54DHuiG8msXIOQBr4DMhhz847m6NXS4iDpBz5Jq8b6jGK3WcOpp5WJZlBei55sXFEGUWuA+jo47Q/K4yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMeJsReF; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e21ac45b70so8209557b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727255226; x=1727860026; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UlnD+34HrIONho00Da4MJk+qHahTYRxRnGls87oH0N4=;
        b=mMeJsReFsbd/ZwLf5WoMFbZ3gUouhcYRFMKeGNWbV5Sh0/51TmM9eCRNlZOGynth3o
         8twXaL1Fo2EkK2GTinEQPTqgN10Iki/hnuQcAxNyQFl2asaBYq4ppSIh2WQKdFDhqs0x
         qgkeE1yf2M18Y4+dZCJqMClA9CTWJG3Sjev7zQO7qxGj7VWVA26oewWmNWWVYMzJ5BqK
         ijGn8D5/E23niq7YQ9dCA3NNbskuvDfLXI0mOnkZ2nMh+ldIcIIWGN+IjlNHUr3gaOsk
         9i5hnBVagTgh3EWPFZXN3Zi/falN7z+g0Zef50eeyEdPeN9CrSp6Bwre2T3FPEc/8ns+
         yARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727255226; x=1727860026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlnD+34HrIONho00Da4MJk+qHahTYRxRnGls87oH0N4=;
        b=eK1ajGqG5P0u4WSeJ0nv3k9I1kuAwbc+gZr9gK68s69MVjRVjTMa0sL3FQy1X7bhuQ
         ltjHNkDQKQy7scLAfQtqEuqh+qNs10HnDJMNgU8V1NTAjnEfAuUn9KglnAmgMGWHYDvn
         Nh5v3JKbOyZAf9SmZm336MBP67jYFyg3YcqCqjWaYsGgTmRizazIItclVUYWcFEt2V+4
         7vPMPqONG2yWfo1mIrtwwVt3y+AOSFA9ToUB9ii8Jqnb+6Ib9uu55k5K1atwl48kfFaH
         h4usofl1z6g6zJt0RFJZQ7E7HSlUQjQW+FEgSF+5tbpxg0C3GFN7tiSFCIIUY5RReSXK
         zUjw==
X-Forwarded-Encrypted: i=1; AJvYcCUxBg15eD0r1FMJnnNC1g4icLyiBfrnFWXIp413TUNj4neOUJTOHl1HyXG/x6/RHOY00THWMdAXuzr/T2uS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy371xienwY7Exh1nxaC/UZQwfs1eoHwzK8iGyXUsZLNDU+liIX
	fVPIQOJKYp7KMFfjU6Ehg76qRm09U50Wc+gUFpisyWjPjQqzeDV5oOBQdFB6in9l6ZaU/x6o04d
	foVES/qLhYNMhK5i6S0sBhggbugWrrYJlbhmaGA==
X-Google-Smtp-Source: AGHT+IEackEoo1TjB/e4cAQVTNwDplB4aHvCPwpjjiyPZWQErysw0w+VWgPSUxQpxc+bmK5wVaAi2heln1+aKexMIf8=
X-Received: by 2002:a05:690c:dd4:b0:65f:a0e5:8324 with SMTP id
 00721157ae682-6e21d6e4276mr17740177b3.4.1727255226216; Wed, 25 Sep 2024
 02:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com>
 <bxkkqezsvvgf7xi6nhxjdpxhr76lrcjp65gtk56x45nhkygdmh@z3lzuz6honcg> <2144d060-7454-46a3-96ed-6173e1ba2523@quicinc.com>
In-Reply-To: <2144d060-7454-46a3-96ed-6173e1ba2523@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Sep 2024 11:06:57 +0200
Message-ID: <CAA8EJpoFpiyBC9eTY8tLyaV5Lqr-YjxckK22Twxae0kGYOWz4A@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, quic_tengfan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xin Liu <quic_liuxin@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Sept 2024 at 10:35, Jingyi Wang <quic_jingyw@quicinc.com> wrote:
>
>
>
> On 9/25/2024 4:01 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 25, 2024 at 03:21:37PM GMT, Jingyi Wang wrote:
> >> Document the components used to boot the ADSP, CDSP and GPDSP on the
> >> Qualcomm QCS8300 SoC. Use fallback to indicate the compatibility of the
> >> remoteproc on the QCS8300 with that on the SA8775P.
>
> Hi Dmitry,
>
> >
> > Are there any SoC-specific quirks that demand a separate compat string?
> >
> > In other similar cases (sm8250 vs qrb5165, sc7280 vs qcm6490 vs qcs6490
> > we are adding new compatibles only if it is expected that the hardware
> > (or firmware) is actually different.
> >
>
> This case is different from the cases above as qcs8300 and sa8775p are
> different SoCs.(sm8250 and qrb5165 are different variants for the same
> SoC). QCS8300 has one cdsp&gpdsp while SA8775P has 2, but they share the
> same driver data, we used to discuss with Krzysztof how to deal case
> like this and got the following suggestion to use fallback in yaml:
> https://lore.kernel.org/all/6652a08e-7143-4214-a864-9f27c10d7571@kernel.org/

Ack, excuse me. I got confused by qcs8300 vs qcs9100.

>
> >> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> >> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> >> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> >> ---
> >> Changes in v3:
> >> - add "contains" and remove redundant compatible.
> >> - Link to v2: https://lore.kernel.org/r/20240911-qcs8300_remoteproc_binding-v2-1-01921b110532@quicinc.com
> >>
> >> Changes in v2:
> >> - decoupled from the original series.
> >> - Use fallback to indicate compatibility with SA8775P.
> >> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
> >> ---
> >>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml      | 44 +++++++++++++++-------
> >>  1 file changed, 30 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> >> index 7fe401a06805..a66007951d58 100644
> >> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> >> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> >> @@ -15,12 +15,25 @@ description:
> >>
> >>  properties:
> >>    compatible:
> >> -    enum:
> >> -      - qcom,sa8775p-adsp-pas
> >> -      - qcom,sa8775p-cdsp0-pas
> >> -      - qcom,sa8775p-cdsp1-pas
> >> -      - qcom,sa8775p-gpdsp0-pas
> >> -      - qcom,sa8775p-gpdsp1-pas
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - qcom,qcs8300-adsp-pas
> >> +          - const: qcom,sa8775p-adsp-pas
> >> +      - items:
> >> +          - enum:
> >> +              - qcom,qcs8300-cdsp-pas
> >> +          - const: qcom,sa8775p-cdsp0-pas
> >> +      - items:
> >> +          - enum:
> >> +              - qcom,qcs8300-gpdsp-pas
> >> +          - const: qcom,sa8775p-gpdsp0-pas
> >> +      - enum:
> >> +          - qcom,sa8775p-adsp-pas
> >> +          - qcom,sa8775p-cdsp0-pas
> >> +          - qcom,sa8775p-cdsp1-pas
> >> +          - qcom,sa8775p-gpdsp0-pas
> >> +          - qcom,sa8775p-gpdsp1-pas
> >>
> >>    reg:
> >>      maxItems: 1
> >> @@ -63,8 +76,9 @@ allOf:
> >>    - if:
> >>        properties:
> >>          compatible:
> >> -          enum:
> >> -            - qcom,sa8775p-adsp-pas
> >> +          contains:
> >> +            enum:
> >> +              - qcom,sa8775p-adsp-pas
> >>      then:
> >>        properties:
> >>          power-domains:
> >> @@ -79,9 +93,10 @@ allOf:
> >>    - if:
> >>        properties:
> >>          compatible:
> >> -          enum:
> >> -            - qcom,sa8775p-cdsp0-pas
> >> -            - qcom,sa8775p-cdsp1-pas
> >> +          contains:
> >> +            enum:
> >> +              - qcom,sa8775p-cdsp0-pas
> >> +              - qcom,sa8775p-cdsp1-pas
> >>      then:
> >>        properties:
> >>          power-domains:
> >> @@ -98,9 +113,10 @@ allOf:
> >>    - if:
> >>        properties:
> >>          compatible:
> >> -          enum:
> >> -            - qcom,sa8775p-gpdsp0-pas
> >> -            - qcom,sa8775p-gpdsp1-pas
> >> +          contains:
> >> +            enum:
> >> +              - qcom,sa8775p-gpdsp0-pas
> >> +              - qcom,sa8775p-gpdsp1-pas
> >>      then:
> >>        properties:
> >>          power-domains:
> >>
> >> ---
> >> base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
> >> change-id: 20240925-qcs8300_remoteproc_binding-a2837bab2150
> >>
> >> Best regards,
> >> --
> >> Jingyi Wang <quic_jingyw@quicinc.com>
> >>
> >
> Thanks,
> Jingyi
>


-- 
With best wishes
Dmitry

