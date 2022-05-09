Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF65F520319
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 19:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239418AbiEIRFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 13:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239344AbiEIRFu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 13:05:50 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A4C17B84F
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 10:01:54 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id j10-20020a17090a94ca00b001dd2131159aso2375566pjw.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 10:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=drmB4B/KeU3fHWFx597AR+Yu/A5DLZU91oSasUCiT7U=;
        b=m1NE+UqwuE2JCokeZ/4NnYbjGBL1hDxABFvO2l9oOixcazovqQf/zz8Azbq0eOo08J
         9dzO0LDQi8DcPKmus+QALfQFs0j7JWEjW73jBqepNzASDsb+O4TuxSoCEZsPZQzE+9Dw
         4mMPzh0cj0SqCkhby2T4QPSK84JFJbmhvDa44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=drmB4B/KeU3fHWFx597AR+Yu/A5DLZU91oSasUCiT7U=;
        b=WyIghaOR4IE7+N5U1AN8B3oYYwY3HFaaDO4ddA7SPs2uXyMttWStfcLPXKTiyg0omJ
         miIHaz8SxwXLkNHAvjwGhIm9a6Tg94hCoW1u91CJIzb3MtoROY6uzqWZmuy3TjjhAByz
         ggDk0B4PmCyzCA94wKdCKv2jDpuIIuBGuZ8tMHkIIG6DcKiLsrrOx7bTByqeyjWYTZTj
         M8tCcdulbLekkDbvGD62RGFcp5pvBXDxYUGTym5JoatMM20Nfvdhuu5/Lgk2hdkChGMI
         gnH2rmk7lQW+5Gnfl9sBNNsjtb+OkQ3WqF2O9RZM1Bw09+SVhhsJTcG9lIaxCOcHUPq9
         XBxg==
X-Gm-Message-State: AOAM5314gk5gd36Gew9n1RVzqxZMJtVblfsbPHaSHjfefqVa/Uy1LXSH
        lFUsZPMMhkMjKxv5Foh8GrKJJA==
X-Google-Smtp-Source: ABdhPJzFx4RkUX7Re2fQ5VjSd7jPNvjGhUPAVnsG831dSlxazJfNq6euXwx81V8mDUA9ZdihKUhLDw==
X-Received: by 2002:a17:90b:1642:b0:1dc:6419:43ff with SMTP id il2-20020a17090b164200b001dc641943ffmr19092455pjb.229.1652115713987;
        Mon, 09 May 2022 10:01:53 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:753:614a:caf8:e14d])
        by smtp.gmail.com with UTF8SMTPSA id cq17-20020a17090af99100b001cd4989fec9sm12854513pjb.21.2022.05.09.10.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 10:01:53 -0700 (PDT)
Date:   Mon, 9 May 2022 10:01:51 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sboyd@kernel.org, agross@kernel.org,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH] remoteproc: sysmon: Wait for SSCTL service to come up
Message-ID: <YnlI/9i1C720mgAX@google.com>
References: <1652065867-5669-1-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1652065867-5669-1-git-send-email-quic_sibis@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 09, 2022 at 08:41:07AM +0530, Sibi Sankar wrote:
> The SSCTL service comes up after a finite time when the remote Q6 comes
> out of reset. Any graceful shutdowns requested during this period will
> be a NOP and abrupt tearing down of the glink channel might lead to pending
> transactions on the remote Q6 side and will ultimately lead to a fatal
> error. Fix this by waiting for the SSCTL service when a graceful shutdown
> is requested.
> 
> Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
