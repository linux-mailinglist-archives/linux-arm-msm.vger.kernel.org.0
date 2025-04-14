Return-Path: <linux-arm-msm+bounces-54274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA78A88FFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 01:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDD7017A1DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 23:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B891F4295;
	Mon, 14 Apr 2025 23:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U4nsliAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C711C861C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672569; cv=none; b=lT66lErKW+qkODzF92JxNPMn6OhEVxg7WGAkB4aOQdTD1Q1Xcs+mzeZ2/vbC4831e7XF9IRbCITAX3j9IGK7PS0/a0sa0OSInS+1O0GcJdVbrX6yCfDIrqGCt9BbzwsjHIajKnI4px+oaUB6FO7SZ8q4A1TXEBV+pPFHB7RdLsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672569; c=relaxed/simple;
	bh=7RJL7GBBV5nZmJ0yS9Gm6NjRypVsJlXMTCKHtHSWBRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+vXruftY7udbMK0PgQZwB3Pkh4jiAMeb3Ud2jfplE2kjYYn9xigVsGvm9UPKJVF0Fxat6O/U1t4aGMlGkdZaHiwlhBpW/+dAfhd4rwRrdC5jlHbi2nuhcjfZsFpPw7dMgwqKx5wkoBqmfAKCKduqTD4x3sE4/Cry4CEfdo+6/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U4nsliAQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22580c9ee0aso51067065ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 16:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744672567; x=1745277367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7RJL7GBBV5nZmJ0yS9Gm6NjRypVsJlXMTCKHtHSWBRg=;
        b=U4nsliAQMyUp0LtxoaNU5XCSEeZwZrNj4/NeL3nMPsVrZ2GLYMw8pXJz8oaOr2ZaHB
         BHzjW+OUjK/O83PFlYi9sDSr/lxsoICZB6bVAz7skK23xi0lFDbcPRcagW03HZwwDXc5
         wzgCg7zcZ/PJrUVs6Nm6/NDlb2bbp2deTUoD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672567; x=1745277367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RJL7GBBV5nZmJ0yS9Gm6NjRypVsJlXMTCKHtHSWBRg=;
        b=g9tSIZ/rqZ0nqFHYtbzEntPlIGJcLVvnTG+ftzSu6ZC07UpOY6JAhXmJGSCf/w8zjU
         SDxKoW0NjALhGYtcjZrZW8FjNFLWjbd+dAu2OXyvLfPPEMR9sVqQE/tTqcF4kV3Z+8GV
         RkFZgdMqQCCT/i1UpSn0m0fTAVoCrQl1SuvO45p7QgCSJcEg4icFv/1sG0m9f33c8RuV
         A7uCEYWbrJo5i67iYtqrByrNEd0AvvXuyfgwLX+FNj7WJ9eGf9aO1Zf8tvyB4B2yOdFb
         5KmAmj8GfBvjISbpwQJFYM6xPGo9uNdDvlsFvqUWV3+te/nnGlWKkbgw8xszGx+v5rpI
         CkgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfTf7wQZJxVMBd4p8JQXBcR/a/YuXD8zt1WzHc8aqRrtLCUgkTelJM/ovT53dcKiTotQWsx72eS9lMvYQn@vger.kernel.org
X-Gm-Message-State: AOJu0YwV17L7zMCpaSw+T5yhY2xdet3GniI6tB+duKKh5lGAzpc9AyrV
	U9yh/w4OSUuWt1zzqpoXIgwIpFCQkenpy+sR4+XaNw6YiHiJKr/TZwhCidOV0w==
X-Gm-Gg: ASbGncuok6ORRveUIksVmlhQUJ9goq7YRrB4lKj/Hd9X5tMVY235yvJBizVbvd4a/4D
	BK+wja2tmWFPAPiYWv0BMLMqfhJDKelpTSS5vumAUF3qdmt4+exQCZ0GisRQDTxfjACqnJXUfef
	97jXKRkfeKS5xJ7vbiTwu/IkTrW0TjmxX/YKT3goz0Vjx44txIZ765hJ4bUR7V/9rcfHA4QZthG
	nAT759HIZ2n1blu7JotWLPWlY/f7KvUDxY+6Fdfp/c5gYlbQiLgBc3NnFsaij/WAg7thxX1Zgyw
	sW81yvMO7YZDjwqVS7wejIdz4Dxghf0tv6mCGkVatw8vSpMAfBTFQE3wd5LBwbfxRwcL5gaX2VB
	jxg==
X-Google-Smtp-Source: AGHT+IHXVC2msS9Lv6MHRlDHgQ+8UmqZCQExOC+5nUPQFdZj1WNEowXz+rxUvsT8W2cEg963akZYUQ==
X-Received: by 2002:a17:902:f64e:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22bea4c76acmr213874215ad.29.1744672566799;
        Mon, 14 Apr 2025 16:16:06 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cfd0:cb73:1c0:728a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73bd21e1f66sm7163929b3a.84.2025.04.14.16.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 16:16:06 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:16:04 -0700
From: Brian Norris <briannorris@chromium.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@linaro.org, Tsai Sung-Fu <danielsftsai@google.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [RFC] PCI: pwrctrl and link-up dependencies
Message-ID: <Z_2XNM6FdRIvDx38@google.com>
References: <Z_WAKDjIeOjlghVs@google.com>
 <Z_WUgPMNzFAftLeE@google.com>
 <uivlbxghkynwpmzenyr2b3xk4uxeuqf6dow6ao4mptcnzygrw7@ylfqavr3ry44>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uivlbxghkynwpmzenyr2b3xk4uxeuqf6dow6ao4mptcnzygrw7@ylfqavr3ry44>

On Mon, Apr 14, 2025 at 04:37:23PM +0530, Manivannan Sadhasivam wrote:
> If you look into brcm_pcie_add_bus(), they are ignoring the return value of
> brcm_pcie_start_link() precisely for the reason I explained in the previous
> thread. However, they do check for it in brcm_pcie_resume_noirq() which looks
> like a bug as the controller will fail to resume from system suspend if no
> devices are connected.

Ah, I think I was actually looking more at brcm_pcie_resume_noirq(), and
didn't notice that their add_bus() callback ignored errors.

But I think pcie-brcmstb.c still handles things that pwrctrl does not,
and I'm interested in those things. I'll reply more to your other
response, where there's more details.

Thanks,
Brian

