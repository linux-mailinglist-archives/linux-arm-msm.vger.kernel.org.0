Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 362BE7BF488
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 09:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442480AbjJJHkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 03:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442446AbjJJHkS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 03:40:18 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508319E;
        Tue, 10 Oct 2023 00:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923612; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gVDk+aWG6qnMaumFSaYN7b1nwYxWO2R2bnpWs9UpIuVSckLXCYn7emI+ghAfEve20k
    rlcKa+y0BV9YKi67Xuc6GO7Smvknvsyi4SUlFbrhlm1RDHZLGgaPHgH+F8lpe9u6357j
    IhTaOEFwXxq0l6TpC4y+C3D7lvec15Uyww3m0O5cchfZnMQMWrKJL9qJhQxBreR7dBey
    hiLf2Y7o+h4vzpQu0RVqrukrBwbxk06wgZxvVPaO0qfi8+RTtQIHMwGek5l61wYWCxe5
    ZvzzoIyWc3Z5vQw76zmsZ6Ho5j6qaBUpYv9QonIWeimvs7mk7YuBX4R0VmQttEQj7+sN
    rKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1696923612;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=oi/1FknZWFumH83tC4ijMkPoCg8b/gNjWNmYmqhSwHI=;
    b=i6keKrNOI4CaOEb81MssISOGMMhh4sON8OrwDEtZiE+L+5Eb0PuWhaG7MkPRN3X/PD
    OnPQsHl2osye/VLXDBJwenC8ULCyqcY9uRavz0hX+02WTcCLwjyTlfA12zVSARghC0L2
    7Bd8SaOIISOiLQEWjoTsMkpjNXSn64VwcSfymdgfsHvQZQXSjsiB3tNzxi0dIxKM16FN
    IxbPJWyZAA06lhP+kjkbG79mtBA9u7ruzT1DIAOaOHYAXgG2JULU3E1ZSA1UjpuAq7se
    AAv91sIhfTPqW3/62GHJ0US0OMWHobTn+eniPF+3W/2r5rMgU0992YKzBZ1Mdx7PnN+y
    vV1A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1696923612;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=oi/1FknZWFumH83tC4ijMkPoCg8b/gNjWNmYmqhSwHI=;
    b=kuvArtDdcEwb1NrKaJ18cAY61cWBHSY+4Yz/4HqOUvHuC7k1s8C9aR8AQdpkfhNLMJ
    ecvSYfk0hpkmEepQeGHLYXLLa/FNhYCHUh4EWcQB83ZKUkGfkgEj/6PTh0h3s732ruSa
    SvghfOAb0R5UBMM6Iae7v+2r25+h4+7j1aJ4zMBp7d8oKeONLLoeKFQ7KWWyHa36onAW
    8R3MqDq6hM97f53BB4z8c0yXR95PwKFLnaA53upDSwetYKdMN6e6UnNQ85sXzGapKnCa
    NNmdGwuONGAK9bznod730E4nqz0Omp/gkkGA+JrJEcWzTI+l0Z/jeZ5s6/ziMpq+AjR4
    uYpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1696923612;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=oi/1FknZWFumH83tC4ijMkPoCg8b/gNjWNmYmqhSwHI=;
    b=sz6OijzqNZ+4rV2huF+hEK5rjEOSiEXuQTKhRgZ/zJy/PbKgO2/u4U0xjKrrK2d3J7
    XnphI8VxvSMpUwoIWcDA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8Z2L1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id R04c57z9A7eCSLO
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 10 Oct 2023 09:40:12 +0200 (CEST)
Date:   Tue, 10 Oct 2023 09:40:05 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pad generated DTB files
Message-ID: <ZST_1ROGwLe4dZIm@gerhold.net>
References: <20231009172717.2695854-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009172717.2695854-1-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 09, 2023 at 08:27:17PM +0300, Dmitry Baryshkov wrote:
> On Qualcomm platforms the bootloader populates device tree with some
> extra nodes / properties (like memory size, boot time, etc). Usually
> default padding is enough for the bootloader. But in some cases the
> board will fail to boot if there is not enough padding space.
> 
> Add `--pad 4096' to DTC_FLAGS so that all Qualcomm DTB files get this
> extra padding space.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> This is primarily necessary for SA8155P, but I have the feeling that it
> might be better to be enabled on the global scale.

By default there should not be any padding at all. This is because the
bootloader is responsible to make room for new nodes by calling
fdt_open_into() with an adjusted size. This will result in a simple
memmove() that shifts the end of the DTB in memory so that the padding
can be used for new nodes and properties.

If the bootloader doesn't add enough padding then it is broken and
should be fixed.

Both LK [1] and ABL [2] do or have done this correctly at some point.
If more space is needed for some weird new modifications the padding
size there should be adjusted.

[1]: https://git.codelinaro.org/clo/la/kernel/lk/-/blob/lk.lnx.1.0.r54-rel/platform/msm_shared/dev_tree.c#L2051-2057
[2]: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/blob/uefi.lnx.4.0.r40-rel/QcomModulePkg/Library/BootLib/UpdateDeviceTree.c#L1402-1414

By adding --pad 4096 globally we would waste pointless empty space for
every single DTB, which ends up on all systems that use generic kernels
with Qualcomm support included. With the ~230 DTBs we have at the moment
this would already waste ~1 MiB (~16 MiB -> ~17 MiB total).

So please:

 - If you can, update the bootloader and fix the padding size there.

 - If this is not possible: Add the padding only for the boards with
   broken bootloaders with a clear comment that this should be the last
   resort for devices that are locked down.

 - Or maybe boot a less broken bootloader inbetween (like U-Boot). :)

Thanks,
Stephan

> 
> ---
>  arch/arm64/boot/dts/qcom/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index d6cb840b7050..8e9fa2539265 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -1,4 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
> +
> +# pad DT allowing bootloader to populate several extra nodes
> +DTC_FLAGS += --pad 4096
> +
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
>  
>  apq8016-sbc-usb-host-dtbs	:= apq8016-sbc.dtb apq8016-sbc-usb-host.dtbo
> -- 
> 2.39.2
> 
