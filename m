Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F6047606A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 19:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238552AbhLOSNf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 13:13:35 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:35504 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbhLOSNe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 13:13:34 -0500
Received: by mail-oi1-f171.google.com with SMTP id m6so32839580oim.2;
        Wed, 15 Dec 2021 10:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QYXeLlUge5kWadStv+xy1z0qxrMUQckim4UiyaF3H9w=;
        b=DE821Qpl6RzDKZJUUCrlaPCtzZDWKzhw4HC+iXHpmJCY+qWZjsMitGY8aL34JjBML3
         oDiCHgoy3iqD6sxhFOYFwr8FgqGxwZY+KGeLSrb3t/HxgSKkasEvwAHRty5cEly69DSK
         sVQsDb+OXZZGvRb5ZKkDcLJAPS45cI2DSNKgWBGmzdrCe2YEugJcCMh0TPpDZyaouA6/
         QWGIgqF1O4R+WdW88dbyR0YwO+JrRcfYaX61590E67sNBMlS228YXYygkXAJyhhkLgZ3
         mIEFsK6lr6GuUKvDM0hR4rH8H9SKjHVj0a1WSgKsPzhYY99tfPFhF6xp4s71Ij9VVdCO
         rkQg==
X-Gm-Message-State: AOAM530pxGRbooIacaI3AzCyM4jrGvEXb2fofmEV/f8dvPdfZESkx9uR
        dN8BMDhUQjSELsQy5xvrZA==
X-Google-Smtp-Source: ABdhPJyeDmJ5GtJnT2SfDSuZynvTltn3u2d6Q/4j730jaIKXdVo7Sz79RRb3aIJ57xkxqu7f+GZEsA==
X-Received: by 2002:aca:2b09:: with SMTP id i9mr1011793oik.14.1639592013919;
        Wed, 15 Dec 2021 10:13:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bq5sm487462oib.55.2021.12.15.10.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 10:13:33 -0800 (PST)
Received: (nullmailer pid 1580321 invoked by uid 1000);
        Wed, 15 Dec 2021 18:13:32 -0000
Date:   Wed, 15 Dec 2021 12:13:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC
 bindings
Message-ID: <YbowTM/LyLSX7d7c@robh.at.kernel.org>
References: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org>
 <1639058951-12660-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639058951-12660-2-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 09, 2021 at 03:09:11PM +0100, Loic Poulain wrote:
> Add device tree bindings for display clock controller on QCM2290 SoCs.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: no change
> 
>  .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> new file mode 100644
> index 00000000..44d5ce7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only

This and the header should be dual licensed. Not necessarily the same 
ones. The header should match Qcom dts files.

Rob
