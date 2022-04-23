Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07EFA50CBD6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 17:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbiDWPi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 11:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234662AbiDWPiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 11:38:25 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093621118
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:35:27 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id e4so12334327oif.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yZmrXMgw1MBRyJ3VvvD/S/NJK9gJ19shfJZhz6rDBD8=;
        b=mGSQvuV4hkqafUS7ZKoo2FiRZjhxNffY3wsAOyi1ma31ijRXbJn7+RGsvTN6SXsFGX
         wKkFcFDQHKqocEa661h2Jjyd41tSBDAQR9fFp0fTa7nU065FkmcLu6e1fcP1s9rhoqZj
         d32vvCyFvTHHFxt4RpSRFdovtI6OsL6Lebx9Hg7Stu0I7Sby4ZxAiSgi4Kx8RgifAM/+
         /oO28YDzcfR8AgzXwbBxfaJBjz1qK42jCwypNOXerWO+v6k4fnV1v/dGEt2y2M7DudbP
         qTatpmrm4WRPsciOM8dowgfI1mcbKTcUeOto2H6tIeHIqPuZWFa3Rr/GfSni5GmgOtHH
         7Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yZmrXMgw1MBRyJ3VvvD/S/NJK9gJ19shfJZhz6rDBD8=;
        b=GFp1YPW0dGC98IKcrdLzDi0uYPYudfupFChQMFhFlqTp15QOrv12c5IScPByYm258G
         ws/SNe01SIHVjrCZQVySakXaImRSj90gmzs05HtZ8aH/0TpgrFb84O6FCoVNcH+xOGsA
         qEdgA8mdC+ZoLJlt83AxvGBGB6kM6lkyaOib6ge1mU2SVVAf2aYX9fKx5LSOd+RUuT//
         4n/0I33bIFqsvwiRVN3g+iyGowoWJdBxFoQXAdNhSIprUx8dUdRH0F+FsXhez8/TY5CD
         2EpEasgZllCdrozXsHXkA9Cbh56/aXgcSg/DY8KWdHXOVrM2Wl1F0Rgg1Cy4qwK9aocx
         toHw==
X-Gm-Message-State: AOAM5304ydBqAv0dWj+1BCMnGq3z/kAqGFIFqfWhw5HxzgYucc4KMaHW
        Hpgg0Uq2ThvX8kgkTiG3j66j/g==
X-Google-Smtp-Source: ABdhPJwEkJcEyjTPFjAvW1fVnvHs6ADGz6qPasmzNXMt4XfJZ82bYxcgsxvOViNCsBPsSyFJ5kSPgQ==
X-Received: by 2002:a05:6808:144a:b0:325:642:f58f with SMTP id x10-20020a056808144a00b003250642f58fmr1307346oiv.221.1650728126028;
        Sat, 23 Apr 2022 08:35:26 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id j9-20020a056808056900b0032252797ea4sm1948720oig.6.2022.04.23.08.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 08:35:25 -0700 (PDT)
Date:   Sat, 23 Apr 2022 10:35:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Teja Aluvala <quic_saluvala@quicinc.com>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, agross@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        mka@chromium.org, quic_hemantg@quicinc.com,
        quic_bgodavar@quicinc.com, quic_rjliao@quicinc.com,
        quic_hbandi@quicinc.com, abhishekpandit@chromium.org,
        mcchou@chromium.org
Subject: Re: [PATCH v4] Bluetooth: arm64: dts: qcom: sc7280: Add IO regulator
 handler in SC7280 CRD platforms
Message-ID: <YmQcu2GVES4FuwFU@builder.lan>
References: <1650458740-16957-1-git-send-email-quic_saluvala@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650458740-16957-1-git-send-email-quic_saluvala@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 20 Apr 07:45 CDT 2022, Sai Teja Aluvala wrote:

Look here:

$ git log --oneline -- sc7280-crd.dts
737f9ea6cee7 arm64: dts: qcom: sc7280: Rename crd to crd-r3
073a39a2a63a arm64: dts: qcom: sc7280: Add pmg1110 regulators for sc7280-crd
3ebf11fa4a35 arm64: dts: qcom: sc7280-crd: Add Touchscreen and touchpad support
248da168fbae arm64: dts: qcom: sc7280: Define EC and H1 nodes for IDP/CRD
427b249504ea arm64: dts: qcom: sc7280-crd: Add device tree files for CRD

You have 2 commits specifically touching this file and you have 3
touching the platform. Your change touches only the single board, so it
should match the two.

As said before, your subject is too noisy, you can express this change
with less words. Something like "...: Override Bluetooth vddio" completely
covers the "what" of this patch, in 54 characters.

> As IO regulator varies in different SC7280 platforms
> updating this handler in individual platform bluetooth node.
> 

"Bluetooth vddio in the CRD differs from that in the IDP, override it."

Makes it clear what area is touched, what value is overriden and why
it's overriden.

Regards,
Bjorn

> Signed-off-by: Sai Teja Aluvala <quic_saluvala@quicinc.com>
> ---
> v4: updated commit text
> v3: Updated commit text to reflect the change
> v2: updated reviewer comments.
> v1: intial patch
> ---
> ---
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index e2efbdd..6cbbddc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -35,6 +35,10 @@
>  	};
>  };
>  
> +&bluetooth {
> +	vddio-supply = <&vreg_l18b_1p8>;
> +};
> +
>  ap_tp_i2c: &i2c0 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
> 
