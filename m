Return-Path: <linux-arm-msm+bounces-43938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A5A01619
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 18:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DBD81883AD8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 17:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6942D14375D;
	Sat,  4 Jan 2025 17:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VDJmVY1H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B7D28EC
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jan 2025 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736011118; cv=none; b=fMkXzxYcdAPT0qCqoRxrtjIGBse7S9/LuMwZ+/VlI+kK4ppxU0un7aVXTVPUYg0Ee0YnJX7aYi92RXA5NixjERNV2r/jwTy8QTBeP9gUauxV0e5Mr/5Jy2+ROZTndz9xrOuRi90V3aDB2WDHUe2h7jWnoiuLPXWcPFklcML81wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736011118; c=relaxed/simple;
	bh=2Z72HU+D26I7BW9Qs8L1xNzPdqUHVKI9Jr+2DORNkWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuJSFu513LMka5nwu9VkBcV8WpS/LfhkpAGRNS5TTwZUau/rdvVUXkLxCqo3ws768Uxu9D8sy7nrKlCXf8S1Fv+fBT9neYH5HNzKyEumHD6ypl9jbN8iUOp1T0H16IhEXEutLxXg/BaHP7fVG5OeNJeuafJkeK5wG2W5ftt/Y8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VDJmVY1H; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3c47434eso13640403e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jan 2025 09:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736011114; x=1736615914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hW0+u+P9cC5nllpAC1tkykhhD8VAOl8gKY9poAu5mgY=;
        b=VDJmVY1HVG107uv0m/VtFV1543nY2mYlkeTV7gqx1usPF9kbMLI30sUaDe0lAAcYj4
         F7zh4ANIGS+HllT86WKd/vYTjM642JP5W169KpWlqyumSFJWMbAleqY08sON8OWBJW69
         0UCr8XV8hA3wipfA3pDINOVGufW60/D29HUL46/dnrGoPjAiFc+gf/rqAUq0DMv3Od4Y
         eovl0Jfnzqws8NNQU9kUpJ3cS9XJNiNZ7qxUZC3XiWhTBgLiD6RBclthbqS4J4lPYbAc
         WNvpTjGpbD1wMcUuRS+eIdoI800juXRLFuwJYnwkl3cakwgM+MZWpryO5sJu12Of8czm
         vnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736011114; x=1736615914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW0+u+P9cC5nllpAC1tkykhhD8VAOl8gKY9poAu5mgY=;
        b=CxC9uOI0TXA5slyI5GPRxJn1et0ZLTfHVH72s/kKrlLrIE49pbVYqDm9lBdC0p3Qw4
         Vku2QPbzJhqJNRR8YAorSmhHHTC0UgusA63yHCY7rXVLCnBE0vYEhFcmNY0U/5MHMAW3
         TLCr4Tx+pnzJ8YHjYj77tf/9+ze/smeEm2biWgdJ1JpgX9Z+AlPDPIVSQs0rM8Qr7+lo
         Ok5sEZQfLMkiDV+rkUyiKiYBO2aQCucVRfgwEKLtfczZCVZg9G/3GAWau5jhJljLt/Ot
         illkgbqPAGmrxgxGSHRu5cBFvKJcVYnr626yOKhSwZBtiEjAdTIQs9LpCbAwnWp4GQXx
         QHMw==
X-Gm-Message-State: AOJu0YyqOWHLLUFSCRSssFAa1vFqgmqiSwSIhvN31HHcPVnknfkPCnWM
	S3J3Y0CWE9dbnF7MJNNyabfXoeouCJQfuVilXv50SiS/fIKQvi3hpaAbwsP6U/c=
X-Gm-Gg: ASbGncs91+BP4hZBBihLAg1akWyXrL9xkITmJ8h0UDYRKq9goP9BouSHd2ck/y5h19R
	Jx9p8oQ3+uza50KwVNP3mFhUbDI5lcfsSh7VUOXTVGFdvrPDeks6r/HgnOhnJyYGuh2JIMPdbNE
	G6wSAa1jy4Au8zJzPeXf9zaSRv3q1uyy9lYAND7fP3AjGMXY7CAbCaIvip0y1M7xqIOCEoawT8m
	1rPQvDeeV19hxkrOSviv55XgOzjtO8kP3J9oetwzM6JTzx2WcHnuTFDfUarYpvw79XbCOykW/wK
	RlCb7+V1JjLRGJAvlNZUI2XBTivCwHMQ+rzS
X-Google-Smtp-Source: AGHT+IHUGUXgrQ4xntB02/IfHZYKdmLvgEJr4jwZjgVb7/KseJg6X9jxjehweluIJ8UGMyfemPIg1w==
X-Received: by 2002:a05:6512:12d1:b0:53e:3a79:1ad2 with SMTP id 2adb3069b0e04-54229561a1fmr11545213e87.40.1736011114115;
        Sat, 04 Jan 2025 09:18:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422381383dsm4481764e87.161.2025.01.04.09.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 09:18:32 -0800 (PST)
Date: Sat, 4 Jan 2025 19:18:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH linux-msm/debugcc] Add SM8750
Message-ID: <6omvqu6ul64y3niznzterw4amvu4p6ucqfxqmrs36dv7emf3rk@px4wbjoyjpln>
References: <20250104092123.5600-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104092123.5600-1-krzysztof.kozlowski@linaro.org>

On Sat, Jan 04, 2025 at 10:21:23AM +0100, Krzysztof Kozlowski wrote:
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  meson.build |   1 +
>  sm8750.c    | 839 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 840 insertions(+)
>  create mode 100644 sm8750.c

Is there a reason why you can't open a pull request on GitHub, like
everybody else does?

-- 
With best wishes
Dmitry

