Return-Path: <linux-arm-msm+bounces-5973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4D381E505
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 06:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AA0C1C21C39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 05:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7D74B13C;
	Tue, 26 Dec 2023 05:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hOaTTgEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF534B12B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Dec 2023 05:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2046b2cd2d3so1763741fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 21:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703568756; x=1704173556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/yCtDNlZbkApsOPbotq0miDNKgFHHdTcJH5FR2SEXc=;
        b=hOaTTgEYTZFUhkKPe/tTr0A+O6ry+8aqpDGvL/7WcXFQ7tS3Ab0jCSQCYdb6eRKrK/
         4iRonRTjOkLVIo4YpNwMgoZudk/eFIjWkTR60TuExCXEML8k2skp5hbuvvdEm/qIhoI7
         p4GniBdX+jC/4rK1BpShCgq8CqrU9tXrI1isW+Zq0wht+vRb4EifiSzDg1ZB6hfuy1Fg
         ve7tA+DwFpYmUFkPXkEU/EJkxH0MSIMrK1Xvaxr1OkNOkL8QeZde4fglr0g7+o0MCjhv
         GxniQzdRK/cxrWKqbfZp12yMNrJh9iX8I0sfkOxF8RiQ9gBMtMOktU5pyOptq1NB14Mz
         Fi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703568756; x=1704173556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/yCtDNlZbkApsOPbotq0miDNKgFHHdTcJH5FR2SEXc=;
        b=tWoVn4asZPWFHjcBXvF/UbwrbrbF4aozOfJJgHuBLzVz0Y1uhqBY1I/OpvO/GKB+yl
         agm6WlYAcPI9HQZQuj190vjnnsZTuetAWYnHoYJqLcpvL/xu9uCSEEstFt5glKgRAd9S
         Qu41sH+ecOeyIPV2VjXFht3GHcyiFCpNq5WJ30fdJGo7P/nYF3Tl71HU/YnGxM7aSPz6
         vkjiQu8HiejlCwPHHjTlr0kC7App+6vEwuz8x66nYkIlmiYf4g3YuYXcCXVXMQJfssHm
         b5K7H8Zz+XBSZfJZ5Vc8cpDFhS7YSIIiBMP/tGeU2vaceBFThZEMbC2wLZ1ydG0tPczw
         SwJA==
X-Gm-Message-State: AOJu0YwWU63rExSoo9XfGtvCmAqtqyr87eDx1CZbMZktZ8d9FrO7yuYM
	PZnO7s9PmQLDaDWT0PdM3DiTLTNknAEJcQ==
X-Google-Smtp-Source: AGHT+IHsV2cCLwDgQ+aRxdEBipW52bolZPopgXkwJdwS+zecDa1ZDPFsMRrh5GOgq3Hk9laWbArYnw==
X-Received: by 2002:a05:6870:858a:b0:1fb:31a0:619c with SMTP id f10-20020a056870858a00b001fb31a0619cmr8333158oal.47.1703568755795;
        Mon, 25 Dec 2023 21:32:35 -0800 (PST)
Received: from localhost ([122.172.86.168])
        by smtp.gmail.com with ESMTPSA id u18-20020a63f652000000b005cd821a01d4sm8703700pgj.28.2023.12.25.21.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 21:32:35 -0800 (PST)
Date: Tue, 26 Dec 2023 11:02:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com,
	rafael@kernel.org, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, lukasz.luba@arm.com,
	rui.zhang@intel.com, mhiramat@kernel.org, daniel.lezcano@linaro.org,
	amit.kachhap@gmail.com, linux@armlinux.org.uk, corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] thermal/cpufreq: Remove
 arch_update_thermal_pressure()
Message-ID: <20231226053233.gtvuflyonkcifa4x@vireshk-i7>
References: <20231221152407.436177-1-vincent.guittot@linaro.org>
 <20231221152407.436177-4-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221152407.436177-4-vincent.guittot@linaro.org>

On 21-12-23, 16:24, Vincent Guittot wrote:
> arch_update_thermal_pressure() aims to update fast changing signal which
> should be averaged using PELT filtering before being provided to the
> scheduler which can't make smart use of fast changing signal.
> cpufreq now provides the maximum freq_qos pressure on the capacity to the
> scheduler, which includes cpufreq cooling device. Remove the call to
> arch_update_thermal_pressure() in cpufreq cooling device as this is
> handled by cpufreq_get_pressure().
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

