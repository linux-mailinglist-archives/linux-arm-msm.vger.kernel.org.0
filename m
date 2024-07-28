Return-Path: <linux-arm-msm+bounces-27151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1293E5C2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 17:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FB17B21191
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 15:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D54C50A80;
	Sun, 28 Jul 2024 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYTeGAxQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0F2224DC;
	Sun, 28 Jul 2024 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722179616; cv=none; b=Nsaw7k2Fofb4PpXwhHFZrEBA0+54OBjFIwHsmY0NWIxPGRLEeNvPvC3UdD8YUNamDN/e9hzXMz26caRChHwyGC0etRj0d/91eoa1aNdjAh2ICkwoze5rS97Df34Uf7kGEp1hQ/XaiC3kOfXyBnTaLr/qa0ofnrDq+MNxtBtif/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722179616; c=relaxed/simple;
	bh=zhKf2ehracKr+h2UKnqdvhuE2e1j10DBAWYB3j78ch8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYeUAy6LVFkki4R13tnlYguNhBZlXMxwQ/8baULdoE8YEs1YTtnOtzoluwxHQu+jHu9ixYmSqc2L1RZJdyDP+VTU7eOpV6D+oQ0OEYYD7RNIlVWwQbnXkPRT5qyi1syA5562qm+/TfJoktJWesl7b/zFXlnd/LZq/qkzTvs7NRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYTeGAxQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42819654737so4243195e9.1;
        Sun, 28 Jul 2024 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722179612; x=1722784412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zXc6Qu/Erwg78EnAf5yfQbwlIJK8zAchPb9wGTbDtM=;
        b=CYTeGAxQLmPnDT73yrDCaoJxb5lVnh+KRDIrtxi6i5W1KUyygiNIWG53vPDjBeeN4T
         epeZ3lkMRCPvvMVOaFNRx5djPXCWz9VMRqcKjt9zbmlD5Ou7ht4XneKYvE672edmOUaW
         sph1/XXqZ509PZ6fvpcNxfrfg5+TbiEDqHB/AB5yuBe7u4hox4fLy7C7giWrzsd1jWn1
         keyyHnn3awN/g0Jf/YopXHiciagp9RdcPjnwpM3zmFzeor3yStT8KwqDkyl6vfYv6ZAj
         jNsrUFBjvK7FkBc/rRHIzPmRvXjFoFuJJRv5GoNPQYmuNZCaD135Q18fbr8ADYbRtAg4
         pJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722179612; x=1722784412;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zXc6Qu/Erwg78EnAf5yfQbwlIJK8zAchPb9wGTbDtM=;
        b=tUfq3S41TI6zpaxoaNidvTvIN2WQNEhkmY+kBHmE/C9dubGdBMz/jSou3xGVT9aHGF
         8rDS2xUXyBcluLWfRlWwMlfUt0LPl1vN37QRa91uehlEB7KSiuR4WM1t1HK/YfayBLFf
         6HqCIGwMO8BteGhkbuu8oS0FsW20G4ni1thZxVycGwUXphfm5XOfUzd9PbxiJXxZ8w1v
         D5mgYXfsCYBKdpj8BuvBAeDvLWq6mOS4B5B8+9GMPYgNoQWmQLGsJ7pmhD2CSkw5kcz6
         mIu4353MFGjqxD0xIuIfq5B9CTK5RQhorhvu6FSy2V42bvQxSe1V+JcmJ8H5ERHZyAb5
         TR8A==
X-Forwarded-Encrypted: i=1; AJvYcCUqvzhag2dqjSiSQzrbrtbfGZsS8Shxgi7WOys8/yFV6IPWk5gQouFL+37LBefpJ2iGbdRjqAM6HDEzQiuUyxb+5gNckFbSLkYp7vUtAFDfGNMfAxAcTmgaxn2wumj8vDBf7PUJhDytT3b+J0pSR0OsZnugpu/8TuAhEolQReL9UUb7XKRu/5M=
X-Gm-Message-State: AOJu0YwBfcafpWsRWAGUnmvVBwDnziW69lFxphy9dCEKECmBKqR5DXC6
	4vLMQENu5GWrmgTEV4AmeA82tFZ9pmMkHUkK4J2XXf1dOGnvwr/Q
X-Google-Smtp-Source: AGHT+IHE8x+HEU5nESgqVGjzBrElYCRgC0xE6eHSsrhVsH0Y3xpiEuRZ5HTLqIsZ8DaqYClesoX8Ow==
X-Received: by 2002:a05:600c:4586:b0:426:51dc:f6cd with SMTP id 5b1f17b1804b1-42811d9c9cdmr38874085e9.18.1722179612006;
        Sun, 28 Jul 2024 08:13:32 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4281807f701sm34329965e9.22.2024.07.28.08.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 08:13:31 -0700 (PDT)
Date: Sun, 28 Jul 2024 17:13:29 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Alexander Reimelt <alexander.reimelt@posteo.de>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Add LG G4 (h815)
Message-ID: <20240728151329.GA1196482@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20240727201413.114317-1-alexander.reimelt@posteo.de>
 <20240727201413.114317-2-alexander.reimelt@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727201413.114317-2-alexander.reimelt@posteo.de>

Hi all,

> International variant of the LG G4 from 2015.

Obviously correct.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Alexander, others have added their tags in previous versions. IMHO generally
it'd be worth if you carry others tags in next versions (when nothing changes).

I now see Krzysztof was faster to write this. Thus I put the tags with links:

https://lore.kernel.org/linux-arm-msm/171216461463.4018435.3466905061314737419.robh@kernel.org/
Acked-by: Rob Herring <robh@kernel.org>

https://lore.kernel.org/linux-arm-msm/d596abcd-8374-4a6f-ad98-c5a04416865d@linaro.org/
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Kind regards,
Petr

> Signed-off-by: Alexander Reimelt <alexander.reimelt@posteo.de>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index f08e13b61172..f79730d02eb7 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -250,6 +250,7 @@ properties:
>        - items:
>            - enum:
>                - lg,bullhead
> +              - lg,h815
>                - microsoft,talkman
>                - xiaomi,libra
>            - const: qcom,msm8992

