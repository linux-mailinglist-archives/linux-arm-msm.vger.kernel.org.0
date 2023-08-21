Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 911D67826D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 12:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjHUKNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 06:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbjHUKNr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 06:13:47 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AE3D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 03:13:45 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fee51329feso10134415e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 03:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692612823; x=1693217623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JcUZHqg3I3uPTKVlla7YyNJKoCL98H5bscX75s9SGAQ=;
        b=QCnnEeUJxVTJquob5znArvBOiesuA9Vyk7cbcEsKRnE1qe7FzukN+t9WGG0h/x5wBf
         QvL8oyUoYFoev/0eqkFP6GHSpMzKeQBsKoe7gN3BBnGqNOJTTM5LkBbeO0EVIARl2+9A
         totS5thG482JPwgSThEqYumkrjaFTylSGqeLbdRxaCZ5cbQ0+EVxk12wa/HvO+DQYE4Y
         jqgQOToUsRKnPpyDjcwUSUaxx1HqEym77YYTgHHHh+ufBWmJ3/ES339GH9XGxhA/i9Oq
         2B3sc4D8hZBcgodqyAf3og9U2HXUlYxKmA3Pe8zJ9WqloMaL4rG4p4AVXzQlZJD933sY
         Q8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692612823; x=1693217623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcUZHqg3I3uPTKVlla7YyNJKoCL98H5bscX75s9SGAQ=;
        b=CTo9hCrFU3qd1pKppOyyAfwtmE5VxcrWI+nSA110UlhClAQMlasVNqs6VkQs3FVS6D
         sGMZvAqjS+eeopvPYnPmu7s21Fv8uCnE+C97ZBJoEkI+jSann+yrmWKSGZV3TXDVCkC3
         eGFGow062nQXzPZ5Z5TGoGd6+HZBdRngiO45n8qHuO7lmj1xfneufZ/tHAbkHfd+T0NR
         7CxoXfG/nQDhDwWXdlFwuA+APTsAveeBzrBsotStF9RTit9l4xK0HHoBwii+xFq30uAc
         d9VIA2L0iLOFuWnJdMeEOuGNzT4ve8uZrQbqDJ5T7NnAeTVyrx1EpCA7MlDw5ij9RrDU
         cJqA==
X-Gm-Message-State: AOJu0Yw9ADOtzGHw8KD0dONXTdECTMCPG0WHt0p6LVs4Sv5/pYglNp8X
        k/z1pVvQHqHf5HV4f8FmCcbXnQ==
X-Google-Smtp-Source: AGHT+IHDryK3rwpaBouhN+dHmhcwl2VNv1A5HUNKA1MGcEaa2pAfWJFTGDEonCuHDK4Nlhl0P3XJkA==
X-Received: by 2002:a05:600c:4304:b0:3fe:1f70:9e54 with SMTP id p4-20020a05600c430400b003fe1f709e54mr4368990wme.4.1692612823517;
        Mon, 21 Aug 2023 03:13:43 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c379200b003fc01189b0dsm12106735wmr.42.2023.08.21.03.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 03:13:42 -0700 (PDT)
Message-ID: <dac21bae-b770-c53d-f599-e4c3a7391488@linaro.org>
Date:   Mon, 21 Aug 2023 11:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v0 8/9] media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE
 when VC is greater than 3
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
 <20230814141007.3721197-9-bryan.odonoghue@linaro.org>
 <edd4bf9b-0e1b-883c-1a4d-50f4102c3924@xs4all.nl>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <edd4bf9b-0e1b-883c-1a4d-50f4102c3924@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/08/2023 10:53, Hans Verkuil wrote:
> Hi Bryan,
> 
> On 14/08/2023 16:10, Bryan O'Donoghue wrote:
>> VC_MODE = 0 implies a two bit VC address.
>> VC_MODE = 1 is required for VCs with a larger address than two bits.
> 
> This explains the second chunk in the patch below, but it doesn't explain
> why dt_id is now suddenly vc * 4 instead of vc.
> 
> I don't feel comfortable merging this patch since I'm not sure if that
> dt_id change was perhaps an error.
> 
> If the change IS correct, then please reply and provide a better commit
> log.

 From memory that's a copy/paste from the original qcom code.

I'll verify that and repost a better commit log.

---
bod

