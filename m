Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3653797E16
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 23:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbjIGVtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 17:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbjIGVtB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 17:49:01 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6121BC1
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 14:48:57 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52713d2c606so1929793a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694123336; x=1694728136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQJgEH3f9fUyW9GofjnZwi+SALtmAUwJX7vDCsMBypg=;
        b=RflK+xWlsZarFMpmYfch+CX7NDjHEwTUN+SQmo1kKulIZ0qxUObRdTYpjC87tDiqIq
         ViotXd9ifnsJeNh0zToFtBl7Ac3FJCXFgAjIdNDQMDjJjxW7w9wAZBl+EvOTaRrCvxhI
         FA3JPQ/G1mgN3Qq35Zy/iUVt0NAx+YaNoolRpDCdKXy+t8i0LrEYo1/GYpRLFPgf/cNM
         WDElml0iVl9Q9orXwRwuc2gpNPZ5/WbSzbJmrgMmmiTexGGYOYhlNN3V0Pr3mjJQwQA2
         5nl90oZsi3O8HKD4MBUYq8IFMqNeCSiAw0cxRgsU8dns1DRT4iLmSmeKeU+WWcVwLNSJ
         FXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694123336; x=1694728136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQJgEH3f9fUyW9GofjnZwi+SALtmAUwJX7vDCsMBypg=;
        b=YDPrOtgv0uwsbyLGhkNYFp9D1gqtEoYFzQtjTYGeqyesAsRwFngKGqjBwdOzC5kTGO
         OORZiz1nnWp2qB97aZCbU0EUASz8SyLF1taUTl8E30qgckQL/gVBBzjgWFHg6vOETbxo
         0+M/UEvOh9qsnXxkC/dDe0XfTKBJOiCcixIKCYhWmk4gpJAJbiXWSxSKN13er+wrMIb+
         Akxbzo0BTxuVVbAXZ5kMBwzU7Tpdqt0z4IqkAWqUqlCq4tmEIRFF+22i+u1Q8yub5+Q1
         +FfWQfyTXYVzD/tR7MZeBGs/UqBcrAX6aehhzDpL37PwxfqPk999XQbNmUl418HJAwy5
         Iu6g==
X-Gm-Message-State: AOJu0YwDjwjd83KTLiv+LQUZZn80k4Z5kExbajn8a7JjatAKYEDjGuKl
        FQGcpF6Lv6fpUJqK6mQYjU2uaw==
X-Google-Smtp-Source: AGHT+IHt8dq+fHGWcodmuk5PMPvb2LZ/t1lPkyNiWwgmY6kA/kRGNzdelYlTvJ+cJXNgTUJ62I/msg==
X-Received: by 2002:a05:6402:2d9:b0:525:691c:cd50 with SMTP id b25-20020a05640202d900b00525691ccd50mr432973edx.24.1694123335807;
        Thu, 07 Sep 2023 14:48:55 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c10-20020aa7df0a000000b00525c01f91b0sm268738edy.42.2023.09.07.14.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 14:48:55 -0700 (PDT)
Message-ID: <bd833f26-ba76-4e9a-a158-d1e5eb4152cb@linaro.org>
Date:   Fri, 8 Sep 2023 00:48:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: support setting the DP subconnector type
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
 <CAE-0n53c2kGcR-OWsTn4s2wuLQ+j7WTA9Ho9CEG=cGNEFT-3iA@mail.gmail.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53c2kGcR-OWsTn4s2wuLQ+j7WTA9Ho9CEG=cGNEFT-3iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2023 00:34, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-09-03 15:24:32)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 97ba41593820..1cb54f26f5aa 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -162,6 +162,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>>                  }
>>          }
>>
>> +       rc = drm_dp_read_downstream_info(panel->aux, dp_panel->dpcd,
>> +                                        dp_panel->downstream_ports);
>> +       if (rc)
>> +               return rc;
> 
> I haven't been able to test it yet, but I think with an apple dongle
> we'll never populate the 'downstream_ports' member if the HDMI cable is
> not connected when this runs. That's because this function bails out
> early before trying to read the downstream ports when there isn't a
> sink. Perhaps we need to read it again when an hpd_irq comes in, or we
> need to read it before bailing out from here?

I don't have an Apple dongle here. But I'll run a check with first 
connecting the dongle and plugging the HDMI afterwards.

However my expectation based on my previous tests is that we only get 
here when the actual display is connected.

-- 
With best wishes
Dmitry

