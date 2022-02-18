Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACFAF4BAE47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 01:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbiBRASZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 19:18:25 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:52846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiBRASY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 19:18:24 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7791A3E0E0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 16:18:07 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id e19-20020a4ab993000000b0031a98fe3a9dso1619365oop.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 16:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hEW6W+WPb66D5yQ2HyIlOM4vWPvf0YgZjVX0YM4ZwrU=;
        b=Ede8pUTVciwdV/PbVRfW4xH/weuMY9hLAfTAUcQifXPFB0t8O1+/rpu29GyBRzH0Fv
         b41j6430H5X3BZkOmWOYFQD3HJZuIaIqnG2umegoXdMcVc0iakXBVGwFluzAmjR2f4yu
         GRnSC86SW6XZfqMNEkA5uwjbo7RLKTeuJZPBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hEW6W+WPb66D5yQ2HyIlOM4vWPvf0YgZjVX0YM4ZwrU=;
        b=AE7Om9jyujLEkaoje40R4PfbZWkPNCYyuhOI7khWz0lfeDP7W3/aASWeNFcQDa7bkp
         IwHKOb1C0Mkqwr3CaoG3tKL9nZtFTkV3D7iYLmVdvnpf751Kz2YNK/frTeZdAu794gQK
         6RFed9jcx4lMko5CWWtLkiLzoAYv/y7JuVR43YEg7sM9g2g9TjxJ1GbnOWJfCaBvxZsU
         tlqfpgdgahezbrSajllp7G+FVjQAYwNXnFSh0jDrt85JBGSY2VhruVRrWk79Gjew5UbU
         zOPLhH5yvO1mjz43YPEDEvWHko2rpwU0tHxZ/F9bS13i6tWqyzp7Au/EOBJKIVtQYCkn
         aPrg==
X-Gm-Message-State: AOAM532CI+WCJIE3WJbDwvrp/6glfZxDAoKSn/kX4ZFRPL9cuKm2fjZ6
        kXybU+yB/yHkPebIsTDGO8Ahg7LlOECtYGI3fBo8f/NiZQc=
X-Google-Smtp-Source: ABdhPJx6rfQGpfogn9b+3AWL3uxEzo7fTCqTdSw67tFVNcpJOgvBYjrkdrK/g917csIE+MLe8s8h6Wp/Sknz8nrtzoE=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr2119170oap.54.1645143486794; Thu, 17
 Feb 2022 16:18:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Feb 2022 16:18:06 -0800
MIME-Version: 1.0
In-Reply-To: <20220215201539.3970459-2-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org> <20220215201539.3970459-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 17 Feb 2022 16:18:06 -0800
Message-ID: <CAE-0n51kA+XBLdRheZ+A6Y2zmWp9Zc7o_Agap4FXtY1oxxJ4Lg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: clocks: convert SDM845 Camera CC
 bindings to YAML
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
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

Quoting Dmitry Baryshkov (2022-02-15 12:15:35)
> Convert clock/qcom,camcc.txt to clock/qcom,sdm845-camcc.yaml.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
