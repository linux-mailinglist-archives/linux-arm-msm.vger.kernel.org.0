Return-Path: <linux-arm-msm+bounces-75882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D94BB68DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 13:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E1624E4206
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 11:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C41C255F28;
	Fri,  3 Oct 2025 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="abSHRRWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D1E23183F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759491980; cv=none; b=m1sAPH4jD9ucmrTLGTRI/i0tCcIav036EkT2CksDf+JOr6EoKQJnCDDpUAMlMtW3o4RviKDc8z+6yT2eUpTWvjFIdPRu8DbUyUHZPlHJSMXEdfutXHVs/+xHRQZkxn4Mc1GW0wJegFZrRzOfMCfz67Y2/SsBbH9KKImpxLGuDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759491980; c=relaxed/simple;
	bh=pyZ3TAOi0U4n2XzT9dIn2NH1hBOe2oL0LlEkuEzKqmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GL2cMj3sWDICf8LahyzzL2rWw3I836sE0l6ZgwxXgkNnhl5p1S8vdZ3X3kwWO/s+9+ygzi+JwRimbkRs6KK6zF0bJZHS8NgqDS1YSZMv5UCEWwabi8hhq9LVAjla2ZwqfOlXhcGMEaTVYcyO1zEZzm3DFpOSHw1jMDAJ7KuBiRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=abSHRRWI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so23303035e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 04:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759491976; x=1760096776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXPI8JPSlSxfXU3oIGiKhsz+rY4EG6yV9MAy6evg5c0=;
        b=abSHRRWIjw99uqxDq9VAZ49WsCDXQAVamhm+MAc+8d514KSru2cX9L3ZSucNk5qRnM
         gXu72uNawMrP2cKIr9bENS5d/Gdb5Pj5kWA9h2462N2d3XvFPDTZBMy+8ut0YWIQXzQl
         i8Fy5awrBKH0g1sqi5TyJt7TFrZfGBD8ALOJg9yX3hV0ai1QVS1G4riRW2GeNu5oDETx
         cWB/q3lRcHOC+4RbTaWrhK8/zk2MJiza8EkF7M+ZQVs7OodNOYqHbGfF5EjDxg/1/XUg
         BqiLjoWbSfM2b5LgFtLEj+U7F7cZVStTQWjoGEEOwYezcIrSNGQNTIhbWNAV8uNsaCxv
         e9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759491976; x=1760096776;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXPI8JPSlSxfXU3oIGiKhsz+rY4EG6yV9MAy6evg5c0=;
        b=uEVYcJfCmEhDIFzYExWJA292MhIAt8v5iH+X1/YNH6PiBIkbGwSVWhKCRNn8JI5FnD
         2QytxdRGXDVKH5omQp48k+UVEqeZF/qnP/CGO4kkTc08T7z+hncJtva/Ja0QYp1/kUv8
         ubhlhoPcn5p+b7ieFP8N6M/VBIGDX/fvXbtiLG3N9aEpArFAgo6mHXohlagub4x07/af
         4kBvA0XWtAdisr6CFo7Jlt0SGENqrpNPvkJpHTldFQPEPfCPhPqEm0pmQqEXDNwEVhzP
         is76AlQr8+7fGXuqlkvIT3Ixh1iF2PjTmVIrVn/wb+3eh23YHUqRHBhI4tfENB8NjoV8
         2srA==
X-Gm-Message-State: AOJu0Yxm+NzyIBbSgofL58adotb0Ws2ncj1x/RuI4xImxLQSlZQxz7rU
	S3emaTftWeHSxrR1tTnBYPDBo5VKl564/ZABU6yOgccAohifKSUES3rYOU156CrDw5k=
X-Gm-Gg: ASbGnctY3ghkPZtbLBErGZs3PrNE8ZmKX/ffvLNPDnnldAoF2Dlv0yez38XkVPS43Jr
	pzAkZr38WKkihmavNr62wiAZQ0yeGAFvMoLaL2csRoT2tMWVMGg2TvZk9E0WGwt0heADmNRiBV8
	4OQLOoVYzxzH4PvhwypDVc3ib34jBQUj9ltGFSeASVsAgx3NCyCodyrgMFxZbZ2z9BThTjuUbHt
	8u57wX9dB4RM8izJagokXir8AIv9fXWQ5NPZRLdXbBLo7oWZtilC/Q/msYEIjaqtKvjbrMfBvsl
	g2TxxnNj7//eY0fwD2g6VU/vXtv7EQDpinUYQ3osuS59hVqA+ZsQ7JKeApJ4xLGyi6WOON6diVt
	XL3PtjsGjzo8pXr+iRNm53bcgOe+WnFOVHXtskl3vWW2z4mWLaW2xbB5hCA==
X-Google-Smtp-Source: AGHT+IFbWMEm1USYX7Rq9NUIjPZY/j0rB2JHjRl6Tdj4Ye/pg2AbJ5imxLC5UbzbWi6GsAHZYHcJ9A==
X-Received: by 2002:a05:600c:1f96:b0:45f:2ed1:d1c5 with SMTP id 5b1f17b1804b1-46e7115cba1mr21953415e9.36.1759491976464;
        Fri, 03 Oct 2025 04:46:16 -0700 (PDT)
Received: from [192.168.0.25] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723593d8sm31826055e9.11.2025.10.03.04.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 04:46:15 -0700 (PDT)
Message-ID: <385818b4-72bd-465d-89f8-774a76102506@linaro.org>
Date: Fri, 3 Oct 2025 14:46:14 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: add qcom,kaanapali-imem
 compatible
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com>
 <20250924-knp-soc-binding-v1-1-93a072e174f9@oss.qualcomm.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-soc-binding-v1-1-93a072e174f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/25/25 02:31, Jingyi Wang wrote:
> Document qcom,kaanapali-imem compatible. It has child node for debug
> purpose.

Nitpick : subject should start with a capital letter,
also, I do not think the sentence about the child node makes sense, as
the binding already explains what it does.

Otherwise,

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> index 6a627c57ae2f..1e29a8ff287f 100644
> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> @@ -19,6 +19,7 @@ properties:
>        - enum:
>            - qcom,apq8064-imem
>            - qcom,ipq5424-imem
> +          - qcom,kaanapali-imem
>            - qcom,msm8226-imem
>            - qcom,msm8974-imem
>            - qcom,msm8976-imem
> 


