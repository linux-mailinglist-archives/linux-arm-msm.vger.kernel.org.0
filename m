Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1ACF1304D8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 23:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgADWBq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jan 2020 17:01:46 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:44082 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgADWBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jan 2020 17:01:45 -0500
Received: by mail-io1-f68.google.com with SMTP id b10so44772970iof.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jan 2020 14:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fnzuX2UXDHqVoWZIcnjy9706qM97ViaNzviNWp3fBBw=;
        b=O50scRmQRs2Jsz3zVZ2Vufu1CRNSlKFQ4+lzAFHYJHpku3ye+foSCVIhaYZ5ZswFGy
         SmPRT4yS4A2DauXb8z0zWNBV4wMga+dFNShrvpUpjykGpgw9piYe6XvcCBqEoBFo+mny
         7CCjPET6VuD3S+W/86Rsns7R+qYsVQtgpzPUrhTwkOHJm6JunPl72h64Sf8tWU+VMbD8
         kPa53bbGhBgl8tEkipT+dJw1NGkAkrOb8sbaLHhTVra/Ss4Cb4YiswBeRxZo0vH1Z0f9
         69RlPdLmxLkosSGrKFwRHUZCexU0q6MqE4sNyb+RO1k5rkK2mIIfOwC3MvCPz5KyL996
         f0bA==
X-Gm-Message-State: APjAAAVMT16BD5j/lrNt079dQNi5gZd2292RcKb7td7AkwQf/4Pzws18
        ESRoD9YF21qfJzcppL2Kauu4Ve0=
X-Google-Smtp-Source: APXvYqzRAm79nytXp7UG3Wl1Ghi/HHnkS5jCcb+jWiK+1/n5TfWTeuYnABStUAOMVCixZTeITyz7FQ==
X-Received: by 2002:a05:6638:45b:: with SMTP id r27mr75732294jap.111.1578175304942;
        Sat, 04 Jan 2020 14:01:44 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id p5sm22173120ilg.69.2020.01.04.14.01.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 14:01:44 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 15:01:42 -0700
Date:   Sat, 4 Jan 2020 15:01:42 -0700
From:   Rob Herring <robh@kernel.org>
To:     Odelu Kukatla <okukatla@codeaurora.org>
Cc:     georgi.djakov@linaro.org, daidavid1@codeaurora.org,
        bjorn.andersson@linaro.org, evgreen@google.com,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, ilina@codeaurora.org, seansw@qti.qualcomm.com,
        elder@linaro.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [V2, 1/3] dt-bindings: interconnect: Add Qualcomm SC7180 DT
 bindings
Message-ID: <20200104220142.GA28701@bogus>
References: <1577782737-32068-1-git-send-email-okukatla@codeaurora.org>
 <1577782737-32068-2-git-send-email-okukatla@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577782737-32068-2-git-send-email-okukatla@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 31, 2019 at 02:28:55PM +0530, Odelu Kukatla wrote:
> The Qualcomm SC7180 platform has several bus fabrics that could be
> controlled and tuned dynamically according to the bandwidth demand.
> 
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,bcm-voter.yaml      |   1 +
>  .../bindings/interconnect/qcom,sc7180.yaml         | 155 ++++++++++++++++++++
>  include/dt-bindings/interconnect/qcom,sc7180.h     | 161 +++++++++++++++++++++
>  3 files changed, 317 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,sc7180.h
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> index 74f0715..55c9f34 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> @@ -19,6 +19,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,sc7180-bcm-voter
>        - qcom,sdm845-bcm-voter
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml
> new file mode 100644
> index 0000000..487da5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml
> @@ -0,0 +1,155 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
