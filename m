Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D8D6A08B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 13:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234052AbjBWMjE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 07:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233501AbjBWMi5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 07:38:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B41BDD8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 04:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677155876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=o5faige4boHy1KDnDJFUMGzlyi7Wgdd7JL40G0EvBo0=;
        b=DAd69z/mYzo+WhTe+QrdMa5w37mfk94GO5CzaCRSOEbhF+nhiqNXPbPhC/TArBDxe5+B9+
        liEk1vMkKXZ/PdYUSmxQYw0OoYAvhg33TEnNA7VnKGnwqpzN2PcPOSVg+edfytRdxDJTkD
        bSzjTpjE7EMvgAL9ZDqsoUIkwDr3Q1o=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-Rie3erdiNG-fnONQSKTT7w-1; Thu, 23 Feb 2023 07:37:55 -0500
X-MC-Unique: Rie3erdiNG-fnONQSKTT7w-1
Received: by mail-io1-f72.google.com with SMTP id b13-20020a5d890d000000b0074ca82f593bso147371ion.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 04:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5faige4boHy1KDnDJFUMGzlyi7Wgdd7JL40G0EvBo0=;
        b=MIoAYFwaQ6u45FmvkUm76iOxhw9Wq1wXzcUvdThQJ4Noh/kJ2WwERPTBjjWFM2cg+u
         dRGzm01u32jmcf1WAMjV1levVjbuidYrRTMya8VNhbnvj2Ad3ssrmemzDEEJwFEZZ1qZ
         akqW/mVOiMzFwejighKJNYTkkVei8slwTi/h1nrS7MEuFf0voGo0nAgl42C/bj6O1h9Y
         6EcSvR3TgvLEICQ0b+NurJVf7tU/TO7alNUpE0KWs0hqafTCzc7nSTEI59m7q3tRXG4U
         fW392+AOQDLSIbqYjoRHk/H7gk0WeTFrkSduIKqgwgUs4CuShL57tcUSkhe7P19r8zqf
         0Dug==
X-Gm-Message-State: AO0yUKUpseoN795d9Sj9HX723Xl/IlExz4LgeX/PN6grbo1yVxfb/8XC
        ADuiQLPGcpvGu3JYyFCcKEz0M/YaJCkBR5OiksAl7Ma56dTF0IrhwgARVRo9R8GER+ETg4f5diF
        6+s+k0cmYTjtAsb+qFvQpfXx3ZQ==
X-Received: by 2002:a05:6e02:1445:b0:316:e54a:828f with SMTP id p5-20020a056e02144500b00316e54a828fmr6493872ilo.6.1677155874526;
        Thu, 23 Feb 2023 04:37:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/6AWA4CAuXGZNmzPhHzcrBdzMdBpWOTtYJucrF1Qv97MIIPEiFDxaTnG32VB1VQ2w0xUjrzA==
X-Received: by 2002:a05:6e02:1445:b0:316:e54a:828f with SMTP id p5-20020a056e02144500b00316e54a828fmr6493856ilo.6.1677155874289;
        Thu, 23 Feb 2023 04:37:54 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id y22-20020a02bb16000000b0039e89ea68f9sm1759062jan.135.2023.02.23.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 04:37:53 -0800 (PST)
Date:   Thu, 23 Feb 2023 07:37:51 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/6] Add basic Minidump kernel driver support
Message-ID: <Y/deHzijzvuvCJ2M@x1>
References: <1676978713-7394-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1676978713-7394-1-git-send-email-quic_mojha@quicinc.com>
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

On Tue, Feb 21, 2023 at 04:55:07PM +0530, Mukesh Ojha wrote:
> Minidump is a best effort mechanism to collect useful and predefined data
> for first level of debugging on end user devices running on Qualcomm SoCs.
> It is built on the premise that System on Chip (SoC) or subsystem part of
> SoC crashes, due to a range of hardware and software bugs. Hence, the
> ability to collect accurate data is only a best-effort. The data collected
> could be invalid or corrupted, data collection itself could fail, and so on.
> 
> Qualcomm devices in engineering mode provides a mechanism for generating
> full system ramdumps for post mortem debugging. But in some cases it's
> however not feasible to capture the entire content of RAM. The minidump
> mechanism provides the means for selecting which snippets should be
> included in the ramdump.
> 
> The core of minidump feature is part of Qualcomm's boot firmware code.
> It initializes shared memory (SMEM), which is a part of DDR and
> allocates a small section of SMEM to minidump table i.e also called
> global table of content (G-ToC). Each subsystem (APSS, ADSP, ...) has
> their own table of segments to be included in the minidump and all get
> their reference from G-ToC. Each segment/region has some details like
> name, physical address and it's size etc. and it could be anywhere
> scattered in the DDR.
> 
> Existing upstream Qualcomm remoteproc driver[1] already supports minidump
> feature for remoteproc instances like ADSP, MODEM, ... where predefined
> selective segments of subsystem region can be dumped as part of
> coredump collection which generates smaller size artifacts compared to
> complete coredump of subsystem on crash.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/remoteproc/qcom_common.c#n142
> 
> In addition to managing and querying the APSS minidump description,
> the Linux driver maintains a ELF header in a segment. This segment
> gets updated with section/program header whenever a new entry gets
> registered.

I'd like to test this series plus your series that sets the multiple
download modes. Can you include documentation about how to actually use
this new feature? Also the information that you provided above is really
useful. I think that should also go in the documentation file as well.

I already have a reliable way to make a board go BOOM and go into
ramdump mode.

Brian

