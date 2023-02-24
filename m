Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30A56A2217
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 20:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjBXTHS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 14:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjBXTHO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 14:07:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5590D2310E
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 11:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677265581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TO32MmHRC5X6hVdeytKpEjQuFgiB4c62vSXkbsV3be0=;
        b=eEUhZWsIJyLEU6EN9L4oxw6Kses9zRKEgVQ9dMahLM2P7EsZpDPkWCbmdIZnSTTQ8fA0cV
        DFKWJN0RpF2LsxxTqbbSjgvtAZLKOcdSwge/8W0wwFfkaw6Cldwvy8dYpSaqMNY33CEd1s
        lTZ0ByWAAnmLb50/mNk+N593nDQaylA=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-dq_AIw4DOESJJvMWtx5K6g-1; Fri, 24 Feb 2023 14:06:11 -0500
X-MC-Unique: dq_AIw4DOESJJvMWtx5K6g-1
Received: by mail-io1-f71.google.com with SMTP id e4-20020a056602158400b0073529b4aeaaso8953921iow.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 11:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TO32MmHRC5X6hVdeytKpEjQuFgiB4c62vSXkbsV3be0=;
        b=sqiSJCoYziXmMW7I3moYThauXV7crMCgofaAyczQ8DofP5y9HwKrnI9T9ZthMVoj8D
         tWrSdRAu48CR96jb60tDw1O4lFW4a8dtEFdLqFPJMTKONe5Yk2dg3IFC46jmLb7ngK4f
         Amw3n1RbSzmOy5ME3uU5dGFBwStUWYi6Q6V3ko3qsp2idj2AmqpCwjaKd8ots9/WGp6O
         oMlFNtsjxhyzpIuf4Gch2FiOsjyHqZ0lt27ZUZU/UVwCk2FMD1iNGGOEv0YUyfumJZLI
         OMIh7pbQhMD76THqUfoAIpCwvdWbh+MWmLp7jT/n2qIC9MU82C3nE51cyDXBHuUdJEzI
         xlrg==
X-Gm-Message-State: AO0yUKVD9xINMgwpAKlsB1IaZ2c5BNz2nUAMxz4lNiNCoWDhHMLjIQ7k
        gKyZP4INWUX7NvF47KMdDDjCM/Aj5cuo/X7a9wTGGdmDjbgVpBNi6IQa2dONL0nhQf6XtDNgDJw
        73ejjuBoCX1IpvxQTMmphI7VuYg==
X-Received: by 2002:a05:6602:200f:b0:74c:bc54:def6 with SMTP id y15-20020a056602200f00b0074cbc54def6mr790444iod.16.1677265571054;
        Fri, 24 Feb 2023 11:06:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9/Pv5CyL/4mD4A9Y4Q/LVOJsbK7o9jmpBuvUza9YaJUBhEetobrRKdqPedvvHaEaB9J1UmPg==
X-Received: by 2002:a05:6602:200f:b0:74c:bc54:def6 with SMTP id y15-20020a056602200f00b0074cbc54def6mr790426iod.16.1677265570885;
        Fri, 24 Feb 2023 11:06:10 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id l5-20020a6b7b05000000b0073f8a470bacsm24221iop.16.2023.02.24.11.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 11:06:09 -0800 (PST)
Date:   Fri, 24 Feb 2023 14:06:07 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/6] Add basic Minidump kernel driver support
Message-ID: <Y/kKn9tnvSQ2Pacn@x1>
References: <1676978713-7394-1-git-send-email-quic_mojha@quicinc.com>
 <Y/deHzijzvuvCJ2M@x1>
 <47542dbb-8cf3-6eae-a38e-910d38bd960b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47542dbb-8cf3-6eae-a38e-910d38bd960b@quicinc.com>
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

Hi Mukesh,

On Fri, Feb 24, 2023 at 04:10:42PM +0530, Mukesh Ojha wrote:
> On 2/23/2023 6:07 PM, Brian Masney wrote:
> > I'd like to test this series plus your series that sets the multiple
> > download modes.
> 
> Sure, you are welcome, but for that you need a device running with Qualcomm
> SoC and if it has a upstream support.

I will be testing this series on a sa8540p (QDrive3 Automotive
Development Board), which has the sc8280xp SoC with good upstream
support. This is also the same board that I have a reliable way to
make the board crash due to a known firmware bug.

> Also, testing of this patch needs some minimal out of tree patches and
> i can help you with that.

Yup, that's fine. Hopefully we can also work to get those dependencies
merged upstream as well.

Brian

