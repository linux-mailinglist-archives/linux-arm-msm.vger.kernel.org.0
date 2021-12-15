Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3562476159
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344103AbhLOTKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343656AbhLOTKf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:10:35 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA48C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:10:35 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id be32so32978106oib.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=o4GFUJfnOn1MqDWBxKCcYXZhEN4oa41+4/hNAuhMnEQ=;
        b=FDnhrOp05KzmGqeixp4fuYb6yNyFnun02Y9PQN9byiYvDKsyxwM1injIQXFUyzVn9V
         MSvrGkVCX8251BsU+94oW9TYQiiL/ePZhhqB9PpQYiv9AbyREhBGlC7AGo8FCClTx6sb
         PSJUfLRM+Rq1QNw59ufxqempEPKQijigi3K5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=o4GFUJfnOn1MqDWBxKCcYXZhEN4oa41+4/hNAuhMnEQ=;
        b=P4VdiFsKosSwiq102iTnFcs+skYLvFf9ePWwNFfjYV4LX9jfejR5W0E09zaS8T65f8
         WRN2QMmNpE4QUQqWJKIKKHUb1qHHiX1AkwhH89gMmQek3mABeL1TxwUhe4RI5MVQo2mS
         I5DOoe8eHiE9flvADKtPi79qHSLygWC64nPEeOS4O6Ma6KUsttUQfPJ9wydWHEby8m2h
         cGsKXPyLYNYF2O+poR2xUMk3ZrbFHh7uoiya12FEZ2cvlfAkZ+NwFBhZwD+dBNIjLW2t
         KSAJwwKEGOOFXS1Mewd4Bbuno1/C12k1LhHTOwY0xBpQn+7cGYxE0MWwtLmKa956VbJw
         nR6g==
X-Gm-Message-State: AOAM53303mexCR2vWlYaqGD8axv/u7dZeIfeVM7gNlXJN1ruBbdO83q8
        Cw2EzPK1l9o/cjg/MwgztVNQQ5v7GiR/OV66dPMUVNIzO8k=
X-Google-Smtp-Source: ABdhPJylPPGqcI6i5Kd0ZwAXgrXkSHaQcXt5Yx/hOTY43OO1Fv2rztkYwFETiHyR1NlHtEbQThfQbHh0h6fpGYQHPfM=
X-Received: by 2002:a54:4506:: with SMTP id l6mr1230341oil.32.1639595434600;
 Wed, 15 Dec 2021 11:10:34 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 11:10:34 -0800
MIME-Version: 1.0
In-Reply-To: <20211215175910.1744151-1-robdclark@gmail.com>
References: <20211215175910.1744151-1-robdclark@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 15 Dec 2021 11:10:34 -0800
Message-ID: <CAE-0n52CHwYAEwAC0Hthgbamjj2x4K3B2w=kTRw_AFLzVgDF-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Don't use autosuspend for display
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2021-12-15 09:59:02)
> From: Rob Clark <robdclark@chromium.org>
>
> No functional change, as we only actually enable autosuspend for the GPU
> device.  But lets not encourage thinking that autosuspend is a good idea
> for anything display related.

I'd prefer to see a small blurb about why it's not a good idea to use
autosuspend for display things. Then this commit can be dug out of the
history and someone new can quickly understand the reasoning behind it.
Just saying it's not a good idea doesn't really help.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
