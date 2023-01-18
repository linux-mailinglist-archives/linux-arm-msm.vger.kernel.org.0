Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC9B6716E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbjARJBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjARI7O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:59:14 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80E7302BD
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:55 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so817594wml.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gz5h+vJjfOWM/uEiomFxc7+iCmKc7eRtuPQJKKTZbWM=;
        b=QJrEpoqixwQM6vnMx4h6cZv3F98kChe+jrTvQ4V5cUrc9k4BJ7lMc+u1oc5q4ZA1fp
         e9kBqb2rXlp8G7KC8WSHBumNDz4OqWIU239Y19LMUyxQyKyBkk0DhgFrh1Cs2xvBFWKK
         LcFYkGWn14nu38RNpHP15Lud2/1Ow5hd376MTZb1BE3PfZUgbWBcktdruZ44Hr8FCU43
         ANkS+pM15E9neV9eosSrFlQuZq9vmKIhnXeza4oOsBams/iEzQH3EJu8qhzIMXHRoAM6
         ylqXujYliP9RKqRryd5774nHIay72RDH+ogwzk88748Z8MiWymiynidOvNScv99OrWTj
         VdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gz5h+vJjfOWM/uEiomFxc7+iCmKc7eRtuPQJKKTZbWM=;
        b=M/7Tgwujv9Clg/VL0fmoysdwXuW4tKluyjrjMwXXHOf4MJ4KUzjIvF4tFkCHTnCDgv
         aXRD1tT+UdTdYiylLCAojiJvN0lZIs0P4BSecEuMpKcRjQNRfK8JGV4fkMrYb3kel2WE
         KCJLFvM6LSytKg1KQh1cKlnOqFN0IEuogWjTmRMT6tqRoLyPr/g3HBYOvNM+x2l9vhhY
         6JeMElazcbESIxKYudae6Y0O/mfAvrpR8yxDkfpeikFRD2zrFjbahTF2bt3ECvIkwGPK
         TJm8fyvIGyW4DXHZWGRB7eN/5gtWQjLyd0UiXlwLBPlv3vDq9z8w9cXNlLIiIPDMWpC8
         M+vA==
X-Gm-Message-State: AFqh2ko/ibl629m/4GSFB5GsEFa/X8xlTDfbiaOuNwHMOaCg4GUJMv0K
        oaN42Uithg2mDxa3ruc9102wvA==
X-Google-Smtp-Source: AMrXdXugdI1ww5+jZoIH7/qU3LlOJjEY0qfUwA46mESDN+nJ4DwAOPC0kpKUrSHXyMZ8acumhN4BkQ==
X-Received: by 2002:a1c:f307:0:b0:3d2:3f55:f757 with SMTP id q7-20020a1cf307000000b003d23f55f757mr5704124wmq.20.1674029874240;
        Wed, 18 Jan 2023 00:17:54 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id t2-20020a1c7702000000b003d995a704fdsm1176177wmi.33.2023.01.18.00.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 00:17:53 -0800 (PST)
Message-ID: <c2b36868-f59f-0133-701d-6a96069edd22@linaro.org>
Date:   Wed, 18 Jan 2023 09:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/1] thermal: qcom-spmi-adc-tm5: Use asm intead of
 asm-generic
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@linexp.org>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
References: <20230103145339.40501-1-andriy.shevchenko@linux.intel.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230103145339.40501-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2023 15:53, Andy Shevchenko wrote:
> There is no point to specify asm-generic for the unaligned.h.
> Drop the 'generic' suffix.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

