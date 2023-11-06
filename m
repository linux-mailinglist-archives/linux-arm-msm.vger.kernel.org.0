Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC0F7E1FF9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 12:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjKFL2C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 06:28:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjKFL2C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 06:28:02 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E1E8F
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 03:27:59 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4079ed65471so32556845e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 03:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699270077; x=1699874877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgu4VlyFL3wFZ/EhhZcfLZcE5W5jhq1icY2j3A5/BBw=;
        b=f8V4Oc9h57Rbw5gzqJfsY30rCTFG4Od31vNO4rfy1TkuQIZm9sTANw0H+Nm9Y9jFob
         Ucy6OfBDwzdbxegaQr8eKVgJ11bC8rRR8e0iFy9AD+eXjXgJQ2tWHq1Cixb+taborx7Z
         wgYBG13cNCsSuKx/V6zOncIJ70245xZr7O9bq0LgkxpVx7LKzpwgrM58LKhULHxe27qm
         xgpLoUHErypfmXweX0cdQwArr1nQyBbbCJF1mi6ZV6ap/Xk/naOYZeMAnxy9Rkrb7zk2
         pG3eflD4MFwSwfslEBYBfFleCCE1qFqKiovbOuRlLXx2KT08sPVYoM7+fKwKN/UF5WVq
         CJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699270077; x=1699874877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgu4VlyFL3wFZ/EhhZcfLZcE5W5jhq1icY2j3A5/BBw=;
        b=i6HOjlt5OyR9BeDxqtDrG12j7Wnf1MqwbPWagH7/pvH5RRqWqGuZJq2ZgCp0MhrhLP
         SLEtcPS7MYeYvPEkfhrRpWT4TsCZ6tnZu5GsQUEFhPe38W7QW1OCNIUiH+jNPT1Duhhd
         puer5g4McBkO019N7hAKJDBdJ3W1x8yhdzlqp3eI9DOj2FumX3+AmpuWMQo+fIDiOd7L
         OEvSj9vgaKtOAMwDr5HYCGDH/YTNXAjGeXq9B4XIIS21WDKn/pj8qilwQDiply77KO2j
         LU8fLoQZfdVm0qj9/alOAyodH2BMjme5GcVEKgBDHzS4cDI8s6I+c6kVKQdBVwFkZ8PP
         /neg==
X-Gm-Message-State: AOJu0YwRFxqbnjhpmWh2JY4IKoW/VEkyVRQISmmIEtGMyg0WhQMyP8wO
        n9zzkSw4ZXU+HlzIL7+OZdo/sg==
X-Google-Smtp-Source: AGHT+IFOQ9Km+YPXN9cfucx1lHK5kUvP6h20DdURvLEgxsfs7t9FuitRV6Teu6xK7zypOHLy+Wm+iw==
X-Received: by 2002:a05:600c:5488:b0:401:2ee0:7558 with SMTP id iv8-20020a05600c548800b004012ee07558mr24505156wmb.32.1699270077365;
        Mon, 06 Nov 2023 03:27:57 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f21-20020a7bcc15000000b0040773c69fc0sm11723228wmh.11.2023.11.06.03.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 03:27:56 -0800 (PST)
Message-ID: <ee3f92c1-afb9-482a-9d37-d86a05f8eb8b@linaro.org>
Date:   Mon, 6 Nov 2023 11:27:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: External display on the x13s?
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org
References: <ZUUrMm1Q/PI5xv6a@brian-x1>
 <181bdfdc-01ef-4e60-ad62-623884cb3d6a@linaro.org>
 <20231103185309.GW3553829@hu-bjorande-lv.qualcomm.com>
 <a3c7b627-ca22-43ce-89f8-48a26c5df34f@linaro.org>
 <ZUidVUomjf8GMzrG@hovoldconsulting.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZUidVUomjf8GMzrG@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/11/2023 08:01, Johan Hovold wrote:
> On Sat, Nov 04, 2023 at 02:54:45PM +0000, Bryan O'Donoghue wrote:
>> On 03/11/2023 18:53, Bjorn Andersson wrote:
>>> On Fri, Nov 03, 2023 at 05:37:36PM +0000, Bryan O'Donoghue wrote:
>>>> On 03/11/2023 17:17, Brian Masney wrote:
>>>>> I have Fedora 39 running on my x13s (with some minor tweaks to the grub
>>>>> BLS boot entry) and it has working GPU, sound, battery status, etc. I
>>>>> see the external display port in the DTS, however it's not working for
>>>>> me. I have pd-mapper and qrtr installed. Does anyone have any
>>>>> suggestions for enabling that? dmesg doesn't give any useful
>>>>> information.
> 
>>>> Run gnome and run the display @ < 2k
> 
>>> Brian's question makes it seem like he doesn't have any display, your
>>> <=2k only relates to the display artifacts that you have, right?
> 
>> I had an idea Gnome was working but lxqt was not, testing this a bit I
>> get the second display up if the display port is connected to the port
>> furthest away from the screen, not the port closest to the screen.
> 
> Works fine on both ports here so that could also indicate a
> (configuration) problem with your user space.

Maybe. I've apt update/apt upgrade -y as at ~ 30 minutes ago and I see 
gnome-shell crashing with the second port -> nearest the screen.

Not the mutter related backtrace though.

kde plasma seems happy with both ports.
sway uses both ports.

Looks like something specific to gnome shell.

gdm doesn't show anything in journalctl but does appear to restart
sddm is fine but, then again displays only on the laptop screen.


> The port closes to the screen is the second port ("Unknown20-2", "USB-2"
> or soon "DP-2"), which may or may not be relevant.
> 
>> Plugging the cable in and out at the gdm prompt seems to crash gdm.
> 
> I don't use Gnome, but that sounds like it could be related to the
> mutter issue Brian mentioned. Have your verified that you have that fix?


> Try booting to a VT console (stop whatever display server you are using)
> and then plug in the USB connector in order to confirm that the issue is
> in user space. You should see the console mirrored on your external
> display.

Works.

Looks gnome shell specific to me.

