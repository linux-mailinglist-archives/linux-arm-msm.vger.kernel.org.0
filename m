Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1035541A0CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 22:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbhI0U4T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 16:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237150AbhI0U4B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 16:56:01 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6234BC061259
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:54:09 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so26191149ota.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tDdeGJOBBJPnUr7VImnSEIcCMtCi0Ce10ZXN5bmYag8=;
        b=atM9FD1vLwjuKqF62GySXevVlnqo9c+vQYnDxHviTkENroRpn+dr/wBJ6XMioj2r/h
         y2BYQ+N28ivFUzbibJbideDg2LAzovo8LBQXxUsvJs6a43cDTNOrj1E/DlXL4LbWwz9Y
         oVeLXr6SKEkLZhi3XnVHgsTCw0XYDQhy2fHo6zpN1IVt9td6sUKk6vOE6IN5CT82q5H+
         mC0x58QEWBpj4sNIY7HD0xLBHJje11R3jyl7XJoKMspASXvMUx+ia/a3nVfDeMnl/j0i
         EvfJce0uu3osOam1x6Pb+KPlTfpPbFkzxl8vSUcM3/gjLw2LjuzF8QWuAYI3XW2dsl/Y
         iiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tDdeGJOBBJPnUr7VImnSEIcCMtCi0Ce10ZXN5bmYag8=;
        b=ncRAewlpZ2VEokaKsdC3Xvw4xzT1jJH2qW2aI6wv5zJ2cTMDpchSmgUr7nSpe0W0TR
         ARSy8HZx0o1ygYNDCD4v41y/nh7Ktc9JJZ2RG2mjHpriUnxziavRQCd1RpPO0U9JERPT
         zfaoA7n5PVumf6RB/Xkzw8Y3LlhGXsICy02k6UXb5syoiHI4w5mIgiXt8SAGwsZc6ezi
         TnSakIXWVmzVR3qwXrbtdbWFukVQZsPADbvEUXF+LlnYljLGQf8X9W4zapuPiCMBiiam
         QUMVrrKF6p+iv7ZZqmsGOwOqqSBras1fqm6OnURF3ZxYQN6AsjRCjffJmu6Grqdb/1rU
         oTvA==
X-Gm-Message-State: AOAM531dAJVIOUxnz0ZjhLh0tYrzvPOaNH5JClgdw5f84VHUwEYCNCCu
        eOMXe7XDuuDU7j90Eqr6dfd/xw==
X-Google-Smtp-Source: ABdhPJx9/naDlVpyGLpe7FwzuSBOEDI0VynLTTxXxV9kV7yuqsfIfcaBlRc8XBGMhyFgcBE4DmSAcg==
X-Received: by 2002:a9d:6089:: with SMTP id m9mr1880131otj.64.1632776048758;
        Mon, 27 Sep 2021 13:54:08 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org,
        linux-remoteproc@vger.kernel.org, rishabhb@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 12/13] dt-bindings: msm/dp: Remove aoss-qmp header
Date:   Mon, 27 Sep 2021 15:53:59 -0500
Message-Id: <163277593826.1470888.9821309633445465547.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-13-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-13-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Sep 2021 19:29:29 +0530, Sibi Sankar wrote:
> Remove the unused aoss-qmp header from the list of includes.
> 
> 

Applied, thanks!

[12/13] dt-bindings: msm/dp: Remove aoss-qmp header
        commit: ec908595825ce84fb40e94a68b378f13c65076af

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
