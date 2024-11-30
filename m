Return-Path: <linux-arm-msm+bounces-39748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A89DF38B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 23:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0A7AB21596
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 22:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AB51A76D1;
	Sat, 30 Nov 2024 22:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a97DjdWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6C13C914
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 22:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733006154; cv=none; b=sJcjIeWSQoh89W5jdUPCq8G4vWZhb9zsuMipwmVaaTiIpgVB8MPksoifBEqp+F/N7cZZ8ZJaKn/gijYQJ2uprnx4XnapuWOI906hFBtB64ZcooapTl0CWHZDUX304OgtZgh+I89V1a6JGz7tZGAZiO9LQXq8S+gtY/aCSfeKMfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733006154; c=relaxed/simple;
	bh=e3Y+LPT4T+5s5Z1B9azCpm11KJqEouAd2GSPxWJzbrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kN0eORL7nLFe8xQMKJycoraQnjwpxhY6+b96DALL7qO97YgyASqEdDZSF3N7Omdca+i7r18hGT11Pou8ZE6asnQ2oFL5PpSORIbSWnL8s4ysWUAllGGl7G3k/IGICBBde6zLrsYX0QQ+lphMU0Ym3RQNdNqS7YugjuGLRdRtXZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a97DjdWK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53dd2fdcebcso3402107e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733006151; x=1733610951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NjEEdOsbPzZpO48x0whbp4HjANLGu9eqTa4aQfjzkTo=;
        b=a97DjdWKvexPbFWtfAtSizs3GGqmFcT1xqlpJ5uKFWZinCbpqyNWIxGzsRUHhf2BvW
         bvwZHTktqh698k8bjHI/j71Bgi5F7iDIWqS8V0LBnW8Gw5t+ykkvs2fJOGHQgNJU6x8P
         bRiTxIQfASlk72hKSo0kWxh7mkUdPY5gakyfGMxXf1OlfQjyhy/i7Pqf4/XzlhkKw62H
         8y1q+bMbsd94mDIjIy00j0lI3z3DLnlkvjUUj2gMJZ953bJofd2+91jJfAvnRkTVDbSU
         1ceUD3gIdTTI9GsfMjzK/mQOR2UU61CNqhLu2ZHjdpIsAsC4ge1MywG9bTKCqzl20BaN
         ohZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733006151; x=1733610951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjEEdOsbPzZpO48x0whbp4HjANLGu9eqTa4aQfjzkTo=;
        b=hVhlW0sKauh5b/m2lP+qJxwGZXfWviTR7ZC6yYOJOh/w52FA9rB3fA5mLIt0uJuC9e
         S920QfjOvkdGYVF0orjSO8xpeHHlpY0vo4QJxeBVD7U5WGXz6k26dMFq1JJ8qhVlxKlT
         dO6jXTFZ1FuFPDXQi4KjSNmOzFuxDelPB+wpMmRoQvJ9c5wUGclWMa7rYjK2G0lj31c2
         88VSMkZVTswSWUdkxyWU10qycyEnA7E2CENZ9vchGWwnNg4qkOg6pFl7ulkxNLCu2kup
         iKjv8g8AN01jINHPZUedpfNoBmMpj/wkLC4pWF/7CvrHJ07jlgdhdp3aJRRQAz+q66qT
         HltA==
X-Gm-Message-State: AOJu0YzZx84miXePhPCZm8+30bFsVFJd7suYH/4YuavWiV8jDA/epqH9
	gsCBp8oFC3QpHksdGdXnavlNcPKYbbwa6eDEEU2VY3uhpRWtyJwaR3sqDKvS4QE=
X-Gm-Gg: ASbGnctKF9jfJBT9KtretykCxsnHM+xURPjc2ZiBUYWwa/vN2WwzgunP3DlGahSi2FC
	SdFvS6RX40EanOQtcdh/kWncjvteXXIh2Jlch9ioEbWL7OqmgMqJ7SHWCb544/ZNV+C6Odhjrqz
	GofxKlxWTsQtt2FgV+0X1tp1Yjbf7vLR8CbvY+a0CdlLHtIiRDrDuf5igoH6RNvMWi+XO/K+1Jd
	O/P32Q14OWTrdJdkjSDfg6BkCb7bJ6zdQdzaFh4YO2oG66e9njhjLFMc4UjdYPpBjzZRwUL15xh
	O4T19kx7aF25e0S8V/NXLtMnlHX8Iw==
X-Google-Smtp-Source: AGHT+IFRjM9hiHSdh6QMnUl0xAn2h7VlGTe986jUjWKha/xgpcy6CHVBb/2l1zKz49suidogBV/Sfg==
X-Received: by 2002:a05:6512:3983:b0:53d:ed77:37c1 with SMTP id 2adb3069b0e04-53df00ff831mr10041944e87.43.1733006151122;
        Sat, 30 Nov 2024 14:35:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a068esm877155e87.273.2024.11.30.14.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 14:35:49 -0800 (PST)
Date: Sun, 1 Dec 2024 00:35:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Naman Jain <quic_namajain@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 0/2] nvmem: qfprom: add Qualcomm SAR2130P support
Message-ID: <yeqgrz3tlhqhkd5au5ras7iyp3q5l6mjfjnpngyuffn6k2hu2y@toy6eqfpdoub>
References: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>
 <5lucyuowwaz7k5x2grlifuc7xxxppant3ysofy52xsrxdsx4zf@2tj43gglshcf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5lucyuowwaz7k5x2grlifuc7xxxppant3ysofy52xsrxdsx4zf@2tj43gglshcf>

On Fri, Nov 15, 2024 at 09:59:58AM +0200, Dmitry Baryshkov wrote:
> On Sun, Oct 27, 2024 at 01:42:32AM +0300, Dmitry Baryshkov wrote:
> > Pick up a fix from msm-5.x kernels and add compatible for the Qualcomm
> > SAR2130P platform.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Picked up required patch from QCLinux.
> > - Link to v1: https://lore.kernel.org/r/20241017-sar2130p-nvmem-v1-1-6cc32789afc6@linaro.org
> 
> These two patches have been sent two weeks ago, but got no response from
> the maintainers. Is there any reason for that? Srinivas, is the
> subsystem being maintained or should we change it to 'S: Odd Fixes'?

Another two weeks and still no response. Yes, we are in the merge
window, so I don't expect the patches to be applied. However it would
have been nice to get a feedback from the maintainer.

-- 
With best wishes
Dmitry

