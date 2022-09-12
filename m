Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E746F5B5B41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 15:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiILNdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 09:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiILNda (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 09:33:30 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B1E30F6E
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 06:33:26 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 202so12739707ybe.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=otGb4AwYTfhIb4lKpfRenMAoPDU49k1ZwLwvH7P8lco=;
        b=oSnDlq+OCQ/AA+yITuOTcepJuxj6xvCZxw0N5R5P9qmL163t3H2HLzasOd5N0qFdXa
         aeE6KYgW4Gn6DNc+ftjU0SIDgy/vDzwRSAh7n/TffeO0zEdp7js0b5/yfFCQnyRUwJ4s
         Svi/gN54DZ0MkDW5HHCVum2hlI8RK0wC3yXo2vsfYC1sucOpHj8P4wI4XYK00Oj/xobo
         IBs1krtBJDHqiTsX2EP74bwEvhUlB5LyxDSLSS+v8ey3wNgtK88elLZJXWIOWNeK7t7t
         3tI5wH0BqKV9FKliDAHstgaifLIjIdUHx++kBXGaRnLI1H3l/rMamyTBurTzwKiKcGUp
         BRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=otGb4AwYTfhIb4lKpfRenMAoPDU49k1ZwLwvH7P8lco=;
        b=p/tJxrlz1xyAO5q5fiIKolyDcimDrVtvyN36gc9wD3BjMKVt8MQtq/wnx+/858xx2v
         XSc58wiPgLQetHPhQCsOB3jFYMtBRSDUWT4tumkMTdT6t51lNn9NIz5CW6lHv2p5s3Cj
         zSLol5d0S1XSg8p3i8xZLZ+P0beJnmneaIsNDvyV9cXM2V412jnTuW8ezDLbQ1c9rBZx
         LZfDRnM4rslCTbf37qB8z0wIRNji99gZapTwf/wJntkUlxHsIqmnWAZhbJHTybmMMCK8
         ZjTmafq/XJ6ykNBW+5AxuJBlueBDANkfWm2S/IB7XdcMfmxuHK6O0EmOCVVXizYIlQR3
         NWEA==
X-Gm-Message-State: ACgBeo195fL1L6upwqY781iL3aLAEb6zusVDu9iaV85zMAyAeFUag71l
        n05T2jcRwYpyKzFMgR8Icw2uFQ67HnUguiri500V8Q==
X-Google-Smtp-Source: AA6agR6zrEM49/wYG3jG8qpjvQyM5sg73lbnKFExy/6Q0tgOLI8rFalUyzIkO8PSye6Hy4pcCfvfBnZXy7mqihPmj+M=
X-Received: by 2002:a25:ba45:0:b0:67a:6298:7bac with SMTP id
 z5-20020a25ba45000000b0067a62987bacmr23760581ybj.194.1662989606018; Mon, 12
 Sep 2022 06:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220910170207.1592220-1-danct12@riseup.net>
In-Reply-To: <20220910170207.1592220-1-danct12@riseup.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 12 Sep 2022 16:33:15 +0300
Message-ID: <CAA8EJppKzZqGm6fSwpobOXoGNkPGy==w-XbFXLwFEMRTVgpRpA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: sm6115: Select QCOM_GDSC
To:     Dang Huynh <danct12@riseup.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 10 Sept 2022 at 20:02, Dang Huynh <danct12@riseup.net> wrote:
>
> While working on the Fxtec Pro1X device, this error shows up with
> my own minimal configuration:
>
> gcc-sm6115: probe of 1400000.clock-controller failed with error -38
>
> The clock driver depends on CONFIG_QCOM_GDSC and after enabling
> that, the driver probes successfully.
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>

Fixes: cbe63bfdc54f ("clk: qcom: Add Global Clock controller (GCC)
driver for SM6115")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)



-- 
With best wishes
Dmitry
