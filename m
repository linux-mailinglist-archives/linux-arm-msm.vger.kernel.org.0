Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A761A6E36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 23:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389005AbgDMVXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 17:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389003AbgDMVXO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 17:23:14 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C69C0A3BE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:23:14 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id h69so2499675pgc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=BT+KVJxP6FIOCZDCNYgubQTFtO4CcCJ3pCdWnLLK+5w=;
        b=g18EvphTHwCmFKrhNfK+g5Z+2e7sZxiP2JQ/wQA19SateqYP8DGCHMvOuzlK4CjgE3
         qYUb9yWClarpwLGwZvKBk2QoCwtWjVr9vSV/oQU7FGEqE1cSWN7cdgNpsbh4J7l92PmN
         va+z9bBBxgMcotKBVUCkiRcMz3oWWrrYEzokA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=BT+KVJxP6FIOCZDCNYgubQTFtO4CcCJ3pCdWnLLK+5w=;
        b=uNXnyL6bOtw54WBQH7YD7zYUMdJjxyQZtf9f6FHJSPHKJ3UeNq1n1xx8mATXWD3DEI
         Wf+Cc9grk47rwXkCzSZzdc9KCcUhrPNGCHrWvGpwDb4du2Mq6L29Ct6OHPeZ1/SdiO+e
         OkM2zAcEMD0RGbhCzvlID/+Gd6mElsWksCpL2ApQrvaY/WnrzYT/2iidit5mMDiCdj6D
         1hZM4CXU8uGaP2DZG0JHlFiNot38lbOaNljNGiowtV5tyQc6jhqfro2yYhNAjXQRjSmk
         ic9nDjw1Va85C4HYRdeJzm9KlvNCz6q3YZX7TsfK0EW9rlfwE7n6apcXNYyzRM5JhIm6
         EEgg==
X-Gm-Message-State: AGi0PuZ3E0kyeKBaP3Ayzvpj1nhXTWeuxRd+jvEv81VQIho2Zw9U354L
        ZTJV7y0vzHIIv6UYayFwBZP5Fg==
X-Google-Smtp-Source: APiQypIA0b5aU2vrrAPT6uVb6j4m1YfkLnjU672PEa9KvjMV/GMQiTMTeVahT/69YCVWHFLTS60RNg==
X-Received: by 2002:a62:7547:: with SMTP id q68mr3079214pfc.55.1586812993734;
        Mon, 13 Apr 2020 14:23:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l30sm7746561pgu.29.2020.04.13.14.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:23:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200413100321.v4.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
References: <20200413170415.32463-1-dianders@chromium.org> <20200413100321.v4.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
Subject: Re: [PATCH v4 02/10] drivers: qcom: rpmh-rsc: Document the register layout better
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Date:   Mon, 13 Apr 2020 14:23:12 -0700
Message-ID: <158681299218.84447.10308919981423964992@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-13 10:04:07)
> Perhaps it's just me, it took a really long time to understand what
> the register layout of rpmh-rsc was just from the #defines.  Let's add
> a bunch of comments describing which blocks are part of other blocks.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
