Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F16A1633BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 22:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgBRVDB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 16:03:01 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39127 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRVDB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 16:03:01 -0500
Received: by mail-oi1-f194.google.com with SMTP id z2so21578645oih.6;
        Tue, 18 Feb 2020 13:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UK5x7Qbtz2YIvTi+VKSGzW9nmW1tqKcEU73lrOQhdio=;
        b=bkEAe7qqHjS3OA361dgku6g3RFiHWgHwhudopUsFZ6YcrveNojKQJp849vJu0T5/0d
         tGYeyRILMDOLPz5SD0XWTNHtACO7l9NbJR7s4zxEMd3r3QwN9dSj49nuXV9rPLCB5Max
         q8gzmd0yCCrzGR2VREkpa85mS0VGT+60QBTNtb1oXTdl1pIO6/8deubYHEHKY9PJZpNR
         gSq71f6dAW3YsW2OKY7IEDoe4HqCYaXAE8ECQ8TZaoeHEyxZTmhdKqdvvaF88jrOgSfv
         dnktFtuK5v5lyiwyLxlNLTVpi2P6j4lCNQxW52V/eKO6s6brNpRB5mF8aq182nNSagQY
         qXaA==
X-Gm-Message-State: APjAAAV3Oujv1jeSaqSVC6nhFYF2g/Fn4gdaHUQnlQnyrZEqFb51AsBY
        53Fp2d66VIg4BttdoY8VXw==
X-Google-Smtp-Source: APXvYqwvqZC2ovpq0Z13HaqzdrI7kghsPwxNVTpsxm4b3jLIBoAM3cU8Ha17O1B+c6mFDeciX3U8bg==
X-Received: by 2002:aca:b244:: with SMTP id b65mr2606745oif.40.1582059780301;
        Tue, 18 Feb 2020 13:03:00 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m22sm1753895otj.3.2020.02.18.13.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:02:59 -0800 (PST)
Received: (nullmailer pid 31749 invoked by uid 1000);
        Tue, 18 Feb 2020 21:02:58 -0000
Date:   Tue, 18 Feb 2020 15:02:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: usb: qcom,dwc3: Introduce
 interconnect properties for Qualcomm DWC3 driver
Message-ID: <20200218210258.GA29667@bogus>
References: <1581668684-4182-1-git-send-email-sanm@codeaurora.org>
 <1581668684-4182-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581668684-4182-2-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 14, 2020 at 01:54:42PM +0530, Sandeep Maheswaram wrote:
> Add documentation for the interconnects and interconnect-names
> properties for USB.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 4a36ab5..236877e 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -68,6 +68,22 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  interconnects:
> +    description:
> +      Pairs of phandles and interconnect provider specifiers
> +      to denote the edge source and destination ports of
> +      the interconnect path. Please refer to
> +      Documentation/devicetree/bindings/interconnect/
> +      for more details.

No need to redefine a common property, but you do need to define how 
many entries (maxItems).

> +
> +  interconnect-names:
> +    description:
> +      List of interconnect path name strings sorted in the same
> +      order as the interconnects property. Consumer drivers will use
> +      interconnect-names to match interconnect paths with interconnect
> +      specifiers. Please refer to Documentation/devicetree/bindings/
> +      interconnect/ for more details.

Need to define what the names are.

Rob
