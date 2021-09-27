Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610F841A0C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 22:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237221AbhI0U4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 16:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237102AbhI0Uz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 16:55:58 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C980C061769
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:54:08 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so26205940otx.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jYTXXROp3aX1NMBycc9RzQt/DwugfKW9fQbKK8RPVXU=;
        b=Elq1ONDomvbqwYGRiMNWKFo38sox/+9fBdHYiS0MKytSylE2boKfeZOJIXu5SaEwV/
         vWgTl/MFejIwPfrRqBlfdNVZsrBglnvZ6jji4WnM7AglBsN+1IibLzLxdmmgg195yvUJ
         1aTdvQk+h+TnApActDXM1TspO1nxdLdW13+ve8K8wWcE9NNbLec7zyIP0cTrCPwt17Gr
         o5o85ESLYOsIbxBj5i0uSXwxsuqzZB74onnk3XKvE41zrLX6iUhYpHXHhk/zJH6y6mAD
         YQy31x0rMUo3T83ANnS8WxgR1NC6g6dXt2sRHT5fw08OF0evj9sFPzn1TCX14+Lc2GlX
         nZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jYTXXROp3aX1NMBycc9RzQt/DwugfKW9fQbKK8RPVXU=;
        b=e8tPk4zDlQYn292pKNFAjo9MscG+iUqRKMz5/xZ2XHid0XtyY1lo2lcc2Mo2sCGQDg
         fJ7hL/muxCWV6CRVR0vyCKRbJ3IX+CoQKiWi6RUgmQB/27MUHgliRZHByzuCeFtZ2WX1
         awHOwLXrL6wFkmkg2JJxjAS1gTKUtZN76ab5TQI2b3+ZvTK4yWVcDYBHRC60PwG/5b+G
         il9UhGZTyoDe+Q7E3nn8nq6UqT420+XGNsQ8Dg5tZllQsJLp6phDgXM/lO1Da8In38x0
         1OuaFMS11h3BkN+3J3NEZqB5V2oam/qsKqkyHKUBW/8e6/AU5pIXogK16VVyTNmGrwkR
         ckdQ==
X-Gm-Message-State: AOAM532LvUg9s42VW4udH9W+QNy1/IxUGT4mNCMkNShwy9tzw/hwcWFP
        WXVPhqYUooh+2dZZhbuLDb8PmQ==
X-Google-Smtp-Source: ABdhPJylw1hG+IliHWudtH3y6ImeBsXzTXmvhAFWa0/Y4yn708jVIqpWevArbxf+btQkP8T++8nnaw==
X-Received: by 2002:a9d:7284:: with SMTP id t4mr1760104otj.285.1632776047761;
        Mon, 27 Sep 2021 13:54:07 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rishabhb@codeaurora.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 11/13] soc: qcom: aoss: Drop power domain support
Date:   Mon, 27 Sep 2021 15:53:58 -0500
Message-Id: <163277593826.1470888.2234978122972156070.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-12-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-12-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Sep 2021 19:29:28 +0530, Sibi Sankar wrote:
> Strip out the load state power-domain support from the driver since the
> low power mode signalling for the co-processors is now accessible through
> the direct qmp message send interface.
> 
> 

Applied, thanks!

[11/13] soc: qcom: aoss: Drop power domain support
        commit: 99512191f4f1dd4e0ad92e6f61ffe4d8a22aa3ba

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
