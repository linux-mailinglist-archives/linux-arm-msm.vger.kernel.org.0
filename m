Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CE72768F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 08:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgIXGcP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 02:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgIXGcO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 02:32:14 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B20C0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 23:32:14 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id l126so1272067pfd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=QLnDNKE2S3wzGcgxQbn94gD4gMx4cWe6gJ0q+mzRl+Q=;
        b=a33jq1KwBVdBeHZ6vJ/PJDssGM/nkkdTZuwG6vxdqOkbpjhTUyZn7nvYMusycvTeUg
         l5vP/b8Wg0uPEOnvQJMVKhMFtkTEAX9gNC7BWHHxSbvR14Dj/1CQhKacpHoQsGrKu6P2
         IHpi6jXMAW7JYNPevhxHBR022uVslkdWxU4/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=QLnDNKE2S3wzGcgxQbn94gD4gMx4cWe6gJ0q+mzRl+Q=;
        b=fKV/ZS1jw+xCtxdXxmR3yedvJbzL9EbfJBSYErpXCt041sl6ZRJQsDs90Z0W7kra0N
         wFrWWhD0dhsy4Gtqf+cZCaOAPwyCa75aNOtVRzTzTs7gqUH3TAhmvol3/V1WLDPqjBDd
         yDJYkvAmPmQEEywCinSE0yT3Hc31O2UGwlissJXgHQDvOHgkiKODggq802Tq381y+K5+
         gurole8BTU7xzyJpMRqh46XqwBEskxFS2+l2Au3qL6TxaP87SZhj6HRkREoMZdJGa3wR
         uiXNvgPZxWXB9VvtqzZEfaQX7hRAsX3GIn/M/N3UpjhsIuOrzkH720QXQP4/8JHVyXB8
         /C5w==
X-Gm-Message-State: AOAM530m+UzlkPwx1Mq7TwVad8AzIjKkSb5rZ9aXOxaMt+iXgGuAuI/L
        NKNB1VzjvzbJultBQtkdiTbuhQ==
X-Google-Smtp-Source: ABdhPJzH1YjRbI7I1wZnL68bv9NNgPPGtLGQpYKz73xHcQIYGHEmTe5RXFL5RZ9shSJozYaiqwYClg==
X-Received: by 2002:aa7:8a54:0:b029:142:2501:34f6 with SMTP id n20-20020aa78a540000b0290142250134f6mr3022588pfa.79.1600929134015;
        Wed, 23 Sep 2020 23:32:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id i9sm1584716pfq.53.2020.09.23.23.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 23:32:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200923232448.24516-1-abhinavk@codeaurora.org>
References: <20200923232448.24516-1-abhinavk@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: fix incorrect function prototype of dp_debug_get()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org, kernel test robot <lkp@intel.com>
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Date:   Wed, 23 Sep 2020 23:32:12 -0700
Message-ID: <160092913200.310579.7777419545906412437@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2020-09-23 16:24:48)
> Fix the incorrect function prototype for dp_debug_get()
> in the dp_debug module to address compilation warning.
>=20
> Fixes: f913454aae8e ("drm/msm/dp: move debugfs node to /sys/kernel/debug/=
dri/*/")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Will the compliance testing parts be moved out of debugfs at some point?
Just curious what the plan is there.
