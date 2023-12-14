Return-Path: <linux-arm-msm+bounces-4838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C993813CB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 22:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E5E61C21C12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 21:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F602DF66;
	Thu, 14 Dec 2023 21:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qGcfgN8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6216ABB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 21:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a22f2a28c16so7642766b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 13:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702589830; x=1703194630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zG76K0qzQZ6BZo0ZqrQ/rLUKCqfNhdCgq1Uc4qUXBrw=;
        b=qGcfgN8LTNN+1hu+VKYU5Iu6DZP+TJImMgvM4f1yqATEtCgpK1UFvxT40bZruE5Nq5
         HzLD+x+eDjsRjeFx4oXilW1LrkKeOLln2GfRXVmJMzUFghyIZEp51Cz0V5ZiShbRqt0j
         js5S4kqZWuRCvhJsCuaaCAYGBFLlykCeniZvhJvn6Nk9aMwcbvYdks6tUAuwWmzB/Wxw
         4bg3L/ON3CZp64UmCkucj2NgLJexaLpDM2T8TXxQz6iYNfzwBqyzzfd/FP0exAXGn8VN
         HVFR44JiEeYFmNLakyZ2Ya4vHY7DtmWMWxgY+eFoTr/7eDF3f/M/AOzh5I06UyRG2U3z
         G7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702589830; x=1703194630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG76K0qzQZ6BZo0ZqrQ/rLUKCqfNhdCgq1Uc4qUXBrw=;
        b=C3Oyo7jbYEkBXpeWyFYjaLgCLSO6I7idDOGrmv5eNv4YmTUMJP45NBt8Yr47Dillmg
         3SP0BWSW8bMn0YDMqZ15g11vi8ngoIEbq/8SVwf1uQNuOaBIXqH/juNCF15+0yv5VYZm
         a0Vf9yAQG2ar/iIw0yrXWZtgxZ4Ixta9XjMyFCcZngioSIgHGReiUuJe6nFMbpnmg+xt
         kE5yzRLUlgPNxpkaTpz1nDJ/J/ikNN7Tw4JDSwjRE1WA2hGPIf7ji2Yw9M93CUAof0Yx
         GbtntYhyGSFXIPZi14nrYLqf3Qpj2O98ghojKitF+Y291NDtgVRGIxcJWYRV9UB0qpZ0
         mXxg==
X-Gm-Message-State: AOJu0Yw9f/EaNCxt8gMIFv9jXZxEofOiMypWDgnjNrEPXS09Ur0cyAZ6
	J0W2Vph3dUJUrXwW/RwuBYpSuw==
X-Google-Smtp-Source: AGHT+IFcW+SbpzKQAw5oi5FA/QgeaAA3x2c1H5/dpHyiWf88seXHLhbIlAZi0tqPdOEL1HK8Ns/PLQ==
X-Received: by 2002:a17:906:29e:b0:9bd:a7a5:3a5a with SMTP id 30-20020a170906029e00b009bda7a53a5amr4065934ejf.36.1702589830053;
        Thu, 14 Dec 2023 13:37:10 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id li18-20020a170907199200b00a1e4558e450sm9913466ejc.156.2023.12.14.13.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 13:37:09 -0800 (PST)
Date: Thu, 14 Dec 2023 23:37:08 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100: Add all missing nodes
Message-ID: <ZXt1hOADgY9iofvC@linaro.org>
References: <20231212-x1e80100-dts-missing-nodes-v1-0-1472efec2b08@linaro.org>
 <20231212-x1e80100-dts-missing-nodes-v1-1-1472efec2b08@linaro.org>
 <9c8e887b-429c-4226-9851-5f1cbb93524a@linaro.org>
 <ZXsgYl2h+MnTIz7D@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsgYl2h+MnTIz7D@linaro.org>

On 23-12-14 17:33:54, Abel Vesa wrote:
> On 23-12-12 17:21:19, Konrad Dybcio wrote:
> > 
> > 
> > On 12/12/23 11:24, Abel Vesa wrote:
> > > Add all missing nodes which describe entire X1E80100 platform.
> > "all" doesn't really mean all :|
> > 

[...]

> > 
> > > +				clocks = <&gcc GCC_DISP_AHB_CLK>,
> > > +					 <&gcc GCC_DISP_HF_AXI_CLK>,
> > > +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > > +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> > > +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> > > +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > > +				clock-names = "bus",
> > > +					      "nrt_bus",
> > > +					      "iface",
> > > +					      "lut",
> > > +					      "core",
> > > +					      "vsync";
> > you probably should list the ROT clock here too
> 
> Will look into it.
> 

There is no ROT clock.


