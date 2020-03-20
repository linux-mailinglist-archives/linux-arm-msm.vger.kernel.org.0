Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8C2E18D64C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 18:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgCTRzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 13:55:07 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35127 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgCTRzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 13:55:06 -0400
Received: by mail-io1-f66.google.com with SMTP id h8so6889664iob.2;
        Fri, 20 Mar 2020 10:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xEFFch4ode9uAdt5LKTVjGKh0d9AyJMR356v0HY7PA0=;
        b=jCP2icBdLTH3Me57hTF69RqzQAwvgggs7PKb2g+5dTFR3IDPQietGreQ6kRTMgx+15
         Wzs74x6TrqwfjrxzhwvKn/tl25CTcoYh2FkwORzBQFWVoKoW+QQwqWD3OaNPYMYPqKx7
         HtGzG4UTGqnIVj6tk11p3h21OL1P06P86fvTDw1Y4s1MtbJ+iFwOcR5+in+83omoyqoF
         q/wPRRcrBO5Pr4Npn1YyNCGISEh0RfS9alsD7AZghEee4VdOsyanz9B7TUIsC55o98ZI
         X4uRhg7vopXSK7c5NyfMETlp+YC1GJgTbH/ptjG15ttiF9syyaZojaFg/IH7TU8EhWsB
         0M+w==
X-Gm-Message-State: ANhLgQ232VKJBT44XJJe3dNRGbbKJljHTZXUyCDxZznxkoT2HGe8Frhi
        fRhEQc3l7Db4CM2srJgNtA==
X-Google-Smtp-Source: ADFU+vt+SEWH2J2f6vDId7XVkseA5PcLUfTD98uIFaOMgOqhsiMul3OH4W1i7vh0gcMGuNy6AqJdZA==
X-Received: by 2002:a5d:9708:: with SMTP id h8mr8522503iol.141.1584726905725;
        Fri, 20 Mar 2020 10:55:05 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c87sm2258351ilg.2.2020.03.20.10.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 10:55:05 -0700 (PDT)
Received: (nullmailer pid 30722 invoked by uid 1000);
        Fri, 20 Mar 2020 17:55:03 -0000
Date:   Fri, 20 Mar 2020 11:55:03 -0600
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
Subject: Re: [PATCH v5 2/9] dt-bindings: phy: qcom,qusb2: Add compatibles for
 QUSB2 V2 phy and SC7180
Message-ID: <20200320175503.GA30684@bogus>
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
 <1583747589-17267-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583747589-17267-3-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  9 Mar 2020 15:23:02 +0530, Sandeep Maheswaram wrote:
> Add compatibles for generic QUSB2 V2 phy which can be used for
> sdm845 and sc7180.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
