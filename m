Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEC65BF974
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 10:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbiIUIgu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 04:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbiIUIgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 04:36:44 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48EB83069
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 01:36:30 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id p5so6028813ljc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 01:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=339+3mHOy+Q3FCaVFGj+b1oUEup7t5BZOT8tg60/J6w=;
        b=OhxZFifxim9zPK0LacO5Qma5OLzssTw7hyLTZf55g8Yl576rZWbzHHGZxYl+BV8A1R
         759NPU+SYX6JiEt8URE1Cwn9ek9ZIcBUPiCfXRXaj2n5IxnEefy1PGyKOjKqnrRJsqDN
         Ki0oLjXgixi3nHfOSJXVIrBEvXbNkpYC55p0/Ixyhaaq9by2hJxCqiPzyxv1vjIomxTt
         If15SNPjqOWCDeULCIVbHBBHk7ZUolgENnr8Rwy82TNhqy7kD6R62droTkYX1hn0a+Kw
         UYQBcqJjdHod3ko8sYs9RuROTnvjt7EKh1nvI2YqInnEYq+u7CWezuYhek0PyCuk8H/I
         mulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=339+3mHOy+Q3FCaVFGj+b1oUEup7t5BZOT8tg60/J6w=;
        b=nCr4iWhLm4qF9qK8Aa3k4VR0HbKV3+r3bQsPZS3vtNI4S9hPs+knt5qZyFn4j6521R
         JZJIn1FPfA/rShEWjYkTQffc6FNMEn0q46F3+20jLjiATgRcyBskwjKBpJhuor0bFcQo
         CcLyNEXAuSc812k5ExepvX6FLxN9Yu5r/oExTXpdqH8ktMnoR90WpGFOQlVsk8+OX4tP
         N6zVBGFeT/5x8r5I4Mp50vvxNsKWE5apuT/jgtHHkJOQn71AWtH/ehswU+SH8PTRhd+W
         Bvg87q79lpSm5apopGYiVMc7Akl+zfCm9MLVG8kb1bq8eZYFMzour8yIqcac/UKWieF7
         iJIw==
X-Gm-Message-State: ACrzQf1IW4rb/N1VkVAa3K9/tbSbWAtFoz1LTjuY2anvpfLLMEmsAB0G
        BwdA91XhbE9e32Y6a4mHd67Wbg==
X-Google-Smtp-Source: AMsMyM6b3yZpg7/i4MzSbXpTSPi/TUvJcWk9R7HkTuNplHg3c5LC8MYqw3z6tEzYJvxHGUzbYlMH0Q==
X-Received: by 2002:a05:651c:10a:b0:26c:5d7a:74b2 with SMTP id a10-20020a05651c010a00b0026c5d7a74b2mr2256193ljb.193.1663749388364;
        Wed, 21 Sep 2022 01:36:28 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q8-20020a056512210800b00499b726508csm328785lfr.250.2022.09.21.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:36:27 -0700 (PDT)
Date:   Wed, 21 Sep 2022 10:36:26 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     devicetree@vger.kernel.org, andersson@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: remoteproc: qcom: Convert wcnss
 documentation to YAML
Message-ID: <20220921083626.i7bqn45lvracp6by@krzk-bin>
References: <20220921043648.2152725-1-sireeshkodali1@gmail.com>
 <20220921043648.2152725-3-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220921043648.2152725-3-sireeshkodali1@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 21 Sep 2022 10:06:46 +0530, Sireesh Kodali wrote:
> This is a direct conversion of the existing txt documentation to YAML.
> It is in preparation for the addition of pronto-v3 to the docs. This
> patch doesn't document any of the existing subnodes/properties that are
> not documented in the existing txt file. That is done in a separate
> patch.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  .../bindings/remoteproc/qcom,wcnss-pil.txt    | 177 ------------
>  .../bindings/remoteproc/qcom,wcnss-pil.yaml   | 267 ++++++++++++++++++
>  2 files changed, 267 insertions(+), 177 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


remoteproc@a21b000: compatible: ['qcom,pronto-v2-pil', 'qcom,pronto'] is too long
	arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dtb
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dtb
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dtb
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dtb
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dtb
	arch/arm64/boot/dts/qcom/msm8916-mtp.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dtb
	arch/arm/boot/dts/qcom-apq8016-sbc.dtb
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dtb

remoteproc@fb21b000: compatible: ['qcom,pronto-v2-pil', 'qcom,pronto'] is too long
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dtb
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dtb
	arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dtb
	arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dtb
	arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dtb
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-amami.dtb
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-honami.dtb

remoteproc@fb21b000: 'power-domain-names' is a required property
	arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dtb

remoteproc@fb21b000: 'power-domains' is a required property
	arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dtb
