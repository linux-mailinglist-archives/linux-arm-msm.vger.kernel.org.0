Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70EC86CD0F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 05:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjC2D7I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 23:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjC2D7H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 23:59:07 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353F730F5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 20:59:06 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so14836566pjt.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 20:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680062345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dul1KlrBtA46iTc3gyaCXFPUr7WrWHqPcvzFasASeEY=;
        b=aNcYNzD2Yv+TTWuv1e5vkYodJIsIihMIylShdg4J4xTW1CXqXRhMx1IQVZydyLL2jb
         g+LjctlkLrUEAZmPquc7SVJeYISB7PQI3DJ0eNGbexUptVX6D47lsVL3KrxsoZornnlQ
         aJ6ImRvoXhQIh6I6MDiatUfjatku1kTe63Jt+D9ksvloTno6vr0lPscxH/KfD0WxbNHq
         0ozbWx1hTXDvHfFwZPa+I0IPh4ZkgzzsEzsrfOqF/Pzo7nFfVHYA998tpThhMuSUChXC
         6opnMuDVAYqOfbVGZqegT1exobUSYYY/+qtyabpFSvdREeIDBSgXy5cPciqz6TEcTUL3
         YBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680062345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dul1KlrBtA46iTc3gyaCXFPUr7WrWHqPcvzFasASeEY=;
        b=Lo98Zr+zdaS2Fvp+b9sdJPzZMLkhva4p8JfyeRd3cMXmYoMeF/7DK7HZhEaErae3TN
         0xIaVp7WZi8z5qkhkeo1xytnxRIR5p2WfOIUGCx78uLimHl5sVqjSZJrKGFaFDF5l789
         t4i/pOGcLxlQYtFApC2QG/QeJEDyI2BKRR5yUreQ2rBtRfcVPgeUXzmOQUwL1xUaAgmX
         VsV4DXwxIAhXIsuBJaSqmu6RQ4CiEdQkkeSEoattJv6sOyCMSvoDysWPISqQAq3H9Oj4
         nSg3ZSH5zBT3FfCUq/NL3crKEKgpX0MM9O/OJIdfT6O3asDthWy/oajrcG2tfQ16ly+f
         yVyw==
X-Gm-Message-State: AO0yUKVvI2RKMMIHVHAcTMgn3f9hUUiGjLR5PgVo/ZWIAH62FA6GrwPy
        DV4+0QNoyZcSJZehWpBIwpE1AOU+MRzYbLTpZEI=
X-Google-Smtp-Source: AK7set/Lbxss6dIB0PWdWHkTbJl6aZ51bZjCdILJWU+FOnO4dX+3ErUoUd/XkpipicnvrQWi+J6Phg==
X-Received: by 2002:a05:6a20:891d:b0:d5:2a56:15b1 with SMTP id i29-20020a056a20891d00b000d52a5615b1mr15514520pzg.5.1680062345705;
        Tue, 28 Mar 2023 20:59:05 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o4-20020a655204000000b005133f658f1asm6509789pgp.94.2023.03.28.20.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 20:59:05 -0700 (PDT)
Date:   Wed, 29 Mar 2023 11:58:59 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] Resolve MPM register space situation
Message-ID: <20230329035859.GD3554086@dragon>
References: <20230328-topic-msgram_mpm-v1-0-1b788a5f5a33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328-topic-msgram_mpm-v1-0-1b788a5f5a33@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 28, 2023 at 12:02:51PM +0200, Konrad Dybcio wrote:
> The MPM (and some other things, irrelevant to this patchset) resides
> (as far as the ARM cores are concerned, anyway) in a MMIO-mapped region
> that's a portion of the RPM (low-power management core)'s RAM, known
> as the RPM Message RAM. Representing this relation in the Device Tree
> creates some challenges, as one would either have to treat a memory
> region as a bus, map nodes in a way such that their reg-s would be
> overlapping, or supply the nodes with a slice of that region.
> 
> This series implements the third option, by adding a qcom,rpm-msg-ram
> property, which has been used for some drivers poking into this region
> before. Bindings ABI compatibility is preserved through keeping the
> "normal" (a.k.a read the reg property and map that region) way of
> passing the register space.
> 
> Example representation with this patchset:
> 
> / {
> 	[...]
> 
> 	mpm: interrupt-controller {
> 		compatible = "qcom,mpm";
> 		qcom,rpm-msg-ram = <&apss_mpm>;
> 		[...]
> 	};
> 
> 	[...]
> 
> 	soc: soc@0 {
> 		[...]
> 
> 		rpm_msg_ram: sram@45f0000 {
> 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
> 			reg = <0 0x045f0000 0 0x7000>;
> 			#address-cells = <1>;
> 			#size-cells = <1>;
> 			ranges = <0 0x0 0x045f0000 0x7000>;
> 
> 			apss_mpm: sram@1b8 {
> 				reg = <0x1b8 0x48>;

Per "vMPM register map" in the driver, the slice size should be 0x44
instead of 0x48.  Is there one register missing from the driver
comment?

PS. It seems the "n" formula in the driver comment should be corrected
as below.

  n = DIV_ROUND_UP(pin_cnt, 32) - 1

Shawn

> 			};
> 		};
> 	};
> };
