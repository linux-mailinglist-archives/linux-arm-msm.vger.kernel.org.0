Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9021A51DA90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 16:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347737AbiEFOeo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 10:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389485AbiEFOen (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 10:34:43 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110805AEF5
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 07:31:00 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-edeb6c3642so7374845fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Z3BhvNnZeKv1IcmAFTPQ8BjykroeJGCMjBhzdl/UNHM=;
        b=jO3oHxuDXU4qKNmreCjjYaiO4yOFVMLlHvrgsIknXQpO28ujlFHIX+YGJMNDAohf0S
         DZNeyUI7z2EDLgUqTLJxUWdlh1QK08j28ZN3csKfsdDpAqlRFloCzirijmDCbWZLcZyE
         C6gdUaugeCxwk+y28GBfLl9pvOmB54KmpIvUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Z3BhvNnZeKv1IcmAFTPQ8BjykroeJGCMjBhzdl/UNHM=;
        b=xbJydrp7FGGKmU5TISFEWR71fUka6JDSetUXN3Jy+pEE8OxKCeQDuApXwx2R+87a9l
         vUsSrCW3L82FPPAcW9uDlhR/9cyCyE5L7ew54c5LerUy90XUsuI9mCI5T0LfOvzYG97z
         m17vQyr+58n0SLRF60njNxQRoPOWOQRX73vcNqid95SqDsT3p2DnhTQKAOI2L3pnD6qX
         2YfdWApMk0EG9W7QVd3hG1KX1rTIrkpjm4MFDATfgDwutp6R8WMHkmZ9vZ/007AHnVW8
         9zfmT0xEe3KxfMPXkSp/WBetdzx5XKYSoZqty2IePvqeQlWcivU5FOaYXyyc4FVSxoXq
         YFeg==
X-Gm-Message-State: AOAM532+9km2fPxl82KdqdudIqBp++0e08Bm3VGWNN9yfUa3eks54ZLh
        ti5k9b5XfDT7AelVUL7nD4CdQtqVEaR2WRO/cFUwsA==
X-Google-Smtp-Source: ABdhPJzE+vXk1hqtD9UBfXOO2I3rdrl0PyEIZMyce2ypHXN0n1NbIBLqFN65uSkfs/ck6n2qBT6ImYvZZMQRqp20FeQ=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr1383802oal.193.1651847457937; Fri, 06
 May 2022 07:30:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 May 2022 10:30:57 -0400
MIME-Version: 1.0
In-Reply-To: <YnSYppSYwaoZRXb4@builder.lan>
References: <20220426225748.324759-1-swboyd@chromium.org> <YnSYppSYwaoZRXb4@builder.lan>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 6 May 2022 10:30:56 -0400
Message-ID: <CAE-0n50PaacK_zT1NPoj+9YA9GX4oqpADEHObFdK+Zyu67Guig@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Remove cros-ec keyboard
 from detachables
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2022-05-05 20:40:22)
> On Tue 26 Apr 17:57 CDT 2022, Stephen Boyd wrote:
>
> > Trogdor devices that have a detachable keyboard still have a
> > non-detachable keyboard input device present because we include the
> > cros-ec-keyboard.dtsi snippet in the top-level sc7180-trogdor.dtsi file
> > that every variant board includes. We do this because the
> > keyboard-controller node also provides some buttons like the power
> > button and volume buttons. Unfortunately, this means we register a
> > keyboard input device that doesn't do anything on boards with a
> > detachable keyboard. Let's delete the rows/columns properties of the
> > device node to indicate that there isn't a matrix keyboard on these
> > boards.
> >
>
> As this seems to directly relate to the final design of each device,
> would it make sense to push out the &keyboard_controller from
> trogdor.dtsi? Or do you think it would be too much duplication for it to
> be worth it?

I tried it out a few days ago but I'm waiting to see how the driver
patch goes before sending the dts bits. See the WIP patches up to the
end of the chain on chromium gerrit[1].

[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3609017
