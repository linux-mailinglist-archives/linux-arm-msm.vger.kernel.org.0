Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F8E733D5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 02:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbjFQAsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 20:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjFQAsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 20:48:37 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657D23AA5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 17:48:36 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f766777605so1845800e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 17:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686962914; x=1689554914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTLsCOm+x4ZvrOFSB6ytsH0DzFh1BKzhychb27x+ZCk=;
        b=gBqvFFGhi2k1Y4mtAueB4OnvmeneTr3asfVLlhXV/KoukoBpKC/5fJRBWHcdTBqK8i
         xmjTgyEMajixAz7m3A9906HEGtDrMt3nHnXAHkUb2vfOS5b7IxIVvdzjutDP2wNRf+t9
         Pl2PbEvPwAhbeqtPjmYXgOuuP9nstKUX758l4KrWiDTHOyCU5VamLZ68KyuXKRlT9E7F
         phHrRmz5JxT7DwjZcogBgziaJ+1vsOBXwfdw0IxAJF1HddL7yYWGQNAbqzUN3x7exU+k
         EYyW1vacLbLv5RJYukAX/lBXxWjz66LB6ZtHhMLSFt6u65cqH2VSFKQ88nUwHBzUp9ur
         vtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686962914; x=1689554914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTLsCOm+x4ZvrOFSB6ytsH0DzFh1BKzhychb27x+ZCk=;
        b=IXvH2E1FH5gOK5Uug6SmhgOj6kDj+36lQTYkvtr5mECzByaNdi4VRlGI+WrX8YpGjq
         MiSZxJoUYRHQG0OqOMeubwMnto0T/KITF81Av5xy7oyLNpaY9OxRhusmE4LoqgnSWua7
         5CGqS5yj8bSlzuv+kBHIQfTgWCrb7DruL7QTBZkXIfje2MfsfrxsgehJiCeRlMJQPTk1
         KbdN7o8q9W+pyQZnLM5mQfAmimb9LuLUBus89lwFs12rlgHUw+Kmk7gmAr11jCdhxlIu
         cXkadPrE9rv99RBhdj2HZNf3fWOvwftaqctJY4oOHYdIjpegUxXa/+ikh0sALasU35Ba
         rN4A==
X-Gm-Message-State: AC+VfDzF/N5/TAySo/LJrRtojwZvZCgQgY9lrez1RAMir731lkcNb9IQ
        VWFtwisDLdPq7iV4aTfXgmJF6A==
X-Google-Smtp-Source: ACHHUZ6AYKV84W3IFZwyIjWK1ncKT0jMqQXhv6X4F4THuR6X7HIaPQniEwqZSsmfjSwnRF1a8MKUNQ==
X-Received: by 2002:a19:f201:0:b0:4f4:dd51:aec7 with SMTP id q1-20020a19f201000000b004f4dd51aec7mr2028052lfh.54.1686962914329;
        Fri, 16 Jun 2023 17:48:34 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d15-20020ac2544f000000b004f858848fefsm348826lfn.177.2023.06.16.17.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 17:48:33 -0700 (PDT)
Message-ID: <227c2ba0-cfb2-cd88-6506-895e8735d221@linaro.org>
Date:   Sat, 17 Jun 2023 03:48:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 17/19] drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE
 macros
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-18-dmitry.baryshkov@linaro.org>
 <vpuwgjbgfau6fwn3etg3hyoo44yn4n4xo7hzbe3kfir4ih2tgp@rmutsfjobrub>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <vpuwgjbgfau6fwn3etg3hyoo44yn4n4xo7hzbe3kfir4ih2tgp@rmutsfjobrub>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/06/2023 01:12, Marijn Suijten wrote:
> On 2023-06-16 13:03:15, Dmitry Baryshkov wrote:
>> To simplify making changes to the hardware block definitions, expand
>> corresponding macros. This way making all the changes are more obvious
>> and visible in the source files.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Looks good but I am not sure how much it is worth to review this (versus
> checking your script and rerunning it to see if I get the same results),
> considering that there are quite some conflicts with your interrupt
> rework.  In what order to you intend to land that?

As I wrote, this series goes in first. Initially I designed them the 
other way, but intr rework depends on DPU revision changes, while this 
one doesn't have such dependencies.

-- 
With best wishes
Dmitry

