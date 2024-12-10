Return-Path: <linux-arm-msm+bounces-41260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 483A59EAEE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 11:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D875A1608B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E432080C3;
	Tue, 10 Dec 2024 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RlSpZiIm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C5F2153D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828292; cv=none; b=ftvZ+hOLGeueld5XdTXG8Bwv61+OjUkAy2jdRC8ES4fcMQvJUTk23yDCRBP0/lCpYGaq4q2fIlKfSNUKB4gp4o+O2E4UwYcF9uRlptBjU1G+151Qdg4kQKVOswCZ4iiLmuCtlrAy3gb8V7d/PMGctiZ4kNeS/n/TbK+Fz2SEks0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828292; c=relaxed/simple;
	bh=fIg3YEalL2M2g2gfhkuZNb95cmhl/Se4u4uhkVU9dPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxx5t6yNHZN8ym0TSBns+31NJ0fcGbHOM8cNonOe80wXvlRjdKGVxZOr47Dk+vCozpg2f6VvMIXsehXADv79AapUyWbXZFDlXxhz4+mocJYUWFgC/uG8HQrRLUiEWoWF+6NZM/7bh38KigczFw6DnXycJUVBTi6nfnLCip1IUZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RlSpZiIm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so2210548e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 02:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733828288; x=1734433088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5ZSfy2xDxDQ8s69afPzdWrhJXHaV4xhzcq4XiywxXg=;
        b=RlSpZiImkI7a1VsougUJ3dWooDzkka8kwhEl6RylBw0/GNV5hug03My0P0m1zRPIig
         KDeOExvNa5nwu09WW+SUqzxkDKD1a0qOnFamr5eKmYir5nHaYHxT/FXMMtX1E1jjzpae
         wb0rRDCg8PaWKvc+uD0MgfIAMR8YZr1VbHBotIr6hUF6+pXSOx51BQPrU8udSMtdY5mi
         iY9WFImtzNKOzhgAP2EzUBBKP9wP1SHn3Iph9674jf25WmqovFBi1qA8+sxIG5OdyZhJ
         vq+Z7UljA4nqUZA7Kseq8pacP+jdyovR2oNJvKd5cQCAgYhp/VZKTl9eWsCdjGukoj6j
         31sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828288; x=1734433088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5ZSfy2xDxDQ8s69afPzdWrhJXHaV4xhzcq4XiywxXg=;
        b=NRLReMIPo4zv0zYAVGPbztn9EsJk/NRxoBr4plYntMnPq2NMmvXPpjPfJ1qtMJ46ev
         plfcame1YD5zo0NNkCWaPjIOv5oYRXwi9+9y/0ocqrLLnCfst4n59f1aOep1eabI6wSN
         MX8a52HHHg5sayA+OH1xxGNYQ9in6k/+yaWT8rVDqIHaKV4BiVt45K3lkEBPXV/qakNb
         TD5BP+to8nLW9E053yAz9h0WRC+wjHZEdzCU+0RhwqBzTgOn01hRyW5VZbqEXHZvJ2ch
         +TZEXm0Qw65ie+RkAD25aEvGWPfHRMPIoOTbw1LrubE/xdRE9cHvJCSz7Z+e3KPplX2W
         /5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWWVE14393x8w+ngx4lmt3PR8uUSPhjfruaFu5D2VfkkiQ5ZGNjgjSjD/bqdVK0lyh+hCESs1+nXMbEkP3E@vger.kernel.org
X-Gm-Message-State: AOJu0YzPiC2IJH//LMEfaNQRYkf27BYSsgZ1EIEDgXY0L9QQIXblyd5z
	DzLc6B06Wl5l2yEZfm0DsWJJoaKdub0lrxrFI62+Jk2N5sB1sJCBt8mCgrhpO10=
X-Gm-Gg: ASbGncsWsWo4uDl1arZmTWIP++VcXRTVeAXkjO2cLpHcwr4PFUThTZ2QRluHkicUbZn
	hPSDfGnc5OJZL8w6gFi/XgU1u35QAR2Ek2tldJerfhBmXeD3PX4JXVFR5YUGO7KOOWvQ/gzeZqe
	KihjhTV91LMExTHQd7eAgpjIsO5Z9zSLQIid78kIiRBJcVjytznKOqeG4NcQyL8SLysWC0kwHFH
	Qev8ueSdP6vb7m6JtmsH59l+LPhrOBTkLSR0QVGL29TS/EMTSVREm9LDDqkS1DuTdySD6punG7Y
	EvIuG287freXP6Wv8c0wi5PNsO90XwSFnA==
X-Google-Smtp-Source: AGHT+IE7+ryAMqJtCxAuJvc/qOGq5Ck0ZMSjTv00rqBtwofn1LyRnlQNhWyrc/EQiBZpPjSjCdJE+Q==
X-Received: by 2002:a05:6512:238f:b0:540:21d6:d681 with SMTP id 2adb3069b0e04-540240c0f47mr1559055e87.19.1733828287631;
        Tue, 10 Dec 2024 02:58:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3855a6b8sm1232351e87.69.2024.12.10.02.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:58:06 -0800 (PST)
Date: Tue, 10 Dec 2024 12:58:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/9] drm/msm/dsi: Add support for SM6150
Message-ID: <3cr32yulhhnruhi5cf4agxxottt4ofnwbnwjqv6ib36ebipswd@qhbuhoejhjld>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-7-2d875a67602d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-7-2d875a67602d@quicinc.com>

On Tue, Dec 10, 2024 at 02:53:58PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for DSI 2.3.1 (block used on SM6150).
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
>  2 files changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

