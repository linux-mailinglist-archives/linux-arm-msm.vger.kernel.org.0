Return-Path: <linux-arm-msm+bounces-13044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26186D87A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 01:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37407B20A65
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 00:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900DCC158;
	Fri,  1 Mar 2024 00:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BsZo4m6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14FC2F3E
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 00:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709254242; cv=none; b=jkt4tFivZisS3ZopCtZDXfOf9uk/oxm1vIeDHqCWcFIdh12VwTeg4adsg0HFPnApzmAmQNPUiQge7w+DZbCw8IvUqQcEux9dHQQvsj/QPe5DxQ47Wg0LVBDPVretnaQyHtRGEZPQBwzEBFW3B/nBKx/BmyOlHGcjN+S7Zri1KoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709254242; c=relaxed/simple;
	bh=CHaFe2U1BELmHABPqs1ra6MQ6WF55y/yWPtwz7/PtG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+ISIhFQa6N20CMtzDY6EGJnf9zQc1Hh2ol3vtsL7NXwgZOVmyq5c3B4mijZbb45SjQLrUfAAvlfVqoZZp5DMo3FtMZDQ9fFNSImiFi7wPBQIZ6oe6CNIOCpNBrNMGNGVuL4bdg9o0sZUVz8yWjg8Mw52n8h/10LUVjgU5JyjWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BsZo4m6d; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so1653821276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 16:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709254240; x=1709859040; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gnvogRONe3XITKcvwUiXTJV9XpAUGTW6Ba9EKEvdg2c=;
        b=BsZo4m6dkRJIiHZbG3EbHyIJ/e37yzVRwu0uw9aSqfZt1AMmwTj/AXnp/e3zYpxm9e
         smnrejAiFguL7wmSHKm/AYJuJuZFJD+bhKOZxnGfSNJHU1HHgiqXGeRCVvsfg9UXiG7k
         F3L6ISsDO2FFs3r/bFzCGh1vfGWuzMxPfez7SSZxwWwh0YObtzHPkmvhG5SRWe77zaPK
         6mCoo9YVvNx8QQ+nRfgTAEb4x0WhhhHvjZf3RxO4QLVtrF7ZtVIBr28SfCEn7kjJN05q
         +5eCJbKsfdL7MvrGB7GfnKQhyXPfGlnnG39XR4zkLlWOs33qvp/l1iEnQbbe7JOdTM5H
         iS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709254240; x=1709859040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnvogRONe3XITKcvwUiXTJV9XpAUGTW6Ba9EKEvdg2c=;
        b=WbycjRVTRWE4Ok2fhyWGpcm+rf70c/GKzcfley/09A+qnVUmL3lt7rSHOqsy2KWqIv
         IYjcVPQWrEMQ3UR5+p3LzzP4D8uc7q+6VbYmFoly2VeUyM08fAc8mxsZIPa8jNW5Mrtz
         40GRB3kgUVziSD0DJT/bBPZ6Nftk5K2vbvncZjfmnClBT1fc0dW9ESrKiYoObduTvaVV
         6Y9AHqmOaaf31nuDzhgo4m0quI+G6ZDT1P0FWgIWLXGx0H2L8uUKRNBpa8GhUt0/g3ns
         kPC+B36czadg3JHBCWZTl3d/DUs1TgrvHz2gH6v16z8Ruj3K56SmKU+2ZWUHlluasjQu
         NRfg==
X-Gm-Message-State: AOJu0YwKejvCPtV54Plnu6+eMCmT++Yg4ZOVE04ZURPJ/h4uc7mrFm4K
	AnL2xbv0SPxzGo2G50bkH7xoAxKV4zD5nlAGzPEtPbSc6/nrdjEcOxgnmR2BgO9WxTmuvq1Y8HG
	b5BpmsSE1hkc5IVww/ALLDMCX7GSTUTZywBSJNQ==
X-Google-Smtp-Source: AGHT+IFM0L1Wruj7VXlBG7xBnpqBnUoxX0KR0ks/vnv8ECeWSCE9OTUifnqgru8CT5o74SzEX7I784pPBQQxYuiKEZo=
X-Received: by 2002:a25:af4a:0:b0:dc7:4776:e31 with SMTP id
 c10-20020a25af4a000000b00dc747760e31mr31342ybj.24.1709254239907; Thu, 29 Feb
 2024 16:50:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
In-Reply-To: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Mar 2024 02:50:28 +0200
Message-ID: <CAA8EJpo11gNRP1sYBXva4doOvuzuEsbR3pVgS1FdWqtwB0bNGA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/5] soc: qcom: add in-kernel pd-mapper implementation
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Mar 2024 at 01:00, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Protection domain mapper is a QMI service providing mapping between
> 'protection domains' and services supported / allowed in these domains.
> For example such mapping is required for loading of the WiFi firmware or
> for properly starting up the UCSI / altmode / battery manager support.
>
> The existing userspace implementation has several issue. It doesn't play
> well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
> firmware location is changed (or if the firmware was not available at
> the time pd-mapper was started but the corresponding directory is
> mounted later), etc.
>
> However this configuration is largely static and common between
> different platforms. Provide in-kernel service implementing static
> per-platform data.
>
> NOTE: this is an RFC / RFC, the domain mapping data might be inaccurate
> (especially for SM6xxx and SC7xxx platforms), which is reflected by
> several TODO and FIXME comments in the code.
>
> Changes since RFC v1:
> - Swapped num_domains / domains (Konrad)
> - Fixed an issue with battery not working on sc8280xp

After sending this RFC I have stumbled upon another issue on sc8280xp
/ X13s. I'll send v3 after finding a way to fix it.

> - Added missing configuration for QCS404
>> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>


-- 
With best wishes
Dmitry

