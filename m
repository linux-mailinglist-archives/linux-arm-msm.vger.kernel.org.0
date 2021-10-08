Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2CE426283
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 04:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235478AbhJHCsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 22:48:15 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:35727 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhJHCsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 22:48:13 -0400
Received: by mail-ot1-f46.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so10053490otj.2;
        Thu, 07 Oct 2021 19:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=+ZfkYND9mkqvpRdZR/wr5agCqOn0wi+sKDUIWLp3qNc=;
        b=gjLXjESNa67CiBVtiMUJ10TASXoyLsy5T/XAoTiRk/SryUomIEgPmE2s/pbn5jQQ+y
         HW3WcC14B7Q1rf0KXTG7E67aJ8uLPLjYoD7rA7keEU+WQk4kYVrc7v+WhKaYgQgbbJip
         BEoyKku1quyUhKnvdgKUXY32v/pTaYG8DhxAbqU/3MrQolCC4BpC7BFlN1LKUdCBzFpW
         hkjkrqKakR23mW+H38kvLurfxr83gnjbfTRjD660oGAWe5dzzzbH/GmHZb52JCSBY21R
         riXbda4vAut5rFJZK0/TVhPPWi3Oo5Ktp/QG5D6Q1kX95fEuOHy9tm5HCnYy1HQ6ukEl
         xh9g==
X-Gm-Message-State: AOAM533YrBCQrdGuQSmpcw7NKRx17fpvGuAAkHx0jMGRL7fXFY+VQ+Hi
        Of630yDhtSIFSBjtUloIIQ==
X-Google-Smtp-Source: ABdhPJwZc/YodnC4tiG0MfEqh9/9OaH0sUM1UbNJHC7VMjv7SKhumSL5j9KfvEJ11mtKlvtIk3nMhA==
X-Received: by 2002:a05:6830:4411:: with SMTP id q17mr6360383otv.67.1633661178183;
        Thu, 07 Oct 2021 19:46:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 21sm307434oix.1.2021.10.07.19.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 19:46:17 -0700 (PDT)
Received: (nullmailer pid 1409602 invoked by uid 1000);
        Fri, 08 Oct 2021 02:46:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, bgoswami@codeaurora.org,
        perex@perex.cz, judyhsiao@chromium.org, plai@codeaurora.org,
        agross@kernel.org, broonie@kernel.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, bjorn.andersson@linaro.org,
        lgirdwood@gmail.com
In-Reply-To: <1633614519-26680-3-git-send-email-srivasam@codeaurora.org>
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org> <1633614519-26680-3-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi pinctrl compatible
Date:   Thu, 07 Oct 2021 21:46:12 -0500
Message-Id: <1633661172.649691.1409601.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 07 Oct 2021 19:18:38 +0530, Srinivasa Rao Mandadapu wrote:
> Add device tree binding compatible name for Qualcomm SC7280 LPASS LPI pinctrl driver.
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1537726


pinctrl@33c0000: dmic01-active-pins: 'clk', 'data' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: dmic01-active-pins: 'function' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: dmic01-active-pins: 'pins' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: dmic01-sleep-pins: 'clk', 'data' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: dmic01-sleep-pins: 'function' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: dmic01-sleep-pins: 'pins' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: wsa-swr-active-pins: 'clk', 'data' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: wsa-swr-active-pins: 'function' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: wsa-swr-active-pins: 'pins' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: wsa-swr-sleep-pins: 'clk', 'data' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: wsa-swr-sleep-pins: 'function' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

pinctrl@33c0000: wsa-swr-sleep-pins: 'pins' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

