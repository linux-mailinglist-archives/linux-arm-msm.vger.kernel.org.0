Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4022C6E1637
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 23:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbjDMVCY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 17:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjDMVCW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 17:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8AF9740
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 14:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681419692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=W92tAQhl/8cqUTTacQVRda1DmbqU6Pauq8CJ+Pib2iE=;
        b=EemZYvbr2aKJXP9BIcAL0tmPx42CqkI5rGQfnTmbip+ITp+86RKC/dUR0wFUUIQhe/PVjN
        xyzCZKQd107T7FLMxI1JuRWzJiOlc75tFDi6jsyRvY9fNgaepaRW0Xq1cbtcp82UQZjDfU
        EdvBBz3reMlC1tMiCWrmtTU2t2fCB64=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-ABf0mlBYMu2mwMm04bAzOA-1; Thu, 13 Apr 2023 17:01:31 -0400
X-MC-Unique: ABf0mlBYMu2mwMm04bAzOA-1
Received: by mail-ot1-f71.google.com with SMTP id a19-20020a056830101300b006a43241740bso651313otp.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 14:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681419690; x=1684011690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W92tAQhl/8cqUTTacQVRda1DmbqU6Pauq8CJ+Pib2iE=;
        b=Wh9EaWHxjtEVb0jFKh2hIu+oehvDg85E3b82TIh1f/bLN4Vwrf3WHiOJ11xl4UOmU4
         XTJ8nMEO7RqCfuNDtOHiqIcQNWrNHk+J4pqmiklUnMZwqGH8LvyQ77LYZ7k6wPyTY+2D
         +fmTaAHxRZOqGZbA7YfDPWVnqJ6lsf3sjL5cuOOqCvciUHFmF371sqmPWw+fEJRYVhvQ
         sEZLL061l2NMWRS1FUxqqjWRWnc1irXTJ4pWKjasvhTjogWl3+3aqc4ttxCKNjKlooJK
         wzP7e4yJ5GJVn7/6uCirwnO0jeh4ij1oxwMfxM7Nt5w8PsaRRy4c/b3QqfKdc4+twPTq
         dzPA==
X-Gm-Message-State: AAQBX9f186DD2GomxqO4wqclzF5JyOw7MdF0voA57ocAb+gSeVC8qMxQ
        9QN/aoZ3rtJXJ2wqV8KwzKruwjIX7k/vAXIj5QPSXNUK9kvkaFesoybA3RbwUFJbCBapkxGOQDh
        pKKUDLYjBPHBhHfesnKRvBklHng==
X-Received: by 2002:a05:6870:9727:b0:184:53f3:ae08 with SMTP id n39-20020a056870972700b0018453f3ae08mr2604074oaq.9.1681419690525;
        Thu, 13 Apr 2023 14:01:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZH6P610ghSZtZc+xDKjphUaJ8WCTJobw2CVv/rVDL061ZA5iqJT7QOooDI2ZwwFQwY5G4pgg==
X-Received: by 2002:a05:6870:9727:b0:184:53f3:ae08 with SMTP id n39-20020a056870972700b0018453f3ae08mr2604056oaq.9.1681419690247;
        Thu, 13 Apr 2023 14:01:30 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id q3-20020a056870e88300b001723f29f6e2sm1118333oan.37.2023.04.13.14.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 14:01:29 -0700 (PDT)
Date:   Thu, 13 Apr 2023 16:01:27 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, bmasney@redhat.com, echanude@redhat.com,
        ncai@quicinc.com, jsuraj@qti.qualcomm.com, hisunil@quicinc.com
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sa8540p-ride: Add ethernet nodes
Message-ID: <20230413210127.s5dkek6adp5ndern@halaney-x13s>
References: <20230413191541.1073027-1-ahalaney@redhat.com>
 <20230413191541.1073027-4-ahalaney@redhat.com>
 <a295939f0058373d1caf956749820c0d.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a295939f0058373d1caf956749820c0d.sboyd@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 13, 2023 at 01:47:19PM -0700, Stephen Boyd wrote:
> Quoting Andrew Halaney (2023-04-13 12:15:41)
> >  arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 179 ++++++++++++++++++++++
> >  1 file changed, 179 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > index 40db5aa0803c..650cd54f418e 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > @@ -28,6 +28,65 @@ aliases {
> >         chosen {
> >                 stdout-path = "serial0:115200n8";
> >         };
> > +
> > +       mtl_rx_setup: rx-queues-config {
> 
> Is there a reason why this isn't a child of an ethernet node?
> 
> 

I debated if it was more appropriate to:

    1. make a duplicate in each ethernet node (ethernet0/1)
    2. Put it in one and reference from both
    3. have it floating around independent like this, similar to what is
       done in sa8155p-adp.dts[0]

I chose 3 as it seemed cleanest, but if there's a good argument for a
different approach I'm all ears!

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sa8155p-adp.dts?id=de4664485abbc0529b1eec44d0061bbfe58a28fb#n50

Thanks,
Andrew

