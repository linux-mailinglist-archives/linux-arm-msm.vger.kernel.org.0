Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00724242330
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 02:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgHLATJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 20:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgHLATJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 20:19:09 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2063C061787
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 17:19:07 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f18so3121361wmc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 17:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=YEjwPZh5RXt3Ie4FbKarHOy1S3LP80s3dHh0ey0Ay4c=;
        b=oxTXEciBXvnoM4ZLAb8X5sfDonmIlC+BBp8vPKTxI3GL6ri2Fp0SBg69HUYV0+50dy
         hoaCxYBxWL7N/kYFMTRWL23dGWY4xtzMaBW6350pxKg9sD3t0bgXSyW9HkBBUNLB7+fn
         kdqveXEEa+wJnIDhUOxFrGuQEMXkBEEDCGEKbTWTGByO2v8fpAIccs1LlsDE/8AG8Usy
         lY7BnpqF3vUverHMsV+w5jpI/qoZaSHivLLBYPNlhT/bsdeljxKvF9vsyT8WDvdsEWM3
         u1kQ82vIkN/EeQVy7U5o0WqyH57XTsmvXB4O8y8iiI+u4PzL8XRrHsECY4k8Cx3L/FWR
         Wt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=YEjwPZh5RXt3Ie4FbKarHOy1S3LP80s3dHh0ey0Ay4c=;
        b=elQBEHVsZU+IUjXFVM9g9FRlx3uVY8WaN/ZOV4eEzJBFNXK5Dnzeby5Nn224T2a10N
         FOj7BIszSODdIq2JtuD3VG/pm6eb5VKhCOLzggie7kM7h8XR0gAF1q/rPBfT19JSgV1y
         OVTNF3Ra7txdy3QlQSbg6RALj+JJsaqiCFHQHHI9yPMvIr3HjjvJ2KOw8m+YYkJoIiZb
         EIDUtbbtt1SqUj61PkGmbND3R4eoCbjY9reY3Q0kyHyHFZk0g1X1HMCDNcPk2GiLjbnr
         3CntkwIcdf8il04YraF9l+lonYXQlfg4ub3Y0/AqAfp/wx4dsjJzwKOby3rHviRsGggh
         l9nQ==
X-Gm-Message-State: AOAM531VP18BiSVRE7eldHsZgB4E1fVxRpQc52OFU0q4LYmf+/zbxGgm
        YPCvk4mk02R5fBzC3r4/sYGAag==
X-Google-Smtp-Source: ABdhPJx1rPs1jQi+VpfsboKy/mFx11ZgBxMh2H/MVyfAqyy8DznA/GYinlhj+AbBtVqFp1QrxeOV+A==
X-Received: by 2002:a1c:2742:: with SMTP id n63mr5827207wmn.24.1597191546141;
        Tue, 11 Aug 2020 17:19:06 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id j5sm747480wmb.12.2020.08.11.17.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 17:19:05 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, rjw@rjwysocki.net
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        gregkh@linuxfoundation.org, pavel@ucw.cz, len.brown@intel.com,
        rnayak@codeaurora.org, dianders@chromium.org, khilman@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 1/2] PM / Domains: Add GENPD_FLAG_SUSPEND_ON flag
In-Reply-To: <20200811190252.10559-1-sibis@codeaurora.org>
References: <20200811190252.10559-1-sibis@codeaurora.org>
Date:   Tue, 11 Aug 2020 17:19:03 -0700
Message-ID: <7heeoc3edk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sibi Sankar <sibis@codeaurora.org> writes:

> This is for power domains which needs to stay powered on for suspend
> but can be powered on/off as part of runtime PM. This flag is aimed at
> power domains coupled to remote processors which enter suspend states
> independent to that of the application processor. Such power domains
> are turned off only on remote processor crash/shutdown.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Seems like a useful use-case, but i think there should be a bit more
description/documentation about what is the expected/desired behavior
during system suspsend when a power-domain with this flag is already
runtime-PM suspended.  Similarily, on system resume, what is the
expected/desired behavior?

Kevin
