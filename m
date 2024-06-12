Return-Path: <linux-arm-msm+bounces-22512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C178905B86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 20:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F137D1F24A73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4530F47A6C;
	Wed, 12 Jun 2024 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nK5UDmox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F9952F64
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 18:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718218311; cv=none; b=aIcjbry8YPVGR+hUm4JiLkCalnI0La5pcoo1/RpYYttn5/7tBKWk3PqUhDRypit0UT1EA0AZs75b3/kRttDLUi7x9fi0DhqtvG6wU6YJ3VvgHrKHYeRZn6tcSqNYy0xeaxd03Yvol6KaMUGNgBKFTNTCuzQjzveR1mlakb6hWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718218311; c=relaxed/simple;
	bh=U5QI5NzQdtq/i7YaiyZgQTvbEfv9KV/0x5LyAbdfU3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0NWRM1DkJVShZcWnVEYSSP/WlBrAyscQjRtrtkwuHpedLqe4f8cdHsF3hzLHN9eB99tGtnIXBjOohl8q8uxwYEGuU9hoG8Ozgy/E1Mm+dPxUCoijhJa3myjult2iAtsKnvtHu1ngk8TaDIXSgWO/RqvEWSF7Z65QTjQ0oZYw6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nK5UDmox; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52962423ed8so263263e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 11:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718218307; x=1718823107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFYPQEigFT5TfOCN8eDaCIrl7HC+yeqeYN0ZmGZ+Sr8=;
        b=nK5UDmoxgplZ0H9eUTpjOQAf5J6X/e2iZT5Lzfwih6CD7r90lFoUTaicRS+5K+VfSl
         RSdRV6tOsiUydzwJ11+bW0YV8Ef+e4SFBue71RWdWiq+cz/JdHyQuN/TJa6PE2owIk3m
         KDksWWkpRLbNbZxWT8iqF+dt8Wcu6luHP2Vt/6gEwmvwNzdUONeL9w+/N3cHvtMJaLTk
         HAq7pRwaVu+acKN6DG/MDu4bKWSWXsegnMmna3xyL2WaLDHaULeXRCoPpNUbXxFyfLgh
         dRQca+5k3pJ9lkReyR7q7NRz3Da7ecRMcjeeLLYQwZsGU7qd4mo1tb04pCsjCp4/S+2q
         QrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718218307; x=1718823107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFYPQEigFT5TfOCN8eDaCIrl7HC+yeqeYN0ZmGZ+Sr8=;
        b=BVtrdGc+l1FRsrBTZXNdb73lswgCU+KCkg1+aTWL9/aipQONby3C0SZzrWGqAA0DUk
         fgSsVZBLT+zv4K+FKtRUa8h8vkKAe7feKDaDFd3eo3GB2azzLoKMzMRcH8GM7Ftul/u3
         L+WoUnoGi0rfbvVt7h7qWreOziBcnrcIwnghaRwJ4AhLXA8Gg1EYWzzj2ev5OLjVsvuv
         J3Ej1FuZjae+uscNYEJV9kLh9/NmgO893R7SWn7AUdYn37SgLj5rzMzMUPaPswYDK9mc
         UJ9vba5NKstEH0lCOlA0dtxHCPXpqAjJ05ZHNyoLmJGfVFjRDrM3q1IpKEi33AM12ooh
         F+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVyQheHmegMdDaX/HlUPvaIR0mTOG4fIZfMS2lEE+qH6l7P4ZM+MwvfFzuxa2PjTl3qyp0ImD49CEwpcE5eNDQPpW7NWpg9dBcq+E7Vg==
X-Gm-Message-State: AOJu0YyYnaRzwAKjPCGuqft9nd/R5h6Kdq41FPuzJzzbvDYkXI7Ydb6G
	gWHP/WJXp7U/vRdQMliPGA2hwYz0oVpJUStvZZcnmAvPOjMYud2ahVcoqjjQ0D4=
X-Google-Smtp-Source: AGHT+IHjX90AGX8knBQHaw6dOK8zsSJKlpbuIZ1J3ZLU/93MWJ/OAchtptQelggFqTZRz8uB2Ye9ZQ==
X-Received: by 2002:ac2:4850:0:b0:52c:8023:aa9 with SMTP id 2adb3069b0e04-52c9a3dfb4emr1809326e87.36.1718218306834;
        Wed, 12 Jun 2024 11:51:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c9d2f57a0sm327045e87.284.2024.06.12.11.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 11:51:46 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:51:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_rmccann@quicinc.com, 
	konrad.dybcio@linaro.org, neil.armstrong@linaro.org, jonathan@marek.ca, 
	swboyd@chromium.org, quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm: mdss: Add SM7150 support
Message-ID: <grpc4inh7d2wpwrkvssehapa7z7mw4loecjt3p4qcjjefobvco@6g5sll2bkcbv>
References: <20240612184336.11794-1-danila@jiaxyga.com>
 <20240612184336.11794-3-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612184336.11794-3-danila@jiaxyga.com>

On Wed, Jun 12, 2024 at 09:43:34PM +0300, Danila Tikhonov wrote:
> Add support for MDSS on SM7150.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

