Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F161B673641
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 12:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjASLBR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 06:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjASLBJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 06:01:09 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2547E70C6B
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 03:01:03 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so3300699wmb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 03:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EeGAqrfnaMqHhXn+fesK0LO0w9RhCIO69ufxIucqGQ4=;
        b=j5fPN239VO7CGuPDw0nWo2IuJDq6j/Z8+SdHUiNK2P0zh116wOeLq5nWc76k3vicIx
         1imNJgRhpbt7jIn6z8z8R5Bw1LMFAkT4CpdSYqfY5Nwxp1Nv5Rk//xYcw4Gc5ieaKp4f
         +X8ddpI4CKfcf3vrTeo+74h83aTGUwWp95dzdBSWl31CsY91N1l8sNMSETisIbP9avhH
         P85LI9WzGhYyWIkZhYN5e13r3yB0u0Ed3R9dacxiyRRxs5UFd7arJLjSLGOi5iitN7nt
         pbM4+FNyTv0vsB+jXs4jSHR5jvXSfNzrUsQVo7tzQWvuIDwORyXAIC2ja4+E3rxnw83W
         Yvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EeGAqrfnaMqHhXn+fesK0LO0w9RhCIO69ufxIucqGQ4=;
        b=inIxovF5w5iNUxsHY43JThsY/S8W6d/0IijT2XWp1Bg9yaJe+7n4z956j3z1AytJh0
         fkROP2bwC9CEJ9VeOqb4N7XQ3kFa2vDYulW/v4SmZgV2nxmuxDnidOcwEkUmoh83f9le
         nZywDXcLEF7Jae7QEk316PpB4InH/zYzc6/6e3gTbw6Op2oHWhRJNpOlzmlOvLXJdWb8
         nrcXYmbmQ/DpZlVhc1SdHN2OA60l29v48MQGjSCiaYKWL3NPRLoQ2+KmGJ/9GYRrik6t
         QrTmsAgwhEgcgDdw9bSmnYoYhXNyWD/B+qpFbQ+rej/Y27EouV9SV9ol1w+4e4LTkUbU
         kF9A==
X-Gm-Message-State: AFqh2korKLLgD/Z1WxHohT01BxYNg1/99ZioHRvZ6mWIga397+HUaVFv
        3K7bDBNs16vjpB0JkMJJ+vbyTg==
X-Google-Smtp-Source: AMrXdXsRC0MZSuvOW1aKbfxRpR83K2ySsRX/3zn/1i8NoAU2D343B/n3197EvQhCQFFa2oJvNx+E1w==
X-Received: by 2002:a05:600c:1c1b:b0:3d9:ebf9:7004 with SMTP id j27-20020a05600c1c1b00b003d9ebf97004mr9467839wms.29.1674126061689;
        Thu, 19 Jan 2023 03:01:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id iv8-20020a05600c548800b003b47b80cec3sm5335621wmb.42.2023.01.19.03.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 03:01:01 -0800 (PST)
Message-ID: <30393a75-b8ab-2087-4f76-8f1008f816d7@linaro.org>
Date:   Thu, 19 Jan 2023 12:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8350: Use 2 interconnect cells
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>, agross@kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
        rfoss@kernel.org
Cc:     robert.foss@linaro.org
References: <20230117115712.1054613-1-rfoss@kernel.org>
 <167408614052.2989059.12874514471754492819.b4-ty@kernel.org>
 <41b0c0cc-3ef5-362c-a09e-97a2ffca8e1f@linaro.org>
In-Reply-To: <41b0c0cc-3ef5-362c-a09e-97a2ffca8e1f@linaro.org>
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

On 19/01/2023 11:50, Krzysztof Kozlowski wrote:
> On 19/01/2023 00:55, Bjorn Andersson wrote:
>> On Tue, 17 Jan 2023 12:57:11 +0100, rfoss@kernel.org wrote:
>>> From: Robert Foss <robert.foss@linaro.org>
>>>
>>> Use two interconnect cells in order to optionally
>>> support a path tag.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/1] arm64: dts: qcom: sm8350: Use 2 interconnect cells
>>       commit: 4f287e31ff5f464526651ee3cb3fd3e96b2e5746
> 
> 
> I don't think this is correct patch. We talked that this must be rebased
> on my interconnect cells change and I think it wasn't :(

Ah, let's just fix it with one more patch:

https://lore.kernel.org/linux-arm-msm/20230119105434.51635-1-krzysztof.kozlowski@linaro.org/T/#u

Best regards,
Krzysztof

