Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8217478E623
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 08:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244201AbjHaGJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Aug 2023 02:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243399AbjHaGJS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Aug 2023 02:09:18 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEB81B1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 23:09:15 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d746ea563f9so260693276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 23:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693462155; x=1694066955; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E2DoMZ95jX+7wuzxk8MbNgguoc+FvSC+cq1FLxzCeJs=;
        b=SbE6RVToDh3hDMM5zP/JdBVM57eFgVnu56CYzBYpoI2zHSEy2VW+SrAL+Ut67dG+27
         sV315/AFd4dHdbZahO3eVbNU6T4k8Crem+RTyxR2L7CUUUxwn9lrBpOekA56s6JWlMo+
         53KXr3epx7bYZry72B/HuoLKP9tf+D8FsYrHSlfORrZolfcx2iPZElFDcxEpMllaA9/B
         Pz/nn6TrG5STgnCHQkbpWUnK5oFiYjEgQOTBuePTNOE6G+MuGxWkbSPfitUb8022iX2f
         4iFKZxA1rVKebJBaIL4nLBXnJnniZ4uU3DG6HxTXDcQahp++5e6vmBNnpX2HPPETRJ2T
         uvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693462155; x=1694066955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2DoMZ95jX+7wuzxk8MbNgguoc+FvSC+cq1FLxzCeJs=;
        b=DOHHnDmBPtKkFEJblCUVBiYLRE/J/uBfh4JhkHObM7pUEd038OdJFnSIlD1P1Ydf1a
         WXHNxjcchgRBjSTbmH96hmxd9q32M5kohiF1FbZyZUKcSduqV7KqXLL3Kmtl3p3Qt3A3
         YkbYq0hJ8bTLDceq6DyzmqPHkUZmRaLRNIz5jtJL3noiXhkaK0dDAkDptH/x+efqX+pJ
         2Om5hLKQyPphsgdMOzY5oHsxVputdyvXuslvUPgQlN2fPuaoei2zS9KB4cX3gnsg0jli
         c5buaTsP0wqWtNg80i96TuDVMOVMCq0SXKH0UActC/xeyfcA9DjyIr9IccIWsCEw7Eie
         wdNw==
X-Gm-Message-State: AOJu0YzGq2TcROM15jhhcQN7uWiayP9gQ3Mc8xQlEJWiE8Jcg6myy0DT
        jiMXjtImXHTBQPGykBWoft5YxR46rmYZAhz+UzTUJw==
X-Google-Smtp-Source: AGHT+IEuWMji+FhSDPy8F+AsT4+lUhey0SmJPV6Oswthd7RlIIMoF1+2/PDJhmzGazPZy/T7YL2GtTm6CgPZ/rjpQ5s=
X-Received: by 2002:a25:b0a1:0:b0:d05:fa02:5bf5 with SMTP id
 f33-20020a25b0a1000000b00d05fa025bf5mr4284152ybj.48.1693462155113; Wed, 30
 Aug 2023 23:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693459976.git.quic_varada@quicinc.com> <7c14a3e29ee274f334444f809fa820e725e255dd.1693459976.git.quic_varada@quicinc.com>
In-Reply-To: <7c14a3e29ee274f334444f809fa820e725e255dd.1693459976.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 09:09:04 +0300
Message-ID: <CAA8EJpoRJLGE7g-Ur4e-gx6kD7jX-GpO3u=tZbGx0FP6ViqYEQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] arm64: dts: qcom: ipq5332: Enable USB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
        geert+renesas@glider.be, nfraprado@collabora.com, rafal@milecki.pl,
        peng.fan@nxp.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Aug 2023 at 08:39, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Enable USB2 in host mode.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v11:
>         Sort nodes in alphanumeric order
> v10:
>         regulator_s0500 -> regulator-s0500
>         "make W=1 ARCH=arm64 -j 16 CHECK_DTBS=y DT_SCHEMA_FILES=qcom,ipq5332-usb-hsphy.yaml dtbs_check" passed
> v9:
>         regulator_fixed_5p0: s0500 -> regulator_fixed_5p0: regulator_s0500
>         "make ARCH=arm64 -j 16 CHECK_DTBS=y DT_SCHEMA_FILES=qcom,ipq5332-usb-hsphy.yaml dtbs_check" passed
> v6:
>         Add vdd-supply and corresponding regulator
> v1:
>         Enable usb-phy node
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--
With best wishes
Dmitry
