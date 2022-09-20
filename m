Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10375BDFDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 10:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiITIVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 04:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbiITIUR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 04:20:17 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD546CE3A
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:18:57 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z20so2080508ljq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=N+juPwhYXygoVLZ5FwCYsXkZBxWv1f+ksi4NS5ClCSk=;
        b=GIjpafKjmVIE02NDvn8jJD5yEpoRMt7fvlEC/QrNMJfTY18eQpR3fptNS5H06EsgnY
         jGEj5W2D4t539YId8TVn+5bUEQlTf9kwKrXC9b2v6V4LjbClPdVxT3BvJcZIIzCkoFAx
         E/w2YP6dLrkPT9+Mo/+blcg7qW9y3bmMFbdNd+jxng00rGrxkMVblg8y1f0iyMKYH5U/
         /jWJUfnUpDN7EVe6XrxXJHeLVsVggp/MdNqeefbY2ByshZT52LTWAhlcblrbLgqqu8/n
         1tkj7+SZbh60RlVwX7l7X7ruFLwCqpwLIfjivdW8RDcZIHbf0QBac9jIPLeOpzEA0sgL
         dU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=N+juPwhYXygoVLZ5FwCYsXkZBxWv1f+ksi4NS5ClCSk=;
        b=O/SBLvLzi8Ki+d0uqQQaajjLgwZ8xA21PNNvL85pWQ6FDV65O59QRedyCzbu2Eli6c
         kcx8BHF+aJ5TVioLXe9mfkWwtHn8RKqUYwYE4B4rd3/BwyyJqCf9vW9pJinorzQ2jfIa
         bdSt0KRIZ+78mBoZtJyZ86slfQf/28Df16c+ILixhSTxRjg3xVCnlsheO6j32qdSOq1l
         F3MI1W7Jn0eEpVLnsPsyEDdlAtxfZrZYt5Kkpm+wEKCbnCc69hqNsqgUROpZnvXwz7Lw
         qnPaR/GHflHaj5Vl5Q75ku2jmR5TkHNnPBKpGEGLM7FO2xCE9JXZQ0Y+VMixRwgThYFG
         1uGQ==
X-Gm-Message-State: ACrzQf2ee5JC+K86m4vwjRiHNXJ+aQWTjTBJzlxisKmXX3HvoPQshr7Q
        u6NeZYkFErol4R4u+sqn9qwiyQ==
X-Google-Smtp-Source: AMsMyM7t7rB1wfZCVKbIzHcTfNTU/VZVxlfoar57U8XOg0YONc2uBqrv0baYybgTz5uENGKttyDiuw==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr6839607ljh.78.1663661936144;
        Tue, 20 Sep 2022 01:18:56 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j10-20020ac2550a000000b0049a747d6156sm185928lfk.287.2022.09.20.01.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 01:18:55 -0700 (PDT)
Date:   Tue, 20 Sep 2022 10:18:53 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, andersson@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: remoteproc: qcom: Convert wcnss
 documentation to YAML
Message-ID: <20220920081853.3rzq7wo6rnpao6p5@krzk-bin>
References: <20220920030316.1619781-1-sireeshkodali1@gmail.com>
 <20220920030316.1619781-3-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920030316.1619781-3-sireeshkodali1@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 20 Sep 2022 08:33:14 +0530, Sireesh Kodali wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.example.dtb: pronto@a21b000: compatible: ['qcom,pronto-v2-pil', 'qcom,pronto'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.example.dtb:0:0: /example-0/pronto@a21b000: failed to match any schema with compatible: ['qcom,pronto-v2-pil', 'qcom,pronto']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
