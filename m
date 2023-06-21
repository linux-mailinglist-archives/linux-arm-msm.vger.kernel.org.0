Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F7573867B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 16:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232852AbjFUONb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 10:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbjFUONF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 10:13:05 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092411FE1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 07:12:24 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bff4f1e93caso581295276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687356734; x=1689948734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ErBfz/eE9PwEy6R3MCzuAtZChT+YesXd4xpw5KCkMaY=;
        b=ONfw9xNlBCMN+q8Wk9Bj2RaWaKH5m5cmGxsJITFMIXiYWflCj3SdkuzKuohwjD/YTb
         GQeMfsJwbiIGnadDwbbetgv0gl1phwEsI4g224ucjGqX8yl2ZbxON8f82hbrWUnYdiLz
         cdTZk+mDAqXaI7dy0ecomlT6hWqutVyL8EZZEXi5+c8Ru57IA4kiIa2XaqgHbxC3vWTl
         ENK10peTByd15gHXMWgla66vh1ktVIW0GthlB7Y1TTxZNOedYEFDFtz/5lI2GophoGgg
         GhD+x6jS2ykj0jQfj89jSs3Ba6u5JvDVKkQDX8erhw+hhVF1VGtbJEp4imZuIqE1RLWr
         rOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687356734; x=1689948734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErBfz/eE9PwEy6R3MCzuAtZChT+YesXd4xpw5KCkMaY=;
        b=H6gU+25ykK3mZUasMeLDkEFFzgPIl9OquHXoVHGnkJAXA2pRrcenxTtrAXGaTXTaZr
         EO6AavtD+AmVSDK7pX8RimoM0E+NXQGAf9z/mwekYeNSoHTuF58S78NYGsDJjI8z/RPi
         uvTR1JCQAsSt8AeMe3E/zY7QeMtjrMrr/hkoLHsGR5afVaY0NZRV7Zcgn26szAOCzqna
         YpWQ1Hdx8Z8ghjtxjZH5Ko2vBGKDy8wtEh0Sa840tNiFlzS82+MFfnCW1AYOiO94/oto
         EsK6o78O5CKFD5op5m04S7pC1hURB+8yCDaQWaITn9CxyXGOymMyQnno5J37ggPgSlqA
         ji6Q==
X-Gm-Message-State: AC+VfDxjlfCZeLQTtN37L45iGQbHz9cYFM/QMCqMt4oc/NlSGvKZDacO
        C+eUDXCxwh/gWloYcsOjwasZQASWJoyhuu1gjRY+TQ==
X-Google-Smtp-Source: ACHHUZ7cqDlxDOprUZhDcHvJBNqcJerx2HY1cmaV5EIzhCvX7MidMnlA75x51PBxKIB0Syn/nnot9axx/yUaPnUPBYU=
X-Received: by 2002:a25:2f82:0:b0:bca:3465:9ea2 with SMTP id
 v124-20020a252f82000000b00bca34659ea2mr11025537ybv.48.1687356734729; Wed, 21
 Jun 2023 07:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230620-topic-gpu_tablet_disp-v2-0-0538ea1beb0b@linaro.org> <20230620-topic-gpu_tablet_disp-v2-2-0538ea1beb0b@linaro.org>
In-Reply-To: <20230620-topic-gpu_tablet_disp-v2-2-0538ea1beb0b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 21 Jun 2023 17:12:03 +0300
Message-ID: <CAA8EJpph4zzcCiveV9Owjsf_y7FmTVk5WMuf5sFoWE+aOQp=3A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm6115p-j606f: Hook up display
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 21 Jun 2023 at 14:22, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Enable the required nodes, add the required pins and tweak a
> regulator to enable non-simplefb display on the Tab P11.
>
> Do note that there exists a second SKU with a different panel+touch
> combo, but due to insufficient information, that will need to be
> handled separately.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts | 57 +++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
