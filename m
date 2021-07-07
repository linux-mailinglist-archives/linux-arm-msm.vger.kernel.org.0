Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9973BF23F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 00:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhGGWvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 18:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhGGWuy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 18:50:54 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C16C061760
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 15:48:12 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so3959233otl.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 15:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=TlJ0F5dHSC5zR5+dmIIRirAimmk6emojztfdcHPFyhM=;
        b=iMgiT/t2DG9+L36g6Z700bppQIeVqoM9zkbhhy9SIfRX4frPRyU+ouQTFXMl2R0sPJ
         LgFhnvvMRiiZj8S2wa4NJ8Vz/mvohesUF9FmRmrKoQBLP8NAEICnfegtJAZyEZci1MnR
         YXNnhH4XnQ6qFU9A6Nak7+ldW82JmnVqr9Ne0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=TlJ0F5dHSC5zR5+dmIIRirAimmk6emojztfdcHPFyhM=;
        b=ZCrPBNVRMR8CJo3kE0Y3RcjVGympEie51Fa9Aybpoo9KrDr3TESIRLt6j4BdG+V7/K
         OHfFdidG5fIJ9h0tR0Ul1W5APGebDVhAFIqo8UVbu9D901nX+lq/vOnpCnbibnnjmLxg
         zD5tmRMKvDARY4xdblDw/ZnYlwin+CY9MfP/V8HR8q1DNk+rtnyko+3MKfBv7Tcnztqe
         T0yi4AjyW7w+cIfPBUYrH0ojDVX+oB2mMKieEbLkd6cmJ2AcBJOQx3yUiZQJSYZqaUnq
         BuEmGXYaypTRVDwvJPX07AAkUOYPETaCdFRVp46NTU0Ckg+oJWAJyPyAFU8jfopafLkt
         QMNw==
X-Gm-Message-State: AOAM530GMlQQSeOPctMEJ2I+Pap81lpQJEDD8bbKuZG9zTHe7wQbfpnz
        Zr8H8Ky2iNhwzjT0lMGn8oZ6rsP//h53/YLr/4LMRA==
X-Google-Smtp-Source: ABdhPJyK2J6zY8vd+mAvTD6S4Q34neALxBbIk2xo/Gd2aFsHatAbSL4Frt0t2jEEBoiHqPWNmkE4CS05ggxrMn4Vy0o=
X-Received: by 2002:a9d:2781:: with SMTP id c1mr20809050otb.34.1625698092020;
 Wed, 07 Jul 2021 15:48:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Jul 2021 22:48:11 +0000
MIME-Version: 1.0
In-Reply-To: <20210707074517.2775-1-thunder.leizhen@huawei.com>
References: <20210707074517.2775-1-thunder.leizhen@huawei.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 7 Jul 2021 22:48:11 +0000
Message-ID: <CAE-0n51C__Lbi8uYU0QmnU5KUPRskL8NujzgrSE9nhdu8T-6EQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] media: venus: hfi: fix return value check in sys_get_prop_image_version()
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Zhen Lei (2021-07-07 00:45:17)
> In case of error, the function qcom_smem_get() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
>
> Fixes: d566e78dd6af ("media: venus : hfi: add venus image info into smem")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
