Return-Path: <linux-arm-msm+bounces-41984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F196F9F0AC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 270AE1884F9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B021DEFE1;
	Fri, 13 Dec 2024 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oA1q7Z7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0721DE3BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088740; cv=none; b=qtK5hfGsgMhdk9GEmo2ak+9jjz1LLIviOcJitn3yLIMpuIOEiLHNtX9rrc6S5w5XzOQhPdLi8cg4FhBgIgxqSQGSmWJzkuJ+nr2Lik1W4B1buRv/uKIcPvfVQRmgrx6IqC6VN1eekW7YaJ16nW4ZyYps0bTrrS/a4x+b/NEUP/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088740; c=relaxed/simple;
	bh=4sWUtOjeYmhgS7vSba/RGHfcehHVoBrgsxjqxs2uKZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIuG0mYTbjiEjbuuo+OichNi/WKTudcoCtMpY4PNYFq6TqRasOksqSlX5rhslrKn4Xb3PS6gsegCkj4S1KxOlsT1Afe7JOF5MWfXNUCRuQfK2Xw9Kea/1T8CB/SnZs5uwgIuNkJSoWLz7RzunN56OMApoBk2ZfZlJWelWk07/H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oA1q7Z7H; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-aa68b513abcso269742066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 03:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734088736; x=1734693536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SOH0ZpkdRhKcY2RdyrG5izzazJLX5YhFQ9ww5KfiGzQ=;
        b=oA1q7Z7HKz9YyAS7uruOze5DV4+jvXINhKSNu65w3rVRRjJuYzZbD2r3b5kT8fMlwN
         b+LPqWrS8LBv28jfLuMP6KvifDHAtWpBUumYigybBHdFWTTn2pz3KzZnsCpsYCppHNxL
         YSJy0pPH+9v+CMxwk+jmlgGCJFGHCdjO2WK6tymuwRhCHhfQ1oV0vTz77pkKBX6PUie9
         ZXEwDEyTdQEcG6Qttx8+2znTpZLAuvW+wJqZwADfqzWVLOf13l3TBzR1v3RjhXJes7+t
         kDyraGzZ7a6ttUOKHQTE59M3nEUWtnt65C2Y26VAsNe0AvbitRWyljgk5i6c+PITcLlC
         MJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088736; x=1734693536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOH0ZpkdRhKcY2RdyrG5izzazJLX5YhFQ9ww5KfiGzQ=;
        b=Etk33B3YKfKFnnJK55QQQqmGNwtW29J0iwo9Jr+rUV/KgW66VZF3v0bTKKVjIpU2w6
         e8W9ZcBhhhvEaF7HVWAm1N2yZh25jFgM96g0nexnLcyhaeY5z3Uodh3X2QIeDekkjkR9
         bQghbWYpOTE39THdbxKvmVVjg1IfEnnlKDypJQI1NUc1JuzpLcwy18luubt10vafmUkQ
         hOjp+pfEAlRGDNWW6xhozgycnTYcn+c7S5xUGxSkzlDlA0YjwEYx69gGlME9Qmd+70kM
         th7AySlOJgDocBcxywdY8oyb+p0PCj/2+OK2MvqLv3N4pQ460BYlodWyxHfKUkmzu7LV
         naNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4i7tApTqBytgDawEvq9G+u9+L/WdsCk8gXnSocO5pHqQM+JbeiMn9jfbIFdVJzFABr0jChpuhtOx3bXkm@vger.kernel.org
X-Gm-Message-State: AOJu0YxPLLxrfTdGD53eGo5nN36KEuj4S/Ncz2yIDAVDdUPrZESeJwK+
	qG30YJ8w+iVi/QxYfzVkBG8KyTffPrzB5XLIFFOYhLdn24jwdAZjjw+T68ArFWw=
X-Gm-Gg: ASbGncvZZh/fLJCGOu1adeAL0pAK+l0bq3EyMyW+7c+GjG6UyXn9vFpFO4lGJCiq/qz
	ZPOJld0EEz6yS40th6/uYLxJUJ+cl0xSMcbetAwznIlwnm3LFXNKRMNgKAxLI3QuT1jBdfeHoFf
	2HdMnbrwKCuGFYDV2rBMbN6sWf0BgqKPiaSa3N8A5KA9P+BlA2s4VDbDLR4/RickgujUlxpXEiV
	CEzNpWH8qOoWBi55javETfg6vvsN1VOcSJ5adTXQAY4oOxMcYdqDsEAMUnDznUwBg==
X-Google-Smtp-Source: AGHT+IHCNFIusKuDoVAQrVy2w3RyEGZxyWlRUmcQIBaYG0LZ5xafYNpj5fwC5H5p5Q6bHAeD7wm9rw==
X-Received: by 2002:a17:906:32ce:b0:aa6:b5d8:d5c2 with SMTP id a640c23a62f3a-aab77e821e9mr229783666b.41.1734088736131;
        Fri, 13 Dec 2024 03:18:56 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:998:492:1e8d:6193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6705a566dsm824777366b.162.2024.12.13.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 03:18:55 -0800 (PST)
Date: Fri, 13 Dec 2024 12:18:51 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 FSUSB42
Message-ID: <Z1wYG8gpdFEvHCI3@linaro.org>
References: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
 <20241212-x1e80100-qcp-dp-v1-1-37cb362a0dfe@linaro.org>
 <kq6qjrynlbqgz2ltdap67lsbehmzuudjhbhyjymy26wlffol6o@kggtwtbujilf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kq6qjrynlbqgz2ltdap67lsbehmzuudjhbhyjymy26wlffol6o@kggtwtbujilf>

On Fri, Dec 13, 2024 at 12:07:35PM +0100, Krzysztof Kozlowski wrote:
> On Thu, Dec 12, 2024 at 02:08:23PM +0100, Stephan Gerhold wrote:
> > Add a compatible entry for the onsemi FSUSB42 USB switch, which can be used
> > for switching orientation of the SBU lines in USB Type-C applications.
> > 
> > Drivers work as-is with the existing fallback compatible.
> > 
> > Link to datasheet: https://www.onsemi.com/pdf/datasheet/fsusb42-d.pdf
> > 
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > index 8a5f837eff94b27bbd55bfe45f8d1156e3d183eb..e588514fab2d8c9d0d3717865fe2e733664fc28b 100644
> > --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > @@ -20,6 +20,7 @@ properties:
> >      items:
> >        - enum:
> >            - nxp,cbdtu02043
> > +          - onnn,fsusb42
> >            - onnn,fsusb43l10x
> 
> Is it different from onnn,fsusb43l10x?
> 

Yes, it's a different chip:

https://www.onsemi.com/pdf/datasheet/fsusb42-d.pdf

vs

https://www.onsemi.com/download/data-sheet/pdf/fsusb43-d.pdf

They are probably quite similar, but the fact that the usage/programming
model is compatible is already represented by the fallback
"gpio-sbu-mux" compatible. So I think my patch adds it correctly?

Thanks,
Stephan

