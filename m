Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 118A8589943
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Aug 2022 10:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiHDI1F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 04:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbiHDI1D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 04:27:03 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4801275E;
        Thu,  4 Aug 2022 01:27:02 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d20so11297310pfq.5;
        Thu, 04 Aug 2022 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=xzya3EEe/6JYylod91x6WeKO85+rGgr8KWB4/fkcxRs=;
        b=XvuVmJKEG0C1dlPIOSAvTQze7oZ2YPb9VLpcZXMGcxiKUbc4bmGSj8VE6Gq45ktneS
         PaThxMtpW4qu8tkowEPKlxNX9Z7NRUWb/vPvlQoZFmayQ9p1Eam49aCSKFg9N3JHTG2K
         trvehHpMumAZPlGN0mPKyytdBmeAyc+ZCdDjGCyF7zio70B4PlLEdtn0C//4FBJ6B5vM
         VBwKOzjZJ9b6ahb4QEHFiB2o3Oj7jdmAsYy/r0jtEkRIipeJwypjYlOp2VPVZhSu0/b5
         L1hxkL6Z5OonbnKSbkv1IA6XiYdV24vA9GQWb3CXhrNWDeFIIEJBKdkPi5FrXLEy18Dh
         zQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=xzya3EEe/6JYylod91x6WeKO85+rGgr8KWB4/fkcxRs=;
        b=0rYsHadh9NmMK0Q1bmTtQq6kO0qQvnxdQtBl/ok93TaNIZggyNfwvLfAzLGj/imvlU
         NzODl5FzGmqgSVUKdl6jTfbaioy2dDp0U1bluHWwSdg4JyuQj5o2wWj58EM46N27K1ge
         n/0sqwsbrSJ8XOWvbwauCzltHrW7jiYkazPUcYU3dTNl0J/oqxPsXld8qSkANuLFzsMl
         7ZJNnObklSrP+bgdE0McZtQgysvma9ITjC1Gg88ppKBMyzQtm1x2hYUzU/4CjDr1U3Qs
         icL/Us2zx5N1KCDZ/cUmjU8hzVm57/uvkvkgo0ljJ3DxNid6+FdukguR4l/m2+8X3SOV
         3eCg==
X-Gm-Message-State: ACgBeo04aCE0Be8EXq/78U51ZPnecuH6h5eBJ0cxS4R4Vk89/sFZh3eN
        5Z3S4HFJOHwEzw6bFdDjaFU=
X-Google-Smtp-Source: AA6agR55AQyYzN/vrL8QYskLo3qoQKJDAEEqsjk7HyuP/9jgXg5I9CZXhcTXrarZcKWKwvdSjG46XA==
X-Received: by 2002:a63:e258:0:b0:41a:d92b:64f9 with SMTP id y24-20020a63e258000000b0041ad92b64f9mr750319pgj.148.1659601622103;
        Thu, 04 Aug 2022 01:27:02 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-23.three.co.id. [180.214.232.23])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902ea0300b0016bf803341asm267477plg.146.2022.08.04.01.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 01:27:01 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 2A4CB103A42; Thu,  4 Aug 2022 15:26:57 +0700 (WIB)
Date:   Thu, 4 Aug 2022 15:26:56 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
Message-ID: <YuuC0NISKFVIhUD1@debian.me>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220801211240.597859-1-quic_eberman@quicinc.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 01, 2022 at 02:12:29PM -0700, Elliot Berman wrote:
> Gunyah is a Type-1 hypervisor independent of any
> high-level OS kernel, and runs in a higher CPU privilege level. It does
> not depend on any lower-privileged OS kernel/code for its core
> functionality. This increases its security and can support a much smaller
> trusted computing base than a Type-2 hypervisor.
> 
> Gunyah is an open source hypervisor. The source repo is available at
> https://github.com/quic/gunyah-hypervisor.
> 
> The diagram below shows the architecture.
> 
> ::
> 
>         Primary VM           Secondary VMs
>      +-----+ +-----+  | +-----+ +-----+ +-----+
>      |     | |     |  | |     | |     | |     |
>  EL0 | APP | | APP |  | | APP | | APP | | APP |
>      |     | |     |  | |     | |     | |     |
>      +-----+ +-----+  | +-----+ +-----+ +-----+
>  ---------------------|-------------------------
>      +--------------+ | +----------------------+
>      |              | | |                      |
>  EL1 | Linux Kernel | | |Linux kernel/Other OS |   ...
>      |              | | |                      |
>      +--------------+ | +----------------------+
>  --------hvc/smc------|------hvc/smc------------
>      +----------------------------------------+
>      |                                        |
>  EL2 |            Gunyah Hypervisor           |
>      |                                        |
>      +----------------------------------------+
> 
> Gunyah provides these following features.
> 
> - Threads and Scheduling: The scheduler schedules virtual CPUs (VCPUs) on
> physical CPUs and enables time-sharing of the CPUs.
> - Memory Management: Gunyah tracks memory ownership and use of all memory
> under its control. Memory partitioning between VMs is a fundamental
> security feature.
> - Interrupt Virtualization: All interrupts are handled in the hypervisor
> and routed to the assigned VM.
> - Inter-VM Communication: There are several different mechanisms provided
> for communicating between VMs.
> - Device Virtualization: Para-virtualization of devices is supported using
> inter-VM communication. Low level system features and devices such as
> interrupt controllers are supported with emulation where required.
> 

Hi,

I can't apply this series on top of mainline or linux-next. On what tree
(and what commit) this series is based on? I'd like to do htmldocs test.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
