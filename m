Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3C55BE9A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 17:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiITPGc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 11:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbiITPG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 11:06:29 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C147DE0FD
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:06:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id s6so4278292lfo.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=p4P0NeQ+Hs0UhBCJIe2tPG1fmTf8Df505EFaHwu7878=;
        b=NDTTn3LJdGo55R3e01AcgjrRXfHlQQm0T3o9ZEjVZ5hJvJd5cgDrOpjtPQ+GT9oBzd
         domJ+l5Aqw8+AoTPiZg2c9wwWuiVn15QKaE97F69i/knxCLqmswttrvL7UQ8/y9SZ44X
         DyDXo9cdOnKqW0z2bj0KnZAusB31jfwWS13thxjyHiEb+J22KBg/7ge6fbuL7BMDnOQo
         uVpPqQtEuojB8oSA068Qasf9FSnnUx6QMzqWOA8IT6OZwwSJ8IA33UTJc58tgJ4KUY0D
         a2ChbpPFpcu3PlWRQMDtT9u0jC350YcCBVo/8Zcym69E25pKih7UHltEQrMiuYo/68q1
         Ch6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=p4P0NeQ+Hs0UhBCJIe2tPG1fmTf8Df505EFaHwu7878=;
        b=EbmAXHi0oY3C/viPiSdz2suVs5Eu1k/ZYyl8pQjnMz5R2G1WoZWc5F61/dRr3EWMLb
         hLB6ujKVaKxF5f3D6vUdojicGFE53Qwi9DxR9XfSbDBl/BcxVHvfLu3NcB+Wtn7kjefC
         BvOfvOq5Bh7G+uAGzJsKKkqbaiU+7nhC97WdeYf+8K78Qs4l/KFhfyuxH0+raur3lYOM
         NuhbuSy/Jq/rczPDG1ZCvJdkCgYUZJyeZvxBxemeCjEO8/74ObrQ29HDP8CiXCXnWgbH
         X7EC2xxJ+W1Xhz9fOfiGDIp5fia2AcHVpfnfdr5y5q3gk9kiSnKFB6GgGy2AdxzJFM0v
         8bpA==
X-Gm-Message-State: ACrzQf2PEgb3o/HnfMB2nZBqf2eRCa8x86Ngny5+Sk4mCrNHwHGwrAXB
        fwKE54zQL7i2JcJcpYTqJDUjQA==
X-Google-Smtp-Source: AMsMyM5ATrQusUgyRLPhm8i+Xxz0V5beQbLVoUmOUwfeMSPV01vAXnRs9x5CHLxEWRXyIl5pvXZzww==
X-Received: by 2002:a19:7406:0:b0:49d:d448:59c3 with SMTP id v6-20020a197406000000b0049dd44859c3mr7932629lfe.300.1663686385856;
        Tue, 20 Sep 2022 08:06:25 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512202900b00493014c3d7csm339824lfs.309.2022.09.20.08.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:06:25 -0700 (PDT)
Date:   Tue, 20 Sep 2022 17:06:23 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     quic_plai@quicinc.com, agross@kernel.org,
        quic_rohkumar@quicinc.com, swboyd@chromium.org, tiwai@suse.com,
        broonie@kernel.org, bgoswami@quicinc.com, perex@perex.cz,
        devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, lgirdwood@gmail.com, andersson@kernel.org,
        judyhsiao@chromium.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 1/8] dt-bindings: remoteproc: qcom: Add SC7280 ADSP
 support
Message-ID: <20220920150623.rhpeizf7ufkwqz2i@krzk-bin>
References: <1663655359-1402-1-git-send-email-quic_srivasam@quicinc.com>
 <1663655359-1402-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1663655359-1402-2-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 20 Sep 2022 11:59:12 +0530, Srinivasa Rao Mandadapu wrote:
> Add ADSP PIL loading support for SC7280 SoCs.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes since V6:
> 	-- Update glink-edge property.
> 	-- Add qcom,qmp property.
> Changes since V5:
> 	-- Remove qcom,adsp-memory-regions property.
> Changes since V4:
> 	-- Update halt registers description in dt bindings.
>  .../bindings/remoteproc/qcom,sc7280-adsp-pil.yaml  | 226 +++++++++++++++++++++
>  1 file changed, 226 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml: properties:glink-edge:properties:qcom,remote-pid:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml: ignoring, error in schema: properties: glink-edge: properties: qcom,remote-pid: maxItems
Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.example.dtb:0:0: /example-0/remoteproc@3000000: failed to match any schema with compatible: ['qcom,sc7280-adsp-pil']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
