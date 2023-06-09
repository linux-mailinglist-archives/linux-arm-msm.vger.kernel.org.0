Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9A5F729CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 16:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241446AbjFIOaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 10:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241082AbjFIOaJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 10:30:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F748273A
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686320963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SeFjQ+AIqSoCw9oUu0kheJJ6w4RLgwEZPguDnMov+Ro=;
        b=WG8aUFrYrRswjtZTBFv0d5g43ELRF/Zt7rgwvwjRQvACy6zSH9KJP21KIrLVHPCiglDsFV
        G60divA2YXkXs7SLNnaz8GuZb4H1Gs/aRHsp1jfDqpPrr3kkzaXo6iq1vvk2DAkUg4CYV/
        TnxdImTKnxOskJnBjngHDMMwIErvM/Y=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-4Y9p7oyeOma4iWgdiYHWsw-1; Fri, 09 Jun 2023 10:29:20 -0400
X-MC-Unique: 4Y9p7oyeOma4iWgdiYHWsw-1
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-bb05f0e6ef9so2587072276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 07:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686320960; x=1688912960;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeFjQ+AIqSoCw9oUu0kheJJ6w4RLgwEZPguDnMov+Ro=;
        b=GQC3MKTr2GdX/r4kMRGWn+ZeYxobhKmIbZWEjMYDLjbIlpUTgLn6O2SqSAKWiY3neW
         lCC2b7D8+gaxExwk/aOmd5FVYt0NLZx/FYBhYRQELFl2E1m/uqRTaIMH3uOxxAF1d19B
         u+meabJ2eAU/RY8Fy+q0aJULwrosR7/u/+NNzC+B7fosr384WLudO+Cw14zxKrO/wCtK
         AvMwLmEx1yHHGbOHJC/hiL1nrEzYf36BHC9iBMf5i7sTar+ivXHj9lQELjKBeff6KZZI
         Q5WDg/xeKNp/CNcMBFXxjCrqM2LKAqN/+isUzhoxtqZ/YSfHuweybpL3ilKU2yzGIWXg
         FAgA==
X-Gm-Message-State: AC+VfDyQjqCQoWSGtBkXXGKkjud9EdJhDxaFks0QuyqGVBgbsLuR2mrj
        ELbhO5O8JL+MNLYAufPPyYTNTUN0Hr1j7iVWbN3nbWTfLNzfMF+Fb6TEXiKnvCq94tQVkgiLaF0
        b4PLzN/R8J47AnYNmDqZMVF9iqw==
X-Received: by 2002:a25:f50f:0:b0:ba8:66fb:dd84 with SMTP id a15-20020a25f50f000000b00ba866fbdd84mr1101345ybe.20.1686320960005;
        Fri, 09 Jun 2023 07:29:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4TEL5O7n3UfPsYTiUfzgwgsZext91z/RVtBWG4mbDyI3+V4ZyAbGaL21xcL2PV/gyhI4oc1Q==
X-Received: by 2002:a25:f50f:0:b0:ba8:66fb:dd84 with SMTP id a15-20020a25f50f000000b00ba866fbdd84mr1101326ybe.20.1686320959702;
        Fri, 09 Jun 2023 07:29:19 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id c5-20020a5b0145000000b00bb144da7d68sm905217ybp.13.2023.06.09.07.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:29:18 -0700 (PDT)
Date:   Fri, 9 Jun 2023 10:29:16 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        konrad.dybcio@linaro.org, andersson@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, richardcochran@gmail.com, echanude@redhat.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8540p-ride: Specify ethernet phy OUI
Message-ID: <ZIM3PPXi+ed3CJ2J@brian-x1>
References: <20230608201513.882950-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608201513.882950-1-ahalaney@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 08, 2023 at 03:15:13PM -0500, Andrew Halaney wrote:
> With wider usage on more boards, there have been reports of the
> following:
> 
>     [  315.016174] qcom-ethqos 20000.ethernet eth0: no phy at addr -1
>     [  315.016179] qcom-ethqos 20000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)
> 
> which has been fairly random and isolated to specific boards.
> Early reports were written off as a hardware issue, but it has been
> prevalent enough on boards that theory seems unlikely.
> 
> In bring up of a newer piece of hardware, similar was seen, but this
> time _consistently_. Moving the reset to the mdio bus level (which isn't
> exactly a lie, it is the only device on the bus so one could model it as
> such) fixed things on that platform. Analysis on sa8540p-ride shows that
> the phy's reset is not being handled during the OUI scan if the reset
> lives in the phy node:
> 
>     # gpio 752 is the reset, and is active low, first mdio reads are the OUI
>     modprobe-420     [006] .....   154.738544: mdio_access: stmmac-0 read  phy:0x08 reg:0x02 val:0x0141
>     modprobe-420     [007] .....   154.738665: mdio_access: stmmac-0 read  phy:0x08 reg:0x03 val:0x0dd4
>     modprobe-420     [004] .....   154.741357: gpio_value: 752 set 1
>     modprobe-420     [004] .....   154.741358: gpio_direction: 752 out (0)
>     modprobe-420     [004] .....   154.741360: gpio_value: 752 set 0
>     modprobe-420     [006] .....   154.762751: gpio_value: 752 set 1
>     modprobe-420     [007] .....   154.846857: gpio_value: 752 set 1
>     modprobe-420     [004] .....   154.937824: mdio_access: stmmac-0 write phy:0x08 reg:0x0d val:0x0003
>     modprobe-420     [004] .....   154.937932: mdio_access: stmmac-0 write phy:0x08 reg:0x0e val:0x0014
> 
> Moving it to the bus level, or specifying the OUI in the phy's
> compatible ensures the reset is handled before any mdio access
> Here is tracing with the OUI approach (which skips scanning the OUI):
> 
>     modprobe-549     [007] .....    63.860295: gpio_value: 752 set 1
>     modprobe-549     [007] .....    63.860297: gpio_direction: 752 out (0)
>     modprobe-549     [007] .....    63.860299: gpio_value: 752 set 0
>     modprobe-549     [004] .....    63.882599: gpio_value: 752 set 1
>     modprobe-549     [005] .....    63.962132: gpio_value: 752 set 1
>     modprobe-549     [006] .....    64.049379: mdio_access: stmmac-0 write phy:0x08 reg:0x0d val:0x0003
>     modprobe-549     [006] .....    64.049490: mdio_access: stmmac-0 write phy:0x08 reg:0x0e val:0x0014
> 
> The OUI approach is taken given the description matches the situation
> perfectly (taken from ethernet-phy.yaml):
> 
>     - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
>       description:
>         If the PHY reports an incorrect ID (or none at all) then the
>         compatible list may contain an entry with the correct PHY ID
>         in the above form.
>         The first group of digits is the 16 bit Phy Identifier 1
>         register, this is the chip vendor OUI bits 3:18. The
>         second group of digits is the Phy Identifier 2 register,
>         this is the chip vendor OUI bits 19:24, followed by 10
>         bits of a vendor specific ID.
> 
> With this in place the sa8540p-ride's phy is probing consistently, so
> it seems the floating reset during mdio access was the issue. In either
> case, it shouldn't be floating so this improves the situation. The below
> link discusses some of the relationship of mdio, its phys, and points to
> this OUI compatible as a way to opt out of the OUI scan pre-reset
> handling which influenced this decision.
> 
> Link: https://lore.kernel.org/all/dca54c57-a3bd-1147-63b2-4631194963f0@gmail.com/
> Fixes: 57827e87be54 ("arm64: dts: qcom: sa8540p-ride: Add ethernet nodes")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

