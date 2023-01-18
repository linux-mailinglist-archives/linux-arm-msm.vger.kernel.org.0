Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6E97671A6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 12:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjARLUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 06:20:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjARLT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 06:19:56 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D69266FB9
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 02:35:47 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id q8so12518814wmo.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 02:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M3wabZmt+CW8MDjtdB4ADkYP9LZbXXt68/tBoGAwjTU=;
        b=mo4No3sRnKkl/ddBb1xHJyihMQql5EKqedm5MWYJq/obEeE5bvAbSuOEAJMDK4mny6
         NQoC2CEK/RJtumgWyoaXnyYLkQU5ktVIsI64sUbnSZ45M/ksKFuzRfiBNlmofFmlmQ4Y
         bsEoDOq/gZ+vqDX++2t9fExyA/1vCKqKHAwz0ClthjmRJvpcVfUmvsvPYiczZZjQL0Sl
         cRvuL/uCJ8N1hA7Mj5GcnlmSTj3WSMdh8RK5KP/fMsVhYIRJd0zOlUyMW5U2JBXqb5aS
         qjfS0Ijjmhpg3HPKKkPEnFzb3DW/jKdrfWR/ywCHAj6y/J8aP0xaeuLSXMHgzxFnO0sI
         /Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3wabZmt+CW8MDjtdB4ADkYP9LZbXXt68/tBoGAwjTU=;
        b=igB/14qhdMxIHP1zUudHEP3Yw8/QsEkATJTOU2ymaTLBRIIJ1Q3PWCsCDDS45ByCof
         QKQXgWKp5XibelAvA4MGgNlP4AlkZIudxelOv9yHH/7jZnsX3vvrKmk5Yh0dEUJz5ymV
         Jtuex3G+BAtfLier6WtKSLHhTmhq7vCCvpGiQ+B7r4Nom/ZbBrsF/z0k6ugI1gzhDbmy
         NUH0apv/Ho0p6xfzaS/yYsvSp/0EXAGnxEvucyfU0kTU3OttcaC4LKhNiwICcL+HWULV
         yyRTkTARwuBUJlE5zlp8Rvy1Bve/L06jF1SyMr9zZGO5BpJdcg9BtlIIEfriVGOaWPwn
         w0rw==
X-Gm-Message-State: AFqh2krNbUYmd5swm78W79gj0P/gZoPRxlLQtR7nq4XFKx7yxFr1RFM5
        dITFJ3QAxwHzl7Zribuav8i6BA==
X-Google-Smtp-Source: AMrXdXvmuJWrXQyoLVtdV4WDtX5woWaRANn1AadmaCH0aM/Jy2xGqNA0mqTaNBDVqA/O5ChuFdfeCQ==
X-Received: by 2002:a05:600c:a4d:b0:3db:1d6:16f7 with SMTP id c13-20020a05600c0a4d00b003db01d616f7mr2114059wmq.23.1674038145812;
        Wed, 18 Jan 2023 02:35:45 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b003daff80f16esm2042804wmq.27.2023.01.18.02.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 02:35:45 -0800 (PST)
Date:   Wed, 18 Jan 2023 12:35:43 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/6] phy: qualcomm: Add UFS support for SM8550
Message-ID: <Y8fLf056H8IjrwSO@linaro.org>
References: <20230117224148.1914627-1-abel.vesa@linaro.org>
 <Y8eqdcLthEaYq/Pp@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8eqdcLthEaYq/Pp@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-01-18 09:14:45, Johan Hovold wrote:
> On Wed, Jan 18, 2023 at 12:41:42AM +0200, Abel Vesa wrote:
> > The v4 of this patchset is:
> > https://lore.kernel.org/all/20230117142015.509675-1-abel.vesa@linaro.org/
> > 
> > Changes since v4:
> >  * Renamed QSERDES_UFS_V6_RX_UCDR_FO_GAIN_RATE[24] to
> >    QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE[24] in patch #4
> >  * Added Dmitry's R-b tag to patches 2, 3, 5 and 6
> 
> In the future, please include the full changelog here even if you
> provide a link to the previous version. No need to make it harder than
> it has to be for reviewers.

OK, I'll do that from now on.

> 
> Johan
