Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78C0954EBB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 22:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378764AbiFPU6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 16:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378814AbiFPU6J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 16:58:09 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1920028729
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:58:06 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id w29so2283373pgl.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3odd+CoUCDX7IoaEaSLss/9w0NCvjM2XDJMHtoPV8qE=;
        b=mEdlJCBMO2qy2bytIS50JuL1WzxojSbUNPCgMyaNzNr7HIKwfEDdRiJe8fEZBEOI8q
         oDjGz4YAlVH/8JUlYm5xQG5mOR/t3TR6mzu3cN6S2smcZad/pZe707JM4GjH6uCYrHtQ
         dY8+Q4dEU+ztLhY1qzevUho9I5d1LeVW2XF0FAjhT3Vo8hEk1Qfw68xcr7ObUvOBBUe0
         L5RX/WwsRh6QC7BUATzBt2RFaQyxTh+5/6T7XBO1bIAs6lK32Zc4Y1tdBIS4hmjA+QLG
         yGdvotjlH8Ydr642jmGn41gCmyE/uxs8AFcWWRQ61JvNfhwPP7MrW/NBLeLZPSMzQYNn
         moWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3odd+CoUCDX7IoaEaSLss/9w0NCvjM2XDJMHtoPV8qE=;
        b=CQ+G9hGGMAmnXp2JdS6WA7gaV3/nENXyz+cO6HFqUjiYi7UaUbN4uyA6nAiomJoo8y
         E4dXTBA4/QKFIPACE4eURjJ/izHGccHFUf4ATZjH7A6Bw/UJwJuYFbvyMGpKqA2puj8w
         AvEj93kbjKSB+3L2YA/ILoVDAz4qXm/nZJ5ZmcoRFE3tS0/tOt5rRQ6Txoh6xxsqaXpQ
         asCpdx5+lGqJChUMmOve2LvyWvMcxQDB6ZY9LbGN7hazfWOtKp3qC1oMOLi/R7u6jTBf
         pDM3z3+YRVeDRhmAzu1WxT+GAOZl6R5ZmJFTXkPn/VLFqzFLmAkBQgI0CvVJ50qKhyVA
         MSYg==
X-Gm-Message-State: AJIora97rT3lQ8Od9iuk0+pY41KGVN6lHiXeUK7anW0DC83W83AaMpvk
        REfH/YxPI9hqWrPduDUyXAQFxg==
X-Google-Smtp-Source: AGRyM1ubYbWNsLiEkDJckGpD3XxEVsQvHLEChWPG1wS7oT5ke3l3ekzRFeKsT7B0AJBkaPynOQutSQ==
X-Received: by 2002:a05:6a00:1344:b0:51b:e3b5:54e2 with SMTP id k4-20020a056a00134400b0051be3b554e2mr6685158pfu.6.1655413085606;
        Thu, 16 Jun 2022 13:58:05 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090a778800b001eab0a27d92sm4123401pjk.51.2022.06.16.13.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:58:05 -0700 (PDT)
Date:   Thu, 16 Jun 2022 21:58:00 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Subject: Re: [PATCH V15 5/9] mfd: pm8008: Remove the regmap member from
 pm8008_data struct
Message-ID: <YquZWKQIMs5paD5n@google.com>
References: <1655200111-18357-1-git-send-email-quic_c_skakit@quicinc.com>
 <1655200111-18357-6-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1655200111-18357-6-git-send-email-quic_c_skakit@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Jun 2022, Satya Priya wrote:

> Remove the regmap member from pm8008_data struct as it is
> not used outside of probe. Add a local variable for regmap
> and pass it to the pm8008_probe_irq_peripherals()
> API in pm8008_probe.
> 
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in V15:
>  - None.
> 
> Changes in V14:
>  - None.
> 
> Changes in V13:
>  - None.
> 
>  drivers/mfd/qcom-pm8008.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
