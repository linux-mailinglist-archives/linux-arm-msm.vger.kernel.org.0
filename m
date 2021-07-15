Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8A23CA45A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 19:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbhGORau (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 13:30:50 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:35779 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGORau (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 13:30:50 -0400
Received: by mail-io1-f54.google.com with SMTP id d9so7371295ioo.2;
        Thu, 15 Jul 2021 10:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7LQ1r0OLTPgjM9ETp+CNFWsKZpdXdzJzbTdzreyJpec=;
        b=mlEC47Nu++LP37VJshlfiYbVEHp1rpA2rGTZxxYEJiIgPljx+USpfPuZ8TOKD42EMi
         Yeex2SkUwvMmebTDlL7051YQae4a78PvnLFGszfym1qwFVnPFw1/3FvgDD8N7YMD0R8e
         TthoI8ItbiFuvACtQFwuI+PXfyIi2tDl5QAdyxJoTLOBa8gLAmtUC2T6+j8ibiivCLdO
         7NvAUcbECRutnpnOan3q3RmCYsopMJNR9SJUNPnIphYYHGADEY4mfIwadhOuFaQ4ZoqX
         z9/bNr66HEfktIoSajW5gyy6dLdVgrzWDCSmAp9hYK74+XxDX55A/Pk/cxHA46qsoTe1
         PuGA==
X-Gm-Message-State: AOAM533r3jiei2LL0oC1DItDilMczeUl0Mo8jMeeLovZJnqZ3fFI9zt1
        KtYQb7B4kcYXFes0pS96tw==
X-Google-Smtp-Source: ABdhPJwO/jqRGDJNwENgEQGLmkQEbnC4Zu/5ewkV39qjNv/62s39L47FH9CVGd0e7cMMT1648k35JA==
X-Received: by 2002:a5d:8996:: with SMTP id m22mr3904382iol.6.1626370076326;
        Thu, 15 Jul 2021 10:27:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z7sm3665590iox.4.2021.07.15.10.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:27:55 -0700 (PDT)
Received: (nullmailer pid 1285000 invoked by uid 1000);
        Thu, 15 Jul 2021 17:27:52 -0000
Date:   Thu, 15 Jul 2021 11:27:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-soc@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: Add SC7280 DISPCC clock
 binding
Message-ID: <20210715172752.GA1284969@robh.at.kernel.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
 <1626189143-12957-3-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626189143-12957-3-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 13 Jul 2021 20:42:18 +0530, Taniya Das wrote:
> Add device tree bindings for display clock controller subsystem for
> Qualcomm Technology Inc's SC7280 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7280-dispcc.yaml         | 94 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,dispcc-sc7280.h     | 55 +++++++++++++
>  2 files changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sc7280.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
