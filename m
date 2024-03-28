Return-Path: <linux-arm-msm+bounces-15538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0601088FC01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 10:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36D9B1C2C613
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 09:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42381657DF;
	Thu, 28 Mar 2024 09:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="m+kIphZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E158230
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711619364; cv=none; b=VbfTDr/i3Nxz5HKBi/PR1VPIK4rDl71RbjzTYSnxw+rUonp4zM+5E2ROGCJFGcj/Qy4BRApr5iM0G8tcEGyMejuHXv3k0yAagE4S1HZGfPFksQ23WOQEAlrOgioy/J8zYuw3Ys6f3yKPNz3BF9OeVoSUy0i6UEuptPi8qBuykcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711619364; c=relaxed/simple;
	bh=NGAu0Wues6upFNlxfKrI9TDym/OgXLE2E4Jz/pnzxis=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SYSucUd6T578UvVvQ7JvyxYq7LIGrhZV6uyLRm299Z6zS9/jMoJJHFjGtY7mbMDQgr/JpoEhTWb+HqHMxEsukdYFLWZu4x1QU+50a345bX0YpeNm2s3gd/xLZk+rxOCjfHf1JOkHdVYlwtBbypXV0K+RGATK/DogRo5+askUYFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=m+kIphZG; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a450bedffdfso82641366b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 02:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711619360; x=1712224160; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2FlcFMwv9/mxZZUbTMV8sm8mZF2ziq8g+DEQybJDFU=;
        b=m+kIphZGysprPE69JLfucvUfx8YVagZTGnFKino86wl2sfLIT5cFasJgkSnJAQEl22
         cH4+i7tkd7CxHhpZlwDV8auDxJ+GMg7Gpn7SRoCwjCQ/kzhuA/kR0SYR5xwh3R6Wmv5L
         VCxv+GtERDajDWYLn3VEvBQhMrgXol+qSc4dEiCL9kvPfByWv29tL/nZKVUtR2y0ae79
         jeU4hxazH2wHNbmleWbghqCViIh4JGXQLoZlQLJssfSGe/1jpFsW61RTsCNEcg8OVmdj
         MyZJg6OTbmmT+JUFQynVVf+aQQf7Xjp+thSmjm2aGSzl4hTq2WPY2I89eYWYCuXsB0uM
         Sw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711619360; x=1712224160;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s2FlcFMwv9/mxZZUbTMV8sm8mZF2ziq8g+DEQybJDFU=;
        b=QKV8vng8SQotnvIce2SiKIiK/tabWN2Hi5AMmxSMTQXfsrCYyWjwvpHk2XmBkYmwDo
         D0eyRVhVUjONrFhRWTeefhK9MgG56L4kMNxbEz0AFMfZJK2w8D4+oyNoNFKhw1h++kII
         AwYJ908SIdlmnU1u9ksQ936liq3dRtF17RzGJj7ZVWuydrv70//PJ9L6sz5urDT2Y0mb
         hB1vV5Hfi+zkiuNxm5IELFs+qb1XS1mAlJLJmOG+EoQ9cMFNAz/YYB4bE2FQjASyBOgL
         K7njz/1vvQZQ3DIg/ILKboALMTlsM0zjg9QaIrqMotI5/lwnEWHNCfSu6+i5lCvsfZIq
         XgRg==
X-Forwarded-Encrypted: i=1; AJvYcCWcnz48q8h0/wkMJI02X4RPN4ElTi2kJD0XYjqNXNsJzNKxv4Wiatk7Clo/D//9XTqleJ50/c0L0PgUOfRqs9F3uGvax2xYV1C2Go8//A==
X-Gm-Message-State: AOJu0Yzvb7j8K5Y54N5yY2cmO39pCYg/bo/Mfx+TRtlOaec+eMKggXaj
	bxxnx9ns6rRxQ/993O4San0yhE4/l92MBEHRLO+rh8om2Oi2qOd+NCbfZPvXXmc=
X-Google-Smtp-Source: AGHT+IHQj43uF1oRw2agLwmax83BUP4TUUSTe802FM7CxRtHEbgYpfc/GypNFhLDLarI2m22J/4eHg==
X-Received: by 2002:a17:906:26db:b0:a46:8c40:7a3a with SMTP id u27-20020a17090626db00b00a468c407a3amr1170962ejc.26.1711619360465;
        Thu, 28 Mar 2024 02:49:20 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id cd1-20020a170906b34100b00a4a396ba54asm555999ejb.93.2024.03.28.02.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 02:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Mar 2024 10:49:19 +0100
Message-Id: <D05AFAI1G7CY.3EURGL4VGKHB@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: dp-controller: document
 SM8250 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Rob Clark"
 <robdclark@gmail.com>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Kuogee Hsieh" <quic_khsieh@quicinc.com>, "Krishna Manikandan"
 <quic_mkrishn@quicinc.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
 <20240328-sm6350-dp-v1-1-215ca2b81c35@fairphone.com>
In-Reply-To: <20240328-sm6350-dp-v1-1-215ca2b81c35@fairphone.com>

Stupid typo in subject, should of course be SM6350, not SM8250.

On Thu Mar 28, 2024 at 10:42 AM CET, Luca Weiss wrote:
> Add the compatible string for the DisplayPort controller on SM6350 which
> is compatible with the one on SM8350.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.=
yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index ae53cbfb2193..97993feda193 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -29,6 +29,7 @@ properties:
>            - qcom,sm8650-dp
>        - items:
>            - enum:
> +              - qcom,sm6350-dp
>                - qcom,sm8150-dp
>                - qcom,sm8250-dp
>                - qcom,sm8450-dp


