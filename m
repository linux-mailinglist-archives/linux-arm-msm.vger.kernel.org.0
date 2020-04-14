Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D570E1A8D45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 23:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633679AbgDNVF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 17:05:56 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46542 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633551AbgDNVBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 17:01:32 -0400
Received: by mail-oi1-f194.google.com with SMTP id q204so11682878oia.13;
        Tue, 14 Apr 2020 14:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/4q9z9CtbQoeUL4sjp69CWFYfpcu9GjxICIs0C/YRTE=;
        b=hzxH4wZVRTjkuuoll0KwHDeNBQ2dAcHr4nIvt4rCg1eaWwsfiPuJ8Ikqs6TJ7Ratub
         /5afsp9RucGpvQ3+WIGB6rU0t8GJNF2Ybivew3vFuCDDaNTWdXgWC14yqwhyA3O/wrdk
         ZFTPRuZBhGQd8P3kJytli1BRYN02XIiUNKk4u1CPdWZmRBLEyxfSlTCF7H4WlLostI96
         DLtXH17Fu9nM2htCKl8aptLHyeOQS+YqG/CP12AUFwBD/PTRzGA4bIWFyB9XFQoSg0Cu
         C/39o5zWyjEew+TcmH+/bzloj2/laAQfCwvfdwgVJ3v/i5B7lV75tA+j7qUIeno4FWTz
         FMKQ==
X-Gm-Message-State: AGi0PuaQGZTEW43Hb0GzSN8cbYlHzax2wK1+e/5ymHO/e53kDnmJnv+2
        KJi7q+lAyImkdIvro4YkRg==
X-Google-Smtp-Source: APiQypI6YZD7oeKx39WNYQypRqxQiWc8g9J/Skpj6aGznKhkptIeKHcBjqvf0DXjF7vScaZA6pawWw==
X-Received: by 2002:aca:4286:: with SMTP id p128mr16319888oia.29.1586898084666;
        Tue, 14 Apr 2020 14:01:24 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g12sm1166031otk.71.2020.04.14.14.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 14:01:23 -0700 (PDT)
Received: (nullmailer pid 3300 invoked by uid 1000);
        Tue, 14 Apr 2020 21:01:22 -0000
Date:   Tue, 14 Apr 2020 16:01:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 23/33] docs: dt: qcom,dwc3.txt: fix cross-reference
 for a converted file
Message-ID: <20200414210122.GA3250@bogus>
References: <cover.1586881715.git.mchehab+huawei@kernel.org>
 <a055c564f2a79aa748064329d938db8b3c8edd58.1586881715.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a055c564f2a79aa748064329d938db8b3c8edd58.1586881715.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Apr 2020 18:48:49 +0200, Mauro Carvalho Chehab wrote:
> The qcom-qusb2-phy.txt file was converted and renamed to yaml.
> Update cross-reference accordingly.
> 
> Fixes: 8ce65d8d38df ("dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml")
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks.

Rob
