Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D084A8FE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355094AbiBCV26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355072AbiBCV25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:28:57 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DFA4C06173D
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:28:57 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id b17-20020a9d4791000000b005a17fc2dfc1so3708441otf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=AVufOZ/yIUBTbxUpH00x2bwAXYzopgYq3RQrFXSpyyo=;
        b=WKmiPKm35iKFc0i9l1wYMp+2LUQ+5k9Luqw9i/aRkDYzDaO7xEP/zC3JIsBC7OBo9g
         +SsFYDBWCMtTP7DlRS/QHgeX/CdIGH+mcmUxLTMyROixfFDSAyaZH6YqyvT7aPIfzNtA
         IBhjuqw1pJatyrI72Ub00QJPKpZwKt75ndaak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=AVufOZ/yIUBTbxUpH00x2bwAXYzopgYq3RQrFXSpyyo=;
        b=h3v8hAyxNDc5XU0+7A480WjK2xzjBj4/7pEWMmI6QVK+BS4hT1zDFGRMGPZqYOCnsf
         pkUwyPVI9YzdmdLlAGJo2zNIJeS5ycrsNYrqt+WwO+YGSzgg6mufiExRpgp/3A1qYEBw
         sbUuR6Se7L1gLX7jwTR41STzGnJnQx4la7j4DPOl0Htz9L/V1w60GreYH85e4Qb8VfWc
         6pJxNL+WgIHJm71qSqy51JsOGJFmeMA7LF10Ffla1ajmkQFK5P3owEmh4KkJMjQAm/vZ
         ysgUSobiYo3zgc1HKzG1g2L0t5CXVGZrNtJPozbZ9muZTBvmDdhfYPYbv3Dh4ZNtdZ3z
         jAhQ==
X-Gm-Message-State: AOAM5315BRTzoNIP08iYsT4iJzh12EYx5RqwYFBgXEJi6bMmPRr3rnNf
        ThEUfepvGogLF/d0S/M/dUxaOyt4fdCIeotyTb5GJw==
X-Google-Smtp-Source: ABdhPJw3dtUZBKr9Zcf/k586jLxFXbrM94d97rCy9OFHl5fdHvZ1r73pHH5pttGLZdgDMFuw4AVW90cM7/TJr0+KlXs=
X-Received: by 2002:a05:6830:1d8f:: with SMTP id y15mr26531oti.77.1643923736920;
 Thu, 03 Feb 2022 13:28:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:28:56 +0000
MIME-Version: 1.0
In-Reply-To: <20220202132301.v3.6.I874c6f2a62b7922a33e10d390a8983219a76250b@changeid>
References: <20220202212348.1391534-1-dianders@chromium.org> <20220202132301.v3.6.I874c6f2a62b7922a33e10d390a8983219a76250b@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:28:56 +0000
Message-ID: <CAE-0n500O_zah4mg=aKrGZB+NoNN4-UqmjiR+qPSvcddhgTcRA@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] arm64: dts: qcom: sc7280: Fix sort order of
 dp_hot_plug_det / pcie1_clkreq_n
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     pmaliset@codeaurora.org, mka@chromium.org,
        quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org, konrad.dybcio@somainline.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        sibis@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-02-02 13:23:40)
> The two nodes were mis-sorted. Reorder. This is a no-op change.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
