Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1DB61F192
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 12:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbiKGLLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 06:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbiKGLLA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 06:11:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A7F19C1A
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 03:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667819356;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n8Cl/06MPGSPm5RCcGRmqHy2+qFfaHoF23PzrGUHbl0=;
        b=gQAFVSogdmVtbnkqTjnaxFmeniAc/QMWZGR9xNJgztcS+f7/a47sEe/gZ5O4Wc9t+sd8A1
        ATpFIKv2x91TKhjXvsA+ViEGFjtgK76Okyk74q3oxliXYrrEJCfE/wmlJ7iqb5rt0F7OGW
        hDFY2oAKVeJD646tEZuu/aRq0rTG2dE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-TSQtG-ZJNnOV9bXtgnBQ0Q-1; Mon, 07 Nov 2022 06:09:15 -0500
X-MC-Unique: TSQtG-ZJNnOV9bXtgnBQ0Q-1
Received: by mail-qk1-f199.google.com with SMTP id x22-20020a05620a259600b006b552a69231so9778022qko.18
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 03:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8Cl/06MPGSPm5RCcGRmqHy2+qFfaHoF23PzrGUHbl0=;
        b=uLGSoPynRQj51iVSljytHCVyzRCSt///4hGxLZFY3lo1RJFxK9Y3GcdqP5/2UmIs4s
         c+RoCTAoctZ9jRBhIUUPfxi9l9xo7WIxMPsR6CH5vgwviGhjlkoqFRSX3cg8TgLcdNo2
         sAbM3yTh7S9wAsxNEWjZ/NTVl4pXq0zpSGgBqKSS6TP4O3o7TJ5D4OqKCyhnktSsWfbq
         AVOxCV0jCr3p0s6VKl5EBZcXCrOvAFWW2oqX1Ixja1YM9u8Z44lLkfA66mZ7DTBNlCjz
         Ml43xniOtjciXp5O9sI6laH2v6OOtL008F5s/zIkpoC+mu9kpc2eIIUIi+nU9oETzGGj
         fWuQ==
X-Gm-Message-State: ACrzQf3aOd3w9i9Y0Ea+vgVi3C/FL9LNPxpYn2I0gWfj4cg3kYRwEBe0
        K4I8x2wiJWDwhrbM5/cNZnRxl8OVvMjFut5R7Pw77jyKRoYbBKhJymZFOykWCT69/2vNriUJSXn
        qZ28BvYSYzv4hzNzkzFHde2Af+Q==
X-Received: by 2002:a05:6214:b6b:b0:4bb:9fea:f53a with SMTP id ey11-20020a0562140b6b00b004bb9feaf53amr44142074qvb.7.1667819354529;
        Mon, 07 Nov 2022 03:09:14 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4P+NUQULfed2HggHKoSQY6kh/nJD0vPq50SemRAN1ssl+3+ZctfwFB6qqd/+YR3SsRBOdEJw==
X-Received: by 2002:a05:6214:b6b:b0:4bb:9fea:f53a with SMTP id ey11-20020a0562140b6b00b004bb9feaf53amr44142058qvb.7.1667819354338;
        Mon, 07 Nov 2022 03:09:14 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id c8-20020a05620a134800b006ecb9dfdd15sm6481524qkl.92.2022.11.07.03.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 03:09:13 -0800 (PST)
Date:   Mon, 7 Nov 2022 06:09:12 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: fix UFS reference clocks
Message-ID: <Y2jnWJ0FI6Fmy8/O@x1>
References: <20221104092045.17410-1-johan+linaro@kernel.org>
 <20221104092045.17410-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104092045.17410-2-johan+linaro@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 04, 2022 at 10:20:44AM +0100, Johan Hovold wrote:
> There are three UFS reference clocks on SC8280XP which are used as
> follows:
> 
>  - The GCC_UFS_REF_CLKREF_CLK clock is fed to any UFS device connected
>    to either controller.
> 
>  - The GCC_UFS_1_CARD_CLKREF_CLK and GCC_UFS_CARD_CLKREF_CLK clocks
>    provide reference clocks to the two PHYs.
> 
> Note that this depends on first updating the clock driver to reflect
> that all three clocks are sourced from CXO. Specifically, the UFS
> controller driver expects the device reference clock to have a valid
> frequency:
> 
> 	ufshcd-qcom 1d84000.ufs: invalid ref_clk setting = 0
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Fixes: 8d6b458ce6e9 ("arm64: dts: qcom: sc8280xp: fix ufs_card_phy ref clock")
> Fixes: f3aa975e230e ("arm64: dts: qcom: sc8280xp: correct ref clock for ufs_mem_phy")
> Link: https://lore.kernel.org/lkml/Y2OEjNAPXg5BfOxH@hovoldconsulting.com/
> Cc: stable@vger.kernel.org	# 5.20
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Note that there was no 5.20 kernel; that should be 6.0. Bjorn should be
able to fix this up during merge.

https://en.wikipedia.org/wiki/Linux_kernel_version_history

