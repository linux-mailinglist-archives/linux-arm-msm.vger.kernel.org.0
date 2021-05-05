Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687C4373DBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 16:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbhEEOgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 10:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbhEEOgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 10:36:18 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E884C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 07:35:22 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id z6-20020a17090a1706b0290155e8a752d8so934610pjd.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9ht/S/4bHufHsk5TYe/goP/DfNRSeLIzApauTghVLjU=;
        b=NHMNApbfQMqAMjgQnAfqikXwDmVntfWlQpNxguHRG/5MkTUl9RIc/dLT9hqU1TKAB6
         4VepYlLglfTovFxaMG0UNCFjZu/lqAEjAAqySGh0JrQVbgQ+80xUf7LfxnD/4IqFGfcE
         MRDrBFXvS061Uj9icHYoKBop/T5dfsJJdVzcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9ht/S/4bHufHsk5TYe/goP/DfNRSeLIzApauTghVLjU=;
        b=K6R8QUm2BfoKXwtR3/RPFEAN6kiKH5v48qS2VieW8a0BDAxwbkcpcFpCWeSmRJY00L
         U73DCLlb3jQ0h8n061meLZjdqMB6jmqdFz7+Iz235thV71Yb0T9r3KA3FtqtfEdcjvut
         mWKUC4pGpSS2LSAU+4t2do9XPOU7C9jYGrZTjCqrorxnKdthtSYDq+875o5F5V97YQk6
         rRbK7FCv7wbEO/ReHY3poI4wZglnZK0AZVGnCmgFBm/GT/AM/z0oeZ4ogyUUeAb8WTad
         cV0V4P0ieshhvE7rf06noLX/+pQlHHeRHA+ntCMKNat7+X4pNQzLUFVrVeTfXQ0KhGLX
         +mrQ==
X-Gm-Message-State: AOAM533ktD0RR1oCOd6diZPcGW1bau36r3eMH4sf/Q/S+qPa8rngXXhV
        K1scKNeXPbDuy2nwMrn9H22EZg==
X-Google-Smtp-Source: ABdhPJxqWisVwlsjb7Et1yTG28e4vIIm96b4ePbk3vykqLGGRyN9z6X7TtDPg7rVkYY4BFJE5WOGYA==
X-Received: by 2002:a17:90b:46d3:: with SMTP id jx19mr11756154pjb.31.1620225321784;
        Wed, 05 May 2021 07:35:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8770:f856:b2ff:e5e4])
        by smtp.gmail.com with UTF8SMTPSA id c195sm5049270pfb.5.2021.05.05.07.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 07:35:21 -0700 (PDT)
Date:   Wed, 5 May 2021 07:35:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V4 6/8] arm64: dts: qcom: pmk8350: Add peripherals for
 pmk8350
Message-ID: <YJKtJ1pTjjP91sGd@google.com>
References: <1620197726-23802-1-git-send-email-skakit@codeaurora.org>
 <1620197726-23802-7-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1620197726-23802-7-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 05, 2021 at 12:25:24PM +0530, satya priya wrote:
> Add PON, RTC, VADC and ACD_TM support for PMK8350.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Please make sure to include per patch change logs for v > 1. It's
generally useful for following the evolution of a patch and can
save reviewers time by focussing their attention on the parts that
have changed with respect to the previous version, rather than
having to review the entire patch with possibly only minor (or no)
changes over and over again (though multiple passes are often
useful).

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
