Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC2E1E733E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 05:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390206AbgE2DBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 23:01:41 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39219 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390168AbgE2DBZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 23:01:25 -0400
Received: by mail-io1-f65.google.com with SMTP id c8so801511iob.6;
        Thu, 28 May 2020 20:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mCk2KWwnIfBIEmQLrjuIlBW17EAKY/fGWJtKTwA9/g0=;
        b=D/gcPelBI4rxGYVC6qyhQGDYZnFq9A+HKU7/z5wpLUoQnC8m7dWShR60gIULl049JE
         a4TBlbA9xrGLAtUz2fTc8LljCkgAN7vdogK1lOZIH1/L8aHibMr8s2WRmyN49M7z8NWw
         9rlw/NcC13/HXMPKZEBjhdmh8+nSXUGIubPDn3BhmWHw/YIZHwnBdZeb02YuokdfAhvg
         XbWp6CPoFOF/Ygtozm6x8CkTpUPP0eU55welYVaLVmhkISgArUCyWhm6T2W35bBbUqHD
         /rggQh2roiCpCDiJmR6lvEWZofYeEkSMYVQd4rE3MqgKZRSO4saFy5P3gMQIGKXrWRpP
         3QrA==
X-Gm-Message-State: AOAM532t04Ykb2dIExpInQ1S+cRpgQ/OmOY3L5oMZBvVZF/2zpl0a1gp
        QrS4s5Ys/v2th9j/iYJsyLihJUVdyQ==
X-Google-Smtp-Source: ABdhPJxAwggDYZtalBjJo3AvhM496oWJaFC2RV8/EtvTQ4YGZKkavrgup6mDnycN9zFgI8KXCD2rgA==
X-Received: by 2002:a05:6602:2ac9:: with SMTP id m9mr5010558iov.68.1590721283890;
        Thu, 28 May 2020 20:01:23 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c10sm3024045iob.22.2020.05.28.20.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 20:01:23 -0700 (PDT)
Received: (nullmailer pid 1190529 invoked by uid 1000);
        Fri, 29 May 2020 03:01:22 -0000
Date:   Thu, 28 May 2020 21:01:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     kgunda@codeaurora.org, nishakumari@codeaurora.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, rnayak@codeaurora.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: regulator: Add labibb regulator
Message-ID: <20200529030122.GA1190091@bogus>
References: <20200528154625.17742-1-sumit.semwal@linaro.org>
 <20200528154625.17742-3-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528154625.17742-3-sumit.semwal@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 28 May 2020 21:16:22 +0530, Sumit Semwal wrote:
> From: Nisha Kumari <nishakumari@codeaurora.org>
> 
> Adding the devicetree binding for labibb regulator.
> 
> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> 
> --
> v2: updated for better compatible string and names.
> v3: moved to yaml
> 
> ---
>  .../regulator/qcom-labibb-regulator.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml:  while scanning for the next token
found character that cannot start any token
  in "<unicode string>", line 48, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1299916

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

