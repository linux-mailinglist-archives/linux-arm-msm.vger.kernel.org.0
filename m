Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA01F6EB637
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Apr 2023 02:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbjDVAJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 20:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbjDVAJO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 20:09:14 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7284926A2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 17:09:12 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-b8f72e5bd9bso3165359276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 17:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682122151; x=1684714151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MmdtSh1w/AUsFLevVQK84fJ32J2WUs/jp0y/0rXdHOc=;
        b=lbNqDq7FL+eHY0F/4x20VfGmaNxBVQkHRX1smlrAvAwO2PYd7PPVRyF6nDKQUWSynF
         aaT8ElQtpKBYzL8CilDIeZontx72c77/FYA2K4RWLELEKk+0VNVOI7C6ODyC5LuMQ8cW
         2gVlJltSlPoLhI73VglEjQ2UpeXnlEIwNEK404tdG0E3ROhZV9wlzt0Ufn4GKpNhX/OT
         FRPTTzPa8pYITQzBwEq1Ekbyg3ENyqcWAJDGptbpnYR3dWXMfHfHRjjZSHkl7IXp0ol+
         foU5BKQg95VeZ1DX/rZH9UsOG0qJPBN1gq+fIMhiehZ9S5qBBqK6RnjK8nI5PindSbCR
         emlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682122151; x=1684714151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmdtSh1w/AUsFLevVQK84fJ32J2WUs/jp0y/0rXdHOc=;
        b=PZkDnrAJaJEti+nYLzwPif96fm7/hFoBoIBi5M0cc8gk0ev534eyBGxaH/1zJzv1iT
         Zb8h7OuBtsf/YXmAHSNlp/B4FffE9nK7iPnLuR6M699zbR65TKM05jNhyPC1ZpMzM46+
         Vdyls8jy2XMrYJJ+v+Lp2dO34b2zOP+ad962kO1FVbNDSGd+oGssDZU6CXwnjDiEjQsT
         3pUmiM+1vJWuOwRrxMzVWbtOy3K+bYfMgpcESsVIfrjQgNQV7/sJ25ArDYU+uOb7//c3
         1gVaiv006FUlV8d1ukMB02HyCc1V4H3yKBd5ZFMNO/mKx5DwMlneZx94RTXGNlBp+b4f
         vuEQ==
X-Gm-Message-State: AAQBX9fKxeh9VXVSSeI0mgbzEqS8SGyBtw/pfj5eo5IB1uU+K2QCrwaY
        CQbjscPKj1sHkxBMip4mOy5bXzBEWHHPVZoLQEeRTg==
X-Google-Smtp-Source: AKy350b+L7wCHVqP/UYw/lYuSGq2eOHagsapMSK+wVxHlAmrKjAoUyAzY8gAYEeJb7AKvcAd6Hno1NVDdenS+k1+P0I=
X-Received: by 2002:a25:e0d5:0:b0:b98:41a9:8db9 with SMTP id
 x204-20020a25e0d5000000b00b9841a98db9mr4365078ybg.0.1682122151678; Fri, 21
 Apr 2023 17:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230421133922.8520-1-quic_shazhuss@quicinc.com> <20230421133922.8520-5-quic_shazhuss@quicinc.com>
In-Reply-To: <20230421133922.8520-5-quic_shazhuss@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 22 Apr 2023 03:09:00 +0300
Message-ID: <CAA8EJppLfk4DZ8Qc8qKH=--vXGQcVY_eZ8hQCb5s3CGR54v2Hg@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] phy: qcom-qmp: Add SA8775P USB3 UNI phy
To:     Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 21 Apr 2023 at 16:41, Shazad Hussain <quic_shazhuss@quicinc.com> wrote:
>
> The SA8775P platform has 5nm USB3 UNI phy attached to the USB0 and USB1
> controllers.
>
> Add QMP PHY config, pcs entries and support for the new compatible for
> SA8775P platform.
>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 45 +++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
