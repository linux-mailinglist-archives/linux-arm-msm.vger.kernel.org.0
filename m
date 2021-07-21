Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127F73D0868
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 07:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhGUE7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 00:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbhGUE7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 00:59:20 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B74C061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:39:57 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id u11so1760840oiv.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=IFdcWR4YA7cLDxn63MzGINn1m+UKeseJHsxYZlWX3KQ=;
        b=aWfsjVPocuLolSMgFBwj57AvMqaxCQsuPSJxXaNVO1E0rVIenk3kEY0Y++tuH1YZ68
         I8DmVy1vY01jGm7UnevYHk3njt8s43rjS0eLc6XTCQ+ik/cuVyMUIzog7UNsGASO8jS/
         LmgjbnIBIg8y4z/rqTcAGVsZjgCZkP2ibz6Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=IFdcWR4YA7cLDxn63MzGINn1m+UKeseJHsxYZlWX3KQ=;
        b=CX4Y3zUWaQsBEh4MK+ekdP1gSTLnpDarFEcI/xiUx1VVfyYAAbg63sKjrOzV0NlIj2
         tSByHU0zLtrQxGZl9KRzWXuVS19sck997XKZkGN/JkWWUcjdCsq6DN+prjAEIw01h2y6
         lKZPYGLqthcZ8SElyA8ra393xsG1CrL5x7JF5Dzytc5Bo6TP72LAZI1pnPJuCp6FgIgz
         L7KQg526sQzKYwI8GQvN5y0mGyKFymxa148xFKu/B84XyVpZqYmVoVPwVyCkJ4YI+MyA
         5VNI4i6ETedYB5tOnWdk+1i+nxCgFhDW4HcKVjyKr3Nywk73qb/eKc7WbQGf2SwTzNAw
         cZbQ==
X-Gm-Message-State: AOAM530xsptOMt967l3wTk/wGdpMbNQWByMbDw9xctxn8DxNa7hzdQme
        g6X7n/1nbgPy464X6vWNoNI6CwlONqyXNueasvLGag==
X-Google-Smtp-Source: ABdhPJwmGOK4KV4ieXmIBCwoxkcL3jMjj6zpveLGftzQ0Nvrj9oanbFoD7AI3J8dOymIsg/TTy4PRIkqTm7VpG6AmGY=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr1520062oib.166.1626845996963;
 Tue, 20 Jul 2021 22:39:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:39:56 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-5-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-5-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:39:56 +0000
Message-ID: <CAE-0n52MHTrMnGFxNJYcBQ=k0qB676wok_gq6=0yL786p27DhQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] iommu/arm-smmu-qcom: Request direct mapping for
 modem device
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

Quoting Sibi Sankar (2021-07-20 03:12:54)
> The SID configuration requirement for Modem on SC7280 is similar to the
> ones found on SC7180/SDM845 SoCs. So, add the SC7280 modem compatible to
> the list to defer the programming of the modem SIDs to the kernel.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
