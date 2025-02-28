Return-Path: <linux-arm-msm+bounces-49813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22383A4913B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 06:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E0AB16FABD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4504C276D08;
	Fri, 28 Feb 2025 05:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ngn2jpDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DD21C3BE3
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740722331; cv=none; b=G1bRbIpDMWAj6D0FXavnrwEBsij4FGPIMpzNuYitwg5X8caYq0d5h1MDpsDt39CVdW7KfoKgW9GAWQySyOJjHSTL1qckazWDmpzig4iPNR5/GZ5y4Ukww0eBLIl/JIWlMxnaLogO/c3IEuy1qDC3s3QMDS8gS0JOvHnIubLGybo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740722331; c=relaxed/simple;
	bh=V8V/ZCN7frvfcECXuXfU8l3W4E8kK7o0sxD/Vdoy7Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHr2wI3fLjE6J6wnKB5tpH/J1yuZYiQ31FrsECGq1GEy2vb+J7HbuCDzd7R4ByQ4KV2n4n0lKaby9UES4wtiZf+CoFl0o+D250sF8dzqkQf82Fm3fUt3bTD/NP8FqeiyhWdOSQvDiZOniaXX0Cf4vydLxvYxpEBfBPMNQ4CsYg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ngn2jpDS; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5485646441cso1772338e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 21:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740722327; x=1741327127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ibJBHy5xFJcYeoiCP5vmhHIfF4PoPWSUEyYMwmPo78=;
        b=Ngn2jpDSKjUpoG/a+Y4YuxwKHMcfhAmUz3gTktc7mAS9Jql1RSHSEZZRvFjiuKxZ59
         iRLiWytn6fAjXONpK1ITsuJgrTq+w7VPz/XFTmCBQVmmfSfAVFELQ6OsQ0pmE5S7n64O
         o0EtuMw+2hnh5moUq31dkGy89dRzPEClK9vPQpVGB/bdHCNHtSGWwdUWYD7HBmGKEXVU
         +zHYif8AcKSnv/deTbmVtVZF7TX0jwUxnjG7KlNEj/W38koXE+n5hBywjViXhFaqeZYQ
         /uwK6ME4OXGn43QsSt1EFne3RTgr4QvWSLcgBiiqYVcXRLb0MnGaGTSqjKPlFHScy/jr
         xblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740722327; x=1741327127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ibJBHy5xFJcYeoiCP5vmhHIfF4PoPWSUEyYMwmPo78=;
        b=BAwBuYxKfYXyoK0iWy0kQd3uG/KDjHxM8gf6glveMljTSk4f9+aYLm0odCpIlt+nHp
         75PrGv3h2UKladuhkgrebJ54UexFiC3vHxkQJme9iBpqv7G4BXZrc9HKJRtRHS/lVTyA
         dy2cwMi+08ftp+gZLhAfUXb3PxAxG8po/hNKd+Oh1afkJlsWhpJjur5kD5cAc8/tMO5G
         /wX4vNPXpj5fEUYi/ntQ17UKc77LnNnlvkwiCyAmpctODmHFLfdvF1j8g4zI2Ov9I20k
         lbyqaRO0/WddOmfxvAdAIXug379IRf2TJfPn0J6d+LrUQ88SJIuo98qiCDKpu7wcH8uW
         Wdmw==
X-Gm-Message-State: AOJu0YxpzCji3vQ8FTNfuuZvWMxca9X1j51fn3QA2mrmLfR73nGxtC33
	Dh3PmRyDCW6+b3CHr+td2U7dTAbQLjDTemJDBc6EEsX+cTjjrBjuPxLzb13hyzU=
X-Gm-Gg: ASbGncs2JG2IERxD6XwFNuY621O4c+c/OQBP/f01WoItsB0Hw8a87V5UkoVbtvGWhdi
	t60Shb6v2rCc2nijuZuenG+QuqXZqxlmQLvzgAbUwbA4bHAEe1ZBmEsJTCdZCPQq6FgQF+2KYGq
	kHWx7sroGjcS2pssvdmUez7+BBGWYMGNQxgjOHVjVUTobzOWG0CgAcFxPwNrqqIx2Ya6RAB/cIc
	NC9nbn3FBMcr5rCue+xyIc/hlrVKbRt/4hoxyEn1xdTkd/4jI7KYR8VnVUYG1fXxhbsgpJpaATd
	ReXUKw7leczf3FdJrRCuDGt3fLUIPPwm1BJE5fGa4itvfEfqYpz+n7FY24F1PoX1yxvL6JnqXsE
	ZPJJlxQ==
X-Google-Smtp-Source: AGHT+IEXLnFDwZvt1i2DDslT4P9hWVkKd38XTzY/galZKmHrDSqPgz/TCLothdRaE+i9h8hTW2yIaQ==
X-Received: by 2002:a05:6512:3b11:b0:545:2f48:d524 with SMTP id 2adb3069b0e04-5494c320d25mr623886e87.29.1740722327221;
        Thu, 27 Feb 2025 21:58:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494f8ee8dfsm99203e87.222.2025.02.27.21.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 21:58:45 -0800 (PST)
Date: Fri, 28 Feb 2025 07:58:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, robh@kernel.org, krzk+dt@kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v9 3/6] thermal: qcom: tsens: update conditions to
 strictly evaluate for IP v2+
Message-ID: <equtmcryan2zb775ljo2zxro4hotimwoj3nrftmlbe2bhp3azg@cp2jco4xa2jk>
References: <20250228051521.138214-1-george.moussalem@outlook.com>
 <DS7PR19MB8883434CAA053648E22AA8AC9DCC2@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB8883434CAA053648E22AA8AC9DCC2@DS7PR19MB8883.namprd19.prod.outlook.com>

On Fri, Feb 28, 2025 at 09:11:36AM +0400, George Moussalem wrote:
> TSENS v2.0+ leverage features not available to prior versions such as
> updated interrupts init routine, masked interrupts, and watchdog.
> Currently, the checks in place evaluate whether the IP version is greater
> than v1 which invalidates when updates to v1 or v1 minor versions are
> implemented. As such, update the conditional statements to strictly
> evaluate whether the version is greater than or equal to v2 (inclusive).
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/thermal/qcom/tsens.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

