Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A304A1B9DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 17:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbfEMPXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 11:23:52 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34742 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbfEMPXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 11:23:52 -0400
Received: by mail-oi1-f195.google.com with SMTP id v10so9643173oib.1;
        Mon, 13 May 2019 08:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XfGOlUQQ0BR8c4BsoZfFHQRJzybAooAiYyp3hXARCkQ=;
        b=kgcK5itGGd5QIo9mqSMTdU4gZgAJAcDAvn4Xaze/S55Kv5nj6KT6CbistSdJHxAaUb
         CHEiQzbHuYhofBeKQkVblZEWhzpYN8NIpq20Y1X14Rka/1EZsG95MQfQlANOSa/29yB1
         vxZ3KzkIk/YTJhlIdPxFtwxremyAiXNFHvawa4uEG4tLrflaVpM8/5SHmlTxP4/BiZRD
         OOSeVCaI6Ac/aXR6r/t+vo2pi6UwYdGBEIVRLt7PLiL6vZGUiAqd9Fgr0oCtM3Oqr6Bd
         xugET5I+dq3BB6hb0KI4W4pVdzy5yHfXrRIH87H8NMEz1T8fbBskx8Mgv6isIN7wEuz8
         L8IQ==
X-Gm-Message-State: APjAAAWldRAi1W1HGvjVRqL1ean2Z0bOeDKu6rsUTclF7BBGrxxD740o
        La34wVNDUAcehnwLpQ1aXuyjKsc=
X-Google-Smtp-Source: APXvYqwogXG9j5/7+ZY36riOYzWM8WHj5Fegta9WZGu25wuD9gOfHcK9nAeELOAXUnR4igtZg//L2Q==
X-Received: by 2002:aca:309:: with SMTP id 9mr14046095oid.94.1557761030441;
        Mon, 13 May 2019 08:23:50 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m203sm5419883oib.45.2019.05.13.08.23.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 08:23:49 -0700 (PDT)
Date:   Mon, 13 May 2019 10:23:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: remoteproc: Rename and amend Hexagon
 v56 binding
Message-ID: <20190513152349.GA23710@bogus>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
 <20190510043421.31393-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510043421.31393-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu,  9 May 2019 21:34:14 -0700, Bjorn Andersson wrote:
> The SDM845 Audio DSP peripheral image loader binding describes the
> properties needed to load and boot firmware on a Hexagon v56. Rename the
> file and add the Compute DSP (CDSP) found in QCS404 to the binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  ...qcom,adsp-pil.txt => qcom,hexagon-v56.txt} | 35 +++++++++++++------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>  rename Documentation/devicetree/bindings/remoteproc/{qcom,adsp-pil.txt => qcom,hexagon-v56.txt} (74%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
