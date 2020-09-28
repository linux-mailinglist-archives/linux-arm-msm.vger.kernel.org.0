Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B214627B227
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 18:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgI1QpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 12:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgI1Qo5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 12:44:57 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2241C0613CE
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 09:44:55 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id u21so9524035eja.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 09:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=O4wMisusw5zksx0GW6HdF+k+feJd8Jhmsn7fgUQP2rg=;
        b=AXDUg7VQm2DBTse4gsSS7l84FGvg7tqTAk6Usm/0qXjQIl3Sx7LsB3WtpUbIYfbBbk
         ydmmjNit0LhPwyh6cbpwkQYMnVSmWY72vyw7yfwWH16RqStWc23BeW1PSL+8Z4wMYqjn
         gYqE9TGTiZtMIMTyR70HtSkBrSHnTZN9G7XC1auAD1/oFuCbIUPPYUn0PCEAsnxsht17
         DTxF98h3vVM05J3vaxx0U1czbxfKTyGkynZDnSlKoHA+jaCj+YoiAonRi+e8/R+nrI8I
         +jD8GDK231VaLDXrhjfu7L7d650QfbynIuHv6eyKZsbYwNI+yzR8UmxrRY7aEp+L+rSs
         sXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=O4wMisusw5zksx0GW6HdF+k+feJd8Jhmsn7fgUQP2rg=;
        b=hsQsVnwayYUn+K6EXbY1swdnRL81z1r+zX6OvkDHQDo4tdqqVJ87le0BZk6xBXWN3Q
         grJNy3EhT9uVIJyViyXW7bUxdQiTd16oxYGIA0YSIYrJTbjGP/TfOyuUIOfu0abrL0I8
         +UckmUMIwf0aIXk5TDFR36PiHGEwXkVwTDSZZOowmxLMjSKwdOzjflqw/0j7xRfUoTlY
         kaCeoRMK9masX8IZj6xBYLPJqv2CeilYAqJQsLFHUdMoLnIKa/g8945ggxxVnuifjcG9
         kpwXbBimjHYz3l1Qqut8QvlcG4R+2USrHAWgSD4w66e1ZZWWDoiwcEnfccLgZe/KFRdo
         9BVg==
X-Gm-Message-State: AOAM531U6VwERLmYF5hlmkS4GTuqIDVZ3fBoOSjDavATrn3aXHvMHwwY
        rPfQYedFBeqFx/jCSqjIozZDoA==
X-Google-Smtp-Source: ABdhPJwkyS+Tqx2QxSXh7hULUfFINZgVFH9lz8QmQ9qr7HLGRVs8KiNRS3tLvld55tjQGtB4y3+Xcg==
X-Received: by 2002:a17:906:fb84:: with SMTP id lr4mr2605288ejb.282.1601311494510;
        Mon, 28 Sep 2020 09:44:54 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id nh1sm1912594ejb.21.2020.09.28.09.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 09:44:53 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/3] Venus dynamic resolution change fixes
Date:   Mon, 28 Sep 2020 19:44:28 +0300
Message-Id: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

Those three patches are needed to fix setting of LAST buffer flag during
dynamic-resolution-change state.

The first patch in this series fix the LAST buffer flag setting, the second
unify the driver behavior no matter the event from firmware is sufficient or
insufficient resources and the third one is moving the locking from buf_queue
helper function to encoder and decoder buf_queue vb2 ops.

Comments are welcome!

Stanimir Varbanov (3):
  venus: vdec: Fix non reliable setting of LAST flag
  venus: vdec: Make decoder return LAST flag for sufficient event
  venus: helpers: Lock outside of buffer queue helper

 drivers/media/platform/qcom/venus/core.h    |  5 +-
 drivers/media/platform/qcom/venus/helpers.c | 15 ++--
 drivers/media/platform/qcom/venus/vdec.c    | 92 +++++++++++++--------
 drivers/media/platform/qcom/venus/venc.c    | 11 ++-
 4 files changed, 76 insertions(+), 47 deletions(-)

-- 
2.17.1

