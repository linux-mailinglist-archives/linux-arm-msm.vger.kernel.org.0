Return-Path: <linux-arm-msm+bounces-31532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD4975AA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 21:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 809A01F224F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 19:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E003B1B791A;
	Wed, 11 Sep 2024 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GOckHCbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E940E29406
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726081302; cv=none; b=aSAYe8e8cU+LBGmeHIDPgqzE9MEjViQ4yrqxHRZ0jdJIwbVIOCJ97QHM0EShuGxrTv92Sqx57MrB52XYKeGggYHJpgFFsOWQC5wcjO2mYsjtwC3299mmo+qpCOsiKYGrl9XVQj9JGoIRmPFmqBTw+s2UXHvH/td2nGRPEFK/x4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726081302; c=relaxed/simple;
	bh=kH3LuToOHa6db3WM2nZY+JYRpzIzkBdEitM5B9H22Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtW7BtGreSTVL0oCv/WvkX1wdfTZGpiulaTs7TyQR12KzPphspLy/g+vX3FcnQ0BykL1j6/Fx/MZEXbmHaxcvL8BSAIaXQbMIvSqChlMdp6TJrIqX6w8cR/sf5ZMhq6V4cvuCukKcAlw4XghjGKOgRu5GreHYgfLo85JN3jK1SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GOckHCbl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5365cc68efaso147844e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726081298; x=1726686098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gWLfBvU9thbiDwhY0G6uXsn1HToOTkJx1+aOpLmvWp0=;
        b=GOckHCblGkRklTosyMy3byELv9kFRRM6na76FI4BpVDmiei8psfuVB61wvMjpd5Ixy
         E5/g8bO3UMpt2VHClrWBaC0b8Z5QH/jaGD68rviwsZ7DxUmo0lMCSQdy1t1Lvzl5J3Vf
         l4NDEGftOFLFeLOxZYnKB9pk0Tc9XUSBEr7W8y/+RcVGx4Ei/SXZo/SGyDNBBo8UVpJD
         hYEizM70jlHleSHZMErKzaMfKxI2iG20n5VNg4n0TEI/n/bz1deBgbn+NTtntN42PkEQ
         SXYW2f1kzSQwG9GldVkTZq+2zM7w79CBiIREJVfa6u+WEbCtQdUuVekYMdNJjwPT953I
         ma5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726081298; x=1726686098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWLfBvU9thbiDwhY0G6uXsn1HToOTkJx1+aOpLmvWp0=;
        b=TIMOcVzmYPUxhTdCi7deU0NePLoq7VAa7JBkYgcxvhGKl9UYzSSRJsLD0SRQK2Y9JG
         5ImMY6JUBzhTJx5Z5jxDhg4SGEtWARWdOVEsnmQhAxgScuAGgDW8fA+idWgcBr5ucMHJ
         zI+GRgxMu2tkCP1rLZ42msmJ2CXtqNQ/DA4kb6NkTdxx6xa7emAbn9xut2NeA0RbAVcC
         3rghDmDG94ja9kK7Yy+DhJewt4naV17FyiCvu0wu5n3wYAHIjCBSicigyFjW6zrCSoXe
         NjbW+JClCXnh1/IOak64PVC+ZpLz8YQpWMWHCt6Yig0mwCTjU5E/f3TOQ+tWPscjHAvA
         KhQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkCtHdJRlFol65Onbueb2pn1XEL027b/g7cm4f3L1OioZSmLFGitCCwzMuDmsYJHs1CsSigGIhFyHj6eKT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1NbioGhTrsaVxJt5pl14qnbVWa0z8NnsTMu30NzPDAgeXwZAP
	nfkSvnr88Ri2Dum9ymn5WhKUP/dKAExKdCmJNzQfgGBWXaxmkDpf+3SS/6BG974=
X-Google-Smtp-Source: AGHT+IGvUrY0NXLE2kfEi1SjtrIlfxaP29Ud499f9t88oQIMLSOo2+1mSb0m/gpMYrvrvoW7C3IPNQ==
X-Received: by 2002:a05:6512:e99:b0:52e:9f6b:64 with SMTP id 2adb3069b0e04-53678fc2279mr203397e87.34.1726081296949;
        Wed, 11 Sep 2024 12:01:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90c306sm1653668e87.245.2024.09.11.12.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 12:01:36 -0700 (PDT)
Date: Wed, 11 Sep 2024 22:01:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] phy: qcom: qmp-usb: fix NULL-deref on runtime suspend
Message-ID: <zvy3mvgvkhrey3qcj4m3mgfs7apinsr6t2zo5afjjxpijhs7ig@tzv7fe47bodk>
References: <20240911115253.10920-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911115253.10920-1-johan+linaro@kernel.org>

On Wed, Sep 11, 2024 at 01:52:49PM GMT, Johan Hovold wrote:
> When working on suspend support for Qualcomm platforms like x1e80100, I
> ran into a NULL-pointer dereference in one of the QMP drivers. Turns out
> this issue has since been reproduced in two more drivers.
> 
> Johan

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

