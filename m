Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4341E6B73E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 11:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjCMK0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 06:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjCMK0c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 06:26:32 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12C815CB9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 03:26:30 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id c200so1138685ybf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678703190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VuiQfp6nu8wwMmVIDaOcc9Bq5ccsIajhxnpeTIFBEBE=;
        b=ZuN5kFXLkH+mpHUEK6Xp/ga5+iJGC4jitcWtwFGkX3Im62Pv201rkxvHNxFp0hhCCg
         /SdtxwM/AUG7NrMUJwAhDJfOurOtJxT893Wa65Kjun9Sf/s0lD9IcwmD4PrP7YXXZIV+
         jKsbAAQ4ddLf5aEZnxvdwTjMsv9W4ZRRquq8zP6EYO0v6Jbr208Pz2RSR/8o2aZxep/B
         uG8SROBObtpEIkv6/9TukDoHPzw1UyFspJg7qVwrTcHuTyNurINXmSa9ctWzWzteQ0zR
         Rd3yIqZLVnRUMN++5OLPQAbjgeVfvkl3rfqSoLbPaptbCfEKV6fk7bs8cY0B3C2/oC94
         qdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678703190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuiQfp6nu8wwMmVIDaOcc9Bq5ccsIajhxnpeTIFBEBE=;
        b=KJY3uscyIoYlg+22PZQbKNOD50UK3eMV2dBnbGCGh2IB0QEbO5OkYGVnzp+FmrRzd/
         n/1H7/szYe1VPVDvpohvtVuO9q12efCWr6qR32XL87c2FuJ9PVwhSPVP52afYpiIPSMd
         y5WjrmUfHI3n5UMoODgqxJb2DtJz0dKpXiPAq2RpLpvFsAQqlhKdEmNeWyaChnE9RWAe
         q+JskIs+gp38qmSyPTUK+dm5BLubYw6mxeTJpB0Bc942DXZBAeTAy0uA1DWOWYnzwtv7
         VAMv2Wc2Fka8Md7wbW4003iLI4JL6ZHfJZxgTJKmNmaizcNG37asNjxCQyQYp9EWs8SG
         DiOQ==
X-Gm-Message-State: AO0yUKVhVi8WfHGIoHnjfVaBdfekx6pyOPtctvD0WR6Yx/P4KPr++kbU
        mvibl+WmNNk29D4YSDY9wQenG+cfz6BU3Q/+4LvMxw==
X-Google-Smtp-Source: AK7set87p2OVK2UrHNBxtLnxGyLAOtK0ZqeddlMEnDi2scid+vzT38Y8IvbgAl/gP3KhACQs1qCL1GV3lGYaf6YrreQ=
X-Received: by 2002:a25:e90b:0:b0:9fc:e3d7:d60f with SMTP id
 n11-20020a25e90b000000b009fce3d7d60fmr16203762ybd.5.1678703190121; Mon, 13
 Mar 2023 03:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230309154949.658380-1-krzysztof.kozlowski@linaro.org> <20230309154949.658380-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230309154949.658380-4-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 11:26:19 +0100
Message-ID: <CACRpkdbxzbrAHtd1mNv9N_ErOpWQ=QD_cokF5LVemU=QdQeKgg@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: qcom: sm8550-lpass-lpi: allow GPIO function
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 9, 2023 at 4:50 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> All LPASS pins have basic GPIO function and most of the code is ready
> for that.  Add missing glue pieces to allow LPASS pins to work as GPIO,
> which is going to be used on MTP8550 and QRD8550 boards.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

These four patches applied as non-urgent fixes. Tell me if they should
rather be treated as urgent. (for -rcN and/or stable)

Yours,
Linus Walleij
