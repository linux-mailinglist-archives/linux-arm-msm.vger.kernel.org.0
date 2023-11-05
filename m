Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE4F7E140C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Nov 2023 16:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjKEPLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Nov 2023 10:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbjKEPLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Nov 2023 10:11:18 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5659BCC
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Nov 2023 07:11:16 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-66d0252578aso23707286d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Nov 2023 07:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699197075; x=1699801875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tNR9gzwhUkkacWgh1uKn9LVJjKEaq5+Pu5l7LkuMdYM=;
        b=DwHP45SBcUsUJY195JM3qfXVxq+/DJcdcvQsMcM2rDLCqAJnUDXSIOXbZyLOqsxNE0
         FJRbIlR/UiXFUcERQCTBd0ObgWliLOsalWtu/XiKx7/7JtqpA3/3Q4kqycl5s8xqn/zD
         kA3zn9u2qtzI2c9QzVAcsR58AvQ+IfvnxWYQDYBehZssnVCBx5mmU97IGsVrGRQXQiIf
         hZrra0C2MGXiQMCktVjoEVJfaNN5hfWi4cDwxWynbFepjsCLiXlJEYruVIIyWWwHcbNd
         qRD/KnD3SIVHJak4gTYJ4CvgpdFAObke+IPSz9Y3n22mJnTemC6Zy+RrUjFFGsZUhZyK
         Ox9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699197075; x=1699801875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNR9gzwhUkkacWgh1uKn9LVJjKEaq5+Pu5l7LkuMdYM=;
        b=JMjsEqw0DHHqmjWSTeETlBTNU/aWGgBUc1Jbcy+/qvh2QDwG3/4lOCG4BesgqQmALJ
         dZUeDeKGu/WDETUL14ixrrLOs4OhBcJYNDl1YUnHQbVNJFE7CkNzN5N1rhXTG324mpCc
         q92q7f1McvtJDUc16HS2klhvfeQ3riTQksn4nIuls7o8ELPuRGZtRQzDrYp0qzZf78s7
         dwt0ZUSAWlqmDgo4dsVo5n+8ZC5M0eZ7Gcp22gqoO0ikozrE52kgqxdhCrw4gwKTMJTg
         WK/wLZjgXo7T0NKAQ2vKsFJmSZzTrpcii2Ua2X/Lzd7kk5snlG4BhtMqZnjpc8YtUKJ/
         Srqw==
X-Gm-Message-State: AOJu0YyBcTuEJQoCRvUX6e0+8nCdHpOyM7DXwIVd6XN6A3PPJr7viIHM
        6bFw/bX+uyvUkaPA2swgc2A75vNBEzj0pA==
X-Google-Smtp-Source: AGHT+IFPvklZ50nijQ+nGgDBoKWDBwDUQMsPZqT1uGGNdYN9pbgjD8KK0+d3I0wLwwyaC5xbqWAeOg==
X-Received: by 2002:a05:6214:529b:b0:66d:136f:a522 with SMTP id kj27-20020a056214529b00b0066d136fa522mr30455208qvb.26.1699197075173;
        Sun, 05 Nov 2023 07:11:15 -0800 (PST)
Received: from luigi.stachecki.net (pool-96-246-165-101.nycmny.fios.verizon.net. [96.246.165.101])
        by smtp.gmail.com with ESMTPSA id ef19-20020a0562140a7300b0063f88855ef2sm2603903qvb.101.2023.11.05.07.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 07:11:14 -0800 (PST)
Date:   Sun, 5 Nov 2023 10:11:42 -0500
From:   Tyler Stachecki <stachecki.tyler@gmail.com>
To:     mani@kernel.org
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Sierra
 Wireless EM9291
Message-ID: <ZUewrgy0acOUkSAk@luigi.stachecki.net>
References: <20231105150510.96136-1-stachecki.tyler@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105150510.96136-1-stachecki.tyler@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 05, 2023 at 10:05:10AM -0500, Tyler J. Stachecki wrote:
> Add support for the Sierra Wireless EM9291 modem.
> Empirically, it seems to use the same configuration as
> EM9191.
> 
> $ lspci -vv
> 03:00.0 Unassigned class [ff00]: Qualcomm Device 0308
>         Subsystem: Device 18d7:0301
> 
>

Hi Mani,

I just want to highlight "empirically" here. I do not have
access to the IP which confirms proper MHI configuration
here. Given that, not sure it is appropriate for submission
to the kernel.

However, without these changes, AT is not exposed and QMI
submissions time out -- so better than nothing...?

Regards,
Tyler
