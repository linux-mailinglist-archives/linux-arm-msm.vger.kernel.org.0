Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DAA677A8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 13:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjAWMJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 07:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjAWMJR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 07:09:17 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2322384D
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:09:15 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j17so17861221lfr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtdbPPpjc+lx28u1inpjC8tVRtBtdkFrZzr/s7CL3PY=;
        b=ACfNot6L0Pw218eURjk9SmTS0Scf9EwrubmhuEKdKaqCwd+wyh+hMwhY5d3PUNVhe8
         cnIS8wmytuoXYpHSqdMWlMkxhI3ZyH91bc/Q6i3M0yBSlgMDl3ScaZVGLE1f7gz5h11I
         1pnyYwwNOqrU5d71MpsYpLa2NzjZ18me6qmLQwrRrmJ2CFsWP4z2zEKfWZPMFDEcTFS2
         S+iE9aZ/AvIJuwa4Imm8d7P92wdtYp7ZLvFd/MTDfWzItdaYI0kjekOeqRA4vJ8EgtpR
         s+ONP7aVvM2hMqFeBt05vApK0JjerbUnEg7CENA3un4jYHrxJTlzz8Ot0TR391xBbRgw
         pAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtdbPPpjc+lx28u1inpjC8tVRtBtdkFrZzr/s7CL3PY=;
        b=z3COYj9WdbnoHkA3oKw662OzUahsm9ytdPBXi9eSvb8FKVQ92FyCdhI/tQKMLLj9nm
         5VxGbMBgIXCbkR4w7FUamvpDTpoh/lmdvo4I61k/vKmzn7IkL38UlnsHJX89MjcWQLCb
         t5tCjdQPujhTdiX7t6MKTDCqkZ+i66IuGoDqdPD8OhWL5W7ohY+EdLhCJdo3fUmxgO7/
         54WCzWdmbxrZvL2zdaui04aV8Kpu2QMDDyXEOIpQjqawVip+zsGdx/pOwoh+HnoSYXv+
         gqCu23v+HlTaRFMG1dwF2lSKvMyFYATwclE62TVQfaOQEKPTKWffLWFEQRmmPHmQNjAK
         oRkQ==
X-Gm-Message-State: AFqh2ko4bBRLCGVYLMkmB5ajXXKhm8eh8RlwM4u6Qjrljz6vsWrFEoD8
        zabOoTHp0cskDngpxX2Bne+w6w==
X-Google-Smtp-Source: AMrXdXv5gtv2B9DndvEPlMU7gIlEJOv+lFyjdYn94QbF0uqfgW3SYBTF+M6BUu9PMB72ZX4xbu2v9g==
X-Received: by 2002:ac2:5622:0:b0:4cc:9736:3551 with SMTP id b2-20020ac25622000000b004cc97363551mr5538071lff.31.1674475754288;
        Mon, 23 Jan 2023 04:09:14 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j22-20020ac253b6000000b004cc8a07c6e0sm4755764lfh.120.2023.01.23.04.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 04:09:13 -0800 (PST)
Message-ID: <86012074-5080-4a90-9a46-f87f3fc1f548@linaro.org>
Date:   Mon, 23 Jan 2023 14:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/3] phy: qcom-qmp-combo: Add config for SM6350
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Luca Weiss <luca.weiss@fairphone.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221130081430.67831-1-luca.weiss@fairphone.com>
 <20221130081430.67831-2-luca.weiss@fairphone.com>
 <Y6xP4YRAp68TfxFi@hovoldconsulting.com> <Y8BIX+js1ircJyb9@matsya>
 <cf968a25-02f7-d402-530b-eb379b707e54@linaro.org>
 <CPR2LS3SJQ3I.Z7UY505COG3@otso>
 <CAA8EJpoOMMALHz7ysft6KvQaYhGWPD+xZiUjOTrC8CA_y81n-w@mail.gmail.com>
 <CPX2VVT5EUDV.2LH6VI2586F02@otso> <Y85WqDrGXAXp7gS/@hovoldconsulting.com>
 <a18359f8-6495-dbea-2323-8ab73bbfc472@linaro.org>
 <Y854Iz7gG6/APILo@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y854Iz7gG6/APILo@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/01/2023 14:05, Johan Hovold wrote:
> On Mon, Jan 23, 2023 at 01:15:52PM +0200, Dmitry Baryshkov wrote:
>> On 23/01/2023 11:43, Johan Hovold wrote:
> 
>>> We'll convert the older platforms over to use the new binding scheme
>>> soon and then we'd need this anyway. And if it turns out later that this
>>> was all bogus, at least we only need to fix the driver (and not worry
>>> about dts backward compatibility as we had to with the old style
>>> bindings).
>>
>> As you mentioned this. Do you have plans to work on this conversion? If
>> not, I'll probably take a look during next development window.
> 
> Yes, I was planning on looking at this after Luca's series is merged. I
> have some higher prio stuff to get out the door these next couple of
> weeks first, though.

Ack, I'll sync with you then, let's see who has spare time for that.

-- 
With best wishes
Dmitry

