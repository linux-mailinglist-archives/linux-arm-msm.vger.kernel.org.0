Return-Path: <linux-arm-msm+bounces-22036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D9D90004B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 12:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83E9C1F228A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 10:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6C815749A;
	Fri,  7 Jun 2024 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcBTGA2I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300311CA85
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717754855; cv=none; b=RfE+LB4eYz7gAFe/iQrpmCkxcK1wh5a1uOfkjj+90TSa3FKldX7sePZ5OCWCbAXMOGo2aDf1Xc64faY6ZB5arkXJDz9IfYP2Sk5dWNnOKKSPeFQnBJ3Zq1tKBpITt8RmB2p+DKZSbOg6irA0uilzHR9Ee0+6h5Mm1aRBzoE7Wwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717754855; c=relaxed/simple;
	bh=XWE2nEPd73Wryv/XJ3aZ9dGiMk6jgTmwB4BRV65Sr9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdTVn3aHR+jXHUdoPAjGQ0ZiX6eaDbytZ9UQuwwhDYgtxGns2AjsMgFygGVTdunTBUwA9AkUUO2dAtGw3XIoXoqyhRRAE2UzkMHBVgbtRbI299H/3tRtH3ErzKEQW55EmILNuEvdi14IuPsCCFy7oDuPQxGw8IbgzfHKXEelKtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcBTGA2I; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52bc1261e8fso275182e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717754852; x=1718359652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tKqy5KPiXE5tS+7APEfxI8BgZE7LcVJaqckC/IckH/k=;
        b=KcBTGA2I9JIF9A5D50MmxDhcJFYbLtm6o4bS25PFcrbyXbz8twKOyVrfoiGRdZOw8v
         yNB6k4782WprZZ5QdResuMJlHCoCQPipafle4ue2IcNHmCp4lPIKbBPPfGHLoGpZ5hlw
         U1aWLsMaYaORKioBA/u0j7Xlcp2v3ncJBRCPkLIjGtDZhxW6x7woYs2HkS5PKpxFHaVL
         Hrauk09geI+Qj5MmBqgWmPAO5ka3//GOdY/5IWhCzClUZB7JUJLhNGzIk3N8CcpydyMp
         Dl9udCdY1qF/R16DGz37JPGchW0s0g8Yhx2vkttymR2nsnJ12olLdLl/F5R1ZC+DcVm9
         81KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717754852; x=1718359652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKqy5KPiXE5tS+7APEfxI8BgZE7LcVJaqckC/IckH/k=;
        b=eZcnD/uNt9uQ5ucUEtCigiJbIOrxINix2+8moynmPrPWwY2ZZHOVeP3sV9CSIv4xs4
         QSnk/e6/FaxaFjjf5Hde+6qI3bkLnDKqu0+PWo0wCHLtBLeeZMg2f/oSOFe2VK7zML2m
         +QCSv8q9qOPO8HDUmF/ULJigm6wlT++krUvjXUTLkhfUYVk6pJCxVNW77IJ5mdwTK8Dx
         Mlgs/4MkAyFeEAY/J5WU2y/epJWP1KFDT4lo0u7MjwU4PXDjAWdE1tCItaDa+pOWQNz7
         ktQqAqJqsBxhHHeo09snSajfnNUEb+VGYg75VysgWg1GOkKWK8MEYO0J5CFBFxoD4QiT
         hmlg==
X-Forwarded-Encrypted: i=1; AJvYcCVcSAEvQUb4CupWVV9NSLQ+mEKBxeuptrGdp9QMChRJDBFyszTRq6Y2U/GirBypVj0YZbcvT0Cw1bOXeHPppCqsubSaD4o9NNZFWE3vPA==
X-Gm-Message-State: AOJu0Yy48E4SRPn+auCJ6m+Rkc6Z6NDkJKqk0OkG+f9QHt7mSxN/qn5N
	TYbpsM7sYy+R0Wm99UYLXepLgJhU1ouTVJ4F1o71gt5ghAgk7Pc5mYL78SYC8Ok=
X-Google-Smtp-Source: AGHT+IES3v6a19DsD04NHLtXfjRgQdQKOIu5SWkvETd1DGZZ9porqeTAmJPhDxqAUtZLo16tVPlZCA==
X-Received: by 2002:a05:6512:3b12:b0:52b:bc04:cc6b with SMTP id 2adb3069b0e04-52bbc04cd38mr1239170e87.49.1717754852327;
        Fri, 07 Jun 2024 03:07:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41ee11asm485248e87.64.2024.06.07.03.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 03:07:31 -0700 (PDT)
Date: Fri, 7 Jun 2024 13:07:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	quic_jkona@quicinc.com, quic_imrashai@quicinc.com, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Message-ID: <uthsf2dtvb5bduf3o52t6bjmvferzfyrlb2xy4pqaeqvpf35cr@kb5lpb6n37sc>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-3-quic_tdas@quicinc.com>
 <6aad6a71-dd2f-4682-91ea-835357342ba1@linaro.org>
 <22becbf9-a663-4f25-aee5-8fd195e6fa55@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22becbf9-a663-4f25-aee5-8fd195e6fa55@linaro.org>

On Fri, Jun 07, 2024 at 11:34:03AM +0200, Krzysztof Kozlowski wrote:
> On 07/06/2024 11:30, Konrad Dybcio wrote:
> > On 31.05.2024 12:22 PM, Taniya Das wrote:
> >> On the QCM6490 boards the LPASS firmware controls the complete clock
> >> controller functionalities. But the LPASS resets are required to be
> >> controlled from the high level OS. The Audio SW driver should be able to
> >> assert/deassert the audio resets as required. Thus in clock driver add
> >> support for the same.
> >>
> >> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >> ---
> > 
> > Please stop ignoring my comments without responding.
> > 
> > https://lore.kernel.org/all/c1d07eff-4832-47d9-8598-aa6709b465ff@linaro.org/
> 
> So this was already sent, feedback ignored and now we have again "v1"
> skipping previous talks?

And no changelog from the previous patchset. That's really sad.


-- 
With best wishes
Dmitry

