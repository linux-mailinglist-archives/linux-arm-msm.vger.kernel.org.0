Return-Path: <linux-arm-msm+bounces-31086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D35EB96F0A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D5571F2265A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 09:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037921C9DE7;
	Fri,  6 Sep 2024 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvh5a1pX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669B1C9DEA
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616625; cv=none; b=mGs8gNJgfGL2Q5HIATI4M+JOwbMn1XS3xJQQRA1YD4lBNn91hApKLzJvvr5Mm+t76Hem9pjOWgM15tg2VkaffrSUq7Hxq9k+dx8HLTZsPxwKQeZVrlzzivTFntMCiFCT9dirK5kTSayqlbk+mMJmTOw49JWCMb43fnUzKsqMnrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616625; c=relaxed/simple;
	bh=xGL9BcAcyOyuyKpXc+gqYMQQ6t4wlZm65AqsKYyQfUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHA8RxDa7imbOrgI5zAlaVxvRMuK8wU3zWXAvZ1ekZgPMS8eGGxpmH+L9J0dh5bRx5NS+FdBF7jMHGfQSIfswep03t8TQMW04/YHi+A77FFdXkbha3fwhvbkbs6BX0Ke4kevYQ89WE9sMYO/lV5ZkBSOXNHrKRKlwQK2liZYJW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvh5a1pX; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so20469821fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 02:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616622; x=1726221422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPwY2WBbxgUH46+rd75ybc3ERwkcJqcYT3nj4Xuky44=;
        b=gvh5a1pXejTHv2ORT1BuWfN560UCGV2Qy19dUoVnu8qY0Stc3YJNh0jTB8HyjB4oIq
         y/zb7bqZOQgaPaDBqKeWyAxWaPm5KNd1t4X1vdcOxmo6eRV2XChOPZKQKLYb9p4W0egX
         gujzZUjfRiQrk32/AB1AVBDkMiywMY2f2cwt720a2UOdpNX8mRBViD6R81/jYaFZrh7q
         M65+WuAs4OACd7xN+eftowdjPeXUZijrXKISLnPmNGzaqOvRLSwpTxXq8zhYzWgwfJRx
         SpZqLJHo/RdlW1PVVS7nulwNifHpXX0qhcWBZWsM96DXC0Am/kdkCGzwlh9QrQpzpvqC
         fwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616622; x=1726221422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPwY2WBbxgUH46+rd75ybc3ERwkcJqcYT3nj4Xuky44=;
        b=qWy+1+QKM43iGQq9ETnfSJK25taMo81ezun9ldC8wEOAtMvOh6Xbb78F0ZqpwReuQQ
         6IvvMTJOUlhOrU++Qw4ZIO3HnSPeS8t28qODK5AZBalsmrTDSxJsWWhR9y7rCpKnBbiI
         ZrBpivh8juYNKKF2sN6iNwDqxmdox1oHDj33RivtUA6d/QTK4564mCA/SdO8Dp3iMRpG
         Kfxcj/6bQHLDdO82E99Ln2gHK9SHTqkUESUlKlNGv4QcKD8aHDl9vXECpBBSOdFtMRKQ
         YpnYrUMTLWlgkqXvpgp5uIUQ8XMmPwikKJy5l+IlzNDwlepjP4R3AKL/tEhYz4SQU5nj
         QdDw==
X-Forwarded-Encrypted: i=1; AJvYcCUrHI2ndkY8z44ISR2ZQjEp4bvbmJpgTuwy5oljrjToXANdDPz2W77lqCojPG5IvKzSmJQ0MkVdLcBjQK0k@vger.kernel.org
X-Gm-Message-State: AOJu0YwO+8YaU4PgJuTl7Y2Lj7xwYjYOqLQjOuikdGiWcQsUT7DOFH2f
	0AbQgTl8TDOcTC/gCR4Bwk+CtHkR80nUahjfBHRB8v2+Gl6ljpQimoUP8Me3f8M=
X-Google-Smtp-Source: AGHT+IEGmDYtTqVwK0km1mxn812DoATvPxABZpDO9jHB/O4WvGUlolGz2aw3FT50+jxS8Yg8MuE9iA==
X-Received: by 2002:a05:6512:220f:b0:52c:daa4:2f5c with SMTP id 2adb3069b0e04-536587fc818mr1075858e87.42.1725616622176;
        Fri, 06 Sep 2024 02:57:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5356988b077sm616302e87.47.2024.09.06.02.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:57:01 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:57:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de, robdclark@gmail.com, 
	sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
	marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com, 
	jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
	jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/atomic: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <mwzh6et6ipet323243mga4ip5eo6jp2bxvtlzjyc2gji5kjqef@57dri4dbwser>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-2-ruanjinjie@huawei.com>

On Fri, Sep 06, 2024 at 04:23:21PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Commit subject is incorrect, otherwise LGTM

-- 
With best wishes
Dmitry

