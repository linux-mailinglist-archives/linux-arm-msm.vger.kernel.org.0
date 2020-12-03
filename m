Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941F02CD467
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 12:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgLCLPg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 06:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729231AbgLCLPg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 06:15:36 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1582C061A54
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 03:14:38 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id b12so936877pjl.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 03:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vv+PloNNQCpQeJh5mFlRBld7Nz2wsk2oArN9hYJ1dLo=;
        b=ruBol5EyD4z5iiIGmPi+XlFOYN1ub6mXaE7F8GUllBzOn6Jhvt4ZuwuKC+13Tg8c4R
         n+nJ4+x3UdaiG81iS73wCh0IkRkui1qN1RE8ckGX65woLtuFmezqrqVFfTEJ3F1/zA3n
         xKwq8rVxdvmoiwA7CUHhFDtVrhKjuKiDP8oByQRke7NhjPKnmKO4oleXatMMayIoi2lJ
         475QXbxrjRPp+T+YYXZG/2xzxPz0PjApfn5VqrCeh+K1XyHvTq+o6YYD5l/Q0I56QKVJ
         bhQwyTV8MRB2QxH5r+L5Fi+wsJu89dJO3SjLhtGEfTNfBfDF10sAyZYbvR/j8q9gl0Z8
         7aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vv+PloNNQCpQeJh5mFlRBld7Nz2wsk2oArN9hYJ1dLo=;
        b=Rs5GqOVM2fXQ7KMFbyMZAXQJmvln0bRXbXdtGgpep+oZLo85ExfJzJ6ktJlpBZwh5v
         fdgcEoqKGTxnMQAQJVA6Y8qH9NSmn3YYZB3uqCgMJw/ewFfq7v2zaubcbKrSUPQKxTgB
         maMZZ/EihUOpaoXwOhr8EM9CyD2kebIWVAYa7m5ZFCtz0Uytmj3A7o/EGWguarDvHK2A
         SBOphxISkE7iKCpuyaDjws0wUQJTqd/DwdGe1eShNMUir9UuYu1Z0wei7QcqHeZBhJUk
         WLs04YOK9LaPXeWiI2kH6Gu5l1NsIPf4gTFQ26p/KR+cmctFxUGVs1iU1y12K041BH8Y
         j/ZQ==
X-Gm-Message-State: AOAM532Zwvfpil2C1F2J/xMfaN6EZ6UOUd3dn9J/J3oC60YeeydhXCsd
        XGxh1qXBBmFrmbIHxjHctZ4o
X-Google-Smtp-Source: ABdhPJz0bSnP8i8XsXIdivewK4frG9Qqo3zypWeyXWVDp7r+odBj7xIPGfrU6DQ/4tiLnL9TQyrTTA==
X-Received: by 2002:a17:902:820e:b029:d6:e802:75aa with SMTP id x14-20020a170902820eb02900d6e80275aamr2696962pln.51.1606994078204;
        Thu, 03 Dec 2020 03:14:38 -0800 (PST)
Received: from thinkpad ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id u24sm1696870pfm.81.2020.12.03.03.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 03:14:37 -0800 (PST)
Date:   Thu, 3 Dec 2020 16:44:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     angelogioacchino.delregno@somainline.org
Cc:     viresh.kumar@linaro.org, rjw@rjwysocki.net,
        jorge.ramirez-ortiz@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@somainline.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ulf.hansson@linaro.org,
        nks@flawful.org, lgirdwood@gmail.com, daniel.lezcano@linaro.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        phone-devel@vger.kernel.org, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        robh@kernel.org
Subject: Re: [PATCH 11/13] dt-bindings: cpufreq: Convert qcom-cpufreq-hw to
 YAML binding
Message-ID: <20201203111427.GA3937@thinkpad>
References: <20201126184559.3052375-1-angelogioacchino.delregno@somainline.org>
 <20201126184559.3052375-12-angelogioacchino.delregno@somainline.org>
 <20201130172305.GA2661895@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130172305.GA2661895@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 30, 2020 at 10:23:05AM -0700, Rob Herring wrote:
> On Thu, 26 Nov 2020 19:45:57 +0100, AngeloGioacchino Del Regno wrote:
> > Convert the qcom-cpufreq-hw documentation to YAML binding as
> > qcom,cpufreq-hw.yaml.
> > 
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

There is already a patch floating for this. Please see:
https://lkml.org/lkml/2020/10/20/676

Thanks,
Mani

> > ---
> >  .../bindings/cpufreq/cpufreq-qcom-hw.txt      | 173 +---------------
> >  .../bindings/cpufreq/qcom,cpufreq-hw.yaml     | 196 ++++++++++++++++++
> >  2 files changed, 197 insertions(+), 172 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/cpufreq/qcom,cpufreq-hw.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpufreq/qcom,cpufreq-hw.yaml: properties:clock-names: [{'const': 'xo'}, {'const': 'ref'}] is not of type 'object', 'boolean'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpufreq/qcom,cpufreq-hw.yaml: maintainers:0: 'TBD' is not a 'email'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpufreq/qcom,cpufreq-hw.yaml: ignoring, error in schema: properties: clock-names
> warning: no schema found in file: ./Documentation/devicetree/bindings/cpufreq/qcom,cpufreq-hw.yaml
> Error: Documentation/devicetree/bindings/cpufreq/qcom,cpufreq-hw.example.dts:150.3-151.1 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/cpufreq/qcom,cpufreq-hw.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1364: dt_binding_check] Error 2
> 
> 
> See https://patchwork.ozlabs.org/patch/1406857
> 
> The base for the patch is generally the last rc1. Any dependencies
> should be noted.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
