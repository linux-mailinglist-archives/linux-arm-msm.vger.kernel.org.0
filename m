Return-Path: <linux-arm-msm+bounces-38008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F18379CDD1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 11:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80AC280C69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 10:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B951B6D15;
	Fri, 15 Nov 2024 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YNCBS4pC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DFC1B6CFD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731668320; cv=none; b=kkFsGgKtU58y3ms+GCtaKx0xiSLr4mwIJnE0sC88jGVcjz+rpIrYbT5EjMeMwHftDm4Gtfi6JPql0DTgGlTO0l7P5qnTtteob47QQ2dxRYcuB1ilRj/DsqOg5G7cfRgc3/uGMKCviqA2DnKLY2svfesKEh6qTfqzPNjdVgdT6Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731668320; c=relaxed/simple;
	bh=KeO9xmAr8xW7IJL8rOvn/GP3RENPi2I6iCoPv1qFA8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8R7EOl++FA+1MCfqvMCKppHLB4VG4oKtUtqdE9JkQ+JtfsvcKxZeHkqteMKfMcs4Hgk6lQai4Kob+cS86KjmjRlomoEuB0FnL5VyVUr4hjaC9r76SyLIg/LGejUlvJdTagHtQLRw7qFcO/KVLazCkHdpqmfM86gSLGsr5iQmfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YNCBS4pC; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5cf7b79c6a6so2363606a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 02:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731668317; x=1732273117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G4hZnzTlNhqS+EnW+1fU6zOMxAZ7jqUOVpxiFS42KLI=;
        b=YNCBS4pC4oEKAqRkGBq6hil7KrNHvNABvnRur7uOZdtbkSb7BtJRKVSqrTCVPl0vvV
         Eh9dBQCSBSN1/dGAUq0NagJ7ar/WxshqgZPkbIricOOIwS9LTlIuG5IDpuzFsEr+oOrs
         NhV4M3eBE8lOYeMSE8ioK8VZLt09GTXWmyw30oA4V1UeNnwD35nGCfaSi/jFJQw4r+Hg
         qFEfHC5QnedxSdmvwH7rcjimn5zc+FycNXAd+1n5FTTv5Ty6AVB01UJtwI6g5m72T7RW
         +cEvDDlFz3amp2CllPT8XDGZwoz2Pui+MfmQseyASrFIeSDPjsVDWFDJc5bOW4BOi4JV
         TpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731668317; x=1732273117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4hZnzTlNhqS+EnW+1fU6zOMxAZ7jqUOVpxiFS42KLI=;
        b=NUHQz4T2CCNnhY7TL+G2o25yxdMxPBY9l/0Ev3m9RWP+yU6gHdKL1NBUgxQONUyBRE
         H69uedrKOifZgKD2frxc8soBuBzYXzp7An79+fbgJjTqVcsyX7N5zc2en5q4XET81JVq
         +rq3PRa6SUgXgbVKMM/P1i6vlAM+5/Kj3ObPEIrTe9Prj1iNFN2hO+w8R22rb2GwCR2r
         j1szP21o6trkcwqGn7C4qf9iwCvYvM64wlmLh41CyY4uxoMTlEWKre/t1oUa/2/cT2DS
         eb8o9184Yp2tTxFOVE3R+8lHweXuSGTU7Cb+hTGLqpYyqW+rUdlbdv9N6jX59MXx8TWB
         W9qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/tRfWlOJkAk+DtgHtQzNCIb2+COwoByKx7nTnOAZefdT/fxcwyu0aTVBr+qMbr5zV+m3QQ5ynJcfv/4Vh@vger.kernel.org
X-Gm-Message-State: AOJu0YzSiKIi4ysNdD22RFXd3sQhmVQRoUFXEdiRjGI3YRA/1/HYmiOx
	8yeHxujGDTGzTE2WY1DtwOjg7bHiZ4U3myJ+zsi70K4KpN8zkuSxiaiuVRYhVjwhYDmgK/avgYg
	YtztIGI7z9ZFDtnUVtRD5FEYYQ7etE++g/p2gVQ==
X-Google-Smtp-Source: AGHT+IGSVYiUhsWj6zeltJjcNWqHnW6GPQb1Itj/wJyDtSuZKguUH81kjOYfKW/cySwbACmp91nXvMM6OFlu/bFyHhI=
X-Received: by 2002:a17:907:2d29:b0:a9a:8042:cb9b with SMTP id
 a640c23a62f3a-aa481a08499mr187630866b.20.1731668317082; Fri, 15 Nov 2024
 02:58:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
In-Reply-To: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 15 Nov 2024 11:58:00 +0100
Message-ID: <CAPDyKFrYkKFJ=+4t4ad=a4GJUCBVO7FuaRqdxSTUWtHOWgUA_w@mail.gmail.com>
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Nov 2024 at 07:07, Sarthak Garg <quic_sartgarg@quicinc.com> wrote:
>
> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
> This enables runtime PM for eMMC/SD card.
>
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>

In general I think using MMC_CAP_AGGRESSIVE_PM needs to be carefully
selected. I am not saying it's a bad idea to use it, but the commit
message above kind of indicates that this has only been enabled to
make sure we avoid wasting energy at any cost. Maybe I am wrong?

Today the default autosuspend timeout is set to 3000 ms, which means
that beyond this idle-period the card internally will no longer be
able to manage "garbage collect". For a poorly behaving SD card, for
example, that could hurt future read/writes. Or maybe that isn't such
a big problem after all?

Also note that userspace via sysfs is able to change the autosuspend
timeout and even disable runtime PM for the card, if that is needed.

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-msm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e00208535bd1..6657f7db1b8e 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2626,6 +2626,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>                 goto clk_disable;
>         }
>
> +       msm_host->mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
>         msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>
>         /* Set the timeout value to max possible */
> --
> 2.17.1
>

