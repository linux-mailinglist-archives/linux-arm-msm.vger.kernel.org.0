Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24FA359EA14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 19:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbiHWRm6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 13:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiHWRme (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 13:42:34 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192339BB6B
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 08:37:17 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id r1-20020a056830418100b0063938f634feso2815893otu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=v31+jjDAe8b8bSeB3m7vjA69108ZFOl1IwaE1C9+p6g=;
        b=ehS+dPduFec0TYms+eKA7qJx5obDw3y+LyCRyq+Ru6CDFRO9kkTL+5xanQd7oqRdiG
         rfEPeHr4mHdBWzi7mplNImhxtTIhIoMKT4DZLWbu04u5YQ+HwsNb3VwbdbeceUIyK4SP
         HwIxxp0MbVCJSlzH3nF5cNt8u5+NZ7V5aNiaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=v31+jjDAe8b8bSeB3m7vjA69108ZFOl1IwaE1C9+p6g=;
        b=hlJcPChSy/k7e1+rDHia31tEdlQ0JNBUwhzMDaV+RYp8zuL4ITd2SCZL4j30wajI/k
         G+mopRA6eOISPv32C885ciNs2amT5QEaja/ZqyV1c/IQTmoYdNW4NJ64N2/bbygkIy4w
         erxZCA12VIDBo4g19QEwYgdp1rqAT42Xl06cp/0Kb+ljxylv0Q2rty1cq0oIPrEyeDcq
         uSCvRL3Hx1dQPdq/rAZgkUro0jiIYFAVNShurvRi1jxJ1GIWATJf2XDy673Cl2barJCe
         KS7zw9sPRK9cyzRLXxwNoWG9GXG0L33ocMCrxSIQhzyUL9O1IvPYVBWNHGWBzacv/9GV
         8fhA==
X-Gm-Message-State: ACgBeo2WLgBxUCaDacBvT5Srx4BRT7XSC1yRJkzb850BIvCx/Vht6MO9
        cmV2OxgusP2v4sHM7T55PmZftlx4+WfTu3WhXUB2PA==
X-Google-Smtp-Source: AA6agR7oXCZFuTC7Lzxlb4CwuONinxB3CRhuL08aLXINitOJmy/axmk0nwSsMf7iBwFXey4c13CPaDhDmRFCPlSAl6I=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr9407094otk.73.1661269036462; Tue, 23
 Aug 2022 08:37:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Aug 2022 10:37:15 -0500
MIME-Version: 1.0
In-Reply-To: <1661245527-5596-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1661245527-5596-1-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 23 Aug 2022 10:37:15 -0500
Message-ID: <CAE-0n50g9UUH9Jyy1_CGKLbXd096waP_Y4kPJiFmfqBaKMhG5w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: lpass: Fix the invalid index errors seen at bootup
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-08-23 02:05:27)
> After support for resets is added, qcom_cc_really_probe()
> would be called twice for the same cc which causes
> invalid index errors in qcom_clk_hw_get().
>
> qcom_cc_clk_hw_get: invalid index 5
> qcom_cc_clk_hw_get: invalid index 6
> qcom_cc_clk_hw_get: invalid index 7
>
> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
> This patch depends on [1]
> [1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=667984

Why not resend the series and squash this patch into it?
