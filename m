Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63966CD0B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 05:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjC2Def (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 23:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjC2Dee (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 23:34:34 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC36212E
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 20:34:33 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so14830574pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 20:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680060872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lrPg+XcugayUBQdJZA8GlLCHOjk+HPNQA9l1wxAz9XU=;
        b=oJldNef8Y32GaZkojlBXY8Ne5qhhM7OYnEHZ9LMVhUylSArWs7nJWX7w70BHaLK0z0
         iqDe9BnG7NW0W0a2PZled8J/32shF0vpEWxosW9v/C77RKGFAzXDico8x5t5u3L13+1q
         e4sp1DY2wWO0WY7o3b+lYXwFY4696pCaCRA/3hnrNqS0ZI58jny4nbbFioC4TdbfBzb8
         3ihHvZb85BawvCWKxPVKEIRcrDEIZ1XtnqTD0XF/YFODfUkveZTI469LK4pf6woK22q9
         /TclUJh4nae9n3OOBCaSyo9j2nmokoHwr7lvJLGUTxWGXcrfg8vy1xmiDdS93XhnhxEK
         2Oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680060872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrPg+XcugayUBQdJZA8GlLCHOjk+HPNQA9l1wxAz9XU=;
        b=Tckyrq1c9VPkSzO256KCc1ELD0aRDUqoAsJC47oxiCLCHzw76dAk4caRvrOBG1O6bn
         sdLTLgGyLcwSAfc5rQ3jo6HNxuHG8l7KP8Fr5MEfb9nSd0DGUPAG5od5w7YyJf+RY86U
         ZiPmekVLLNIRxX6CaBWWqA0/5bu60H3E9GREWoSmAOICGBuT74i1q0U1yum7OHlMmd/k
         261iBR4Mklzx/r8OJ4L1EQkSdoUWTezncWAnHZgH77LsNm8Lrj0CFPKCA1UmNoJoXfeE
         uEr3Z/yrL9bpypNHSR25t6PO870CTI8BJU1+zow5486dudKZ9GiQeTplhHD6WTU2dOQq
         KCMg==
X-Gm-Message-State: AAQBX9dJuLyItLuIx5gb4EpMU11EN1t97P7JCs0SWP6i1HLcUWiquNk0
        kgd1dt9HY7oJY4ouEZyfz/1BRw==
X-Google-Smtp-Source: AKy350Zcf1qWpx9bh/5skLSyvbqEr3AICEnYsjvkYnCs70Cd4uZYr/L0UsgaxcWWxbkcCr4w30fI6A==
X-Received: by 2002:a17:90b:4b43:b0:23b:4bf6:bbed with SMTP id mi3-20020a17090b4b4300b0023b4bf6bbedmr19446957pjb.24.1680060872613;
        Tue, 28 Mar 2023 20:34:32 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id bc9-20020a170902930900b001a20b31a23fsm10109449plb.293.2023.03.28.20.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 20:34:31 -0700 (PDT)
Date:   Wed, 29 Mar 2023 11:34:24 +0800
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
Message-ID: <20230329033424.GA3554086@dragon>
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

I have to admit that I wasn't aware of it, this message RAM is also
accessed by cores like modem, ADSP etc.  I agree in principle this is
a good change!

Shawn

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
> 			};
> 		};
> 	};
> };
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (2):
>       dt-bindings: interrupt-controller: mpm: Allow passing reg through phandle
>       irqchip: irq-qcom-mpm: Support passing a slice of SRAM as reg space
> 
>  .../bindings/interrupt-controller/qcom,mpm.yaml    |  6 ++++-
>  drivers/irqchip/irq-qcom-mpm.c                     | 30 ++++++++++++++++++----
>  2 files changed, 30 insertions(+), 6 deletions(-)
> ---
> base-commit: a6faf7ea9fcb7267d06116d4188947f26e00e57e
> change-id: 20230328-topic-msgram_mpm-c688be3bc294
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@linaro.org>
> 
