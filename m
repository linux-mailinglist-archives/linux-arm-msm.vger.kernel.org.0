Return-Path: <linux-arm-msm+bounces-77456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711DBE03A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BACF0487807
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B65A2F1FD1;
	Wed, 15 Oct 2025 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HehQwM83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601512BD586
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760553699; cv=none; b=FVyArUfitDJf5M8rZOiI2jxnHdA+XOAtcSXeZgB498FMPJ6G6bPAuSiwDIg+eS1QTBvUTzPnslIO81eHqtAYSnjiP0ah45dJO0Yizmgl2/mXjv+5lv91pCgqiZkxdx6gnj5cdE0D5cKg8557boKlaIR3Di/gpC2N1U+SBeCKqO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760553699; c=relaxed/simple;
	bh=dx0qVmHaErexTyZmeoLh4fwFrUvfpdSCx26iEjNbWxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFABWVqKtVu35ZoxIkFXApe539XxO6Dp5PjuX/IY7zXUxCghWLUlXQQI/o06Ka4bGBXyZnOXPrqnNESo8tgmUhHgIRRHXEOIeSpK85vdKXcu5yMzNzVlEESOx/rA8I1U2UJ1LBdci2z+KeBAXR9aV9P3UFuPnfC2s0pk80KPOss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HehQwM83; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-582067563fcso1144198e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 11:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760553695; x=1761158495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJlLj6BAoxjVSk1NLTz6D1jxyQjoorCPPfMJr/rohBw=;
        b=HehQwM83lHvn4pSkb9fcOeFLAQVkxPXyOWY9idFVi1qswWRKVD806cxXLvsNoiRLCY
         5ePMhDUMvrfaa/67RNks/KMnhgPQJB9d7Z82rTxtTr1si+oY+6etJeZwpBwA6irkpzOZ
         HD8hZSpiDa9kKY4SQgSxGzMTFkBj6wTFT9+gu+HPe3fe7SS3dC+EKT7Zadxrq7Vipfmb
         gakLaijFgjP2qSS7bWJTNAST/Q5j+c7loJ3VhEc+9ATBIyPOv4zpJnoWRUmFkdZuokZb
         SvfRniiulfo0/3v7leX3Ob95lLo/Y6HZhetYoVNlmD3MVkkk7KBROrSmYHUlLwfGsJhc
         9OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760553695; x=1761158495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJlLj6BAoxjVSk1NLTz6D1jxyQjoorCPPfMJr/rohBw=;
        b=ovbz2b+2wdyH4L0olmQiv3VoJkbJHSq5uxQYG7bUwnZMT2jwCae+Wv2jlAPu88IfWz
         bR/Yy8dCxZxnnJw0tagdBkoVXbs9mAQBoDs0MmS1vw4jNkb6ZxUD5Pf5pP0bK5Pi8yH8
         p9/WoiYOF43WdXOqdIySHSg43LEgemDMNh/mQoFANljzhJglVJSkaVIde4m7gDo8BTSd
         NmolFpH/kXeJiFeMqtrD25eVGoO0CmoQdGeyKAWYPn75fMpJI+o2kJwJeektTZuE+7Pg
         4YMuWze/gK7paPCQ2UGn8bkxEdo65EVo47Hfr21ejj6PvdSKk8zvvZJAVBfCBa3CX9RR
         BFQA==
X-Forwarded-Encrypted: i=1; AJvYcCVIlj37NJwJOU3BPMfH+bzpZFhja6KBX+K+6Yl4VTZK1gvToU7L/H/uqek6ZGi6BHGqT3XyTNtgO6E6RBc1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyka9lpUhLl7B6c9Epccl5nEUcRGomOv0cLqOPRJd9nQA12IxNS
	QequHLT/Vn71y5cWwpfPMx1Vg+cO1T7JZMIC5DXzGY1tjstO02zvwYoqovAIoO3fwb0=
X-Gm-Gg: ASbGnctLMC14OKXoyMi7mgjBrn6Sis9ktt0+YJHe4g1ssMkXynCxn/vO7F5p5BVOTPS
	sQUsKJRH2hiOSROSmH3Jd3n3lXxtqF1/Ja3GANw+bD7jSrRY2/o1h+RwVC7vOQJZ9chfG3tYvWg
	W5Zby2tO0ip4HzUNWheKrToJ9X3p6ZYvxb2JiM6FZeJbNKIlExtDfKUzRxTMD9S9ci4GPOBBSC9
	0Gz0XaI+US+ran8ZPLt9a06N+D3oy4Yu6ivywRxtF9nXZTfWR2ceqpRZ2Bv1amZzCylAQfyIxGf
	DqlNniPqO2Sh1zjmtYrAFk41ST49g031XVsuEAITlr1MRrWe41+kc6k1YLxTQ9KIJzuNfl+88b0
	11/nucRsWJtEPt2SF2PShaQKyfnc/iHi9NDduGepTdYzB856SiLbFvqfGGUKWCy/OS5GGYnNEHH
	WOv3G4fzyOdXfyBhKhxrN/4r9Jb3h0xGxpi4E=
X-Google-Smtp-Source: AGHT+IF+omlnIj0VW42QBPNVZc431CsHdQ7EPsBKi1Mx1WFqeaAKSz1ndgSM5DbxSPhZLcvdHjBrYg==
X-Received: by 2002:a05:651c:1987:b0:36b:9ecc:cb62 with SMTP id 38308e7fff4ca-376099f239fmr41529381fa.0.1760553695443;
        Wed, 15 Oct 2025 11:41:35 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea14d46sm49223291fa.34.2025.10.15.11.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 11:41:34 -0700 (PDT)
Message-ID: <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
Date: Wed, 15 Oct 2025 21:41:32 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 16:01, Vikram Sharma wrote:
> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
> CAMSS binding to reflect camera sensor hardware requirements.

What are "camera sensor hardware requirements"? You do add properties
to the ISP.

> 
> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> index 80a4540a22dc..dce0a1fcb10c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> @@ -120,6 +120,14 @@ properties:
>       items:
>         - const: top
>   
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.

What is "PHY core block" here?

> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.

This is a copy-paste example of a known to be wrong pattern.

If you open a QCS8300 documentation or a schematics of some QCS8300 powered
board, can you get a link between the actual pin names and the introduced
property? Likely there should be nothing, which resembles "PHY refclk pll
block" over there, and thus the description of the property is misleading.

Please check other similar and recently added properties, like it's been
done if you add a voltage level reference (and that's the only known for
sure information), there will be no need to guess the right voltage level.
And it's either incorrect in the description above or in the example below.

> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -160,6 +168,8 @@ required:
>     - power-domains
>     - power-domain-names
>     - ports
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>   
>   additionalProperties: false
>   
> @@ -328,6 +338,9 @@ examples:
>               power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>               power-domain-names = "top";
>   
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>               ports {
>                   #address-cells = <1>;
>                   #size-cells = <0>;

-- 
Best wishes,
Vladimir

