Return-Path: <linux-arm-msm+bounces-73078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B1B52C8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49F323A7DF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9F92E718E;
	Thu, 11 Sep 2025 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkqDh4DI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90F11D8DFB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757581358; cv=none; b=twyHuY8EZu4FVAm+8wEsGUQxLBJ1XgK85IqqLxbo0LqPNScsFsnWPCpd8mgBuUwZiW3Km9FFFJ2XaS+DsOv3sC4ufZpnoZYhzNra7830BitQH216nIGHr5MnYXcWgWzEfheDioc6RU3kpJXhklKzhZcxJFKK6+uePAMUCBPob5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757581358; c=relaxed/simple;
	bh=UzTJmRwSuBGTfGbVMCEkyvO+DHGhYaptU6WgQxWrQTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXXrS3v91+xH2vPYffxh14yXC0gwCT7d+a3ZPF+myu9Q13j15LjVi7QKX2wn2l//zom6FIOr+4OPnNQk5C5FYl8kW+U24zNfKurZck8LlmfcFV4lNb1V4r2Hx9NuJZAlNTjNK6BUxNp3g+IAcz8IweCLHweuz5MeY0o2LSZwVeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkqDh4DI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3e5190bca95so365996f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757581355; x=1758186155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/zaq74E/O3TMzVibuqo9ZKl9wzf7cmcYOC6wFsi2v7Q=;
        b=hkqDh4DISaB7oAIHe4HglXgyLYqEFnawP4hhExdDMqktLmUn5k7fUjy8b0aVhaVPcW
         UYNRJjDTVBPn5lzwxe03Y/cEw17or3OwbQlAyaJOfyGl0Y2OpPLLMqlvqry647pQTNNW
         8jOYGy0e8d6b+J5HjOmcFAtWgyrhmKRhR4xipyolOfDOZ7+w3O+lN+TVTPjpT/d5oSrz
         w/YhXrWxFztXum5Ptgg5nrn01UzRIxs/7xPAiLkzmzoIprMpoP94+4Y4c+6nAcdYaLa+
         6EYhTGzjC3jZVOFdoCzwANKN1aV/WbGnniA15fH8eRAlPPQlu2xiKr6Sjp6Ahnhe4yjo
         Ncqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757581355; x=1758186155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zaq74E/O3TMzVibuqo9ZKl9wzf7cmcYOC6wFsi2v7Q=;
        b=kUmlvIJXCgoCFK0cloQLMA2a4+ICBKpFGrqAIB382rjgNPMg3aHfr+BBGR3ic+adET
         S2cl7/FLpiDcZMb0AU33epyDdmbKz7kRU7qN6/+j93Sa12I+ZBm7cTlKDIuy06QV199a
         ++y+9ES1QE3VLZx4JPQltQGIP2rESdufbAyGvOmcUVUE7ZTV0Si4aH5NeIUBFQdE7E7X
         svuIOr92RPrbj6LF7xF/MOS5kbV2uNrF1rzVGhw6SD6UQJNslb6gz/Q25eRDgDjbfWkW
         7owsNtyL5nDyuf5V5WCGJ7UuMA3BblfCr+tmtuGgdaCEvh4RNNhuJJu2MqqmPcBqj7fO
         4sWw==
X-Forwarded-Encrypted: i=1; AJvYcCW4/FGj85uDk82XPjwfFU2JVl7eFrWsMaIByNIryAcg/Nqpk3RQU0RxRfc95ZNaxFzPRQ3DbqJe/UV/anIe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/EW7gQANIdVEJ5p8+5NXO+anweVhTeLWD/ALF4gtE+PXxWi+0
	DfIm4/K9e2GoJ2agGXKhOtekBlKsovE3fw62VF6F6dE2wmiETI7S0K9eb4KGb8u38u8=
X-Gm-Gg: ASbGncuDvnJ5m6xgw4SEQfMkN0sbXlhFykTcFphGdah879pF7VQ2iCcibjHrHmo8s2o
	jmZd1/HuswBe/LClEukvsL2gJW2UK9W4cmDCxV9MJzeaGyTn90j3IVjKtazfqtqkAc3uHL2LyQu
	TDkW+9Eqn4HQG7IUpabe/QIv4IsSh6HpiXteR/bm8AhVsyTtMguMThaIyBZOFdAL6HDkq1cM/HA
	82wm8MkCmsp1vkPyI83QUDdCY2yohhvv6UZQ+XA4rwuEPz+MaWV7X4uclAtco8vB+r0ppEdE/KF
	RxwfqPX8+lDTcyDKeTetX697fdwWY4qDhoV0+Q4FsM3PSBuVJNohniyA5mh5BS+GhH5MbNDWQAp
	+/WFHImC9A6XsitS2fTRDFizmsOWGHQkJLEsYfPj0ics=
X-Google-Smtp-Source: AGHT+IEpmqZKqS9hAWz+1L1aJGWyXbmn5CbSirxedo3gzH/80b0RJpaQWoe7+bkeQmLZvMcrOVYvMA==
X-Received: by 2002:a05:6000:25ca:b0:3e7:5f26:f1e8 with SMTP id ffacd0b85a97d-3e75f26f670mr1923478f8f.5.1757581355207;
        Thu, 11 Sep 2025 02:02:35 -0700 (PDT)
Received: from linaro.org ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607e13f4sm1606771f8f.57.2025.09.11.02.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:02:34 -0700 (PDT)
Date: Thu, 11 Sep 2025 12:02:32 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: Add DP PHY compatible for Glymur
Message-ID: <i7ckqu325thggaw3qms2ofoklh6r5rhthdwkuko2uzbaqnryhg@qrjsc5yh3dnb>
References: <20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org>
 <20250909-phy-qcom-edp-add-glymur-support-v2-1-02553381e47d@linaro.org>
 <20250910-obedient-ambitious-oyster-5efa6e@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-obedient-ambitious-oyster-5efa6e@kuoka>

On 25-09-10 13:32:04, Krzysztof Kozlowski wrote:
> On Tue, Sep 09, 2025 at 01:07:26PM +0300, Abel Vesa wrote:
> > Document the compatible for the Glymur platform.
> 
> And it is not compatible with X1E? Say something useful in the commit
> msg, instead of what we see from the patch contents.
> 

It's definitely not compatible with X1E since there is a new version (v8
compared to v6).

Will update the commit message and mention the new version.

Thanks for reviewing.

