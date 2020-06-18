Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0E01FFB3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 20:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgFRSoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 14:44:01 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43060 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgFRSoA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 14:44:00 -0400
Received: by mail-io1-f67.google.com with SMTP id u13so8253746iol.10;
        Thu, 18 Jun 2020 11:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1vREzKpcIygrAgwVxWDb2r+RtLDy7uNgi3cJTsF7w2Y=;
        b=hlxXri0zkSGLn6nYW5vEFoxnZgp8OA0NJBAYtkTlGmDLcosCxbnpWWwlCumu2cDTZ5
         4E2lvcndS2DGYcOGF0HZodfRx8S09E6fDgYFx/dQUfcBA/iYZKhDq+ZGycrs7KtXJcPD
         BOoLT8MBH8qFRnJqlyMN2xxLEuDZkcC59lYFnVBWwUl5w9NlCtQyiJYwMM7qYgwOUeFE
         EdDK/D9faEC0LDYcMKEjJeeldYlpCgtJtLVoo8ZX0ka6KpqhhVo7gnK0xD9MQ5zexaDO
         1s/3WkHjX8POr+No5p7MwY8YybIAYRrbRu5xUlR+LNoiHCrfUA6pEhHh6TUs9X5VCkRg
         NMwA==
X-Gm-Message-State: AOAM530L/iVZBta1DKpzygHRrQgNRQTlBjeDZhKlzKDFhCjwYw6ygepP
        /JXAqllKA265lhzzraT8Uw==
X-Google-Smtp-Source: ABdhPJz/7ZuPaPILN8nabg+jPHzHv7LO5oCxGOsFtnQucTdEFHAzxyKy2khDTOZeA/Wwj49OhDuXrA==
X-Received: by 2002:a02:950a:: with SMTP id y10mr29198jah.42.1592505839753;
        Thu, 18 Jun 2020 11:43:59 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id v18sm1961927ilk.6.2020.06.18.11.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 11:43:59 -0700 (PDT)
Received: (nullmailer pid 690740 invoked by uid 1000);
        Thu, 18 Jun 2020 18:43:57 -0000
Date:   Thu, 18 Jun 2020 12:43:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, dhavalp@codeaurora.org,
        mkurumel@codeaurora.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sparate@codeaurora.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org,
        linux-kernel@vger.kernel.org, mturney@codeaurora.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: nvmem: qfprom: Convert to yaml
Message-ID: <20200618184357.GA689384@bogus>
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617074930.v3.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 17 Jun 2020 07:51:13 -0700, Douglas Anderson wrote:
> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> 
> This switches the bindings over from txt to yaml.
> 
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Split conversion to yaml into separate patch new in v3.
> - Use 'const' for compatible instead of a 1-entry enum.
> - Changed filename to match compatible string.
> - Add #address-cells and #size-cells to list of properties.
> - Fixed up example.
> 
>  .../bindings/nvmem/qcom,qfprom.yaml           | 45 +++++++++++++++++++
>  .../devicetree/bindings/nvmem/qfprom.txt      | 35 ---------------
>  2 files changed, 45 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.txt
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/qcom,qfprom.example.dt.yaml: example-0: efuse@784000:reg:0: [0, 7880704, 0, 2303] is too long


See https://patchwork.ozlabs.org/patch/1311254

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

