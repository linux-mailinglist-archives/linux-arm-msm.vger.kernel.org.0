Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2DD1E3129
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 23:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389572AbgEZV0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 17:26:03 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:34302 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389455AbgEZV0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 17:26:03 -0400
Received: by mail-il1-f196.google.com with SMTP id v11so4627352ilh.1;
        Tue, 26 May 2020 14:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tJmsklodNJkwEQXv5Bm7TC2I5rB9sQAy8SZOzq4g6bk=;
        b=g7Lf/LjC8x4hmYBONrY2m9S6nTZsobIch2TRJUg1LhLX3TISRkmPmheJS3KCeQg3e6
         RwIhUxUchv3azmvHokB9ozMiMPsrXVBBEMXkqQ1vcMbXx0xN3gpAkqSy5vWO3OeBI5Ov
         Qk/TfBxUeKlc569TyuoN/ErvQSrgJJAi6XJYDVHYe/pFqE3It1pa8LWGcoebi4uB5/EA
         g5QkI6/6C3XjmsFjMox+l+56FzUlenrSkmpxC1YFrefYrjTAWui5WiUZsb05KzfQP8aW
         Cjad4YT3YnL2cp1Q8SkrAy00yqnKBRFL4pjCe7s5SSoTCOpHp4mbsiln2uo7hP9J6i0Y
         VOVA==
X-Gm-Message-State: AOAM530bNRWRWUDTYk8tGU1TmvkeC5BGb1XXSbUw0+irMyYwOgYi8ma7
        8McHfhczHQeg9jppYZKoXw==
X-Google-Smtp-Source: ABdhPJxUm+oAxNAr2SYG4Y81gyy+25kF4QyK6LRTv8PfLwB7yBi6SJuidXXHzUWkboe+3gLkonhHzw==
X-Received: by 2002:a92:10a:: with SMTP id 10mr3084238ilb.203.1590528361383;
        Tue, 26 May 2020 14:26:01 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u2sm355966ion.50.2020.05.26.14.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 14:26:00 -0700 (PDT)
Received: (nullmailer pid 402416 invoked by uid 1000);
        Tue, 26 May 2020 21:25:59 -0000
Date:   Tue, 26 May 2020 15:25:59 -0600
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
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 3/4] dt-bindings: phy: qcom,qmp-usb3-dp: Add support
 for SC7180
Message-ID: <20200526212559.GA401226@bogus>
References: <1589510358-3865-1-git-send-email-sanm@codeaurora.org>
 <1589510358-3865-4-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589510358-3865-4-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 15, 2020 at 08:09:17AM +0530, Sandeep Maheswaram wrote:
> Add compatible for SC7180 in QMP USB3 DP PHY bindings.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> index 6055786..b770e63 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> @@ -12,8 +12,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const:
> -      qcom,sdm845-qmp-usb3-phy
> +    enum:
> +      - qcom,sc7180-qmp-usb3-phy
> +      - qcom,sdm845-qmp-usb3-phy

Use enum in the prior patch so this is a oneliner.

>    reg:
>      items:
>        - description: Address and length of PHY's common serdes block.
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
