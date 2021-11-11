Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2824A44D43B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 10:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhKKJpm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 04:45:42 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:39211 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhKKJpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 04:45:42 -0500
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl [213.125.76.110])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 23B4F1F96A;
        Thu, 11 Nov 2021 10:42:51 +0100 (CET)
Date:   Thu, 11 Nov 2021 10:42:49 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH v3 0/8] Improve support for Xiaomi Redmi Note 7
Message-ID: <20211111094249.mnnmjy3vkavmnqzb@SoMainline.org>
References: <20211111031635.3839947-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111031635.3839947-1-danct12@riseup.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dang,

On 2021-11-11 10:16:27, Dang Huynh wrote:
> This series expand the Redmi Note 7 device port to support:
>  + Regulators
>  + Volume keys
>  + eMMC and SD card slot
>  + Framebuffer display
>  + USB
> 
> Changes in v2:
>  - Dropped linux,input-type from volume up as 1 is set by default.
>  - Dropped gpio-key,wakeup as it's a legacy property name and is
> not relevant for a volume button.
>  - Rename label cont_splash_mem to framebuffer_mem and change node
> name to memory.
> 
> Changes in v3:
>  - Add voltage range for vph_pwr
>  - Move RESIN to PM660 and make PON keys disabled by default 
>  - Addressed review comments from Konrad

A bit of a formality: keep in mind that you cannot add Reviewed-by: to
patches unless explicitly given by the reviewer.  They do not represent
that a person has at some point given you a review on the patch; rather
they indicate that the reviewer in question has checked and agreed with
the changes.

In other words, after Konrad has reviewed your patches you should resend
a fixed version without his Reviewed-by:.  He'll reply with this line
once he has seen and acknowledged the resulting changes (or otherwise
reply with more requests for changes).  The maintainer picks these up
when applying the patchset to the tree, but you should pick them up
yourself if/when resending a new version.

Finally, this is a bit tricky but you should technically drop every
Reviewed-by: whenever a patch is changed in a followup patchset, leaving
it up to the reviewers to acknowledge that they are also okay with the
updated patch.

- Marijn

>  - Make Alexey Min the author of the USB patch as he came up with
> the patch first on downstream. 
> 
> Alexey Min (1):
>   arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB
> 
> Dang Huynh (7):
>   arm64: dts: qcom: sdm630: Assign numbers to eMMC and SD
>   arm64: dts: qcom: sdm630-pm660: Move RESIN to pm660 dtsi
>   arm64: dts: qcom: sdm660-xiaomi-lavender: Add RPM and fixed regulators
>   arm64: dts: qcom: sdm660-xiaomi-lavender: Add PWRKEY and RESIN
>   arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
>   arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD
>   arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer
> 
>  arch/arm64/boot/dts/qcom/pm660.dtsi           |  12 +-
>  .../dts/qcom/sdm630-sony-xperia-nile.dtsi     |  16 +-
>  arch/arm64/boot/dts/qcom/sdm630.dtsi          |   5 +
>  .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 383 ++++++++++++++++++
>  4 files changed, 407 insertions(+), 9 deletions(-)
> 
> -- 
> 2.33.1
> 
