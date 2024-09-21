Return-Path: <linux-arm-msm+bounces-32139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE397DD80
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 17:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61E93281336
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 15:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB0C170853;
	Sat, 21 Sep 2024 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HvPuGy5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6607822094
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726931551; cv=none; b=cUXUGuPJHW54Ej2qOCeNB+HMxM2HQLeOrCaq6XU4qDiWGLfJBRSYteSg+n0V8V+TR+HSyFUiDge+/wH4Aq3VCvN1ZvYgibNPKb2mQo5qTViL73AA84igMBAdxTExiNDpd1ndVmaBOoxXp70ajMIDVwAWzA1fopSx3LK/Ir+Q+aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726931551; c=relaxed/simple;
	bh=PIuHJgFhaEQLPU5bBInkAjhcvbXP1F8JOOJTlHmlSAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cl2pgyw1/WM2jTuh8LFUpq15oEXsVZxVsJ9uAwlr0nRnQdbOGSSmqv2e+c2hkYIT07hmy4iOxT9FiTQuVSpYYH+mV5mVfN5kccldUuSWD81vrJj0wwDht3yG0bDBhwv3kGPssrvgtT6Eq8LA/e21VPVCFd7FKcxZZx2vu9L0sVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HvPuGy5H; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f7502f09fdso23971621fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726931547; x=1727536347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+cCIhgS/k2vjc2OUhYMT2c4n8qzUt4Bozql4xrd8IA=;
        b=HvPuGy5HabJ3VZEHXKXal07Vwcv9TK+DWGOv/iGE1jXu0MJ1RNOop5Susm1BPWXP2m
         pC80hDaeE8KKiAlBePW36M5jxuLbcRvGUBs57PjdGJ18sXEL1wREpx6UgOqoR+PE5UoU
         DwBFdar63KQLvnPs5/ON9mnb79dWv/PfM1gtyaKbD7TaS494jHLFEfQBXTPA1BJFaZnF
         Pk+8OA4q8gIbXROWIIusCjoTIFZ+aRNupwrqzoIpRB8YUIiI/vDEEgz0NcRs+G2bhx6g
         wXrXIr8KURTtqvtJLpHZ8yIqk/qvZKQDp2G/LZYflAxe8fpbWt//tLR2whR7Xv40XulW
         RYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726931547; x=1727536347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+cCIhgS/k2vjc2OUhYMT2c4n8qzUt4Bozql4xrd8IA=;
        b=ccqmGQ+gXOP7gbqG4cBm5J7E58AErrxUErBK1EumdtT0R6Z2TmwTAj5H7cuW+bpeRP
         fSF70/If6VsG6SewXfFH6Yxg88iudIl+jtCno5fM6FFJoi8d3IaFqBMhlMuBTEI+IhJ6
         B7myHfl0U3JWZNpcc70570kDFugvWquDzjVXpWQd8Ldfe/1n52CfoUUQPeJHfT0No1ud
         ADUC3RqRX3iCcrqe394h3/a2u/uaVMghigERk9yHWDHf3ZzOwCl4MEYPSSx4lCjFRIcL
         /UBSrVTCFfz1Ba9rOeVAS72/4w9ZVq2RMNYgLzb5AZ97vNaokUcaZcCm54JHPRJxBdA9
         o/Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWDuQ6/I0POamFf24nsgIVMTVX7/Nb+YPvpklnzU84gKqefQyLVqLbTdNGKwJqmb/jvYAnA09to4ig/n+ll@vger.kernel.org
X-Gm-Message-State: AOJu0YxHne75KbHFvowybzNhixwvCWHfJFYZTnrezKYyWZxvmuo0s9Z4
	mgMxrJvMH6BY2GlKb2Ima9j1IYm/tNtHo1+Z95SzlZa/DG6Pe5aYoa119MmUCKM=
X-Google-Smtp-Source: AGHT+IG2Tisg192cwSwUCwOYflL4dJLDoCgZm+4DdO8LkZdejNGKkqxArpzklyjiPrrBO968mtBbGw==
X-Received: by 2002:a2e:bc13:0:b0:2f7:cac8:9e38 with SMTP id 38308e7fff4ca-2f7cac8a1a3mr21993871fa.18.1726931547503;
        Sat, 21 Sep 2024 08:12:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d3002e2sm23862131fa.31.2024.09.21.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 08:12:26 -0700 (PDT)
Date: Sat, 21 Sep 2024 18:12:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Andrew Halaney <ahalaney@redhat.com>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] firmware: qcom: scm: Allow devicetree-less probe
Message-ID: <4vlcyqkxs5qagckqcqnyvfoq2ay24trcescp3iomenhswu5gpm@kpvuee5itnxz>
References: <fqdmcct5b5sxv3rpxiksmzpjbpcwmyuwpb5epjnhgpzxh344pp@pxggownwv44n>
 <547C76B7-8E41-44C3-8433-374B4E6BC341@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <547C76B7-8E41-44C3-8433-374B4E6BC341@gmail.com>

On Sat, Sep 21, 2024 at 12:45:19AM GMT, Rudraksha Gupta wrote:
> > Which devicetrees? I assume that this mostly concerns arm32 machines,
> > but I don't see if you have tested this on any of them. Also on some of
> > those machines SCM require additional clocks, I don't see that being
> > handled in the patch.
> > 
> > If we are to manually instantiate SCM node, I'd prefer for it to be
> > explicit, e.g. MSM8x60, create SCM device, using this-and-that clock.
> 
> I believe the consensus was that we will be using your one liner fix instead of this. If I misunderstood, please let me know and I will happily test this patch.

I belive so too. Just commented on this patch.


-- 
With best wishes
Dmitry

