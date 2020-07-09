Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2337E21AA52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 00:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgGIWM0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 18:12:26 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45395 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgGIWM0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 18:12:26 -0400
Received: by mail-io1-f66.google.com with SMTP id e64so3965986iof.12;
        Thu, 09 Jul 2020 15:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N3B7wXkoix7oVZQGXgo+9fqs6RTXkz0Q1P+Jtz6Q3v8=;
        b=ceK8DIasEoZ8BprSv5WR6n537gLtEt45soDwRaYT7Prt4fReihIlQMjgsVpjG/bxpw
         pBCmniKvNGKLH5BQk7xE0chUa1KnpF7KvrykwmmABPkOOFcoYQkWF59n7fzmFRKlKYP8
         29mG1W4fC9W8MdH8RlqfEZlZh7fgNjyXAI72t2/mHfCSQd4Kco/vse6AXSZbWfuOoq3f
         7yEjHBAN18myyrT6oL4LKLJ4IUpH7FvteZpd4gmBvj6oN46GoSGTPI6Vy8uWp13uTc0W
         oDnl8YCLnNqlzRMeajex8V0MLg5Z1ERweuwvEdKgXUF3/SKmx64wMcFgV1zBtR5UUBA5
         2rBA==
X-Gm-Message-State: AOAM533TsmT55o45QdBeFJ16yiFRv32wv2KTW8tLGuhbIAF8X4jqrGUh
        v2o2mCRiA4u+Mt9iuh/gARp3gvieUw==
X-Google-Smtp-Source: ABdhPJx1FEmhQ5vvbZu+CAESLkRPH79yWff7Ulkarh3ebi/v7RbWlfGq3vQ+ZraTxwnV1oTA1Qdmkg==
X-Received: by 2002:a02:5b83:: with SMTP id g125mr74541532jab.91.1594332745590;
        Thu, 09 Jul 2020 15:12:25 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id d6sm2771963ioo.9.2020.07.09.15.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:12:24 -0700 (PDT)
Received: (nullmailer pid 984111 invoked by uid 1000);
        Thu, 09 Jul 2020 22:12:23 -0000
Date:   Thu, 9 Jul 2020 16:12:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     devicetree@vger.kernel.org, rnayak@codeaurora.org,
        broonie@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        kgunda@codeaurora.org, lgirdwood@gmail.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, nishakumari@codeaurora.org
Subject: Re: [PATCH v5 2/4] dt-bindings: regulator: Add labibb regulator
Message-ID: <20200709221223.GA984064@bogus>
References: <20200622124110.20971-1-sumit.semwal@linaro.org>
 <20200622124110.20971-3-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622124110.20971-3-sumit.semwal@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 Jun 2020 18:11:08 +0530, Sumit Semwal wrote:
> From: Nisha Kumari <nishakumari@codeaurora.org>
> 
> Adding the devicetree binding for labibb regulator.
> 
> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
>  [sumits: cleanup as per review comments and update to yaml]
> 
> ---
> v5: Addressed review comments - removed interrupt-names, changed to
>      dual license, added unevaluatedProperties: false
> v4: fixed dt_binding_check issues
> v3: moved to yaml
> v2: updated for better compatible string and names.
> ---
>  .../regulator/qcom-labibb-regulator.yaml      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
