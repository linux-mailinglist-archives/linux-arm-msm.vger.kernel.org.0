Return-Path: <linux-arm-msm+bounces-86814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD2CE66C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4BFE3007964
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 10:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21ABC2877DA;
	Mon, 29 Dec 2025 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYttBIH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9758A286D5C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767005982; cv=none; b=OA7qmcygADufYcK5WOCigt+JHM790hi7lhQCMavHSGCN3QY74bOU/+pOgJjMdhrx8OycgCiGIAyujznY3PXTTLZox0V83V7jqv+dxuYmS9l8UOghjx8ZIbp498h886Wlro4/MXd7go+1iXXNN3KkZ29kI4SEE9pfegilFIT+iGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767005982; c=relaxed/simple;
	bh=qI99lAk+0gUGou58rrOwfp3qo/aSid+2yiVp9bsHhIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIKurAJEpKOIe1ywH+XvDuMcqBhqVsfXGi6phV3iuiwG7nJi528WCGmilC18vus627ad0OPvKQ9a0f8sTlu66RBCIC7YSSgwM/IR8RaybYLuTijhYtxCl1gpKk9y5AM2cEUJwd6gQzxDa5F3iIi9dSmjtCTu2yoZWnsD4WDY3NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYttBIH5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso1712340666b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 02:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767005978; x=1767610778; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=njF3If+p1nCxAl4swFbGxNUzvThr1OLNlezuMAThPIE=;
        b=JYttBIH5bXa+QizJ37k1tK5SnwN9VsauiRaQFujDJSPkFL3icMsO8re4UjsHKVB80l
         Ug53uwHgJuV4yCwgtTLcSFp96hVlvbZW14RhWM9K8HsGbzaGhl1z9SJtkX7klnn9oui2
         hwHY86Vym+SYugas3dKSHJHFzSg6y7fjI3uE0uRqYcbKnXG/Zuz1jx2V/oxMckRW33m7
         j9PB/Zk+TcFZMopHwSIOmFdI2DtEF3Txhm8KFVMKUvo2DuDqVxcQkVDaIsSh0y84nN13
         nmQ4tRBwOuf6gjf8FAjQzij9qGAbYMuy8XBCvpjgfOrBjT5Fd6WviZH8Y7/6VYGK64Hc
         b/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767005978; x=1767610778;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njF3If+p1nCxAl4swFbGxNUzvThr1OLNlezuMAThPIE=;
        b=mqqIP7tD7/FQjHQLFQ5dL5OJMlu8B1daUY+AXm3NgwlPoqP9fCJL3iXjLj8TPp0wEq
         VQqdSMQoXK89QfCF3zmg3FoX+yoObkXIArJNz0W3Jjj2HoWJ2xz8RSvWh4IehMPUajv1
         4tYcFBNAIiiK6q1rhUqxRAQLwHlUy/to3gBneLJhc/a5uIGC0aruARrpidY8usWIPTrg
         L3VSSe5ZQKfuto8ReIbRlDpu3DwlVAF+Vt0q7cHdWoQl/+Zw9++TEUicruE7O3FHdI8P
         eb5FvplTZXlm82ZcvNYUv1wwPn1i4nG0IRlefT1r/k9Yle8bCTItndbFHNoXrNiELZtd
         LxVw==
X-Forwarded-Encrypted: i=1; AJvYcCUAR8dpaAjOZXqPOni+SsoDMQAaV+0toFKDftV0WnHr0OO1vK/08kDhP0xdfHpL170llbusGEiokKCESrFu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlnq8W95RNDk+ANz5p6md58bXQaG5rNUb9KBDe6oHDvqULZ/+W
	9cLGZWefnZBvneHkeqH8JVw7VMuKdnEb+30xY+EHUxJAf1RposzN57XMM6j4eM3Q6bg=
X-Gm-Gg: AY/fxX4qNBauF3VsPvKN8pHXL6EUbGPyEuv2VL2Lx47cjlEJ6uxTCIcDS3HIgvxCdAN
	+RFj85oBQzCbtD8+L+0s2Yw0eQdBELc/UFgeIS0EU1whVdsTYdYusfQoyKTIm5ie67jFTP3zPzV
	6m4cu2ya3WF5papmERX39DiFkYzf1PGFuaxRM84SeyHk+uDoFafFWmbhby+X1MsPqZEd3LVLzTE
	j+5UcdQj9scMT4dqL4/s08yM+7SNabl7KAXWHgW+pmtdDHRDrhtaF66Wvg3cfFJMIM4C2J0SMGl
	qCq0nmWVMN5LVrror5QPPgJEWc8oUTViD8D8BjWstyd83G8y6pRY3SPqDXNVtB/3LgAL15cJdW2
	TrEb8vtqB29zUHlF5q3M3D9oB5zzLfx+XDQ/kX82S/EqyU3D0CXtyQOQir5kQuNNiFsfZ43E6Wa
	YclJnaasighfIu/+8t
X-Google-Smtp-Source: AGHT+IGmNmtf0hLYvfbaFryeXAFTvtNFvh/bM96d8IqdaTl0uOyR4Ykkp83p39KQuQ94AnUld/UYAA==
X-Received: by 2002:a17:906:fe42:b0:b72:b7cd:f59e with SMTP id a640c23a62f3a-b803561a27dmr3525136666b.8.1767005977915;
        Mon, 29 Dec 2025 02:59:37 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0e8f1sm3277759666b.53.2025.12.29.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:59:37 -0800 (PST)
Date: Mon, 29 Dec 2025 11:58:19 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MDM9607
Message-ID: <aVJey1tQ0mlGdcGM@linaro.org>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-1-aeb36b1f7a3f@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251228-mss-v1-1-aeb36b1f7a3f@mainlining.org>

On Sun, Dec 28, 2025 at 03:21:51PM +0100, Barnabás Czémán wrote:
> Add the compatible for MSS as found on the MDM9607 platform.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> index c179b560572b..b59d6fe091a5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,mdm9607-mss-pil
>            - qcom,msm8226-mss-pil
>            - qcom,msm8909-mss-pil
>            - qcom,msm8916-mss-pil
> 

You need to add the new compatible to some of the conditionals below as
well. In this case probably everywhere where qcom,msm8909-mss-pil is.

Thanks,
Stephan

