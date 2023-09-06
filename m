Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92225793D2C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 14:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbjIFMze (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 08:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjIFMzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 08:55:33 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEE810CC
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 05:55:30 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c336f5b1ffso25518965ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694004929; x=1694609729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/4hkBYyJ5Fo8pHsHiL3xt5mZBV889/2jclxebFibyE=;
        b=kye33kOlxfoQ9d8Bd4SaQmrJVXkyYArcamnhdv6864PcWZiVY01W0dNPsdw7uHH7Nw
         QX6xqNl5ic4EmwR2J1ii1SuQKVF1u0rDCf70naJto8FNowDzpQIUJMo2cfDhQO7kFIOa
         oQ8ktjs+5w/S1VcFGicnhNdkoVS9HFLN4Z2Hqijfc5WI4vjKs7O5Af7L+GRMC0vYNBkq
         iR9EhVoYW36uMoXKi+ykoTCEPeTL5jCdHlUmJKC+aZpt01KBPv4dgoBAJfo+wKEKqaE+
         MnENWmiPkB1L0oa1gWMxcWPxEB9wUmVAE946+XZE4JAxpBNAJop9XH8/AQEa1n5osGYp
         ucZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004929; x=1694609729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/4hkBYyJ5Fo8pHsHiL3xt5mZBV889/2jclxebFibyE=;
        b=geBAGFmZ6+IQdT898IuUfjZCROP3SKhXqdJAiCl28Uys5I4d5cAwMOfvEFageNjluc
         zPh0l83rNUDhZBJERUKuPhGKYtlZXsDp0PN7/nvaHxtPrxMThUzLjSFviFBmYzFaJgOr
         DGnCPDQ085RzyZzgJBvZU07FaybVjj5W8uiXlj5CYYPhgewN8UwA7ab8MepHhBoMNP5x
         ah4DpgmhRRHjLq7YOE8fSqtGmM9q/6hxgg+dLloPNGgiN1Dpa61BleGT6XxfnUHYVg5j
         Havq0WRoQN9IfJRT5F/I9gKgV910xFQ+XRznznpToLbAMXB35591azWRyVjOOMRIX2oX
         9kGw==
X-Gm-Message-State: AOJu0YzXd9HHLM4BmzSX8Y4TO/0YZXxGhdgLIpg9VEJzDC2eMSAyi9FW
        WG7/sUVljPS2OwP6+3M7WUR7bQ==
X-Google-Smtp-Source: AGHT+IG+mnCD12BigIkQxODBvjdLpYOtw/DmfkMXZ1d9K9VGk8GwwdVr5boL4hDXXfVUfXUwfcFmyQ==
X-Received: by 2002:a17:90a:604f:b0:263:4815:cb9a with SMTP id h15-20020a17090a604f00b002634815cb9amr14783724pjm.41.1694004929589;
        Wed, 06 Sep 2023 05:55:29 -0700 (PDT)
Received: from [172.20.5.224] (076-053-041-226.inf.spectrum.com. [76.53.41.226])
        by smtp.googlemail.com with ESMTPSA id fv10-20020a17090b0e8a00b0026f5dd4ba28sm1063434pjb.1.2023.09.06.05.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 05:55:29 -0700 (PDT)
Message-ID: <ec577a00-413d-d07a-015f-f42a41787257@linaro.org>
Date:   Wed, 6 Sep 2023 05:55:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [GIT PULL] Add soft link for Audio topology firmware for SC8280XP
 X13s platform
To:     Johan Hovold <johan@kernel.org>, linux-firmware@kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-kernel@vger.kernel.org
References: <cd373622-9c44-4fe4-011a-73e879e8667a@linaro.org>
 <ZPhdT9gr1AUt0Gxq@hovoldconsulting.com>
Content-Language: en-US
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZPhdT9gr1AUt0Gxq@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Johan,


On 06/09/2023 04:06, Johan Hovold wrote:
> Hi Srini (and linux-firmware),
> 
> I was going to send a reminder about this not having been merged yet,
> but it appears you managed to screw up the recipient list somehow so
> that it was never even sent to linux-firmware@kernel.org:
My bad. let me rebase those to latest and send a new PR, including 
correct recipients.

thanks,
srini
> 
> 	https://lore.kernel.org/all/cd373622-9c44-4fe4-011a-73e879e8667a@linaro.org/
> 
> As this is needed for audio on the Lenovo ThinkPad X13s, can we try to
> get this merged as soon as possible, please.
> 
> Not sure if you need to resend the pull request or if the above (and
> below) will suffice.
> 
> On Mon, Jul 24, 2023 at 02:11:16PM +0100, Srinivas Kandagatla wrote:
>> The following changes since commit c7824580d310809b55f95626b4b46954911be820:
>>
>>     Merge branch 'v2.0.21961' of
>> https://github.com/yunfei-mtk/linux_fw_10bit (2023-07-24 08:30:51 -0400)
>>
>> are available in the Git repository at:
>>
>>   
>> https://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git
>> sc8280xp-audio-fw-fixes
>>
>> for you to fetch changes up to a8b2a94c58f5cd9dc93b56dbdce83c867ea1e916:
>>
>>     linux-firmware: add link to sc8280xp audioreach firmware (2023-07-24
>> 14:05:12 +0100)
>>
>> ----------------------------------------------------------------
>> Srinivas Kandagatla (1):
>>         linux-firmware: add link to sc8280xp audioreach firmware
>>
>>    WHENCE | 1 +
>>    1 file changed, 1 insertion(+)
> 
> Johan
