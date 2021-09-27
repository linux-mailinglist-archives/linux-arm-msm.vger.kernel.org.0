Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F5A41A3AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 01:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238166AbhI0XPg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 19:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbhI0XPe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 19:15:34 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EE2C061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 16:13:56 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 24so27794564oix.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 16:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=niIrNi7ZEXmmT1P2sO90W0rGG9yNmD2ghXA/EbvlFCY=;
        b=ucT871Br3zat/1ft3J6FaAumRF7Uc7ihWVsne6GnYBTmXCbfrHEmQrtsoV7tccCZw0
         MUY3X9Vk3XEwy1WN8F3YyZDpuGqCCmlpio3Ng/NnJLTsNCkHYgMz20TB7/YyHI8n6pkW
         oXOHaKc8z5WFpF+PW03F+yIDlkvxcz/391kRegOITkmCztPsBN4jr/B67StP5aGSKatZ
         EL16w6oJgXhttZKL2gvuFk7XXuTcTy9lxnq86M9EXLz0wTG/iueFawErzrGJX7nVirUK
         jBm/B5dpUhy28tCOWt7trqtJg5vrNJjlS1O4kzYHO9NhNZof1kaKaKUaLmzuJhtGW5W5
         2I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=niIrNi7ZEXmmT1P2sO90W0rGG9yNmD2ghXA/EbvlFCY=;
        b=AL0aYnOGgEufbuC1G1wpWBDThQrE+jIUOpAjVuu7AjeUg6njXxrTfuvLkDccNfeL3O
         72VkDXwfjMmx++buAxiePceByQ3oF+WSloxrjkF5p5O2+O5mQZMf9BZEojNni6t/3kSA
         oJbXXmD+asAi++U6sufjuXKl/Nk6Bt47DH6VUELjGapSrdoxdb8wwxLMuL+qno6vgDy+
         A5QxWG+tB6SsSQXTyBVG2BZJ30JeRTHFUW/xdhSXgKUIAUSbLqmA7NR2BLCKVlKvBDyk
         9PoQlJR8Hct8Lp52y/F9yConXqI5T9pm9AsfAeiLIrCe8sENRhGc8be7XqWDIF1rzKUs
         kkeA==
X-Gm-Message-State: AOAM533h1uGpI4QMqXLmNtLySNIyjK/w6huqfmcxdE+AY8UJO2tRkFzG
        GtX0pmwDYAsMma1ncbD3JepE0g==
X-Google-Smtp-Source: ABdhPJxSUnIZoRp+dkcW7CUZbWKyJJ0FFCKouYpAg1IHtjVJbEk6lsiyuIAAXLt+dt9HNplY1pEIPw==
X-Received: by 2002:aca:2415:: with SMTP id n21mr1199826oic.27.1632784435780;
        Mon, 27 Sep 2021 16:13:55 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p21sm4162268oip.28.2021.09.27.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 16:13:55 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, mka@chromium.org, will@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>, swboyd@chromium.org,
        saiprakash.ranjan@codeaurora.org
Cc:     evgreen@chromium.org, linux-remoteproc@vger.kernel.org,
        robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        joro@8bytes.org, agross@kernel.org, dianders@chromium.org,
        ohad@wizery.com, mathieu.poirier@linaro.org
Subject: Re: (subset) [PATCH v5 02/10] remoteproc: qcom: pas: Add SC7280 Modem support
Date:   Mon, 27 Sep 2021 18:13:50 -0500
Message-Id: <163278440375.1524647.12737308797302207774.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631886935-14691-3-git-send-email-sibis@codeaurora.org>
References: <1631886935-14691-1-git-send-email-sibis@codeaurora.org> <1631886935-14691-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Sep 2021 19:25:27 +0530, Sibi Sankar wrote:
> Add support for booting the Modem DSP found on QTI SC7280 SoCs.
> 
> 

Applied, thanks!

[02/10] remoteproc: qcom: pas: Add SC7280 Modem support
        commit: dacce1c92b3d13232ac72a0e1edc8cfb693400f9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
