Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1292C81AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 11:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgK3KFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 05:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgK3KFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 05:05:32 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9850C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 02:04:46 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id s2so6193530plr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 02:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=chUEKP3lAkDvoo08xOfrjX9mj/4TfY5yLETdKR/DXWs=;
        b=CvJBvMLu3wwI+8egJ2dfdsC7XoOYIUnSLC917QUmTm5epGfc8fP/XrvewYWBO+SWln
         POnwwHsbmd7lX84MSwjxEL0udar/yfYuluCPr1euoETVo/hlKOXE6SSikUc32VUOBtH7
         jD7pJ4b8N3nH3PqTBu2hhGZchuJb0NQcaAGfSqS4s7AOlHs6Abt4WYuEwNtPAxADaDPx
         MfEsDMBP3z+HHG5Yl8upLOYTL1cZIxN2vPXVsEKjYaRROUi1XmnFQg3C95YbxedV2v3b
         8PuRYon6HGURU+EhlPnfQmUVVnLhizlAXJOk8mMZ3nQUyUfXIX6SGO2fh1mu7GJnWo+Q
         S7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=chUEKP3lAkDvoo08xOfrjX9mj/4TfY5yLETdKR/DXWs=;
        b=R1DkAjJpeNlc3WIohT5fxGl0WhF1QICub6yR5lKFb5V4ijtVURxUna4dLNKEESdiAy
         1EjNw/SrteTOKuPyRxpLiBpuC+nMMM+GKRLb2/pcwmWUmIayiFjuoI2QZ/T/awn/Fvok
         ZPE1kMoB1QGCGyMNWVU0tGhv795aDLGL12VnOxIOOWMpFNR0SdLmkSOZ0GfxvAn+qaNm
         nfM8aD4TOLS2a/V6vuVS4LWnaTbBtxr5vFBJQAqvUB0/8UtvKuriwdmlQonOq8ciS+uu
         W6MSGx2b0sPvipqHkhM8CYDOa0IayY3/YKS9anDZXLMK7zwFBj+YDtiNVWtP+V2+zAuY
         FK3Q==
X-Gm-Message-State: AOAM531UKOYiWYOh9EmjncXi3V1lsBNqx3eC7E6VUliqXRtb1ad+uFT+
        3SRe2aXyu9w2F3gs2ncKQS0wsfZIQCGJOZTQ7oHjjA==
X-Google-Smtp-Source: ABdhPJwjT3KLZ8MjqpX6jkrc+yfsk2K1yyK/3d49Lx4KIkvCECZ5JOnGdyG2K5g5JoyR86IHf8u0pObP/PV1bjLVsLs=
X-Received: by 2002:a17:902:9a8e:b029:d8:d989:4f80 with SMTP id
 w14-20020a1709029a8eb02900d8d9894f80mr18231450plp.32.1606730686412; Mon, 30
 Nov 2020 02:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20201127133937.93208-1-robert.foss@linaro.org> <20201127160602.GA3096@thinkpad>
In-Reply-To: <20201127160602.GA3096@thinkpad>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 30 Nov 2020 11:04:35 +0100
Message-ID: <CAG3jFytoB36hpx4pOf-kn+RNfyQRJosQVeDfLsKqU+u5mr0j_Q@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: qcom: Fix IRQ error misassignement
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, wsa@kernel.org,
        Todor Tomov <todor.too@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Nov 2020 at 17:06, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Fri, Nov 27, 2020 at 02:39:37PM +0100, Robert Foss wrote:
> > During cci_isr() errors read from register fields belonging to
> > i2c master1 are currently assigned to the status field belonging to
> > i2c master0. This patch corrects this error, and always assigns
> > master1 errors to the status field of master1.
> >
> > Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> >
>
> You don't need a new line here.

Ack

>
> > Reported-by: Loic Poulain <loic.poulain@linaro.org>
> > Suggested-by: Loic Poulain <loic.poulain@linaro.org>
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks for the review!
