Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0132A27D679
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 21:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbgI2TJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 15:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728640AbgI2TJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 15:09:13 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66193C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 12:09:12 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b124so5505778pfg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 12:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bgjd/B7KdoGPIMOIsXPxTUv6rCgIFOUt5UmLgFf58B0=;
        b=dQ3pMRX6HmaArThDUQARb24+Xjkm3nNSp0LQnhrkH6Q8VE0a/qS2n9MzFLRfLNmvOA
         UYkRtz/DV0vQeV88BnNct2Esl4yQ+YbNo9QCYNYX2j6ozt2VVH9Ecvs4926enaBsO7DU
         XHL08Vy0QLO5NSbOVSjZXVQixxmTN4VELBTnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bgjd/B7KdoGPIMOIsXPxTUv6rCgIFOUt5UmLgFf58B0=;
        b=HyvCdmdaL+4coziMWLSH05Mz/aAc/VIkhgCGrGgNQnDdxw/RIeuHBhaYh/ewlm0jL6
         zmO39RGvtSE1/vFMy+CuYbhKxhyiahK2AOqDJYuzMETi10kWgWRNU9cYK672GePZqOrL
         oy3NUQLdXkyX81YlG91GYimzXMn3QMElixCpF5ctqlX1izA6tqz/hxE1GDrqSs5+e4lt
         KFTHFI/3PVPwaoeRbF7mXZ4yNXR0pQtiRwdk08dvTciS2Hc0nh9CBjHFUXEGp8tv5j/H
         RWTCHGkFdfv1p22UE57GXg+2aH4ZGZlUrPvp4tHsdu8a4BX5nJWMUehpaPbXePEe+HsD
         gM8w==
X-Gm-Message-State: AOAM532IS+0ASPiR2ej5ieSfZuIkDUUwueY+5L+p7RNsZgW+DhiRPBW8
        92Mf0ymTHiwY5tcRNLIsm2aKeQ==
X-Google-Smtp-Source: ABdhPJx3wUAAoTGCE0/p7O5ml66HnFt41zubIJc2k9Hv2XO3LVJyfT1FoSHimEJRWNPzejOkyZ/F1A==
X-Received: by 2002:a62:92ce:0:b029:13b:88f6:3935 with SMTP id o197-20020a6292ce0000b029013b88f63935mr5110872pfd.2.1601406552006;
        Tue, 29 Sep 2020 12:09:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id n2sm5451462pja.41.2020.09.29.12.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 12:09:11 -0700 (PDT)
Date:   Tue, 29 Sep 2020 12:09:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sc7180: Add wakeup-source
 property for USB controller node
Message-ID: <20200929190910.GE1621304@google.com>
References: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
 <1601376452-31839-6-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1601376452-31839-6-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 29, 2020 at 04:17:32PM +0530, Sandeep Maheswaram wrote:
> Adding wakeup-source property for USB controller for SC7180 boards.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>

nit: it would be better to have two separate patches or at least mention
in the subject that this change is for the IDP and trogdor, not SC7180 in
general.

Besides that:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
