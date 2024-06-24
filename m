Return-Path: <linux-arm-msm+bounces-23872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D391420B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 07:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 229E7284AFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 05:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C888417BA2;
	Mon, 24 Jun 2024 05:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+QOUivS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DF317BCB
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 05:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207295; cv=none; b=oM7eyFszmlty6g7pXkOnkuMmEOG3NuJlzbcJFsVzcQVxqya8f39W5OLyll/0UznVJ/Uijo2VBF5kGTeigyte/hQ565KyE2D+DBaQbbTTvBwrPs/YNLdP8FKGpmncyG3of4GwpN2EWpXxCF9vxtr+apOyMPHJn/lIyUlfDPqU0Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207295; c=relaxed/simple;
	bh=c4qhto/s0OdNLY9J1rt4EUXvriPgx343wWEsZ88Bdyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgpB4cHhURIUzn34BDbs4YePbBY4WMBiM+rFhJNE2yIxiNjcBARSarKvOSkPGAstVNtFGhJbrOT2jmoHkK7REYgIUQHy8TV11TxVwLrHXFB7puG7X7gRbI9h17PtafLaQaqsYPR9CHAzg+4tADzk8cDXCInZjgOCsBVl4RNVAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o+QOUivS; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so42672251fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 22:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719207292; x=1719812092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=597F8StL/WJzwtlklD4026dqqrH/+l0r6AFwKiLnjjc=;
        b=o+QOUivSovUIGb7fo1QSx0Io02uZeKqaheBUN9cK1HMKvg0E5hol95jvY6Sy6t49Ul
         XbYdn0yNpTUYaoBZAurOEPwtdUrRfHguxwZRz904ZQ4gowqlKuLd3CSa+IqLIMf1wDng
         GL/QKAaC3tMR0sWX3btOrnnJXXrjq61WCTe/G8wCd1x0+MVtZ2v/jXXB1BN4u7zEfX75
         GGFCGN9ep7MPkGNx0wAjdmLRZexN0oTy8Uj1dQiYAJiSSxc3HkCvA3aBsP11z74WCjA9
         3HIoHZopc5zI9n39jfpF3ozGhD3USB/Qt8FRFUyfeC7iysGoOMyeBHhzp6uT30OlHepO
         KJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719207292; x=1719812092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=597F8StL/WJzwtlklD4026dqqrH/+l0r6AFwKiLnjjc=;
        b=KcVHyY3bpprx7UBb40iO/ZV9Ae5NlqsdsEEKSZWDPmwAjug2v0+0GIVVgGDuXNQ1d0
         fj3kRwDRCfl3kdS63rglWpHK9P7hyX3vUSpQ0Jvq/rXmeROEP6UXwFpAd27P8JV56JAd
         VDBJy80HOLlpIB3v/sPVVS/lqlwRi7qqdtKQ64im6FabQ7C8FSHmtHUPSPoUjQboF6O3
         a/Qh1YI7NXjvlzGdddowdkcS2WsZ5RYTY64BJe9VcWhAm4fmvtwsLUg7kcH9sSbbtFUf
         LNsbQG87knK5Luc4j7CouL2T+tKgOzoDFTGGr41EvoDNvUwbhjIL1Yg5i3sJwqOeLAG1
         HxAA==
X-Forwarded-Encrypted: i=1; AJvYcCUVsH9awY+henaGV/I0jUE1qLJTBydPcyeSYwQFZaGroIvrXSxi6I87z8hE3Dl/WaNCern/UUYbllZboRP0LvliaONnykfvDq68n5zDKw==
X-Gm-Message-State: AOJu0YwkmIVZ1bXNSDeRVsIgvzhA2Q4ZdrVoQmvTIPOj+qw+mBfgPY1E
	GBxJuJ5qNJoiW+C6Z8x1WhKRATGMDuVpVBxY8PZXFxUt02JKlFywXCGIBHg4N7k=
X-Google-Smtp-Source: AGHT+IFGlNTPxkgHedK9wRG18wo6RMMt1Fe9/ddWFIoExxdLbUMR1WIHZQpU0EdbscRjwTfmjY17zQ==
X-Received: by 2002:a2e:87d9:0:b0:2ec:5467:dcb6 with SMTP id 38308e7fff4ca-2ec5b39c57bmr20962951fa.52.1719207292470;
        Sun, 23 Jun 2024 22:34:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d60133csm9066621fa.15.2024.06.23.22.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 22:34:52 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:34:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	abel.vesa@linaro.org, otto.pflueger@abscue.de, quic_rohiagar@quicinc.com, 
	luca@z3ntu.xyz, quic_ipkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/7] pmdomain: qcom: rpmpd: Add IPQ9574 power domains
Message-ID: <f4w5hvhgyniecab2rhy4s5nd7ktraf2jk2ebnp6najqq25tsuy@3lqd6p4hsmij>
References: <20240624050254.2942959-1-quic_varada@quicinc.com>
 <20240624050254.2942959-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624050254.2942959-4-quic_varada@quicinc.com>

On Mon, Jun 24, 2024 at 10:32:50AM GMT, Varadarajan Narayanan wrote:
> Add the APC power domain definitions used in IPQ9574.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>

Given that Praveenkumar was the original author, why isn't that
reflected using the From: header?

Please review your process and keep the original authorship properly
attributed.

> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Fix Signed-off-by order
> ---
>  drivers/pmdomain/qcom/rpmpd.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 


-- 
With best wishes
Dmitry

