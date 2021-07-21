Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05703D086C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 07:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbhGUFBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 01:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbhGUFBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 01:01:34 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D8EC061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:42:11 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id h9so1742768oih.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=yn3SLEtGrnNfwdp8zANxEksIpTaatEzvZGDUvJ5yALU=;
        b=ae5j2EzpGtuXwAbPSvNGt6tgH6AqCaLDqHX2YkL0p8fS+ucDufJO+b6k9ZCdOwSDN2
         aPQc7GSFJPOpL0viYXlquxZPqWUgQdDxt2xmZCWCzWWHBp1ZrIET5OSK4FVA7OBOetWq
         mEJQ7JEcqqBLR8VzyHS3OU86L3DZbd58x2VNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=yn3SLEtGrnNfwdp8zANxEksIpTaatEzvZGDUvJ5yALU=;
        b=in2NrUUdv8GdxcCAi83LGpuwOV5dvVY02ED2DLqxsZe0QOvRm5e2CjP7y+l0x6Jj2E
         /JlJSqhaU/5q/ydl94Ajj5MIGOzqejC9Iplyk1SsRNZsjIqzQrHbemdmX6PPovpIzsT2
         Xn8anZqVjdaiE086ZieNkrmobBWjOgH3ybDY0tkDYkwM604G+VO/Zm3f0+nTouMyhXB0
         VQJ9nreDbO8WgrZB07nBEY8E6yg16JIdHhbA+TUFLJY20CdFyF7J4+arIxDUSvWd/vxK
         4gdT6ZvyP0jT2LL11eo+lG95QQaM6R0Q/F9fLVf3syth6DcAMpxvoVlZafzlDjcjwJET
         0PwQ==
X-Gm-Message-State: AOAM530txHKbEOMXIGBnh7SIWp9HzwdNV/V8dzCsjKGBrX/a4Wlvlj/V
        yig8KUV6X6vp/A+Eu9pNP3u0WrkpPwaXGxz3hvLo7A==
X-Google-Smtp-Source: ABdhPJxUFAzspP8McapgCPeAK14FnM/LtUjXph+HodzKkcRBPUX+lSMVfXk/k+z1Osdg64ahuRMzKP00aYXVoN8K3AE=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr4799833oiu.19.1626846130824;
 Tue, 20 Jul 2021 22:42:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:42:10 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-7-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-7-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:42:10 +0000
Message-ID: <CAE-0n502Qqtv1J8oJgp2+GV5Vz0k0V-bEXmrFPDD-Zp0cS7=Rg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] arm64: dts: qcom: sc7280: Update reserved memory map
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

Quoting Sibi Sankar (2021-07-20 03:12:56)
> Add missing regions to the reserved memory map.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
