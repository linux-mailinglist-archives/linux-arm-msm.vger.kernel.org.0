Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 042853421D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 17:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhCSQZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 12:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhCSQZK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 12:25:10 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B822C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 09:25:10 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z8so12651759ljm.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 09:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yCCM8CQ1dvYbSyF1A8EHUz19x9S3I8O51vY5/vvcKrY=;
        b=LPbOR+wXdoYdBIv2JmdGiIkS436gn955TAYmRFFGSbZwQDMkyjSApzADHpLw6TE4xp
         0XJZZY/3wq3yR4XseZJQsPppjhOgLKBEj992Icq5W5cIugsCAK4ajqCvp0VhmcTLq17F
         DJPYgGr9+AwjvqgeOEHe3gp4kljZFMQMy4sVGpJ8SyEqmxzG9OZ5w21ESq0Di9jFMlcs
         ox8MNcE3/k3SrejODu3kOarryEf6ye5hCrzvCH3JuhGgvL3dw1wMSZAWwu1KtLpVPtS4
         H9i+zPaXADnA/QkCZT3/rd8vfTxBd61VrGJHYInzYOcbAdJCK14AuRCaC5xuuZM9kbRj
         tEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yCCM8CQ1dvYbSyF1A8EHUz19x9S3I8O51vY5/vvcKrY=;
        b=PCPdACNTwIWstmkg1ahwOb7GXbRRxvJcRmyfXdIzVpi3RLgfkFRTbul6XvTT/MXyEf
         8CXlilCN+X5nqEEwSKsLeSI+wKkRwcpwvYSD/Xl2iatl5QPxmXFdb3UinjXcFsHzR/or
         HIhFlui82nIDiacKVJ7G0Cb5Kpf48/tknd2R08iGPrIPjm313+etlTDiVsD+4IiF84mm
         ftVuz974kS5O2/VAjAnqaHqUOXswPvdBtBXcT8KlnSB6hwhkxLEox6t8x8vLqD+yFq1m
         tTk1kjx8fPjS6GR/kqUVuJRyaV71PV8UgHRm47paRFFODxctZ0hA4DarlZTFFpLiV/Xw
         a8QQ==
X-Gm-Message-State: AOAM5327cuOVGl+91nFj35NXYn38QGnu7BbdXLnAEoB0rd9VlT0Zdig3
        HCRy3FXwbIw8a2vFSWVi+9bBMWkJ0QgH3zRq7hA=
X-Google-Smtp-Source: ABdhPJxBGOgZX+y25IYwJRCofcYgJ1nsbcuBORQ6uKQ5uORlyrNsTwta/NrVMVP8TixVEj6cUx8Xdfxh5AfwdJN5iwM=
X-Received: by 2002:a2e:87c6:: with SMTP id v6mr1425827ljj.490.1616171107531;
 Fri, 19 Mar 2021 09:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
 <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com> <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
In-Reply-To: <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 19 Mar 2021 13:24:55 -0300
Message-ID: <CAOMZO5A7wgKUMGjjG-w89EPQ1h0+aWFOpUPbDvGGeVL3Z6dm3w@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
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

On Fri, Mar 19, 2021 at 12:13 PM Fabio Estevam <festevam@gmail.com> wrote:

> Thanks for the feedback.
> I will follow the same approach for fixing the suspend/resume path then.
>
> Let me test it and then I will re-submit Dmitry's patch and the one
> for suspend/resume as part of a patch series.

This approach works here for the suspend/resume path too.

I have just submitted the series, thanks.
