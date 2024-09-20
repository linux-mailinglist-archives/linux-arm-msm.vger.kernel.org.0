Return-Path: <linux-arm-msm+bounces-32120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF74397D9E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 21:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835F21F234AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 19:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082BD184534;
	Fri, 20 Sep 2024 19:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QTZlefiV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D6D16A94F
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 19:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726861547; cv=none; b=I+rxP2bo+8AHNfA03iYLEqfx2L4Qfi0G8S0vmWV/He2peZ07jwL249OukRt7w9FohHnRbK1xp1wR1DOt1cZs67PtXqtNlI7MhgJyMGVA5c2MoVCTP4a4XzohybU+SvMLrKedXWbnb1EjEAhVc6n/0Nx/5+jdAajPnb9q/uk2P7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726861547; c=relaxed/simple;
	bh=U2WlvI+9T8YkwgSekwR1bxigdVYdZyFV/7ZqO1c9QEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FP2CjHtC4cKk3qPxMfXVOOkpFt45CAlOxvsZQHb/ntEQS1br8inJigFkNAHHVvZj7IWICJ9t1AtPWLytuCcEYcqVkXDqiy5oUfV+oBqI8kJr5uNbNw8lRqyHxF8ttojQrk8UOtUFjSZ2jLTEHxtI1hscwDfgEDUexDcXG1PeWCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QTZlefiV; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-a8d24f98215so292020566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 12:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726861543; x=1727466343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TRS+idGNzahvBj9jscmdm3PmSwtqxAOI1WCgdqDAFHo=;
        b=QTZlefiVIne2AbWsQA8oKOe5q6AoC6G8TjM/S0l1ZeHc6Zs+U/lEdlupjMjD5LZM1k
         tG2s23Lj6v8RHdoY3Mjp7+2/By55DGYYbQT6o0VkpsatO7fS3rbIZy9XEzsvs1eUr8iU
         aDRY0EjSq4/dEyj/GgebV9L2FoATRvDCoJrMBoDjvJCSLq65KlkeY1Pn7bdI7XKfzmtc
         zacAFPOxyMZVp3NrTm6CJ+PluhnrX5lMJXbAPVkzNDxgzWFLmh5cxc8yxR/7lndRtX5+
         NuGHJDUWoQSt72A5Mw3zLlAZRCS7pPu8F9ZjaDnziSmdr3NEa/cKD7u9v1F9xMbxpxUZ
         vdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726861543; x=1727466343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRS+idGNzahvBj9jscmdm3PmSwtqxAOI1WCgdqDAFHo=;
        b=cirW2Mdy8+7r8WJfePSURnVriPVqakSa/snKo4BWOBpSrF5mfvZ96IhvopztVgIucP
         sJwqpojlul36xvcMa3SWN7uoIANH/nJzyu8DcbzJ6hnGYV0Iiei391/ZbMtu81Ay/QkS
         /NmWW+ANzFZWT3sp0gZRUvD4L0Y8PlrrTVkFQ4qeu5+r4XRNFVuaPK/UOS/IqTWGrflv
         t2zrcXIR8tafRR8m+zp1SQood1kaZRnoqxIn9xPFXZ20vyB4ykRW7BcSybMaKTv6AUkF
         D1sH7cIxnZhDrcde+VmjDPQWuWabV51cKDUwHEEGHgQn2BlFaprmRvJOHBWj6sz9HcMN
         pGLA==
X-Forwarded-Encrypted: i=1; AJvYcCVtXsOcHwVrRGZ0vjbLJmdHy0eaZcSfWG9Vdlm3AyZRireJhIVEtsa7Ag2iz4uzO16nC6rYpB5TGxufFFZU@vger.kernel.org
X-Gm-Message-State: AOJu0YwajcYiTpzhB2+Ha7nP+Mbodv7fejca1PIZZ851RhhO1RPjPID9
	2p1E/xdYJGtNht9Wu3n2nWYJZDDFThz70Ee4Kr+tRW+DgquaVxqep1BbYioxXY0=
X-Google-Smtp-Source: AGHT+IE+zny0ecrNNzz46off+DY0B6+d8ny0pTLg+W0H3UOq2GCe3fmfJwKyykwIG/0D2Qq9+gmtiA==
X-Received: by 2002:a17:907:3f25:b0:a8a:ead3:8515 with SMTP id a640c23a62f3a-a90d514a83fmr329372466b.65.1726861543096;
        Fri, 20 Sep 2024 12:45:43 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:de75:1bb0:80e4:4afd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9061331912sm881054066b.224.2024.09.20.12.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 12:45:42 -0700 (PDT)
Date: Fri, 20 Sep 2024 21:45:37 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Rudraksha Gupta <guptarud@gmail.com>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] firmware: qcom: scm: Allow devicetree-less probe
Message-ID: <Zu3Q4dZLmMb3zAaq@linaro.org>
References: <20240920-scm-pdev-v1-1-b76d90e06af7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920-scm-pdev-v1-1-b76d90e06af7@quicinc.com>

On Fri, Sep 20, 2024 at 11:01:40AM -0700, Elliot Berman wrote:
> Some devicetrees representing Qualcomm Technologies, Inc. SoCs are
> missing the SCM node. Users of the SCM device assume the device is
> present and the driver also assumes it has probed. This can lead to
> unanticipated crashes when there isn't an SCM device. All Qualcomm
> Technologies, Inc. SoCs use SCM to communicate with firmware, so create
> the platform device if it's not present in the devicetree.
> 
> Tested that SCM node still probes on:
>  - sm8650-qrd with the SCM DT node still present
>  - sm845-mtp with the SCM DT node still present
>  - sm845-mtp with the node removed
> 
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
> Link: https://lore.kernel.org/all/CAA8EJpqSKbKJ=y0LAigGdj7_uk+5mezDgnzV5XEzwbxRJgpN1w@mail.gmail.com/
> Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Do we actually need this patch?

We have a simple patch already that fixes the reported regression [1].

And as I explained in my reply to that series [2], the root cause is not
the lack of /scm node in the DT, but the time when the SCM call is made
during the kernel boot process. qcom_scm_set_cold_boot_addr() is called
in arch/arm/mach-qcom/platsmp.c before any drivers bind to devices in
the DT. We would need an early_initcall() to run early enough before
initializing SMP, but I haven't found any examples that the
device/driver model is actually functional at that point.

I think applying the simple one line fix from Bartosz [1] should be
sufficient to restore all functionality that worked before the SCM
allocator changes.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20240911-tzmem-null-ptr-v2-1-7c61b1a1b463@linaro.org/
[2]: https://lore.kernel.org/linux-arm-msm/ZuhgV1vicIFzPGI-@linaro.org/

