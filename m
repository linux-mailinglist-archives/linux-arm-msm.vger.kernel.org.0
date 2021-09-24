Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66BE8417E34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Sep 2021 01:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233113AbhIXXbb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 19:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbhIXXba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 19:31:30 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0E8C061613
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Sep 2021 16:29:57 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id m14-20020a4ad50e000000b002912a944a47so3769744oos.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Sep 2021 16:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q5YUbd2+ktiW/f8uLGj/tW/VEikJIDD2esj1p6/7Tyg=;
        b=g6p0p9hLQlPG41dq1iawJpA7yGFT5mykMD1TfFmVL9ecXxEnMeVNuBf+RgyP6Q/6MJ
         vc3nCqfOMmLJrzWLwsm0w4B/yhh0XFmW5RVGasL2CR2x3+mKUYgwY9Yu2lDqDddVw5BP
         FMoA8UpbDWFrYMDxUNnVvNY6aqGkEcAJtnXmxMIJuv86xsel+hZzy29xbQmyDj1nkd0x
         z4ZYz1GrwUjVGfmNDR+KoVn5Po8VQTRFFMmtI1dX1D8Q1sbUg+rZnqgzE4jp11KJeqq0
         01MmQXYAsAmqp7xtsB6lRliyDShwJ7lk4MnDLe7fcUYN+oSOqJycxLiMZnHqD01p0Qcx
         vZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q5YUbd2+ktiW/f8uLGj/tW/VEikJIDD2esj1p6/7Tyg=;
        b=NzBob6vVVN5B00MVKAd25tYXPhoZZWUfynWhSBEzPRh5z/bG7oBoY1b4W7EsqjSCh4
         EzamU9aMr+xgOGC1Yb50VyV+Ucy1WM9Jo7Z76O/QgwYRf6ZN6PGW0aMvCrJ1qEn0dFk5
         XyWf2pqOBhZ7qA19+QkE5tRmdH8qz6o42hezMfSe90osblgsSeul7DeipUnmH8yIq2g7
         zrC2JE08PyXzG97mTS2LquvXu7KCUpJ4wP2MerkrE/7iwqxWXAWF5EHSZ/quSny7jk6J
         lNeytfjw9NGEiSWHzG+eU15hleZbsym6QOj5e5+BqFh/zMUzpLnQ+Ntt4LJHQgqA+YfG
         qtLw==
X-Gm-Message-State: AOAM530ms79wJ8qpWX5DoIZot8jVehZ9tcStwYpUTXYD71rOEIqP6FC/
        aYxxlPQTMW9krx6syrh5nVHDNQ==
X-Google-Smtp-Source: ABdhPJzXddKC/SmxPJjo4Y5FSdIZQScGfXHEzx6QejR/QtkhsA9z3ULeP28U0QzQxUUZibd77TLmHQ==
X-Received: by 2002:a4a:984b:: with SMTP id z11mr10806492ooi.76.1632526196514;
        Fri, 24 Sep 2021 16:29:56 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v186sm2650721oig.52.2021.09.24.16.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 16:29:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sc7180: Base homestar's power coefficients in reality
Date:   Fri, 24 Sep 2021 18:29:55 -0500
Message-Id: <163252618608.1222081.16557559424550487986.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210923081352.1.I2a2ee0ac428a63927324d65022929565aa7d8361@changeid>
References: <20210923081352.1.I2a2ee0ac428a63927324d65022929565aa7d8361@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Sep 2021 08:14:04 -0700, Douglas Anderson wrote:
> The commit 82ea7d411d43 ("arm64: dts: qcom: sc7180: Base dynamic CPU
> power coefficients in reality") and the commit be0416a3f917 ("arm64:
> dts: qcom: Add sc7180-trogdor-homestar") passed each other in the
> tubes that make up the Internet. Despite the fact the patches didn't
> cause a merge conflict, they need to account for each other. Do that.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7180: Base homestar's power coefficients in reality
      commit: be4c096e6ba7728f4a1ead1de820d75436aedbd9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
