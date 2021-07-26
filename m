Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17B6D3D69E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 01:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbhGZWVj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 18:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbhGZWVj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 18:21:39 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7190DC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:02:06 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id c7-20020a9d27870000b02904d360fbc71bso11547302otb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=YQOUs6IHKvgmEEaJoamgZLDtUOOWcnZjqqyzNqPHtgA=;
        b=X7ukQguYL+MKBPkBFhO7H5nfKnc70OCDuiDFR7YSf6QZLoLc4ReLFF6oY/7WEAPpeS
         PFJCBGADy/cvzKcTOc1MuVUHe+mO9raKPlB3JjjxQuitmjuPBprCfWobERLCeG8YR46C
         HBZgujM21DWWX2fFg3Zb81ftslEqmBez79Y5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=YQOUs6IHKvgmEEaJoamgZLDtUOOWcnZjqqyzNqPHtgA=;
        b=bmI4mBalsilFFXdq/OxkcQ8rWy4DHx9MbY57BqVADJnynQ6xbejcSaiEP3b/4K8RBQ
         4hOrSWYdtqvwsgj9mmgq2fs1AJNTTE0sIPjMSZnC4Sd5v16EuY5Btcuh2lXzxPSlkrjz
         7YVZgRPdqLRMI81lt4dDGQBisBy1QJk7JMdoJ/1eMFiWj3T8685FaUCY44e1PIfszp0m
         en8opCNBzrP7jVecB0Z6e6gaufA5zJR/qSnHiGoKgQI9FtFVURFluV2W5e4WXNbUZHl5
         jjhtzvZCzMH4f6xvlApnQRPlgjxpRb1fmVREamVbUlEa1cP0tsKe59smC0IP/ChNkPGl
         Sx9w==
X-Gm-Message-State: AOAM531/0X3+hj0alTWtSMjyRgPJVC72gPu503gmF+/tNVqtMd8ykBm8
        QN/JzXwD4ivh0MyltgnWYn/dLigKGQtO3BzCW+M8Sw==
X-Google-Smtp-Source: ABdhPJz5jt91J7s64KRcgC3G/srUYZuXPZrU0BBg8ga7AFXoIHLQ4iQUzviPocNr4D2zmNt8R5pRz0hfblCs9cIwm10=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr13153554otl.34.1627340525819;
 Mon, 26 Jul 2021 16:02:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:02:05 -0400
MIME-Version: 1.0
In-Reply-To: <20210725031414.3961227-1-bjorn.andersson@linaro.org>
References: <20210725031414.3961227-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 19:02:05 -0400
Message-ID: <CAE-0n51vBEUY4A0ed+sBDd1tWX2oBqW9PeeAttLordaBw174rg@mail.gmail.com>
Subject: Re: [PATCH] interconnect: qcom: osm-l3: Use driver-specific naming
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-24 20:14:14)
> In situations were the developer screws up by e.g. not giving the OSM
> nodes unique identifiers the interconnect framework might mix up nodes
> between the OSM L3 provider and e.g. the RPMh provider.
>
> The resulting callstack containts "qcom_icc_set", which is not unique to
> the OSM L3 provider driver. Once the faulting qcom_icc_set() is
> identified it's further confusing that "qcom_icc_node" is different
> between the different drivers.
>
> To avoid this confusion, rename the node struct and the setter in the
> OSM L3 driver to include "osm_l3" in their names.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Thanks

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
