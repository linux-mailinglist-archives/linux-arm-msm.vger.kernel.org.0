Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D69B478E071
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 22:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235151AbjH3USl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 16:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238455AbjH3USj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 16:18:39 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6774E4E
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 13:18:09 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d78328bc2abso5572405276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 13:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693426317; x=1694031117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zgGcuZzmr94KnU1bouNuOO19+UEQyecBFbXFTDXATYI=;
        b=rRLySP68/6Bpymtix+irGvSI82og16K8dTJJ3ZKWJy9QUjAVtNVSzXZneyBS5fe/OM
         54YOf43rCZicY3EO4h0qe9mXpgjJIyaWaey4q06LqNehI2bpHaP6+RTTC4enTgTfw50Z
         gWmnayucaWmFIgHZEpWmU9xzxvmDiABlKsQiaQ8oeb+/yJOCTVUEwAAyUNekJ1c2UAJM
         7yrxVIGMQqMz8RyrmyTwmBGHpvcwI3QLcU5XQA3FH8oDfJEqf0ScQe/EXZAK+ESfmve0
         1wKy+9wWb0Y9JNg7PZieI3hX0nzFo4oZvDxyUTbGs1TUqIFlUNP4EiIGfkJzr+i3GH2L
         Bukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693426317; x=1694031117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgGcuZzmr94KnU1bouNuOO19+UEQyecBFbXFTDXATYI=;
        b=IXmWtd1jL0cfbSYupu9W1NrMLvrbiND4NXeGWn0q9Q/NF0CjRtqJBzM1amgnt5bxrl
         7OJyEEGyTaoAUyKqcl1GsFpGyMIcDJMnr4Wf0/yeM145J1Y5x9EPsnUsz5Lgt+LMhZ7x
         kz5yf41FogYZKKoko4GjrjTviJ56MLOVDuXXCrnekAzusj0PJIAoHZStKdcxoPjtV9F5
         cXryk3/N97wbgUksqcx5PZ9GxT3KJn/q8gSfEm8siZtr4/NxtO7MNxbl//3Ue28K1SmA
         HIRX9OsaRRJGSwY74P5qmklgpibJV8hyOnHvqAUCz28Yy+PWOlS+ErKaqwF4rfLONxwz
         tQAQ==
X-Gm-Message-State: AOJu0YzEYw8GAAEz+S0VXb/O8ns6AKArh7+wx9yrxcLmaYzEq+emT0Sc
        dsfPWu3E0l99I6dAyyASOhwRMsy14iJy/CjOvhEBlg==
X-Google-Smtp-Source: AGHT+IHQgtmM/qEVU0UPeKqjFQmhQ59kgaPGxMwjXFavmatbWZ/rYVEWaDpXKACaogW7azdD4O9hjOLZ+ECSgh1rHzs=
X-Received: by 2002:a25:8481:0:b0:d7b:986e:9999 with SMTP id
 v1-20020a258481000000b00d7b986e9999mr3320097ybk.42.1693426316786; Wed, 30 Aug
 2023 13:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230825093531.7399-1-quic_nsekar@quicinc.com> <20230825093531.7399-6-quic_nsekar@quicinc.com>
In-Reply-To: <20230825093531.7399-6-quic_nsekar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Aug 2023 23:11:45 +0300
Message-ID: <CAA8EJppvNS_hy=L+zgk5HAB5iDEZE_j5LvEmQgAfcnwfy_7wNA@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq5018: Enable USB
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Amandeep Singh <quic_amansing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 25 Aug 2023 at 12:37, Nitheesh Sekar <quic_nsekar@quicinc.com> wrote:
>
> Enable USB2 in host mode.
>
> Co-developed-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index e636a1cb9b77..cdf5e22ec54e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -70,3 +70,15 @@
>  &xo_board_clk {
>         clock-frequency = <24000000>;
>  };
> +
> +&usbphy0 {
> +       status = "okay";
> +};
> +
> +&usb {
> +       status = "okay";
> +};
> +
> +&usb2_0_dwc {
> +       dr_mode = "host";
> +};

Let me sort these for you:

- usb
- usb2_0_dwc
- usbphy0

Like in a dictionary.

-- 
With best wishes
Dmitry
