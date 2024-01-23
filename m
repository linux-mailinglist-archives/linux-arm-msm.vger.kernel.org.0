Return-Path: <linux-arm-msm+bounces-7883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA783871D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 07:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B41DC28361D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 06:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174604EB46;
	Tue, 23 Jan 2024 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCmW+xS8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B74EB34
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 06:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705990112; cv=none; b=Fm++tvS89BdNtib4QinPudiWm4zU0eBf+6m/PmV/raVKb3DYLqI/qe8lzjolupwlG2hmlRqiz4IIWp2cEMXbB9UzCFNjRjtY++Xs7WGC4R3Twf9CmQ4Hs8cLVJQisC7DZTmLRkqL9X0/XW1gIuoJ3mYTAS65GB/1XK9atRYGmwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705990112; c=relaxed/simple;
	bh=GUVsGZBjrAhZKwiHlLce8FOhfmc02VxxhC42+/QGmU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMvwtBJB4qT3jYkj4n2IJKeqEE+x1j9K6Oiq+YstjNmeQa/BFQBeLIesIlhiIBLHf0vFL7eoKa2b/jegG0nxPDZ/UX94dArhg1JYuWLcMX2Gn8El8GGUDcIVS97nxLWVo5Rg9L+Ms8g8DcNq30MlXtS5BOGOFv5FZppteA9PnBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCmW+xS8; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6dac225bf42so2092316b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 22:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705990110; x=1706594910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PjCYKivQOpppRY3k2NnoMHNr/HHiX+mZSow7Cat6y2Y=;
        b=VCmW+xS8zVWkD2/thgJUh6pHzBvF+mv0FMYR0Iiw+rWWe0CoP662UqebHp8Bxm+1SX
         xD7jD12qYDjJMKqAeRLGR8OCq3HY0Dm8gwcHOZYeNKqSEbkg8yGIxbOyPCOqF0zloZDy
         3AB+gT9lqJ87szhLKPUWgBvHcTZGAwbsushkkdcJvz6LDel6u744R2p3nIjBnWEe1dUL
         fZhVihD13DhHmKPra+4mUSJ8jAtZMp1TvOI+krTlJyBbcUnLNvtumc0psta8XRIXvxnb
         kxc+EawWdiFcugLoyiusPVz28yZ+rHPbYlwYiq3HEIWgGvJhpJNi9N95pTh25i/pjI6N
         jOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705990110; x=1706594910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjCYKivQOpppRY3k2NnoMHNr/HHiX+mZSow7Cat6y2Y=;
        b=ZOU/zVlBsuQDMm5t+kRyZ3ysAnLg82IJX247ScrA31/dprrIIB7tVFMolXJLqT9UNV
         dxC4uMdczH3xdoHJ0EoTXn3YEscB7sDqq+p1mmfY9DYKtaiapTCZv8ZjDzpeF3tphapE
         VeukhLly4eF3ddQCO/2wgL0h2hLGtcWvBJj+som6tQMKkxV/wNunuStEPJ8QVcklL2ss
         CFxLieajai6l7BmZYVB4AseF5Vo4Q4sGLNCQ5AlSx7xOS2ctlHwZ0Ookm9oLAp+VzyYl
         Wtj8Osz4uj3fBM138ujruXGMmMnELtkwrllSwHebYLMqEIKLtBPwWLMWVgNyWj5AHCCx
         XmTg==
X-Gm-Message-State: AOJu0YxS4KdhLIZHFaGPi8kt3Za6OMYu6k2larKf5HdQlBvu1uItnMxg
	9+ywfSI7x5dmKj0fZhEUf2rsBvi94wYWCu0gbZ5uITT4v8/DKQlAAgkCPGSuUDI=
X-Google-Smtp-Source: AGHT+IEVo+v4xwoQJxR11YbNdoxhbM07qMqKJcJcblpXRA+N7B5HyOF3Bstk+bC8IGfKD3nylQrRwg==
X-Received: by 2002:a05:6a20:12d5:b0:19a:7e25:d7d3 with SMTP id v21-20020a056a2012d500b0019a7e25d7d3mr3294088pzg.18.1705990110050;
        Mon, 22 Jan 2024 22:08:30 -0800 (PST)
Received: from localhost ([122.172.81.83])
        by smtp.gmail.com with ESMTPSA id jc15-20020a17090325cf00b001d70e875533sm7551881plb.160.2024.01.22.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 22:08:29 -0800 (PST)
Date: Tue, 23 Jan 2024 11:38:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	morten.rasmussen@arm.com, dietmar.eggemann@arm.com,
	lukasz.luba@arm.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	linux-arm-msm@vger.kernel.org, nm@ti.com
Subject: Re: [PATCH 0/3] cpufreq: scmi: Add boost frequency support
Message-ID: <20240123060827.a3vszziftj6pszt3@vireshk-i7>
References: <20240117110443.2060704-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117110443.2060704-1-quic_sibis@quicinc.com>

On 17-01-24, 16:34, Sibi Sankar wrote:
> This series adds provision to mark dynamic opps as boost capable and adds
> boost frequency support to the scmi cpufreq driver.
> 
> Depends on:
> HW pressure v4: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240109164655.626085-1-vincent.guittot@linaro.org/
> scmi notification v2: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240117104116.2055349-1-quic_sibis@quicinc.com/
> 
> Sibi Sankar (3):
>   OPP: Extend dev_pm_opp_data with turbo support
>   firmware: arm_scmi: Add support for marking certain frequencies as
>     boost
>   cpufreq: scmi: Enable boost support

Sudeep, please lemme know if you are okay with the changes. Will apply
them.

-- 
viresh

