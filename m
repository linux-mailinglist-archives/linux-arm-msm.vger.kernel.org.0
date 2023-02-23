Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7256A01BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 05:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjBWES7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 23:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbjBWES6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 23:18:58 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68ED166D7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 20:18:56 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id s17so5305371pgv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 20:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qQ9fol+sC+iy0uVWw58Xvr3KUl7w21dyCA+M/nNmtc=;
        b=rNUDxSOtOBiEJq4Me6lx0TC/mCbsEO+oy3qS0m6xblQktIr7bEZa0ftDWOL9NiNUkE
         oQxI86bMJ3rWLIUBCYPc5pgIXxubu59QixW841yfWzHkIjX5rUwLvtf0uOITQYqnau0e
         bUbgUv+abYNp6jaIVlR7iYEiDMNPpezd2VfRhUEwcVBJ61CR3lgSfIuGrwcaVRG2dqKc
         zbGtZOdnJY4SZe+mnrtzTPFATbgAYjWaVL7RMAwrd0mdi9TE1EJxl3EC7rsM3Dp9Snls
         ovqAbn47gpm620cEeecKfTa/4Nkkvtx3QA26K7JRsc38g71Fy7JzczE4GsxZeDP89j65
         0/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qQ9fol+sC+iy0uVWw58Xvr3KUl7w21dyCA+M/nNmtc=;
        b=vIRVrLz7XeMqIVggGsgUpZ3NqoibjoTg3IdeiXgEm1bEZrPp8yCrQ7yIMMg56osLEa
         8CaY8B7iUUyflgT3uOC//27fjx/q53R+OdJUNgLHx532p3CAl9WxnzudSg8g9BMcGhbg
         FBtj6wvJjXM45yXrJQN2Scb/h/vzjmhzQWQhegFpBmOEFkC29OjDZwMTfViqIxwhwDKI
         MyXkWgID8gp5EhJQ76oBAwoldKhbI9UiWqdScJmtr+O+64xRGkYyTc6jtvvcNy11FKze
         zQAEGFOuKL3uHIqiXYIl6fBlp3UD+TnzCk5JpUn/W+pZ3klnYHmEliEx14ZOVizkXaCO
         Dr0w==
X-Gm-Message-State: AO0yUKXOPU8AVLcRvwKbvK65COcFaj930g4grDLuOWIPmMp8BKLGebu8
        LJqpUGu4tFUqdZftQXWI46z0yw==
X-Google-Smtp-Source: AK7set+akWLvAiphfs3iyLo8UAqgRWgvNVeBLkOtdz2bc7GA/+F6UkpetphEtPZ9qpxlckp+szOl0Q==
X-Received: by 2002:aa7:9797:0:b0:5a8:31a1:2f05 with SMTP id o23-20020aa79797000000b005a831a12f05mr10250824pfp.5.1677125936195;
        Wed, 22 Feb 2023 20:18:56 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id x15-20020a62fb0f000000b005d296facfa3sm2742714pfm.36.2023.02.22.20.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:18:55 -0800 (PST)
Date:   Thu, 23 Feb 2023 09:48:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: qcom-hw: add a compatible for
 sa8775p
Message-ID: <20230223041853.2ehczevium2ooid2@vireshk-i7>
References: <20230221150543.283487-1-brgl@bgdev.pl>
 <20230221150543.283487-2-brgl@bgdev.pl>
 <1459c825-d915-c55d-ad1d-4bc590e580a8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459c825-d915-c55d-ad1d-4bc590e580a8@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-02-23, 16:46, Krzysztof Kozlowski wrote:
> On 21/02/2023 16:05, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > 
> > Add the compatible for the cpufreq engine present on sa8775p platforms.
> > 
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied. Thanks.

-- 
viresh
