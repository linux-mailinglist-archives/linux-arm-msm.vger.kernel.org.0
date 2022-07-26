Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9429958192B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 19:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239751AbiGZRwp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 13:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239828AbiGZRwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 13:52:19 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB9331230
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 10:51:21 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id w7so13979887ply.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F+HDDqObfng+U02lfgXmn7OnwfgF8WXJW/VqBzOllp0=;
        b=a6C/xNGkJ/tlLE0z3lbgDiMjtLnG5+Pk8v16J19Ed/b/HkF9kRw3644iZJI3sVXXck
         K3unqotJOeqeBY1NWvUL99rUbwAEe2NSwXyXfqZneH2ZKVcfSeOjISAgzCC9BNWZ4Vp7
         kAGl8zXGFWT0O8NqB88HQboq76Vwk5/sZehKLY2wxOUgEVDp7Eo3v2fvf4EgTVQ03c4A
         WDTxcq7JmkkWldjlEBbX3TdMeuI0HZr/gSl4uCbcXlZ/4CMsSryEleWhwBPADIHZoXyE
         +rIJe5O4oaHfAFT/JN2b7wz3cJeEiJ1JFIxx3+SMH0oQ4UT9nuXcZF5HDFTICDn8LS7X
         dIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F+HDDqObfng+U02lfgXmn7OnwfgF8WXJW/VqBzOllp0=;
        b=noI8VuZakEN1RYkSVQHFWNw4LfwamwH+yexz6+AuGsFVgY8J0QJF6hqIIz8g1RY0QF
         78D+ZUu7lWmRbvB5I4xjon/K2zIYH2BKQmDw/lNROlz/uYRJn0LCUJB5Lk/4DHd7Md/p
         C5VnAXp7XqJaBBRGuKNYsIn/O425vSfuiLMUOAbJlJ1k0nohHB/kvvMkfaIk5DCjEDH4
         0Xf0/CVle46QQOnHKJE+Mz/PJ3CebxLpdZBdsZlTdQ+m1YLkoq7lwGgnP/D4RqtP3vJp
         M9I9++z6jJ4UCzErcaHfGoMzr8Yh1rdr26pfm5d4KbohqKwFOdOvPoXgxxiyUKHtsEDb
         /oag==
X-Gm-Message-State: AJIora+MSKd/cSsw8Zfsh3WZeP0vJ6kzxbh+uOzl2DqhIBSA0rnJzvpc
        Tm9F0PjengRrm6RBf1xamw62+9byCzahYA==
X-Google-Smtp-Source: AGRyM1vurTC/JCeOvm1bUkvKqz4rp09POmCMcQQSmIeCIse22BpyedlKrRuhQ2C9xQoqLCGZAWCFRw==
X-Received: by 2002:a17:903:20e:b0:16d:4d0b:5408 with SMTP id r14-20020a170903020e00b0016d4d0b5408mr17552661plh.161.1658857881433;
        Tue, 26 Jul 2022 10:51:21 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d2c100b0016a565f3f34sm12010223plc.168.2022.07.26.10.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 10:51:20 -0700 (PDT)
Date:   Tue, 26 Jul 2022 11:51:18 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Chris Lew <quic_clew@quicinc.com>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Introduction of rpmsg_rx_done
Message-ID: <20220726175118.GA113917@p14s>
References: <1654651005-15475-1-git-send-email-quic_clew@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654651005-15475-1-git-send-email-quic_clew@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 07, 2022 at 06:16:41PM -0700, Chris Lew wrote:
> This series proposes an implementation for the rpmsg framework to do
> deferred cleanup of buffers provided in the rx callback. The current
> implementation assumes that the client is done with the buffer after
> returning from the rx callback.
> 
> In some cases where the data size is large, the client may want to
> avoid copying the data in the rx callback for later processing. This
> series proposes two new facilities for signaling that they want to
> hold on to a buffer after the rx callback.
> They are:
>  - New API rpmsg_rx_done() to tell the rpmsg framework the client is
>    done with the buffer
>  - New return codes for the rx callback to signal that the client will
>    hold onto a buffer and later call rpmsg_rx_done()
> 
> This series implements the qcom_glink_native backend for these new
> facilities.
>  
> Chris Lew (4):
>   rpmsg: core: Add rx done hooks
>   rpmsg: char: Add support to use rpmsg_rx_done
>   rpmsg: glink: Try to send rx done in irq
>   rpmsg: glink: Add support for rpmsg_rx_done
> 
>  drivers/rpmsg/qcom_glink_native.c | 112 ++++++++++++++++++++++++++++++--------
>  drivers/rpmsg/rpmsg_char.c        |  50 ++++++++++++++++-
>  drivers/rpmsg/rpmsg_core.c        |  20 +++++++
>  drivers/rpmsg/rpmsg_internal.h    |   1 +
>  include/linux/rpmsg.h             |  24 ++++++++
>  5 files changed, 183 insertions(+), 24 deletions(-)

I have started reviewing this set.  Comments to come later today or tomorrow.

Thanks,
Mathieu

> 
> -- 
> 2.7.4
> 
