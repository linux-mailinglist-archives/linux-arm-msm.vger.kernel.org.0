Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E642934552A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 02:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhCWBzX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 21:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhCWByv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 21:54:51 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA60C061574;
        Mon, 22 Mar 2021 18:54:50 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e9so19110681wrw.10;
        Mon, 22 Mar 2021 18:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y6kHhDqex1SsXfv+a9vGItXQc8cTJtK09N7Ycugrx0A=;
        b=AGnsZG7v8ZQN4wrf+x88MnVVF27VSEBSsTbTyz9kRn9dkyDbY252e9aOnIEyhgcshO
         1mS6WaoW6Y8GFgyvxfBnm0G6rZCJhzhfw44+Fm4gCPH07So2oKhMMT7PC9lAHPT3s6C0
         fpRdCfgK9+YZedOaGXRWhyIFo+IQKpRjUXrsWY7m8jwFhIMT0O8od097BQ0Ir3FsZyMp
         cdP6epLhx88/YsFVfridrXTncgfGl2mUgx73Um8qtnWFFlR3I9A1BYz5KWREkzsfz3Id
         2GVLSJHGiQticjF2DNf0HmPqN+zqLuj/kKBLoFDYYT4xZ6UU7Os5GYqWUu/gRREpuRiu
         AOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y6kHhDqex1SsXfv+a9vGItXQc8cTJtK09N7Ycugrx0A=;
        b=tvSfAt7AHf3XROmr51pi8MfH0CavqvLrCWP2d1W+NIh3Gvw3fQP8B4N0il9c3loXrS
         P/X3vDKWZCKyjz3OBpuW2PHlbIbIR8Sfm+I7KlYAEqeuUOilxdZkPd9xwmkRfMqkHBr4
         U5KITMUsghxqagFQbrAsqpj1VU76Ct+IZ/jpgFiLIPayMD5JweVaQ3CcpK7u00kQ0hcr
         5HFruHzNkEslUeZ9NxVUW4cQ+4CpgZdyuUWGHhblnXDPmlErp0ARgD42UWsx01CxvOQ5
         yPy+dMUthLaqoBpLsQiqM5qCcV+foxTfeRt6qewQfKqk3Ah1GLQ3BQtwzJTAN1utXXBQ
         4zlA==
X-Gm-Message-State: AOAM532cx5sd4sDbuwL35Ti2vSUqKn8GtB+vpVqF8omtrQJXra9xvGZG
        ARUWKOKBwk+BoGPzZUXOGllUZ/gm6DO9awAMuMY=
X-Google-Smtp-Source: ABdhPJw4B2u3R2fdqQZBeZ0j8MaOwUzUX6lJF7RGtQiYESsOZ3iClSdFOM/g/oIrWV9NpPoO6xUEEzrgTo0pF8/EEb4=
X-Received: by 2002:adf:f587:: with SMTP id f7mr1304735wro.147.1616464489599;
 Mon, 22 Mar 2021 18:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <1616404632-13693-1-git-send-email-kalyan_t@codeaurora.org> <YFk6AINTcg2S6vDe@google.com>
In-Reply-To: <YFk6AINTcg2S6vDe@google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 22 Mar 2021 18:58:01 -0700
Message-ID: <CAF6AEGtkMD19ZFbs7TxQ6wVn-DMgHQbpDokwRvkL1wTgqMK2ZA@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: icc path needs to be set before dpu
 runtime resume
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>, y@qualcomm.com,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Kalyan Thota <kalyant@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>, hywu@google.com,
        midean@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 22, 2021 at 5:44 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Mon, Mar 22, 2021 at 02:17:12AM -0700, Kalyan Thota wrote:
> > From: Kalyan Thota <kalyant@codeaurora.org>
> >
> > DPU runtime resume will request for a min vote on the AXI bus as
> > it is a necessary step before turning ON the AXI clock.
> >
> > The change does below
> > 1) Move the icc path set before requesting runtime get_sync.
> > 2) remove the dependency of hw catalog for min ib vote
> > as it is initialized at a later point.
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Confirmed that this fixes a bunch of warnings at boot on SC7180 when
> (out-of-tree) camera support is enabled:
>
>   [    1.832228] gcc_disp_hf_axi_clk status stuck at 'off'
>   [    2.118292] gcc_disp_hf_axi_clk status stuck at 'off'
>   [    2.442383] gcc_disp_hf_axi_clk already disabled
>   [    2.750054] gcc_disp_hf_axi_clk already unprepared
>   [    3.154835] gcc_disp_hf_axi_clk already disabled
>   [    3.421835] gcc_disp_hf_axi_clk already unprepared
>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>

thanks for testing on the setup which had this issue.. I've pushed to msm-next

BR,
-R
