Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973C144E9C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 16:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhKLPQe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 10:16:34 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:33587 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbhKLPQd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 10:16:33 -0500
Received: by mail-ot1-f43.google.com with SMTP id h12-20020a056830034c00b0055c8458126fso14349405ote.0;
        Fri, 12 Nov 2021 07:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0jg08u6wOGS+X8gTyqD88q3qm3R4twg1cUMNMxsdkRQ=;
        b=TVWzwGP77XWzqiAtfqNz84ZHC8wVczqyGSmr74SuqfDG9ss6XgVZ2cEbNYcMo+PhtL
         SmudVKHhsQKDhRGuE5gA7zLcObo6gLAgLEj3NFrnL5zLZba0oNQfkoHB+B1ekRZgpp2L
         OhnusFo8ueEPcn2WsSClFmPQDiCxAWhOozfJxAOamkK5eZ6pfA/h9FG0F1QQMLgefCJA
         w+K10Gqi7qJ+8V5DZAOjIPXvqxIC669Nsc6qbHRDSDEvaeULZZW79i2n4+0DGi4UvojM
         z5DBcjaVEMGGG7Z5JpzaeN++PWoYFi6SCPFCTOvNisRlsXNjITM1pWsm9OC6o8JLxEfZ
         xyiw==
X-Gm-Message-State: AOAM532KzSam3jSKU2fLuSgMqW/CIRUqVUEUnJ5RgL/b7XcV+tL3wJjV
        xLKwSX8Btg8RpDeHRTeIBw==
X-Google-Smtp-Source: ABdhPJyVaoigYk0+ljaBdTslbpRLovcEJ3SFJk2h75AzzcwFNKGdz64UukEKQP+bDL+T0lRYUsVkzg==
X-Received: by 2002:a05:6830:310f:: with SMTP id b15mr12755194ots.31.1636730022773;
        Fri, 12 Nov 2021 07:13:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e14sm1349360oie.7.2021.11.12.07.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:13:41 -0800 (PST)
Received: (nullmailer pid 2863022 invoked by uid 1000);
        Fri, 12 Nov 2021 15:13:40 -0000
Date:   Fri, 12 Nov 2021 09:13:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fenglin Wu <quic_fenglinw@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, collinsd@codeaurora.org,
        subbaram@codeaurora.org, tglx@linutronix.de, maz@kernel.org,
        David Collins <collinsd@quicinc.com>
Subject: Re: [RESEND PATCH v2 08/11] bindings: spmi: spmi-pmic-arb: mark
 interrupt properties as optional
Message-ID: <YY6EpCdJJngQvG0z@robh.at.kernel.org>
References: <1636691059-4305-1-git-send-email-quic_fenglinw@quicinc.com>
 <1636691059-4305-9-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636691059-4305-9-git-send-email-quic_fenglinw@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 12, 2021 at 12:24:16PM +0800, Fenglin Wu wrote:
> From: David Collins <collinsd@quicinc.com>
> 
> Mark all interrupt related properties as optional instead of
> required.  Some boards do not required PMIC IRQ support and it
> isn't needed to handle SPMI bus transactions, so specify it as
> optional.
> 
> Signed-off-by: David Collins <collinsd@codeaurora.org>

Author and Sob emails don't match.

> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
> index ca645e2..6332507 100644
> --- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
> +++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
> @@ -29,6 +29,8 @@ Required properties:
>  - #size-cells : must be set to 0
>  - qcom,ee : indicates the active Execution Environment identifier (0-5)
>  - qcom,channel : which of the PMIC Arb provided channels to use for accesses (0-5)
> +
> +Optional properties:
>  - interrupts : interrupt list for the PMIC Arb controller, must contain a
>                 single interrupt entry for the peripheral interrupt
>  - interrupt-names : corresponding interrupt names for the interrupts
> -- 
> 2.7.4
> 
> 
