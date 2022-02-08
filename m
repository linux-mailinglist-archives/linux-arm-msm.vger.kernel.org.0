Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80D14AE225
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 20:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385981AbiBHTV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 14:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353732AbiBHTV1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 14:21:27 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10B1C0612C1
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 11:21:26 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id i17so105145pfq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 11:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UhavSf6/PjLtcvbyACqW8jGku1F0ZcAYhxKvnz50uyk=;
        b=U2noTsnkm3tOZvzPpceZca56VFNluoTSh6g/S3biOqsXmLxbbYc9tERNbd4yLw/ZXJ
         84E7qCLw5V7LlIEPsju4nbV89b7LndhjrJjInhy9ANb/7DtpXIQGNYTvdG8SmfO7ZUJV
         A98/Jx482W5M14B5nyu3Yc17XqRY6Le8ivpHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UhavSf6/PjLtcvbyACqW8jGku1F0ZcAYhxKvnz50uyk=;
        b=OudtY4Biq5fKnkRYUL18NVkbvmRo5qffYM4SCxZRUpQMiVLkiRzElVJyUUtEQg5krk
         201cPUAtps3ngNcwLgDPpJU8GOOW7VkQMQIm0nYVlvNDOuve/NDUez0s/9U6H9TGyj7H
         nwX+3/gG6qIpq2zEoluuIrGc6I1Xo9YAVUE/0lwYbbWfTXmMrPF8o2FnrtNJEqTugcOK
         6b4QMukW9PcuUYTDyyScMYYqVl1Yzq8Z07LKbLcc1rB0PpTGaL9hmG6rbeTToYo+Rdnn
         XPUJR2JIWi6wlWgnPUZkaZmmomT42/8IKzmDw89Z6noHx2qaBm23L3R//GbJgrLfw0aH
         4CVQ==
X-Gm-Message-State: AOAM5316tjPY1+bpdd77E3aazrGz3r6PeJ0MPJxJMbnw+JYXXkrvK5ST
        T7mRZVXS3afzzNYzaxB7JwKe1A==
X-Google-Smtp-Source: ABdhPJz3wptJKt4/VswS/EBMC3E5DN8IXupK2rQoiNjmyWcS3/9KlyODv1tDCIcGMnVDlIcM7TKg+A==
X-Received: by 2002:a63:4142:: with SMTP id o63mr3898654pga.425.1644348086316;
        Tue, 08 Feb 2022 11:21:26 -0800 (PST)
Received: from localhost ([2620:15c:202:201:23dc:d215:b887:777d])
        by smtp.gmail.com with UTF8SMTPSA id 38sm11947687pgm.37.2022.02.08.11.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 11:21:25 -0800 (PST)
Date:   Tue, 8 Feb 2022 11:21:23 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v20 5/5] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
Message-ID: <YgLCswtX/0THkzXT@google.com>
References: <20220119204345.3769662-1-mka@chromium.org>
 <20220119124327.v20.5.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
 <YgJMkFAxjazkUDZd@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YgJMkFAxjazkUDZd@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 08, 2022 at 11:57:20AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 19, 2022 at 12:43:45PM -0800, Matthias Kaehlcke wrote:
> > Add nodes for the onboard USB hub on trogdor devices. Remove the
> > 'always-on' property from the hub regulator, since the regulator
> > is now managed by the onboard_usb_hub driver.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> 
> No DT maintainer approval yet?  :(

Bjorn usually just picks DT changes into the QCOM tree when they are
ready, so I wouldn't interpret anything into the lack of an explicit
Ack.
