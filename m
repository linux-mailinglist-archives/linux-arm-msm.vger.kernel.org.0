Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A944A565E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234029AbiBAFUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233888AbiBAFUg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:36 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8195C061778
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:32 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id m9so31142778oia.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WlKH/pEjSh4EjyywKuXe02jLh+J0AViFsgBwKNgD2cU=;
        b=zNRDKdHFSk19gJDopMbkyaruoTsLh2oT95lDAlVnm8KZTwIjDBeuyqdu1lgGrpydhb
         UBgHpV/Mejcve/xa806AE8MW3m5jY8MrL++sQGEM2f4Ua5cqrMQ5NqTMfi8aDv5lV+07
         seHFHK2UtRdLVnJGie7o+2ozI4N5UQhiGWOHXejZFfWI9+3kymR52QQ0w7a5rsMbe6GY
         q6lYJyaR87n/ipD7scTVpxXFjg3/Rsu/t85PcQBRdrix/BMj5yKGjMQAmex0xqCpTp8Q
         xc3fxCOntMwLzIuW6Q3XLsI5L6m9uWswOwdhYFvE6FR4MEn5B9l9xPcxjKiuZPtejdMz
         nz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WlKH/pEjSh4EjyywKuXe02jLh+J0AViFsgBwKNgD2cU=;
        b=p31YYKOpYYUtsJSWS4gCqtnobFch73e+ynokQcXgOuHVQ6/KhH5/4oToxO5QZjf2ek
         amj2MKDByeBJYO0yqHtR+Ou8vOTRSszugeK9J2rMnZ0jHvE2nQtRpqLu3Rk7EEZ+Ojky
         GXF3ttRI7UVwzY/gjH391R/bV4y2Iz6I885XU28MafqJiAXVdvBbyUU5CKuhM/5xO3jW
         0+EJjOlGjioHuZRKYIF1Q+hT+tTkLm+GkfjHoLEzEEpbjgnLw4L7tpuLo6JvTy3hKM0q
         jOXKlUrms2LXnbLSmrLRZqZ2PdUqmV3snPTvouEdcbCkM2+/Z3Blz2J4TtqNDFT5n/Gk
         m5GA==
X-Gm-Message-State: AOAM533I4GmoDXmJjEEGUaRU4JPRtYwMEA9P+fnTBHaOK5+6n//y9rWR
        tVH2Cj89D6aR0OmIcsZFWrnvXmpf5Pt4QA==
X-Google-Smtp-Source: ABdhPJwUpvfxwC9mIcyYHcGDDHcWfh0U0mOxvUT++6SaS1Gj2N3WbvEKZ6cAhDfhWfvLdU9PYabHZg==
X-Received: by 2002:a05:6808:211a:: with SMTP id r26mr230462oiw.241.1643692832286;
        Mon, 31 Jan 2022 21:20:32 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:31 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] ARM: dts: qcom: fill missing power-domain-cells for gcc controllers
Date:   Mon, 31 Jan 2022 23:19:40 -0600
Message-Id: <164369277345.3095904.3228893403890968834.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220108202719.82424-1-david@ixit.cz>
References: <20220108202719.82424-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 8 Jan 2022 21:27:18 +0100, David Heidelberg wrote:
> Add missing #power-domain-cells to the clock controllers.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: fill missing power-domain-cells for gcc controllers
      commit: a23b9143286bf4ddd8cfe4126e8580ad85e98ca0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
