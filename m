Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4018660796
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 21:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235738AbjAFUIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 15:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236305AbjAFUI1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 15:08:27 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23038408B
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 12:08:25 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id g25-20020a7bc4d9000000b003d97c8d4941so4334392wmk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 12:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9+HW72JLcvyRBnz5C5bVByBYZYS05ui/XR6+SsBR3c=;
        b=rNTzkWFrVk6h1c0XbWOX5bDusbJf+Ejjkg+kpICiEEPo7tuDA4cWbu1f8LqFnmtk/O
         vCxNkjfCwh4XX5GK/ka812+vSjyV1zbvzZCwHI86jW2fvgAwYgFYpWkTdNomnRi3+YC/
         gV4v5AEQaoFHU/bY/5JIE/aQgb+z1Oyxvl1vnXx8G22XqGBi0i1n0tLQQtkLIf8zKLga
         2AtQbmSHdOrp9EpNw7DH6Ts+8+ZHNuuz5geJbXCHLe+Mnyp/GJUttdOfpRv+IRYFQ1m2
         vq2Dg0g756Th5rSnojaY/LLLf49b3rrniUfYCe3zlgavzBRalSHbWbHzRLXXuGUSZ4xC
         y2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9+HW72JLcvyRBnz5C5bVByBYZYS05ui/XR6+SsBR3c=;
        b=CeHSRo/GMX1mmuENSHU+LQ9FJ5KR5NByPvO3qHJ4AiadkOXwcI141fuDiy4x7wX/gO
         gyQ5ToGfaqEv4OqdHI/iSjlCU1fT9iyNyl5cloL0YF7jkrydPF9/v97azaarOrpHhENp
         J7v7uhH2Lp84yLkkeeW+TGi3o9xZZfoBhFgWnjLzJ4PbW86sf0Hmylosytd421g+kYwP
         OIZwJTXD57OiFM6fQERt0+2e7MekeQZxph2xEV+qGI3rPyun2MFcYHhu880VPzdl0EbR
         dU69Y9ZXqRHdGWfT9f3fx19B8kkc7TWqs0jTEHr2jMzA+z4bmsz2NaYVp0ZFMLghJQv3
         C1Xg==
X-Gm-Message-State: AFqh2kprbtDhFRtejQFt+pikn+XZptQrooI4d9sPS5cbi+nAv04uI/qr
        h0e4YTdOpwTdHjA2E3vHuM9Alw==
X-Google-Smtp-Source: AMrXdXs3tTUj9ID+GCgF+VYiLKuPcIGiS2TOdonsG3ogg03JBTKudMK8+1+shmcuLiHK1HgBdO/wng==
X-Received: by 2002:a05:600c:4f83:b0:3d2:3f55:f73f with SMTP id n3-20020a05600c4f8300b003d23f55f73fmr40568114wmq.8.1673035704091;
        Fri, 06 Jan 2023 12:08:24 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id az28-20020a05600c601c00b003cf57329221sm7304548wmb.14.2023.01.06.12.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 12:08:23 -0800 (PST)
Message-ID: <17e2d99d-31e5-b29a-e729-4f4d70b2efbc@linaro.org>
Date:   Fri, 6 Jan 2023 21:08:22 +0100
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
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAA8EJpr0A=VjWEv6NPaZ-t_3TgNaWpsVO8_inJhxqoThry_zZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/01/2023 19:14, Dmitry Baryshkov wrote:
> On Fri, 6 Jan 2023 at 18:37, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>>
>> Hi all,
>>
>> Does anyone have an idea on how to fix these timeout messages ? They are
>> displayed again and again every 5 seconds and that saturates the
>> filesystem after awhile.
> 
> Could you please check that you have CONFIG_QCOM_RMTFS_MEM enabled and
> the rmtfs daemon running?
> I think that's the usual cause of such messages.

Yes, I have the option and the daemon running:

zcat /proc/config.gz | grep CONFIG_QCOM_RMTFS_MEM
CONFIG_QCOM_RMTFS_MEM=y

ps -ef | grep rmtfs
root      9888     1  2 20:07 ?        00:00:00 /usr/bin/rmtfs -r -P -s




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

