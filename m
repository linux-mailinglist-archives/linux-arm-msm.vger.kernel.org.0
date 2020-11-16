Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BEF2B4649
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 15:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730488AbgKPOri (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 09:47:38 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38330 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730028AbgKPOri (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 09:47:38 -0500
Received: by mail-ot1-f65.google.com with SMTP id a15so16236362otf.5;
        Mon, 16 Nov 2020 06:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T0AFkinmS4xNpHTWSQzUR/t6zPP2ON6iXSPqeGMo7yM=;
        b=SrrdrHC8LVwl13UZUWDiVKIp+Ir9TcZi2SyqFNBbSeX4TMgFaUItApqmZ6a760SeuV
         mmPr3wRwrHJgz3w6CGJcjVptO0luxVlz/GTdjzxAy3AOJUen60I63hIEYK37uLU9AimE
         MDDJG7kRF8pDPq4epmlr/53Gen96aM0FiyUAHV+GyZdGl4GtfnFJ0fD25/4G7Ih2x0zq
         O5qeyhWoUG1K0ExzquHMDaSlerq+hhgtGHZmYmWUOsoDlbjFS6mvKV+tx9wX56+W5COa
         THYD3OGl+UvIfCJFsV8drbi9GgFMWZ/J0KsRVsKV1BEGhvjbXvKsmFcmtBY2F4fpUWVF
         +qGw==
X-Gm-Message-State: AOAM531wJAj++CtMCiuspMdV6CaDN2XygkSLIiYe5yRTGu2NK9DQG9uE
        mQaXRWdfbJXuJ0tMVpqYWg==
X-Google-Smtp-Source: ABdhPJyg4u5aAwAl+FWlArAToEROLMpdRdPEmjSw7GRGG25G83OysOZNplqoWSEawMbMLPrPzGKtZg==
X-Received: by 2002:a9d:740d:: with SMTP id n13mr10896222otk.37.1605538057676;
        Mon, 16 Nov 2020 06:47:37 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e63sm4533438oib.48.2020.11.16.06.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:47:36 -0800 (PST)
Received: (nullmailer pid 1626105 invoked by uid 1000);
        Mon, 16 Nov 2020 14:47:36 -0000
Date:   Mon, 16 Nov 2020 08:47:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: add vendor bindings for OnePlus
Message-ID: <20201116144736.GA1625774@bogus>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-5-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112161920.2671430-5-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 12 Nov 2020 16:21:54 +0000, Caleb Connolly wrote:
> Used by the OnePlus 6/T device trees
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/arm/oneplus/oneplus-boards.yaml  | 25 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
>  2 files changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml


See https://patchwork.ozlabs.org/patch/1399086

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

