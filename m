Return-Path: <linux-arm-msm+bounces-11782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5A785B709
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 10:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8A60287695
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 09:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2175F875;
	Tue, 20 Feb 2024 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkAvqnkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976925F475
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708420516; cv=none; b=fIdBkvdEQm8+GwvuulXC1s7MrNP0HYIJiOHb8Am5FtLYRNyBiS2y5nttenq1sD5LLmINXlmOkR7olg48t1tVgWLiAk7rqM81gbkbLBiwfrYMrFMb0AE5NJxVLCzcTN6pXUE9W3SAFkx/WDaZNcVmTJAFhEB5ivOl+ZmUMz4sPlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708420516; c=relaxed/simple;
	bh=jzKvWzruPOtOOUgf7C9RKAQcvaMHpfXrl6beJPfBfvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJVuOhOvfr+JiaknBSfpT2qmhH/Ys3flPDTm7HOqNhv7Brxlz2tu8JcWWYkdHFnCQ4VcK2gkvA7DjTyrnH6c2GFDlKJRHd7shrrv4lTOd4fiCTsiGHY2d26dEshyjZbiKXj4JRRYjVG/AItRK3+Iek6ZI0FS3e5VaPQeJwE9ysQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QkAvqnkw; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so3386513276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 01:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708420513; x=1709025313; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ql7lTirr7ryakGzvouA+LJsn+KL5xTmh7qqyNvSmUs=;
        b=QkAvqnkw79JDQ356GWDGVICvDwio8zQqSHc78COXKB4imBcRlOM74+q8oeZEUJxi3J
         A9xIYIHdpAwpPJNh0U6lMT5AhbY1FMldtP1MQ6KUK9hsgIGqZZn0VXIfzjItuP5yoZ/2
         IyvHIVt2jE+Ch1iSHV8uYEOE5LvGDDcQMhh2jFPS0n+PCXTRZtnMQP1DETGlr2Tm0snE
         0/wxKdzWaFxl96X1DjitV72xKRIWGdTJNwGW7poeXgJ+U5V4EUW7OKu3f9BWQ6MM/Rj8
         JYzgOURifhzerAOlYsv+KIkosV+qCWSdN1xcYVKTWay3KFIYbGgGHlKAJ9guzpwzKNwD
         +9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708420513; x=1709025313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ql7lTirr7ryakGzvouA+LJsn+KL5xTmh7qqyNvSmUs=;
        b=wpsT2Sq12Z5mGmlzo8K1FY9QUKrz7sHP59biXTxkys6eI00jxSqAWrh+kmAhCK9n/H
         hYtxChS8HHldL/ZNzkXEmrhwmUXGCxY6spkVzuH7r6RGV8fqXzcVjPdW+JRWruHq8uuo
         1Z0o9qwddJuuL38Emhk+lIhv+moO5v+0vsUZHGcshBoPwV8OEQyS7r/tiFQrAF/dRYU0
         2TeDjmNnRZXnu2Vw35+g3qA1HzD0rbIrdVzfLA9riVFEuGb2UmJQvYYWpeSL891Atv1y
         jJu1HwzeTxOM+xtpWtUIvkD3rFwbq1BI0J3lSChgv9EUu6gtRa0L61moiUEFXMEplKc8
         c0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCV/FwGbejAY/r0vdmSqMTMOwJv5wa/sj2IrHCb9f8lJE1ZpHgUPL2UQ1vvBSnyJsLsMtrooeFzhMwqwjz6YvmBVGKc6IL+PU0F85rOTjA==
X-Gm-Message-State: AOJu0YyLpWCzw8cpqpfXE6JFOxUfUpafjk5e5jLC7dsZdz8TknhuRSax
	MUmtRNx9BEYx/N9hBrVivtMya5LLW3jOEgHPU5yHPtBz0MEkenhBI8/iU7hJKmDwkMOuHeEZB0R
	Nu6EQgSeKHWSQjuNAgo0dKC7EAbdB7dR96dIPDQ==
X-Google-Smtp-Source: AGHT+IGSsYxriDVf+wAMND2/P0CoUoa/FeA7zLxFq/CM+q1Y8YgnhshnC9hreiGzHg1sD3Z75ZXkmO2pShsIx4wx+/8=
X-Received: by 2002:a5b:b87:0:b0:dc7:49e1:2b0e with SMTP id
 l7-20020a5b0b87000000b00dc749e12b0emr10520761ybq.45.1708420513595; Tue, 20
 Feb 2024 01:15:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119100621.11788-1-quic_tengfan@quicinc.com>
 <20240119100621.11788-2-quic_tengfan@quicinc.com> <CAA8EJprpMjK03rKPK6wgfVuDvBikYsKZjMc0Wusa1BxFOBnXhQ@mail.gmail.com>
 <86672501-206a-49ed-8af7-2b6c332c1697@quicinc.com> <CAA8EJppkDDACV_sLxFW4EqKQLHfo4ivSLwa_jCde8JpeH4YfzA@mail.gmail.com>
 <88845d8d-0b58-46fa-8c52-c1bb4f2d39f8@quicinc.com>
In-Reply-To: <88845d8d-0b58-46fa-8c52-c1bb4f2d39f8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 11:15:02 +0200
Message-ID: <CAA8EJpr_vqwpf89GvyAUYJwcrT2mZxwWUkkqmDEOGH0Lci_YYw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: arm: qcom: Document QCM8550, QCS8550
 SoC and board
To: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Feb 2024 at 11:09, Aiqun Yu (Maria) <quic_aiquny@quicinc.com> wrote:
>
>
>
> On 2/5/2024 9:48 PM, Dmitry Baryshkov wrote:
> > On Mon, 5 Feb 2024 at 12:21, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/5/2024 12:29 AM, Dmitry Baryshkov wrote:
> >>> On Fri, 19 Jan 2024 at 11:07, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
> >>>>
> >>>> Document QCM8550, QCS8550 SoC and the AIM300 AIoT board bindings.
> >>>> QCS8550 and QCM8550 processor combines powerful computing, extreme edge
> >>>> AI processing, Wi-Fi 7, and robust video and graphics for a wide range
> >>>> of use cases for the Internet of Things (IoT). QCS8550 is a QCS version
> >>>> for QCM8550. Modem RF only in QCM8550 but not in QCS8550.
> >>>> AIM300 Series is a highly optimized family of modules designed to
> >>>> support AIoT applications. The module is mounted onto Qualcomm AIoT
> >>>> carrier board to support verification, evaluation and development. It
> >>>> integrates QCS8550 SoC, UFS and PMIC chip etc.
> >>>> AIM stands for Artificial Intelligence Module. AIoT stands for AI IoT.
> >>>>
> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> >>>> ---
> >>>>    Documentation/devicetree/bindings/arm/qcom.yaml | 11 +++++++++++
> >>>>    1 file changed, 11 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> index 1a5fb889a444..9cee874a8eae 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> @@ -49,8 +49,10 @@ description: |
> >>>>            msm8996
> >>>>            msm8998
> >>>>            qcs404
> >>>> +        qcs8550
> >>>>            qcm2290
> >>>>            qcm6490
> >>>> +        qcm8550
> >>>
> >>> Drop
> >>
> >> we want to introduce qcm8550 here.
> >
> > What for. It either had to be introduced beforehand, or it should be
> > introduced when one adds support for an actual qcm8550 device.
> >
> >> qcm8550.dtsi has been introduced and qcs8550-aim300.dtsi include
> >> qcm8550.dtsi directly.
> >>
> >> qcs8550 is a QCS version for qcm8550. qcs8550 is a sub-series of
> >> qcm8550. qcm8550 will be a firmware release series from qualcomm.
> >
> > All three names refer to the different kinds of the same platform. The
> > base chip name is sm8550, so it is the last one. Other than that,
> > there is no need to include any SoC compatibles other than the actual
> > SoC name. See existing qrb devices for an inspiration.
> >
> >>
> >> here is the qcm8550/qcs8550 detailed spec:
> >> https://docs.qualcomm.com/bundle/publicresource/87-61717-1_REV_A_Qualcomm_QCS8550_QCM8550_Processors_Product_Brief.pdf
> >>
> >> here is the sm8550 detailed spec:
> >> https://docs.qualcomm.com/bundle/publicresource/87-71408-1_REV_C_Snapdragon_8_gen_3_Mobile_Platform_Product_Brief.pdf
> >
> > Can you please summarise the _actual_ difference between qcm8550,
> > qcs8550 and sm8550? Are they fully soft compatible? Soft compatible
> > except the modem? Pin compatible?
>
> we can remove the qcm8550 compatible for now, and rename current dtsi
> back for qcs8550.dtsi, and only introduce qcm8550 later when there is
> qcm8550 board public-ed.

Yes, please.

>
>  From software point of view, currently it is single firmware image
> release for both qcm8550 and qcs8550, and the firmware is not grantee
> for sm8550 software compatible.

I assume that modem.mbn is different for qcm and qcs devices. Or does
qcs completely miss the modem DSP?

>
>  From hardware point of view, qcm8550, qcs8550, sm8550 are different
> hardware socs, qcm8550, qcs8550 is derived from sm8550. We can only
> share the public document about those soc descriptions [1]. For soc
> itself, it is all similar difference for QCS and QCM version.
> Currently(in current development stage) there is not notable software
> difference needed other than memory map in kernel side needed to be
> differentiate from qcm8550 qcs8550 to sm8550.
>
> [1]
> https://docs.qualcomm.com/bundle/publicresource/87-61717-1_REV_A_Qualcomm_QCS8550_QCM8550_Processors_Product_Brief.pdf
>
> >
> >>
> >>>
> >>>>            qdu1000
> >>>>            qrb2210
> >>>>            qrb4210
> >>>> @@ -93,6 +95,7 @@ description: |
> >>>>      The 'board' element must be one of the following strings:
> >>>>
> >>>>            adp
> >>>> +        aim300-aiot
> >>>
> >>> We probably need to drop this list, it doesn't surve its purposes.
> >>
> >> I am a little confused, do you expect to just remove this "aim300-aiot"
> >> or do you want to introduce a new patch and remove the whole list?
> >
> > If you were following the list, you would have seen the patch
> > reworking the bindings.
> >
> >>
> >>>
> >>>>            cdp
> >>>>            dragonboard
> >>>>            idp
> >>>> @@ -904,6 +907,14 @@ properties:
> >>>>              - const: qcom,qcs404-evb
> >>>>              - const: qcom,qcs404
> >>>>
> >>>> +      - items:
> >>>> +          - enum:
> >>>> +              - qcom,qcs8550-aim300-aiot
> >>>> +          - const: qcom,qcs8550-aim300
> >>>> +          - const: qcom,qcs8550
> >>>> +          - const: qcom,qcm8550
> >>>
> >>> In the review comments for v3 you have been asked to add qcom,sm8550.
> >>> But not the qcom,qcm8550. I don't think that there is any need to
> >>> mention qcm8550 here.
> >>
> >> qcm8550 and sm8550 are different, they have different firmware release.
> >>
> >> AIM300 AIoT board depend on qcs8550, qcs8550 is a QCS version for
> >> qcm8550. Modem RF only in qcm8550 but not in qcs8550.
> >
> > There are no 'dependecies' here. The thing is about declaring compatibility.
> > In my opinion, the qcm8550 is an unnecesary part of the equation. You
> > declare compatibility with the board itself,  with the SoM, with the
> > actual SoC and with the base of the series. Anybody caring for the
> > difference between QCM, QCS and SM will have to check for both
> > qcom,qcs8550 and qcom,qcm8550 anyway, as there are differences on the
> > modem side.
> >
> >>>> +          - const: qcom,sm8550
> >>>> +
> >>>>          - items:
> >>>>              - enum:
> >>>>                  - qcom,sa8155p-adp
> >>>> --
> >
>
> --
> Thx and BRs,
> Aiqun(Maria) Yu



-- 
With best wishes
Dmitry

