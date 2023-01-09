Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2A5662889
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 15:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbjAIOaw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 09:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbjAIOar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 09:30:47 -0500
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67FCAE4F;
        Mon,  9 Jan 2023 06:30:46 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id h185so7238764oif.5;
        Mon, 09 Jan 2023 06:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CdKdj+hcNjpReSeZV+IRCHnqweaFjAm/lB18fZu7Ecs=;
        b=srvxzlE+4kFF2VriB0DVJL/w03tP6hF8ib0+OA12Nmkm77qv5D7ZlTg5iZA29dT8Sa
         Snvs6AqUbUzTcFzFOLF41ySDpzeo5zwfM4gB5AXFIEzknDdMfbxg3VqT1LjKeMd33Z94
         xp0QWKcwiTNc9A1DD71YMF1uHg5jXK2rLHI95ppozPOG6+UQGBF8xrP9JDFdhfjUvtwN
         e7gC8Z+sqfUxSm+kxQAkMiZmJ0UNTLoqUkWHEiG5Rz9MU2y4PA0V2oKaurhts98Wgli0
         MuguUqGBRi/q+kKWIjKAUGuAhP5UQ4mcKFJ0MIEfSHOasB4rI6FG/57Gd30Zdqu0bQ9f
         1aaA==
X-Gm-Message-State: AFqh2kruZ3mbSl6NafmpCP6Phx+Gtyn2Ikibrh+GB/I6De3x5aEne8lx
        k+H4x6edRTBZniod56MxfN6wXWRfOw==
X-Google-Smtp-Source: AMrXdXvLsXaA1l+xawf29SNVTbGb1eFYw2xK7w2qEUU+ZI5opjQejHIQwtP2LLsB7Bt7cJaAHsg9ag==
X-Received: by 2002:aca:2817:0:b0:363:b7d5:3efc with SMTP id 23-20020aca2817000000b00363b7d53efcmr13017160oix.53.1673274645844;
        Mon, 09 Jan 2023 06:30:45 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a18-20020a544e12000000b00363760f96dcsm3903203oiy.42.2023.01.09.06.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 06:30:45 -0800 (PST)
Received: (nullmailer pid 237519 invoked by uid 1000);
        Mon, 09 Jan 2023 14:30:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>
In-Reply-To: <20230109005209.247356-2-dmitry.baryshkov@linaro.org>
References: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
 <20230109005209.247356-2-dmitry.baryshkov@linaro.org>
Message-Id: <167327379921.67772.10477255081535965551.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: add core clock to the
 mdss bindings
Date:   Mon, 09 Jan 2023 08:30:36 -0600
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 09 Jan 2023 02:52:06 +0200, Dmitry Baryshkov wrote:
> Add (optional) core clock to the mdss bindings to let the MDSS driver
> access harware registers before MDP driver probes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230109005209.247356-2-dmitry.baryshkov@linaro.org


mdss@1a00000: mdp@1a01000:compatible:0: 'qcom,mdp5' was expected
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

mdss@1a00000: mdp@1a01000:compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

mdss@900000: phy@9a0600:compatible:0: 'qcom,hdmi-phy-8996' is not one of ['qcom,dsi-phy-14nm', 'qcom,dsi-phy-14nm-660', 'qcom,dsi-phy-14nm-8953', 'qcom,dsi-phy-20nm', 'qcom,dsi-phy-28nm-hpm', 'qcom,dsi-phy-28nm-lp']
	arch/arm64/boot/dts/qcom/apq8096-db820c.dtb
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb
	arch/arm64/boot/dts/qcom/msm8996-mtp.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb
	arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb

