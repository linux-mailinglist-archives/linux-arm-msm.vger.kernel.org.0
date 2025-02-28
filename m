Return-Path: <linux-arm-msm+bounces-49814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E45A4913F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 06:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA2CF7A4D04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC6A1C2304;
	Fri, 28 Feb 2025 05:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bv81uUQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF77E10E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740722364; cv=none; b=uyI8ugdHPC0qNDEiz+xYCn3A8/IdQjT1guD5oB6Qax+JB67Cs2mQCeJ5yFgz+8XjzYbtV0xP9VjSz0LCK3QarVzmIPDZnd9wUTULCIejrRicrqq2AfVOCKgHrkVKsr5WQGvsE6A6UyIe9WKYflR4OJSPUNQj08EVU4+b0thD8lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740722364; c=relaxed/simple;
	bh=btPvsDquHHB+QW57XVbJyyust/qFlxWOqT8A+x/aOCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsoJnKZpHJURrxNetR45QNw9otk3aQ92aeJ+Zbd1mnHWs0531NTIAgQ3rqOtUmboc4SyUBzghNEp26Tu5CHfDH0egDqSxt4sTDWiFmM0lbF8hxSKqiSkkZXq10HnXXiBFV9VaMIMmRbotDXHV0s5+yj3Ni9xoW+kjjxzqTtWDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bv81uUQi; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30762598511so18339021fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 21:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740722361; x=1741327161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PriYakVb+c1J8nOvCrogaGJFCt/pnunKJ29UwQZ0vI4=;
        b=bv81uUQisnQkP4+Lf4pua3ph3YVU8icPsGQlZZsglZ9i03bobJcQ3+NOZmDJDnhLzs
         wTcpL0JCz8c/zfy5Sk6jSFIw86nIeIsKIwprlvOC55KX3ZulhI882LkoypllX4mwGdHy
         LDKrCrp4B77G8ymNrz63/X0ZlM1MaeeYs3eS1XyRhiMQ49W53ImwPbRourySo/S6Sokc
         fC5cBHmCHbR7RDbJ01ngboUSdXhUDTy20K8kojXA812wO3J3haGqZV37Fb6wl80f2Y43
         i+FSkbiE13lCg8CG+q6NISi3luR/gQ5aSGoJDgPuSljC7qkLRpaYkmWFANXiX+DMRRQu
         tn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740722361; x=1741327161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PriYakVb+c1J8nOvCrogaGJFCt/pnunKJ29UwQZ0vI4=;
        b=faOiLxtSoaGr67TjhpsqXpi/Y12i9sYFtDNmUfhpZCV8sRNS+UUVmyZN+dHyAOxmKR
         ZeAaaGhv+p91Wy1hu1C65C45ZjZQPVRHaRGVxZDfOFtooMcySTgX7qMyfsKujqun3AEk
         8CxfvKgQkhNZXVd8oyssl+MNrhOsV5e5imq0Op2DsWix/ghbnTHrMjx/P6t69QRtxf7G
         oh+EsZ6c80fCax3sgi8qW2orPrJ97V7EebS33zsu++cRGYa80AlZI0BCI3IM9ceI77Mk
         F9tLC48ZsyCqIoXVvdB0mQ9xCgL7xcojgdmcpwD5pKnBOBgq5Rhg9uWl9Gs+rYva6CYb
         2ffQ==
X-Gm-Message-State: AOJu0YxVAj1m+XUxVJMdIg1yQkrzY9EzbMt/lbJfYNq6qtdRhc9+LSDH
	P9qRz3CEFNqikqbWtodZr3qmd/v8FxJJ2xWzOjyUjadc+VAVwc1jWvcBnvGhc+w=
X-Gm-Gg: ASbGncusnaEG4a0q1hKnmP+WFYwO4YpKTMOFwnDPRdmHND6uAtwb25dTk3/DYjJeBQC
	TVNaGRh4VPwQ4sSKOYitGL0ztSOoL+dUaKFloG6lkZK+VCmCePlHfEcx6UUeMRRoIuTOYEu0Pyu
	Dj5ySpuV7QfOh8ejG7XaLihEeKjNgHXXrMP+qGvcAJzZ1f38l4COKxoHcA7WDPhNiMdQ0YjTJI3
	MJDTh3y4F7QaFwaeBGXxCaTUsOq5ZowBvCbLj2LExUHcX+L0K/aFZAsXUETOS6hBQyFHhZsM1yW
	hemZD5L785gQuGKXSqC/cmhruyGEaOtN8vgtrzrO1uyHu7PTASXHJS9VmSyEKpPGPVHgMo86wOb
	i2aDh6w==
X-Google-Smtp-Source: AGHT+IG9PoCaCD9US/sZ8xzPdrqNXv1OAhd20a6O6eJB66JwvP1sBoQa9RCne5WE85it4rhFDzdVDg==
X-Received: by 2002:a05:651c:400f:b0:30b:906f:47e8 with SMTP id 38308e7fff4ca-30b9331a6e6mr4657411fa.34.1740722360736;
        Thu, 27 Feb 2025 21:59:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867ca299sm3909921fa.61.2025.02.27.21.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 21:59:19 -0800 (PST)
Date: Fri, 28 Feb 2025 07:59:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, robh@kernel.org, krzk+dt@kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v9 4/6] thermal: qcom: tsens: add support for tsens v1
 without RPM
Message-ID: <f7kgyr4oaftjofo67kl5ihn4yzjf5nrzi6n6cc742sae23ujqd@q5klfmyd22lx>
References: <20250228051521.138214-1-george.moussalem@outlook.com>
 <DS7PR19MB8883C5D7974C7735E23923769DCC2@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB8883C5D7974C7735E23923769DCC2@DS7PR19MB8883.namprd19.prod.outlook.com>

On Fri, Feb 28, 2025 at 09:11:37AM +0400, George Moussalem wrote:
> Adding generic support for SoCs with tsens v1.0 IP with no RPM.
> Due to lack of RPM, tsens has to be reset and enabled in the driver
> init. SoCs can have support for more sensors than those which will
> actually be enabled. As such, init will only enable those explicitly
> added to the hw_ids array.
> 
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/thermal/qcom/tsens-v1.c | 48 +++++++++++++++++++++++++++++++++
>  drivers/thermal/qcom/tsens.c    | 14 +++++++---
>  drivers/thermal/qcom/tsens.h    |  1 +
>  3 files changed, 59 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

