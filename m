Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B904B7D68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343563AbiBPCK6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:10:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343547AbiBPCK5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:10:57 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E32FBA70
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:10:46 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id r15-20020a4ae5cf000000b002edba1d3349so895355oov.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=eOGRLRkS3e6dTdy4+VsuInylNMPOPtypXWpw081JkCE=;
        b=d3EOKXLfn2QjqppU+AbsJVRiA9w27o8GUwtOTW7lMqgN6+D8QDhBJKyNgzBVV2EibR
         DLQUjHF4BGcIoJ47MhqRcU0S7Dwy8i2sW2j2LseP9rQPKq5sO2TTk4Vy6qtEaCn+t6u6
         dBgM1T5YWbsxE0AO3PH6jBptWbRx24mBTJOBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=eOGRLRkS3e6dTdy4+VsuInylNMPOPtypXWpw081JkCE=;
        b=mU2PF6PHq5FoXFHkHQlM2GPlbBWbTZcRWh8QrWcKfO+zVZZtppZgv4mbrFD/kVVvw3
         1qRw5rwPlaKpiR38+11HyV2JOy0V+nXlnpOZtukLKeNqf7TY78OEEufcVUqj3Sn8jqeV
         b82zp97lEoqDusXzFcL2R2NWYOmvsk3FyjyP+DSPTiRDIgKYXlhwNWg3gk4K7/HvGJDu
         YuCQmP5/WqSuGs4dASw9lMRqtIjg8qljl7ja2qfmUfhVmJHW9H2EPiy0dJWD7FjMeL6Q
         GoQkhlQbIdMB0kiH+peZCkLhRYujbcwG+xdvuKxtdiZnrmqP8tU3JJLXtQeZrTS+fLcs
         lhYA==
X-Gm-Message-State: AOAM533O8afZyWTWf66b4TaA3GKQFJWHjfuWGs5vs6LAkgtjRVff9iVc
        8NTLvRXoQHDktVcUPpbgro6vbai1dDO2HgU3RWqgtg==
X-Google-Smtp-Source: ABdhPJzrN3Y1q7CHe3i8jMiQafAjvoaP/zBlEg6kWGGDyJQIBmexLpOXeN8Dr09gBIW5TjNknaxnK8JYghcdA6EzEfU=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr278296oao.8.1644977445823; Tue, 15 Feb
 2022 18:10:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:10:45 -0800
MIME-Version: 1.0
In-Reply-To: <f1b4b389-12f9-7c21-b117-f2fe6df58a89@linaro.org>
References: <1644952755-15527-1-git-send-email-quic_c_sanm@quicinc.com>
 <1644952755-15527-2-git-send-email-quic_c_sanm@quicinc.com> <f1b4b389-12f9-7c21-b117-f2fe6df58a89@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:10:45 -0800
Message-ID: <CAE-0n52G6Cu8douv_KuQEeVM-3vnwGT4dhai8kmiLJ4Fd9Qz8A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy
 override params bindings
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     evicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-15 11:55:18)
> On 15/02/2022 22:19, Sandeep Maheswaram wrote:
> > Add support for overriding SNPS phy tuning parameters in device tree
> > bindings.
>
> This does not really benefit the users and does not help developers.
> Could you please change the dt bindings to specify values for
> thresholds, durations, impedance, etc. The values should be represented
> in the human units (e.g. us, Ohms, mV), not in the internal register
> 'bits' representation.

+1
