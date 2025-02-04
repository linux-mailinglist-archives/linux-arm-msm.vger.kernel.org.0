Return-Path: <linux-arm-msm+bounces-46834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF243A2691C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 01:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7868A188488C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 00:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063063D984;
	Tue,  4 Feb 2025 00:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="orOXQtII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F9870813
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 00:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738630463; cv=none; b=oWff9vDsUy3mQ3OzZT9wmrYUHBT0hGs6fyz5fSuFpsH5lApf9/eXviZtIYGp6QR8McQ+saWAzDrWrYXk4ExcYD/15VjJLoNhroAYxLLMHdhdtLYvVoTKNDpan7nUaiQgolS0Xa4QS5hTTuSqIj0SKNe8et+PQAb4nn3cDCHSBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738630463; c=relaxed/simple;
	bh=nPbR6iXugTkhP3muYc+3Ub+Xk0LkHCzD/XNpZsn6oT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9pkZ5KUAJa+yZD17/uQGJ4hi6wkGhP1XkIN6QPfWJzuceOdSavwvcNJrcZOlZishV+vD8LtOcjU+RUFoct3zRKucJcLQQMilIPLG3J9MFRIyxpO7JC0u432/IHjL/w/rcc7hSmMVAT9l6qKzmerSmjuoEPlBGCawLgNFreKjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=orOXQtII; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54298ec925bso5788663e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 16:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738630460; x=1739235260; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R6ZjpLJztPd/z6CugDEiLqKFmhAhr9ILcbNmlBzFygY=;
        b=orOXQtIIUlAaQ/nrdmSATf5ThuBMNmH4YAd/5cGR/gjHjCaodX9velYohGtHMz98YC
         rGVGN8jjzP2ZfEOXgkXPflSc3cetGmzCLkZPlSB6AZKw+ab3K7GjzfsIF6Y7R2IQEILH
         pj6e5A8YLgLtcEvxjjjR89N6UNLc46Kn+vWk8ssIz0s94sNw3/AXyvrnNtEtEYht/S/i
         1wLgd9ZrNNBnm/RRF3UPFUwug2teaGpSvzt6fuIzWdtwLS19Kpf6+JEVakHUU49r6RnK
         FJtBjn5PWFohto5oGyPBvd3/dPX+ySijX/cGHMn8YmiZQFRPOo8r8UdXtf95RySQupQv
         necA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738630460; x=1739235260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6ZjpLJztPd/z6CugDEiLqKFmhAhr9ILcbNmlBzFygY=;
        b=jpgxegN49aiiT5waIqRpNhUD2DflQIZuekbE8W81t6CtYfkz5yw+ASxUTmMQTWwkwW
         lBd8+zYX0+YqvjhwT+FT8b8mhnxDwj5hBPqBujtTRr0THhfN/x5VxG1xvD2tdoW0ip2X
         ZF8fG597h5biRdjCyV6+ihmpufCydXt/wvy+vZHzePf1ETYsKk95ix0LkJQwLFCIUMdd
         dk+ertkACPET2sAS4l4jE2+fc3l8fhqpjnqfXMsUmtvvpBk62JVkMgLSVUsV0nox/9w7
         mQldktGUwqYGEKll4eo8qybjDfIVk6T6RBXXz8v3Cw2tCJjoYUJiGOaIQ140Q+d7Ks+u
         vFhg==
X-Forwarded-Encrypted: i=1; AJvYcCUPa5EO1A2B27eGJ4otwnOB7jqwdqFIWT/0Ph8OzQY7YtD1D/TOougSsQ3YAlba6bCQGuJ4aRPTIQ3fSD1v@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd+EHOFu6IL1mRVdQophIu+g0pEG+/g+JWnieqxYuRwHv8wUte
	kHNP5T7BCybx6VTBGC0fHLsz+mqNk+zxW4EzQXwYIPvMMZcKI56JEPHbxCrNA38=
X-Gm-Gg: ASbGncual05aQhjwW/iwivXB0ZV/0Fe2Wd0B/MbotKtNrO4IL6sSRcvnidlBQut6eOw
	s9Uh+1rbSubqE8SrSVl9stkSKzXxoX5r0gx7ZI6DlcGLebBAs6hNwjh8s+KMaAvU/Tf9f59hFjg
	torU37Rs1KiOQ++w93VyQZF739sIGah4K4GxwweA3z3ZhmR5yxjYTC5E8MlKW6xMrnbVh5UDMrD
	hlis/YWDhvYuTKvB/yxqOxvIacv2zkewWi4LvKdl7cSaMOeT/3M/7pkCvXocCI5fMfklqwtN5dE
	ynfas7mwzaYFTdLSZROsklL6vaEH7CDiKFR/c4zGnPZcXU6kOSvyWoATrOzolh1c/ovI+sU=
X-Google-Smtp-Source: AGHT+IEpldiWweSia7SrDMC4AL51hi5zwa3/J31Z8ScFto8ds9fwqjC4+DaQa3FfHKj/Zkntym0SuA==
X-Received: by 2002:a05:6512:3e0e:b0:542:1137:611a with SMTP id 2adb3069b0e04-543e4beab45mr7511819e87.17.1738630459976;
        Mon, 03 Feb 2025 16:54:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf0ff7sm1435755e87.8.2025.02.03.16.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 16:54:18 -0800 (PST)
Date: Tue, 4 Feb 2025 02:54:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
	jonathan@marek.ca, jun.nie@linaro.org, fekz115@gmail.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux@mainlining.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <adm72vocbbl5n75eaf7kjosv37xxv42esnosnhshabznmqnsz7@mumtmgopeoxk>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203181436.87785-4-danila@jiaxyga.com>

On Mon, Feb 03, 2025 at 09:14:26PM +0300, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 
> DRM DSC helper has parameters for various bpc values ​​other than 8:
> (8/10/12/14/16).
> 
> Remove this guard.
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

