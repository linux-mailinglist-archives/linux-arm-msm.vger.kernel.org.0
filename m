Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25BA3D0871
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 07:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbhGUFCn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 01:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbhGUFCf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 01:02:35 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA250C061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:43:07 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id u11so1766552oiv.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hf6xnyfDVscdnIm8e7vP+O/z70LiWfZSeXYc2Hpl7+w=;
        b=E4800xZKn+NlHsQnmsuVG/meEmTucGlq57gF16OMqcSd0n/WDSZI8WYMQlLDYud2c1
         UksJe1i6LAR0beBLUSWnB5wf6wGMss2ET70L3tJdVp3fy97KNRxmvxLbYrhW15SE21WZ
         QxMBzZyP0628qUAMQAeGRAXdBPxyvpwEY8rHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hf6xnyfDVscdnIm8e7vP+O/z70LiWfZSeXYc2Hpl7+w=;
        b=popl8zBtIJTd7Z6jkwMx4V7wY+iRsVLEOTF8Lv2+0sWozSqX/lPDhP4sdb+2CNsmGC
         cQy3YfaIWxPtsUMBphFbmJv8iY4DBGv2AK3efrkywVhgv7b5BPH/vpyJxg5L5y1jgfBq
         I3K0TANso/uUjwXhF1HQtFfyuTYpLgs6tSCmdWfssuK3mrg0b1WLzEUlBLegIlXRJXqx
         iaHYKmZDO+4wGqy14AN3ubrhx1bVzR9NlI+ioyH3lbKITz7TS22habc9i3QLFDcfazV7
         Zgww+ym1aAZua3TeXtHhp28EyPOWHfjwLhk4Udb3dKXvT+vfShein/6w5PbEk/w2Cb9u
         EjjQ==
X-Gm-Message-State: AOAM532AZ2C6wx9LztHpf/xvaMEaKE6nF8v2ryiKhBlUbSuGj9XTmt8A
        CoWXn8lmdWHvVBiWDVVEmLbViVgyxhhvept6ZNfOxQ==
X-Google-Smtp-Source: ABdhPJyhZM62w2HxLyrWYJERIKW0NCE7R9SVmmZHO4rQTZuOycq38dOFGmHxqXcA6yNvQkyQaqSc8x7Mz3BzfO4EovI=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr1525356oib.166.1626846187144;
 Tue, 20 Jul 2021 22:43:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:43:06 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-8-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-8-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:43:06 +0000
Message-ID: <CAE-0n53We+CzBFpzdN7pGgrjqeALmJO4dgHVtc0JVQw+Jw+u+g@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sc7280: Add/Delete/Update
 reserved memory nodes
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-07-20 03:12:57)
> Add, delete and update platform specific reserved memory nodes.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
