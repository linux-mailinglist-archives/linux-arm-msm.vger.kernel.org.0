Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02B985EE819
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 23:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiI1VOl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 17:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233803AbiI1VON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 17:14:13 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D983DEA58F
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:09:26 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id lc7so29750026ejb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+ArxDvTuwZCqYAL4oxkzddYwope7pEyQh00wDZZmRZw=;
        b=ZNuUawCKUbpDRAOEhyisqFnqgWkwjc6wcmEMGa8/n3L+N/G06/AMeYSykqhwwIPeFI
         K8nXAS96Gf1KKd3jCQcu73EJUTgkaV85LMzxOeQa6iOxI87ymwLy6Mf741usdSDkozd4
         hDAch4AgRMyEKZYovFzcUcVZvUgflsqK5e3BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+ArxDvTuwZCqYAL4oxkzddYwope7pEyQh00wDZZmRZw=;
        b=xqBnM+wDQq0vJsp1xqqXN39Hn8PVivxDrZQkAKDSu/OZPMc9jKMgcXLvIK8JCyV8Wp
         VXBOFo2biETeT5MXMuo/lM5quvApsWhlS8HYP0mwTKcnBlPxHdlsrBw8IRinj5iaKVQa
         mB6qmq22GZ3ncSEehNUaZ0huhDd+7pG9YkYAngGwvWsaVDMTnO4CwaLYq6dQ4kNeZ0vQ
         I4CUs5/CbycJRI+sG1Ta6BPQ7Oxs/7bOoLyP2juuGdg2y1Rrd8Do6ia/PnjUoJ4ln1D4
         gYKKEoD8tHsufByNBUr+6SLkshLA75xsa6892Bta2ZG8wrTn6vAGymaVtpXZ1Ft731VJ
         U+9A==
X-Gm-Message-State: ACrzQf1Bp7qXkww9jMBIKF0w7XGt8cHJNXaVZN7GlsQVHQCupTp0/XQd
        vMb6YWpKiz09C3GKRSNSs6FsxVaDFhMILqpO
X-Google-Smtp-Source: AMsMyM7EO5LSwZY2ep94VyKy5GrJWQ0Eca/TqnoDaJcSVehno22Y2kOvFlC8cjr0Q0AiPhjcdqBkew==
X-Received: by 2002:a17:907:8a04:b0:782:5277:2bac with SMTP id sc4-20020a1709078a0400b0078252772bacmr29080102ejc.128.1664399285319;
        Wed, 28 Sep 2022 14:08:05 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id 5-20020a170906300500b0073d6093ac93sm2963838ejz.16.2022.09.28.14.08.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 14:08:03 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id cc5so21637618wrb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:08:03 -0700 (PDT)
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr22722202wra.617.1664399282903; Wed, 28
 Sep 2022 14:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220927112343.2700216-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220927192234.v4.2.I1454364ac3d8ecc64677884d6b7d2f3e334e4b4a@changeid> <CAD=FV=Vu-bZFeZVER+dP4pTD6UTTLFhpJX=ZxurBbkep=8uHyg@mail.gmail.com>
In-Reply-To: <CAD=FV=Vu-bZFeZVER+dP4pTD6UTTLFhpJX=ZxurBbkep=8uHyg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 28 Sep 2022 14:07:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uv9R691LZP65ufh2oTQSKCdTdqqH1O7j99dT07svsdEw@mail.gmail.com>
Message-ID: <CAD=FV=Uv9R691LZP65ufh2oTQSKCdTdqqH1O7j99dT07svsdEw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add LTE SKU for sc7280-evoker family
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Sep 28, 2022 at 2:04 PM Doug Anderson <dianders@chromium.org> wrote:
>
> The above is an unrelated whitespace change and doesn't belong in this
> patch. Ideally you'd send a v5 where you didn't have that.

Actually you probably want to send a v5 anyway with Bjorn's proper
email address. The fact that you have his old linaro address instead
of his kernel.org address means you were probably need to update your
git tree. Try something like:

git remote add linux_qcom
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
git fetch linux_qcom
git checkout -b my_patch_series linux_qcom/for-next
# then make your changes and post them up

-Doug
