Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103964DCC0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 18:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236755AbiCQRJ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 13:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236706AbiCQRJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 13:09:56 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DAAA6E1B
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 10:08:36 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id p15so12101867ejc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 10:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q5Dk3tkQjIlaPrqOA6z90+LBXNhzHRth/T+p5lzXnHs=;
        b=XtrIohyUga+/YPR1GXrxZurRryOfV+Ard/1stmQkplP+1c8/b1mRMWkpdvX2qzcy5O
         beBZ6ULmwZddHcZBLs4SMgpK4kkydpi9hzol5/glrJhNpNTQOU6bt+/1mOXF9oQ7oP1L
         WByoFcPQ3p6DuNXcp9kKDFguug8WgLNjCRgcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q5Dk3tkQjIlaPrqOA6z90+LBXNhzHRth/T+p5lzXnHs=;
        b=ZarazI9QKd6LEMhDd/vGlWiRUDFnMTaE9sPG2tj2G9F2UVYc4joeDPSQvrbrxQ61Fv
         BUeCdw83dRfqFuSVQgVDmh5tVwRVf3WGxhS1O2tt/OX5xCkFhlsxRzdYmzltx/nJ3H4Q
         UcQzYQNzv1AuZXEz+NC74owcLjMgpmmg13zFRHY9FbLXqEFtPuXiE1bhhPFcTgltbF4L
         Yi0aT5Z7cntKJHbCMEi4wGo0DUugUnozLH2DcdacvYtuq1WpjD8d1jw6TutN52tpYRlt
         6N1K/Q1Y2w3sdHVyJE+sJchzYzSbbKVvYkuqtFZQvXD5d4qByzSoqz9v9fcAFazPnR5q
         ihKQ==
X-Gm-Message-State: AOAM530VFXWQhLNXuiF4ZtMgfqgdhTfM1y6dVQpUxF+7iron3qThVxZB
        j1Ur8YZqzAscodcweAcrBEZFDv/53l14Vw==
X-Google-Smtp-Source: ABdhPJw4UgpZgsCDSBWOSY/TijNC2WeZrKqyUEwT3xJmkdwr951CD6c9Wz9ntUH77YnaaMqtqX90pw==
X-Received: by 2002:a17:907:6d18:b0:6db:f0e0:18cb with SMTP id sa24-20020a1709076d1800b006dbf0e018cbmr5367362ejc.340.1647536914270;
        Thu, 17 Mar 2022 10:08:34 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id o14-20020a170906774e00b006d5b915f27dsm2600454ejn.169.2022.03.17.10.08.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 10:08:33 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id k8-20020a05600c1c8800b003899c7ac55dso3745779wms.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 10:08:33 -0700 (PDT)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr12307110wmc.29.1647536912557; Thu, 17
 Mar 2022 10:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
In-Reply-To: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Mar 2022 10:08:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XeVGjGJVOx6OXBuMahjEsNQfrbYb_dZxJSBvQim0EjgA@mail.gmail.com>
Message-ID: <CAD=FV=XeVGjGJVOx6OXBuMahjEsNQfrbYb_dZxJSBvQim0EjgA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: sc7280: Rename crd to crd-r3
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Wed, Mar 16, 2022 at 5:28 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> There are multiple revisions of CRD boards. The current sc7280-crd.dts
> describes revision 3 and 4 (aka CRD 1.0 and 2.0). Support for a newer
> version will be added by another patch. Add the revision number to
> distinguish it from the versionn. Also add the revision numbers to
> the compatible string.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/Makefile                             | 2 +-
>  .../arm64/boot/dts/qcom/{sc7280-crd.dts => sc7280-crd-r3.dts} | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
