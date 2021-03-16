Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500ED33E226
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 00:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhCPXdK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 19:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhCPXci (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 19:32:38 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82639C061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 16:32:38 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so2215266pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 16:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F0cJwUc4KZwB02z+vjgX8W6JxJc4yQb8N1YQ54VyI5s=;
        b=h4Zbj1WL9fTPEigyzdvR/mEQftAIJwqjmCa48uJXvCJWjmwbY68dVhEg2APA58oPMi
         UhjQAJydf0fIvhiyIt7Iv4aPpvRaRIKjbHP1SC7W4JSxvsqfhCo78Uob1HWKeO3out89
         tpiV3xv9VU52GARyNUHEZ1idoT4c708Hw/fPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F0cJwUc4KZwB02z+vjgX8W6JxJc4yQb8N1YQ54VyI5s=;
        b=cljPEUJZYfJ8GksKDoOOkPa8SLnDopzliD/xkswXL9K5NLtS/MqDXckemO5n2l6MWX
         gWahb442OUY7Ug8vbbasiHgLq6qWOfHzJDe1tx7w1eijBZgUf4XQZSI5BKgk9ADCIM0A
         o7ccwmprjzxLZrAZdJKdRm/7+G25Gf/W/XQ0k4hBkl/eZwZTNBd2VLYJhoCO/1ukcRXF
         cmUebzycN+IKIHmExby0xtt0FGbP41xuQ1dqjNgckoLAZWGXEmhD7pZZeFXq03D5Lf10
         bNRVX7GeIUzAk7OL26QKGRtBpCndHMfNAfplsnGhI+LAHRhBUTq/EuWcIZWqzuDAGudF
         0hfg==
X-Gm-Message-State: AOAM530DLXXD1lGnp4OMG8oavO8i7T5ibnW+/m5IUNSFDt6pZ7xU0nFA
        L566RFCXqxDihvbCu2XLfxv0xg==
X-Google-Smtp-Source: ABdhPJyQIqOBBEVftxZAD2RPXx1eaq4e9nRCZIit1X1ARQ/y6KObiwcr3NNHojcYQzpajN+MxdA27w==
X-Received: by 2002:a17:90a:2a46:: with SMTP id d6mr1363262pjg.197.1615937558041;
        Tue, 16 Mar 2021 16:32:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:b471:7d:bf21:d7dd])
        by smtp.gmail.com with UTF8SMTPSA id a204sm17795326pfd.106.2021.03.16.16.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 16:32:37 -0700 (PDT)
Date:   Tue, 16 Mar 2021 16:32:35 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH V2 5/5] dt-bindings: regulator: Add compatibles for
 PM7325/PMR735A
Message-ID: <YFFAE9avDMZS9LIh@google.com>
References: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
 <1615816454-1733-6-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1615816454-1733-6-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 15, 2021 at 07:24:14PM +0530, satya priya wrote:
> Add PM7325/PMR735A compatibles for Qualcomm SC7280 platform.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
