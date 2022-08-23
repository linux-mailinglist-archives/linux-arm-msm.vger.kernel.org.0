Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB8A59CED4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 04:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239669AbiHWCz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 22:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239198AbiHWCz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 22:55:58 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2CE5B788
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 19:55:57 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id o204so7069038oia.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 19:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=T+S/nKyRsVKnDI2NI2XWxFbudSWc5/W62WtWCj7xI5k=;
        b=FyTH6s+w0NZh2OcFL16yY9rrPwgEsLeMGuckTfZFJvUpiQgZhvKwNJDT6oZiYYI1Z6
         ahxK6O/w05oVFZ4wDew/xvyytGyxYN+aSDywQsmGUSyGn5wO+1YdQUKE/fCXgrv+Mdeh
         DuW/vVKva1riddVn6fvIhACtHvxgTngeF1ltc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=T+S/nKyRsVKnDI2NI2XWxFbudSWc5/W62WtWCj7xI5k=;
        b=z4/FhzlsWNPKZ5xc/PCm3XkGP/IvoEHx7aUuVTA1elkDSBo55ahU93aT7+3pZUxMJ9
         8oGI82cp0vG0RHr+l6r/u6HBnpMQXIDAQhv3X1oQC7HInX9mXitr13/asE9ABze80mim
         heNFmlz9auyksq9EPf8IqEeBM0N55Lky+MXEdgweilWr7bwxSv/V/J6l0EwnRgPxsnou
         8CZibP9RG6TLn4qjBrKCHgUF/Kb2ySr4Ta2LxDiYEWc35CBUOz0bg5xDBb1LiS1dWt9l
         6lkFMDaJrddWc+hlc1ctBnXOMYOXbGia1olNQcRcSSNp/eqnQr/2tP7myZAkG5SslK36
         Bw3Q==
X-Gm-Message-State: ACgBeo3G53QADnO89dWU9W7cfmbuOaXgU/WtzofpSKK3PYtwbf2TxKl5
        ZW9FO6A7Dv8eFJGQ2E0Kjtmv/EQ09mznJhARd/Zxpg==
X-Google-Smtp-Source: AA6agR5B1RXiqU24b10dVaT51Y2w8Tu58T9a6cri/gxITu0yRHhbmrCSL4kKosa2BPr7V6Lbpg9/mCneKS0FOSLLrzY=
X-Received: by 2002:a05:6808:1142:b0:343:86a0:dedc with SMTP id
 u2-20020a056808114200b0034386a0dedcmr510821oiu.44.1661223357058; Mon, 22 Aug
 2022 19:55:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:55:56 -0500
MIME-Version: 1.0
In-Reply-To: <e9760ee4-421a-5c87-4370-50262930aea1@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org> <20220711231638.GA449827-robh@kernel.org>
 <e9760ee4-421a-5c87-4370-50262930aea1@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 21:55:56 -0500
Message-ID: <CAE-0n50OhC=+twQiei8fdXjCAV_XpAW-7N2zDFQMu9Vx7Zyy+Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-08-22 11:46:39)
> On 12/07/2022 02:16, Rob Herring wrote:
> >
> > But this is the wrong location for 'data-lanes'. It belongs in an
> > endpoint node.
>
> I rechecked the existing device trees (sc7280-herobrine.dtsi). The
> data-lanes are already inside the main dp controller node. I'll take a
> glance on fixing the driver to check the dp_out endpoint (and update
> existing DT to move the property to the endpoint node), but to make
> schema compatible with the existing device trees we'd probably still
> need this property (which can be marked as deprecated once the proper
> endpoint property is supported). Does that sound plausible?

It would be nice if drm_of_get_data_lanes_count() took some port and
endpoint number instead of a node pointer directly. Then you couldn't
mess this up as easily.
