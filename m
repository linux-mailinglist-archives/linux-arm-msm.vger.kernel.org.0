Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7E61F9FE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 21:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731433AbgFOTHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 15:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731427AbgFOTH2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 15:07:28 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF943C05BD43
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 12:07:27 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 97so13999183otg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 12:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gkisYoqPUHl9LL0bMseRIRvV+9UIa3Tr6nRZ75os/94=;
        b=WNJIIb/LEdiABSPWau+fuOw7xHs2zDQrgqhRIJqIcPdHFpFDXr/7kVCm6XFrZYNotm
         9x69N7NIXg6LueAOyHhTUs3Q8bI5Yfv4Cz6dJSP2upRHyQUgb3i3opKO/7ZRNTwlsjt9
         AdF6N+T9WDDaBaVhGjx5C5GGkc/um765axhNEADTEDRPHwWiIIUY0VwyqyOc9Y0Ip+su
         mq/XWN0vU+gX+2JLCiqqEroKy55EkDL2CeaaPpd+y+fMYSu2NzB2tpcTwJ3Hzx2o634c
         jBCCtc6J3EgGtpmNxMpR9+LW6CZzbwiMSlJLx8RQ2+XI1KXKhpD29fZL3ibYbBZkSqxY
         8KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gkisYoqPUHl9LL0bMseRIRvV+9UIa3Tr6nRZ75os/94=;
        b=eyfUmS7Re/vimM9Ycr5YxexstOY2OXZUSfQNAnUF76EbEA5OVt7c81ick9SHJ7/kaP
         xIaDyghtru3UcsUEM6lAcENyEGNAB0gHuFUk3xnd41VAudxDHDTNh3Y2r8Gsbow1TYHq
         P5lI1djhjq12viWYVKjykfWC6lHxcmnBIUkyjJS1Eau51r/2S1ujZ6aJDcJW/WgahqNU
         lIB+qdgM3fFmn6ESRRT1r1RkZspv4j+InTppvgEft2OwmyZuHWzhANGO9YAb0KnfMZrV
         /lqwlaswUQLXbT+kAqJCQ9Rzwx4ELT+eJXNBD9wBc9RyhpCqpXtyiaDuXFdCv7n7upPi
         Zjqw==
X-Gm-Message-State: AOAM530G4yHp6muFy42cqB2ukP13OnFo/nxJYgpwn5NruuoCBNfC97tV
        8zaobsvOgFFGUqTjoZzFp5vQow==
X-Google-Smtp-Source: ABdhPJwfv5W3EVhFyjfklabyBQ0AqghguZeeODyksn4WYKzWBKXJnT04Z0JIf4XQp9S7QAPcJb+NnA==
X-Received: by 2002:a9d:a14:: with SMTP id 20mr23869540otg.292.1592248047094;
        Mon, 15 Jun 2020 12:07:27 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id z7sm3484098oto.2.2020.06.15.12.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 12:07:26 -0700 (PDT)
Subject: Re: [RFC PATCH v4 4/4] scsi: ufs-qcom: add Inline Crypto Engine
 support
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Thara Gopinath <thara.gopinath@linaro.org>,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Avri Altman <avri.altman@wdc.com>,
        Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Can Guo <cang@codeaurora.org>,
        Elliot Berman <eberman@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        Satya Tangirala <satyat@google.com>
References: <20200501045111.665881-1-ebiggers@kernel.org>
 <20200501045111.665881-5-ebiggers@kernel.org>
 <31fa95e5-7757-96ae-2e86-1f54959e3a6c@linaro.org>
 <20200507180435.GB236103@gmail.com> <20200507180838.GC236103@gmail.com>
 <150ddaaf-12ec-231e-271a-c65b1d88d30f@kali.org>
 <20200508202513.GA233206@gmail.com>
 <1aa17b19-0ca7-1ff1-b945-442e56ef942a@kali.org>
 <20200615185806.GC85413@gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <dc735157-77a2-34a3-12c2-5fe060afa153@kali.org>
Date:   Mon, 15 Jun 2020 14:07:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615185806.GC85413@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/15/20 1:58 PM, Eric Biggers wrote:
>
>> Hi Eric,
>>
>>
>> I've been testing this on a Lenovo Yoga C630 installed to a partition on
>> the UFS drive, using a 5.7(ish) kernel with fscrypt/inline-encryption
>> and a few patches on top that are still in flux for c630 support.  The
>> sources I use can be found at
>> https://github.com/steev/linux/tree/linux-5.7.y-c630-fscrypt and the
>> config I'm using can be found at
>> https://dev.gentoo.org/~steev/files/lenovo-yoga-c630-5.7.0-rc7-fs-inline-encryption.config.
>>
>>
>> Everything seems to be working here.  I've run the tests you've
>> mentioned and haven't seen any issues.
>>
> Great!  Can I add your Tested-by when I send out this patchset again?
>
> - Eric


Absolutely.  Tested-By: Steev Klimaszewski <steev@kali.org> is preferred

