Return-Path: <linux-arm-msm+bounces-29938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBCC963F7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964951F25969
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 09:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06E618CC02;
	Thu, 29 Aug 2024 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jobFx441"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396F118C025
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922417; cv=none; b=JYna5h9C1GFK9wpEGDpVcAF7R9uEsUgPdZyk5NsObeJmgQKxMqhxSXVUDssRwyUKHYnefJMTzi5Cc8TcLf1uiFQOayTyRwlwNmmqSjF82o7fmEWzreKBRY0xuihPIsJnnjWaxJbYaotSNIZIZtCdkqM4dw73cXH1kd8G+kKONp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922417; c=relaxed/simple;
	bh=7eXz03uhw8DoH+SK2GO8uzlMczYV3nCsPFtaNJ0YIbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqbfgDSHvEufirgTKgRcWMIgPQlkyE9UiwV2O2ag/5WfpRYOzxLRuJ4qTLWi20HlpAziXzpgnQA7hB+NC1qAXmWgMeHRTkwskzoacbxrC7lwzxQntGLKF8NqJqWAC4WSX8IhWh+h3lcLVTZLf9WUQJciF8KPQJeT1/JRYjuywjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jobFx441; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5353d0b7463so703274e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 02:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724922414; x=1725527214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d0i+1aeEGq4rgf/d7rFiIlGkZZYQ3MiL0C7dIbTMOJs=;
        b=jobFx4410Ah+jCJKqR6V8zPUn6tzxhbOakmz0hNorb4kcNp4vSHCXbaS2ZpvSpInKQ
         ibEixe5WB4qG+r9tpbUJEDacwIjTIND/X0M67pz742T8Hamhia2BuspLdK29Z+1aijX1
         vbVtSdl7Y/kSKxU8+k4v+gz002RgVGkDattA90BsG4lAn7o4eEbfzBs4TCX08jDcPl44
         xsVF7RCQHvLPwVcLQVEXcgpgiYwqUInOowklBgmwpnBuCkq4AD4sFMJTkmMxjfXDXUpa
         vLdU4C1QWXic+iXs7EuQbZ7e2gNrd6YtOECgsggpSEGlTHsq4y1x43xkPXIPATqxn+QG
         o7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922414; x=1725527214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0i+1aeEGq4rgf/d7rFiIlGkZZYQ3MiL0C7dIbTMOJs=;
        b=jQ6dMiCYKsHu8J6Swm9R3fmLD5CAQ4J/7tVp2PfuBHLxykMuPWlDHWlTqX/9Jdnzua
         nLBbOd1quc+v5Zq+2fBmapHQ3a2WWx7Ch32/VcW7hCXIyf2mq/2twtewAfYYTnmmfhhL
         jlEIgTAIniL2u4QLBsnELOrH9O6cJln+EsMaK3ybFxI/NByZzCg3tdaa6zSWN+0V2ne1
         WmQ6oBh6/VdOGca8ivrjm1TiwCVAtzPigSSn1ABMCiLKxZSVG7d/51rF73ftSL9VM1sK
         PXazUVR2MUAWM/G/Q8Xosb7I7hVUMZTPezs5BJ87CH+ZX4RnX0ju/o0tPJw3jWKHXqg3
         l4oA==
X-Forwarded-Encrypted: i=1; AJvYcCVcWL1SbuP2KdWS7gelqYE7u2tab3BqKAPJCw/gkoco9aCnTzq9K+zzYA8YAAJgsvo/XsHwwH2VU3R6SbuS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9dhq1ydeAxzGXWQSPB8bqxUI5r450okjFzE+rXPuybiS/aztZ
	kUGCB7DwekZ2mKAywGgPIbP6VSrLtaEy9RajxiDVt4JX7ur9jFjBeY8C9kdD2ko=
X-Google-Smtp-Source: AGHT+IFZAFiajCRKvVrZMT4gwxiPYEf4yoRnz8sc8Qm/VbyG8AogZfxmVe8CJ8QJj3rL4C+Jh1L22A==
X-Received: by 2002:a05:6512:2309:b0:530:dfab:9315 with SMTP id 2adb3069b0e04-5353e54324amr1735621e87.10.1724922413711;
        Thu, 29 Aug 2024 02:06:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac454sm102192e87.103.2024.08.29.02.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:06:53 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:06:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yan Zhen <yanzhen@vivo.com>, andersson@kernel.org, 
	mturquette@baylibre.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v3] clk: qcom: Fix error checking for
 devm_clk_hw_get_clk()
Message-ID: <alrspfbadwth4v3f5q4nstjm5phd7ttqxyxx24lyye6lpqclws@v5dfuc2fsp54>
References: <20240827025252.3512746-1-yanzhen@vivo.com>
 <9ce5d7b09b5358c9190d8a999d79de23.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ce5d7b09b5358c9190d8a999d79de23.sboyd@kernel.org>

On Tue, Aug 27, 2024 at 11:18:10AM GMT, Stephen Boyd wrote:
> Quoting Yan Zhen (2024-08-26 19:52:52)
> > The devm_clk_hw_get_clk() function returns error pointers.
> > It never returns NULL.  Update the check accordingly.
> 
> It can return NULL if the 'hw' pointer passed in is NULL.

No, it will crash:

        WARN_ON_ONCE(dev != hw->core->dev);

Furthermore, clk_hw_get_clk() also doesn't have NULL checks and will
crash if NULL is passed as hw.

struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id)
{
        struct device *dev = hw->core->dev;


-- 
With best wishes
Dmitry

