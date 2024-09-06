Return-Path: <linux-arm-msm+bounces-31185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E6596FD7C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 23:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013F81F261D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 21:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFD215958E;
	Fri,  6 Sep 2024 21:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idCJht0F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654B415958D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 21:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725658651; cv=none; b=jBnHk1/ycKoVtM+Jcc6redfKbMPWASEXbG9gsqJzEt+p+YkybZzJ6LbQtP9Nb0+Q4aWs6lMEtmEqZr1vkupHgLUZ6xv4k5h2nc5/k4tJaSdOyum8egIUOTXBTwzJWMui7YYNqHsOlq8nZqCyeN1Far6JKnuy1ziBccOEjUIiFgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725658651; c=relaxed/simple;
	bh=UOZpUSrIHZDHiID5YAN1vbCnx/v+7sFB/F7sEe547R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K25ZwiOsOVxE6+ZpsQzPgR36EyeyWV/y/mbRfnoItvjk8rhut4bEc2CGfmPkvM+mSHyycMN8nJmm/1ozm/q1Zy0vva4ol06/iJdMcSD37i259CuQX3oaDMm2u/h8VxQG+Vha4g7hThdIrdLSsacK2w7EDguQt8PucqLbWpZ7URo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idCJht0F; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53653682246so2869619e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 14:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725658647; x=1726263447; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PbdUTNfwkoA3gOzlylClMfmRKbNDpBIhjentZdlbaOM=;
        b=idCJht0FaxDqYGTGG6YZB0FYrTRCk/Ms8QFtR0SD4I273vBxKL9VC9/agChr3CoeuV
         PIQRxuCJZzPKvZ5HCMFFgRo3ATKYImYxOv/SljuscgYwGXAcFy0JwArPOnwsNmu4uDNg
         X/4IucTgTwp1If+2DxvR6pFjRRpsWG2Gmo9k2HUtB4wW551VTswyodxPcFiESkytW+vT
         2aCHHQ9DasW2WTmkLIjc06auNXK6hsGsdRsO+ywWV7nirSJlGDhYdO8A4KTMfcwMnz4o
         6gDBlkH+TnFJUGwyNeA+Gv87IrTW7H2auntD6BUsL8e748hIbZ2g8reYoe06jp/rnVZb
         HU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725658647; x=1726263447;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbdUTNfwkoA3gOzlylClMfmRKbNDpBIhjentZdlbaOM=;
        b=GWZZZoXmxTynotkUjfXO165uo7uo7G23/cnpeVf0r2KPEDxLBcoELAtRnU2zSBR0ug
         B8s+KLnTxVZD4cWxRI7lFq/Z83VFfGHnw8BbrkwBnn28Zbhq8pRsmBpm5avgECgiMtmI
         Rq9Rb25Um43JGP9MV64za7hlFT9pI8he8ams5TpBfxwB2VeLXZlb3d4gWZcHOjj4aC1d
         I0mKoRhMCpRgSRrRvKROILiVf9CSeCowfOJB/e2+qjoa0wdQwL/cZsDZJYaTQ7KeV6j2
         5Id7+gT1IeIy4y683oowUufmdPrHhslI0NfMOcTP1SJiOnBUJiLSAK+/+pdhP4sdu99D
         kPVw==
X-Forwarded-Encrypted: i=1; AJvYcCXiWVegxAUszu5uLdruu1kejrtwLTOEYHDbBFaEdCYkum8xZZf7ivALrakvO50UtZdTAIJc+HAfWe7/7KGF@vger.kernel.org
X-Gm-Message-State: AOJu0YwsGczloTl4p7SFhtnKrqKkwPejgrdLuWrynvb44buBLF6/ZCcy
	3RYeOP6pXJgxcwn/+XSel33c4tfEecg+NIRvG3YkKrY46WWB7UW01+dtAoeiUZk=
X-Google-Smtp-Source: AGHT+IFSOl6x4rvgC3wxuREweSTuezpFUPH+fzYpFHfu4pXnQMX7AdlkVgsIOPaJYbD+Vq+qdudlKQ==
X-Received: by 2002:a05:6512:1092:b0:535:6992:f2cb with SMTP id 2adb3069b0e04-536587ef18amr2256004e87.42.1725658647167;
        Fri, 06 Sep 2024 14:37:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53566a2fd5esm828097e87.249.2024.09.06.14.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 14:37:26 -0700 (PDT)
Date: Sat, 7 Sep 2024 00:37:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp-x13s: keep less
 regulators always-on
Message-ID: <b7hjve5oqfjenmu4jvh5i5firnyts47t5trl6s4acpxvwmhvth@rpuwqx5mwfnf>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-5-brgl@bgdev.pl>
 <Ztm6fzmoeWcCpqvi@hovoldconsulting.com>
 <CAMRc=McDHi5EVpBjsuFE+JHgBhh84tsT6xr5PWO5yeU8zbS99Q@mail.gmail.com>
 <n7scbcdbse4m4rilkegqsinallgkryayjzqojnxtr7qozgxwp7@7mgropizypbz>
 <ZtsWe6IDKU4rvHIT@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtsWe6IDKU4rvHIT@hovoldconsulting.com>

On Fri, Sep 06, 2024 at 04:49:31PM GMT, Johan Hovold wrote:
> On Thu, Sep 05, 2024 at 10:27:24PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Sep 05, 2024 at 08:23:39PM GMT, Bartosz Golaszewski wrote:
> > > On Thu, Sep 5, 2024 at 4:04 PM Johan Hovold <johan@kernel.org> wrote:
> > > > On Thu, Sep 05, 2024 at 02:20:22PM +0200, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > Remove the regulator-always-on property from the ones that used to be
> > > > > implicitly needed by the on-board WCN6855 now that its PMU is modeled in
> > > > > device-tree.
> 
> > > > What makes you think s10b is only used by wcn6855?
> > > 
> > > I didn't say that. It's used by many components but they seem to be
> > > all described in DT. But I get it, the schematics show it in so many
> > > places, it would be risky to not keep it on.
> > 
> > Well, that depends on the consumers. If all consumers are good and
> > voting, then it should be safe.
> 
> Right. But in this case, not all consumers are described in DT (e.g.
> ddr) and this is effectively an always-on rail.

Ack.

-- 
With best wishes
Dmitry

