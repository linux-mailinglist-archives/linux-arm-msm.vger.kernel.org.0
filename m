Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FF841E8DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 10:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352331AbhJAISV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 04:18:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231327AbhJAISM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 04:18:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41CB7615A4;
        Fri,  1 Oct 2021 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633076188;
        bh=0WyIYGVy95a4Hf9zq1uMRFezhbR9FuA0Atxqav/Yddg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=em7oJ774XXNZKeM4ZYSHcAyi1rpWJYjh+u+tMJuJVEt4KCscEPHlmRdxHekUAREhp
         puOEEzRorZMgmde5IAD0bGX+0fsBAPi06Iwf/7BUqG6nzpjylVSG0w88xSL/1OppOV
         VB/ZzdVUvSKbRCVBVyTHldYLWU8v1l/zOac4TuaeZIyjrPUjk4mCWpuHm7vhnaoC0c
         8VREGvd47L3+++U6uCnGsgDHUkTzfCTL6qWMl7qj5ljJ1/AngHygzC8buRQ//xu5IS
         sOEpdg0SJut6zRd2Dkf64sVDcDxxf2ZQru5eDbL9SkPl+YWh98v/xeikrX5bCNCYZl
         NoEnl/QBUX78w==
Date:   Fri, 1 Oct 2021 13:46:23 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add missing vdd-supply for QUSB2 PHY
Message-ID: <YVbD12kTfbGmRYId@matsya>
References: <20210928022002.26286-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928022002.26286-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 28-09-21, 10:19, Shawn Guo wrote:
> The series adds missing vdd-supply for QUSB2 PHY which is required for
> digital circuit.  The driver works right now likely because firmware
> already sets it up.  Add it to bindings, driver and DTS that miss the
> supply.
> 
> It should not cause problem for existing DTBs:
> - SC7180, SDM630, SDM845 based platforms already specified vdd-supply
>   in the DTBs.
> - MSM8996 and MSM8998 platform DTBs miss vdd-supply, but dummy regulator
>   will ensure QUSB2 PHY driver works as before on these platforms.

What about the rest.. I checked SM8350 and SM8250 mtp ones are missing
this. With the property made mandatory, I guess it would cause these to
fail right..

> 
> Changes for v2:
> - Correct copy & paste error on vdd-supply name in bindings doc.
> 
> 
> Shawn Guo (3):
>   dt-bindings: phy: qcom,qusb2: Add missing vdd-supply
>   phy: qcom-qusb2: Add missing vdd supply
>   arm64: dts: qcom: Add missing vdd-supply for QUSB2 PHY
> 
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 6 ++++++
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi              | 2 ++
>  arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    | 1 +
>  arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi           | 1 +
>  arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi      | 1 +
>  drivers/phy/qualcomm/phy-qcom-qusb2.c                     | 2 +-
>  6 files changed, 12 insertions(+), 1 deletion(-)
> 
> -- 
> 2.17.1

-- 
~Vinod
