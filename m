Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1E435A424
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 18:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbhDIQ4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 12:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234258AbhDIQ4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 12:56:36 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B720FC061760
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 09:56:21 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id y2so3045364plg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=rewoe3CU6NQhZHn3sKpNWMwFtGUPcxHkscQhvZ9rfgY=;
        b=FD20Y6/gmNZQlAQWsrniTXwDZhO/AZ3Ye/ZXFigtco4P5Y6Qe4xKgwzSaR9K6XCXPm
         /Gxerme/sOn8neqs/GhsiUBBfekgS902DMOEXoWrGpKAy+0avJ2KLZnwXhtztzBjP69B
         wPsd/lV6jNOfrak6CNHplcO/FYi5tPEcKwTyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=rewoe3CU6NQhZHn3sKpNWMwFtGUPcxHkscQhvZ9rfgY=;
        b=Gxn2Fm47OOQdITYFvf3eV1JUxXnfziray+HgDfNLcphCBG/B2u9Qtn/dWcO5khxwcK
         j0WKIFqJISzoWFu0TzdJEndZwri0Ud5X84yb2/3SlEvnYyELlLHEiarwkihUtDcisgcu
         dU+9mwSYP2e9iI3d/ovK2vjzB0q3E9NmgC+bcfc6XjSHOxFF9QqK13G5I03X52W7wljB
         gXJGFK07ECm0K1FqZRtkxV9TaKMxKquZ3fOw1hZtuH30Khnbr6CpNnkFV4yHQaZkHvs0
         WIFpWsa/v13YQsUTQkUvxghFSCntttMShnRo32a2LZH1IETGh0954aPCRM7sBI77sJeP
         MXaw==
X-Gm-Message-State: AOAM5311P3WDtV0lleLBadYqXt38YNESX57VsJ5w6/dhXQCiTTnURhc0
        LhfNlFeDZmJ39CHtbO/WYvNTww==
X-Google-Smtp-Source: ABdhPJzUc03geYAbLcQczqCE8qtvhv/bRTUXGG1B2mx1gKHENLWZsorD3aooPgWhugvVASb9R+cYrA==
X-Received: by 2002:a17:903:2281:b029:e9:f78:751c with SMTP id b1-20020a1709032281b02900e90f78751cmr13787318plh.19.1617987381289;
        Fri, 09 Apr 2021 09:56:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:44c3:3248:e7f5:1bbd])
        by smtp.gmail.com with ESMTPSA id j19sm2304895pfj.127.2021.04.09.09.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:56:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1617968779-28526-1-git-send-email-dikshita@codeaurora.org>
References: <1617968779-28526-1-git-send-email-dikshita@codeaurora.org>
Subject: Re: [PATCH v4] media: venus : hfi: add venus image info into smem
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, bjorn.andersson@linaro.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Fri, 09 Apr 2021 09:56:19 -0700
Message-ID: <161798737958.3790633.17357856004042185175@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dikshita Agarwal (2021-04-09 04:46:19)
> Fill fw version info into smem to be printed as part of
> soc info.
>=20
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> change since v3:
>  added dependency on QCOM_SMEM (Stephen)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
