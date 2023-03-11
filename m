Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39446B5B2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 12:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjCKLaE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Mar 2023 06:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbjCKL3Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Mar 2023 06:29:24 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14EC145B2D
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 03:25:33 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id g27so3886358ybe.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 03:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oupM3FbXF/iCg1aEcxZp6wJrRDfY9yPwtUGKDurVIrI=;
        b=DFfTlk2KS10J/XXwp9GFgjJsXpXSw5gbX63TFUOCuTePC/Bs0ac2jkUEK9z1Bszljy
         kGhx9z9xyOHXY4UynWoU5yZsuMvD8sCUs98gv6k09eiLpm/3ggXywL2nZgxe5L7xOFgT
         WoOE2POC/pnkFz1+3nTH+TVWGLY2uTjS92gC2442hQqinLFCCzU8Ak1u3tLVm2G9RdYc
         jJ7ptdkygUFumVCEO1ApI/kB7SiEz9vQvs8BtR1mSJccIL78FZfOb4fCQg3mAO+ilR4c
         tvJCfM7ihrE/QStxXurk+dXcuwNGIbCKhvp5y3a35fgTUgkBU/RROUQt3EjATngmnl+Q
         IeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oupM3FbXF/iCg1aEcxZp6wJrRDfY9yPwtUGKDurVIrI=;
        b=seSEBTWzr2iEwlCYlL4l2o4Tp7ygDkk31Pq6C5UN3ix2uBM3EDtNdMaVpEvbA619jQ
         acKl9VrMX1Qe1HmQ1nO9+mPa/maAfwOowV+t+NXT56toF4S9umxJg3jfbgjR+cqU+Hxz
         6s2ik3+F6E0CroykmbahWHtx2QL9XJoFk9IsI2ia6kzbrc1brM3FxhS3FFLXK/Gq/ORl
         HVr6H3He/Cne8HOQs1Jihiuwr4GKfFa50a5Rv2SOryrgP3lsNZxm/TEWF9dI4hBwIrge
         DqEKl7iW2mWYnAV9HXXfivoO60Sw3WNcS5/oUFuTbunchbbeNFJrDIzy4WGDqzhMTaJb
         7fWw==
X-Gm-Message-State: AO0yUKXkAhDoThrvKEDQF7gUjxifY8nyr9rlnRy4eKSPjxS+Iz+SUKy8
        Gx2d18HwqRpn0KHe/kvLlqu+yxkxjQ28RCENYDhMWmYvcL817XUp
X-Google-Smtp-Source: AK7set/MKTulbmCEGNNfv33vK7lCCxyVFsLbUvSdOBQ0SicSU2eFyVo33DkzquF9d8mZ+glo25w2sz0hsLy3XFYEpOk=
X-Received: by 2002:a25:b98c:0:b0:b27:70e1:4649 with SMTP id
 r12-20020a25b98c000000b00b2770e14649mr3347150ybg.6.1678533902297; Sat, 11 Mar
 2023 03:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20230311-topic-msg_ram-v1-0-e9c2094daf09@linaro.org>
In-Reply-To: <20230311-topic-msg_ram-v1-0-e9c2094daf09@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 11 Mar 2023 13:24:51 +0200
Message-ID: <CAA8EJpqm6F6pvBR81xA=ZFyTPXpz+e+Ja+X4qF4ZD-3W5T2jJA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/15] Convert Qualcomm RPM message RAM to a simple-mfd
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 11 Mar 2023 at 03:21, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> The Qualcomm RPM message RAM is a part of the RPM low-power processor's
> actual RAM that's exposed to the Application Processors as a MMIO-mapped
> region. It contains a couple of things, most notably the RPM master stats,
> detailing per-master (read: per-subsystem) sleep/wake statistics and an
> interrupt controller that's crucial to achieving full SoC clock and/or
> power collapse states (the MPM). This series tries to prepare the MSG
> RAM node to be a host for such devices.
>
> Depends on https://lore.kernel.org/linux-arm-msm/20230308011705.291337-1-konrad.dybcio@linaro.org/
>
> to solve a warning in the example.
>
> The DTS commits don't add -cells or -ranges, as without children they're
> not of very much use. They'll be introduced along with subnodes.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (15):
>       dt-bindings: mfd: Split out Qcom RPM MSG RAM
>       arm64: dts: qcom: msm8916: Add simple-mfd to rpm_msg_ram
>       arm64: dts: qcom: msm8953: Add simple-mfd to rpm_msg_ram
>       arm64: dts: qcom: msm8976: Add simple-mfd to rpm_msg_ram
>       arm64: dts: qcom: msm8994: Add simple-mfd to rpm_msg_ram
>       arm64: dts: qcom: msm8996: Add simple-mfd to rpm_msg_ram
>       arm64: dts: qcom: msm8998: Add simple-mfd to rpm_msg_ram
>       arm64: dts: qcom: qcs404: Add simple-mfd to rpm_msg_ram
>       arm64: dts: qcom: sdm630: Add simple-mfd to rpm_msg_ram
>       arm64: dts: qcom: sm6115: Add simple-mfd to rpm_msg_ram
>       arm64: dts: qcom: sm6125: Add simple-mfd to rpm_msg_ram
>       arm64: dts: qcom: sm6375: Add simple-mfd to rpm_msg_ram
>       ARM: dts: qcom-apq8084: Add simple-mfd to rpm_msg_ram
>       ARM: dts: qcom-msm8226: Add simple-mfd to rpm_msg_ram
>       ARM: dts: qcom-msm8974: Add simple-mfd to rpm_msg_ram

These commits do not demonstrate the need for simple-mfd (other than
qcom,mpm being mentioned in bindings). I'd suggest limiting the RFC to
a single platform populated with rpm_msg_ram child devices. This way
we can better understand the needs and the requirements for these
patches.


-- 
With best wishes
Dmitry
