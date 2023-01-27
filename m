Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D987F67E393
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 12:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbjA0LjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 06:39:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbjA0LjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 06:39:12 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96851525B
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:38:43 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id r2so4697322wrv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ni8Cusz/dT8zUFek+MYguyKoB3PwAkyaE3ephZ4CU08=;
        b=qmvp3S2K7r4uljeqrFk1lVMip5pY8sEMKRyjJsNN0haVAj4aPbnsq/U+EX62ZX/mvs
         0MbnNLhDpI8cMoHJR1oAc1V/K1Q8Qvx+IPFuQqY++F/0KFyz/KIbuYt051rXg7/ia7rV
         hcPf9wCxEBCcsYx28BLmSq50aa4lQm/3vwLxjaMetMZB8sGuKlNkm2Ea8QypUoM2TaVS
         /IwYnEHNJb2xv7o5SSPQgnwg7MwpthyFIO9txGiB5eJ8qXVk4MSH4XRaY3HiRVIlfUtz
         mYVVZ4uCk3Lr8RX+KvuXVlQx8t93mpJKM+ZX+MY0ZVXty+I/3lwJ5y7pvL7KG5hYESsz
         hq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ni8Cusz/dT8zUFek+MYguyKoB3PwAkyaE3ephZ4CU08=;
        b=VGJMYVnF2dPkbrKukd7yf5RTWlVBKhlSiR6pWSpyGzCE/FFFWIStutGBlLUpjXWhV1
         uU360IUD8Yi3kins10FmS+T3vfc3aMSt7UdQz5qwg2ZlwMXRVvQTUCBJwSWLadOqDCkE
         MD3pbUFdt2TKxXiLKTvpUnd/Skr/O/Ll/22i1EDiaxTfQI3+Py72+i6mcBmyVGogi8Wk
         PZRkruSb7qARe6Ers6TqThNns05sKUVlUaH5b/InFB3u/kXef8BWEXb1NYbvUjcVQxn4
         QhIplxnjVhmN1pb/I4Wf6hp6dx+Ma8qBnQMtuKntqAM2NTmcbv0tr0nMCcNo8tABatkV
         2v1A==
X-Gm-Message-State: AFqh2kpG7/eTyz8Fh6G8bUmBukuA9EsV7ePSKA5sAk5JtRYma7qVhF21
        rchPRUJaphDMIdjGy3MRbf95Yw==
X-Google-Smtp-Source: AMrXdXvQjEMISjKfYlprlRGHR09vOGGOczwmLwCiV53zD0um9jm5b2vCzQXGkI0sCfp7TdHWdZb2NQ==
X-Received: by 2002:a5d:43d2:0:b0:2bd:c962:cd35 with SMTP id v18-20020a5d43d2000000b002bdc962cd35mr32757358wrr.68.1674819483141;
        Fri, 27 Jan 2023 03:38:03 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r25-20020adfa159000000b00297dcfdc90fsm3929314wrr.24.2023.01.27.03.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:38:02 -0800 (PST)
Date:   Fri, 27 Jan 2023 13:38:01 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550-mtp: drop incorrect
 vdd-l6-l16-supply
Message-ID: <Y9O3mSkYJWMOWAjf@linaro.org>
References: <20230127111913.117036-1-krzysztof.kozlowski@linaro.org>
 <Y9O2q6Om+MK9k3UL@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9O2q6Om+MK9k3UL@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-01-27 13:34:03, Abel Vesa wrote:
> On 23-01-27 12:19:13, Krzysztof Kozlowski wrote:
> > There is no vdd-l6-l16 supply in qcom,pm8550-rpmh-regulators.
> > 
> > Fixes: 71342fb91eae ("arm64: dts: qcom: Add base SM8550 MTP dts")
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> > index 725d3bc3ee72..d6ae80414654 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> > @@ -47,7 +47,6 @@ regulators-0 {
> >  		vdd-bob2-supply = <&vph_pwr>;
> >  		vdd-l2-l13-l14-supply = <&vreg_bob1>;
> >  		vdd-l3-supply = <&vreg_s4g_1p3>;
> > -		vdd-l6-l16-supply = <&vreg_bob1>;
> 
> NACK.
> 
> There is actually an L6 but is not added yet.

Actually L6 is added already, my bad.

> 
> But the correct one here is actually: vdd-l5-l16-supply
> 
> At least according to the power grid documentation.
> 
> >  		vdd-l6-l7-supply = <&vreg_bob1>;
> >  		vdd-l8-l9-supply = <&vreg_bob1>;
> >  		vdd-l11-supply = <&vreg_s4g_1p3>;
> > -- 
> > 2.34.1
> > 
