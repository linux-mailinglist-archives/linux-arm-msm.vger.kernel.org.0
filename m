Return-Path: <linux-arm-msm+bounces-29873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A996338B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 23:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEAF31C23F6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 21:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53861AD40D;
	Wed, 28 Aug 2024 21:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wuf1HVnb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292931AD3FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 21:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724879123; cv=none; b=jh2SSY/J7hfcu0MsKCjaZjun7VD7AyIzKc9eNJYCNPLPdBsGQXzU+kE44XaMoXx1XDMyyCVPBXqAa9CzkPDCvMOYLyN+PoIKqzhGZzwSoLPoThF4aG0sA0FCSPw+du4bd93T6oH26V1MdSusjhgk8+V1K67XUvbWHtKXWseNgAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724879123; c=relaxed/simple;
	bh=xw/CcMz6j7BEBe/0r7XKlnCuk0/U9f4ac4w2v40x8e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPSyLwWz/mFwj6HXK2M+MQCfq0kEOQztZxgNWaaJr5CT4DzAqbDDSY/BBiPayMitzf3PTKWUN/AkeHvT/qVC8P5y1jOPU09Z5eyqGzmLw2XzNwMJ7UoKuK5jVFXLWOOQ9Y+RkLUoUo0hIIxLcAbOBWxt9MqogBBafdqZaX/hcBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wuf1HVnb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53346132365so8620784e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 14:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724879119; x=1725483919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8P1AfMskY/XNd3kwlMg/4oyb4V66AijIk4o7h53BOc=;
        b=wuf1HVnb5IqraD2dhlHqzVZuOO84yxt6DMQy3p5itgXbYqzhSeo7Alkv3pabW+kfSI
         F3H79OxO/NkRb6Lm1cYGbsnNO2y7MX9HD9XcOadCyyU/ZTZCRiaiL6KRbNqjxw66x7Yj
         VSk51mr2jgduB1vHjCYo8o/v/Av2LfuWnC6UrtDyFdmy5OCyVHe76P2Xz5M+zKwx5D+e
         orCoD9wuTCBub94nY22fGCDScVSFFCI7un/Fixr8eb9dCwKPFfHvCKDEj0unletXFXt+
         +vQ5M/2gJ9STIws4VGnHvPmvzsxglB8b8vAbqHYV6Xxddln989t50zb7y7k+X1nkRmVK
         KQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724879119; x=1725483919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8P1AfMskY/XNd3kwlMg/4oyb4V66AijIk4o7h53BOc=;
        b=S32Dc1zqIeGl4c4QSi7axVLgTAoqGltZcb0JQjF4sZeritReAd3UzBCoLEzTWutnqE
         s1QX/1cCCa57gDQ+mgfZ3kaY+e2+YvcXcvQ9CKs+/6KzERG6baNY2lADK6ATmP5joHax
         OCjX2drs0QcNxU4lVzxN4CByUEIiZ1s/90QBqSC9QLblcfnYAYr9gILj96tLp0rG2HK+
         o3jFnJgbkiINmK3jbbPuGjUkI2ArGT+vxmX9u2ETVamWnahYC4CSJa3R53pt9uzK/J4x
         p/XJk/Zsn/kZRkRLFUgRvZ28ftVSp0UggHM/SYuSVPiuvbQotLIG5tOS4zbz7fqHxW8P
         8o+w==
X-Forwarded-Encrypted: i=1; AJvYcCWOEuyTu5Dnj3TpOJeEpP2hN5YxuIGPeCcIWQb9zJRUXEvFF1AjGeNKdzhraP2TcFilRpMnFE9lqqiqCJ+i@vger.kernel.org
X-Gm-Message-State: AOJu0YzLhKY19GUhaYWkXssWDZLln9cn8WMh4eKMFC7/npSEG6fs9yYv
	KISK3ZYyx8FVIvA+pOg+V3qirLwk4X5/4zaf81f5KQfCrpSmNfHHvEls3KadlxA=
X-Google-Smtp-Source: AGHT+IGwy00ojcB+2DLJtwYPQ2cEU/bfftwOA25DuW2BUnyVrQjczSw876qvUyAwWFtEYqRAhYN0BA==
X-Received: by 2002:a05:6512:acc:b0:52c:e3bd:c708 with SMTP id 2adb3069b0e04-5353e548762mr303636e87.10.1724879118526;
        Wed, 28 Aug 2024 14:05:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea29321sm2292090e87.25.2024.08.28.14.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:05:17 -0700 (PDT)
Date: Thu, 29 Aug 2024 00:05:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, quic_varada@quicinc.com, 
	quic_srichara@quicinc.com, quic_viswanat@quicinc.com, quic_mojha@quicinc.com
Subject: Re: [PATCH V2 1/1] remoteproc: qcom: Add NOTIFY_FATAL event type to
 SSR subdevice
Message-ID: <o2auzct6aoda4hifggxjtsyzskx2edbut2lmpdf33fzvkczpmd@ngen35gjnoh2>
References: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820060943.277260-1-quic_gokulsri@quicinc.com>

On Tue, Aug 20, 2024 at 11:39:43AM GMT, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> Currently the SSR subdevice notifies the client driver on crash of the
> rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
> However, the client driver might be interested to know that the device
> has crashed immediately to pause any further transactions with the
> rproc. This calls for an event to be sent to the driver in the IRQ
> context as soon as the rproc crashes.
> 
> Add NOTIFY_FATAL event to SSR subdevice to atomically notify rproc has
> crashed to the client driver. The client driver in this scenario is a
> ath Wi-Fi driver which is continuously queuing data to the remoteproc and
> needs to know if remoteproc crashes as soon as possible to stop queuing
> further data and also dump some debug statistics on the driver side that
> could potentially help in debug of why the remoteproc crashed.
> 
> Validated the event in IPQ9574 and IPQ5332 by forcing the rproc to crash
> and ensuring the registered notifier function receives the notification
> in IRQ context.
> 
> The client driver in this scenario is a Wi-Fi driver which is continuously
> queuing data to the remoteproc and needs to know if remoteproc crashes
> as soon as possible to stop queuing further data and also dump some 
> debug statistics on the driver side that could potentially help in
> debug of why the remoteproc crashed.

Please post the patch together with the user of the API. Right now the
series has just a single patch in it, so it's impossible to judge
whether it makes sense or not.

> 
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
> changes since v1:
> 	- No changes. Rebased on top of linux-next.
> 	- We will now have a user for this notifier, ath12k.
> 
>  drivers/remoteproc/qcom_common.c      | 60 +++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_core.c  | 12 ++++++
>  include/linux/remoteproc.h            |  3 ++
>  include/linux/remoteproc/qcom_rproc.h | 17 ++++++++
>  4 files changed, 92 insertions(+)

-- 
With best wishes
Dmitry

