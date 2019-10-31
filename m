Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10E73EABFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 09:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfJaI6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 04:58:49 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34910 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfJaI6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 04:58:49 -0400
Received: by mail-wr1-f68.google.com with SMTP id l10so5307973wrb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mM5JWFj5/j1kMfO0LYYDWqFAXV7BHBUBoAurAtsh+vs=;
        b=sjxcXNY1tNdgNLsdckLy5C5ghG1YOXnEJggZIwKLSbYHASKZ0ONzEsR8o2/z4bNoP3
         9Teai83oT5ZDna4z6Nt0jrz+QGFloBaBOr4xleRjnZCXPGaTaASxPAEgS3gkaR4UOUim
         HgufBrfwRfalglmkFZFdGS+v8blf8XzFfWvbg9zbnzix7ZdBQFQZj8/iK8td64QFmIqn
         YUWxnRz3USDGpylVcwrFMAUKt2ahxOCdzQnhRrLOxA2Bslx3GIlT//nu0z++uJRYxUWL
         Lb79ddtanLSnRnJjuVuxNA8I6VQTpjKBrL1O9ccy+PzpYaOgjKdplScT4ZxBNKagFyia
         PUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mM5JWFj5/j1kMfO0LYYDWqFAXV7BHBUBoAurAtsh+vs=;
        b=sQ8EvQf6RQG13JFg68PAiSoIdAphQL2Ss32AnZQGmlC6smkUH0scnwC6w6WOwxGN25
         XvoUAtOYzEtYrK/kghq/IKsYoV7XcsCug2fQ7aErCoJYazxkExiE2LPRCJiblqS+Z/Ii
         HAbZ8s/KzhCJSs8K056Jf3sIdvCN6RmlagLr5988Ps8KuCC4vnTp0D4fxmMJOD7Z65k3
         iC4L26j54GsVw1VGbDm8NIsw9o2C0XR15LR6re2vgKtMHJTBQ1dq/ttd8p9pq0JZxIL3
         xDI/i6HogbMHfLJlN+6pPTQNoos9eJvLso3kSLRNxYpeD+idEC7Nu8ATzUSn4n5Tu8jR
         38Gg==
X-Gm-Message-State: APjAAAW/gek1cjBx/Vz/YSb7raV3A5L/J8pOv+oUPLx73gVMq/VncRGj
        Pf+Eyp2NYwZneRvNnjkFMIfRxGHMD5Y=
X-Google-Smtp-Source: APXvYqxdn+1tmOLx8ifp3F1PxxrO/zj4IhisAc9DnkIGdD19EJUgI1oKHtPcrdKzBLR3SbDRmKd/OA==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr4389080wrj.284.1572512327362;
        Thu, 31 Oct 2019 01:58:47 -0700 (PDT)
Received: from dell ([2.31.163.64])
        by smtp.gmail.com with ESMTPSA id a206sm3494167wmf.15.2019.10.31.01.58.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 01:58:46 -0700 (PDT)
Date:   Thu, 31 Oct 2019 08:58:45 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V9 1/6] backlight: qcom-wled: Add new properties for
 PMI8998.
Message-ID: <20191031085845.GA5700@dell>
References: <1571814423-6535-1-git-send-email-kgunda@codeaurora.org>
 <1571814423-6535-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1571814423-6535-2-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 23 Oct 2019, Kiran Gunda wrote:

> Update the bindings with the new properties used for
> PMI8998.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 74 ++++++++++++++++++----
>  1 file changed, 63 insertions(+), 11 deletions(-)

This patch no longer applies.

It looks like you dropped the rename patch.

Please rebase all of the patches in this set on top of a released
commit and resend.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
