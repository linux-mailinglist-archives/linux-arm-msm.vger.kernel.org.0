Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8591A46512B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 16:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350659AbhLAPRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 10:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350751AbhLAPQh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 10:16:37 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EEF6C061748
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:13:16 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso35568525otf.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 07:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zHnyn0V4D1cDh530N0PDN6SxecckzjKWiElhDEIypxc=;
        b=eS5bLwRe01fg0ZrcHBic15idl3vRr5TaSzVk+R7q2FO8U/Ut8YWpN8HNTb/7daHq1z
         DegJAHrRJFJ5DvdIg5We/MpVCdYKlA50BH1FL4vpeNxXlN/FyHUoW9hogQWbGyFX7ZW+
         UKpoTUj96gyLsw8ToAl+9DzJY1AzW/QV5lKo2kiU5H13o00Yeh9s4mADfhJv6rthPMps
         GV3LFrHTt2YvGtmCbvoKm7WtfwAtT1I+EoEAzba6LkGOntmV38Mhu63VO1SLhMHcuq4B
         jnva00nTZnhCAD0n8A2VdE6nnhuXTKekmXjbuH/8j9jBnxyE6uKN3O3FA7qYXT85U5Nh
         UF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zHnyn0V4D1cDh530N0PDN6SxecckzjKWiElhDEIypxc=;
        b=BGeucFMjgmpWn1MC45tPbzcwkWtoEhayfZ2CoBYZImQ/561yCB66yfP5RlHlNyY0U+
         a6iHEXDJgt7FIXRKRCNyVWTWgCJ1fF/fM8XKLaydfOlt9TjFCJsMXbzk7182DVG4If3m
         iqUC/QEVSeayGMMxUWbJfuFlJSkRuzSGouxwXFRuRNe4j1HjeYhpEnCUkpS+POmNSclc
         zxuL4f2fEdnkPU1UQfUwWhoUz09SlpWGY3tNvRMX0AXzK0xf3BB/FxisH65bjCdFwLz8
         EXTH16BHhWt+x2kJYyraMbWqW40rjwdjxSJXWs7mba728Bl+MtRFVuUESm5UEHKz3I9l
         +e+Q==
X-Gm-Message-State: AOAM533IlxwOgdnBqx7kM0kS+4dcH0FGk953LL/MlrBmenYnHnxzlFUe
        NWLhvzWuXsqETJd4OtNrbki91UxDXob7Fg==
X-Google-Smtp-Source: ABdhPJy7hptbKYqcIM1z69aEtHiMKTqkYVcs56AAUIiUTpc+AEu9/T7j9qv/iQZMtM8X/j+/vzm3Ig==
X-Received: by 2002:a9d:74cd:: with SMTP id a13mr6512786otl.71.1638371595672;
        Wed, 01 Dec 2021 07:13:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id be12sm33933oib.50.2021.12.01.07.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 07:13:15 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: aoss: constify static struct thermal_cooling_device_ops
Date:   Wed,  1 Dec 2021 09:13:02 -0600
Message-Id: <163837153033.1905338.15967895794638876580.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211128210317.25504-1-rikard.falkeborn@gmail.com>
References: <20211128210317.25504-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 28 Nov 2021 22:03:17 +0100, Rikard Falkeborn wrote:
> The only usage of qmp_cooling_device_ops is to pass its address to
> devm_thermal_of_cooling_device_register() which takes a pointer to const
> struct thermal_cooling_device_ops as argument. Make it const to allow
> the compiler to put it in read-only memory.
> 
> 

Applied, thanks!

[1/1] soc: qcom: aoss: constify static struct thermal_cooling_device_ops
      commit: f5c3902d854744b42604359f68b42426185ed7a5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
