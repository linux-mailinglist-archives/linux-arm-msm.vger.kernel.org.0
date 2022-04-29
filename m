Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3D4F513F6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 02:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348693AbiD2APU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 20:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351030AbiD2APT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 20:15:19 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3229838D87
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 17:12:03 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id w17-20020a17090a529100b001db302efed6so4340276pjh.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 17:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iuNk9MwvCvbcUppmRdVoXyJvLMt+O/9GswTClaDk/QM=;
        b=nWfkeFVVLQdjCRdfHRtk0H3wnlkeTaDVtdQC75mQJ/tOw2zRRrQwrl/sJAIpipBuPh
         byJp4Evcvz6giHI0Cfq9iLl4hj6N/Dcvll8yOLY2ObcC1IqMgNOrHsr3NmVj1uyZ0SMV
         qyxCkuv6bajjM3ZxmMMvm4WlG1VuhqXLNbWOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iuNk9MwvCvbcUppmRdVoXyJvLMt+O/9GswTClaDk/QM=;
        b=5aCBYaeJrIjnxt3klueskr36e8gG0zLR1m2CQGHYURDGgvLHX704X/1E0UYahHFf/F
         72Xs9A+tJFPD2wwW7qfVgybFRG793b1M+0YypI4llf5r3pU5MoJ75BYkWyGeB0gGhabo
         pPP5ypMCK7TU0ofjztoywkitVWu4o5a0BgkWRsQgfwN980cASFLMlnh8936znrNBuNek
         lX7lFQkCVPUZrX+IbI4piXd09ntZ5Zf8uJWVwJRnzRCof/FGWb58k+/ZygcJqKOKLYy6
         4SMbGRAuFMva7I9x3B8YRG/HYfFCUG1DZvpiXVE47LrGunKDZxDNCuIr+LNFAIqSoeQ8
         diig==
X-Gm-Message-State: AOAM530WHQbX7UiXUhJTDEpco+DyrDjmTSbmChKQj4OTFx5Rckjm3dsD
        xw7JMSPLpjhTpN/ev8wAwpREKJ5LNESNxA==
X-Google-Smtp-Source: ABdhPJzcIuW/yBWAQUiE+LCgHZN1NHWgqzTsexx1tr6RbE8PgNgW0Cskvr5D7aO0nCb9SiDzr4B2gA==
X-Received: by 2002:a17:902:c408:b0:15d:1234:3434 with SMTP id k8-20020a170902c40800b0015d12343434mr23711839plk.67.1651191122732;
        Thu, 28 Apr 2022 17:12:02 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7d14:5f45:9377:9b6a])
        by smtp.gmail.com with UTF8SMTPSA id q10-20020a056a00088a00b004f7ceff389esm944209pfj.152.2022.04.28.17.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 17:12:02 -0700 (PDT)
Date:   Thu, 28 Apr 2022 17:12:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc7180-trogdor: Simplify
 spi0/spi6 labeling
Message-ID: <YmstUBkqAdWvMnm7@google.com>
References: <20220427020339.360855-1-swboyd@chromium.org>
 <20220427020339.360855-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220427020339.360855-3-swboyd@chromium.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 26, 2022 at 07:03:38PM -0700, Stephen Boyd wrote:
> We had to do this spi0/spi6 flip-flop on trogdor-r0 because the spi
> buses got swizzled between r0 and r1. The swizzle stopped after r1, but
> we kept this around to support either hardware possibility and to keep
> trogdor-r0 working.
> 
> trogdor-r0 isn't supported upstream, so this swizzle is not doing
> anything besides making a pattern that others tryt  to copy for the EC and
> H1 nodes. Let's remove it and simplify the dts files.
> 
> Cc: "Joseph S. Barrera III" <joebar@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
