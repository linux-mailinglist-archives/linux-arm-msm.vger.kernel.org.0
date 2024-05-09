Return-Path: <linux-arm-msm+bounces-19591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D008C1172
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 16:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F641F22A5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 14:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223BB70CC9;
	Thu,  9 May 2024 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwjjQcqq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E13D3BC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715265892; cv=none; b=G3wlTSe6+u9JVvZLzXRIcf60D+Lny42D+npeio5LZuJFEoA0erjvbBklPm2SmL/ema1/031CNB1LrDTPWQ5cZoahVNmUH5b5Vu8oZclKe2GNy3Vi+eB9F0PgtwtXiXUULcVAR3rsaF2usHFH5SBjj4qsJ/0zbgA9cjlM6bKIHSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715265892; c=relaxed/simple;
	bh=I5AJqok/mmlR9WpwnqkukvdTrAUuKkenbiOx9SXK4Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9E3dteHCgcZZEy7mDRLzk/3pg4DDAWGlR18QpbxFff1EDSWSDUIUsX10cuivGgqvZWT7Y9VT4sy2otFCfp1T3ZJsATjrG3oWiTiymoxCkWJBBmfUbjv6k4qnBREHOTKX0ZTUjGgGzSCik941F9laAFezSX33SpjewoxRlO4bl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwjjQcqq; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61be4b9869dso8820807b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 07:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715265889; x=1715870689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EdKZiB2s4opqgvof2kv3i43Za9nb3C0GOrVIKiWmw0k=;
        b=UwjjQcqqVZxQPTDMfLERflTOAIih5Vx1/lXUr17VJytFSKsGYekzxlObcg9NC2Fd0l
         s5fZJIhCLfpl9xs73lXB6kCJOQlynaHlu7q0VrTciZCYqNzy6eglyzsPAvwzwhiG1oRZ
         yN03bDTLnESKdb0jTqKKwYtDZx1OanFIdzCLkp0JWWaco4NXFlkVSGeBfckM97Dy2x2F
         HGifb5CZAPTib4awLDEDQydSbkpelQAkz04jmDnBMBAkyau1FRoUN7B+Y3o0exWkEPJZ
         ySs8JSGvfNs2bQSRPcBe9l3+dMUn9J7p1jK47lXohmiZRlXozaO+tOaL4XUc/AVh47kO
         PEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715265889; x=1715870689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdKZiB2s4opqgvof2kv3i43Za9nb3C0GOrVIKiWmw0k=;
        b=NR1a6p6PTCkmbZMKNIJ2FoYt9syNeTtRdkRxNyYnPR0y4vHYUmf9gOzFj/wSjB+lwi
         vRT9iL2fWxo6jw5BmaUk/mQzFZvdz/NwGW3AB6XtxzhjNCN/VirpzZ6GCGwj2uiK/H97
         ZKLxK1NA9QlaDZpWAq3CAO3Pue+C2PLhrpwhM5ryETajQS/lbZC35qSRJoGKc5T2BUQW
         KEtUSJqa5SGv79w9JaxgkMrtW9ev98VxGmwNzejoCTTmtuUEWTAUZ9LywDlJd4Tb2bXC
         cxKtB1vcd4HZKeHuHgbl73o8XRBZXSEDZtcnd44JkouZTS6+6nE1kYf2gaMAciSlEl4B
         njAg==
X-Forwarded-Encrypted: i=1; AJvYcCXMuThKGwIqWHNOay1Iu5l7Z9H+AvlmSNw8nB+suKFRV2CweQNF5GNBeRGhUxu6opG+UtM61QaGnakbPWAMweiHYL4mnJnOF5YJgToZcA==
X-Gm-Message-State: AOJu0Yw7Otos/0iEQMx2PATUXqXERK1DeiLdQW/zuOnB+vJAuIKDkIcw
	69LXoAAO4iJMOT4yNLq7sHE0rc+OsO/X02+VJn0lYkbiXJRheMWx9bdLB35K3CSiwjAFJ/cLa3E
	b5ua2me/0gB0pmmuDydYz25AMjnBcwhmr8F6C4g==
X-Google-Smtp-Source: AGHT+IGALxxw9TMatt24iHtj/HIRHztNAUbk6tLEX2rUTAXggUKpaWOX7Rx1RT45SQfhXHktooLHv52NhRf+EeDRKpM=
X-Received: by 2002:a25:fc07:0:b0:deb:d148:8dad with SMTP id
 3f1490d57ef6-debd148905cmr2630303276.0.1715265889347; Thu, 09 May 2024
 07:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
 <20240501-qcom-phy-fixes-v1-3-f1fd15c33fb3@linaro.org> <20240509141623.GA1011543-robh@kernel.org>
In-Reply-To: <20240509141623.GA1011543-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 May 2024 17:44:37 +0300
Message-ID: <CAA8EJpoyMAR9fLJLVgtHf8jSwe5d6ZYzt28LVogjrX+B-_W=hw@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: phy: qcom,usb-snps-femto-v2: use
 correct fallback for sc8180x
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, David Wronek <davidwronek@gmail.com>, 
	Andy Gross <andy.gross@linaro.org>, Evan Green <evgreen@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Iskren Chernev <me@iskren.info>, 
	Luca Weiss <luca.weiss@fairphone.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 May 2024 at 17:16, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, May 01, 2024 at 07:19:29PM +0300, Dmitry Baryshkov wrote:
> > The qcom,sc8180x-usb-hs-phy device uses qcom,usb-snps-hs-7nm-phy
> > fallback. Correct the schema for this platform.
> >
> > Fixes: 9160fb7c39a1 ("dt-bindings: phy: qcom,usb-snps-femto-v2: use fallback compatibles")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> > index 0f200e3f97a9..fce7f8a19e9c 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> > @@ -15,9 +15,6 @@ description: |
> >  properties:
> >    compatible:
> >      oneOf:
> > -      - enum:
> > -          - qcom,sc8180x-usb-hs-phy
> > -          - qcom,usb-snps-femto-v2-phy
>
> This is now listed as undocumented. You need to remove it from the
> driver as well or keep it here as deprecated.

Ack, I'll send a separate patch, removing this compat. It has never
been used in the DT files.

>
> >        - items:
> >            - enum:
> >                - qcom,sa8775p-usb-hs-phy
> > @@ -26,6 +23,7 @@ properties:
> >        - items:
> >            - enum:
> >                - qcom,sc7280-usb-hs-phy
> > +              - qcom,sc8180x-usb-hs-phy
> >                - qcom,sdx55-usb-hs-phy
> >                - qcom,sdx65-usb-hs-phy
> >                - qcom,sm6375-usb-hs-phy
> >
> > --
> > 2.39.2
> >
>


-- 
With best wishes
Dmitry

