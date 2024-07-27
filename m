Return-Path: <linux-arm-msm+bounces-27122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C14D93DEED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBA5C2839C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 10:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6250E6CDAB;
	Sat, 27 Jul 2024 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jM/VF1ra"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C5040858
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077847; cv=none; b=U28tIB+yGjdjIevYnFkH161P50z6AD/wF9jrR1DgU6W6v9TLocOlZD0niOWa/r7ebBFaJmDGYZ7IVUmisHT2jtc8OJAgvyBGtoN2hyIviNO4grX6FpZ1o2a9vfsP17WNwjpFHVkmhNaX/HuAp4WQ2GQE5PuE4m9gPl67XmGdWdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077847; c=relaxed/simple;
	bh=4ISVk/vdphSQYrLF7Brrm2YmUaLwXbAnzpebTPwhg7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7HPvhc6udMuDoxaVxVizzsSEYIxmFTA7533l2jun/Yffc8eLqistDKmc9NJ5Ydd99D9VpC4wUj4pfBuVbh6/LDt9g5/hH9Mb6mnKLthZpcDdlbkE2xYBqFUr9vk2wNjjI2QoEQS4KJHUpsIKUWPOxeAOf6ZciN5opZJzijb5NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jM/VF1ra; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so31320371fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077843; x=1722682643; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hxmmVAVvk+vvgGFyvRrZ8b77pvrFFDYWtqz7SZeBRsU=;
        b=jM/VF1rao0Txk+iX+ArMzPEZ/7HntvI74BUjMiOM/QWPcUlmpsebFAzC/2PkehXcsg
         i2bIMfwqeFzIUskZX4D/Mskg7pNkKcflalF7NIdSenBvU+B2Pp26eepdhnVf0P5B7MqE
         /gKlBifddp7mUjmapYoNNqSPCzfEa9nIMg/CzoPq8sO7s+isJWopRyr7zqLAe7PCtEB9
         gu6boRmQXQgFxM0inUfXE8as+9R4o9Nj0kkmAKwuluIb6atOBXTWC2yJR+HP0bT7FtOy
         U+Z+epEiq25gaDVUeicxovqEYVNxal9cxr8sFuW9+nxTV2aCb3X9ZgFNyewA2XJJivKp
         zB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077843; x=1722682643;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hxmmVAVvk+vvgGFyvRrZ8b77pvrFFDYWtqz7SZeBRsU=;
        b=PZRdMh8vPQ1C7qZRQ6f8HTQEfXkhXO8loG/YjCGlrPQyLrTz+EEgm/fJyjWb20za2r
         iK8ASNQFqKwMFJiWYVCrepo09BWjQ4mdzuJJY4ZLYBn256uiDxiTZpZDrXYgII5hsmWv
         KGUbXsR/FHPyYLaI/QP/UzG7GE6ywbpom2qLd0fe1+ZsKkcr24KAMwwI9Y5hZ/BkQ4RX
         AjrJYSYY90yDTyC7KFikHc7zgpjcoxThQcAnK8AztXXIEMe5R/k0HC+Vjy6Vht3fk0d5
         0Onldv3xECkaxGbOLJHm8zog4wZQQ9wErXvEm+A1ECUGDZet2ayAaDC686HxGT8uJZWc
         Vadw==
X-Forwarded-Encrypted: i=1; AJvYcCXCmuqYNta6tU/bxfXgODK+91XhWdgFtDEeoXMSkCwMXSjby+DQQId0DA8ulAnqzfkXza2XRZIiC5u6uFEFOKwYdaXkM/RvAeejdibHwA==
X-Gm-Message-State: AOJu0YzheiFajRBtrwNqpQ89yUgUCsFhCJKOvq3d5GwWz+h4HvFFUOnC
	tevXEvxUn8IDSw9SLV9XPvRNJ9awVQnDdI/GGvvID4vT5SovxTMYZl1A756hY5o=
X-Google-Smtp-Source: AGHT+IELi02/6G6dD6tTjTDnKEeCFK58r3pOETxeaedHn5RbjxndmkFuS1ko58/BqBTsiCXnZInZBQ==
X-Received: by 2002:a05:6512:1d2:b0:52e:d0f8:2d43 with SMTP id 2adb3069b0e04-5309b27a1demr1767649e87.17.1722077842616;
        Sat, 27 Jul 2024 03:57:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c1eec2sm721242e87.233.2024.07.27.03.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:57:22 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:57:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: Re: [PATCH v2 3/6] clk: qcom: clk-alpha-pll: Add support for Regera
 PLL ops
Message-ID: <33f7fclmf3qmfurrkq7ykdkl4v34rpyfy2c6xlerh6jtcgt6ug@5fc4exottrpv>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-3-4baf54ec7333@quicinc.com>
 <kxoxr5cxxedckh7q45zhhyssqx4ahdfbqw7sdsrxx2ddplummh@2s6jv62ipnhb>
 <6adaca81-2751-ae48-850c-453a34c0e341@quicinc.com>
 <2a509ef6-1b83-d422-f3f8-29f51d6056be@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a509ef6-1b83-d422-f3f8-29f51d6056be@quicinc.com>

On Fri, Jul 26, 2024 at 01:40:33PM GMT, Satya Priya Kakitapalli (Temp) wrote:
> 
> On 7/9/2024 4:21 PM, Satya Priya Kakitapalli (Temp) wrote:
> > 
> > On 7/3/2024 3:35 PM, Dmitry Baryshkov wrote:
> > > On Tue, Jul 02, 2024 at 09:20:41PM GMT, Satya Priya Kakitapalli wrote:
> > > > From: Taniya Das <quic_tdas@quicinc.com>
> > > > 
> > > > Regera PLL ops are required to control the Regera PLL from clock
> > > > controller drivers, thus add support for the same.
> > > the same what?
> > 
> > 
> > I'll rephrase the commit text.
> > 
> > 
> > > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > > Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> > > > ---
> > > >   drivers/clk/qcom/clk-alpha-pll.c | 32
> > > > +++++++++++++++++++++++++++++++-
> > > >   drivers/clk/qcom/clk-alpha-pll.h |  5 +++++
> > > >   2 files changed, 36 insertions(+), 1 deletion(-)

[...]

> > > > +EXPORT_SYMBOL_GPL(clk_regera_pll_configure);
> > > Does it make sense to call this function from clk_zonda_pll_configure()?
> > 
> > 
> > Okay, I'll evaluate this internally and see if that can be done.
> > 
> 
> I have checked this, although there is common part between Zonda and Regera
> PLL configure APIs, a different sequence needs to be followed for Zonda, and
> calling this function from zonda_pll_configure would affect the sequence.
> Hence, I think it is better to leave it as is.

Ack.


-- 
With best wishes
Dmitry

