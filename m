Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7F716B8EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 06:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgBYFQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 00:16:51 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:33839 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgBYFQv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 00:16:51 -0500
Received: by mail-pj1-f67.google.com with SMTP id f2so640159pjq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2020 21:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ka0sLhQPFaXTwv3tDELStRrEtg68nriJ9HVXgH82wMY=;
        b=MfzMx3OoAyEtSqpOZ0WtdfDaIjNPNeuyzCbpqjIHCgRZgMdnb82+zNuqvO6REVU3Iz
         o+3zenb5smKGh3pixYR+Th7xOVONXMP31NIJZl757/wtxGpCjkDfZ4NUgK1hIosRnjwv
         MHyju43+Ea0LICvpxU2VsKsh0K5P+E5xBE/ehqeDUd06hWz3g+VuMRdGemx5p9pnMFhD
         /1599Z4dFSIqEqyA5RkpiSdFKbiDLUMeavkbuhE6aWYllSUgVgsqCHV5ML0pToE/OKAI
         UNtCr8UEjxEPce8u3sf5Lk0XrmZy6+7fHf4CLiFctxKfHk+/zeXH/1VF6oRpWHxlgtzc
         oU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ka0sLhQPFaXTwv3tDELStRrEtg68nriJ9HVXgH82wMY=;
        b=CDGigvPFC10DkkfF5yVs6ZyaInjuIBBq9PBXUr6/W7x8KgW4013aQH7Icw0xBM85Pa
         VMy7ZlP/6u8/H6P7vhK6dim2OXR3aAqzK9rICWOlfm2vbsYMmR2EFDcPhC54Y3bMl3kn
         YSoukfSUcMAQa8loiuiJmSDADJUVR4ZHQCvf8wuHuDN0QoHjfY94NdemSK0wzrOtfiSI
         rBl4GN7kzjOcNLW9C2h0BvX13T89Ft/tOt+GLgHLmePbZqNpVqtWJBInuJ0yOhHqQkrI
         VvFOa+9lWVykNEjfOnWp/9v9enOovoQKzDwP+lJBRJg2iy3VXNV+94X6ESSoBcvLHbUT
         iefg==
X-Gm-Message-State: APjAAAVnuM9aw1/ZCFlHdIU/ZSXqxFwi/dV6RoetjrNV9PUp3MI0+o9V
        U5xb+labun21g7BYPtjaLeYFeA==
X-Google-Smtp-Source: APXvYqwE3DS3Lo/dEPP82F1RYKX99PIFmYhZi/GdGxhG2n/gVblaUuZg64+xGY3KaryvIrqLQbTarw==
X-Received: by 2002:a17:902:7048:: with SMTP id h8mr54903891plt.64.1582607808882;
        Mon, 24 Feb 2020 21:16:48 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c184sm15092223pfa.39.2020.02.24.21.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 21:16:47 -0800 (PST)
Date:   Mon, 24 Feb 2020 21:16:45 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     georgi.djakov@linaro.org
Cc:     Sibi Sankar <sibis@codeaurora.org>, robh+dt@kernel.org,
        evgreen@chromium.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        daidavid1@codeaurora.org, saravanak@google.com, mka@chromium.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 0/6]     Split SDM845 interconnect nodes and
 consolidate RPMh support
Message-ID: <20200225051645.GX3948@builder>
References: <20200209183411.17195-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200209183411.17195-1-sibis@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 09 Feb 10:34 PST 2020, Sibi Sankar wrote:

Hi Georgi,

Will you pick up the bindings and driver patches for v5.7? So that I can
apply the dts patches.

Regards,
Bjorn

> While there are no current consumers of the SDM845 interconnect device in
> devicetree, take this opportunity to redefine the interconnect device nodes
> as the previous definitions of using a single child node under the apps_rsc
> device did not accurately capture the description of the hardware.
> The Network-On-Chip (NoC) interconnect devices should be represented in a
> manner akin to QCS404 platforms[1] where there is a separation of NoC devices
> and its RPM/RPMh counterparts.
> 
> The bcm-voter devices are representing the RPMh devices that the interconnect
> providers need to communicate with and there can be more than one instance of
> the Bus Clock Manager (BCM) which can live under different instances of Resource
> State Coordinators (RSC). There are display use cases where consumers may need
> to target a different bcm-voter (Some display specific RSC) than the default,
> and there needs to be a way to represent this connection in devicetree.
> 
> This patches series extends the discussions[2][3] involving the SDM845
> interconnect bindings by adding accompanying driver implementations
> using the split NoC devices. Some of the code used to support the SDM845
> provider driver are refactored into common modules that can used by other
> RPMh based interconnect providers such as SC7180[4]. This patch series also
> updates existing sdm845 binding documentation to DT schema format using
> json-schema.
> 
> v3:
> - Picked up Robs R-b for patch 1 
> - Fixup qcom,bcm-voter.yaml. comments (Rob)
> - Use qcom,bcm-voter instead of SoC specific compatible for
>   SDM845 and SC7180 (Odelu/Sibi)
> - Fixup bindings check failures for qcom,sdm845.yaml
> - Fixup the misc bugs. comments (Evan/Sibi)
> - Fixup reg size for aggre1/2_noc
> 
> v2: 
> - Reorganized dt-binding patches
> - Fixed a bug that adds duplicate BCM node to voter (Georgi)
> - Addressed misc. comments (Georgi)
> 
> v1: https://lkml.org/lkml/2019/12/16/15
> 
> [1]: https://lkml.org/lkml/2019/6/13/143
> [2]: https://lkml.org/lkml/2019/7/19/1063
> [3]: https://lkml.org/lkml/2019/10/16/1793
> [4]: https://lkml.org/lkml/2019/11/26/389
> 
> David Dai (6):
>   dt-bindings: interconnect: Convert qcom,sdm845 to DT schema
>   dt-bindings: interconnect: Add YAML schemas for QCOM bcm-voter
>   dt-bindings: interconnect: Update Qualcomm SDM845 DT bindings
>   interconnect: qcom: Consolidate interconnect RPMh support
>   interconnect: qcom: sdm845: Split qnodes into their respective NoCs
>   arm64: dts: sdm845: Redefine interconnect provider DT nodes
> 
>  .../bindings/interconnect/qcom,bcm-voter.yaml |   45 +
>  .../bindings/interconnect/qcom,sdm845.txt     |   24 -
>  .../bindings/interconnect/qcom,sdm845.yaml    |   74 +
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |   65 +-
>  drivers/interconnect/qcom/Kconfig             |   13 +-
>  drivers/interconnect/qcom/Makefile            |    4 +
>  drivers/interconnect/qcom/bcm-voter.c         |  366 +++++
>  drivers/interconnect/qcom/bcm-voter.h         |   27 +
>  drivers/interconnect/qcom/icc-rpmh.c          |  147 ++
>  drivers/interconnect/qcom/icc-rpmh.h          |  149 +++
>  drivers/interconnect/qcom/sdm845.c            | 1185 +++++++----------
>  .../dt-bindings/interconnect/qcom,sdm845.h    |  263 ++--
>  12 files changed, 1516 insertions(+), 846 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml
>  create mode 100644 drivers/interconnect/qcom/bcm-voter.c
>  create mode 100644 drivers/interconnect/qcom/bcm-voter.h
>  create mode 100644 drivers/interconnect/qcom/icc-rpmh.c
>  create mode 100644 drivers/interconnect/qcom/icc-rpmh.h
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
