Return-Path: <linux-arm-msm+bounces-18708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A828B4355
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 02:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B04611C2257E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 00:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7035D2C84F;
	Sat, 27 Apr 2024 00:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VDsQwced"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D727456
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Apr 2024 00:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714178751; cv=none; b=u2EEvIHg27qXqqV0+zg4lxibf/1tndXy1tjakroljSMF1rzPfRu0OtSl1Zd6v5ZVpxx/zviF9egglWHde8o8BvPrrh3Kz3acqrqiVjYd9845qu7npek2uMqGAnEc/u1D5uJl8oyVqjUBUzabziRexLEXRP9RkIYM2/DMXmoiJKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714178751; c=relaxed/simple;
	bh=tlLeddA8IfiVI/BV6SeRst1cSQvh9/2ymyQjw29Jj24=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CgLx3lXezcQcGjg5NcFQaETVQU1ruOiGLgT0B2U+3Rsypg5WAg0XgcWhtRwXvhcpogjFaRjTfwONcN2tkgUED1esFeALmdoZa79aFSwkzhyvRG3GIdTaxwKPqmuj+joSVqnSv1f0FdeKs2S+ZBoVxJRfO0CNKnhbzsczDjDxnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VDsQwced; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-34b1e35155aso2808791f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 17:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714178747; x=1714783547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/rLHsM/vPD3T2A1VsQsnTpBE6ImIRB5h8YGhBpHcNkM=;
        b=VDsQwcedQPjPWh20OLNDoDdjlsCFmksBe6FecL0sMpwUFRWwwc4b2yfAVrtifO6vqA
         yQCBcbntEh/u9CHgluTaodwB7LCYYWe/D8TiilJPVy+KiWOLUkonyETP99hJF8cSv4Ev
         LYfbQ81vuLwLrs6VZo8TaFjXnpqPr36spW+ZMJsGcD/gre3ZQMnqsSIPP9peZ0GxUttI
         HH5bIt99JJPJPgRFclsqk3+Aix1GzoW0OJxMzpgXSSTmBDjep4tw5OGtq+VP/XN1f0DS
         b62NpEgGEOENFSY7OKE61scyZH9TuSjR7MCGpxjmbxQjnZwoVC5qL2eKbg6PujA44flL
         aBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714178747; x=1714783547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rLHsM/vPD3T2A1VsQsnTpBE6ImIRB5h8YGhBpHcNkM=;
        b=lTxIGY8QATUgGW/+TjS+VxFH7sSU+cuiI5fmQQF5WXMnRADWQwP9K9Mqeg72SNCI7S
         F2VQsVKMXVKg7JB//3YGjTAhZO+vAsGvMCPsRM8CpLrwoYDtHJP+Wya5Bfg/X+KpOeFY
         DC62mcbQMnteiFacod+av0q35F8mFcdel8G4DwTlT8EYxFDnGWDpn/JHKakwJM3LhyNo
         2iKTTIrdBFwO7gK7la8ySqeo3IdLodKM0zpe84WeSlGe4dYE5rusGoZ08Dx2x21961ox
         03nHHsz7WPSj+fdJtaW/kmax468QpyN1QarpgYCpTAoukxWm4OdWPGgwRb/kUiGNrTop
         1HRw==
X-Forwarded-Encrypted: i=1; AJvYcCWiotQ4Pehq6HXJlMCgXAOa6JXeB/Bd0hGlLkLz/lZaxrFDGi8BTHk4Q6MXLaVXENDBPsI/GN2J+v83FI3JbNBh7dzDjwAc8bszuNASag==
X-Gm-Message-State: AOJu0YzUJ1TwADha4AaZaGzasuLR+y7xb8keC6Yg1sOrnScRzSHRDmqF
	qrHYGD0Z51XYaogh1UCXMOpNCil0StnFUddFmE6YCD+vmfJkZy4sn0cMwyJJdYIbXTK0HJtZuFD
	O
X-Google-Smtp-Source: AGHT+IHuC2I1HuJmKPzf5FByUGepHiT1AA25eWz7/Jmjw71OtqQi7p2+YDA2yUgEQDqRTVPTei6Bhw==
X-Received: by 2002:adf:f7d0:0:b0:34c:8cbb:d6e9 with SMTP id a16-20020adff7d0000000b0034c8cbbd6e9mr861193wrq.71.1714178746708;
        Fri, 26 Apr 2024 17:45:46 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id p13-20020a170906604d00b00a587bc4ef2esm4990294ejj.122.2024.04.26.17.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 17:45:46 -0700 (PDT)
Message-ID: <31b0574d-1d8b-48d0-b28f-3d0b20f89c37@linaro.org>
Date: Sat, 27 Apr 2024 02:45:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qocm: sdx75: align smem node name with coding
 style
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240426123101.500676-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240426123101.500676-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 2:31 PM, Krzysztof Kozlowski wrote:
> Node names should not have vendor prefixes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

