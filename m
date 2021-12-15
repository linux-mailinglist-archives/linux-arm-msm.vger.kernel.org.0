Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5BA4765D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbhLOW2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbhLOW2L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:28:11 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B5CC06137D
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:08 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id q25so33831606oiw.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aDH/YWWKVjZlLQyZIFy+0zDo05Gsdaj6wljJxBa+2jc=;
        b=MPWCz68OrRpvSst+iVdfMyq6jg48qRuzBcPfo2JGINrzbqvA6sELJlpGwXUW/vA2Az
         /SLeUiByRI43dndlScquJaC/mEDGTmewmS+UMgxPH6p4UZ5ubj1P82SvFAiXxsdTTRJM
         uuP8o/wywTmp25wdDrkMFNnRiw6qxK9ElcL104NRPxeI58XgWR5HHQaN0aPnSy/viZVx
         m8YL0VtE41F+3KBFlBxSUryV31RO8RCEqtss/ytE+2nCR0qv4kK63Bf/JdpM/Sq1kHeM
         iZbr8dOHQey6enZXHTW719V9/sgNhOKYRd0XlfNTaFP17UVARg0vuHvTN4xPvGBzPO9X
         sohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aDH/YWWKVjZlLQyZIFy+0zDo05Gsdaj6wljJxBa+2jc=;
        b=h7El5s/2Jka8/h9uNOuCpZJPJNqut4uaxQM+kthnaz7FsKNH9hygxzJI56BbyZC+WA
         /DYDXAWNcL/0luyTjdz+1Tj4+zq0Vv2Z0bxRILDj0erGxUJNzyvRo7A3FPUb5jBUJfpD
         MgwFbbyTEOMLhCsFTVgqh18DKJyqDMY8ZFsQdSsQEFjNQI7pjyiSPJSvOlH6MGeve2mq
         W5hOMfi39aUmjerrzYAYCN4txJKfD14YunoU+VsYgMwYv8BvMYoZauE+/JjaofeRdbzA
         yDiCC9/4Q5RcIAZxaqgDg2KQkY8wG2ihSDQlOwzXxxV/972oHzLXskS0nQv8OZjNIxkg
         O16g==
X-Gm-Message-State: AOAM530eGKnki7HzyLofHYXToKWLQYHXuGvScz8LbUGZUjamrstNBGZA
        IE0pxdljhJwOwye3FW/uWZxGsA==
X-Google-Smtp-Source: ABdhPJwJdbwMVlL/jXVTrqrq59MY54DlXVcNCPbgciPrF48scJIoEnZ465spYSOB9vjt8inpfiE9Mw==
X-Received: by 2002:a05:6808:1396:: with SMTP id c22mr1909525oiw.59.1639607287547;
        Wed, 15 Dec 2021 14:28:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:28:07 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH v2 2/2] clk: qcom: Add clock driver for SM8450
Date:   Wed, 15 Dec 2021 16:27:40 -0600
Message-Id: <163960723735.3062250.17177131067279462625.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207114003.100693-3-vkoul@kernel.org>
References: <20211207114003.100693-1-vkoul@kernel.org> <20211207114003.100693-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 7 Dec 2021 17:10:03 +0530, Vinod Koul wrote:
> This adds Global Clock controller (GCC) driver for SM8450 SoC including
> the gcc resets and gdsc.
> 
> This patch is based on initial code downstream by Vivek Aknurwar
> <viveka@codeaurora.org>
> 
> 
> [...]

Applied, thanks!

[2/2] clk: qcom: Add clock driver for SM8450
      commit: e855145c5325c14b928aff439a0e2bc089e6a513

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
