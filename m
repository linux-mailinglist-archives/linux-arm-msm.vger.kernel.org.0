Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B831F421D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 19:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgFIRYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 13:24:01 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36166 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgFIRYA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 13:24:00 -0400
Received: by mail-io1-f67.google.com with SMTP id r77so10695118ior.3;
        Tue, 09 Jun 2020 10:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+JWrXVbSyibvd6RhyHADt/Z9H/n3o+CdfMcisJmBME0=;
        b=JXsOj7VrsVl01Kuc5ysiSyo5ZlCFo7cfNaIcqYM09HorLGj7vyHR5tF+zuPz24PDM0
         xGmO2jH94Jzyu0AsXdI+pL9yT4LPwh5IX9HYyp4k5RTTFWsitxyLYnh4gIK2sSzwqB2+
         PGbStu3OjMohKKXURB6ML1wS1DDHhWuGaGXWb7A1yzqiyX5SQy/V0LMf6dD9ED/rg04m
         mUmSmhWsf5IPwkGOvKlmMSJxiEOc+i6DrF/xkB5Iw/zmJvq2e+PrumYYfTz56W73dG2T
         pOP217qb36tCSz48sle3QbjU3H01jS4tE0GxHw7f7+ChTbKMpjRjD1ccXNaJAbGGoOCN
         i47w==
X-Gm-Message-State: AOAM532cZGeO/6k3FtuPCEMNwJYnaHkC7E1RtzhBULa3NMgY5rdGcoy+
        Cc/OoeuH8hBjQccnDBDrEA==
X-Google-Smtp-Source: ABdhPJzv0IJM0Lx9lfjwbX+wS+9f+tuKGYyhNfoqSAYRqS4jPAu5A9ff5FKv1MMq99AsH5A+jE1RJw==
X-Received: by 2002:a02:c4c8:: with SMTP id h8mr28557805jaj.64.1591723439090;
        Tue, 09 Jun 2020 10:23:59 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z4sm9576365ilm.72.2020.06.09.10.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 10:23:58 -0700 (PDT)
Received: (nullmailer pid 1106677 invoked by uid 1000);
        Tue, 09 Jun 2020 17:23:57 -0000
Date:   Tue, 9 Jun 2020 11:23:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     jassisinghbrar@gmail.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 2/4] dt-bindings: mailbox: Add dt-bindings for ipq6018
 apcs global block
Message-ID: <20200609172357.GA1104091@bogus>
References: <1591609047-29995-1-git-send-email-sivaprak@codeaurora.org>
 <1591609047-29995-3-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591609047-29995-3-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 08 Jun 2020 15:07:25 +0530, Sivaprakash Murugesan wrote:
> Add dt-bindings for ipq6018 mailbox driver
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.yaml         | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.example.dts:80:18: fatal error: dt-bindings/clock/qcom,apss-ipq.h: No such file or directory
         #include "dt-bindings/clock/qcom,apss-ipq.h"
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1305051

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

