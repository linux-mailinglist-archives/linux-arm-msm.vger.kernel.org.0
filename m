Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A19A666981
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 04:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235581AbjALDQ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 22:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbjALDQ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 22:16:26 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FF3DECE
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 19:16:25 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id 200so6704921pfx.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 19:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vLgPPN/4BKYUAbBjp/lumqd5Fur98RZfMwe+XyGuCwQ=;
        b=bjXrKiCPcZ1mnQB/Agf1ffHwErEiwRmfS6XnouNbhPpnaIuZaCD09u1ys66wou6XEw
         aaPN9EXY0LAew2P3ohjpZskr5qgSGp3QaLiFdo16ELAMQe1VMt2aDRFOXNSQHo3pLGL8
         uhqGa2RHwvcDX/6hf9PzbxTyGzLpCINmbGeTT91OqvzD4gSMnKgoriAVNyN5ZvivE85/
         AGSowIYMVw6BgLRHWI0MWlNIA6Bhoot5jzNw319eFU6V/CTTG7vSIb3sV5D2EGdjEurl
         oMsTt2sAycgXCq3NPWK5lv9Xp3FO+pLxWSEwZLtNwqG3lIi8OA9g5y3VEmmE4xN1LRUO
         xkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLgPPN/4BKYUAbBjp/lumqd5Fur98RZfMwe+XyGuCwQ=;
        b=d4bScz+ye9aZyOC0Hize96MWmyCPIbydxkiDIoWzGz6Qed6GG5OM71uGjV6OjFgwBJ
         3f0wFfvHMt0HGUD/kWLX0r0dhyMSQRfKbDqmcfGO1ZRRhb33vffY9n5xGSc7uGtVqPTP
         lBgiMBo+hcnA4UqIJYTzay3JhVidnMtsyN53WS92oYrCVI8kbIBb3t+vi7sV5gmytYH8
         hr8X4vBeUOpVXecW4ovyZ/fRQmTazHixpdLXvEvfj1/M/fLNM6whflJiwFj1yqW8ntZh
         lqp/bp04Ei3bRLYgVrS/ourKqqvDV7MYf0NSNe3GwD5vwyCzK9X+FOAQCfAWA7+Z7nso
         LZMQ==
X-Gm-Message-State: AFqh2krtcgyDCJZdOwtkgItGsRdhYu8zZeRzwNWKqP/cxECctzFYxG+k
        XOtaAAM4lNovp9hrQp4B2hQ5Y+PiFj81zz1l
X-Google-Smtp-Source: AMrXdXu0yK+AtehwqkneInZrjlawWZChNyitggarUNAuCygfbreHfMWSkCNhz90t8Dh3rmThDleTEA==
X-Received: by 2002:a62:38d8:0:b0:588:4739:9a23 with SMTP id f207-20020a6238d8000000b0058847399a23mr12688063pfa.15.1673493384626;
        Wed, 11 Jan 2023 19:16:24 -0800 (PST)
Received: from localhost ([122.172.82.107])
        by smtp.gmail.com with ESMTPSA id 63-20020a621942000000b0056d98e359a5sm10660750pfz.165.2023.01.11.19.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 19:16:23 -0800 (PST)
Date:   Thu, 12 Jan 2023 08:46:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: cpufreq: cpufreq-qcom-hw: Add missing
 compatibles
Message-ID: <20230112031621.rphz4zu63ibul374@vireshk-i7>
References: <20221016090035.565350-1-luca@z3ntu.xyz>
 <4899603.LvFx2qVVIh@g550jk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4899603.LvFx2qVVIh@g550jk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-01-23, 20:48, Luca Weiss wrote:
> Hi Viresh,
> 
> gentle bump, I hope this patch could get applied in-time for the next merge 
> window.

I thought Bjorn applied this patch long back. But now that I look back
at his email, he applied 2/5 and replied to 1/5, probably because
there wasn't a cover-letter available :(

Sorry for the confusion, applied now.

-- 
viresh
