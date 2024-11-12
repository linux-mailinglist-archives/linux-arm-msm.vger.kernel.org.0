Return-Path: <linux-arm-msm+bounces-37623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BF79C59A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 14:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4067AB3AFC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 13:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC4A1FE103;
	Tue, 12 Nov 2024 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aycbh7Sn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1397E1FCF6B
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731419431; cv=none; b=jzoE1fdtQTXbjbaPNgr9gInPDnpiJaEyT2TbHKeQI1/6zMLWkpGBKgY9mO/lyIiZh4tpRRGCqbpCvwbXmfuyX2w4h/92pd692HInTDb9UWW98H0cCzkSM+ZnmBU+axo3k3cbDqbCjM2bc/koDdHd97AxZU8xqk5fN8U9dMnZjd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731419431; c=relaxed/simple;
	bh=r57rnXgG4AkYhE9Spqgv17A9y5FNAF3NSxhnociPfTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTIyoBhCBu16R9zPNMwS0sSldfaiDvRcmPefF4uRNu6cZ9qg8+rPn4ZlKkkiSYNgJ5cfc2uM+YGedxMh8upj3kMmRhtoxzOAEu9QxgR5sm2O97NabEujGHeL44+XlgX32D5rMK6HfR9deoEomKBbLSAF/drQxPL+shdBn6N03Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Aycbh7Sn; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso72685571fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 05:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731419428; x=1732024228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nkqISw1cuUKk/RswWCfsbwfb8VGVL06uekkDQG2WNDU=;
        b=Aycbh7Sn5bl3/RegXiRR0rxSIOuZ33kqaVM9gzCH4EXS5rzWuNTuy/DDOYjs0FPG9E
         q+bN9TW8rniwdiCeaiZwH0Sv0X4bzicWbhMHAoRBrEkKT3yFZFBYW8u0f4wKZeGGr0Fg
         YrH1q5Q1ff9Vw3zgLq9lf5r31wpQGW4I7V9ofrXY2ocso08vnnxRc0tyHQcVA4fD3rSx
         EY3FFCyUgsW27WdAQSYYTGbxN07URUt4dq2/ZPO7KsXT8BmVBt0qDVOve6uqsIm8dQuN
         TIAjge/9opKPERgARDc/2ppeePc6HHFUos94ewxsGVZlQpdnZr58z/ekOoV0RQbFJsbP
         03Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731419428; x=1732024228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkqISw1cuUKk/RswWCfsbwfb8VGVL06uekkDQG2WNDU=;
        b=NAZuXNuC8f4T0nSL/5kMKLSFOPrf23zUEOUoziBjSnLHNvOIbNos4CWbE0rYLPVF6y
         SCL9cZ394AsqdVezR0PLtotQKlifI/3lEWx6Md/a+eFWPcnPuelhXnm6Swd5GgkpssUD
         dH+6bnoNGSU36R182NvQIvtJMYH/2q4sIftfq7K34C14y5k1P0+5x1cCV438SgCz1fub
         pDgAMo96sx0JOzvaCO33zlp1CcU5iD+Xn1sy1yaQVGX5YvEWCaqP2BeR3dBlImEQqZk2
         Ef/1eqsnF1SDw2t72StZ/KNxyCYfeU+KOp50LKxqgcvFcNFxI3inR1W356AzRWOXOKKX
         pePA==
X-Forwarded-Encrypted: i=1; AJvYcCV0YLoz4C1sOHgXo5qMDSJC9rxFLbgQoxWL50lK9X9cdLkG9JBc/QD5K7x+AnUASL4dR3T/hODE7KRE4LIq@vger.kernel.org
X-Gm-Message-State: AOJu0YzlBakMd7JHOiVapI28UkcFfa7u5+XSQNc6s+QwG6o0+e6v5OWY
	UXVU9HEyYnTJkXMuEQ4m31Ml9X7a9GHr40Mq+rUm3Jx4NIRFxVUooZGr1SYBYjs=
X-Google-Smtp-Source: AGHT+IHGiQ69XV1c7WSUGoGxDNlI/Le1J4+wr+SQYknI4TQv5yTHViFezgLAJNw6WKj0yT3uRyKEAA==
X-Received: by 2002:a05:651c:50b:b0:2fb:2a1c:936d with SMTP id 38308e7fff4ca-2ff201859e2mr114929661fa.10.1731419428204;
        Tue, 12 Nov 2024 05:50:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff178f2daesm20147701fa.31.2024.11.12.05.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:50:26 -0800 (PST)
Date: Tue, 12 Nov 2024 15:50:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Odelu Kukatla <quic_okukatla@quicinc.com>, Mike Tipton <quic_mdtipton@quicinc.com>
Subject: Re: [PATCH V4 1/3] dt-bindings: interconnect: Add EPSS L3 compatible
 for SA8775P
Message-ID: <tv7gsceomtdjcymma5ximownsxleg2ujuxcwjgkzj5zhmlscr7@wnyx3bfi2cpo>
References: <20241112075826.28296-1-quic_rlaggysh@quicinc.com>
 <20241112075826.28296-2-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112075826.28296-2-quic_rlaggysh@quicinc.com>

On Tue, Nov 12, 2024 at 07:58:24AM +0000, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider binding on
> SA8775P SoCs.
> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---
>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> index 21dae0b92819..94f7f283787a 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sm6375-cpucp-l3
>                - qcom,sm8250-epss-l3
>                - qcom,sm8350-epss-l3
> +              - qcom,sa8775p-epss-l3
>            - const: qcom,epss-l3

No, sa8775p isn't compatible with qcom,epss-l3. I asked you to split the
driver patch, not to change the compatibles.


-- 
With best wishes
Dmitry

