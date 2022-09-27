Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3B805ECD2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 21:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbiI0Tvx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 15:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbiI0Tvw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 15:51:52 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6B696FD0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 12:51:50 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id r5so4206211ilm.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vatT0SjX3NY2U9704T3rmB4+zptS7Iq13IphnWVOULo=;
        b=VDBr1DEpZakwgEBBffkB2Y7gaS4rfctKIIdPUO++q9iH+NEtFX7MmB6fK5J86NDeF1
         7s1VoKhiY90lMbhzlP+ktqEW/m3/HwKHi/LVE6KGxbjN39tfbPur203L83F1BlIzOkZk
         gsgquWsyhMlQXu1ycSBaMjtfAnI+/8HuXhSL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vatT0SjX3NY2U9704T3rmB4+zptS7Iq13IphnWVOULo=;
        b=1/ZB2PN4QCNyvZ8+cx0Zc0dK+IEcX6Toe9NBOXx+yjfZBhlBkZM7UNmdy/r/FHwqEP
         2R6z9C5mb2rTs5O941gVrvtSkdlVpphWq1RaSYNwmNVfNXYWLYHkGhm3tBvhKyIuMAKA
         QPJh5PK2qcf9mcRl/JwYvlFt5wIO6n4bOWL3JERyr62720ZsEpGeUGX+qcEKuhGESgNN
         hu5TrOYbkmRhK4B2G6iYM3IBwsgOswJtGIIYJREPLwNykPChQm2Wo6fW7g5dKjOzdpCd
         F6LCjPw8Kfw3W/m+70mRdCx10vOiEM/gcU7QiPe7d0vpoRsnEIME+iWutKuW7//g7btk
         S7rw==
X-Gm-Message-State: ACrzQf0j+NXQ4Zo7datWMr6TFKaPI2YyyxRTIRtMIr9ZV7g4bICzZoYQ
        5gnXT6ZSOtT9lknr1LoT5dl+FQ==
X-Google-Smtp-Source: AMsMyM6og55zbZYLITEuu8TP1VjxOGbk3Q3j7F9cNOMC0TXH6IDFkvCm1KHZdAwgObFe52V3uqJwuA==
X-Received: by 2002:a92:cdae:0:b0:2f5:8aea:654d with SMTP id g14-20020a92cdae000000b002f58aea654dmr13676601ild.135.1664308309819;
        Tue, 27 Sep 2022 12:51:49 -0700 (PDT)
Received: from [172.22.22.26] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id x13-20020a0566380cad00b0035b2f0ebf65sm928031jad.76.2022.09.27.12.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 12:51:49 -0700 (PDT)
Message-ID: <353ae92d-57a2-5ca3-c3dc-c68b6a8f80ab@ieee.org>
Date:   Tue, 27 Sep 2022 14:51:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V13 1/7] dt-bindings: Added the yaml bindings for DCC
Content-Language: en-US
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>, vkoul@kernel.org
References: <cover.1663642051.git.quic_schowdhu@quicinc.com>
 <c6b55a5b44a8add13ea9015542522b2562cf8f60.1663642052.git.quic_schowdhu@quicinc.com>
 <f09fabec-f5a3-df21-f776-956732d60359@kernel.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <f09fabec-f5a3-df21-f776-956732d60359@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/23/22 2:27 PM, Krzysztof Kozlowski wrote:
> On 20/09/2022 05:56, Souradeep Chowdhury wrote:
>> Documentation for Data Capture and Compare(DCC) device tree bindings
>> in yaml format.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>				

Souradeep, I will review v14 (of the code anyway--patch 3) when you send it.

					-Alex
	
>> ---
>>   .../devicetree/bindings/arm/msm/qcom,dcc.yaml      | 44 ++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
> 
> Rebase your tree on some current Linux kernel (and use
> scripts/get_maintainers.pl).
> 
> Best regards,
> Krzysztof
> 

