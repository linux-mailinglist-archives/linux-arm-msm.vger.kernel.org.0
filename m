Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C157777AEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Aug 2023 16:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235652AbjHJOkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Aug 2023 10:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235151AbjHJOkF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Aug 2023 10:40:05 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982C72684
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 07:40:04 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31768ce2e81so981674f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691678403; x=1692283203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhJgOHXr9u4cT9bMh5OumonW9DdlyOpHtBgpXdY3cnI=;
        b=k1i2iONaOJ8JVWaKYYek0M89amcw7INit0zDpR+EDa5KEBFQ4QCH1lmxcjGSyEsMsc
         48G144Ib1hDrtOSxfOtdehvM89CXF9J5EwTbMSI0GzHTz2p1NMffYqF1kR911XGvI2FX
         qaobvX4KKvEespPCSvl7grCiu30GerdbchmmEUfWrtEVAosNqV8DKfqLXSoDl3B0E1cl
         0soc8nHuV2EICv9+Y9cgxaYHAES8qWoiOlEJ3X1TD7/gXSRF14XC1iGtaT01HlTjosei
         vVQI8LFstYq1fDKs5TyZt508gQGrKDcELEsO5FTIEvDZQjZwKpwYT6Uvo8oR0aGQpuv6
         GOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691678403; x=1692283203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhJgOHXr9u4cT9bMh5OumonW9DdlyOpHtBgpXdY3cnI=;
        b=KyIn/117n29ybzC1MAhYdMPX9yDL5+xLOh7uMG+3OlEB/7st4c4AMMVWAICy9QF9Dp
         WrhSJ3G91dtSQIdTtj0whYcP5llGu4Nr22lbnjZoiCRAhhhBR8vCwYfgO8bBENTM1tmB
         0ORahT1XHbr9utmL7Hjboil20aR1R8MX+ESVcdmTTYL8SfBr/8drFRA32oyBuLq335nh
         CaxqX26oXXc1s1ZeQpIP5NnASxEUM8pxmyuxa01BBPpiScyouayjXz5SHewy45LATTDG
         mzh4wbD3XJ3UA/rtIPNPlmpjZnmBjZr0w2Aw5UEpmfsoYxCZKsGpHxQO1aKV2hKYBXCw
         IAaA==
X-Gm-Message-State: AOJu0Yxzr14wbW5+aw3bxgb2yJHFB+U1IXVvQJHlGMhGefNnvLdu+GFl
        PHhLWtcjANP9jb2W+/EQ49PnVQ==
X-Google-Smtp-Source: AGHT+IGFBELzieu6i7eE2I9R2gAe9/VJH8JFT6vuKadapRNp/5Wl7OvgykHlgiXgUxbuzPo0gQ55ew==
X-Received: by 2002:a05:6000:110d:b0:317:f714:3be6 with SMTP id z13-20020a056000110d00b00317f7143be6mr1877289wrw.61.1691678403058;
        Thu, 10 Aug 2023 07:40:03 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h16-20020a5d6e10000000b003176bd661fasm2351062wrz.116.2023.08.10.07.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 07:40:02 -0700 (PDT)
Message-ID: <e0131bc4-72ff-a801-8397-6d7d1a736210@linaro.org>
Date:   Thu, 10 Aug 2023 15:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: apq8016-sbc: Enable camss for
 non-mezzanine cases
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230809202343.1098425-1-bryan.odonoghue@linaro.org>
 <20230809202343.1098425-7-bryan.odonoghue@linaro.org>
 <a23417f0-54e6-4a97-8981-dd7546e2981a@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a23417f0-54e6-4a97-8981-dd7546e2981a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2023 14:32, Konrad Dybcio wrote:
> On 9.08.2023 22:23, Bryan O'Donoghue wrote:
>> When we have no camera mezzanine attached it is still possible to run the
>> test-pattern generator of the CSID block.
>>
>> As an example:
>>
>> media-ctl --reset
>>
>> yavta --no-query -w '0x009f0903 1' /dev/v4l-subdev2
>> yavta --list /dev/v4l-subdev2
>>
>> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:UYVY8_1X16/1920x1080 field:none]'
>> media-ctl -l '"msm_csid0":1->"msm_ispif0":0[1]'
>> media-ctl -d /dev/media0 -V '"msm_ispif0":0[fmt:UYVY8_1X16/1920x1080 field:none]'
>> media-ctl -l '"msm_ispif0":1->"msm_vfe0_rdi0":0[1]'
>> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:UYVY8_1X16/1920x1080]'
>> media-ctl -d /dev/media0 -p
>>
>> yavta -B capture-mplane --capture=5 -n 5 -I -f UYVY -s 1920x1080 --file=TPG-UYVU-1920x1080-000-#.bin /dev/video0
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> Hm.. perhaps the ports could be just defined in soc dtsi?
> 
> Konrad

yeah they should be.
