Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3D7513F61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 02:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343984AbiD2AKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 20:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237314AbiD2AKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 20:10:01 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B5F4EA12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 17:06:45 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id h1so5540672pfv.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 17:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HpV1ixPM2861kaxt/14eSMI/MvjDy1lHv4NPX3qirHg=;
        b=dBxiAOMlhDdXnkDqXxja8EyRt46K/yuShuxCEotxkqsZIN0izZzzQhLNPDyjv8vWOc
         xehVVwH9L3o+WkO5OxjRBImFCWTbRaRxhuWIyuTn3RjWX9QgfG0bHdiPkj4S1PatMPTS
         keEHoWPVYt/hl5oYi89OeLCtPc5ctae/zWa4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HpV1ixPM2861kaxt/14eSMI/MvjDy1lHv4NPX3qirHg=;
        b=F/NoWAvf0QLOfHRUcaMRb0KU/1KfsqnuleKy7s76+CDSAtYVmU03twXOGq3Yq//mm8
         dy19BWVmdlH3lFgzuRj4RFizfPuS+JJ+UvDo7+96URIt4fKJUgAyMq8hDOKLMwzEMzG+
         pCnYlJQArfO9C1alcyuPFpYYaRLvI80X7oCLFUlzKa0eAZnK+wRdFx3cGo9nCbo7GWpa
         4poP77EdWg7A01pP4D0vQeQDmAXyRDqmWqmfAs5xX8oMuGGQxTYmyjC8DZlkDIjOaTkJ
         ACb+S1Nw9mwtQKnDKFYqFy91MkhWmy+4YwZRtmJ7D+ymSDa0UO07Xrxf3T+B9n9zisvH
         hCVA==
X-Gm-Message-State: AOAM5332IwuQMP4fpPkf1lhl9vX7NSvhh0LArCLcdo3j6xX+QDPv1osk
        PZ0kSA35nmXPKM8H8wHHN4pv/g==
X-Google-Smtp-Source: ABdhPJyJyas/ZSpCB0U1vjVYqGWRrlEWh5HDYPMVm2KJ3Fv4/6HRmCPq/XV4joXVJj4FOucxbgl0pQ==
X-Received: by 2002:a63:115:0:b0:3ab:1c6c:c26b with SMTP id 21-20020a630115000000b003ab1c6cc26bmr21758559pgb.448.1651190804795;
        Thu, 28 Apr 2022 17:06:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7d14:5f45:9377:9b6a])
        by smtp.gmail.com with UTF8SMTPSA id mn12-20020a17090b188c00b001cd4989ff64sm7719889pjb.43.2022.04.28.17.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 17:06:44 -0700 (PDT)
Date:   Thu, 28 Apr 2022 17:06:43 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7180-trogdor: Simplify
 trackpad enabling
Message-ID: <YmssE8eX4FPpFduY@google.com>
References: <20220427020339.360855-1-swboyd@chromium.org>
 <20220427020339.360855-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220427020339.360855-2-swboyd@chromium.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 26, 2022 at 07:03:37PM -0700, Stephen Boyd wrote:
> Trogdor boards with a detachable keyboard don't have a trackpad over
> i2c. Instead the trackpad is on the detachable keyboard base. Let's move
> the enabling of the trackpad i2c bus out of the base sc7180-trogdor.dtsi
> file so that each trogdor board that is detachable, of which there are
> many, doesn't have to disable the trackpad bus.

Makes sense.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
