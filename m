Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 879423FD0CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 03:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241525AbhIABio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 21:38:44 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:46702 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241332AbhIABin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 21:38:43 -0400
Received: by mail-ot1-f45.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso1558455ott.13;
        Tue, 31 Aug 2021 18:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jGxTqbfDK0eZLNHxAFg+vD5OYnXqeBA60ZAkZk7bA7M=;
        b=ovQnVfWKtx4dFswuuqQDZu2mdX4R3rw6p3Q/uvFwnPrXC0oMTWL23fXDTLdrFaaIbO
         DmT69wK77sJ9DtrDTkSTmLanDVCc9B51ipd96J7t1pgTfIeKr4XHhZvA+eiW8J92dZEl
         837+8gtwZoKb9Sc7DbEJIAgdjTAlkKWzYs4CUeg4RRMqI+iSsxz+fMHn6Av8QUXnLH12
         3+fzm6DSru4CCXlitTJth6wXad7cY59yaWQ1u+UkzlDP9gi6YO3wi6pqKDNhgXcSdRtT
         OdDc/fhbxKjrqcR2TPAl4nZT7mRqmHXL7zClPHGJ9zjg68BrEBbNRuunNiU3pIsxgSxK
         VjHw==
X-Gm-Message-State: AOAM530JMoqoXH8IG97qdKCexOn0VQu2128aygAkiZDizo8iEdhCWIrU
        OF5eeRan1VpcAXc7Z37NGg==
X-Google-Smtp-Source: ABdhPJz+wfrj36iFqzGxGHUFsresakzzQ89/8vgwK+O+YhNqn0CXgf/jFzwWThp3Ttthd6TyTJGXrw==
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr27074700otr.248.1630460267449;
        Tue, 31 Aug 2021 18:37:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b28sm4109859oob.4.2021.08.31.18.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 18:37:46 -0700 (PDT)
Received: (nullmailer pid 1008126 invoked by uid 1000);
        Wed, 01 Sep 2021 01:37:45 -0000
Date:   Tue, 31 Aug 2021 20:37:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3: add reference clock period
Message-ID: <YS7ZafoBpPC/+j2k@robh.at.kernel.org>
References: <f5ea5bc3664a98a684ad4b699a1ac610e847176f.1630389452.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5ea5bc3664a98a684ad4b699a1ac610e847176f.1630389452.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 31 Aug 2021 08:57:29 +0300, Baruch Siach wrote:
> Document the snps,ref-clock-period-ns property that describes reference
> clock period when it deviates from the default set value.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
> 
> Address comments from Rob Herring:
> 
>   Use standard unit suffix
> 
>   Reword description
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
