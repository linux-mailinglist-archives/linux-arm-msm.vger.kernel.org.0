Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C5E22F8D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 21:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbgG0TS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 15:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728642AbgG0TS2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 15:18:28 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC484C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 12:18:28 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g67so10432654pgc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 12:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2xySvV1IjY/ykAIVcs+vE5LOnvW22SWhPjf5yGr8ub4=;
        b=naMvyOJdT0LmNEVjAZJNPFto3+cHVILBVTkAr9eDy2kEWatCjbsevbDKbZEUwUxrN1
         03PXmw7vaaifaTs5uxCJxs/K0Mn5g3/tJ2r2VLcCYE6VH4I/9dtNCbtcdADpwbwuUFmA
         TeD/KFkaSOzBnAybvvjtjX5wmagf37ExNGMpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2xySvV1IjY/ykAIVcs+vE5LOnvW22SWhPjf5yGr8ub4=;
        b=Deas9wmfa6mXXj4Z6blA+HybORh9v2dWg/w713p9KG7jbIocxMaYlVwN6cVH9erLe+
         Lb+ltExmmnbiaDQR8hf5cceGYMmnhNc9ARAXiw5/W4WgFgbt7ViGankBLPQKhJz7UbcZ
         5JkL02UyTKKV3S2ah4qL0D87GwW4VEcAcPSkOK6kTLaZY4lWReAgLf5YiullrDYhOllz
         5c/3HvrX5yOWsETJfo+zHlQ8+MfYjyPF5qmS45HV0PV7MQWZ8n2jVjfjL6quPTCKYGe2
         b7zFRVaPZcSeSMkn9OJTAr/a2vMSayK5DSkzsgs95V9S5AiVkh8OYoB5rUIXD8qDTCDh
         eJqA==
X-Gm-Message-State: AOAM531GbUkB8osn5KRpAw4Lye2h+CqbntISgBd52YuwxP4Ub/gH0w1n
        ByQG+qTAiFwPs98TtVNp9NgjclxxwSI=
X-Google-Smtp-Source: ABdhPJxHxU54eoeuYUvz0gC8SenG8BHXpKDdQtpJ9uHUXR3Pw/fdpX8ZlqWMdFH8+3KSnha9vSr3vQ==
X-Received: by 2002:a63:df03:: with SMTP id u3mr20314068pgg.84.1595877508338;
        Mon, 27 Jul 2020 12:18:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id f3sm356807pju.54.2020.07.27.12.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 12:18:27 -0700 (PDT)
Date:   Mon, 27 Jul 2020 12:18:26 -0700
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
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v10 1/2] usb: dwc3: qcom: Add interconnect support in
 dwc3 driver
Message-ID: <20200727191826.GC3191083@google.com>
References: <1595528857-25357-1-git-send-email-sanm@codeaurora.org>
 <1595528857-25357-2-git-send-email-sanm@codeaurora.org>
 <20200727191719.GB3191083@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200727191719.GB3191083@google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 27, 2020 at 12:17:19PM -0700, Matthias Kaehlcke wrote:
> On Thu, Jul 23, 2020 at 11:57:36PM +0530, Sandeep Maheswaram wrote:
> > Add interconnect support in dwc3-qcom driver to vote for bus
> > bandwidth.
> > 
> > This requires for two different paths - from USB to
> > DDR. The other is from APPS to USB.
> > 
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Sorry, that was meant for v11
