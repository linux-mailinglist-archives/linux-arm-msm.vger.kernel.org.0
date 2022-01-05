Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F1B484BF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jan 2022 02:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236846AbiAEBNG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jan 2022 20:13:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233194AbiAEBNG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jan 2022 20:13:06 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB385C061761
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jan 2022 17:13:05 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id v7so79492608wrv.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jan 2022 17:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=Y0KciWPHS+7t8CGq6Wq/QQ1/2ZHQZ790+qvoj+GfYMk=;
        b=FrV2qJaHKU8mK1S8aLLlqCL3WRNin4Q2a8BJgke1x4qFgO0lC1t7LURRekgKY3lxcf
         Hpb11T2xIUdKgyuDIaOsTp09kVj2q/Z2j/N2cz9DtrxgY3AkHLvRhAaoqHpgJ1KnvIDW
         IM8zNNvONR9SeT8fnMvtO78uhLlvAadNkIUqzgadyPEjHg6c2coYrk+oItRxflPR+8Hr
         A5sZKxSbGnYo1lGPD6oC1yekatIg9eVDyhafn9l90ryAvnxCp/wTYrG2rHhrrsb1cX2c
         3yJ9bBUZOcb6s/mwBHFULN6I0ZKrbbpk1zaj6RnD0o+2KXEtbWoS+cjIJnNLziwJZlIh
         7g3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Y0KciWPHS+7t8CGq6Wq/QQ1/2ZHQZ790+qvoj+GfYMk=;
        b=0MYZwM6Tp/5h0Pie4W6mQp4ZW5v3lLaLIJKdiFmNHiOxi9Zy54WPHWYJOViQJYk4FH
         6w78g18PoPhK6khzqOPFzNRp1t95pZfV+lyHWZIu9OLZmXRN77z/rsZdqdPkUDPge8sf
         CiXCuN3QIiVuIT1naEnbRnFYuGNL890aWJuDSMF+JxtghP5bEh2oD1yzH0cgBBHAIm5h
         01x47nmQHuiuVb9jBnVpgC83feVXC1OkLKTazwszJsLv4/2LO0GFvczlG5UDnoGQVTDG
         MaALD8Bs2dK/X9OJ2w9tdZ5MbWHDveNaDdf0lmyKlSOUM/wVyBOoAMIBb1/XblbDgu4n
         o5nQ==
X-Gm-Message-State: AOAM532/ivLx4sUp3NXBMF9aFZ7zOgEZrt3ePZ8NgIVTdGa+D72rdmmx
        l7+UQKNR/q3BbJ1PPQN0WAdqP3Ddqh2LoQ==
X-Google-Smtp-Source: ABdhPJyu0LGMuXZK3/xPBUu0pu2cEpXz1sF9u6D2nP9qjmPlPAovCjSD9xz3Nc4KTIYi0mINtTKqyw==
X-Received: by 2002:a5d:59ad:: with SMTP id p13mr43489062wrr.602.1641345184297;
        Tue, 04 Jan 2022 17:13:04 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id ay39sm972064wmb.29.2022.01.04.17.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 17:13:03 -0800 (PST)
Message-ID: <8d66b058-690c-281d-2f4f-774681cf4dda@linaro.org>
Date:   Wed, 5 Jan 2022 01:15:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 01/19] media: dt-bindings: media: camss: Add
 qcom,sm8250-camss binding
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, dmitry.baryshkov@linaro.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        hverkuil@xs4all.nl, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
 <20211222003751.2461466-2-bryan.odonoghue@linaro.org>
 <1d753716-ba3c-8fb6-eeaf-7c68ef0c6e5c@linaro.org>
 <80123075-17c5-663a-b175-a3b2cba22b9b@linaro.org>
 <6baa737b-441a-3dfe-f363-aaf4d4fd62c8@linaro.org>
In-Reply-To: <6baa737b-441a-3dfe-f363-aaf4d4fd62c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/01/2022 20:44, Bryan O'Donoghue wrote:
> Please don't apply V3 for now

I see the pull-request is already active

That's no problem I'll make a new patchset to

- Add regulator-bulk support to camss
- Fixing RB3/SDM845
- Fixing RB5/SM8250
- Fixing SDM660
   These three platforms work fine as is we just
   need to fixup the description of the regulators

- And add in the sensors for the RB5 which
   is where most of the changes to my branch are
   and have no been submitted to this list yet

Seems less confusing that way. I'll see if I can get that patchset out 
tomorrow

---
bod
