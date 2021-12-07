Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F30C46AF2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 01:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354242AbhLGAdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 19:33:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354228AbhLGAdZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 19:33:25 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4998C0613FE
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 16:29:55 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso637003pji.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 16:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JFL3a9BAYZxoPiyJ9z8spwDTdM7PhrtvmEyrxDtZRok=;
        b=XwgclYJMnSTCpHdW7a228z9KW8jBcv/cslPUgF703S+wkiaP/lUQXC+cGactY7lXeG
         4SHapoJAU/OSXP3kEYONYNBy9YX08hE/r/Vdz2qC8DrZcHNCK4PZv2nK87ITxsxmpw8A
         mf42HFfH7FAOSfpyVzn0J/Mod0E9oEK2Z9xhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JFL3a9BAYZxoPiyJ9z8spwDTdM7PhrtvmEyrxDtZRok=;
        b=YAuKcLA1F9Dq8MQTtvTH8KjJP1mARaESgCGPMwwFy3zfwbW99y2ce0jVzMCaXvGg3Q
         8LSIK2E/myqim7l20XVNgNSaiN3WI+JxIMD+t8bGmsR8y7xUCe8gg2lXLl8bxXmrBN29
         cLdKOwUmi6PAbOE8G2krjd0FIpimrqzPtqmJcV/Vva5ufYpTJN5GaOX0JAKBzwdVpCBY
         Sb1hVPziSQtBI4dEPhjumnGyn8VZ2JsqFNeUL9nHKGUb4zrgR2t0gUlsvIQifF22xgUn
         Z/8Ddtcsq5pS5NDP/EB2aDmWaNk35psTtKkyiqmjT2PnsggrE+3L2Aj9Ab8v1jPZAQro
         kVhA==
X-Gm-Message-State: AOAM533a/MD+rJSoCazkTLLIjFIig83i91kpdbILoTrDjmAhGwcrtMhQ
        4u6RB1lrrrwsnc98sqMt5oy8aw==
X-Google-Smtp-Source: ABdhPJyu2gXkmFVy2jBSwD5NikHxHYUQekaMuJzFF7uNw87YY3rZyctiaHhY1+HGMxIXBEJowJiJ4A==
X-Received: by 2002:a17:90b:1e0c:: with SMTP id pg12mr2411598pjb.135.1638836995310;
        Mon, 06 Dec 2021 16:29:55 -0800 (PST)
Received: from localhost ([2620:15c:202:201:ab1b:c09c:ed69:5925])
        by smtp.gmail.com with UTF8SMTPSA id mq14sm523121pjb.54.2021.12.06.16.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 16:29:54 -0800 (PST)
Date:   Mon, 6 Dec 2021 16:29:53 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        swboyd@chromium.org, Wesley Cheng <quic_wcheng@quicinc.com>,
        robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: dwc3-qcom: Avoid use-after-free when USB
 defers or unbinds
Message-ID: <Ya6rAVgZ+hSYNaVE@google.com>
References: <20211206152844.1.I411110cc99c1dd66b01aa9aa25651acf8ff55da1@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211206152844.1.I411110cc99c1dd66b01aa9aa25651acf8ff55da1@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 06, 2021 at 03:28:47PM -0800, Douglas Anderson wrote:
> On sc7180-trogdor class devices with 'fw_devlink=permissive' and KASAN
> enabled, you'll see a Use-After-Free reported at bootup.
> 
> The root of the problem is that dwc3_qcom_of_register_core() is adding
> a devm-allocated "tx-fifo-resize" property to its device tree node
> using of_add_property().
> 
> The issue is that of_add_property() makes a _permanent_ addition to
> the device tree that lasts until reboot. That means allocating memory
> for the property using "devm" managed memory is a terrible idea since
> that memory will be freed upon probe deferral or device
> unbinding. Let's change to just allocate memory once and never free
> it. This sorta looks like a leak but isn't truly one, since only one
> property will be allocated per device tree node per boot.
> 
> NOTE: one would think that perhaps it would be better to use
> of_remove_property() and then be able to free the property on device
> remove. That sounds good until you read the comments for
> of_remove_property(), which says that properties are never really
> removed and they're just moved to the side.
> 
> Fixes: cefdd52fa045 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
