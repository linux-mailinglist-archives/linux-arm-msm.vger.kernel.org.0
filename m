Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46CCD41EE58
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 15:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbhJANTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 09:19:03 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:40894 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbhJANSp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 09:18:45 -0400
Received: by mail-ot1-f45.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so11417180otq.7;
        Fri, 01 Oct 2021 06:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=kDrX2c/KRTB5dwMosW5IHCcmE5+KyupQ3EuZXfGIPPc=;
        b=vsH7vXKIL5c/eej0wLa3uQDlzlo+vkJD/QNo/ivloxFRgPqa32GX3uMywuWvizU+0W
         TXqQ0IoPLi8fPQnDTD5daqFJ1A6MtjiI/gUiN21VZvBhaHPiDJ2VPQEXZsr9/OAxMXDl
         y5LdtVOZBthjNVZvw1uuUs23kD0ubH9cfwKWMRejrbXsc03MPvyz/5QOVrMAt5jWQVcg
         r/uWENSE32IxYapehr7qh1krwP8zhoL0GNPDlPe2v0lVqa8Ln5M3nbETsvPFQhP7oBpS
         8svIYtJu7NhYItElKL1zJQMAygIv1sg6kp/a0nXpfzt93Fom8/llVb2FNqxGAN1Q7XSR
         cDYg==
X-Gm-Message-State: AOAM531bjOcD8MmRE+x3ySaQc3J4TCT9hw4waR6CGOGYrOk8AgKGC1nf
        bvHOdukhggKyZmQnJkrd+Q==
X-Google-Smtp-Source: ABdhPJx5MhVcT6KCJl1atVfLuyjJ4OFKEeB0PaPY8Ix4BZnjuY7hxo2kOYp0vh6j+cGiNXBYg8+hyg==
X-Received: by 2002:a9d:3e04:: with SMTP id a4mr10422599otd.329.1633094221002;
        Fri, 01 Oct 2021 06:17:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o8sm1161122oiw.39.2021.10.01.06.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:17:00 -0700 (PDT)
Received: (nullmailer pid 3666444 invoked by uid 1000);
        Fri, 01 Oct 2021 13:16:57 -0000
From:   Rob Herring <robh@kernel.org>
To:     Satya Priya <skakit@codeaurora.org>
Cc:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, mka@chromium.org,
        Liam Girdwood <lgirdwood@gmail.com>, swboyd@chromium.org,
        collinsd@codeurora.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-kernel@vger.kernel.org, kgunda@codeaurora.org,
        devicetree@vger.kernel.org, subbaram@codeaurora.org
In-Reply-To: <1633060859-22969-3-git-send-email-skakit@codeaurora.org>
References: <1633060859-22969-1-git-send-email-skakit@codeaurora.org> <1633060859-22969-3-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH V2 2/4] dt-bindings: mfd: pm8008: Add pm8008 regulator node
Date:   Fri, 01 Oct 2021 08:16:57 -0500
Message-Id: <1633094217.874896.3666443.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 01 Oct 2021 09:30:57 +0530, Satya Priya wrote:
> Add pm8008-regulator node and example.
> 
> Signed-off-by: Satya Priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - As per Rob's comments changed "pm8008[a-z]?-regulator" to
>    "^pm8008[a-z]?-regulators".
> 
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: pm8008i@8: pm8008-regulators:regulator@4000: 'regulator-max-microvolt', 'regulator-min-microvolt' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: pm8008-regulators: regulator@4000: 'regulator-max-microvolt', 'regulator-min-microvolt' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1535124

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

