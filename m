Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6081584A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 22:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgBJVVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 16:21:44 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:37249 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727435AbgBJVVo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 16:21:44 -0500
Received: by mail-vk1-f195.google.com with SMTP id b2so1718954vkk.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 13:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fk9bdz/2mbXx6dTdvB7EEtvMRvBXPbEaBb56NU9MXvk=;
        b=oFCfjcLi6FTB8phhz5e5PNBQQK1bvPyU+YLtRi18QmAAzEqnY924oe7J71K/fOfGTo
         f3gOueqJgdm+vMwJlqJZAnePuZYODm8ZnNni3gHBsL0HBvBbjC8WPRyY4Q5Y++YUloN/
         CR4c3SmRF9iN7SCYbKhjCYcimn+OrtHdACBgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fk9bdz/2mbXx6dTdvB7EEtvMRvBXPbEaBb56NU9MXvk=;
        b=rKGANrDLmG737mD+aJJIQ9cNkrJ/BFhqKMAsWkYhvt8zrfFh443a5wgVJ9gCGh6rkt
         G7j4BfS8UCksjL2jsuJS4kuOi8lfyswqARC19h7yBOEMgZ3HrLqLbRlO9xO3H4SrCHN5
         sHeFktcRm7kVMb4ps3kB74nIEqITBDB2JDOhZUJWGrbuTqIcZQSEfQnrlzIo6KCTYfkU
         0OTD1WgyqCnySiEs3DmCunqrg+6cV/zAho9u6PELQQDhRC+ZoQgHwcW26LwcEcdhjwOP
         EXV9hiY2VgtJnbcVQQUcOdEFlorHD9aAMLXei/xj3KyoB1VrumlOVFsTc9abCZeGHInA
         lazA==
X-Gm-Message-State: APjAAAVfra3xbt4EEqQAORdE0tYg8OECkOKbDofCwXKHYhWFja/ZcqvB
        A23Y/em/fbi7+99CdcwI8CpzcwfpiGA=
X-Google-Smtp-Source: APXvYqyE6QalbpnYndjLSU8VzX6JbqRJ1eNKQSdxwiAOWfz3JBK1svsyQLFpYV1LjIO3EU6bAWkYQw==
X-Received: by 2002:a1f:9d16:: with SMTP id g22mr2246197vke.22.1581369702680;
        Mon, 10 Feb 2020 13:21:42 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 110sm443823uav.18.2020.02.10.13.21.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2020 13:21:41 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id t129so2280381vkg.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 13:21:41 -0800 (PST)
X-Received: by 2002:a1f:ee45:: with SMTP id m66mr2278489vkh.75.1581369701330;
 Mon, 10 Feb 2020 13:21:41 -0800 (PST)
MIME-Version: 1.0
References: <1581320465-15854-1-git-send-email-smasetty@codeaurora.org> <1581320465-15854-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1581320465-15854-2-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 10 Feb 2020 13:21:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VH4954bnD_PzOhFPaYRto5sRVCCuOHgm67=uz5Be_b0Q@mail.gmail.com>
Message-ID: <CAD=FV=VH4954bnD_PzOhFPaYRto5sRVCCuOHgm67=uz5Be_b0Q@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Feb 9, 2020 at 11:41 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

In v4 I added my tags [1].  Please keep them for future patches unless
something major changes.  AKA:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>


> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)

Just to summarize where we are:

* As per my notes in v3 and v4 [1], this can't land until
"mem_iface_clk" is in the bindings.  Please post a patch for this and
reply with a link here so others can follow the disucssion.

* This also can't land until the gpucc bindings change from Taniya
recently [2] lands.

...so we're in limbo waiting for the bindings to be resolved, but
otherwise this patch looks good.


[1] https://lore.kernel.org/r/CAD=FV=UEQ0mOXuDrSZrcJ8g6jb0eLf1Ttn+Mn7T6d2TpCMUcuA@mail.gmail.com
[2] https://lore.kernel.org/r/1581307266-26989-1-git-send-email-tdas@codeaurora.org


-Doug
