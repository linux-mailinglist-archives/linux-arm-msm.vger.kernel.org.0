Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C95F5BD5C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 22:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiISUkp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 16:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiISUkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 16:40:43 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0D845F75
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 13:40:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id f23so324972plr.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 13:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=/Stmq8yFlzyGsVydt7vXujqOluZq1bXgQOGENaoRM1M=;
        b=sn+iFM+jjtdYh5vMPtsJ019GP5VGQ7bSvKY+iq4KEkqk/4bwFJt0ZBSAmapLsjnCV3
         2orjTNeOC74BpzOrH7PzJONDb40z9Ph5EJsMCXBl3g5js28Mas8NDNBWvFRzKAHcz+Z4
         KadTCClFhiGHMDdQ5rR+IAhEKKabIVCXS/lt136Zp3CI6o9vbFlwlGEElO+2QZCQ4l0d
         sxgZUIMbu8Y3btOlvZZOyAIsfqvwxXwErJ34zSR0JLIQWaT/s5nEzoWaYD0fKIugLV6L
         3BLN4WoaJHrnxbbACYQBalNNe9qGkOKtLVkRNincXAMrhxCcZn/bo/0xMNOBo+3/ZaoD
         1Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=/Stmq8yFlzyGsVydt7vXujqOluZq1bXgQOGENaoRM1M=;
        b=7HZIkRhcYeR4rtRAvGIywSyJykVCfhUz0OQNLdO/C69moCe7rqHdHZJ2dzRLmcI22r
         UomhETLZQ3B/dlGwQotJMVu/bXhjrRbNU64AOpsyvKXbD0X2FvnXy1B1ksGLRCMezxqm
         ZyF0VZtPbdj6P2yLFQR1wck25/A/gbeFwDMdH5g7eze1aYYw83mfoC+RkU37dItxGvyq
         ljanelsMAgMHI8LoYQ+llUP6KKXo3KAcGIc9Gtu9Ul/mxUbZhLvziggz3159mLaerRdm
         UnKPsLjxvN9iNx7yKjK0oSr4oMLZMJg8XZaaeWDaeWd/wX8VsrGQlWrruv0/TENDvjge
         N7HQ==
X-Gm-Message-State: ACrzQf0Q64gVQ/fHvNuRaMFPHJYkBpNLOxIBuWX3/bh+RT3AvA0yXTIB
        7fKwGqwkQCKPHzjdvXFOpWUO1g==
X-Google-Smtp-Source: AMsMyM46srhSD2BUG3nOCVVNRgjK8euLz89d3A2QF7ddIMd9iEsY9lvzSI5XW9UrTV2t8kzDK9RIlg==
X-Received: by 2002:a17:903:18d:b0:178:28d1:4a13 with SMTP id z13-20020a170903018d00b0017828d14a13mr1512305plg.160.1663620041878;
        Mon, 19 Sep 2022 13:40:41 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b6-20020a170903228600b0017693bb573bsm21154389plh.219.2022.09.19.13.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 13:40:41 -0700 (PDT)
Date:   Mon, 19 Sep 2022 14:40:38 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Deepak Kumar Singh <quic_deesin@quicinc.com>
Cc:     bjorn.andersson@linaro.org, arnaud.pouliquen@foss.st.com,
        swboyd@chromium.org, quic_clew@quicinc.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V4 0/2] rpmsg_char/ctrl driver fixes
Message-ID: <20220919204038.GF759648@p14s>
References: <1663584840-15762-1-git-send-email-quic_deesin@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1663584840-15762-1-git-send-email-quic_deesin@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 19, 2022 at 04:23:58PM +0530, Deepak Kumar Singh wrote:
> Change from v4:
> Corrcted mistaked in commit message for patch2.
> 
> Deepak Kumar Singh (2):
>   rpmsg: glink: Add lock to avoid race when rpmsg device is released
>   rpmsg: glink: Add lock to rpmsg_ctrldev_remove
>

Why does 'glink' still shows up in this cover letter and the version number wrong?


>  drivers/rpmsg/rpmsg_char.c | 8 ++++++++
>  drivers/rpmsg/rpmsg_ctrl.c | 2 ++
>  2 files changed, 10 insertions(+)
> 
> -- 
> 2.7.4
> 
