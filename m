Return-Path: <linux-arm-msm+bounces-44424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD30A05F43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 15:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09003166205
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C898A1FC7E0;
	Wed,  8 Jan 2025 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Us/oQ6eH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B7613B288
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347626; cv=none; b=cHUqutikHMumQcFnVE2Na5maYzEsSSFc47Z+66C86SJviDymFOqXaW6NFlnzq49kQFVOfE3okqcAwf3UJsuPQ2Zut2k+ylvBnnr+plmQmnS02pVw53oX71GAGftE3BJE0bwurSS1GbVeUPKtmYClutEIULkpW7YfABZoFNpUn6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347626; c=relaxed/simple;
	bh=OdE6D5N8RrpzSeHpeycvSVWOB2W1RR8oVCgZ0kZqXjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQB/GUWBKq8kZbFqv6K2eVOHtcSc8f1PRMCfxQ3UAkvxh2CeS9f8oA//yGAR9bA8euLuaWyIzXR1JNs3oc2MWt2dcm+JNFiBUYxlsO9dlkXThTLL/Y8Wo/PdkFsJAkRGEwJrycBO+fRxoJfKZrPWuafa888j7y2tRwKIkTlai2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Us/oQ6eH; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5f63c89e72bso2361971eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736347623; x=1736952423; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OdE6D5N8RrpzSeHpeycvSVWOB2W1RR8oVCgZ0kZqXjo=;
        b=Us/oQ6eHevDPW6pWDxmKD+TFRLCOcQSB5OBa2wNVlxhB4HmRfCojBcGYLeosC9Ypm9
         WmABC0SYECnLy5vU3ksRwh28DknEAc6dJ/aQsJtAKS9E4BwJsI+8GGaCGO2KaVMuwcCk
         QtkIsMeuwoTGtn4aSXkV8vLmn3E4JlJPM07vmYGvAHkyHr1gndTTCsn2e02PxnEfhMb9
         8bfdTcEYeaQzIi+nSAKWMHcw7uEMZnCTan/1oQz7oHE/tze1gtvwO5sUqWr2YXRIcrnu
         5huD1w9j7B+Z5CGJKBriYO6mm/PxAVbIavKI0RLS3ktSQd/dyEUCAesUDm8OMxr+oG3B
         drpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736347623; x=1736952423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdE6D5N8RrpzSeHpeycvSVWOB2W1RR8oVCgZ0kZqXjo=;
        b=jb7nwDU1NcZLuCbZME22Wz7wMW1W/GxBXFh65cW2sbt6qF48Rds/2VFD4+yAv0yPd3
         B8KftOAsY79sTd3NtwkldQQvQYKvQCV650LlJmqOGzDgl9QYoLIuzdv1V+n/0rRxksy+
         XJJA37JK4jEyfaArq7FUqGdO4FqQL99kfqW1XvDyl1ZgZ/F5ihiN8LugGVqi+Ilenlpf
         Yuvbp4sUCV/f6c1Xkc2IGHoBhMvKC4fHmvU/0QqI+GpeU5/E3cWpnTnZUWNWsyyaTRaq
         ZD7kAyHGpePnti7oOjxy8JIjPolVlARpfPaUswp0VgPeUD8/OV2TgZa2pyxE7uM9JyVb
         N2Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVDFVh2V6W2MbZR+pLY/EhiyvmLXM34QHFXhkqYKb3d3x1Cz4zbl/j+TSEbsla4icnTeCmfGnRFH9Vi5NS1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgc4UsJlxskXGmE8WYAudFN6x8gidw4iADg9Si6AEJZlYxeSFP
	5H8rS/NBCrnbhn7KgMDphZ4b1xaWsBoCr5gkH592EQaFxbrp9tan7lOnNAOYe4w4pepDijs547g
	nTQAX7vxdETHayfDk/TKeU2N65strxe3OGPuadQ==
X-Gm-Gg: ASbGncsZXrCmW7NoaywqldNkVwz4INyFzaqnMUCVzVFmIHMiMiGVclk6pZZA7P6H92D
	exbAIBZZVhlVZHEdzlB1OpUq/R479guFedqhndW/5RLFTQTKRQJ2a17PEQ9srt2DgcNh4
X-Google-Smtp-Source: AGHT+IGozL0b6866JXapQ+PEbHnvhj3a6/0QQ88A8IJ/+L+igHRG0D/Vq+aG6UHzobmpoTeJz0Mbo/TlMtGJUaQpZJU=
X-Received: by 2002:a05:6820:4b07:b0:5f6:d91b:ef36 with SMTP id
 006d021491bc7-5f730849a23mr1529084eaf.1.1736347623278; Wed, 08 Jan 2025
 06:47:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org> <20250108-mhi_recovery_fix-v1-1-a0a00a17da46@linaro.org>
In-Reply-To: <20250108-mhi_recovery_fix-v1-1-a0a00a17da46@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 8 Jan 2025 15:46:26 +0100
X-Gm-Features: AbW1kvZfPY4Kk4qbtmTD0fHBZZNdvUZzXO5U_uMo2FSCqxn2gzTvApC3VGAA_jo
Message-ID: <CAMZdPi-2O_aNWHnRKkMGUKsrTdfTTuNM70y_7X5xvADiyk-+VQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] bus: mhi: host: pci_generic: Use pci_try_reset_function()
 to avoid deadlock
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 14:39, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> There are multiple places from where the recovery work gets scheduled
> asynchronously. Also, there are multiple places where the caller waits
> synchronously for the recovery to be completed. One such place is during
> the PM shutdown() callback.
>
> If the device is not alive during recovery_work, it will try to reset the
> device using pci_reset_function(). This function internally will take the
> device_lock() first before resetting the device. By this time, if the lock
> has already been acquired, then recovery_work will get stalled while
> waiting for the lock. And if the lock was already acquired by the caller
> which waits for the recovery_work to be completed, it will lead to
> deadlock.
>
> This is what happened on the X1E80100 CRD device when the device died
> before shutdown() callback. Driver core calls the driver's shutdown()
> callback while holding the device_lock() leading to deadlock.
>
> And this deadlock scenario can occur on other paths as well, like during
> the PM suspend() callback, where the driver core would hold the
> device_lock() before calling driver's suspend() callback. And if the
> recovery_work was already started, it could lead to deadlock. This is also
> observed on the X1E80100 CRD.
>
> So to fix both issues, use pci_try_reset_function() in recovery_work. This
> function first checks for the availability of the device_lock() before
> trying to reset the device. If the lock is available, it will acquire it
> and reset the device. Otherwise, it will return -EAGAIN. If that happens,
> recovery_work will fail with the error message "Recovery failed" as not
> much could be done.
>
> Cc: stable@vger.kernel.org # 5.12
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/mhi/Z1me8iaK7cwgjL92@hovoldconsulting.com
> Fixes: 7389337f0a78 ("mhi: pci_generic: Add suspend/resume/recovery procedure")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

