Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5AE666121A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 23:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbjAGWv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 17:51:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjAGWvZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 17:51:25 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2731DDE5
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 14:51:23 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso3644783wmb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 14:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOKkQl332/KMyUkOBbDdjywetIj7rvU1Tibnhf65dW4=;
        b=iYL+ue72Rh5jq/13fMm/7HRI2HVfNwcbS+X+gFbahVq/Rv+VrWs3C9uBmC9IEnvPcy
         e1UV54eyQCBNYDcj+piiokTuXaGJwNYhYEVFdeSpQAZSTJikm2as14ajUMduyW+oQADp
         GAb1/Rc27dx06yFd9TBbZGuDMNNIzLULkD1wV91MZLqK5XUgsRVHAgZqrGnM4+Ttl5RE
         76Qcu1w1hIcnvH2vIUWFiGFgTpUsv4vwhTlpL7Ycs3wvWLl1SqkmEJcTpyciZL5hTYYo
         ExTsp/Bq/VDl3gGEI+btFEoSigl/6FLRiNdrwrBLnWUwIgOCRpUVKa8/rxerfCo++3f/
         atDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOKkQl332/KMyUkOBbDdjywetIj7rvU1Tibnhf65dW4=;
        b=gz00dpyJqhbRkk/mHOq1ymf6Ithe043mMjzPpJv03xLhngYGo4AZqVpCHO8y4p6IMG
         pZ/qkEKBlCSQ9uAcr7XNffMqgNIpRe7eM3k4EXlPxY+6evRt9uANj7xYxpigQvt7NmOJ
         5/V5tgHVLOUzosf2Z0zAGSvfOr3Z3OXwZiNiZyYpT1b5rW1Eiw8RmLPpcC7Bw3z61xNg
         PydC0rdKYwf02YnQnolZyv0iZIa5jsWO/2FER+vh+bliptJFdG1N4cFsamKGEwsvQPTU
         gcGJurlYy+Zpn8ScD7KETZFtJZY1u8lzwVVOsb72LUdwUyNx36Iz8PvtQEOW+nueAQ/5
         ufww==
X-Gm-Message-State: AFqh2kqZCMTj905/b5DqmkOUYcoYh/MYXzLqsuPVrkiTlV7yGCabIUGf
        lzJ0GZkJ6xC0nHqAoDVf916O+g==
X-Google-Smtp-Source: AMrXdXsa0i7acT+hld5/zUZxm8h+jgNoU4o2b6B3Boir7+Bwo8FSpw0ObVN7xutAJhH9CbpBb/gdZQ==
X-Received: by 2002:a7b:c7ca:0:b0:3d3:4cbf:3a51 with SMTP id z10-20020a7bc7ca000000b003d34cbf3a51mr42474919wmk.14.1673131881801;
        Sat, 07 Jan 2023 14:51:21 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l27-20020a05600c2cdb00b003a84375d0d1sm11705997wmc.44.2023.01.07.14.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 14:51:20 -0800 (PST)
Message-ID: <dd8ce88f-63ab-274a-7992-268003411da1@linaro.org>
Date:   Sat, 7 Jan 2023 23:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Annoying message on the console for the db845c board
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <e0ced334-e6c1-caeb-322a-f67a23ee58da@linaro.org>
 <CAA8EJpr0A=VjWEv6NPaZ-t_3TgNaWpsVO8_inJhxqoThry_zZA@mail.gmail.com>
 <17e2d99d-31e5-b29a-e729-4f4d70b2efbc@linaro.org>
 <CAA8EJprcVT=vyEhU0Nbtr4Wu1YxcGs+NLNxtpTaFtaJSTqvgYw@mail.gmail.com>
 <3afcb445-7a62-ced7-eb54-1b2d8a9085ce@linaro.org>
 <CAA8EJpp8jnZV1Wkw1T6g95s0QNZLKKN_ve+tqmNsFVCFo0wudg@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAA8EJpp8jnZV1Wkw1T6g95s0QNZLKKN_ve+tqmNsFVCFo0wudg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/01/2023 23:07, Dmitry Baryshkov wrote:

[ ... ]

> I've tested the v6.2-rc1. With the firmware from linux-firmware I do
> not see these message. I posted the output of savedefconfig for my
> .config to https://pastebin.ubuntu.com/p/t4KzQ4QWSF/
> 
> Could you please recheck with this input? Maybe something is missing?

Yes, with your config, that has been fixed

Thanks!

Would it make sense to ensure defconfig has the same options to run this 
platform ?

BTW I noted a lock issue: https://pastebin.com/274Xz7Aa

Thanks again for your help

   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

