Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B6B22E7CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 10:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgG0Ie3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 04:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgG0Ie3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 04:34:29 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE31CC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 01:34:28 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so13949075wrs.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QbPPYlMN+h235a7jgD9i8ACdPZM8KYrB1/GTDTLzrQI=;
        b=vpKZ3UY4DFem2oskjktMQrNgs4lt17UqiuTnclQTlQyUA/nsBmlsi+tVJyXLvU/+mn
         kqqiF4umDhGDXMiDgiZ2OSMBI3ij3TfrSBbxldLMQ7oh5/xmxjaJMg9xapDOtje5DuQb
         qEfkrhkYeUXjIBfNl8RWY55FQ0G0L9KD+mVFKoQk7PLwjLpi7pvdBX1201FNmkYIWFqI
         Lbhbz0Xhw2Qvct0eDrTzyllUp0n3ClStxZgIhxBqDSr/5r/qR+1f3E7dKoyPnt2gbPH0
         N1TNUXS/XiTsTLw8RnQwcBlxwA+zc3ppgBLXggfleB3FfyyydZ0AxU4puGuRKxsLYJ9j
         fUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QbPPYlMN+h235a7jgD9i8ACdPZM8KYrB1/GTDTLzrQI=;
        b=JoZAJRyf0CdC/yyNKB4yfjPH+CB6QQPVHeAV8OWz/t4eObYNCAjVzQTcWW7B+8Ol0I
         jXPsepYDTEWbEU0zCacYSZQ5nNAR1AlK0yQod8S9Nn3eaeVFfK7ZwlPLTSppqlfa8KdC
         JS1I5SW02obHUdTrGNgMLKAO2dRBbp9fBDe6vXevGECvUSjuSSNG5iAqHPTQvfgk+CxH
         H22+hT+Q7EYKl4zqwkcVw05i1d5FicHWFO1v1Qj39xe5vT3fl7N+YFIGqP8NU/pwv16X
         JN/zMh0N9f1RF00TseTcLmoc9wMKvOjiePcuAEw5rSslrXvJDW3ZCCNoaq9b8OhWEdON
         i2Dw==
X-Gm-Message-State: AOAM533xN/3GJEM87Ampo5n3cy6owCEy7lNIT6hUEEVFDSvy+YegeWVK
        guDi6DqyeVR/bwm3zYCgmvviuA==
X-Google-Smtp-Source: ABdhPJzDV98tZ1uzg9NrcOmMoSNYWR9kZ+haVFfq1oQIrnjuOROGdSUUe3UOuSX+ZUtRAca3spe8AQ==
X-Received: by 2002:adf:c981:: with SMTP id f1mr19141164wrh.14.1595838867340;
        Mon, 27 Jul 2020 01:34:27 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:24ff:55c1:a76d:5341? ([2a01:e34:ed2f:f020:24ff:55c1:a76d:5341])
        by smtp.googlemail.com with ESMTPSA id s205sm12141283wme.7.2020.07.27.01.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 01:34:26 -0700 (PDT)
Subject: Re: [PATCH 0/2] Add msm8939 tsens support
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
References: <20200629144926.665-1-shawn.guo@linaro.org>
 <6615ee72-d222-b16b-df72-0f5117c3e7f5@linaro.org>
 <CAMS8qEWNrU64p1YeS2+G=aSj27eYgvdpEGGMb9syXmKYJciUUQ@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <87a5f772-5e72-494a-cc1a-a69d66e0cc6d@linaro.org>
Date:   Mon, 27 Jul 2020 10:34:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMS8qEWNrU64p1YeS2+G=aSj27eYgvdpEGGMb9syXmKYJciUUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2020 14:25, Konrad Dybcio wrote:
> Tested-by: Konrad Dybcio <konradybcio@gmail.com> /* on Asus Z00T smartphone */
> Acked-by: Konrad Dybcio <konradybcio@gmail.com>
> 
> Sorry for being (very) late with that, but I've been doing some
> 630/36/60 stuff. In case anyone's interested in the progress, I'll
> leave it there. [1]

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
