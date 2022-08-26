Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033E55A2DE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 19:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344836AbiHZR4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 13:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233026AbiHZR4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 13:56:15 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A235AA0D
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 10:56:14 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id c24so1997496pgg.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 10:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=s2OQM5wbWqcKorod81nrfXmoPE5ckWz/2v8cDcxZmjw=;
        b=cHtms6uldhFgAdhyroZC28BoR2Z9D4tJgjcU8I1RsyZLDiXbC+jiwPKFRXZT89RDFu
         jHJEYqEakoS41AebuIaT865cjaYDdMWiQqEF2fu0SvmsQFpLPnZGCg1t/5CTMIj69jgx
         meV2KxVD6LC7GBXyyqPhmMaoKYjdd0Q34EEuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=s2OQM5wbWqcKorod81nrfXmoPE5ckWz/2v8cDcxZmjw=;
        b=DIXoyc5r2Orhwi0jqzFFnLNPuIafD21Xw6e2DW+qeZQdR7mtdLMs1vuj7AM1v/apkl
         YKJkSTPsiBHh316xBixCfEGryoCu1T2b8Bfve4V3+rvMSjfsNtNV7guU/ciW6loFZduu
         gKDZLKZOZtfwM5Uz8PpE7XM17eFt3itvSRSuqGxTh6kAj5rBZyIuc0QnGToMnR26rgIN
         rug8IC8QyyuerI7gCg2mjsdp7vzBRap6zyforRnfU+NKsgwJ7+mW8lOSdnwl1LSiIF7L
         CUg+HLXfD+cIjqD3ylu7xi4+IYeb3OKZtEJxTXSQ5n7IeZZFhtXvQf03XprBHKjM486/
         oB1w==
X-Gm-Message-State: ACgBeo25ZhuiWXN5npomErnSCreVPgwF9cqiklU2XX53M3X1f1DZRu/P
        XQUDlmr46YukWcIoPC1R9Zc3rg==
X-Google-Smtp-Source: AA6agR4xebSi1UcWrB3U3dNgI0VzoEHaJu7amV12f5ZsomUpNDzaYMCxQNeX0SmH7TR6xXEgq7x/QQ==
X-Received: by 2002:a05:6a00:1910:b0:52f:13d7:44c4 with SMTP id y16-20020a056a00191000b0052f13d744c4mr4760510pfi.32.1661536573759;
        Fri, 26 Aug 2022 10:56:13 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:87ff:bd4c:214b:f283])
        by smtp.gmail.com with UTF8SMTPSA id y190-20020a6232c7000000b00537d2bb8d48sm1417175pfy.74.2022.08.26.10.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 10:56:13 -0700 (PDT)
Date:   Fri, 26 Aug 2022 10:56:12 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] opp: Expose voltage info in debugfs for OPPs w/out
 explicit regulators
Message-ID: <YwkJPMaDjhHtEx2O@google.com>
References: <20220826075655.1.I2e4958048f30c3b44a01e31519092f7d3c9204e4@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220826075655.1.I2e4958048f30c3b44a01e31519092f7d3c9204e4@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 26, 2022 at 07:56:59AM -0700, Douglas Anderson wrote:
> On some cpufreq drivers we know the voltage associated with each
> operating point but there is no explicit Linux "regulator" present. An
> example is "qcom-cpufreq-hw.c". There the voltage is managed
> automatically by the hardware but we still associate it with the OPP
> table so we can do energy calculations for EAS.
> 
> The OPP framework handles this in general. In _opp_allocate() it can
> be seen that we always allocate space for one supply even if
> "regulator_count" is 0.
> 
> Let's handle this properly in debugfs.
> 
> NOTE: as a side effect of this a whole bunch of OPPs in the system may
> get supply-related files exposed in debugfs that are mostly useless
> (they'll just contain 0). I'd expect this to be OK but it's moderately
> annoying. It seems better than trying to dynamically create debugfs
> directories when the voltages are non-zero or adding extra complexity
> in the code giving a hint to the OPP framework that voltages should be
> exposed.
> 
> After this patch, on a sc7180-trogdor class device I can see voltages
> for the CPU OPPs under /sys/kernel/debug/opp.
> 
> Fixes: dfbe4678d709 ("PM / OPP: Add infrastructure to manage multiple regulators")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
