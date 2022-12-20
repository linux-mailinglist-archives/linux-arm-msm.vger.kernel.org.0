Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D7E651EE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 11:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbiLTKe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 05:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbiLTKez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 05:34:55 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3C6140D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 02:34:54 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso8407535wmo.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MRqGrDogORIvzuQKinUvsRnqObzw2a6PJ114/D0LBM=;
        b=RScAsEg5ShUKmcfwnPEgrcW1ywjCL6xmpNtbeW0V5D8shhjKV1e6sVyGakzjjS+C5a
         4bNrlp+IMFWGiOmEK0I6ddFFNIvIJC1rMcV58EcWvpNznXgsWHxhSZHHoUNsJkw5JPtg
         Bzvykag/WJ5nI62QYlI5GkeQiIt9g+YoSxcjHmdUbKoB/IwQI9syA3+BUAzHjGrRaS8m
         Nznf6B7bP+0tXAl4HvpP03MWdq8dixirGsJRa+89Z2cmH+S1YYhuNWFuCY1HnJ5EpaCG
         v2XL/VWrosJEjCc7k4LXa9hy9PUS3xYYectv47iUusrJ6HNiItpqnf1A4kyJyau55dZA
         esSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MRqGrDogORIvzuQKinUvsRnqObzw2a6PJ114/D0LBM=;
        b=rnCbTi2nsE8UmWON4RUFRFf6FTk8JXUAiVqEmgr6kMiOmp7o1xhOchTLX1ZqsPFocN
         enKg6MDpUTqclEitllmJq2UtP/r6ZTPCDQZjzbDtdGBHgH9eEskDR9LR5DFNX2tArhyn
         NrJKXZnwu0Z2jW2NbVyY4hlxYNSI0gVhkLbIQw1AgslXjW4xnLnjEGoF6VlV6eYeCQy4
         jfNgCjgkKsOvtDigue/sf/hhPZaqxGVw8ljW3QisKC1bk9/dEg87jIEWYumUr5CrO0Vm
         rLAe/yuJ7890DcI10s12jP0ZLR+A0mAXb0x5EuCfEN65bm0ebD8XbcqTf7YSG9+MM784
         +l4A==
X-Gm-Message-State: ANoB5pn8tVgVMhoHLIiFgZaJAHI7W0lWBeGgSe2+YzDhJHrv41wydzoa
        4JufyXRaH6aFtyCeKfGsauE1mruR481+PiE5RF8=
X-Google-Smtp-Source: AA0mqf6zcKoN8gsrwpHNaTLEuKUV/54WPq7fKPuj1TqzhNlLnaXICeXQT9Jbn2XF61VY8WuVXFBwFg==
X-Received: by 2002:a05:600c:1ca3:b0:3d2:2101:1f54 with SMTP id k35-20020a05600c1ca300b003d221011f54mr25398939wms.4.1671532493017;
        Tue, 20 Dec 2022 02:34:53 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b003cf483ee8e0sm25487063wmo.24.2022.12.20.02.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 02:34:52 -0800 (PST)
Message-ID: <2ddd32c8-b69c-0da9-af5c-22a8cb8eaaf0@linaro.org>
Date:   Tue, 20 Dec 2022 10:34:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 08/15] thermal/drivers/tsens: Drop single-cell code for
 msm8939
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
References: <20221220024721.947147-1-dmitry.baryshkov@linaro.org>
 <20221220024721.947147-9-dmitry.baryshkov@linaro.org>
 <78fd7174-9aa4-f067-72ca-514c8fb09ee5@linaro.org>
 <d0a6b9cb-f321-7d5b-5767-acd12cfd78f1@linaro.org>
 <5bd2c0cd-741c-8865-5f35-25baf6787480@nexus-software.ie>
 <5f4046df-906b-5673-81b9-ab37294ba443@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5f4046df-906b-5673-81b9-ab37294ba443@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/12/2022 10:32, Konrad Dybcio wrote:
> Mainline does not and will not (for the most part) care about
> out of tree code, so cleanups of parts like this with no users
> are wholly expected if your DT hasn't landed upstream (or has been
> stuck in review for a long long time like it is the case with
> various parts of 8939).. Keeping this old iteration is blocking
> progress, as the other similar ones (that*do*  have mainline users)
> are left in place just to be backwards compatible with old DTs
> that may have been pulled from torvalds/linux by third party projects,
> like U-Boot, *BSDs or something. Trimming away this now-duplicated
> code will shrink the driver, reducing bloat for everyone that
> compiles it in and doesn't use the 8939-specific path.

I entirely take your point on duration Konrad but, I think we can be 
just a little more pragmatic and hold off on dropping working code and 
land the dtsi.

We went to the trouble of upstreaming the enabling code for the 8939, 
the right thing to do, IMO is to finish off the job.

---
bod
