Return-Path: <linux-arm-msm+bounces-65047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A44B05D98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 15:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 478B71895FD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0801E2EA472;
	Tue, 15 Jul 2025 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WYThkK26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BB62E49B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752586421; cv=none; b=cvKI6sFbiB+MU/6ZWoaAsWYb93kN1kMq8bL+HHLGcV6dXubDl/U2lrakb2ltSDNdWz0fIHvqzc3EHIHz0QDb9/8zc5Fa6UfElJtVdsaMbnMG4gsPYLH9ZHR2pvRRcXBp8zLBi1LeXJYovsR2uwzccHQMtMSt1nDGxi9uxVQbQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752586421; c=relaxed/simple;
	bh=rzsle0lYd4q3WFkhEa4uKuNyg+mZnvPoF11bTF7RytI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apbQb6sJR/hxur31M61ZGZF74U/eDHLzSGicPzhVkoPbcmxg4jZ+zAr7L95b/8CFVcXQYghJi0HPwhBL8xAkXSAuoI9z2yRtnxkzCoIqe2+2jatqWg0NCLBFB7jOqniBp9vHZv8TyLwkmpRTycTtuYvzjoLYDpPLsLkNNxQJBgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WYThkK26; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so21985985e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752586418; x=1753191218; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+O2OICZ/PuWhWK3KhlIFVSdYJvPOM1EVW/PgJZfT+M=;
        b=WYThkK26Z7Ql11GhNHA5izeyQuY5s7b6yi7lhD7yjRlPbvptZHkgeNewrwPcS+pYVw
         1l1BkwnX00vGRAHEjAovJeF8otaJMtVvU9BZw4/8htpxshpNf1o6zLtJHBvnxOFkW/kU
         IEMmuSNhu1vsXhTCVi8yXzGGMfDoosNrVZHb4s/K6CjmLsma/rhqmrBBwPw3ElsDaDUB
         Ud7XP6E2Wh3j88qZKLEgtwfWjNWhyqP8xb+cF2QxPzwcMjywc1lYD/4rDfyzTCJAwk/r
         zer7cd/bykVGOFHOsxCc66QExUyhYNIJdO3ZhDqAbrhPZDH+cV5c5IHpI7pHLTvDbf+y
         MOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752586418; x=1753191218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+O2OICZ/PuWhWK3KhlIFVSdYJvPOM1EVW/PgJZfT+M=;
        b=bSbq0uTfnhH805EgcSCqO3y/Ht1tA2Q5gbva+deTDbu1NMoaaq9gJG1qOm+9rWnkxS
         64/uZgzWZJP7mZLd/oNNwv6dPTXH/PhXRPrDv/b8rkF04/266Hq4QR6/m8yLzeLcmVM+
         O2xxO4E127BZQ+cYWGN2k66W1B/sYTAMe8mSEEVDb0/1rsh4JTmx/0O3vxeUMy6XjJTJ
         GpQTLrq9b2r4FOqksSZq13ov0cgdyVsBy5dha6mDj0pzXx8OPxahi4Sg0KHBRHx0YLId
         WsX7vkP48QHaIMmvVS5JDt6dUvmvtsn8PZYXoZfl/UpFeYccO5Fv1rbxwoNgKL3AekBL
         yhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrJrNCpK6KqJYIewKF5JiH/2JcpRP3EbTzGvi32Mba2QAX0lVkXplA4P83DHUUePC2L7mZF9cDzspQkx9y@vger.kernel.org
X-Gm-Message-State: AOJu0YyuMpOPQfwYe+zcwwJtCsLz8Qrp0eB3Qio/YDi8/v6Owi8+Km+E
	0Du9NP2ZXbwCUGIVIUsjOFqzU3t287OaWDYanZ6FqEDwOxA1rQIfIHJrsXMqwlDAREc=
X-Gm-Gg: ASbGnctUFmWLiUTmM7Er4+sWWCIxGeky+I6m1usjw8HiwIWEOd/pTqfdOPRnJe6Cb4u
	7bW1eLdeS/FmwTTd3erTpBSBHmQtoiruW605DNFwk19bXTu5LjfxjM8phyQ1TuumNVNuoZztWHU
	EyUls405scyWm/58nEf29oFvt44s4lZqtrxhJ4MOD5S30mv6nmBgJ5YSBh8NUlkojg6BZndqr43
	aIUYPNQ5hAo8PGmHtGEjDKcF6eJxxRoJSQXYvDBEYpk+C64VrRHukPv40M0L3Et5qyPHHxYxJS1
	VLqiICl4aiRdzaFJaBr4v0x9zX2TeQotzNXGYAluettkO30UNpqukcVwIeUmjRLPnhFCZzEQhH2
	PPW1fpoMjVWstrNeiy5NJ/lpCnzE++lSCCtKvJSo9adPZ1wo9Xxzqoon/VRMf
X-Google-Smtp-Source: AGHT+IENtk1fZji7615Bpw3kcLK5xTHsi34/FWdDqEiS6WLHvSySQx5nMasrQRvOYBkeNVG7ZeVurg==
X-Received: by 2002:a05:600c:4e51:b0:455:eda0:8a8e with SMTP id 5b1f17b1804b1-455eda08c8dmr128078735e9.27.1752586418167;
        Tue, 15 Jul 2025 06:33:38 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50ded8csm199491555e9.20.2025.07.15.06.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:33:37 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:33:35 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] thermal: Use dev_fwnode()
Message-ID: <aHZYrxabtU-7l2FB@mai.linaro.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-20-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611104348.192092-20-jirislaby@kernel.org>

On Wed, Jun 11, 2025 at 12:43:48PM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Amit Kucheria <amitk@kernel.org>
> Cc: Thara Gopinath <thara.gopinath@gmail.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Lukasz Luba <lukasz.luba@arm.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> ---
> Cc: linux-pm@vger.kernel.org
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

