Return-Path: <linux-arm-msm+bounces-27120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC893DEE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF1FC1C21407
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 10:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE95F4A05;
	Sat, 27 Jul 2024 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLnTApE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A83257CB1
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077684; cv=none; b=oji4ERuTTVMdnoNV+ZEz28XcNRrFqJnnZ/cKNfc7rtm7IpvpePgrhdzdkFdlYFOhA5LQzEiSoeVCPkqB/6chjppPiOd0LSMeIVgauGLeoP7Hr5gqDODuPNkpfKdcJRXd6v9mh10kXbLroyWr+VeA6FNBEqlCsBozDFgF44z+21Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077684; c=relaxed/simple;
	bh=U0cW14hOGmjNsCtNFpSGuYJ8n3+nXLxGtLEJ2RL0COY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lewo1JdhR1JlLWqYw7Yua6sA76g7YpV8ye4ge6xGvR5+Sa9f9VS+oRYssev6VwHPFPTWRXdwj08itvmJM+ykz/NgPk6WsFg4DaS2hqFozfHmWYOnX1/wkgcD6O1G71mopCZ20iz0d28ReqrgMdjDQUtRw7JinfsiD3IDjvnUNhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLnTApE0; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f03df8c8cdso20092561fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 03:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077681; x=1722682481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J1yuXFYSmqGWjRrtoMY+COK/UcsO/9oWsmcjq1KEBC8=;
        b=XLnTApE0y/bCQ8NJuPQm86EmQeT67kuQdodTVeeQDuGW+OpBrEjeaZtPdEnS0ni0Nl
         Txc8DMMiEMyYOexf7yr97CKDk5a03RxCVQ3EwEAGtDKqkfIwKKn7W39TSR4IuAO02Af8
         BkLN2IIh91YW6yDH4z+Stdyu+BQ6AAnMIIfS1yFRjmvNvM4LLpPvTNHSUWRTJBdUcgxD
         8KpWP8HUHBTdq1rSB6dOrnUNCx63mjEou0hQP08k2PiDbpulVyHfhYT65bHiRLlz16t/
         q2Uvvf2TV689c6ckfdZL4uu2OTFJN0TjM9EX+at9wGpPjNdnMPc87rBdw/AgGz/aZS5d
         FfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077681; x=1722682481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1yuXFYSmqGWjRrtoMY+COK/UcsO/9oWsmcjq1KEBC8=;
        b=ZeUmapBQgwCIYmX5FROUwaXk9UVqMpV31ZI8mk8K2C6EF9/voNVKd9pntBx/bHCvXi
         v9zOjRIKaPPF1h6i9bKI1TkrpLSHcVnTbMwQnjqdliq569/XhU28Gh/O+Q4fnGIJquyo
         JhC2ACahEjPphS4IQocdzp7kh3WHFcV0zQAEjP+lIfTnNaJr9P1vvSX2ATW9j4WBkElo
         rnKRL/BVBl/RXaJ2ggfucdYC6nfYwD9kQhShbXI7e178IJacAlGY4XTi/ZnSTnboWuWx
         1v3acMjHRkc+xSN67YOHlenxnaRVlvlubnt9Ms5sb4SD9FiFNT+A4XIm0JA2OmhGMSqu
         uYAg==
X-Forwarded-Encrypted: i=1; AJvYcCVGFAQMerkGIxTOGSsXyTEAMN0Q7XFbfEESnFS3NBOJ1pANyJm8sMj4pWUoy64tPHu4SjyrDFkX40tGmwDVi9zgEnIvtE5N9ENGOi0uvg==
X-Gm-Message-State: AOJu0YyzCTlHF598wZzOyBhCJulBSxoSmPTuHWv/pGRm0E9/IDEoNz2h
	5bnfLsQaRTSnY4sgUF67XDD2m75wJC2iBTJjJWRDgTrx2C+BFghBsMhBhPZFe9g=
X-Google-Smtp-Source: AGHT+IHewVs2+keFyyL/KmniuMbAUW+TemAY4yE10PEGk3IoPwlLY5XUVA4Cr7qyLUObAyf9O0VpQg==
X-Received: by 2002:a2e:321a:0:b0:2f0:1dd6:4430 with SMTP id 38308e7fff4ca-2f12f0cd2f8mr6130941fa.11.1722077681361;
        Sat, 27 Jul 2024 03:54:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf0e356sm6554731fa.27.2024.07.27.03.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:54:41 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:54:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: gcc-sc8180x: Register QUPv3 RCGs for DFS
 on sc8180x
Message-ID: <g4etw2efnugdsv73ejbbqfxmumy5m3oqzkpeqexzpgzlxsms5r@u62f5jcskqfd>
References: <20240725-gcc-sc8180x-fixes-v1-0-576a55fe4780@quicinc.com>
 <20240725-gcc-sc8180x-fixes-v1-1-576a55fe4780@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-gcc-sc8180x-fixes-v1-1-576a55fe4780@quicinc.com>

On Thu, Jul 25, 2024 at 05:03:11PM GMT, Satya Priya Kakitapalli wrote:
> QUPv3 clocks support DFS, thus register the RCGs which require
> support for DFS.

From the commit message it is not clear if the patch fixes the issue
(and thus should have Fixes and possibly cc:stable) or an improvement.

> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 350 ++++++++++++++++++++++++-----------------
>  1 file changed, 210 insertions(+), 140 deletions(-)
> 


-- 
With best wishes
Dmitry

