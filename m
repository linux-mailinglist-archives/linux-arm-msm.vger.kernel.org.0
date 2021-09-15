Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5B640CF1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 23:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbhIOWAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Sep 2021 18:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbhIOWAO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Sep 2021 18:00:14 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BFFC061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 14:58:55 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id 6so6213508oiy.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 14:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Q3q75iaI8c/GKmL2kwc0ZJBRz/9HFRegVxTPyEThKGo=;
        b=Y+PI9VFJyRkiGA4tp20AfGe0ZofVQJbtPNrDTbrFgrbCI/2RQhMvfJhxWT6ekyOqmh
         p9WoYUzeJ2ww2XAhPYSFc8n3uPHH00ACC2oawqq8xU1Nyza76XE0KI1+8auUUsYVEp5R
         4tirFYYEKxehGZZdEm+2mhIaOh6d9ksHldH+yKtr0eOZs3uXHshB2kZX0NlapImpGGJV
         vVIZyFBz3UJr15SZxCHcjYOPZ1hqIxSMJ0jIyDlg2VGhrGuR/MPni6ueuwAO/OFoVuKb
         wGr20yeuRhPHJloRAUPtWIqmjqPD/vyqXjRPqGpqBUs0prq+BWtPUPo07hyOm/mLljDk
         1tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Q3q75iaI8c/GKmL2kwc0ZJBRz/9HFRegVxTPyEThKGo=;
        b=Yzl9gcztmlcNXKpaMfF/gTrL7uLtUqAT49F0Y/nM9WDgblgXZm2RvKZUp4t05ieavS
         65EMiV1JyZqwkyob1ugaOrJxwmKTZSTcpHEgvJyBJWjhwFL09kB0z8ttiyE7V4Soz5hJ
         J11j8jvKlF6EkaSeNFvd863UaN7TM8K42mHAeCY4F3Hlq8aUeA90bhA2bzXkg42YbYmQ
         6GHvT5oOlNLxvKRtktg/7D7WmhHptOobIRe79Ba8CX1WVD6Wgz5ZpM6IzeKKsjotib/H
         FDDq8ndh91DL9XRpYZ5NEH0j270btkaQycO2kL5DuLXsT4ELszihh/wSr8HbVTX1xU+2
         N5hA==
X-Gm-Message-State: AOAM532kTCSJFEhNFTBkU3urEvGJKOWAwRxGjXXMI1J4oD3sevKKsh/U
        fVl5WyeObWu1yHo0cYhCrjT36A==
X-Google-Smtp-Source: ABdhPJzprS4i9uNMizONNl4FnOUGqGN2xQ3aqr2AjW11bB+1fZHbPpaL7KIscnN3Ucy3ntFFCuM81g==
X-Received: by 2002:a54:4018:: with SMTP id x24mr6992028oie.125.1631743134454;
        Wed, 15 Sep 2021 14:58:54 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id d10sm349838ooj.24.2021.09.15.14.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 14:58:53 -0700 (PDT)
Subject: Re: [PATCH v2 net] net: qrtr: make checks in qrtr_endpoint_post()
 stricter
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        bjorn.andersson@linaro.org, butterflyhuangxx@gmail.com,
        davem@davemloft.net, kuba@kernel.org,
        linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        mani@kernel.org, netdev@vger.kernel.org
References: <S4IVYQ.R543O8OZ1IFR3@protonmail.com>
 <20210906065320.GC1935@kadam> <95ee6b7d-a51d-71bb-1245-501740357839@kali.org>
 <QvTONvzS6__GE_w1qYluX-y9sMtfeFFyTeDROhqnm8j6phRilXBJihf4Tp8COJkG54g-Hi64c2j5WLvJ-4rXeEiwkAgJ3jI0_H4ISzoJZ8E=@protonmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <f7958ae4-c8c5-7a54-86df-4e689ae57950@kali.org>
Date:   Wed, 15 Sep 2021 16:58:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <QvTONvzS6__GE_w1qYluX-y9sMtfeFFyTeDROhqnm8j6phRilXBJihf4Tp8COJkG54g-Hi64c2j5WLvJ-4rXeEiwkAgJ3jI0_H4ISzoJZ8E=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/15/21 1:40 PM, Yassine Oudjana wrote:
>> Where has the fix been merged to?  5.14.4 released with this patch in
>>
>> it, and wifi is now crashing on the Lenovo Yoga C630 with the same
>>
>> messages that Yassine was seeing.
> The fix is in master[1]. You need to cherry-pick it.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d2cabd2dc8da78faf9b690ea521d03776686c9fe
Ah, thank you kindly.  Confirming that this also fixes 5.14 so hopefully
it gets into 5.14.5
