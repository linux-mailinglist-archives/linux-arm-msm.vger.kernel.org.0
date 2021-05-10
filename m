Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38F93792BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 17:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236092AbhEJPcO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 11:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbhEJPb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 11:31:57 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1ECDC06129E;
        Mon, 10 May 2021 08:26:19 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id c3so16063647oic.8;
        Mon, 10 May 2021 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PKb19RbJtddT9ixiaDJEd8lwiTEBJP0932RguN39+5w=;
        b=DN5VlvIzv2g9pN3rZ3NKCDlekbYySLhe/345TmwLE6f4Ue27NTu9IBhPFBLr9IaIdp
         z4Zv7LzGdz4jlFYWm6fMGoZ7E8Bp7Q3gbA4NwITHmOGmb7bVjIZUqOoW/h4sy9iC3WJ6
         z4zxnILaTCBvcRn04n77bWpzO+pJ5J4xvbALUbLoo25WVLrHdyXePrAUj/P2A4bQ1Nzj
         nfzvdu2lN5xCZZmVkEk2fCzh8oWxvjprHyhXUtYiso/TnUJ3t9USHJHvbzc3Q9goIYH1
         lkfU6sVWEMBZWptG8R/usnz+NxOg3E5m9FubEpR09knIBMHcF7pUvZBANGlZPst+vOCo
         /yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PKb19RbJtddT9ixiaDJEd8lwiTEBJP0932RguN39+5w=;
        b=CgTrWoanLHlcoSaiYHdMii1FWodziO9GWkvIKrSThfYBOcehiy6nO6421QDQQfbrok
         o9M6T1TvVM3H5zDhsJPz+JQKCQp32As8MDqtwDZBo7cmDB6fartfL1MhcAToxK0IpddV
         D7IKrA8wMZoJLkKzWkPzTUU+dwL4fmBGaXMlfCh4dIHPZADmF4ZkJVuSfgnIXEcCfXze
         a9eeUcOlH8zZAJctJxCfq+cOlffG8udS2UdnCV6u8Qzq5HLydLeJRCU4yKSzWoUrOg7p
         wT311xFRgTWOitXW7gTyJnbgShCNhQdH5pnVaW85jVmviMNNCDWlZSqbkV01XgkMG09P
         uxOQ==
X-Gm-Message-State: AOAM5322P7Yqh5lLYMblMt/xkpa5W3nqAen1/A+A0pfDpKcSu5g+V68d
        KyymAvjWWG2V92l7H95FebLb+nzK7Jqvpj+btTo=
X-Google-Smtp-Source: ABdhPJzCSRFYLLVUuC5sQQX2WXHyV1S5ZaJ9vjN9QEEuHySuJRNPNM6lWwqjm5FEw2QcIvsAelWNDKhsqEnDR1wI5ls=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr24901330oif.5.1620660379373;
 Mon, 10 May 2021 08:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210508195641.397198-3-robdclark@gmail.com> <20210509153842.124974-1-Houdek.Ryan@fex-emu.org>
In-Reply-To: <20210509153842.124974-1-Houdek.Ryan@fex-emu.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 10 May 2021 11:26:08 -0400
Message-ID: <CADnq5_OYRP5EE3GOdY6HyTcJuLxXw5V7X9fTTw+QMrKs6cjcvw@mail.gmail.com>
Subject: Re: Tested
To:     houdek.ryan@fex-emu.org
Cc:     Rob Clark <robdclark@gmail.com>, robdclark@chromium.org,
        Dave Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        yaohongbo@huawei.com, LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, swboyd@chromium.org,
        Sean Paul <sean@poorly.run>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorry, what patch are you referring to?

Alex

On Mon, May 10, 2021 at 4:04 AM <houdek.ryan@fex-emu.org> wrote:
>
> I have tested this on my end and it resolves the 120hz problem.
>
> Tested-By: Ryan Houdek <Houdek.Ryan@fex-emu.org>
