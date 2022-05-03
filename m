Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 134D8517ECF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 09:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbiECH0o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 03:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbiECH0g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 03:26:36 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9DE393C2
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 00:23:01 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id c11so4041646plg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 00:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYOKOnX/ag89Q7FWf4mTvhnDEvPe9ePWto1EYZGs+OQ=;
        b=kJL+2m3UswGuMwUa2ADnBKx9k7XiM5W2DhfJJnyiYigWx/2+gpJi9pNp+p5CwvOkpJ
         VUs9E5GM/VNuRj1ZxO3KHDcQDVZ/O7X1IQTsVeiD6MMn+j7VYSU0CRis9H7/hjkkpL4s
         oXCheS3gL/+nL90EFP4hNrVHEIc+hFzauf2IHKpXBZe1VylWQJRily8n9UdrzAIvTr0H
         OTZGXUk1E0WqjSRV3FVBRhf8r/mlL4/IMfyAF+5X0eLOyyWaiHrpT/q08sNGvSH5LI4g
         A/wd7jyOlLmL2UMjYCalSQaZzL2YMi50+eCTCQdcE2A9V8pxHd68kL7swWWc1y6oZvq6
         Hz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYOKOnX/ag89Q7FWf4mTvhnDEvPe9ePWto1EYZGs+OQ=;
        b=YV6elPdCDY9w0sZyaOHvWcAe3rKUm9U337nsPqMMWchMicOuKXdSrvgX/P5v8vbWDb
         B4wLwJ4ckXlz8Zjo0HP6KE6Lc3sjJ4G9VuvVIOaLQ1xrZP7t/xUmOeaTSJGsyUdUVquD
         YVq2/sBS7p0hOYFRxfSinwziFXItCp6DhMyy/3LRg/otkMYcMxoR4cagXJq3VTz6GFvd
         GKcWXu38XEI2Ej9HeqVPcyKV0fOCopqWAcUxFqxzo2M87Yvgn73cqO7+dsTyXYfsvRml
         yvAEHwID9s8ayQzUKHN8J84TJiBSPuUZLJB2+hAeYqQFL6OYkHIfmj2lSU6SKFd+kjN7
         Jl5g==
X-Gm-Message-State: AOAM530/00tlhOUtIw+n98GCZo7P20fQcHH1VPsns1nsYNMjp0HnVZCx
        7JnRABsx4JQTLnUP3BBlYlz407HLx3KwcifYfGfRZA==
X-Google-Smtp-Source: ABdhPJw1s1JswARQvRGebofKaxoOTfTVyYJCUT38LUSf+snPURnEtm8yFrO3id35Fi7bWxmtCBqqpDNYEc7nKS57z0E=
X-Received: by 2002:a17:902:70cb:b0:158:424e:a657 with SMTP id
 l11-20020a17090270cb00b00158424ea657mr15285007plt.6.1651562580619; Tue, 03
 May 2022 00:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220503024349.4486-1-slark_xiao@163.com>
In-Reply-To: <20220503024349.4486-1-slark_xiao@163.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 3 May 2022 09:22:24 +0200
Message-ID: <CAMZdPi-F96cLTXjCvVEQ7udpbk7KOBsqpMD3E03bE_A+Pkx8JA@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: host: Add support for Foxconn T99W373 and T99W368
To:     Slark Xiao <slark_xiao@163.com>
Cc:     mani@kernel.org, quic_hemantk@quicinc.com,
        gregkh@linuxfoundation.org, bbhatt@codeaurora.org,
        christophe.jaillet@wanadoo.fr, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 3 May 2022 at 05:03, Slark Xiao <slark_xiao@163.com> wrote:
>
> Product's enumeration align with previous Foxconn
> SDX55, so T99W373(SDX62)/T99W368(SDX65) would use
>  the same config as Foxconn SDX55.
> Remove fw and edl for this new commit.
>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
