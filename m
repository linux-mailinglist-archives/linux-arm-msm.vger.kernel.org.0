Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 596B94DCE05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 19:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbiCQSxU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 14:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237671AbiCQSxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 14:53:17 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1E82220E6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 11:51:58 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id w3-20020a4ac183000000b0031d806bbd7eso7519872oop.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 11:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Ln5X3FYiET6quLutW+fBa5PAa2R/NGbsBbvlqsFX1AM=;
        b=eapkJ4LZQY8T81pdnb187KvmOcaFP3Md1t6sfp1G8G5IWg2d+1ijy0HUIQ/Rhtr9Pf
         3i5adY8bAYnRNC2pTJL6939FgWt2BAmYngpDRoOW/xazsRctafz1SHRzzhEz033at/HX
         HkR2YNNeBCqsp6DbDcwqnq+n/HBd9PtSJAEA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Ln5X3FYiET6quLutW+fBa5PAa2R/NGbsBbvlqsFX1AM=;
        b=YQ+O4rXQvlaWcSo42bCrdfEQ2MmDxaMHA2qnDR/Gz9funQnYS9JZd+Nl7/K2RCHL3k
         adGoqCWH/ULEBlI1LbTjHDcYj7728Ql1ine5CCyf4Lx8lKtvSLK8S0MC1wByLRO2YiQ4
         Bj3oq1sFS0Qpojq2FVWzM0TTAPM9shxIsmDZ3tNi0eoFVTwSPvvCei7Px+lk0aEVb9UA
         hCh27zMDojikZDpQxREcI9IEtJF2ALbK+K9i3x7j2kNfZYGMiaS+3mKNwI30mEGqhGJi
         W4TdyqFh8317OGrMnZ5u/WOh75Z13pIARhlHtIP/6R75lnxxirGZDaRS7rC2SzsZrQtr
         cILQ==
X-Gm-Message-State: AOAM533Lb8vTTWnE+rhvi5eXSaea96uXe8gw0GKlXD+LMnw7+rfZUJIk
        5m0Pz05A5XJGkmmVxVbhQkcloiIOgWTYzwcn4sAIQQ==
X-Google-Smtp-Source: ABdhPJwMlEAWZFipgY1vRYdu6iNFOqREpoDQgz2PJ1HtzdTvNDo0OlteL+UgXaH2WcO7uGn8L+oyNE0EVybinDppK4w=
X-Received: by 2002:a05:6820:199a:b0:324:15f5:a205 with SMTP id
 bp26-20020a056820199a00b0032415f5a205mr1823338oob.25.1647543117996; Thu, 17
 Mar 2022 11:51:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 14:51:57 -0400
MIME-Version: 1.0
In-Reply-To: <20220316172814.v1.2.Ib0fbb7e5218201c81a2d064ff13c9bc1b0863212@changeid>
References: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
 <20220316172814.v1.2.Ib0fbb7e5218201c81a2d064ff13c9bc1b0863212@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 17 Mar 2022 14:51:57 -0400
Message-ID: <CAE-0n516_kKzdfqz2NYw2ROEAd8_Zu+L_Rb2Kg-RhZAjnKTy5w@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sc7280: Add 'piglin' to the
 crd-r3 compatible strings
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2022-03-16 17:28:18)
> With newer bootloader versions the crd-r3 (aka CRD 1.0 and 2.0) is
> identified as a 'piglin' board (like the IDP2 board), instead of 'hoglin'
> Add the compatible strings 'google,piglin-rev{3,4}'. The hoglin entries
> are kept to make sure the board keeps booting with older bootloader
> versions.
>
> The compatible string 'google,piglin' (without revision information) is
> still used by the IDP2 board, which is not expected to evolve further.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
