Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86D93794572
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 23:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjIFVy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 17:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjIFVy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 17:54:27 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A8419B5
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 14:54:23 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5007abb15e9so435429e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694037261; x=1694642061; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/cOj9Q0GUj97eQPpIlNz2VDt48sU68k3aZtrr+hpuk=;
        b=NXxZdsWr9Vt2Pjpx7HNdidjMQ3mt7fyPdDe1q8nZ8TlJHEjO1q3oZTkGzaI0tgnlE+
         xMSCZIdvxf5XkE/T43UMTzeKqJC6O470F0AUFvT0w6+EZcFHbnOoJBgdz76WypCzSwJq
         DE5Jeqqs/0O7JDCLOGi0AuWPEco8OijY40S3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694037261; x=1694642061;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/cOj9Q0GUj97eQPpIlNz2VDt48sU68k3aZtrr+hpuk=;
        b=atXZm0s63b9HuoY03ELSXImb2h3gHCRgNizwah0noJ4R251ZeAEe55JpMAtRZ0QysU
         ML4UirWgQhdt5IiPoABRqHS4YMAnUv3BoiCgMpFo6osqYvCz/BRjVwxfkYerw0PruDNU
         sNkl5NDc62cVkvjz1NKijUg4i9OS4po40SsRZSH72BGJC3o2tdgLIoco1GiFMqK+4fl4
         RWkY29ZFUJCjm6j9vuB9ADWQf2GCXk8E4FEVVQjFB/i2/9k1MC7ae+xAqy5lvEGGjspm
         YcLM6x6DSxp8VtxbmT7idGRRHl4dN6/oy+l3qL+HG1+1QVXeV4MWE/4aWBFLFGUStR9z
         jTYA==
X-Gm-Message-State: AOJu0YyH0evZ3w7ZK8fVUuYK+Qojgvay8WuVvv35nTUh7pUh3CrejUcc
        UNZIOd67pukUFrs4do8BATiFeeQbKq4iNVXbBPO3pA==
X-Google-Smtp-Source: AGHT+IGXEYQwSmCl4dKdeY9V+gR3MIjglme5MGP+iBVm4TEGUm6JjAd1CBrovJy6qUN+sXnPG36Am8fUTFYgiyGfd1o=
X-Received: by 2002:a05:6512:3c8b:b0:4f6:3677:54e with SMTP id
 h11-20020a0565123c8b00b004f63677054emr3816276lfv.36.1694037261406; Wed, 06
 Sep 2023 14:54:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:54:21 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-3-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org> <20230904020454.2945667-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 16:54:21 -0500
Message-ID: <CAE-0n505YyrVi=5TYvYJzwfvNmsxDT_MaR5KPefDAbn3vvhdOQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] drm/msm/dpu: enable PINGPONG TE operations only
 when supported by HW
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-03 19:04:48)
> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> Rather than checking for the flag, check for the presense of the

s/presense/presence/

> corresponding interrupt line.

The patch checks for the major version though?
