Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B1433C66B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 20:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbhCOTIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 15:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbhCOTIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 15:08:06 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7544C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 12:08:05 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id p2-20020a4aa8420000b02901bc7a7148c4so312626oom.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ngZJachN56urU9J2HoprS9NstFT2AikTUj407DJYrCY=;
        b=npAFfzz9TJLpBYK5CrDhSAxue1/IJAjgTUEjuVkizNr7mm/lWYXrZOFHsbl6LoD1XM
         S4Tjetf929rB+fVIwdJ6IX6h9RzRzdRY4yqzilc2sG1ToIMMuKDV/pp2BFw/no9V75q9
         igVz5RNNPFLg0gw9x3NKF+T39gwWi/MfXo+kfmm0IYhUqLB25Ufpz/Eqb6luJADRCIY8
         ESG9Iq2yEHaoCdpNB3b76DwuGMG/qBtIExTNlBM5hHrMzv1itm36QZuLMFg0d0iJOxEm
         USu4D7peVnf6LU4yk0PzO9FkkrUs1KaNlLqsYUBv31dgqQFzdZN/YdB5ifRt6gr2JMPN
         uWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ngZJachN56urU9J2HoprS9NstFT2AikTUj407DJYrCY=;
        b=QthFVIxj43FyKAjW7lGCSl1PIGBa6LjR3Xz4onXsd0KrgQdj5v1LPUWu/hshJHTnp+
         pr2A9MwryA1R34sY3mdNTFkZmUFG+pPNopeLR04BeqBBRC34IMEMZkdVNpsUIzEaBw08
         Y7hjdw3uKusZOBMrKDsNCLxU9rPPEbBVXJm6DalAYr0l+X3UaDqNIWqQIdDUsEZMcAU2
         P7h3CGOiB3T1j+f4COHCZ9w5T72Eq7xqxFhUpSNOK6v7zpMNX52PmsGZZXWs0h10QgsE
         Iiuo7tvnRvZEnNRNe46TEqA2hXPh768MFUl0L1Wrl9BDOsjV+l0O/uO2UhU93wtgcf1A
         8+aw==
X-Gm-Message-State: AOAM532c9qGnmvCrx9vezAoe/SyAeqbJZxc+ODLEd77gKfXd58NUji+0
        LbH6GZM1jV//NoFFGvvTXKeHDIYsg7A6DjVniviUmQ==
X-Google-Smtp-Source: ABdhPJy/f+pt0WWw9QpskOGeSossTUBuih5lw/4CXpn5yxCz2AQTKeYgPQPhMRjL+SgaSTvh8jLqPbWMEzchh/2E6uQ=
X-Received: by 2002:a05:6820:129:: with SMTP id i9mr400221ood.80.1615835285169;
 Mon, 15 Mar 2021 12:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210310163024.393578-1-caleb@connolly.tech> <20210310163024.393578-3-caleb@connolly.tech>
In-Reply-To: <20210310163024.393578-3-caleb@connolly.tech>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 16 Mar 2021 00:37:54 +0530
Message-ID: <CAH=2Ntyd6Ud=2dt_Pa0gNQcCOLaVRp6ZF3yA5O+ZxqV1m64Spw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8150: add iommus to qups
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Caleb,

Thanks for the patch. Some nitpicks inline:

On Wed, 10 Mar 2021 at 22:02, Caleb Connolly <caleb@connolly.tech> wrote:
>
> Hook up the SMMU for doing DMA over i2c. Some peripherals like
> touchscreens easily exceed 32-bytes per transfer, causing errors and
> lockups without this.
>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
> Fixes i2c on the OnePlus 7, without this touching the screen with more
> than 4 fingers causes the device to lock up and reboot.
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 03e05d98daf2..543417d74216 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -583,6 +583,7 @@ qupv3_id_0: geniqup@8c0000 {
>                         clock-names = "m-ahb", "s-ahb";
>                         clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>                                  <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +                       iommus = <&apps_smmu 0xc3 0x0>;

I think we also need to add the new iommu property to the binding documentation?
<https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/soc/qcom/qcom%2Cgeni-se.yaml>

Thanks,
Bhupesh

>                         #address-cells = <2>;
>                         #size-cells = <2>;
>                         ranges;
> @@ -595,6 +596,7 @@ qupv3_id_1: geniqup@ac0000 {
>                         clock-names = "m-ahb", "s-ahb";
>                         clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
>                                  <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +                       iommus = <&apps_smmu 0x603 0x0>;
>                         #address-cells = <2>;
>                         #size-cells = <2>;
>                         ranges;
> @@ -617,6 +619,7 @@ qupv3_id_2: geniqup@cc0000 {
>                         clock-names = "m-ahb", "s-ahb";
>                         clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
>                                  <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
> +                       iommus = <&apps_smmu 0x7a3 0x0>;
>                         #address-cells = <2>;
>                         #size-cells = <2>;
>                         ranges;
> --
> 2.29.2
>
>
