Return-Path: <linux-arm-msm+bounces-73126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C839B5325D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 339AE5A277A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 12:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB090321F29;
	Thu, 11 Sep 2025 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/hfNz8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E0321431
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594019; cv=none; b=RzrgXrLvLUh11HKzbCZR4OxJwIZt4ODlwbVjlG4KiqjcUQ/LibPVhctAMrJqCzagJ0oDqFBkqnD1D2Xq0NG8EEWOOhN7traa0to9SBSLiLZNCpNiapgKB2Nz4BDq6HK3WIlEH2Dmi7rgu2xHGPfE4IcFfg4LY1WeTaOTIv6WgsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594019; c=relaxed/simple;
	bh=VE1roVfRus68bBPTerPNOcsbtdx+CTPzLCSXO4Sv5PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TX8H/7SUydnElJG9Q9PWgMSU+jNixTS9aOr5n8TMniIyGVihqwFpiIqEhaY3A7D/T41PVZVD7AezfaPvTjZsTy8ATwQx4Md1D30GhzFA8zKSdLeA7EK1i9aI2UnMrRA+Wclm7hn/dBqXI9jyrzWDlGwJZaMsc0CTzqkgYxotLOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p/hfNz8F; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45df7ca2955so3071195e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757594015; x=1758198815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=77w/BLu3louQ5LAeAyTpxsMARQdOP7fXiEQcpRRVAfE=;
        b=p/hfNz8FyXbfz8wSydDkHFhvFh5pbEd3jnxW8vjsvF8CqiJwvrRoKYDrpP07Sb/wc6
         Z4E5IQwNqJcN7dINKaFHD8gB41HuuxKSdPk3pv0UhcksdM7XNpqOa61z5ZVjmletvrx+
         EYvpaWNvp1NlxoomYo/odLPdDwOxybfUA1HRaGtclHj7eaICViJ0S8SzS/fGkUI1RT7O
         Y4JKxdMazQneyfjFAfIzc8nKCar970Rr0eWaucl5MOYHLnEK1XcIhmXH42CNN1aQcnS3
         BZVNjURcWLEkFDJlhARcVwnDE5s8Drc5HJiRtGgzV/QtFECKm91QpuvTWfWTRp7YpNnO
         58Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757594015; x=1758198815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77w/BLu3louQ5LAeAyTpxsMARQdOP7fXiEQcpRRVAfE=;
        b=qk/MhGqqo6i05hkRNpZpJaxY4LJareQsa3DNR+Ajwk0hc+sjtwjfF/x4oGOHcCWum5
         9KDeIeTQS5mCIF6iv1YR25SLe64Oe5Tt7eXcxk/t/x2rOmoxQ2Ga6BAvRznsHtOjQRZh
         pvBsm9J9aJvN87vKALKbWe88Qw3ssPOB/8QxkaeuaSob/8BojaeIMXj84/b1LfyVhopZ
         Pu2K4M2ejArTRMwdCFOyxglhXxSNHyQmAnx3WFURpriB/AnAxKTBRsQsC8nUfC6NNEyz
         rQ6fJD2KJy5m3/GMm3x3jSPTRqfYIuK1ce/gdc5Oo0zjvZb+F+mlB7DVbC9oaD3G/JCc
         FagQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsAizjNATrOSkcd2YPepo0DaXa7Aj/TeskAH3kOOF6uCNCXr3k+QMSXACeAE4CsuGYLnGbz1QnXldpde6T@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ0DCmMjrBuNZE5XU2Bs3nOoZUmCkgpGF5KwsgB1qkqwNVVlP5
	3o9BVODG8u15XTXyI1O7S4ZpmyCu0EhsZRJ3RTSa1nj62wV+HmTEqJYTVukoNYfHnYg=
X-Gm-Gg: ASbGnctTCIOSQlihbgS29wWlBpGreBTpkWynv3ArZ9phSObQvyTaO5MDJ2oFFf/HdTV
	djYY1mCwfV7LjO9Pox2Tsl0wmyTJnaoQSjY1bNjVtDjXg7u4/CV/vJVWP2d45ocV0AXHq2UlJG2
	nhgNGJ/Q3txWVfdyKlVj5kv7dVxmYHBs/bLHRksSz3zhrdTihqKZJ65lxiN9Ipn9oGjgzrnrjyV
	VIF+U6m7gF/Kj4Jp5weP9ouUX00CbMGZ/0Vkhz4my42LUjXhSsmQh9ssUKUmQdvvXLWhEO3iLBP
	6wuXTvLZIeevi/kD1H4J5o1jq3587RABmFWgHOkZsEinLOZXcEso0rwDVZoeWHgR13NBKl+zNuF
	eBddIoKg3qChYoLO7GDQyQQ==
X-Google-Smtp-Source: AGHT+IERNyAnFxuua9N1uDZtOVhilat+DKTgWSq+/gMo1aCu3TqF6Sb2iqngQDwNMVzvjL69GHQfIQ==
X-Received: by 2002:a05:600c:1993:b0:45b:8b3e:9f66 with SMTP id 5b1f17b1804b1-45dddeb93b3mr157844605e9.13.1757594014898;
        Thu, 11 Sep 2025 05:33:34 -0700 (PDT)
Received: from linaro.org ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0153fbd5sm13210085e9.5.2025.09.11.05.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:33:33 -0700 (PDT)
Date: Thu, 11 Sep 2025 15:33:31 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: edp: Add Glymur platform support
Message-ID: <2mcs5cov44frxyvg3k3nuov3zedaoc6ayd5dpoh7r5kcsxa5eu@qrqxpvnrkgj2>
References: <20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org>
 <20250909-phy-qcom-edp-add-glymur-support-v2-3-02553381e47d@linaro.org>
 <3bo2xr3jb3hrzsetjzd62dmcif2biizvoanxwtyhr2dmkb4g7x@dgrcvzujcwgq>
 <wetzewmbraeawwintmxqntjhvennq5iu2jeegel3glk7y6rsnf@4vwscm5bwezr>
 <fff688c9-af7d-43fd-a3f1-00209842bcc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fff688c9-af7d-43fd-a3f1-00209842bcc9@oss.qualcomm.com>

On 25-09-11 11:18:53, Konrad Dybcio wrote:
> On 9/11/25 10:52 AM, Abel Vesa wrote:
> > On 25-09-09 14:12:46, Dmitry Baryshkov wrote:
> >> On Tue, Sep 09, 2025 at 01:07:28PM +0300, Abel Vesa wrote:
> >>> The Qualcomm Glymur platform has the new v8 version
> >>> of the eDP/DP PHY. So rework the driver to support this
> >>> new version and add the platform specific configuration data.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >>> ---
> >>>  drivers/phy/qualcomm/phy-qcom-edp.c | 242 ++++++++++++++++++++++++++++++++++--
> >>>  1 file changed, 235 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> >>> index ca9bb9d70e29e1a132bd499fb9f74b5837acf45b..b670cda0fa066d3ff45c66b73cc67e165e55b79a 100644
> >>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> >>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> >>> @@ -26,13 +26,15 @@
> >>>  #include "phy-qcom-qmp-qserdes-com-v4.h"
> >>>  #include "phy-qcom-qmp-qserdes-com-v6.h"
> >>>  
> >>> +#include "phy-qcom-qmp-dp-qserdes-com-v8.h"
> >>> +
> >>>  /* EDP_PHY registers */
> >>>  #define DP_PHY_CFG                              0x0010
> >>>  #define DP_PHY_CFG_1                            0x0014
> >>>  #define DP_PHY_PD_CTL                           0x001c
> >>>  #define DP_PHY_MODE                             0x0020
> >>>  
> >>> -#define DP_AUX_CFG_SIZE                         10
> >>> +#define DP_AUX_CFG_SIZE                         13
> >>
> >> If it differs from platform to platform, do we need to continue defining
> >> it?
> >>
> >> Also, if the AUX CFG size has increased, didn't it cause other registers
> >> to shift too?
> > 
> > AFAICT, all platforms have AUX_CFG0 through AUX_CFG12, we just didn't
> > need to write anything to the last two so far.
> 
> I checked 7180/7280/8180/8280/x1e/Glymur and they all do
> 
> It would make sense to perhaps spell this out explicitly in a separate
> patch

Makes sense. Will do.

Thanks.

