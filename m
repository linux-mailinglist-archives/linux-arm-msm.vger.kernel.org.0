Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2952430A1D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344010AbhJQPdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343994AbhJQPde (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:33:34 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F037C06161C
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:24 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so292896otb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UFaKtGf2M9rTkoqS110bHbqzZ66MK1yJ16chK4hVUHA=;
        b=mt6U3RUy7HLlyDHFkboOEOzbsWq0i9ZreASbV2vwjoNHFyicMTfLYJYfXGc7eKC+F1
         KEEwJkVCm0gYvzxTQpqJ27h3mnYtEvGV0eQJ66+tMiL3ZKi6bsh8Ul7g2Uc4+L8RLUlY
         Q7EbesvEeUL7GOvPtp6653yrCshgL9uxpo7Zlk6sRITsDgMviKwlPISITpXDDHazBLlS
         9ne3CvZaDZdk0Rhurj5V2C59VT+Fm98co8zvutGfD3OyLf7H6UvlG7tGaUSrh7GoMc/3
         LSlpswI8ofcsZVpUbTc2WMwXQe+EbYKcmJEczdBRoeQTdhnKZwvLCbqjL9z5mSwuVG5O
         HBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UFaKtGf2M9rTkoqS110bHbqzZ66MK1yJ16chK4hVUHA=;
        b=MtkbMt3itWGTfKrnEDS4Kzz0MK6bFd8ivUy/EkEJyv4tQc1GKAkPBXCM6EG1zYgsLT
         hqyb3Rl+LnoImrvI2BZFtXPUdbKm9dP+MYLGJGrjyti0ZumheLI5UjvbNZqmT+bcV7ze
         SiJnX/oc5iDM1N6Bxi1nHA9BAHRoFy+ePzQtKT9CMnrfo38Bmkmzr/9d3xr/4MZ5sbE7
         eC1lIzQOL0GT/HMhL0BwScPSGp/trvGLR/fBMm8EwNZHpmhd5nHJE9HeQ9Jy4Q7D3CHj
         h0mBo+9JLNhPHvjwNVsn1yl/d0Frs5KWH69DQwX04Q55i9U41sq3gKRd7ueN48cjuBRu
         WPDw==
X-Gm-Message-State: AOAM53334hkyl+GvvhgVzHFE91TFWnD2VEoAuEgSNYftef/gJH397ikn
        73VmZD8q3RXjcbowggtgRNqaGQ==
X-Google-Smtp-Source: ABdhPJx3t/WpHKaJrg4yiVHwANKcQgG6EiyHAfCgVoeXcxw7Yg7y22Tb3Iwq2db5P9DTjKT6eQs7hg==
X-Received: by 2002:a9d:714b:: with SMTP id y11mr19170547otj.289.1634484683795;
        Sun, 17 Oct 2021 08:31:23 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x6sm2565698otp.49.2021.10.17.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 08:31:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH] ARM: dts: qcom-apq8064: stop using legacy clock names for HDMI
Date:   Sun, 17 Oct 2021 10:31:09 -0500
Message-Id: <163448466185.410927.11756419943796079115.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
References: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Oct 2021 00:42:21 +0300, Dmitry Baryshkov wrote:
> Stop using legacy clock names (with _clk suffix) for HDMI and HDMI PHY
> device tree nodes.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom-apq8064: stop using legacy clock names for HDMI
      commit: 03d4e43fc5beded1aa67c12b7c7e6932ae9a40cc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
