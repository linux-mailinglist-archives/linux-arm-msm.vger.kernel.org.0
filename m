Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D441E7E2A78
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 17:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbjKFQ4X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 11:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbjKFQ4X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 11:56:23 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129FE1BC
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 08:56:20 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso6267850e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 08:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699289775; x=1699894575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alAxQ7E5oSuVFPStBPyKJDDCOhb3s2DIeYQfUTb7TAs=;
        b=KEk9K3BCwVsHHNGhEwaHq5L3V0IncuiZ7IitIkPfJjQ0v6nRel7FfLlViETtfWY+Tg
         Yp1K3OMKewylpBwc8aXYktKACAJwt7+RhEus5JbsXo2d3TtCQGTCnICpo2p/inleakjp
         GW1lARq8nF1ZWLNC6uzDnaO2D9dm3ALkprJ44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699289775; x=1699894575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alAxQ7E5oSuVFPStBPyKJDDCOhb3s2DIeYQfUTb7TAs=;
        b=W6in9BeAxVPNa/Tc2IOC1/wL3OC/XE7wV9qIDjruLpW6IS+XUj20Beqxf/ezNp8t2b
         t42q+3RJPA0bigVRFw14gRe8lkKF5iYWpTQR+RRxBtdLp+RKpBfqG4tEqir4tjcb618P
         TH/x/VhqPK10uxKwVpeUTd0O+O9RSzUdZSmXTU5lYjSPRZ2+tlt2NFTsU+Yi42/FbCzt
         gvjGW8Lni42OoUOPqi+jDn+oMdz1Y70FYgFWyqJaNbrFFS7YzPQMvdPCJz5KynXqvuAu
         R2qef85xIct+To/46QXZKjCR4k8IyFNH/MHG1hEoI9rgs0zUycsZ3rX80k7ct/FTwNqM
         IY9A==
X-Gm-Message-State: AOJu0Yy4BclYN6I9dmIcEVtnHpN8jZz2zPCrgdqB38GhkDn34qU+CuoE
        jm/QVIMHS8FaM1Oub8l6t46TaBsaimo3mOzuL4Jaogdc
X-Google-Smtp-Source: AGHT+IEDSZJW/QOZLC7WNqrNM+8INKogseOJsPSFmsLvs8i1SR+PxvbrQ64aSG+9xR0EmEXaMiB8sw==
X-Received: by 2002:ac2:4f8e:0:b0:503:1d46:6f29 with SMTP id z14-20020ac24f8e000000b005031d466f29mr20213704lfs.37.1699289774819;
        Mon, 06 Nov 2023 08:56:14 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id o22-20020a056512053600b004fe48a27fa1sm24453lfc.114.2023.11.06.08.56.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 08:56:13 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507c9305727so5959e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 08:56:13 -0800 (PST)
X-Received: by 2002:a05:6512:2806:b0:505:6e12:9e70 with SMTP id
 cf6-20020a056512280600b005056e129e70mr156923lfb.6.1699289773464; Mon, 06 Nov
 2023 08:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20231103105440.23904-1-quic_anshar@quicinc.com> <feca8e74-6653-4cec-943d-47302431e1fc@linaro.org>
In-Reply-To: <feca8e74-6653-4cec-943d-47302431e1fc@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Nov 2023 08:56:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VTCXSQo3Bo3G7oJ48qA-fUet5rHAzT8WLM1Hx70KyYMA@mail.gmail.com>
Message-ID: <CAD=FV=VTCXSQo3Bo3G7oJ48qA-fUet5rHAzT8WLM1Hx70KyYMA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add capacity and DPC properties
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Ankit Sharma <quic_anshar@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_ashayj@quicinc.com,
        quic_atulpant@quicinc.com, quic_rgottimu@quicinc.com,
        quic_shashim@quicinc.com, quic_pkondeti@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Nov 4, 2023 at 4:52=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
>
>
> On 11/3/23 11:54, Ankit Sharma wrote:
> > The "capacity-dmips-mhz" and "dynamic-power-coefficient" are
> > used to build Energy Model which in turn is used by EAS to take
> > placement decisions. So add it to SC7280 soc.
> >
> > Signed-off-by: Ankit Sharma <quic_anshar@quicinc.com>
> > ---Hi, thanks for this patch
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> I performed a quick grep in arch/arm64/boot/dts/qcom and noticed
> that at least one of these values is missing for:
>
> rg -l --files-without-match dynamic-power-coeff $(rg cpu@ -l) | sort
> ipq5018.dtsi (homogeneous cluster)
> ipq5332.dtsi (homogeneous cluster)
> ipq6018.dtsi (homogeneous cluster)
> ipq8074.dtsi (homogeneous cluster)
> ipq9574.dtsi (homogeneous cluster)
> msm8916.dtsi (homogeneous cluster)
> msm8939.dtsi
> msm8953.dtsi
> msm8976.dtsi
> msm8994.dtsi
> msm8996.dtsi
> msm8998.dtsi
> qcs404.dtsi (homogeneous cluster)
> qdu1000.dtsi (homogeneous cluster)
> sa8775p.dtsi
> sc7280.dtsi
> sc8180x.dtsi
> sc8280xp.dtsi
> sdm630.dtsi
> sm4450.dtsi
> sm6125.dtsi
> sm6375.dtsi
> sm8350.dtsi
> sm8450.dtsi
>
> rg -l --files-without-match capacity-dmips $(rg cpu@ -l) | sort
> ipq5018.dtsi (homogeneous cluster)
> ipq5332.dtsi (homogeneous cluster)
> ipq6018.dtsi (homogeneous cluster)
> ipq8074.dtsi (homogeneous cluster)
> ipq9574.dtsi (homogeneous cluster)
> msm8916.dtsi (homogeneous cluster)
> msm8939.dtsi
> msm8994.dtsi
> qcs404.dtsi (homogeneous cluster)
> qdu1000.dtsi (homogeneous cluster)
> sa8775p.dtsi
> sc7280.dtsi
> sm4450.dtsi
> sm6375.dtsi
> sm8350.dtsi
> sm8450.dtsi
>
> Where platforms with a single, homogeneous cluster likely don't
> benefit from EAS..
>
> Is there any chance you could dig up the correct values, for at least
> some of these platforms? Or would you know whom to ask?
>
> FWIW the one we're missing the most is sc8280xp..

FWIW, I wrote up a longwinded commit message when I added these values
for sc7180. See commit 82ea7d411d43 ("arm64: dts: qcom: sc7180: Base
dynamic CPU power coefficients in reality").

The short of it is that if you have hardware and a basic "smart
battery" to measure power consumption it's pretty easy for anyone to
add some reasonable numbers.

-Doug
