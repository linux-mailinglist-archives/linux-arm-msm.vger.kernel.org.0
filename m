Return-Path: <linux-arm-msm+bounces-32847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B4998B67B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 10:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D27BB21DEC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 08:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F461BDABB;
	Tue,  1 Oct 2024 08:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AGoNMqcR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652051B3724
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727769845; cv=none; b=gJy8njmVwWuKHy/DZ+FPGzQTz/xdPpnQadGS2e9TNhARkuVvTWdPU6IvNk+bHRmbl6KavEuFA0QKzluLHQqOKrANHNtajv0/7MzhYddej35JGPuY5RT6iHgzHP7epqLYuLc70p9GzJHh/SLp8KfMk2Qm3NHpuvthmEv2v/kgpVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727769845; c=relaxed/simple;
	bh=KEXQ5Ay6c2BHp5skR1W0T/mLlIk+n6EvgXUsIolY+tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZEsL0PPS59gtnwyFPrnPpdYaVD5JOzEBX4T6uTfMzfedKZG+2ymk0g2dbnd8oss/U2tbxi26cman3jt4fAM4f/4yKQTccoiHzvG2jzh+mL64iMz5xt2LqhoHlmd+nuJ28KRewzcFy1KuWH9RhPq5240guJjo5tALT7Tn3FhqU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AGoNMqcR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b9b35c7c3so15064395ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 01:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727769844; x=1728374644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J1+wkK2l2xRy8utXsqfIry8GdHjU4hY3AoDE+Bz3XzQ=;
        b=AGoNMqcRR+uDRW/bM9CRFPEXWJ7zRWp1qUs9rKBlPlHnR7FLMC73pRPwr8rxnsfiAb
         3cyKFsWt/DW10u+BLuJXQsbUcQiBL4NX9dXRWS6OEdE7vE90YJdVl8gwcCdINutKvrAG
         zyx7WU7PXyYNntv2ZKnzItPVMOo1tYaxcFv0+IfKkTomaqgjUpMmPPJ5Yrv9qoQPddu1
         YpM2SZy/tSYR4OcrHWDiayQl3DLjA2zu8iJV3dRUJSTfilGtOu9sPXAMwKK9KnbHP4er
         EHdMnRUgeP29K1MvqA4uS9nEDlf2+y4a8SlEXr6Ea2WCSwW+H6ZiDRFbc1uSXME5xkQV
         0dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727769844; x=1728374644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1+wkK2l2xRy8utXsqfIry8GdHjU4hY3AoDE+Bz3XzQ=;
        b=XVvtCb/wlOUtqb9OSi/j/mbcXbmZsXYxW7BVDOrJMRrPV8QWPQRwGzR3TsaKgf+DXZ
         0sFK6XVLrhOIzfh2B+y1YVs8bYbWX8VVIaxiKHft8YvsxXqc+rM8Kg8Qql3K4sTbcA7s
         SqYxJaCTQ7L7+87+aqy3jnDja6zJV9XXcLH3pPB0Qw7/K989d+vikgyxxYAVY+zugqKV
         CGElLMX1BhUYHlTVA0YFVxpm6k5p+7z0cZ1ohvxWKwJqfFcIgf8qfAtSBx5Jhl1Hf/9z
         7MsQpQD0KgMYJwv6JMXryvo3oQ11N36G3ljrYIiEssxERrWlUouD2Ij1EBUxYQ+w/K2j
         wBkg==
X-Forwarded-Encrypted: i=1; AJvYcCWzxX/duqn9xN7kKMyluOHrADip2PU7VWoasstNO8fJPqB2tH08FC4ypBbbRtE2ucqi6YFtu7Tcaf/E5PPP@vger.kernel.org
X-Gm-Message-State: AOJu0YymMvlB1hK+Cg8+T3cZnkRY3OMHukgH+PkPS6PIQ8I2uGp3ovsw
	S7eROF3B9FN3u7Y+//UXiDDGV2V2IHMErCMIgVeG6Zmgj9rXToQJ750w3KGiKwk=
X-Google-Smtp-Source: AGHT+IFxdj5utcNpiiU2u5Q6H4WitES//noqUsseFdObo/1XDupyWruxqrF8ptvRrnT/1BMaNOTAdQ==
X-Received: by 2002:a17:902:e80a:b0:20b:59be:77b with SMTP id d9443c01a7336-20b59be09c4mr172854535ad.6.1727769843489;
        Tue, 01 Oct 2024 01:04:03 -0700 (PDT)
Received: from localhost ([122.172.83.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e333fcsm64614335ad.185.2024.10.01.01.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:04:02 -0700 (PDT)
Date: Tue, 1 Oct 2024 13:34:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dhruva Gole <d-gole@ti.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bryan Brattlof <bb@ti.com>,
	Nishanth Menon <nm@ti.com>, Andrew Davis <afd@ti.com>,
	Lee Jones <lee@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/2] ti-cpufreq: AM62: Backward compatibility for syscon
 and update offsets
Message-ID: <20241001080400.diqfgbkje77pjby7@vireshk-i7>
References: <20240930-b4-ti-cpufreq-am62-quirk-v1-0-b5e04f0f899b@ti.com>
 <20241001075759.o2a6vhjia5sl6vhr@lcpd911>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001075759.o2a6vhjia5sl6vhr@lcpd911>

On 01-10-24, 13:27, Dhruva Gole wrote:
> On Sep 30, 2024 at 15:02:08 +0530, Dhruva Gole wrote:
> > With the Silicon revision being taken directly from socinfo, there's no
> > longer any need for reading any SOC register for revision from this driver.
> > Hence, we do not require any rev_offset for AM62 family of devices.
> > 
> > Also, maintain the backward compatibility with old devicetree, and hence
> > add condition to handle the case where we have the zero offset such that we
> > don't end up reading the wrong register offset in new AM625 DTs whenever we fix
> > them up.
> > 
> > These patches have been in discussion as part of another series, which is now
> > being split up as per discussions with Nishanth. Ref. the following link for
> > more context on the same:
> > https://lore.kernel.org/all/20240926-ti-cpufreq-fixes-v5-v7-0-3c94c398fe8f@ti.com/
> > 
> > **DEPENDS ON:**
> > "mfd: syscon: Use regmap max_register_is_0 as needed"
> > https://lore.kernel.org/linux-arm-kernel/20240903184710.1552067-1-nm@ti.com/
> 
> Just an update, the above dependency patch is now taken in by Lee Jones [1].
> Waiting for it to finally appear in -next.
> 
> + Lee just because we are users of that patch.
> 
> [1]
> https://lore.kernel.org/linux-arm-kernel/172770742318.523866.16912261914335612487.b4-ty@kernel.org/

Ping me once this series is ready to be applied and all dependencies
are merged somewhere I can rebase.

-- 
viresh

