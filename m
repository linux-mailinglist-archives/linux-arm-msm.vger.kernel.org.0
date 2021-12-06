Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A0E46AC13
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 23:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhLFWeg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 17:34:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhLFWef (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 17:34:35 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828A3C061746
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 14:31:06 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so15548587otl.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 14:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ryn/Mn0oCuSAoAeG5wwZYVTAXduxPIQABtmtDskOCeA=;
        b=RTrYHW1MgkOkKe/eq8tryam6zofT8S27THitGFNsvlq3ir1eUoAkYCqPWqsnMcGR4I
         m/wLMsnTyb82WlLB6okXhnZSgAgJiYaq/5eCFGYmuLzyc/n/RLvaVoRgiKO02pyLkfsN
         IL5QK19h8u6Q5WW1f6ASgJplewHZp+gARwBfSLNaRbeticFKdkkQ8NZ0tvZ86kdpB8A4
         xPOC9R5Yq4Z67wKUIH81M81k3Ypoup2YKyPOK95QrPCHw+2xRFSkbhULCV0dqwAPIjGk
         jo/15KoMiEHb9RZ8gHwuXcZEYmV4srRQ2quhIqqBsBNH1+JRHkTG7lwsayfmg8Qy63Mk
         o3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ryn/Mn0oCuSAoAeG5wwZYVTAXduxPIQABtmtDskOCeA=;
        b=1XFgL0JwrqT7iyMEeAzxkgx2cfXKPX9/OGJ2Th++kHDIJnjwcBsDHFKTP3B9dLeA10
         mVwFHZbcyfoPj816zQcEsBkbGSA7DxFfwDgDgIaIVDzpgG7X5p5RPBkXVdz4btfDvntm
         xyB41Ym0PBpL74dbAJYm456E3g8D6mm2DxQF+RSpmki/1A17atUirR0aaXIS6jRTXLG7
         J3ebivR/xrJ4U7io9oZ6Xs4L+Mof61wdUwNwJF8Dyd1lMWj5I4A2mUlx/AUSrO+DaNYh
         6SAN2r6e2h4xYS6TsomUdQJo+OWi45HCIEdQGzapCxZdWX5sLNi1dRnLdj3sETbqvk8F
         y92w==
X-Gm-Message-State: AOAM533O2Rkrjwrmq5Ftouv14Be0kYVWj+PiejUQMhXB57B+uW9oovNR
        CzGmXeqq+SqEy/a3sQvmSbKkgiH0Pm7ihQ==
X-Google-Smtp-Source: ABdhPJwI2wU3uJQV08nWez45N6jPlcsYH3zUJa/kxMKikY7BSVIyMNyvnpXr5xhQJn4QzLmliMhTAw==
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr32593040otk.86.1638829865897;
        Mon, 06 Dec 2021 14:31:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r5sm2911815oiw.20.2021.12.06.14.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 14:31:05 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH] MAINTAINERS: Add entry for Qualcomm clock drivers
Date:   Mon,  6 Dec 2021 16:30:56 -0600
Message-Id: <163882985136.2324147.4029165074694158634.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211203013901.3460496-1-bjorn.andersson@linaro.org>
References: <20211203013901.3460496-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2 Dec 2021 17:39:01 -0800, Bjorn Andersson wrote:
> Most SoC specific clock drivers are picked by respective SoC maintainer
> and then sent to the clock maintainers on their way upstream.
> 
> This has however not been the case for the Qualcomm clock drivers -
> which doesn't actually have a maintainer per MAINTAINERS and where the
> framework maintainers have just carried the Qualcomm effort as well,
> presumably as a result of Stephen's history.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Add entry for Qualcomm clock drivers
      commit: e3fd5f632cdd00e3652e4a5fe743c8c052af11a8

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
