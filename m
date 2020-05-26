Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6631E31F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 00:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390406AbgEZWCq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 18:02:46 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38854 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389510AbgEZWCq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 18:02:46 -0400
Received: by mail-io1-f66.google.com with SMTP id d7so23831665ioq.5;
        Tue, 26 May 2020 15:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jX6sdAtb3ciZ8JNmjcS5iUUFx4ubuSGI6p1K1JU8YgI=;
        b=WYBk85vF3urkNpxslwB6JKCka3Lb+ur08G8M/YJVBqqaeErtGgu0u63fL0yMKVcd84
         ArF+TGZ4+I4c8BBiepSB6RIx33Xw+GRmIayRPvH/B+0airdq397VR2lNde/pp8BNrilP
         cx2Jt9JVbqjfIKGvCXPxilxTw5C70gKG5VhPZj8nGTz/u2jG823WvjGgs8PZpylWed3j
         qiFG64+r9FRq3cWs57J+x5uks+K2eMgHNnfy+b9sz4Ww9bONknc/Q+qycPA3SFhEucba
         r1YY1yBX+kDKBPrdC4KpqjoJIrxS445cFxrmlf3SlYy5jHKZqhQafjAdHXvQOSGNpVmv
         pEBg==
X-Gm-Message-State: AOAM5339YTb69ho6iGcUXQEnueMYxqIbtCd4UHFs5i+K/IAn+38VvM5z
        jq7/c1EQRqDp+Ava4v6Y8bgtSzg=
X-Google-Smtp-Source: ABdhPJzSLNjKw9CoNEbUaxdGCx015TIUu/JFeRvW/aCNYbLb/Tcad2JaBktDYlfS7li4c/1MTGsltQ==
X-Received: by 2002:a05:6602:2c8f:: with SMTP id i15mr11915911iow.45.1590530564985;
        Tue, 26 May 2020 15:02:44 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y17sm601859ili.26.2020.05.26.15.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 15:02:44 -0700 (PDT)
Received: (nullmailer pid 458445 invoked by uid 1000);
        Tue, 26 May 2020 22:02:42 -0000
Date:   Tue, 26 May 2020 16:02:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
Message-ID: <20200526220242.GA458289@bogus>
References: <1590075499-21350-1-git-send-email-sanm@codeaurora.org>
 <1590075499-21350-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590075499-21350-2-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 May 2020 21:08:18 +0530, Sandeep Maheswaram wrote:
> Convert USB DWC3 bindings to DT schema format using json-schema.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.txt          | 104 -------------
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         | 167 +++++++++++++++++++++
>  2 files changed, 167 insertions(+), 104 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> 

Applied, thanks!
