Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27A030104B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 23:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbhAVWsc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 17:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728828AbhAVWsI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 17:48:08 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D458C061786
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 14:47:18 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p21so4656324lfu.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 14:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l8DBo+3az7BAKGR0xK3FPrRAWSUVaBrNe0KbRRSshgI=;
        b=jn7yOch4Fm8cZ2ofEq9dNtc+Rrjb/gsS32vANzZkx8faLtTk0rs7KSQZVdOVHWINKl
         IkUxGPY9esiJIBt5M9eByLUX+bVrxkorgHQzmGMNSUrOTwgzPwzTshn/f2HPKjjZtTAO
         pHTAXoOjaCKLuMvWPjcpA2B1P8rtuJQMQ/uzny2AxiSRCELNcRmsD1v+/9Tq9xjgic2R
         bjqSyh7sraS4bUbjaxRF8KX7erKeMag6BRc9Rv0R9Z0RZiibS4w7b4RttsmWtHyhPeJY
         vwXK7ucwxIOUVp7VoI7A63R2WloENMMKnW5AkJdoQfm7gfGdGyrShtLqbZKxeu8qbD1Y
         WuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l8DBo+3az7BAKGR0xK3FPrRAWSUVaBrNe0KbRRSshgI=;
        b=QYenw7YktL5QM6CLXZIkwQAPUIeM39JpYI3YAeIHKbNUiwoTY/XLNhKWaVbsMOq37J
         nc0LtJ/kM33tFxtHasQhicrArLuZ7HC8TeQ3pB4Ml07JhGq6J07hj9+YxUXcOsfa4cnp
         k8quNisd6Iy3uVjZLODsEP3R+Ec/ZnzMPhFPVMAKbVIzZz/gA6zqHo2X3B98FdR6Kn4g
         4wwyo1NIXhsDQvtdrRfZqmC+XTUNOJ0eKsCHHerxbeengF1OYU/0FG64OyJDw8xu7uIH
         ODv6oCp+p+oDugkPVRi4YMYiVrx+AgMo+Ikgf2JFJzoOotVoOXkJ/lHLZ5vH382Yx70U
         ncwQ==
X-Gm-Message-State: AOAM531mgTFWmClbTh5857c8R0EIJ+Rzs8sO3GXG8okLmkNf6AIM5/W4
        MrXnkCj6EToQBzOrIgAAP1JW0rqJEzJInHQqbNa8yg==
X-Google-Smtp-Source: ABdhPJyeGmS5zVRybraMXDpsOXKNEGknSCi7E8AaXl3185HqRzaBdMfR+yx/INuTHtBt7EVvWimuMUqdH1gc9rmrOdg=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr3360818lfe.29.1611355635977;
 Fri, 22 Jan 2021 14:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20210121114907.109267-1-bianpan2016@163.com>
In-Reply-To: <20210121114907.109267-1-bianpan2016@163.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 23:47:05 +0100
Message-ID: <CACRpkdZzVY=AKFhW-hEmCAHmdMgVF8=hQeE8a8W=2W0h44eQVg@mail.gmail.com>
Subject: Re: [PATCH] bus: qcom: Put child node before return
To:     Pan Bian <bianpan2016@163.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 21, 2021 at 12:49 PM Pan Bian <bianpan2016@163.com> wrote:

> Put child node before return to fix potential reference count leak.
> Generally, the reference count of child is incremented and decremented
> automatically in the macro for_each_available_child_of_node() and should
> be decremented manually if the loop is broken in loop body.
>
> Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
> Signed-off-by: Pan Bian <bianpan2016@163.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please submit this patch for inclusion through the ARM SoC tree.

Yours,
Linus Walleij
