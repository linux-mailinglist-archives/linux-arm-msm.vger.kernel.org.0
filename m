Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B25294237
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 20:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437537AbgJTSiM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 14:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437527AbgJTSiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 14:38:12 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15BCC0613CE
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 11:38:11 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a9so3363306lfc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 11:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VPHy2iOCVRnPTfeb/Xot34qh9SylFH4zQ2qtnuy+mZY=;
        b=d489tptTRMiPFgd13GYy1drjFSbt2x0wlqQlFfkw0IrDKhcEd3aUB54X0/dX9PcAPP
         UToVMTjQ5R4J2HlJ8Hb8j7unmMXTwGtWhVFrXYG5jHDQHZ8B7OM6OQFfsuZYd54lys83
         STxBgKr8Rf9vB4HSlpaSETe0mtLtvJEedL89c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VPHy2iOCVRnPTfeb/Xot34qh9SylFH4zQ2qtnuy+mZY=;
        b=drMS10kNDZXr92emDbR2gqtIxfJu+GLjTSoI9LW+l5xfhABanU/EVptI6JTSbZdiuw
         kz7udt6pe7PRQwXMIX7dgqEdcMMVZv1NdqdT4F8c/iWmF/D0+vVx5fDhOJsCoJ7lxNde
         ed+Ry6+5x4VmTpqejOh/E3EoIDy/OpqYe3yiP1B99ncShl3MGkfzbX4KDNfKYLIEEYcX
         6vxUhc1WhFMl7jyK+kHll/96oYBHY1Xz8d4L2+a6qd6qCjDls1lPMBdr7kEelM04Yrsb
         a+xxLAg0bS7PDkd4lAKsdtB9qqaeIdLHwcYU5y1hAAX25nStljxj2fqR1e9HIK3ovv3f
         YENQ==
X-Gm-Message-State: AOAM530+lMHqZtBPg8T7V1tjMSnhPOgXROjvDKamdtnxRkNAJ3NT4+LF
        26mMx147xx0/tl4m9Y1c8p4N5Qou/MUJ0w==
X-Google-Smtp-Source: ABdhPJwOsp3fQaNk1kIpG/RnRWcUG0ccxtnMrYygh2ySvjNzs/+6iRbe4s9VryABii65QMzyiwUm1w==
X-Received: by 2002:a05:6512:301:: with SMTP id t1mr1303095lfp.232.1603219089995;
        Tue, 20 Oct 2020 11:38:09 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id y2sm421393lfc.255.2020.10.20.11.38.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 11:38:09 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id l28so3343106lfp.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 11:38:08 -0700 (PDT)
X-Received: by 2002:a19:c883:: with SMTP id y125mr1330347lff.485.1603219088467;
 Tue, 20 Oct 2020 11:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <1602786476-27833-1-git-send-email-sibis@codeaurora.org>
In-Reply-To: <1602786476-27833-1-git-send-email-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 20 Oct 2020 11:37:31 -0700
X-Gmail-Original-Message-ID: <CAE=gft4FrAm_QHKm_dF6G0R8fkfJrYFYPMrRu0nPNrQtZ83skw@mail.gmail.com>
Message-ID: <CAE=gft4FrAm_QHKm_dF6G0R8fkfJrYFYPMrRu0nPNrQtZ83skw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Fixup modem memory region
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 15, 2020 at 11:28 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> The modem firmware memory requirements vary between 32M/140M on
> no-lte/lte skus respectively, so fixup the modem memory region
> to reflect the requirements.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
