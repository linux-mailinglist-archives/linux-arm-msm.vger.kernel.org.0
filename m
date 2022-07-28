Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26CB35846EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 22:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbiG1UHC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 16:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbiG1UHB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 16:07:01 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BD07538D
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 13:07:00 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id j22so4981208ejs.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 13:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=b99vshAhGChh3A9VDnm6KS29Pg4yAPwV39WCn0DHyEw=;
        b=j/cVnyPJc3NbVdA6KozIiXB7d1QQk+XXmRNE0ZX9Jr5ze1E0ZnY/NdUc8lE2pzXYHK
         T0jUhZs+w+0Rdv0Ke7Ah2OmBDArPN9qCD2CvffXu2uKVOU1h8HOBkyCChfnrD2nfS7e1
         g1n0sndpcyCYQLwBxOrKsGhccrjtnd+evojNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=b99vshAhGChh3A9VDnm6KS29Pg4yAPwV39WCn0DHyEw=;
        b=K6PiFKJ2ltTAbDlHBBJRi2hlvHrMMImc0oChasi62sV36Szla1BLbIwBbCkg9MzAV8
         PJ3GYusYaq0Ny6mYgNFiMyxN0wnRFzeOpkTVRzA4jH4RU5JUqHwzc+sbRh6mFZN6cxvt
         LAuhxYbAuQAjCBhQHU2+C+/l6bZvX+AAyE/hXbjT5XQSra2pupIYLpR/jHROIRhxtqS9
         TPD8RwoHqTzXAiFaXpTCj8tjM82nD694oz1/gbYc30SYNACR6S+mgNMhvdFl5AOALmWd
         Wxvzh9Ia5n/OhOU2N6wnYuNVoV3r2kv67dfqQjdVSH6aBh0ZxINlfqiSLX4NePiSylCv
         bIWg==
X-Gm-Message-State: AJIora9S94W+Z2kIgcu6CjbCEP7YpOyuRTcOLju2/kEdjA1LGxykkjRY
        s/w5dxxFtTQzMfcQs4mWDLckQFnQnP3XgV/X
X-Google-Smtp-Source: AGRyM1s3TMVOjRAFOFVsbFE+XpKxHYL8lJCG6owI7n33nRWIhHBUBYWiAU9DHxUe5hRE3gyB0hhNhQ==
X-Received: by 2002:a17:906:8a65:b0:72b:67b7:2c26 with SMTP id hy5-20020a1709068a6500b0072b67b72c26mr407534ejc.212.1659038818532;
        Thu, 28 Jul 2022 13:06:58 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id v2-20020a170906292200b0072b51fb36f7sm757328ejd.196.2022.07.28.13.06.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 13:06:56 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso3144998wma.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 13:06:56 -0700 (PDT)
X-Received: by 2002:a05:600c:1e0f:b0:3a3:191c:a3c8 with SMTP id
 ay15-20020a05600c1e0f00b003a3191ca3c8mr292036wmb.151.1659038816119; Thu, 28
 Jul 2022 13:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220728105005.v2.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
In-Reply-To: <20220728105005.v2.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 Jul 2022 13:06:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=BbNDW3R0bRoJNrOz61KSop4NorP-6QQKYHVu5wnTMw@mail.gmail.com>
Message-ID: <CAD=FV=U=BbNDW3R0bRoJNrOz61KSop4NorP-6QQKYHVu5wnTMw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: document zoglin board
To:     Bob Moragues <moragues@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Bob Moragues <moragues@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 28, 2022 at 10:51 AM Bob Moragues <moragues@chromium.org> wrote:
>
> From: Bob Moragues <moragues@chromium.org>
>
> Zoglin is a Hoglin Chromebook with SPI Flash reduced from 64MB to 8MB.
> Zoglin is identical to Hoglin except for the SPI Flash.
> The actual SPI Flash is dynamically probed at and not specified in DTS.
>
> Signed-off-by: Bob Moragues <moragues@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bob Moragues <moragues@google.com>

Something is still messed up with the way you're sending this. You
don't want the extra Signed-off-by here. Maybe try again for v3?

-Doug
