Return-Path: <linux-arm-msm+bounces-23900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE15391465F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 11:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30065B241DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 09:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B7B130E40;
	Mon, 24 Jun 2024 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="je+TYd6X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4E130A76
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719221151; cv=none; b=quR1Raw1HSSAr25SK5/zW2WtnMOwEyTY4lIbUVn1b+7zbCYDM/3zjo3ayvXmbCqXmu7sC/B03ETkMvu/4rYdHa8+K15wELVo00vifco3gdlZXo+bfmV4QrrEG2d5N7oD6KmRX3qADX2jWzhYgjxdOG39Bm71tL/N8S06uU4JrE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719221151; c=relaxed/simple;
	bh=dSpj6RVdGlwSynNTqiNA10vYR+M1oEJQAoRfZLhS/8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyJXMzl3PQs6ZUbf5plmN7UzhNoj1Yf0LvgWDMuEOatDZEgzwmW4VNTu5aPvm+5Us/njs7BnHmcfyLhBX88lTvM82pv77pNKhgAdiGmoS3APrGicl5v1BlfG6uY993GKog4OBNXF1jzaKbm+KmR7GB7Xmf1QPAQRSypvpX2Q4A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=je+TYd6X; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so51535521fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719221147; x=1719825947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ8rDTFoLXAhMjy0OhmeajbUY5vNojlhHctYKafkZN4=;
        b=je+TYd6X6Epx5TXmUdV32lnX0jOt5fSRMF9O/FPmLnbvave1b3wMtu53E31nD+hVlg
         7+J2CqD8zHqK+8+1P0cC9v2HKHqULRY/c/CB3GciWzLdnNTNPqm2zbkJVIWccD4VPngW
         1Ol+pKtCuezWsDHo8yrjaV6eRJB1OnBivHQuocM1lfn4dDN6cfqK3HNfO6n3COeqq1PW
         hoVgabNaGzu3FFKAShsArYKXsGk0xirP7sFmqlS82hbh4QrPk1/XeMtfJyRUaOvzqHdt
         UN802zOYh+P12gHpRY5NdSTjmxs0h5v8pk7VnwI93ZUYZXNlS44QoeqZu0kG1PNaqIS+
         h7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719221147; x=1719825947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ8rDTFoLXAhMjy0OhmeajbUY5vNojlhHctYKafkZN4=;
        b=h0fxhnXi7LNU+ecaZ42ngnx24RqbiJAZdIEdLqFe074Yu1O2wz6V+J78W2TcmD+CVY
         hakGAQUhATEoT+Dl2Z+GLEfKZSlm4a96nhNgGnhQJMXC3jPMReAKmF/7UmiOyO5qxyGR
         DjMJmOn0DzRr3n8/DwiZBJL9tY9x6NZ1WCQLf9iS/AWJ8eWjhqCmomoc5RrjsyRsoThf
         HmmKtspzvJbSMbea0YRou4fht8v+vfPTdO117ay57pbevaC08bs9R2ZVFT4Q/fcMUIvr
         AythHXxueLhUsHHsQfE4SMWfmxwlDVmWmzS20w/i2qc8/cE8BrjscJrFQ0mQMRdP2hW+
         5Npg==
X-Forwarded-Encrypted: i=1; AJvYcCWSUyaxOVcsYywEZ4n1wd3f7BOvygx0ZbV0ng86+6jYFRP57VjEbpb2YdRrlqJUZP13IDLaoSR7HabOlZh0iG/Gb+H2pURdJozsY7kfbg==
X-Gm-Message-State: AOJu0YxUHXiftp0vqXBuCV4+sflDfxtb2KyyKwldGOSPljLKpBIgpD3s
	sQgeE60qtYikozo1T97E5LDRZzKCLcK1vjk/j+DDVdtxr2Ptz9iL1Ckmhf/Se70=
X-Google-Smtp-Source: AGHT+IFyYQcI0M2p6Aug3g8DCGmk6of8qUf+Yl9RI+onwe/r8cDJBAKjW1liB62k+oh2Qcw1PYwa5g==
X-Received: by 2002:a2e:7805:0:b0:2ec:5073:5814 with SMTP id 38308e7fff4ca-2ec5b2fd2f3mr32530691fa.8.1719221147588;
        Mon, 24 Jun 2024 02:25:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5843318fsm5388401fa.91.2024.06.24.02.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:25:47 -0700 (PDT)
Date: Mon, 24 Jun 2024 12:25:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: qcom: dispcc-sm8650: Update the GDSC flags
Message-ID: <kjb6m7sr2secyalg2szb36vcxtgwiqcbuqxilxc7uxmfhkx7n2@yrmkw4tw6nng>
References: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
 <20240624-topic-sm8650-upstream-fix-dispcc-v2-3-ddaa13f3b207@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-topic-sm8650-upstream-fix-dispcc-v2-3-ddaa13f3b207@linaro.org>

On Mon, Jun 24, 2024 at 10:05:52AM GMT, Neil Armstrong wrote:
> Update the GDSC flags by adding missing POLL_CFG_GDSCR flag.
> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8650.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

