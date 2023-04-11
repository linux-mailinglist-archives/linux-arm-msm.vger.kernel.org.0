Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF496DDEA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 16:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbjDKO7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 10:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjDKO65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 10:58:57 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1434EFD
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 07:58:56 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id g13so7363968vsk.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 07:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681225135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owr4GV9tlAJ2FBT7XqQdCJgyh43e4tTpXyXefTx/xxM=;
        b=jPagDdSUYG4JF2q73N7UUd0QSlvF4nDR2TN+0FvkfV+70ZzllVDcJvYovSKG26h0Co
         eaftT5bSsNoT7i0+9Jtr73zj7A48kdTVFhXb+3l+oLq8oaT3/Vk/RKn8+77QW9R3Pxe5
         XOV3FwxBzrcwKos3nYPMQhKUC0k+jdjXMat8Ip/guX1pwCyaigc97A9I/028CPS0KQ+9
         0LevcUaU+6GWMmO0QweApKerOG3qreov/nXT3gbidAk0vbxVbxmLcan+6bRmSCgi2LKQ
         Sghh62jEKM97IqWDjdnWzwnkZ1UUA0yEOLyLwJNFPy3bodMH/rPZlWVakGgcVNG1VFm2
         0FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681225135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owr4GV9tlAJ2FBT7XqQdCJgyh43e4tTpXyXefTx/xxM=;
        b=Ds2YI+UpAUYYHS4N1Mqu+iB6EsqzJPqXREDHH6lG/3nufgbmvXMRodqx0D7+Y7xZDq
         Hl4nRdY2r6J5/kxJPe+ODMOeEoVxFkl28wOfa5hw8KB6XfGbTt2XpKzhE7Gw/4EbDOVz
         6eLqYWiz6gNVIE9civs3IrPQvkjVDiBhIaQA+WcljROgNLZn9RUkKSR5wlQYlySfklYz
         KD8RjB33X3Zb2sqSsllPhkwCWudWRdHf9rIoXVy2o5JY8ztzF8fxqJsMDgK6l+YrwRao
         6AitC6070Zw7G+6L72+67QchO59ho+KG5xJryqNbNBRq2S3L9gtT8GW/X/G+ojm8U+Cm
         9bKw==
X-Gm-Message-State: AAQBX9ccOOaS83MYH2Uww5iNS7pnkIr9fqth98yBwwjd4Aqh8/Fa63Mc
        CJbQLKTWWRZsjBAyjVMKWjkPgSMDsH2zlzcq0Ubk/g==
X-Google-Smtp-Source: AKy350bokdYzxO8lxD8Xii69nUvcMBhVLi7GSXJQ0rAyuxeCsjNvgBtSUEXmOgKWDIQmjY6tamxKF27ShJtw4yF2LpQ=
X-Received: by 2002:a67:d719:0:b0:426:b051:1c4 with SMTP id
 p25-20020a67d719000000b00426b05101c4mr7978391vsj.0.1681225135577; Tue, 11 Apr
 2023 07:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230411-topic-hanaau-v2-0-fd3d70844b31@linaro.org>
In-Reply-To: <20230411-topic-hanaau-v2-0-fd3d70844b31@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 11 Apr 2023 16:58:44 +0200
Message-ID: <CAMRc=MfE=Dezbhx8dPcZGqoui--FrPgm9q2Zi1HoUUkof4A34w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Fix SA8155P RPMPDs
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 11, 2023 at 3:47=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> SA8155P has some kind of a faulty firmware that advertises power
> domains that are actually absent (and trying to access them results
> in a lockup and reboot).. This series tries to amend that.
>
> v1 -> v2:
> - Reuse 8150 indices for 8155
> - As a consequence of /\, only update domains that differ in the DT
>
> I did not pick up any tags, as things changed rather significantly.
>
> Compile-tested only.
>
> v1: https://lore.kernel.org/linux-arm-msm/20230214095435.2192153-1-konrad=
.dybcio@linaro.org/
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (3):
>       dt-bindings: power: qcom,rpmpd: Add SA8155P
>       soc: qcom: rpmhpd: Add SA8155P power domains
>       arm64: dts: qcom: Split out SA8155P and use correct RPMh power doma=
ins
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
>  arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |  2 +-
>  arch/arm64/boot/dts/qcom/sa8155p.dtsi              | 40 ++++++++++++++++=
++++++
>  drivers/soc/qcom/rpmhpd.c                          | 16 +++++++++
>  include/dt-bindings/power/qcom-rpmpd.h             |  9 +++++
>  5 files changed, 67 insertions(+), 1 deletion(-)
> ---
> base-commit: 009795d283d1f9f043e5a4ff97d4140cde17e2d3
> change-id: 20230411-topic-hanaau-459c6cbbf55c
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>

sa8155p-adp now works fine, thanks

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
