Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F38E3C6017
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 18:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhGLQIi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 12:08:38 -0400
Received: from mail-il1-f173.google.com ([209.85.166.173]:34636 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhGLQIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 12:08:36 -0400
Received: by mail-il1-f173.google.com with SMTP id e13so20096333ilc.1;
        Mon, 12 Jul 2021 09:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pI5llO3csYLYuoG15DHQsZScfJxEHKeCbRnVmq79qkA=;
        b=L6ncwvhyHlInJ73HkMBZZgTVSnKZOI3RtPkJa1pdLPoCuuy2mC6863nnUhzPaFgr5S
         I4Idvt8TBNHi474TsHlMEK1lI39Fho7+frFAPsKx4F4yuckDfm4bVwifKJVRHonTcikZ
         vRcP0KBcxgPVBHkv+AM4rNssivYSQtKsF6UdTPm67Ud6fIrTXiO4ijd4nIOer+gUsbQJ
         x9csqS4+CU7G/dxM/K0jaFWqvJbXTS8QTPtHLcOUJeLcbDEQr1Zu85Kr+S0O8xo7/I1S
         Lghd8RhZJDpyDU3BpFwjNdQ+m3jur8Uv3GHBgPpXr5/qaZJO9Djgnce+IhuIIEuP44v0
         F+oQ==
X-Gm-Message-State: AOAM5309ssqDIdVz8NF0lzNc5rC6KALIBvfCJf2QFT8jvRJ0Z5GhIKf7
        ePcVbmwnpUdp88zZ9akncA==
X-Google-Smtp-Source: ABdhPJxzziVfmbMO1ZuL+/YD9IQYRzMx8c7br7Xbm6eKupbqSPEej1iWwvmDVbnXA8f3hD1cxun7Vg==
X-Received: by 2002:a92:6412:: with SMTP id y18mr40769652ilb.158.1626105947187;
        Mon, 12 Jul 2021 09:05:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j24sm3099609ioo.16.2021.07.12.09.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 09:05:45 -0700 (PDT)
Received: (nullmailer pid 2024711 invoked by uid 1000);
        Mon, 12 Jul 2021 16:05:41 -0000
Date:   Mon, 12 Jul 2021 10:05:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Pratham Pratap <prathampratap@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add support
 for SC7280
Message-ID: <20210712160541.GA2024641@robh.at.kernel.org>
References: <1625576413-12324-1-git-send-email-sanm@codeaurora.org>
 <1625576413-12324-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625576413-12324-2-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 06 Jul 2021 18:30:11 +0530, Sandeep Maheswaram wrote:
> Add compatible for SC7280 in QMP USB3 DP PHY bindings.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
