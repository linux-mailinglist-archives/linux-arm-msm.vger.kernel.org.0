Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21383271B36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 09:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgIUHCb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 03:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgIUHCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 03:02:31 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E82C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 00:02:31 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id u21so16198316eja.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Xss9c11p8bBmXKV+u1JKfgT0yo2Puvq1LzLJon8FQc=;
        b=r+PipTUq1b+cWxzWdj8ctE37KVVoRKKTlAGfH+WYlEUV4dQ+8xWL+Jk3REr7eojnxm
         KiilYAWOjXIrixf3i7YlYs91J5t67wLHoFZfXUJRdAgp81XXxVqHgm0E0p5N9ziP+XwT
         NRxVd91YJQVerIVmNvg/gOqKR+SMgtWs1yfnQn0wAmT1B2SboIYI6/pp6Hl4jLrwYFaI
         +4tCfZlSWlaK2drf6MxYrH/xzJ/eTzIS09FUJGHlqiSSA/IEoVvoJBotGhf3sOHy7NKy
         oqm9neBc/cf0oeVhzCEs/8IUhl1SAXC2WMe03lOfV9EnnukairSuzrxRn4rd6ox/rx7n
         Ge0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Xss9c11p8bBmXKV+u1JKfgT0yo2Puvq1LzLJon8FQc=;
        b=bucNYe2STsCVhup2owD18I7Rlk7EFebnnuLKxpj0yO6PbvOIU4+nZHS44pnYh1pfwp
         u8uFJcKzjgv0pGb5/7micpxErUvJOdycCOou/vj5ux9HdaGnL8MflQpbTJnGyUs9JSGq
         TpkrG8sNnMKR4qQn8ZYCBldGi2x0/No/mYrXqCMeF+8AmAi6z5GAyaB/IRmENybtRGz3
         mYbhprOqIqPp2r35LjiPI35WBhBiM6JOjCS9gu5uZP+IvpgDiuJe7HFy/yWM7NmwFkht
         62KtiKdR8RglPniEEHQ30Br/sOSDUuUyidEXNh2NzxP7NjLNdZnTQ8lsDwbYqaljkwbI
         qv1Q==
X-Gm-Message-State: AOAM533ifGKhFxWUwnKMe3+ognKTe0jaHOJxf4G25V1arGmimagF/OX7
        Y+HxNlJSsSf0XdQ2lAR/15gyf9UwEV5L8Vy1lRKrEA==
X-Google-Smtp-Source: ABdhPJzDkxa18iXpBT+DXdSntUtWFnIzGNDW6XrdJtcesI8TpoWFYuOMPmfc8vxJ5XI82CR/RTs/mdYPYx0wf1xub8w=
X-Received: by 2002:a17:906:724b:: with SMTP id n11mr48947047ejk.328.1600671749742;
 Mon, 21 Sep 2020 00:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <1600424219-6674-1-git-send-email-loic.poulain@linaro.org> <E1056EBC-1EC3-44F1-A0E8-28C7627E0074@linaro.org>
In-Reply-To: <E1056EBC-1EC3-44F1-A0E8-28C7627E0074@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 21 Sep 2020 09:07:45 +0200
Message-ID: <CAMZdPi_XEALysyXDtOH3vd1hwAhf0ntrWEU2nxEY5VCXJhtziA@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Remove auto-start option
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 19 Sep 2020 at 13:27, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hi Loic,
>
> On 18 September 2020 3:46:59 PM IST, Loic Poulain <loic.poulain@linaro.org> wrote:
> >There is really no point having an auto-start for channels.
> >This is confusing for the device drivers, some have to enable the
> >channels, others don't have... and waste resources (e.g. pre allocated
> >buffers) that may never be used.
> >
> >This is really up to the MHI device(channel) driver to manage the state
> >of its channels.
> >
> >Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>
> The patch content looks good but you should split the qrtr change to a separate patch. I can't queue the networking change through mhi tree.

Ok going to split that.

Thanks,
Loic
