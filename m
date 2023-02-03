Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5861D688B9C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 01:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbjBCAQF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 19:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBCAQE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 19:16:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79306E42B
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 16:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675383317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZZii04idi4snEs1Pp8F67oc8bCMrsdYL6FcEHVrhkW0=;
        b=JO3hFT2IB2uEypqld3DhHCL/SjnYSzPVerW5LXhVtQ3S81rrf8umrF878n3IO/b498imZP
        SbdsMtF6zTDLCLTYA7tl9fyC+biKxih97WGGyxUdB3hNHeQ67Pwuu5FNvi46cA4IMGgn81
        xEZIl/8qIZ4TggsgoOhxtQwyuRND7S4=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-SelwozmTNBmrY6swH0kEBw-1; Thu, 02 Feb 2023 19:15:11 -0500
X-MC-Unique: SelwozmTNBmrY6swH0kEBw-1
Received: by mail-io1-f71.google.com with SMTP id d24-20020a5d9bd8000000b006ee2ddf6d77so2107472ion.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 16:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZii04idi4snEs1Pp8F67oc8bCMrsdYL6FcEHVrhkW0=;
        b=r+f2OpBFx4wRuHtidQDn6Smz25kiHCUGZerEA4MMyTotjGvLu7UWgcTD5FNZ0uexqQ
         BSoWIH+dsXJegZWhIMCVo7agefQSC0nHyLpeBu/ftO3yaD2FZNRc2Hkkrp4BSfiCIKsG
         MnajCtYfSXzk44GlksWBak5CBV64eqUk7QN9vAurId0AV6JB8v4K6dddb7WIjDTcdDex
         4LQaC11Uz2oph6NbzM7oGwfEoWORsgW0/zHVMPmu/85UE5uC7/v9f/W2IozzmubyTwBp
         iNETG4kDpdNjUNvywcQGqBu6ngwLq55HKtbrNHPrCqg0cwLmAJX8glMuUsZTsDBMfvMy
         P0Iw==
X-Gm-Message-State: AO0yUKUEF+6Zcb2Z53Ow0vNatjXssVqqAci/GQjUKo5AyhM5U7hUl5px
        tNEc0zM5rFUKVLOxd+K64hZmHkIb7spJiP3ptQtc7DqmWKatXOT/HSYmV7uLU2BenGmq+rw5XEd
        elZVuhSVS3UYsbSlP7g9cB07nkg==
X-Received: by 2002:a05:6e02:1a46:b0:311:20f:bc77 with SMTP id u6-20020a056e021a4600b00311020fbc77mr6285767ilv.6.1675383309921;
        Thu, 02 Feb 2023 16:15:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+lbPEIbkCglkbHrVZ7yC7ELtrZRYRaCyZ0+Iv+658LyqnW2+LBjhq8imActoVACDnw9RK2Jg==
X-Received: by 2002:a05:6e02:1a46:b0:311:20f:bc77 with SMTP id u6-20020a056e021a4600b00311020fbc77mr6285749ilv.6.1675383309714;
        Thu, 02 Feb 2023 16:15:09 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id w193-20020a022aca000000b003a5de29178esm371182jaw.104.2023.02.02.16.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 16:15:08 -0800 (PST)
Date:   Thu, 2 Feb 2023 19:15:07 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFT PATCH 05/14] arm64: dts: qcom: sc8280xp: correct TLMM
 gpio-ranges
Message-ID: <Y9xSCwgUxHDeppz7@x1>
References: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
 <20230201155105.282708-6-krzysztof.kozlowski@linaro.org>
 <Y9xAEoc0QXe222D0@x1>
 <25f5a750-b51c-7d7b-0d50-5b2f78de8512@linaro.org>
 <Y9xOeZjAQmQqLOa1@x1>
 <1319a973-26ae-8c11-d967-8720aaf894df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319a973-26ae-8c11-d967-8720aaf894df@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 03, 2023 at 01:05:35AM +0100, Konrad Dybcio wrote:
> On 3.02.2023 00:59, Brian Masney wrote:
> > For others quick reference, Konrad is talking about this line from
> > sa8540p-ride.dts:
> > 
> > 	reset-gpios = <&tlmm 228 GPIO_ACTIVE_LOW>;
> > 
> > I noticed that earlier but assumed this was one based. However, looking
> > at pinctrl-sc8280xp.c I see gpio0..gpio227 defined.
>
> + gpio229 is the reset pin for the UFS card slot

We don't have the UFS card slot on the sa8540p exposed. However, it is
available on the sa8295p.

The original DTS in upstream listed 230 pins, however pinctrl-sc8280xp.c
lists 233 pins and the two UFS pins match what we have in DTS.

static const struct pinctrl_pin_desc sc8280xp_pins[] = {
        PINCTRL_PIN(0, "GPIO_0"),
	...
	PINCTRL_PIN(227, "GPIO_227"),
	PINCTRL_PIN(228, "UFS_RESET"),
	PINCTRL_PIN(229, "UFS1_RESET"),
	PINCTRL_PIN(230, "SDC2_CLK"),
	PINCTRL_PIN(231, "SDC2_CMD"),
	PINCTRL_PIN(232, "SDC2_DATA"),

Rescind-Reviewed-by: Brian Masney <bmasney@redhat.com>

