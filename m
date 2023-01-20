Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F53674E47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 08:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjATHmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 02:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjATHmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 02:42:13 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47875798C4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 23:42:12 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so5245145wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 23:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmqGa1Qj6D/e9e1ov4dTk2Q4eRwYBsgwn9EnteIfffA=;
        b=lSVSHakEyMy8miejxoMOivQAdLRndirkBxlQRwNMwUS9+AaabszZi1wslfnxTbNwj4
         w4dq0LMC04mABQh2aalyAO/g6xXC3CrqMPPmvgu/JtYt+I7y3jdM3WHSVNEKHT6UkHt6
         JlFPfnDeCf0Hxm1MvF4ap6X5YDKvblSw6MmsNewKK/gzhktRPMevWYv2xO/Ffpb542E6
         2SI93/kUEupMdm/RXE4spD+DA8at0G9/8APUmMDrI4h/pewFkXggGR2Mx72h3/y4W3x/
         f8WPl5Ik8Gh6potgTSLLrRRrGpubPX1qIKtvdzBBg/uV95fXQxIISLAG0eyC2+FAsaxZ
         tRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmqGa1Qj6D/e9e1ov4dTk2Q4eRwYBsgwn9EnteIfffA=;
        b=4eW1k6sL5IewX1pYSyF+Te0e1KD74UaozlQQ5pMfEP0/y1fwpTM8cfWuRpok2fGSd7
         IK0nNLxYvJ7gacMto+9MhSW4htP9pWzr1vVTpAb/Dn3urWW1elSW2EwmdSPqbyLgppnY
         JPByeGUPBiWNYLrF1VfuKN4GdcQb+NzOeInR0TmgzwTC70DExyR6oYxr9uCJmSrmM0GB
         0OjCXk5xJTa0L8pS6DYCKOLp7l2RR/AzmTt22qMb5UNgKsH75JUUw09CHMmXSG/eXysh
         0EARa6Q7/28Yg7fOJSdLKrIDEm1qMAt0on596Xk4c1kmRwlNHW5r27z+Qt69Lfe4jiXA
         EiVw==
X-Gm-Message-State: AFqh2kr6Ks2woUls7CthpuNlrHZnpTYakK2sQhRt+S+s29ek+bnSlo5X
        0CkV+yc+dLPDPqppgIRltA/xvg==
X-Google-Smtp-Source: AMrXdXvei+KDchpZ4NbLTqiGqPC7s6x89FqKwKhyCBnJ8HqVDA1spAuFTlMYtqEGfGr9PKRbDZbXMg==
X-Received: by 2002:a05:600c:3514:b0:3db:80c:8ed9 with SMTP id h20-20020a05600c351400b003db080c8ed9mr11872073wmq.22.1674200530840;
        Thu, 19 Jan 2023 23:42:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003db30be4a54sm1120935wms.38.2023.01.19.23.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 23:42:10 -0800 (PST)
Message-ID: <1711636c-8aa1-eccc-eded-14a64baf7bec@linaro.org>
Date:   Fri, 20 Jan 2023 08:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFT PATCH v2 4/6] arm64: dts: qcom: sdm845: move audio to
 separate file
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20230118103458.107434-1-krzysztof.kozlowski@linaro.org>
 <20230118103458.107434-4-krzysztof.kozlowski@linaro.org>
 <46acf2f4-3272-c33d-887f-05d4f4aad4d7@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <46acf2f4-3272-c33d-887f-05d4f4aad4d7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/2023 00:24, Caleb Connolly wrote:
> 
> 
> On 18/01/2023 10:34, Krzysztof Kozlowski wrote:
>> Re-organize SDM845 sound components into separate, audio DTSI which
>> should be included and customized by the SDM845 boards wanting audio.
>> The DTSI includes:
>> 1. WCD9340 codec node because it is not a property of the SoC, but board.
>> 2. Common sound DAI links, shared with all sound cards.
> 
> Hi Krzysztof,
> 
> I know I already reported this on IRC, I thought I'd duplicate the info
> here for completeness sake.
> 
> Due to how the sound node is parsed the device numbers in alsa are
> derived from the index of the sound/mmX-dai-link child nodes.
> 
> For boards which use more than 3 FE's this causes breaking changes in
> userspace, as the slim-dai-link and slimcap-dai-link nodes now come
> before the other mmX-dai-link nodes, for example with my OnePlus 6
> patches "aplay -l" shows:
> 
> card 0: O6 [OnePlus 6], device 0: MultiMedia1 (*) []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 0: O6 [OnePlus 6], device 1: MultiMedia2 (*) []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 0: O6 [OnePlus 6], device 2: MultiMedia3 (*) []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 0: O6 [OnePlus 6], device 5: MultiMedia4 (*) [] <-- 5 instead of 3
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 0: O6 [OnePlus 6], device 6: MultiMedia5 (*) []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 0: O6 [OnePlus 6], device 7: MultiMedia6 (*) []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> This breaks the UCM configs shipped by postmarketOS and Mobian - though
> none of it is "upstream".

Thanks for the report.


> 
> Would it be reasonable to add all 6 FE DAI's and then disable the unused
> ones on a per-board basis?


Or just drop the sound node from the audio DTSI, not sure if there are
benefits in such case...

> 
>>
>> The Xiaomi Polaris, although includes WCD9340 codec, it lacks sound
>> node, so it stays disabled.
>>
>> On all others boards not using audio, keep the Slimbus node disabled as
>> it is empty.

Please trim your replies - there is a lot of unrelated content here and
I don't know if I should keep scrolling to look for something or not.

Best regards,
Krzysztof

