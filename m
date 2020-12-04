Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EBC2CEB9A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 11:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387710AbgLDKCw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 05:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387709AbgLDKCv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 05:02:51 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B40C061A4F
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Dec 2020 02:02:05 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id f23so7856919ejk.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Dec 2020 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=++IltyY+m+4yKbR7UfN2/Vuk9NOT6dGaxBYrXiv56uE=;
        b=o5EIhWkQaGJbqel6RrK8cy2sadIRCrcnAYY1avee7tk6Sk8xUMWcf1rK/l7JdGQxZr
         /CUHgVogmoM/N3O/lCbep9M6Zkud0YxRYyNQFPkuqO/A6KRxgHpLacxbXz3QFa+pwtq0
         x/1/ajHblq4b7qsX7As4ddmDiK4akAVcaHXkZKdYNvFxW2KVG55eMziw1hu4LbYTFoJ3
         /WAdePA8PY+Bm1pH/OOb8cgjCp4MT+0Po9NTNZw5e3ql7d935/3AT574Fx1uut8d5F9d
         Y2sN9YPAWI7ZcdnvDeHOb9aGIKg3H4GsE9INcWwXe0Fs6/xr9jMSZnLeahrory9GOQuq
         w5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=++IltyY+m+4yKbR7UfN2/Vuk9NOT6dGaxBYrXiv56uE=;
        b=WDOxrjoSbYH+jg+18tPhUX5HFPed1esmv2VxBaTaPFn5IwKZXYVecl605Lrt9/gWnZ
         7J5h23wJrKxJGzIVyND7WlbToLJY1GJu7QB9raJpWoT7I8xH+Y1djJLHKEybLLcB5rtK
         8EJmyNaTywf64ll+d/eSbQUEw0JElEdA8tOmlff0qJaYiJfIUHtmK4KUm99hjhiJ0I7S
         AnewZCie/jaX+DrMAh66yKvbfdGFFNOFgCFOIazKJ4HwnhhQHrzGQ2nEo7aRB04BACBO
         +bTKonh1RLecrfEH0M56Sr0UPKCh4FOJHY3f70QraZGhJI7e6l6cxLC1pYNR40FDE+f7
         lCoQ==
X-Gm-Message-State: AOAM531eN5Ivelxhm6tJMuFMUDIza0AWjbg+y/PoOvo42Jx53+Egiosb
        R+b0aweJvvbyrZwy3BP33xRsvA==
X-Google-Smtp-Source: ABdhPJyht7qkOJKWnkXNSY3BjrtshQwuVw/XNG6XyOCd/JAMlt2ZGRgMACbRNdWPbFXAYuCEJP4F+g==
X-Received: by 2002:a17:907:2718:: with SMTP id w24mr6038881ejk.525.1607076123943;
        Fri, 04 Dec 2020 02:02:03 -0800 (PST)
Received: from localhost.localdomain (hst-221-106.medicom.bg. [84.238.221.106])
        by smtp.gmail.com with ESMTPSA id p35sm3238242edd.58.2020.12.04.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 02:02:02 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     dikshita@codeaurora.org, Alexandre Courbot <acourbot@chromium.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/4] Venus encoder improvements
Date:   Fri,  4 Dec 2020 12:01:35 +0200
Message-Id: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Changes since v1:
  * 1/4 - fixed error handling in hfi_session_deinit (Alex)
        - keep venc_set_properties invocation from start_streaming (Dikshita) 
  * 2/4 - keep original mutex_lock (Alex)
  * 3/4 - move msg queue inside if statement (Fritz)
        - move rx_req setting before triggering soft interrupt (Alex)
  * Add one more patch 4/4 to address comments for hfi_session_init
    EINVAL return error code (Alex)

The v1 can be found at [1].

regards,
Stan

[1] https://www.spinics.net/lists/linux-media/msg181634.html

Stanimir Varbanov (3):
  venus: venc: Init the session only once in queue_setup
  venus: Limit HFI sessions to the maximum supported
  venus: hfi: Correct session init return error

Vikash Garodia (1):
  media: venus: request for interrupt from venus

 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/hfi.c       | 18 +++-
 .../media/platform/qcom/venus/hfi_parser.c    |  3 +
 drivers/media/platform/qcom/venus/hfi_venus.c | 77 ++++++++++-------
 drivers/media/platform/qcom/venus/vdec.c      |  2 +-
 drivers/media/platform/qcom/venus/venc.c      | 85 ++++++++++++++-----
 6 files changed, 127 insertions(+), 59 deletions(-)

-- 
2.17.1

