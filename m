Return-Path: <linux-arm-msm+bounces-22410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F699050B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85BAA1C20D62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35F816EC1B;
	Wed, 12 Jun 2024 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E72eM1ty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067716DEB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189283; cv=none; b=oscJSoyfzG9IeEWaYg5vsAKflDePorHfwkHQnWMtecFvUuBuISi5lW5+b5V9ajW6toWYd2KzoPqlOVhrxHpZ3hexYP0IKgYRSv3SUd5F2rE5jv8wbUrNY1GjdAb7RAWeBpytSjSnsf9F5NiMAitUf5eltHFSV4LodmqjpG06Qjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189283; c=relaxed/simple;
	bh=20EnR4B9oGwKGQC/k4WySB/Ui+rinhaaE0N6AueFY5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0M07qwoTOcF8pNKF8FwwDJ9dQ1DcFpsYf/JtWd+ZurUCdeMKiCctjTogoHmK7o8CdBp+Hu6Sq9nPrQ8AKDB2unKIKxktQgfhPdYbwI6gqhP5HLVLZcNC8iBSCJffgSN++QRZ9IoKq/qcjrIIW6+dIF+QJYG0sJ5DgcFn4AEt30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E72eM1ty; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bc274f438so2900458e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718189280; x=1718794080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BOYIiBVLWWNhLv834B8QQY4TviVSReDY87Z0lnFv424=;
        b=E72eM1tyDlME9DKI6HInZ+Yawt8nKqvTLK/eGSDU8c/GZ32OcpwUeneZ5jCD8TAx1T
         f55NZt/bk8Ng6bfqdumS1qs7sv8AwseIOluEjn1FqKN+IpNs3nm+3cRFaAlSNcbXDxG/
         LUFnxNxLHxZVI6QshVEsCBeBSBkncemGbbvof8+0AgLICCkybV2I0AEVGH6HMYNAPZMg
         iCVsuUZpW16nSfW9hwBVLT792r1dcwZ0k2ZW7J/C/oor2bbymKFqXYH1r2nhb7lR1d4l
         TqbMIu/mO6FC8A5VrhcKrlXCHD6pUuq3ES8e9Fwpf+jXRY9Yg2HRxdIlnQhVdIqfsgMX
         D0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189280; x=1718794080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOYIiBVLWWNhLv834B8QQY4TviVSReDY87Z0lnFv424=;
        b=nUHOYHhqJ8VfWzvF9NotRC+vP6A9L3sWnIv69yFzI+jmXzSsL9iJ4FyYpwfsE7lzwj
         pbYsZ1dnnMKgMZD7qtIx+PO1szGlW8hntpkhX5LUBOmzsu3EadOiih2PuPRuaZmVBaXn
         p2F+R67dpWrsfh23YSMdLKC7aSwAxQP4uypl5wfTSwtsyAkbcNdTvZBZChC06am55qwN
         rgzMCFEr3/JotC0F8lRM0N3gaXHzflkbp3nALqKsgX0A54Biu7mzFgMgfabtOTNd3Gam
         HVtT8mWueFsA/XSlv+4U4COBnXOY+LfBLqQTqBt6vY8GBMQUFfPyrxNx0u/I0VXQWUeH
         5Lgw==
X-Forwarded-Encrypted: i=1; AJvYcCUML2/3Ylbpw+kq3tnVHHKpZwMWb735KvlSd2KWTJ80+kpO7CXEKM1aSIRfJ4nXAcQoEcqbvfV4tfHhis0TMHpzXvjHC8AkPlRn9cxrIg==
X-Gm-Message-State: AOJu0YxMqGMwHm6lrkS9/nvblzejwqZONBUg4L+IGFj01YzGgTmht/c+
	EhHN/zeRBgfM1vH+c5GtQIX6uIKyzg6ZUjV9jbFFYmGeM7tfiJuqCcUNz6rQ7bg=
X-Google-Smtp-Source: AGHT+IHYnnycu4Y9cBGG4mG+C7yb8ew6JhlTtfaGyJs51KgIPt8VnfXq4FNjPnKruO2C3p0Lu88OTQ==
X-Received: by 2002:a05:6512:4024:b0:52b:c2be:8694 with SMTP id 2adb3069b0e04-52c9a3df581mr1224757e87.39.1718189280264;
        Wed, 12 Jun 2024 03:48:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c903b972csm856375e87.36.2024.06.12.03.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:47:59 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:47:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_jkona@quicinc.com, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 05/13] clk: qcom: gpucc-sa8775p: Park RCG's clk source at
 XO during disable
Message-ID: <hs4eeic22snuv2qeytcd7j7zomcdx2di2bk6iuxswfb3qbsdiy@st4zgvnf4ow6>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-6-quic_tdas@quicinc.com>
 <2fd8bcea-8bea-48ea-8052-d7fe6c1e8f59@linaro.org>
 <61eb731d-1928-4d72-97a0-397d8cf45e0d@quicinc.com>
 <d7jtqigvcmjv6swbifprjmf7ofgselxmrssbkptmbr2cj7izt5@a33lyesbdr5u>
 <9ea7bd3a-0d41-418b-8162-266862e1467f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ea7bd3a-0d41-418b-8162-266862e1467f@quicinc.com>

On Wed, Jun 12, 2024 at 04:00:47PM +0530, Taniya Das wrote:
> 
> 
> On 6/10/2024 11:44 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 10, 2024 at 02:41:10PM +0530, Taniya Das wrote:
> > > 
> > > 
> > > On 5/31/2024 6:53 PM, Konrad Dybcio wrote:
> > > > On 31.05.2024 11:02 AM, Taniya Das wrote:
> > > > > The RCG's clk src has to be parked at XO while disabling as per the
> > > > > HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> > > > > Also gpu_cc_cb_clk is recommended to be kept always ON, hence use
> > > > > clk_branch2_aon_ops to keep the clock always ON.
> > > > > 
> > > > > Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
> > > > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > > > ---
> > > > 
> > > > Should the same fixes apply to 8350?
> > > > 
> > > 
> > > Yes Konrad, it is applicable for 8350 as well.
> > 
> > Can we please get the corresponding patches (as a separate patchset)?
> > 
> I will send the patch for 8350.

Sounds great!

-- 
With best wishes
Dmitry

