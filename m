Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394BF18A78C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 23:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbgCRWEq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 18:04:46 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:34968 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgCRWEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 18:04:46 -0400
Received: by mail-il1-f194.google.com with SMTP id v6so369791ilq.2;
        Wed, 18 Mar 2020 15:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nvP10y4co7+lz1ui5VSoxULGIs1uH9GMl57cIOt93KU=;
        b=TfGqSLGcvxRaLB/n/SEe7qM8tPG13jeJcmhPCovd/ddGpDkufRPIgJCjX6WdTxjsW6
         nINd0rOGmMsx8wMV5VlE9sNR985z6pLXDmDE0E3cHxcj/i7IStGIB9ShNlapF06cMiSK
         pZcKloBwDyjPnkX+JjUMD/Wg9AuDRX/bZnbjpWAML1FhXUMeKG4AGQqzvthRntSBeUPs
         wqAKZbB7nTKgky0RALaZew68KoiwgdU5Ot1t/g11u+LAOMd9HwQt7Q8n1l6xAKxmvzE7
         0pImvPOQAZFFAXWN3lqcWAMN+HcnnMUg1npg5dTrZRHtQnOkO50P6zlen7ZFVdS0Sx/c
         YPbg==
X-Gm-Message-State: ANhLgQ20llxf9dajzhQ6e2cIDbuNuj2fIjK7Tk+MwRo//CcXPNnvpyRq
        19cC09vu+l+sMnSspOgvqg==
X-Google-Smtp-Source: ADFU+vtrY4dt+9MXe/DeJN43InzVxlzOGFVmFX635slbQ1fD96a4nEurmq+8jIxCKSegB6jUOLy0Og==
X-Received: by 2002:a92:7f01:: with SMTP id a1mr254571ild.132.1584569084977;
        Wed, 18 Mar 2020 15:04:44 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id p2sm62743iln.22.2020.03.18.15.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 15:04:44 -0700 (PDT)
Received: (nullmailer pid 16608 invoked by uid 1000);
        Wed, 18 Mar 2020 22:04:43 -0000
Date:   Wed, 18 Mar 2020 16:04:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
Message-ID: <20200318220443.GA16192@bogus>
References: <1584211798-10332-1-git-send-email-tdas@codeaurora.org>
 <1584211798-10332-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584211798-10332-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 15 Mar 2020 00:19:56 +0530, Taniya Das wrote:
> The Modem Subsystem clock provider have a bunch of generic properties
> that are needed in a device tree. Add a YAML schemas for those.
> 
> Add clock ids for GCC MSS and MSS clocks which are required to bring
> the modem out of reset.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,sc7180-mss.yaml | 62 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sc7180.h        |  7 ++-
>  include/dt-bindings/clock/qcom,mss-sc7180.h        | 12 +++++
>  3 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/clock/qcom,sc7180-mss.yaml#

See https://patchwork.ozlabs.org/patch/1254940
Please check and re-submit.
