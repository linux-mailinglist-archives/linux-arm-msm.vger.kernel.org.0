Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2A75F3489
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 19:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiJCRcu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 13:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiJCRcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 13:32:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799813C8EA
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 10:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664818316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3vyvPsr/L8BrYe4IUlRuvSFBjkSYPUr3deHCeUKIK4U=;
        b=jMvnCKOqup/7G8YTHg/s9RlyeWtES4n0KXH0A+QbL/OAgaxjzR5y3ovlgloA7wsuGZb5jj
        X5pHXIvkv4zJb2d9s+KBx9rO9FUzMltWgp1goguyr3vvoe/an/ilwkoFf9KIh/WApYsQfr
        869u06Eydf3PXQLbCdan5nOqwAF6Q1M=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-114-eP6pzdaDOyyYjtNqMN9mJw-1; Mon, 03 Oct 2022 13:31:55 -0400
X-MC-Unique: eP6pzdaDOyyYjtNqMN9mJw-1
Received: by mail-il1-f198.google.com with SMTP id i3-20020a056e020d8300b002f90e6fedcfso8952612ilj.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 10:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3vyvPsr/L8BrYe4IUlRuvSFBjkSYPUr3deHCeUKIK4U=;
        b=e9W7p6NUuyv/HUtnSkObmgbbawAplPopJeUgTYlkVeIAHasvHBJJ2meG+u0BIHthAC
         TtQCqw7po6pP9NIpiWZ+NQT80cU/qw1X9ryUzIh4RnvIOk57b15U6uknI7DH5r91AQqp
         dlz3bClxTi2w12UtBj1UPh9SYeZeeqF/tfK62fGSLZcn7C2AnpMVSAv1wN+6BNju6Hd+
         4BbFhEun6gTDtt4g60jbMGXrYcZGPjqezdSudRBCrJ+W5IuQjbJLDjsn2x4d33iSe6+V
         OnuiE3fLVJzsIDNzsSiihZepxb7O6qlRn+ve1rmTdfL/SXaFdUST58RPNG7I8mY9rmYd
         ortw==
X-Gm-Message-State: ACrzQf3dy+Lyl6YU0uv7srCYko7mhYHW1VmJW3EjsfBhXaMwmhNpPqvH
        qb8vB2vIaGWwxuw4UDqa76zCvC7qZwn8Em2QRcBYl+RNfBXULtpDMqf1rK4dKHwOEP5hxMXa6Kt
        nkYtWSKbkHFb5N0F698KYQRbzpA==
X-Received: by 2002:a05:6e02:180a:b0:2f6:9b06:a184 with SMTP id a10-20020a056e02180a00b002f69b06a184mr10459914ilv.137.1664818314705;
        Mon, 03 Oct 2022 10:31:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM68aHLAOyo71WPpxFAs/97lC6WQUEAdVLU0LC4oSgLPtzw3n55yGVx+q7kv+yXGSrcJmAcC7Q==
X-Received: by 2002:a05:6e02:180a:b0:2f6:9b06:a184 with SMTP id a10-20020a056e02180a00b002f69b06a184mr10459892ilv.137.1664818314430;
        Mon, 03 Oct 2022 10:31:54 -0700 (PDT)
Received: from x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id s14-20020a056602168e00b006a2e2834531sm4762113iow.44.2022.10.03.10.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:31:53 -0700 (PDT)
Date:   Mon, 3 Oct 2022 13:31:52 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v5 0/3] arm64: dts: qcom: add dts for sa8540p-ride board
Message-ID: <YzsciFeYpvv/92CG@x1>
References: <20221003125444.12975-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003125444.12975-1-quic_ppareek@quicinc.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 03, 2022 at 06:24:40PM +0530, Parikshit Pareek wrote:
> Parikshit Pareek (3):
>   dt-bindings: arm: qcom: Document additional sa8540p device
>   arm64: dts: qcom: sa8295p: move common nodes to dtsi
>   arm64: dts: qcom: introduce sa8540p-ride dts

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>
Tested-by: Brian Masney <bmasney@redhat.com>


Just for documentation purposes, to get linux-next-20220930 booting on
the QDrive3 with the upstream arm64 defconfig I had to apply the
following patches:

- arm64: dts: qcom: sc8280xp: fix UFS PHY serdes size
  https://lore.kernel.org/linux-arm-msm/20220915141601.18435-1-johan+linaro@kernel.org/

  Without this, the phy fails to probe due to the following error:

    qcom-qmp-ufs-phy 1d87000.phy: can't request region for resource [mem 0x01d87400-0x01d87507]
    qcom-qmp-ufs-phy 1d87000.phy: failed to create lane0 phy, -16
    qcom-qmp-ufs-phy: probe of 1d87000.phy failed with error -16

- This hack patch is still needed:
  disable has_address_auth_metacap and has_generic_auth
  https://github.com/andersson/kernel/commit/d46a4d05d5a17ff4447af08471edd78e194d48e5

  Without this, the boot hangs at:

    rcu: srcu_init: Setting srcu_struct sizes based on contention.
    arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
    clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
    sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns

- My UFS clock patch is still needed:
  arm64: dts: qcom: sc8280xp: correct ref_aux clock for ufs_mem_phy
  https://lore.kernel.org/lkml/20220830180120.2082734-1-bmasney@redhat.com/T/#u

- I didn't use an initrd for testing so I had to change the options
  CONFIG_SCSI_UFS_QCOM and CONFIG_PHY_QCOM_QMP from =m to =y.

Brian

