Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B9A43BE00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 01:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237364AbhJZXks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 19:40:48 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:36599 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235920AbhJZXkr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 19:40:47 -0400
Received: by mail-ot1-f52.google.com with SMTP id p6-20020a9d7446000000b0054e6bb223f3so1060521otk.3;
        Tue, 26 Oct 2021 16:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X7aQF24lrUeAd46tr7j/Z7ELNKIPOFNsx+YxGQWMI2E=;
        b=k3Kua/O0PHbjQxVRa16TdQ8vUJHe1zFkko1o6ylW7gi1AKMZC6b4z8XxGMxFfO0oFH
         C826W/6tbhTs0rULWjYFn76K4uoT2+Vm0FYzDi7HV6tNIw5AaJ2T8+HxylPYe0D8lr96
         IoT47D18+5SdsCJTPYR1DSD+bEZwll+Tk2QIevmr3Ki9U/jAOJj85xN7WhbrW7EV9Gk3
         kdURFQA5m/8pkn5PpRAb+sfDX28lbKT3AV+GXoQ9KvByPDsQSaMZADTV9/bWau+VdQHV
         mUXjCPNwxd14wKpaLr+rIIXbupV57jlsGQU+daZ8tAlIZ4m4EzkpW2N9ZngjGDOPgwje
         +Fdg==
X-Gm-Message-State: AOAM533mVrvHM6qEHhlP5P4rGCb9TxuXNao3aBtffilZ8p1Csq2lT42e
        2XjlaJeBhjF04DMMMZ6IEA==
X-Google-Smtp-Source: ABdhPJyp+KesDJDd4NV3GD0+cqYkaIS4rzEyH3WVXKtbNZl3EWJnZsv7WWmtavLsHHcrN/E5Mmm//w==
X-Received: by 2002:a9d:12b2:: with SMTP id g47mr21958811otg.227.1635291502178;
        Tue, 26 Oct 2021 16:38:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bb39sm5366320oib.28.2021.10.26.16.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 16:38:21 -0700 (PDT)
Received: (nullmailer pid 3549069 invoked by uid 1000);
        Tue, 26 Oct 2021 23:38:20 -0000
Date:   Tue, 26 Oct 2021 18:38:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: stats: Document
 qcom,rpm-legacy-stats
Message-ID: <YXiRbBTCcFC8tE7v@robh.at.kernel.org>
References: <20211018110803.32777-1-stephan@gerhold.net>
 <20211018110803.32777-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018110803.32777-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Oct 2021 13:08:01 +0200, Stephan Gerhold wrote:
> Document an additional qcom,rpm-legacy-stats compatible that can be
> used similarly to qcom,rpm-stats for older RPM firmware versions that
> have the sleep stats at a fixed offset rather than a dynamic one.
> 
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
