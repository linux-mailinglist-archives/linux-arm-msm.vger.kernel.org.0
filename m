Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A385F46EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 17:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbiJDPuU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 11:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiJDPuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 11:50:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C168B12AAC
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664898617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9rLTD5524ltpp+EX1g/hQgTLlmpZkYZOlGRyUWnMDxw=;
        b=VicybJtz79uEI6gVj4NAzt6UbUEyqbMhFAKqNZImHiKIian0gbXXk32mvyOX93IVgJTm1G
        vBDVSU65waOzv08caU2Nzr2SieWC7Iztm5HpcAxoLKeRqXwa2+8VQHyR6JPckS5JcYSF6s
        YLZHhrt3VmqgLBhpYL3/LFV3qhhVlN0=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-HNCSTUjFNn-ttRjiQXLBkQ-1; Tue, 04 Oct 2022 11:50:16 -0400
X-MC-Unique: HNCSTUjFNn-ttRjiQXLBkQ-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-13193fb45b9so9030771fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 08:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=9rLTD5524ltpp+EX1g/hQgTLlmpZkYZOlGRyUWnMDxw=;
        b=VN/i3a1ZVY59WnnKBQ1Mv7RzLk8s62Uw3whzQ+mIWxuBspZMHqcehyb8kZhrPzkbni
         In7o3hI6dX2aH7N+w3ok2dADNxg8Kn1Jz8oKruW6FMF0du4SjC7rysoANT7cTrQCUaDn
         R2XECYUZFF+6U4afC4IJYPysKbzZuo5ooyEXX7rOmuiJps6UedXE5TtSSFQHQfFO87wQ
         RI8T9DLM/0fNlriXIbzC6ANrOlOkOGrshNoelZtEHkNUNo2NZME5jCfHCkX31Ai2aw40
         kdQNyR459V6RtsiiOlte5DdpVvOvnToh7cBm7YtE5wDzLvEeqySWs3wFc/kYhfTZHxow
         3wrQ==
X-Gm-Message-State: ACrzQf2A8Huqm61hmOw1jUM3NWO7nkH6l5BlrxxfWeEP0bKQDCk0HW8d
        oeeUVTkZxUZdwhY71mU5gj6gbjl6MEKM+mGghxab0860bUaX2+0tC3reXsGC1FJ6YY15Yp3cS+X
        UmGKwwePKubs9In5aDGUHQfZDRQ==
X-Received: by 2002:a05:6808:1286:b0:350:994a:959 with SMTP id a6-20020a056808128600b00350994a0959mr193092oiw.136.1664898615322;
        Tue, 04 Oct 2022 08:50:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6gKiAJPON1BJWdAt6wY/Ybga1S2rk7+hM207aS81FF1n9LHsHwGX1aog1PaECwakS18oZxig==
X-Received: by 2002:a05:6808:1286:b0:350:994a:959 with SMTP id a6-20020a056808128600b00350994a0959mr193080oiw.136.1664898615120;
        Tue, 04 Oct 2022 08:50:15 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id z187-20020aca33c4000000b00342d207e68bsm3185851oiz.37.2022.10.04.08.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:50:14 -0700 (PDT)
Date:   Tue, 4 Oct 2022 10:50:12 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Eric Chanudet <echanude@redhat.com>
Cc:     Brian Masney <bmasney@redhat.com>,
        Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v5 0/3] arm64: dts: qcom: add dts for sa8540p-ride board
Message-ID: <20221004155012.5vhk7oq7ly7rw62w@halaney-x13s>
References: <20221003125444.12975-1-quic_ppareek@quicinc.com>
 <YzsciFeYpvv/92CG@x1>
 <20221004132816.ryhyo5ihwruxspl6@echanude>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004132816.ryhyo5ihwruxspl6@echanude>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 04, 2022 at 09:28:16AM -0400, Eric Chanudet wrote:
> On Mon, Oct 03, 2022 at 01:31:52PM -0400, Brian Masney wrote:
> > Just for documentation purposes, to get linux-next-20220930 booting on
> > the QDrive3 with the upstream arm64 defconfig I had to apply the
> > following patches:
> > 
> > - arm64: dts: qcom: sc8280xp: fix UFS PHY serdes size
> >   https://lore.kernel.org/linux-arm-msm/20220915141601.18435-1-johan+linaro@kernel.org/
> > 
> >   Without this, the phy fails to probe due to the following error:
> > 
> >     qcom-qmp-ufs-phy 1d87000.phy: can't request region for resource [mem 0x01d87400-0x01d87507]
> >     qcom-qmp-ufs-phy 1d87000.phy: failed to create lane0 phy, -16
> >     qcom-qmp-ufs-phy: probe of 1d87000.phy failed with error -16
> > 
> > - This hack patch is still needed:
> >   disable has_address_auth_metacap and has_generic_auth
> >   https://github.com/andersson/kernel/commit/d46a4d05d5a17ff4447af08471edd78e194d48e5
> > 
> >   Without this, the boot hangs at:
> > 
> >     rcu: srcu_init: Setting srcu_struct sizes based on contention.
> >     arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
> >     clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
> >     sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
> > 
> > - My UFS clock patch is still needed:
> >   arm64: dts: qcom: sc8280xp: correct ref_aux clock for ufs_mem_phy
> >   https://lore.kernel.org/lkml/20220830180120.2082734-1-bmasney@redhat.com/T/#u
> > 
> > - I didn't use an initrd for testing so I had to change the options
> >   CONFIG_SCSI_UFS_QCOM and CONFIG_PHY_QCOM_QMP from =m to =y.
>  
> I followed the instructions above and linux-next-20220930 booted on the
> QDrive3 to a prompt. It then hanged after a couple minutes and rebooted
> in Sahara mode:
>     B -   1662280 - Sahara Init
>     B -   1665422 - Sahara Open
> 
> There seems to be no trace from the kernel, this happened consistently
> over 3 boots.
> 
> I asked Brian, he mentioned he only booted to prompt so that may have
> happened unbeknownst to him as well.

I took the upstream defconfig for a spin and see similar. My T-B was for
this defconfig (downstream one + make olddefconfig) which works ok for
me:

    https://gitlab.com/ahalaney/linux/-/commit/40f1b241117716ef4b0e27cf50054e749b8ff608

Thanks,
Andrew

> 
> -- 
> Eric Chanudet
> 

