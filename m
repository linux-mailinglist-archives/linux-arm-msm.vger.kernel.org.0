Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCCF21AB54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 01:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgGIXQN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 19:16:13 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:46452 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgGIXQM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 19:16:12 -0400
Received: by mail-il1-f196.google.com with SMTP id a6so3468935ilq.13;
        Thu, 09 Jul 2020 16:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iKzcctYs0QvUJ6q2sy3GcGzx+xLjicf/+aR5rbD4H3M=;
        b=idaUOSIP8jLKCq5j8Mdildpk6iT+FliCqUomAXtv4iTioDV36i+YRQ6VnVrytSOkUz
         tqvHFRBQgylZJ0Im/fx1/Yd2QCEe2wrtT5rH+C+0cO3PFIk2oXjrNjXvbczZCMrOAitC
         9PnUYQ8jecNE7fXY05AaXVUy5zQXb0smEAkFeI+Mzxzx6qdrn6rmTSwrDh3F5kmwIoeu
         IV83dYOjAOgHYg23wL16fEo7suqqSOBgfd939Nu8EHJCI/6hxGF55UeutbMlQsJoHUEg
         k9pKYEninLudPY7nQGamlwkx3jLb4uA0XbPtCvhAzygO3IuQR4vgafRHRQmBr7IvJ90r
         bf+w==
X-Gm-Message-State: AOAM533X03ww90oSHBtl4ETE0OcaupPUmh3hBaSXmLFFhGjNMGlMt1fc
        SKgZ1WmAHrg3oxlPSLB8M2q72piMXcky
X-Google-Smtp-Source: ABdhPJyGoYqtu1pgdnf0oNWJV1iPyQWBtsQqraNlXKAUYkIRszTj3i+FNESTxpecxYcJhm2Um4HTmQ==
X-Received: by 2002:a92:40cf:: with SMTP id d76mr50233534ill.198.1594336571851;
        Thu, 09 Jul 2020 16:16:11 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id k24sm2642537ilg.66.2020.07.09.16.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:16:11 -0700 (PDT)
Received: (nullmailer pid 1077936 invoked by uid 1000);
        Thu, 09 Jul 2020 23:16:10 -0000
Date:   Thu, 9 Jul 2020 17:16:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Ravi Kumar Bokka <rbokka@codeaurora.org>, rnayak@codeaurora.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, dhavalp@codeaurora.org,
        linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>,
        sparate@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        Rob Herring <robh+dt@kernel.org>, mkurumel@codeaurora.org,
        Andy Gross <agross@kernel.org>, mturney@codeaurora.org
Subject: Re: [PATCH v4 1/4] dt-bindings: nvmem: qfprom: Convert to yaml
Message-ID: <20200709231610.GA1077879@bogus>
References: <20200622144929.230498-1-dianders@chromium.org>
 <20200622074845.v4.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622074845.v4.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 Jun 2020 07:49:26 -0700, Douglas Anderson wrote:
> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> 
> This switches the bindings over from txt to yaml.
> 
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v4:
> - Maintainer now listed as Srinivas.
> - Example under "soc" to get #address-cells and #size-cells.
> 
> Changes in v3:
> - Split conversion to yaml into separate patch new in v3.
> - Use 'const' for compatible instead of a 1-entry enum.
> - Changed filename to match compatible string.
> - Add #address-cells and #size-cells to list of properties.
> - Fixed up example.
> 
>  .../bindings/nvmem/qcom,qfprom.yaml           | 50 +++++++++++++++++++
>  .../devicetree/bindings/nvmem/qfprom.txt      | 35 -------------
>  2 files changed, 50 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
