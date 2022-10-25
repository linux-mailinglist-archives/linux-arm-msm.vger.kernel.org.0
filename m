Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F047D60D5FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 23:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbiJYVIJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 17:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbiJYVII (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 17:08:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C840E104D12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 14:08:07 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f37so24575544lfv.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 14:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QF+3wsg45xvLF5RBlwYMKr4aggC4R4uAm1oMiXFMvkk=;
        b=U5bMN+oaA9QRE6q8CJP7lUahd44tKbmmh0qld/oprQaKLiQF0r1lahdNIhbcgyz9w1
         FI9gueD+8vwzUdKYIvi/y4H4A3gqsUMI0Jwz3UhLQ/0qbc9rMhSznbIEYeyHzuYAt9lD
         acR4rFfFU/wdXPQIAozr5KoMLaZmzFDsfw1eIf1yda2QaAOLI9SoZcQot4m3irC8EmAK
         WVFJBEqwzX9+RphGwN/QKr9pwnUL9/5YWfVSIRS7xkouvwPsgLV89vG74U5Oy/OPtcPn
         X71v9SOymDfFKa3NPIbmqTddyYJK5X1XacYJVNQwublLvedXGuOMcmmOk6LvH1OlwFWP
         pQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QF+3wsg45xvLF5RBlwYMKr4aggC4R4uAm1oMiXFMvkk=;
        b=ilvshBZZFoZ9s+qnaXRyhQ6yBcEkQZdpg17xPMR8JtYqia0TzZA0ry3RLunOS4E27p
         vCD5e6ZzNdUlGioevgy8nx9eH/qcLGV4iharEA+aO+8QAc1YsDlw8FsWeqwKnwmwTsRg
         WSMbz5KEfnq62H7iVP/VeLNXrwSLiGyMbbI16Nu9j6MOkMwvCKHRRRlaYBlavFRItVod
         CrWAPKw1Fc+d359v+t8Yyk692c5Z6l8GtVnmIdvi3W/tjoFsjLdiaXuMS99AbUM1xppZ
         8/hTPaCQJjtBPZlCmBYIHrECqFByiFal7uT50hUGmImA2uAnMAHWV2qWE+kvdUNBiESM
         Mw6w==
X-Gm-Message-State: ACrzQf3ZfFIYDFjHnXBozCekKlLxYXDicRJ1tBH00oefzFYuEB7Jh+v/
        /z3TZPV3Mv9cASfapvqNtchqOA==
X-Google-Smtp-Source: AMsMyM4unZplmpBcci34j6spLBCFpxfWsmqoM/wQi1xA0mtzeb5UBgiNLmQ7Q0g6uA1AFLjK7B8emg==
X-Received: by 2002:a05:6512:22c3:b0:4a2:7cd9:1f1f with SMTP id g3-20020a05651222c300b004a27cd91f1fmr14199093lfu.582.1666732086156;
        Tue, 25 Oct 2022 14:08:06 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id e18-20020a05651236d200b004946bb30469sm578112lfs.82.2022.10.25.14.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 14:08:05 -0700 (PDT)
Message-ID: <149c9604-03ad-3869-075c-7080d921deb6@linaro.org>
Date:   Wed, 26 Oct 2022 00:08:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PULL V3]: qcom: SC7180 and SC7280 venus firmware updates
Content-Language: en-GB
To:     Nathan Hebert <nhebert@chromium.org>, linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>
References: <CANHAJhGcJT3nEq_s7qb4ammtiyCe1SQko3yXx7_5nm4PoJg+=A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CANHAJhGcJT3nEq_s7qb4ammtiyCe1SQko3yXx7_5nm4PoJg+=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/10/2022 23:54, Nathan Hebert wrote:
> The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> 
>    cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/nathan-google/linux-firmware.git
> update_sc7180_and_sc7280_firmware_v3
> 
> for you to fetch changes up to 99a1a406c0bc9144de6b8de8efd983cfe0389131:
> 
>    qcom: update venus firmware files for VPU-2.0 (2022-10-25 13:34:43 -0700)
> 
> ----------------------------------------------------------------
> Nathan Hebert (4):
>        qcom: replace split SC7180 venus firmware images with symlink
>        qcom: update venus firmware file for v5.4
>        qcom: remove split SC7280 venus firmware images
>        qcom: update venus firmware files for VPU-2.0
> 
>   WHENCE                   |  24 +++---------------------
>   qcom/venus-5.4/venus.b00 | Bin 212 -> 0 bytes
>   qcom/venus-5.4/venus.b01 | Bin 6808 -> 0 bytes
>   qcom/venus-5.4/venus.b02 | Bin 873596 -> 0 bytes
>   qcom/venus-5.4/venus.b03 | Bin 33792 -> 0 bytes
>   qcom/venus-5.4/venus.b04 |   1 -
>   qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
>   qcom/venus-5.4/venus.mdt | Bin 7020 -> 9 bytes
>   qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
>   qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
>   qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
>   qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
>   qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
>   qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
>   qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
>   qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
>   qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
>   qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
>   qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
>   qcom/vpu-2.0/venus.b19   |   1 -
>   qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
>   qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
>   22 files changed, 3 insertions(+), 23 deletions(-)
>   delete mode 100644 qcom/venus-5.4/venus.b00
>   delete mode 100644 qcom/venus-5.4/venus.b01
>   delete mode 100644 qcom/venus-5.4/venus.b02
>   delete mode 100644 qcom/venus-5.4/venus.b03
>   delete mode 100644 qcom/venus-5.4/venus.b04
>   mode change 100644 => 120000 qcom/venus-5.4/venus.mdt

I think it's more typical to use Link: statement in the WHENCE file 
rather than a symlink itself. `find -type l' returns a single file: the 
newly created venus.mdt link.


>   delete mode 100644 qcom/vpu-2.0/venus.b00
>   delete mode 100644 qcom/vpu-2.0/venus.b01
>   delete mode 100644 qcom/vpu-2.0/venus.b02
>   delete mode 100644 qcom/vpu-2.0/venus.b03
>   delete mode 100644 qcom/vpu-2.0/venus.b04
>   delete mode 100644 qcom/vpu-2.0/venus.b05
>   delete mode 100644 qcom/vpu-2.0/venus.b06
>   delete mode 100644 qcom/vpu-2.0/venus.b07
>   delete mode 100644 qcom/vpu-2.0/venus.b08
>   delete mode 100644 qcom/vpu-2.0/venus.b09
>   delete mode 100644 qcom/vpu-2.0/venus.b10
>   delete mode 100644 qcom/vpu-2.0/venus.b19
>   delete mode 100644 qcom/vpu-2.0/venus.mdt

-- 
With best wishes
Dmitry

