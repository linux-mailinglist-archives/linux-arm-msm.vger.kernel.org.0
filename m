Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAEFC5E8EDF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 19:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiIXRXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 13:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiIXRXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 13:23:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B514E3DBDB
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 10:23:28 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i26so4791203lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=eE/Re1Zix4MLMDESnhyXIaVTrN+pH4fXX+7CdENuln4=;
        b=NsqKraFXmKU8sAJGtgFwo9uYMPsjN1jFgnCU/afP9s5cajyKX3oQ6suovZ3rHBrUkJ
         zzff0GTK22+9+g3bMIIflHXq1vPWRNY9v6Kuq9wrdwWH7qWo/5DDpAcMC42Jq2wWSyIV
         MlNtgoH6pFDHmcNBOK0+AfXEuChuQh+o5ha/Uy3M2QgBVL61OrhUgk/y5md/gnqEktpk
         6q7EhwC5oYFkUM6xbjnXi43E16IgKDjwACEyMISKKuj7XUXkssWveVeGWRJvNfJg9xv3
         9wGIXCLrLDU+3t9qwWY2Upvn8pPyo4/NCYaagAG+8WIzUXE60gEH+qnmSUmo3ufd4BpX
         g+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=eE/Re1Zix4MLMDESnhyXIaVTrN+pH4fXX+7CdENuln4=;
        b=7/qJwiKuEKpeSgJyMYg0W7yRBUAuscXf2IZw1C4IFqCelCtjq7v1Uu1wUOZECgTAni
         Zp9t7HbLzfq2KRG1Q1Bl2Qi1A95gVTbyf5C6wXiC7UFh8P3oGngeIQ1zh0+NYmPwS5Up
         JoXcBLbuLZyed8OWXKsoZIwgT309rMx0fd7vzfdoIc3vugn51kOD01r1kCI0inZYso/K
         JgEVGXcWqRfSWEcs+F4sPOnAjJ7VAAo1Gl0YK+KzkrSeCCYQqSubIe7JdDf80zTYbwy7
         TjT3VxRsitB/fqFIKGODY54QS4bCoT9PAaIidLpwGZbde1M8GLKd0jiHZWF6asjHHYJi
         Pleg==
X-Gm-Message-State: ACrzQf2mRqXV5k2QFFPviPwP8AFRCMlI0C0iEuz1n/aiWmoPe99yN0jX
        cVLOr288PhNszurxjW6BAplcbA==
X-Google-Smtp-Source: AMsMyM6L6jT5Wgp0eexIvy2f6PcmVIhOV2LU4f2eXI7kOcoBQHEDmhJrnRh4w+6w8DgwGgaLeqvxJw==
X-Received: by 2002:a05:6512:312d:b0:497:a3df:a08b with SMTP id p13-20020a056512312d00b00497a3dfa08bmr5209846lfd.462.1664040207079;
        Sat, 24 Sep 2022 10:23:27 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y10-20020a2e544a000000b0026c5dce1f9dsm1770656ljd.106.2022.09.24.10.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 10:23:26 -0700 (PDT)
Date:   Sat, 24 Sep 2022 19:23:24 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 03/12] dt-bindings: display/msm: add interconnects
 property to qcom,mdss-smd845
Message-ID: <20220924172324.qdgz5dnccncadmfz@krzk-bin>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Sep 2022 15:36:02 +0300, Dmitry Baryshkov wrote:
> Add interconnects required for the SDM845 MDSS device tree node. This
> change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
> Add interconnects property for display"), but was not reflected in the
> schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1681884


mdss@ae00000: 'dsi-phy@ae94400', 'dsi-phy@ae96400', 'dsi@ae94000', 'dsi@ae96000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb
