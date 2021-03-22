Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E60E0343D89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 11:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhCVKM1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 06:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbhCVKMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 06:12:21 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A34BC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 03:12:21 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id j7so11849850qtx.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 03:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+QsdQNn2B2kiESOyuIxExVIMJAPoMZsfZxGW7eBGps=;
        b=VPAD+tfOdONIolCc6FSoAzupF71767JDnGba2LOXuvdrr5FGJ6Yp8lk5ZcDR9xHoF6
         XX9QTi2j1AYC5GzVsg8k3olZpZvmOzRhLCPMnomfobP1ez4sJucCVePAy1OmceyJFUfm
         G9y4tVRyGru4X1z7YLQKcQkdtr0gl2n9Ws8GBEw0rmt7c3MUMhaGqg39vSzyuik9T4ch
         S2YpXfeIHYDnUQfJkB3ivB3iwEX6WIaKCGiCfRfGlBWt2AjZhEmu+sVk6ca4JFrd5XoM
         yQLH1Pj9ZupSsILm9TKRtKP2fgkYQBXTV4NP3Hvl+xKbf1pHJvT93BxvP9qRFa/Uc179
         6yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+QsdQNn2B2kiESOyuIxExVIMJAPoMZsfZxGW7eBGps=;
        b=DTFhcxg+no2dA7f+C8dlmtoje6+Xv/JsM5S3Sw8LtMU6ZyqgpB0NF7xdDrA28TPta7
         7XhbrNDjcKJeky0Y+ASsBhfMA2Z1qGbAygVBKcckqjCnNnX/w2AbRMxVlkLRPUuAH4wT
         Z+K4/Qi2emnSP6PESFjw/Z8s40t32od/Vu+KlA9MPx2ZQiE9UtYsBBr50say4c302Z0A
         JvpMSG7622BLOU4+0EQvcGtcAAVXA5YijENPuPlkNHueLc6L3XOd4P8k+Jqjehz3ItYi
         p3SQHp5P6jVX6WOuJm5NteXIMsu1I2vSAe37/ImX/+Oo+XkhDdYE5S+V3nSxKjeYApsu
         Rjtw==
X-Gm-Message-State: AOAM53072ANWtm/i/0zN5JcBsX2vW2JzDz+Y5CC3OtPs8bpm7af2ALt5
        Fta7JyXdgcQilh6AvxsMjCeC9EaIhNlD3uWmWDVUaQ==
X-Google-Smtp-Source: ABdhPJx1AQb1oUdzdK2w2rNiyUv2k9lWEkPEf8c5bnagcjUYYrp7KNc2xIGRL3p2NgqT7UUKfybvWPIGQAmFn6IwrWA=
X-Received: by 2002:aed:2ee7:: with SMTP id k94mr8679480qtd.135.1616407940343;
 Mon, 22 Mar 2021 03:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
 <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com>
 <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com> <CAOMZO5A7wgKUMGjjG-w89EPQ1h0+aWFOpUPbDvGGeVL3Z6dm3w@mail.gmail.com>
In-Reply-To: <CAOMZO5A7wgKUMGjjG-w89EPQ1h0+aWFOpUPbDvGGeVL3Z6dm3w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 22 Mar 2021 13:12:09 +0300
Message-ID: <CAA8EJprRCgXyqYiJBWz+q1jbwYbg8m2v=40kmB9ChgOJvaF9Cg@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 19 Mar 2021 at 19:25, Fabio Estevam <festevam@gmail.com> wrote:
>
> On Fri, Mar 19, 2021 at 12:13 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> > Thanks for the feedback.
> > I will follow the same approach for fixing the suspend/resume path then.
> >
> > Let me test it and then I will re-submit Dmitry's patch and the one
> > for suspend/resume as part of a patch series.
>
> This approach works here for the suspend/resume path too.
>
> I have just submitted the series, thanks.

Thank you!

-- 
With best wishes
Dmitry
