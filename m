Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D53D24BFE0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 17:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbiBVQFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 11:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232865AbiBVQFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 11:05:47 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4644910C50A
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 08:05:20 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id f14so13011506ioz.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 08:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=NDozPatV6Z0U3upLRoA8/0EfvFCyJgU33xu9RXKtnXw=;
        b=qlBo4TNyIiMsjvCisuZQsfrUIdv8juJl7jtH5huUm9T+yenzjxsR383FFe/T9PFGjF
         rYIWLMfTazeq3TEx12AtcTncKpXfRJg5hkt5Yl565taGFtaRViwGUD+KIvTL2tlM3gm+
         5TQI5NFrSO3d0T13GQdRFokkd5cnDL7Lidys0nDgndjhRU1h4oN+r0F17TuDd6SQDccN
         cH/c4ejzG3ugG/1lgRAbO7jX6jO3TGclk09F1MbZXz2jvik4UhHhsK/gZs5fRr/Zs+kG
         7Y7qQpbIw7zUPCeDfyonjiRfjHyTNfawlki2vuVEgZZNbjFlCm6cquQq9/o4b5wSM0QB
         PT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=NDozPatV6Z0U3upLRoA8/0EfvFCyJgU33xu9RXKtnXw=;
        b=eh+7XlKEocK/Ztr7Gny3X/qbCoKTY4gJ0a9kK9XDeTsS8kYq6J9yoDUwEXWeGHrTQJ
         Q1BR6y9sIpICMmJ9IKktbB9PIONE1iMMcvYdc5PmA0ijnTCk9t+5wu1D3OI8lYEtPQ8G
         NPkk7iJIeP6b1W/05usgD16XIS6k40MkHZVWFsBZqHblVPiRZ6mNZqE5ziVPrNT4hMlr
         yqaUxWkO6YLgWHDqu/ohG8kOf+RBciU8BOgW9XFjwli1K5i2h3L9nL04mgR1AeNSq2VJ
         9TqAShOOdj9pjnzTkMfchB4hk67FNv5BfhyowGMFqxq/SmNuMXnKg+D/cUIiY06I3aWm
         udUQ==
X-Gm-Message-State: AOAM532BKfMtsOtf1Y2dw7idBlZ4n4QqqP5N87utL55LGEhgL0ufYPEk
        FN2ZOXFg0TRA7ZR33qdhb0zrIA==
X-Google-Smtp-Source: ABdhPJz92BIziZiDFI/R2bhFKyeYRHuN1m718LzwtNyEXyTlVhT2O0XMp3NG/WcY1cOYjEY645t8Hg==
X-Received: by 2002:a05:6638:3045:b0:308:ed08:e744 with SMTP id u5-20020a056638304500b00308ed08e744mr20499419jak.253.1645545919672;
        Tue, 22 Feb 2022 08:05:19 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id c5sm1964435ilu.77.2022.02.22.08.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 08:05:18 -0800 (PST)
Message-ID: <4ec997ab-8a6f-76e7-20e7-b7f778124c87@linaro.org>
Date:   Tue, 22 Feb 2022 10:05:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 23/25] bus: mhi: ep: Add support for queueing SKBs to
 the host
Content-Language: en-US
From:   Alex Elder <elder@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, quic_jhugo@quicinc.com,
        vinod.koul@linaro.org, bjorn.andersson@linaro.org,
        dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
        quic_cang@quicinc.com, quic_skananth@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-24-manivannan.sadhasivam@linaro.org>
 <766e6568-0b80-c745-dd8f-7f401fb0422d@linaro.org>
 <20220222143825.GH5029@thinkpad>
 <f3248103-9450-dcf0-719d-77c6dcd85bfe@linaro.org>
In-Reply-To: <f3248103-9450-dcf0-719d-77c6dcd85bfe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/22/22 9:18 AM, Alex Elder wrote:
> 
>> But anyway, there is no need to check for CHAIN flag while writing to 
>> host.
>> CHAIN flag is only used or even make sense when host writes data to 
>> device, so
> 
> I'm not sure that's correct, but I don't want to get into that issue here.
> We can talk about that separately.

I just wanted to send a short followup here.  My comments
were based on a misunderstanding, and Mani cleared it up
for me.  For host receives, the MHI specification states
that a packet that requires more than the size of the
buffer in a single TRE leads to an overflow event being
generated from the device to the host.  The buffer on
the TRE is filled, and subsequent packet data is written
to the next TRE's buffer (assuming it's present).

This differs from one feature of IPA and its GSI transfer
rings.  I won't explain that here, to avoid any confusion.

Mani explained things to me, and he's going to send an
updated series, which I'll review.

					-Alex
