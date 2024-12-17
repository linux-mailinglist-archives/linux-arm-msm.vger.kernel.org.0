Return-Path: <linux-arm-msm+bounces-42514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 671BF9F4908
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27691188056F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 10:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A956A1E260D;
	Tue, 17 Dec 2024 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LyVA3tqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29DD1DDC3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734431904; cv=none; b=e9Xm5DQcBMVNd5cudEaOl9j7hFTLG/hJrYFsTSUBFXlUeorqKk+h4FCBOhZoXM+x1USKF1fTj01dU+1Q52nLyOVyZeZOVAkAaf+MbF3UMrwN0/ih8wnCAlPQG71TXGTrX9VwPD0oKhnVp/8mqS+EXBdmbalfoEuAJjVVV/bUI84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734431904; c=relaxed/simple;
	bh=iR412D1yKI2zj8kk3XEuAYdttGovDO2mFnGi0WkwxxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfekrtIaErj/d2IOko1ycweqr6QnNNecFogXAtT2mfpx38ltkkNiBO9AY470DRFBiOE2rWQHQCI35A2fsHV/dT9HscsA4pmzew9I1qAVB2HQW8OssYi8m3C5l5Ldpdz8E2BYFNDeYA0ZNkJcRNDsS3Vaj891j5ofGMDNqqDlar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LyVA3tqA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e3a90336eso729019e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 02:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734431901; x=1735036701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O2WYb32ky6fmIX8AC+7yLOBouXJ1HTE92cVXzHw7p0Q=;
        b=LyVA3tqAN70YxeJAuHjqkk4/ZukG97llb/zjBth2Z7rA2w4iVAQ5ZnonkI+vRj91zu
         rZxVYHVXT/tPQDE5B29VON7azjRrx+/OonL4OVbWna2hLO2NW7LQl9T6yiY8ZRmwirkP
         bAqYHWavlrvZD5UXfrIPC/IH6qLA8V/UlVDGXCzxjqxWESkOmUMcLlZXT9IH7/9HKXuL
         2MMnNUHtgEY1F4WtY55j74UtiTa9c+RNIAk4iJvGK/VHUaGNo2G7zdJtsQkHYEAmjKs4
         fkI6fSssdcXcKbk+hJPG5bsoPzpCBSvtKDilWvoErZNSawiIoeeWZnBBP6LRIeSF0n98
         Z5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734431901; x=1735036701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2WYb32ky6fmIX8AC+7yLOBouXJ1HTE92cVXzHw7p0Q=;
        b=Rg1Our6fm6GIPMSg/PiAW6JYsDUafb9M7UaaofKezGSSFUl9si8CHY366xZUuOPF+8
         N2flNmXblZobu8TzCdWFIP5tXifMonZBtuWU97ZrFlOeOsYVANmXmi6J2Oxv7w4S+Y3U
         a5I7jFUe1k/dbD/Ap/Ug1NxUfa6cuVXz2yAg3twXCCDgqEEdiAw4vSv3jRid6qk2FeSY
         XXnqbKvvu54v2BaDnqdpA/jOwtnMaCtwkpLcxX5zAF430oHtY/DdTx4+TCjoHb45EBQO
         /+2dkJRS+noN3ruXOdNAjY38XKQva8ipbfMXsORlIk0+JmpDDpcBB+MYiv0TBpCZeVCZ
         swCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDhpte73aVZ9xzLmsnq83zjN0uEBNwVbX/2dce3rvxh22dvUHU5xVFQPjwStPPm7Dk9cbu3T53w+I10G1z@vger.kernel.org
X-Gm-Message-State: AOJu0YxoEsYfSo94nfsTEVFuQ1jxhl5/hfuzfUayHw6/ZQwaH2aIQ947
	eggM3Wg3X3yl336WhqslHdwEBURGMa/cbVemrQV6CvHKZChvZard/MQAR69BiDQ=
X-Gm-Gg: ASbGnctfFiOO92OgpFUjwnh2yuoxJa2ov4QqbSPA0QWJmZXsNFU6MQtHrWMSrJNPK4k
	OxZW+Vy1rQnmsk1grwzwDTLoocX1eqDvTKh6srmSerG+QYKEhSWnQZZ1PCBZIK1kXAzDNytZwF6
	48XQxFxLM62RtW5ZEBcw/Kl5hvTiYloOBPuLW0zj9RsrOjn4JJzV7xKyABXLGkcsrub1SEdSbYc
	i8LTCTY1atCOUE2tmMvEAPb1FJsMr59YRdeUCAgo0giRRTD1Om7TsWj+m9B/Z6Gj8vWNvVuagPY
	+Rh7weWVYzGBmrmOCc4AMbTnlw9JtnzWZeBr
X-Google-Smtp-Source: AGHT+IEIrR2bMxG3Grf1QUMhkQELSDXhmLc/tmsZ1cto3QX1pRwRlgidZ0/hzrqApkhKtNgij3EB+g==
X-Received: by 2002:a05:6512:3b9d:b0:540:1dac:c042 with SMTP id 2adb3069b0e04-5408ad82317mr5526367e87.8.1734431900751;
        Tue, 17 Dec 2024 02:38:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c1fc1csm1114367e87.240.2024.12.17.02.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:38:20 -0800 (PST)
Date: Tue, 17 Dec 2024 12:38:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Richard Acayan <mailingradian@gmail.com>, Rob Clark <robdclark@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
Message-ID: <2e7ijil4v3wxzi7y2gsbyhh4o3vrhcbydcpzfcniij6cack3yf@wb2s2m7xet6a>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
 <Z2E5SGIfAaKugNTP@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2E5SGIfAaKugNTP@hovoldconsulting.com>

On Tue, Dec 17, 2024 at 09:41:44AM +0100, Johan Hovold wrote:
> On Mon, Dec 16, 2024 at 10:27:28AM +0200, Dmitry Baryshkov wrote:
> > Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> 
> Please say something about why you're doing this and what the expected
> outcome of doing so is.
> 
> There is currently no way for a third party (e.g. stable or distro
> maintainer) to determine what this patch does, if it needs to be
> backported or if it's essentially just a clean up like Abhinav indicated
> in one of his replies.

These patches allow using colour transformation matrix (aka night mode)
with more outputs at the same time. I think at this point only CrOS
compositor actually uses CTM, so these changes do not need to be
backported. However they are not cleanups, it was a feedback for the
SM6150 patch for the reasons expressed in the Abhinav's email.

> 
> > Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Johan

-- 
With best wishes
Dmitry

