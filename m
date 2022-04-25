Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2235E50D766
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 05:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240024AbiDYDNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Apr 2022 23:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240523AbiDYDNd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Apr 2022 23:13:33 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A79751339
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Apr 2022 20:10:28 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id k29so12265244pgm.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Apr 2022 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vETeJvQjX0RH1IGmgZeN4JIryPyrxoAwCmbGuC0BOx0=;
        b=Jmt8TQIIptvoAEOVITJkxviHnCha3FLobEnNYRwKrCE7YNvksMnB9gGc3HGfW2k+Dm
         vU40K9ksXrqP8hBOToCEixzDTkB3Mr8oeUCsB+fgFQb8siFyIb4gGdqHEKArwIjGHpif
         xIyC3KAy0EyMsY4eyiG6Y4dOMf/R60tpRWyJAxXJrRTPlmNC1RMt7zgqa4N4LBa3ALXG
         A/CeHlJbg6ZfgSiIXWGkSvEmpNQLwt0oDEUl6j53VA0BLCGZMW/qhSDFXSkRDnmb+5Iv
         +um/scm1ZhXoAt8JRQoGrInvFNWycjW45iK8CLHli65DRY1SKeLqPtSEx159MX8J8T49
         O/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vETeJvQjX0RH1IGmgZeN4JIryPyrxoAwCmbGuC0BOx0=;
        b=IW3wJ41ck2dnVQfrR3eUm3Q5Pflh4NbMo6fadVF7BoqFNUmACWYv2Dxnndnf59QhzQ
         i3dNRU33nBXOGTdv6lbOIlLnnepPNxztdHzXh1e6s135Z1zvm18GjpSNcMp/u4wfq+Gj
         cctFvp7nD+1wPP/7WazYqRK7bVYkNLc4c6LCiElJd3mM5VEmVdxJwOX2g/82Uyd4kXCo
         iJSw6+DJQu/rehDDzZGiTCilD/+zMvblcfOz9VeGonQ2dKFbJ44DgjDSv0pM2HfUJ6Mv
         p84PBsRXtu0/N90NpnVjKOaA/iZYGdvqhLm/XrbVophtNaP8v/PE645YNhmi5Mj+p1nY
         AsqQ==
X-Gm-Message-State: AOAM532gS7C/ummmkDeZArwR8bgUlGJ37P+77rj2lmVWv/JJXdcjlIw2
        LVSwyfmljExfRezSQSnWhMatMQ==
X-Google-Smtp-Source: ABdhPJzeUPYwdGHfiI4ExfiZee11IlcChs/CBZ/u64f+VZt5b/UCpOtFu1EcibqHAbA0/ZUy2GZehw==
X-Received: by 2002:a65:6e0e:0:b0:399:26d7:a224 with SMTP id bd14-20020a656e0e000000b0039926d7a224mr13375257pgb.437.1650856227663;
        Sun, 24 Apr 2022 20:10:27 -0700 (PDT)
Received: from localhost ([122.171.250.232])
        by smtp.gmail.com with ESMTPSA id k198-20020a633dcf000000b003aa9116ba17sm8023960pga.35.2022.04.24.20.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 20:10:27 -0700 (PDT)
Date:   Mon, 25 Apr 2022 08:40:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v3] cpufreq: qcom-cpufreq-hw: Clear dcvs interrupts
Message-ID: <20220425031024.wzfp6cajlmpkgjcz@vireshk-i7>
References: <20220407200919.3054189-1-vladimir.zapolskiy@linaro.org>
 <c2af9682-f773-8530-9262-edea1dbe595a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2af9682-f773-8530-9262-edea1dbe595a@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-04-22, 22:42, Vladimir Zapolskiy wrote:
> I believe this fix of a critical bug is intended to be included into the next
> release, could you please share your review? Thank you in advance.

I was waiting for Bjorn to Ack it.

-- 
viresh
