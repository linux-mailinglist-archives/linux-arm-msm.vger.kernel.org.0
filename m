Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01235620DCB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 11:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbiKHKxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 05:53:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbiKHKxL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 05:53:11 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B9443842
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 02:53:09 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id a29so2122245lfj.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 02:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pvnlh+6jQVGTnMlbQvlJF+pzl4qBxdQKYFvZq7QL9DU=;
        b=hZO2Zbo5AXQ6RvYTkSvOmkBO71VgtRwmVSjiwriKF6uSxQ9ErU8tME8Lp33zUJsZKn
         lulmLIZdO+EqITTI0xW+7EgqLwSIwjG5rwBlEarBg8FbwZUK3TSZC85XFUjr+UuG3RT8
         y4JqbsoiD+Gdm1Y3FYJd5mbRK3hnjoq/07Y5/e+HO8p7gyBLreU7D3QwY4ZGBLpveVq8
         M78FTZJI1RbINuhNhk8bCz4G2gZELiJZzkINg2YbxwADNRDGDuby40DWdWgJ3E85TqeE
         s0tuSprJ/5H6YLubhagwd7d6I4IvaQVnobBlFwjBM/3Qd5lAO+cTtnBSP1VzX/Qe45mw
         YIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvnlh+6jQVGTnMlbQvlJF+pzl4qBxdQKYFvZq7QL9DU=;
        b=dmGc9/U4EsQLX2G2gfsdpG9hI1jd6Acuuzq21pWJ/UknWQEbwNYLT2FeY2kV8OkrjX
         i1guiSPI1G4yi4uDMgSCO1cT+//7vIF0ini52C/OEsjVM/4Hz2U+4Uj70HheUjOk8o/V
         Ibl0vM4MizKYKcU5hNsouPnx01yN9HSBX3COkwxnTIVON4b7P1BT2rC8ODl7991pWHWF
         5evdKwhbSw4ctIHwtg563JnXEjs/+XXZOHS8WhLgXekDLdy6G5ZpOM24OSNq9HTO/0CZ
         gIjQh2widpqfAXuVuZhVNPE2WIUtHlwcNi/h18rI0Ov5vv8bIGsws+OWqyv9+D8mvSJV
         r4Eg==
X-Gm-Message-State: ANoB5plojeuARp5HnMvvKWlRf+TBI1wrM+dOgtpRC0iP1Y1zeWESMyLd
        bkENf+tKiOUfwdeuLyh9Y/7vLw==
X-Google-Smtp-Source: AA0mqf5DIj7iX6LnLoGUriQEoMMuHe8JDk/In8IDczdacT9Dkrk5k+ODU5rB8vsqrSgcqsyALJJcbQ==
X-Received: by 2002:ac2:5d24:0:b0:4b2:a90:a44d with SMTP id i4-20020ac25d24000000b004b20a90a44dmr6466294lfb.322.1667904788136;
        Tue, 08 Nov 2022 02:53:08 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id u21-20020ac24c35000000b00494a1b242dasm1733669lfq.14.2022.11.08.02.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 02:53:07 -0800 (PST)
Message-ID: <ac2e80d9-0abf-a5ef-d425-559a2125af33@linaro.org>
Date:   Tue, 8 Nov 2022 11:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V2 1/2] arm64: dts: qcom: sc7280: Mark all Qualcomm
 reference boards as LTE
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        dianders@chromium.org, jinghung.chen3@hotmail.com
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@somainline.org
References: <20221108092207.8186-1-quic_sibis@quicinc.com>
 <ca515021-326d-6034-2af9-54e73e1cc8fa@linaro.org>
 <e5b529c7-865c-b5d1-c3bf-dc6b162431d7@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e5b529c7-865c-b5d1-c3bf-dc6b162431d7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/11/2022 11:10, Sibi Sankar wrote:
> Krzysztof,
> Thanks for taking time to review the series.
> 
> 
> On 11/8/22 15:04, Krzysztof Kozlowski wrote:
>> On 08/11/2022 10:22, Sibi Sankar wrote:
>>> When the modem node was re-located to a separate LTE source file
>>> "sc7280-herobrine-lte-sku.dtsi", some of the previous LTE users
>>> weren't marked appropriately. Fix this by marking all Qualcomm
>>> reference devices as LTE.
>>>
>>> Fix-suggested-by: Douglas Anderson <dianders@chromium.org>
>>
>> There is no such tag. If it is a fix, use Reported-by. If it is not, use
>> Suggested-by.
> 
> lol I should have just stuck with S-b but found the tag being used a
> number of times. I'll fix this up if the series warrants a re-spin.

It indeed appears in the log. Once (since v5.15). So that's a mistake,
not practice. Common tags are described here:
 - Documentation/process/submitting-patches.rst
 - scripts/checkpatch.pl

Best regards,
Krzysztof

