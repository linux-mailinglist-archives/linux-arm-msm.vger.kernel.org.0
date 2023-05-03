Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE94C6F6072
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 23:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjECVJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 17:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjECVJS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 17:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7CD57D96
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683148109;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=B5wKef4dhqCkZ1S6DSh7ZtmhKxJbsxn4VyycuKkK9So=;
        b=A8O4f99Tr/9UmSxjTfesiUwTnXJOlswEUUXRQaZt4lBGm5Wad3sCPFz28JbHbGYI6jaw40
        PWbgIXxmw36PjtDBaVzFrhJRRaYk19NpFdI3rApuJ0ujc6VYBZc3Hdk3pxMSD64YpRTkS6
        qSPhgXQN/rNMJ6YO5JyFDrzCgAYj1OA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-HJPDjipQNkK2vno12OXviw-1; Wed, 03 May 2023 17:08:25 -0400
X-MC-Unique: HJPDjipQNkK2vno12OXviw-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-55a37bf6fd0so79136997b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 May 2023 14:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683148105; x=1685740105;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5wKef4dhqCkZ1S6DSh7ZtmhKxJbsxn4VyycuKkK9So=;
        b=lb1E1AAwf+alLKbN2zRsQ3N/7pCxf3gF0Z1v0/5+jKWoHYIhcmwm2hoIEWMHRkCQnM
         9faZBBCW0j7+n4FkeeEXkJZ98mwQWWeEx+KqTbwt3I8HtF4SVTGYFefj0AXkLz3jq1Oy
         qrCMjir0gSNX4TDh+CLTE7ti3LJQGB3ghO1Oa6YvSrTefDEyWkTpNP8/rGaDqK900iUp
         Mh6jccI6M/3NZds+JZ+crkWVMZjSjes8FvbGv7JNNwPss39Fai2KMRhmlwa+hwFym5lk
         mZKSidellCAosXSJm507OQeIi4kRFMYyXNucqWHOoJpp+q2tv96wYKf+T0/lZzI1Xtkh
         wxHg==
X-Gm-Message-State: AC+VfDzCkZ4ZpjmIrWkSbJ6us2AIkRUsGdOB/QOFPi8HX6GDem+fMa4M
        XxQJpMBzUtEfoouMRU49mtZnfa/eGbMyfyXqfD04RU24C7BvKVPreKsbvrtJwLWS1U1HFHvXojc
        fMrpGW6mAP2Nb5AyLVgUZfDzS1Q==
X-Received: by 2002:a81:4e57:0:b0:55a:1cb0:b255 with SMTP id c84-20020a814e57000000b0055a1cb0b255mr13545917ywb.37.1683148105295;
        Wed, 03 May 2023 14:08:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4P64qVsOt+vjSEOVyrkpdUEM5A/1R+Ne059afhHGPa9s9fFLtwBWonVmrqTmpiGrDrGIBL1w==
X-Received: by 2002:a81:4e57:0:b0:55a:1cb0:b255 with SMTP id c84-20020a814e57000000b0055a1cb0b255mr13545903ywb.37.1683148105041;
        Wed, 03 May 2023 14:08:25 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id p6-20020a815b06000000b00545a081847fsm8933405ywb.15.2023.05.03.14.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 14:08:24 -0700 (PDT)
Date:   Wed, 3 May 2023 17:08:22 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/2] Add EMAC3 support for sa8540p-ride (devicetree
 bits)
Message-ID: <ZFLNRsIt0pu1p9fQ@brian-x1>
References: <20230501205105.2518373-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501205105.2518373-1-ahalaney@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 01, 2023 at 03:51:03PM -0500, Andrew Halaney wrote:
> This is a forward port / upstream refactor of code delivered
> downstream by Qualcomm over at [0] to enable the DWMAC5 based
> implementation called EMAC3 on the sa8540p-ride dev board.
> 
> >From what I can tell with the board schematic in hand,
> as well as the code delivered, the main changes needed are:
> 
>     1. A new address space layout for dwmac5/EMAC3 MTL/DMA regs
>     2. A new programming sequence required for the EMAC3 base platforms
> 
> This series addresses the devicetree changes to support this
> hardware bringup.
> 
> As requested[1], it has been split up by compile deps / maintainer tree.
> The associated v4 of the netdev specific changes can be found at [2],
> and is merged.
> 
> The clock patch from this series was picked up from v5, leaving just the
> devicetree bits here.
> 
> Together, they result in the ethernet controller working for
> both controllers on this platform.

Reviewed-by: Brian Masney <bmasney@redhat.com>

