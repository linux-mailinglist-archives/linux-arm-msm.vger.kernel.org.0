Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BDB3B4A15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 23:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhFYVWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 17:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhFYVWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 17:22:18 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9145AC061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 14:19:56 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so8709124pjb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 14:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KRZHsVg/sKejet4Oxkl8EPiRsKdKFhPt6HVcTWLj50A=;
        b=IifTLatIxQngyJIhX7D8Yfvnpz7FPKdtxDoMY4s4ChzDh6MHf3cUARNLgCw8l/w5yt
         Hyqf45hHu4g5ei+DrjcjJ7uXcfVTxl2BhdtbE4cTziJ5EXmF45J5NpjexCYE1bYf48Zx
         QZX3odO5GFEjleldoDQGuqiNdPynWm5skADUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KRZHsVg/sKejet4Oxkl8EPiRsKdKFhPt6HVcTWLj50A=;
        b=GuduIzCRZaz3OtePDiZ1Gw1Z+/o4uWDsCmMo2g2CMMip3YLZ3pw0pzbqfhINnCGM7u
         uGNu82mLdHBF+oYXhTmLeXGktKb7+omAXYGn4r2bv+A5vfjf781Jz8aNLLeLRCGxeBJc
         z36MSYjY0QQKgqruSRzdnl/tHqH7Yau3n3bWayhhDI40gPYJRCCLx3kL5D0TyBWWVkfM
         hhyL0zQhihqO0Ln79mKPu9JL6n5+sr2Pr0tFgEizg0/Tt0hB/H5oJAxTpdjJ/oN/NnJp
         UCUe/gQJgzZCrdMeCO2VuRd5+mbBDA+wecPVXxokalXO1JP73fKCb9lgYcXINiwRZDzO
         C6eQ==
X-Gm-Message-State: AOAM5325xf/dD14Hl1wHKJau+816o77EacRSpNiQn3R7fyHBK9zzJZGr
        GbLtDRNFroiuJtRFVKmkiF77dg==
X-Google-Smtp-Source: ABdhPJz9F/15irC77Fnov+ccQ7Y7XF/R4ZNJv/1lm2cLqQCVi7Htf0bAKiJcdg3HCfYVpp7yeozBYw==
X-Received: by 2002:a17:90b:10e:: with SMTP id p14mr23170445pjz.153.1624655996106;
        Fri, 25 Jun 2021 14:19:56 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id b70sm6675069pfb.183.2021.06.25.14.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 14:19:55 -0700 (PDT)
Date:   Fri, 25 Jun 2021 14:19:53 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 bindings
Message-ID: <YNZIeZVpmJW6VVnG@google.com>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624560727-6870-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 12:21:56AM +0530, Sibi Sankar wrote:

> Subject: dt-bindings: remoteproc: qcom: pas: Add QMP bindings

nit: does this really add a QMP binding (as in
Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt) or
rather a QMP property/phandle to the ADSP binding?

> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power domains

same nit

> exposed by the AOSS QMP node.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
