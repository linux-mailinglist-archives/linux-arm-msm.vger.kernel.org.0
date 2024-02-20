Return-Path: <linux-arm-msm+bounces-11777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813BF85B6AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 10:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3FAC1C23E28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 09:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D6D5F471;
	Tue, 20 Feb 2024 09:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIB+prbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DCF5D8E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708419975; cv=none; b=Gw/Dv1DZo8Pk/JO6TRSoqMzJf7tnWlgvZRVb6CDKlgBQ0wdKrIU0O8kGcutuwloAdlS7B4yQfwpk2UdohT2Rzmktscu0aqP6YhpucS8t4rv5oxmULbH/HdNIDwBUM+mBw7JRrH6cB47KnIg3Akp7Fqi7W5systjKTOgWvV7WWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708419975; c=relaxed/simple;
	bh=N84xpgCHrORAjoI2Nkdi/wi3wZrgord7nWepiT3bvPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgfPnZhaIMOx0KPsqcHZ9BaTJvXKrE8IiEnsbAmKJHAFJU5DR4I49BB3SF8t0LSYClMjuLtEmRecIto6xUtCZEG7aSJt6u3bARTMp13UX2RmOUHRj5HlxQXm6OHBEXjgpvcV68Ud1GlWj0dxi4eVBC1Zr1Z3CxaKGPNj+4KP9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LIB+prbN; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc74435c428so4777293276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 01:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708419973; x=1709024773; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0CyeS56TSWYq1NAjfXsEvKV0TSPVdyTmQCCIvDs6Vk=;
        b=LIB+prbNJQ4xwvId5haLIrz9MKnw2dAFfET7Y3YQF7PBn3wPmQLpZa+6E9ei/DXPmE
         UmvBS0vnLKV087zDaFocXnSsig/WW2LJL6Q4biN4TcXcGiU0q74tQuWlpH4mOVCbfUnp
         Q7RrHBQC7CN+wTw9VGIdmLRfny9zukw4STKn7/2y7wUZgXSe5VQVlQtShFvS6MsQJw5S
         Rq25wYI2NTEIq0zFKUx/Qjg3kFmkEFMtg3w9qDR8gnycsze6A4/KuZkTwO+4VS+iPzoa
         QMtMB8irZuCBIpVkHTkREMxQUnTS+UuBxVRtCfhbSq/B7mgXxa3alRtaUC0GsXawKxgS
         iO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419973; x=1709024773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0CyeS56TSWYq1NAjfXsEvKV0TSPVdyTmQCCIvDs6Vk=;
        b=AIqIe3+VE+LklCtz6mVeDxZ5XuDsoQSU4JNBzCAN0v2tzMS+GrRXNlr9vI6Qzx7EQT
         ATsl2xByG0vd4C/CAN57DDLOj0RQmVYBNZE7TkA58/ESEPNz9+Du4wRv0DVMwKilInqk
         8V+HW7kwct6S6UQiuYM9B11RZ02lwYprKNjx7Z1bGGWCCtdVjGHG1Txemsv9GA/I/8Yt
         tgGeacmpVx/QRWsB0o8jmbhLONxNRdhp0EIS01jfIif6hp/K/opoJvqvdNlFwsaQ8JkX
         Nqi/ugYARrRzrx63fsv5FlMAz3xHZYf02dRQN4m318JXjPMsDTLXbJqZWJJU3Dm/GzL0
         6quw==
X-Forwarded-Encrypted: i=1; AJvYcCW1vJtGkRJpdandcs+6Ds/L5iNtYgrffx8OX3eRdaVM/optFXgo14odpETQP/nLqh8RBeAmnQWrRPi71eqal3adEJhIn1PcZzFbNjeaAw==
X-Gm-Message-State: AOJu0YzWmCXXDPXI1j6opgzgk3wPF2h75r7nihqTACypQw2qNxoPptqW
	4aAVv5cSDHG1wo+yjVqY3DyyndOa7gvOZrEcw7tmfbA6E81AK01bIhsmjmk8BtNss8OdYVHQSVZ
	Z2WgdJHLHA6Zha/rPL9Au7fKu2wqg4K4fT+p67Q==
X-Google-Smtp-Source: AGHT+IF50+ClBlIDnyyXGYJ4+9cr8Az9j0fxyWVTYfiRxOMlR8QjxPnTxJgiBCmodSw3Jj3u9rVrMXJR5+zExry6ZEc=
X-Received: by 2002:a25:680e:0:b0:dbd:553d:9d6a with SMTP id
 d14-20020a25680e000000b00dbd553d9d6amr14218173ybc.40.1708419972956; Tue, 20
 Feb 2024 01:06:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205115721.1195336-1-quic_jingyw@quicinc.com>
 <20240205115721.1195336-2-quic_jingyw@quicinc.com> <2fa4d857-7262-40df-a842-56945ecffb81@linaro.org>
 <441ffff2-81a8-4b53-b15b-5ac6375d65c3@quicinc.com>
In-Reply-To: <441ffff2-81a8-4b53-b15b-5ac6375d65c3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 11:06:01 +0200
Message-ID: <CAA8EJpra8UjWzWArQQg3Cq3m7WLo4Shnsj=EOhb50Yh46bOh7w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] dt-bindings: arm: qcom: Document sm8650p soc and
 AIM500 AIoT board
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Feb 2024 at 11:00, Jingyi Wang <quic_jingyw@quicinc.com> wrote:
>
>
> Hi Krzysztof,
>
> On 2/5/2024 8:33 PM, Krzysztof Kozlowski wrote:
> > On 05/02/2024 12:57, Jingyi Wang wrote:
> >> Document Qualcomm SM8650P SoC and AIM500 AIoT board.
> >
> > Please describe shortly what is SM8650P and what are the differences
> > with SM8650.
> >
> >>
> >> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> >> ---
> >>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >> index 1999a5f2f254..e87ceb42853b 100644
> >> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >> @@ -88,11 +88,13 @@ description: |
> >>          sm8450
> >>          sm8550
> >>          sm8650
> >> +        sm8650p
> >>          x1e80100
> >>
> >>    The 'board' element must be one of the following strings:
> >>
> >>          adp
> >> +        aim500-aiot
> >
> > Drop this line.
> >
> drop this line will cause fail dt binding check failure, any suggestion on that?

It will not, it is just a free-form text

> >>          cdp
> >>          dragonboard
> >>          idp
> >> @@ -1051,6 +1053,13 @@ properties:
> >>                - qcom,sm8650-qrd
> >>            - const: qcom,sm8650
> >>
> >> +      - items:
> >> +          - enum:
> >> +              - qcom,sm8650p-aim500-aiot
> >> +          - const: qcom,sm8650p-aim500
> >> +          - const: qcom,sm8650p
> >> +          - const: qcom,sm8650
> >
> >
> >
> > Best regards,
> > Krzysztof
> >
> Thanks,
> Jingyi
>


-- 
With best wishes
Dmitry

