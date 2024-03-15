Return-Path: <linux-arm-msm+bounces-14211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3804B87C89F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 06:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF7761F22F9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 05:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8648014012;
	Fri, 15 Mar 2024 05:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFCJlLyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1798514006
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 05:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710481858; cv=none; b=kxWTesrElD+1Gu1FJ4MqP42VmEiSt0whhXFxoVngK+t/VDdvLgIC05BOsHHrLuPcqI4GjKv+fH+NiWmP1mzKnw9rrdpdJC+tH1jexYJubafxLiuQLC5zBvT0up1FJ7xKHA5/tmtk7Uw4yrsmoZaA6e7WNCbGW4YL2MoVziR3wB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710481858; c=relaxed/simple;
	bh=YLMCpkGftwnRvP6OHcJwPra4ldTcLEUhhhD1EiB/Hpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9wGf0JtHHa38y0XxQdh4eaCgx+pgFbBM9q3RLs+1LvtmMw3r/E1sAGM7y32jvQUpKXEbnK1ISSVWED+AliV4llDGUQfYys98+u+qWq7idFd9slFqsz2NDQIHKDzGByhwZvANK3uCGDGz95kD91F5NuLAgNqpgHMS/BgGusJu44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFCJlLyI; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6082eab17so1641845b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 22:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710481856; x=1711086656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=doJoUmDIAXOFTyNTaIXiWO8CVSFB4RTU/SEwZDIiXeg=;
        b=fFCJlLyI9y2LbcNd29RzxR/ogw28Z/Y0e1QleKdDYTw9L2ksNU3eOgrPRogFnCnQev
         77M7CQIccKCGKwKZE0KkE9jD2sraUeAYCL5ECTpwbC2NXEIh1H4ilFClgYlnPK3uLYZ5
         jaJ5kcrtBU+qXWjq7Ipc4GRC6jBX7N63XG8IJ3yNSgRRguLp9dBckI0CNWR7VeayaNfu
         G/QjmpAD4vt3BrFVHF63/Gi3ByC2Lxxc5SGm9Uzj5I94oP+KG5LGzEj4jalU4FS9zA/u
         yLTotKm3JPv0yU5d7BHUZjBOZuaws9TaGn8OS2GRniPxljn16dQjQKvU31RfmLNb6By5
         u+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710481856; x=1711086656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doJoUmDIAXOFTyNTaIXiWO8CVSFB4RTU/SEwZDIiXeg=;
        b=t9oVa8dwx6IvKbHoWbEKmABWTVyK+/hcKHOvPqLTEJ/qFf3oE+vcyuL+I5Ap1J9MlU
         5rc5UPyLImRda5KK8HdRJcbsoC6UKn0QSFzIxI6tY3wqH3pqvOZqNzMl9xBc4CfvDncF
         fkB/Or6WEWSGXhP9xINdZx/rmZHvjT6rzsxg1S3sZAEprC49Rl6f4HvWy6BvDrYqIf04
         3r/mIae3jEL4F2sCwi7Toh3OAsTaFJqf1l8tUSr5Qc51Z5GXUuuhbo5rZnt7at7bJ5ZN
         1V4fJ5L4a+xVtF2qLaBCCAzwOVT9JahJgrJnuUdNd1yRnlmd/pay7PRWDY9YrAWYUaGB
         w4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXC29zlaEvXLI23Fk8y0MuxWbFMLNaO6piQfQyX9aUctirSEvhI8tiFnHUijfLikh5nFsJEQcPGzCpQ/wzSZ84fFj28FggLFk7SNCVkA==
X-Gm-Message-State: AOJu0YwyytknTMALv/ar1r48jQyCsTXQZLL2ST7CUBem3KSnCkgEfku6
	sICnj4P+1urKHiGwKHcT9sHoCiIHChMTQVANjvNJ/WDW5gCGBVWU2xpJeVnOBjo=
X-Google-Smtp-Source: AGHT+IF8TBbL8ijQ19uOHux5h2xhr4W6B21SMrX6Qo49YKppD/YPhBVhbmfkzvgyqyFW6yizrp9NlQ==
X-Received: by 2002:a05:6a20:8e02:b0:1a3:13e5:5200 with SMTP id y2-20020a056a208e0200b001a313e55200mr4910274pzj.14.1710481856364;
        Thu, 14 Mar 2024 22:50:56 -0700 (PDT)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id l23-20020a17090a3f1700b0029bce05b7dfsm2166577pjc.32.2024.03.14.22.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 22:50:55 -0700 (PDT)
Date: Fri, 15 Mar 2024 11:20:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	morten.rasmussen@arm.com, dietmar.eggemann@arm.com,
	lukasz.luba@arm.com, sboyd@kernel.org, d-gole@ti.com,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	linux-arm-msm@vger.kernel.org, nm@ti.com
Subject: Re: [PATCH V4 0/2] cpufreq: scmi: Add boost frequency support
Message-ID: <20240315055054.wbhi7456j4ph7mbn@vireshk-i7>
References: <20240312094726.3438322-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312094726.3438322-1-quic_sibis@quicinc.com>

On 12-03-24, 15:17, Sibi Sankar wrote:
> This series adds provision to mark dynamic opps as turbo capable and adds
> boost frequency support to the scmi cpufreq driver.

Applied. Thanks.

-- 
viresh

