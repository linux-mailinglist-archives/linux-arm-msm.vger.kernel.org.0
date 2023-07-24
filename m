Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE0175FCD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 19:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbjGXRBJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 13:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjGXRBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 13:01:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7B6199F
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690217986;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4nkZEjGqKMSg9XiMs6wuEiyuXPT5uFzTR3xSKZPtXrE=;
        b=BUk70JH9iu9c/6pRiwq2AiLpLIZhN28+K8ZxBY2ksmYzl+242Z40prgo+HERqigHinALaz
        TwnlDyg5Dc3crJ1louBFlO070QUquIUoFGsja9QacAZQaW6gbgC3d9IIfaYCQ2ji02SUOX
        bc1zujiHnN8Yz8/lqF1BZHkenH+Ruv0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-SWH9veayOCmVHVHwwWRSbg-1; Mon, 24 Jul 2023 12:59:44 -0400
X-MC-Unique: SWH9veayOCmVHVHwwWRSbg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-63d10c323c3so2229496d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 09:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217984; x=1690822784;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nkZEjGqKMSg9XiMs6wuEiyuXPT5uFzTR3xSKZPtXrE=;
        b=JsOrVePJ8S3p5D+pHdXH8miMDgZcY10vBPIrqzMS00UQCI2YFjD/pL8gG4dL0jUqna
         kMaMybMf1KJgaSUKiwIGRtHQny7NNgFQ+6ipsVh3n1QX0P3mJJAEYpvofqZuZH1lbhdK
         9gi4mVnxrFRwr/f6goAy9uhNgy/Uh4ay4NyABaIxFVpOWhVguf/PSn9UWZdkFGxfem8R
         1VX8Y915ula43liFSkmRgu/A4NcJHYdr4egdFQFr5SwEeZgmgk+wsL4F7rfFD6irpEtu
         XjbBFsZZhwrowvIYTARsXbbkgEfQw5VlvldcGe1erjcJXQMQmdu1cPwdY6IjqYPRlFW9
         ykfQ==
X-Gm-Message-State: ABy/qLZ4xXJMfLdaWbci4J0XiQ9m0HHUXTy46TvJKXCuVvD+ENKiZhQn
        MGuhgf+CSh5pUzdTNlNCHP6HjCvB7gplNkQeQRIuLwnvADHP+7tRuaA11TuqCkdhpiQqUtekX2q
        WM1USmbnI3REZrlRlAEgDRlSnVg==
X-Received: by 2002:a05:6214:4a4d:b0:63c:8afd:7273 with SMTP id ph13-20020a0562144a4d00b0063c8afd7273mr349405qvb.12.1690217984342;
        Mon, 24 Jul 2023 09:59:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFO7x4sJQe6yNcwbJzHDwKetm24F7RG9qQSBeAxMG+DYnqfAzn8WMDsH6icpFD+s4FFI4gTGA==
X-Received: by 2002:a05:6214:4a4d:b0:63c:8afd:7273 with SMTP id ph13-20020a0562144a4d00b0063c8afd7273mr349393qvb.12.1690217984140;
        Mon, 24 Jul 2023 09:59:44 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id v14-20020a0cdd8e000000b0062ffcda34c6sm3670040qvk.137.2023.07.24.09.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 09:59:43 -0700 (PDT)
Date:   Mon, 24 Jul 2023 12:59:42 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Feedback on Qualcomm's minidump (debug) solution for end user
 device crash
Message-ID: <ZL6t/sZTZBfvSYOm@brian-x1>
References: <0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ linux-arm-kernel list

On Thu, Jul 20, 2023 at 08:32:24PM +0530, Mukesh Ojha wrote:
> Hi Samsung/MTK/Any other SOC vendors,
> 
> This is to bring to your notice that, we (Qualcomm) are working on
> upstreaming our minidump solution which is to address the problem of
> debugging on field device crashes where collecting entire ddr dump
> would not be feasible and collecting minimal data from the ddr would
> help in debug direction or even help in root causing issue.
> 
> We have recently posted v4 version here [1]
> 
> Based on comments[2], community is more worried about, if each SOC
> vendor come up with their own dumping method today or in future and
> whether it can have a common solution to a similar problem faced by
> other SOC vendor.
> 
> We wanted to take your feedback if you also encounter a similar problem
> or maintain something similar solution in downstream which can be
> upstreamed. This will help us in a way to have a common solution in
> upstream.
> 
> [1]
> https://lore.kernel.org/lkml/10dd2ead-758a-89f0-cda4-70ae927269eb@quicinc.com/
> 
> [2]
> https://lore.kernel.org/lkml/CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com/

Adding the main ARM list to solicit feedback from other silicon
manufacturers.

The cover sheet on the v4 patch set is available at:
https://lore.kernel.org/lkml/1687955688-20809-1-git-send-email-quic_mojha@quicinc.com/

Brian

