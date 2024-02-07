Return-Path: <linux-arm-msm+bounces-10071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5C384C58C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 08:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB799B23725
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 07:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFDC1F60B;
	Wed,  7 Feb 2024 07:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wCSDiE2R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F9E1F5F0
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707290395; cv=none; b=So9T5RE/A1LuM9sqon7Mxnh3m7LVNERF1EUVqjp2En7p0hSwgY1TES6alntghQgFDBXtyRxu5TBxfOx9+VahZb2SoR/ev6DO2pkjbYnRGnxY+BvocNZwlHp8KxdXC4nGoCnThzdWHlMeCejDY0jnkpQGVnVyQ1qGn0g3yL6xkj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707290395; c=relaxed/simple;
	bh=6Oq8+C9EsRx9uFcgJHwCwEghe/ailacRB5UCFid3aL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cju1vQmyeg/PiF6h3AlOwTXhvdB/P+QP3CD39b+R21pwB5HFKccqKjPN38E9KwA/BZGKj6ZiRBKT9QyvEfHDtx7mDWUmgr+z5wzCWbpui7AfNVIltZ3NIqeW//lVRH3zl4Qpoe1rcreXwE8uy4gy9bQSpcmhT9G5JJFyfygZYPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wCSDiE2R; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so307874a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 23:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707290392; x=1707895192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SYbxDYeGniiA6rdtb6/T8QgKPCQ4hLYc/Upt3Qn8Ng=;
        b=wCSDiE2RYACsuHQwRG51MBt2EVQJh/dFDn9KLhVgp024+8AtzHEhQDSA0wjSKmSDc3
         ZnzXn1kXI3uIFa8uiNt6a2OnxBZ3+ZeuaOFHwby1XfkBQWcJy2j7etNrhvi+bfpMNaZm
         o4VraHY3pZhRugPCICK07eB8Ps+YYZKPVTjZxmGBqoLAeF2UIH5ZgKkFpKM3/Ae537KN
         CnSXj3UEJPLTKT6yWLeE9qHtlyj7HGY18pQzh/yymIwWrIcT42mixCcpxeFJJSrlVlQl
         eD5ho3DkcrvOM4ES19C7xTV1TmLxgGaF3dDI05y8DP1XWRX7yZS0JnRk47vcguhaUDaI
         FS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707290392; x=1707895192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SYbxDYeGniiA6rdtb6/T8QgKPCQ4hLYc/Upt3Qn8Ng=;
        b=dMDoR2ManXXJF+gzGOqtstvUAD5cCewBoIFbSzOSHwlm8fxq9RTIoyowxMsxjfNiVV
         WzlIHL/PeoZ8R2LeXxJrk40t9yyMYR5ok97oSQTMrgVmRNr9U+xoOcqVWx3WDo8EQMQT
         6ligin6MRpbfH5EAP7gxHo/GbWEpLVnM4y0hUZE8T7gOQ0D4uruoP3ZchC2JALsAY31s
         TAQkJNBPoTxatY281AdwbM+6K4ZHC6qtRR63mWZVcxYxemMeeEKaVp7qW8vWEh+AQB3j
         T9tUikDXSDT5rJLnrMsgM3CzB+KUeDlMq/y/tgikcFdVclHLLy+VH5cP5IBUXKGya1c7
         B1sQ==
X-Gm-Message-State: AOJu0YyyJGznWEGXrtrcI5yOZkFQUlE1y5NrGpGGuqosFTJCElqCStY1
	NOxhjjGwlNE6n5xFtf0wcMPbTtALsw7IH1/K2pzpThArihs4rv298wRUUQeT7AU=
X-Google-Smtp-Source: AGHT+IGdBxPyBXyrnHPSHM2F9u/oCyDhNJlzKgFj2xDI/+5OYO2QdgsC1LNX75LwkVn1O3UVPPnVZA==
X-Received: by 2002:a05:6402:1a44:b0:560:9906:9f31 with SMTP id bf4-20020a0564021a4400b0056099069f31mr3161100edb.27.1707290391944;
        Tue, 06 Feb 2024 23:19:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/zdcZSDg4pLH1Rt+RivOPBAEybdDR4XOBF+p0P2MTVI+ITlPExLJz6aP2vR4wY4bD0Kr+LBEn+X5BkmRuCuTKzXHWhd941xh3jYX+JLHAmV90kAmRWUNMWj7iAsSe3JC1WYIqzyWYWKQrXTB9jvgYxIqDpdZZ5qy2GY7FGWOmzZbxXa+X1C2vPCdty640ZQP9B5GftyhfDvl0ro9jYeX42sxJzEacqqg92RmcQr9cXMsmvmALrDL9j5jA74sKkW+MF+y8Qq3lkNA2Gj7ddYm7QHlyjW0K0K78DB0qzPcRH9M5TXELrwvgmM42/kjlCJARJnvdlTeqzwKZt9AaGZmUGeLZ/FGYZIFegYpoam2Y4PjsNOfFR+pwxKTtLGwpyji8GUUKrL4=
Received: from linaro.org ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id f1-20020aa7d841000000b00560cd4f3098sm360696eds.95.2024.02.06.23.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 23:19:51 -0800 (PST)
Date: Wed, 7 Feb 2024 09:19:50 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
Message-ID: <ZcMvFtAwQQjAZhk6@linaro.org>
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>

On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
> On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > Some newer SPMI controllers support multiple bus masters.
> > Such a master can control multiple slave devices. The generic
> > framework needs to be able to pass on the master id to the
> > controller-specific driver. So do that. The framework will
> > check if the devicetree child nodes are actually bus masters
> > and will register the devices for each master. The legacy
> > approach will still be supported for backwards compatibility.
> 
> Please remind me, are those two actual bus musters driving a single
> bus in parallel or two SPMI buses being handled by a single device? In
> the latter case this implementation is incorrect. There should be
> multiple spmi_controller instances, one for each bus. Allocate them in
> a loop and set ctrl->dev.of_node after allocating.

It's two SPMI buses (two sets of wires) handled by the same controller,
HW-wise.

If we register two spmi controllers with the kernel framework, it will
be HW inaccurate, because there is just one controller which has
multiple masters.

I'm not saying it might not work. But, to me, it looks more like a hack.

Basically, we would be mapping HW bus masters to kernel controllers.

> 
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/spmi/spmi-mtk-pmif.c |  6 ++--
> >  drivers/spmi/spmi-pmic-arb.c | 10 +++---
> >  drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
> >  include/linux/spmi.h         | 10 +++---
> >  4 files changed, 67 insertions(+), 35 deletions(-)
> 
> -- 
> With best wishes
> Dmitry

