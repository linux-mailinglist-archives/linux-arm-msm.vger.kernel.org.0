Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234B966E51B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 18:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235039AbjAQRll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 12:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbjAQRkd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 12:40:33 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E37521D5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 09:33:46 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id g10so22865086wmo.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 09:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9X/E0nTuGg/ziYb/sqmkQprPxdu3YzscqPmDsFFV0A=;
        b=XL51Sdalg82WE+JbLXz2SEBksj+gjR62nkt4OBlAalqXk0EgjRcohyFDzhBxNcSjpP
         o83Z8TyUspsUYg7ojxlj/77unJED9W7maQDtSjFs6PqFtziXLzM5SydD5zLrE1edKgUL
         g6fE7WZ8R9oG4cqdG/Gd+lfL7j3pGG37+8TF04Xye8h5Si1afbg4UV0XySn27QxamMl9
         QneAMxb1z2s6hQ83ZW+cRXQz0SD9teCbdlX1glNqfpo/tiO55hXoH8gMQvSWrakRO5rc
         4ze35KGmUc7WLSUhxBosJVhWMdnwFrcffGd4fVSWb+CnJjEmKjRgBQ0M7ME8oZC5aw9h
         EZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9X/E0nTuGg/ziYb/sqmkQprPxdu3YzscqPmDsFFV0A=;
        b=ao1Yu9dpYaikDrwy9IwvX+PvZxYAvgwcpF65jGMnIBVYMA8J5s2+CmiuJtY5hIeGiC
         r50aesJkC2ylzZgIHCBWMXJx//UyK/8Ei/n9Df/D3e10vimUjRYeKuzS8vtB+zmnYAlf
         diwSMEg9mjFkRT7ZEr2gQ1z4W3MG5t7xAM5W6TXljqZTxWGexvyA0vvHB8hkzsaNhdYa
         xxEoHnkI1atbx3BX/oDzzaAA/B8X6LWBfED9DrIM004SqXbzcPFveOsmVJICovBOZDAn
         GvCcCadaDCxMWxONl3q4NiAE5N5aYgC5rg5yPklnJmAqT+J2GSVwTQ0ol1Jgi56E4N+L
         RSPw==
X-Gm-Message-State: AFqh2kqdkETnA0pilZweXIStVNZrXUxZ/Wjpyytr0NVqjJOczGspoAqo
        mwxBEs9X/OJN4rDXkZW6PbJv9g==
X-Google-Smtp-Source: AMrXdXsv+55G5FnSXPMY9NBzuWWVoycH0E4lbFURb3YtiipIhLiTvNKCbWm0MGOZRJa7Bi5vFbDrOQ==
X-Received: by 2002:a1c:7415:0:b0:3da:fd07:1e3 with SMTP id p21-20020a1c7415000000b003dafd0701e3mr3750361wmc.22.1673976824626;
        Tue, 17 Jan 2023 09:33:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id he12-20020a05600c540c00b003d9ddc82450sm36592707wmb.45.2023.01.17.09.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 09:33:43 -0800 (PST)
Message-ID: <754f8193-09ec-8bbf-e0d4-898525dc242f@linaro.org>
Date:   Tue, 17 Jan 2023 18:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc7280: Add cpu and llcc BWMON
 (=> interconnect issue)
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
References: <20220902043511.17130-1-quic_rjendra@quicinc.com>
 <20220902043511.17130-5-quic_rjendra@quicinc.com>
 <Y8Ggh6RObbB1cxSS@google.com>
 <dc5487d8-d31e-28c6-07e8-8d1ff54a4ba4@linaro.org>
 <Y8baZWlKB9vNGYJw@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y8baZWlKB9vNGYJw@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 18:27, Matthias Kaehlcke wrote:
> 
>>> which would set the initially bandwidths to 0 and determine the actually
>>> needed bandwidth. But since the driver isn't probed the initial
>>> bandwidths stay at INT_MAX.
>>>
>>> This isn't actually an issue with this patch, but how the interconnect
>>> framework deals with devices that are registered on the bus, but aren't
>>> probed (yet). Not sure how this would be best fixed. Georgi, do you have
>>> any ideas?
>>
>> Why the device is not probed (yet)? If it is registered, it will come
>> soon during boot up.
> 
> Because CONFIG_QCOM_ICC_BWMON is not enabled for the board in question (see
> above). It could be enabled as a short term mitigtion, however we shouldn't
> require drivers to be enabled just because the DT has a corresponding node.

It's the same case as with all other interconnect leafs/consumers. The
same behavior if you do not have it enabled, right? If not, I wonder
what is here different?

Best regards,
Krzysztof

