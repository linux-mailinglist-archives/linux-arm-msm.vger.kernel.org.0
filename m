Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3199A4AEB77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 08:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239665AbiBIHuh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 02:50:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239567AbiBIHug (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 02:50:36 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A092DC05CB84
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 23:50:39 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id a11-20020a17090a740b00b001b8b506c42fso4429372pjg.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 23:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QqKVxwbotUmQ2gv29/Ifw62O6CKJJcLZd1ZfJrEloTs=;
        b=YrWjB/wG3IOXIY6Z8JgawTYjBigvmgVdhNxoOC6JtZGS5wUpjHQMgB8hEh4plHCPcv
         jXcTLiXf2wgz3aDWwUYjVnjMQcuvAMTQiQJNRfbXibWcRZ9Kv++RjTlx5YFTSOnHIYCI
         oNJ1TZTXbkrwPGJGBbV4w6V+55Xk5lr0LnZkfb9Eg4H5E2oWF+4BOGo+CBdd9i9Erhtw
         aTqSz8gPPgG/JPNCDBtztu0KB3Q3Lxckl1pEL0SxI8RlzGXh6Q9eqQr1MIPZ8mq7WTGj
         WLnb9xw0aaeTmQfF3tiQ7PuwYsAYMasTK/AnTWXxnNkryOLnOecnydN+r4mazZFP9SmW
         N0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QqKVxwbotUmQ2gv29/Ifw62O6CKJJcLZd1ZfJrEloTs=;
        b=fO1UsiYZiww8bXVEge5AM+Ux82/UOJoSCdkelMCyWnAV4V70q7nIcFqYM3jv5CVil1
         KVqsgFWpnFbFBr74ptJXUWCcrUOq0H3Z5C+35ZEEatcVd33Ri5b+d6dLiTag94aLfvFq
         +Vmh/OhbdgRaLWdCehG1SsZnVKR/6wQ9eBAbXkX96ox3IhD3TF/R+VceDfTn+3kd0T1h
         B6MxcOpJrtBH7ErUkesokqITh6+XK1lAumaxAAGllANKTeB5mqCI4DTuYOx7OhYWhqRm
         uk4Eh/0Y4p/gPerYE2YZJgGUaaovwDI5ObggQuJPiD3H7gVZPB+D+54rQpqZWZWMeqdX
         Iqcg==
X-Gm-Message-State: AOAM531Nw4VBSbp7A3gtzMTX5ofX+LBKtUXXxFgr3vZn62R2PoAt1jfH
        bl+q/e9i3w9IRKlR7K6LhAuBfDtTrh8GLA==
X-Google-Smtp-Source: ABdhPJxHZmmgiaaNf2b9aVXUBOyF81jNaxOQCqlMvp4GxTrwPFzrUzWX5hCSHHRS8CqFK6TypgkHHg==
X-Received: by 2002:a17:902:9694:: with SMTP id n20mr992799plp.125.1644393038849;
        Tue, 08 Feb 2022 23:50:38 -0800 (PST)
Received: from localhost ([136.185.132.167])
        by smtp.gmail.com with ESMTPSA id p1sm19731256pfh.98.2022.02.08.23.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 23:50:38 -0800 (PST)
Date:   Wed, 9 Feb 2022 13:20:36 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] cpufreq: Reintroduce ready() callback
Message-ID: <20220209075036.rpgzynwyjnfkbsbz@vireshk-i7>
References: <20220128032554.155132-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128032554.155132-1-bjorn.andersson@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-01-22, 19:25, Bjorn Andersson wrote:
> This effectively revert '4bf8e582119e ("cpufreq: Remove ready()
> callback")' (except the Chinese translation), in order to reintroduce
> the ready callback.

I have added the Chinese translation back and applied both patches. Thanks.

-- 
viresh
