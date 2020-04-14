Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E0C1A828D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 17:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439215AbgDNPWf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 11:22:35 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37691 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438826AbgDNPWb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 11:22:31 -0400
Received: by mail-ot1-f65.google.com with SMTP id z17so5616910oto.4;
        Tue, 14 Apr 2020 08:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AnHn2Q/nKp8vHi8xRLPGA04W9zPV6QThgvNNDvW6Lz4=;
        b=oYeCqf78I8FW6TzZbU5/EHAung+vdubjK44BPSrBmo2lzpN/8YI7S5ZBygDDDUu0Hi
         dv8Ji9bMj92KjHFFTuBw5maxg/CXgl/AnbAX97ExjD5RnnjxaU44yyFAED09CRZOgbuq
         s9tXq80KvOtLX/5NiETKUlEavcRYU8VMOBg/Bh4lPdQJ5FmhHggtwKIJYcWJ6B6wwuMe
         tszTzmKvR/gP0+gJwOCK8sgdYiSudAAdFPfXWXTsNe49vSyxewdsRi+pooy7ufxPdE0T
         tpjYxLveLyN2AFhYqKua2z48YnBPAzb0pjam8mnN41fLWe5SgHFJpP1sFdNGKvqkJCyo
         YF+Q==
X-Gm-Message-State: AGi0PubWoS37eAqQDbiKgCWvAgA9JslnaiJ2NxiI9XS9aACTwAobFqxp
        0A7Wv2ImeGYdJTPdvWMHeg==
X-Google-Smtp-Source: APiQypJR5WeRaPhYCrALFhL48Dtxyk9ODcHd1LOjeRCjBr6tTDoukXibtiqbCGRPmuc2x2B7Gx5QGA==
X-Received: by 2002:a9d:6354:: with SMTP id y20mr9159168otk.171.1586877750682;
        Tue, 14 Apr 2020 08:22:30 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q18sm5508097otl.65.2020.04.14.08.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:22:29 -0700 (PDT)
Received: (nullmailer pid 27980 invoked by uid 1000);
        Tue, 14 Apr 2020 15:22:28 -0000
Date:   Tue, 14 Apr 2020 10:22:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: usb: qcom,dwc3: Introduce
 interconnect properties for Qualcomm DWC3 driver
Message-ID: <20200414152228.GA27923@bogus>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585718145-29537-2-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed,  1 Apr 2020 10:45:42 +0530, Sandeep Maheswaram wrote:
> Add documentation for the interconnects and interconnect-names
> properties for USB.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
