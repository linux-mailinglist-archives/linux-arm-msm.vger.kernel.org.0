Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1D01636D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 00:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgBRXFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 18:05:24 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39967 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbgBRXFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 18:05:24 -0500
Received: by mail-ot1-f68.google.com with SMTP id i6so21274942otr.7;
        Tue, 18 Feb 2020 15:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w2EcdlURUzJKHBNWUdDOALtxzfR4B8GgFlWJfo/dmD0=;
        b=p4d3puxL7vUHz4GPoTzi/iSUoWTtFBz/0Z8GgRi3ABltUEXjKvKttaxZZ+g211ZO0T
         mereHiho1UXL77GC6coQgjMqRewqQ6sHF6in90QpX862wEojaEw57LLLUDcW5TTPirIj
         rXe/bsY0R70+fKBTFOAZaH8YoNmPinpBP6OPJjwUyOXpeAARJIxsez8iDEWnKMHBrxoP
         Rs/bYoJsN4+1c1XVCB3IcySs7KtbTIMFT24TGKQqRRzwGdYFqS2YQY28moJsck1lL06J
         TQ8/vXobgee1LJoI1ht7LmYvqfVRPKoDKYvWnoVW/eRL0cr79xzgk91V+KCsig2GopU6
         46Fg==
X-Gm-Message-State: APjAAAWX8ycdGkdgsInZVFBOoRhMnq+luRxYuxPjzaa07uBkqlXRfmVA
        pBM/GwJ41KHxFRb8VcBtqg==
X-Google-Smtp-Source: APXvYqyWplF0Lnn+5ZNu2xJG1KG9O3+iFZPKpArIM6LfKcbh5DT0UUiuTRHX54g7nU6r4GVVD8HnXQ==
X-Received: by 2002:a05:6830:10d5:: with SMTP id z21mr18171992oto.30.1582067122268;
        Tue, 18 Feb 2020 15:05:22 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p83sm100471oia.51.2020.02.18.15.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 15:05:21 -0800 (PST)
Received: (nullmailer pid 14096 invoked by uid 1000);
        Tue, 18 Feb 2020 23:05:20 -0000
Date:   Tue, 18 Feb 2020 17:05:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,qmp: Add support for SC7180
Message-ID: <20200218230520.GA14038@bogus>
References: <1581506488-26881-1-git-send-email-sanm@codeaurora.org>
 <1581506488-26881-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581506488-26881-3-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Feb 2020 16:51:26 +0530, Sandeep Maheswaram wrote:
> Add compatible for SC7180 in qmp phy bindings.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
