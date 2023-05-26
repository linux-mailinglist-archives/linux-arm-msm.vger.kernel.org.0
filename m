Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED59712E30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 22:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237050AbjEZUho (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 16:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjEZUhn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 16:37:43 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CD6189
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 13:37:41 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f6e72a1464so8639875e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685133460; x=1687725460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQ1db2emsz/QQgEfwdyQh8xsoHGln0PD39oB3KotcgY=;
        b=QDV6bXpxgVjdZCYjaueUqC7sDxGlyL+QRshzwuHQeR7Gn3wmiIWHUFw2eSYmlJjsw2
         x5Sx+UVjmz3agynryaVjr7Ot0/4eMxPn4zGVc1QHnpBM2+SuSvK63DodxFtSK2BT2QoB
         oYnqg3iebEAz73cKbtYz/BunlclddAHXyXEsZMBSS+UB4eiw4M5rpoeXvXf6jvKkgev7
         /dSD52XCaQ+lUXUjlqvvwKGdtLSj3srdNJHpgN3u+HbwFKzHUhYohh6LGk8zfFkQyFsu
         PzMpoZNgTGVvtFOAkUP7DgC/aoSoFxtF20ckANd53E/iHmyB7I7YwSY2sQRpHGLS0kcl
         4uSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685133460; x=1687725460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQ1db2emsz/QQgEfwdyQh8xsoHGln0PD39oB3KotcgY=;
        b=Gn5/+PrFXjQZn22oczRI+Q7jvS4O9qfHSiywt5+bJldAF0ahTlbCWkOdEliy/ejNSu
         4Ika1YR8S+wqSSM0P2v0VWhtia2stAjgifWUamJT2uKKZQ6knVC1SVCEmvKsI8xjBDqs
         y6ftC0sF8rKtoFoGgqxh2KaX93BrsxIXvsWksDz04BlkYI9iWHjDKuQc/mbKPLqnrCXi
         yzUfRFD6zuYd2Fz+5BuVdMuIyVeOH36x0P3pM8noyxmAz6fUEScd8s5NkzosVLIbXOgU
         mfRzHDj59/RXoJFRVv47a0DJX0XVE9fq48ybT1boGyfEBGggi1BaVMlXiB1m2VaXw9BD
         ZtfA==
X-Gm-Message-State: AC+VfDySangX9nLorKqtNBPE/yHq1QHuq2B2yF11PwMDRhLMCQsVOPuX
        AtAwuqXghVimQWu69q+cPpThBMnblXXOwNkDV3eHeA==
X-Google-Smtp-Source: ACHHUZ40q3XSs5WLQgdVvGo1g5dhMEvKEBPjelsqLzd4jNBV41UNS63K73lTpe8odE+oUKb8vzJ+8A==
X-Received: by 2002:adf:dcc4:0:b0:306:2b5a:d8db with SMTP id x4-20020adfdcc4000000b003062b5ad8dbmr2083045wrm.23.1685133460270;
        Fri, 26 May 2023 13:37:40 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q21-20020a1ce915000000b003f421979398sm9758829wmc.26.2023.05.26.13.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 13:37:39 -0700 (PDT)
Message-ID: <66117232-c1c3-f1a0-54fd-9038c299ed55@linaro.org>
Date:   Fri, 26 May 2023 21:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2] clk: qcom: camcc-sc7180: Add parent dependency to all
 camera GDSCs
Content-Language: en-US
To:     "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cponnapa@quicinc.com
References: <20230501142932.13049-1-quic_tdas@quicinc.com>
 <f450c63a57fc5a9536d3c48df26244cf.sboyd@kernel.org>
 <08a6ee40-0729-3573-9938-aa44a6ef297c@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <08a6ee40-0729-3573-9938-aa44a6ef297c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/05/2023 12:10, Satya Priya Kakitapalli (Temp) wrote:
> Hi Stephen,
> 
> On 5/11/2023 1:02 AM, Stephen Boyd wrote:
>> Quoting Taniya Das (2023-05-01 07:29:32)
>>> Camera titan top GDSC is a parent supply to all other camera GDSCs. 
>>> Titan
>>> top GDSC is required to be enabled before enabling any other camera 
>>> GDSCs
>>> and it should be disabled only after all other camera GDSCs are 
>>> disabled.
>>> Ensure this behavior by marking titan top GDSC as parent of all other
>>> camera GDSCs.
>>>
>>> Fixes: 15d09e830bbc ("clk: qcom: camcc: Add camera clock controller 
>>> driver for SC7180")
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Is something broken right now? The commit text doesn't tell me if we
>> need to backport this to stable kernels or merge it as soon as possible.
>> What's the priority of this fix?
> 
> 
> Modularization of camx driver triggered this issue now, but there could 
> be some other scenarios which could trigger the same issue on stable 
> kernels.  Hence it needs to be back ported to stable kernels.
> 

So ... I'm 99% sure we need to do this for all titan IP blocks, not just 
for IFE but BPS, IPE...

I guess I'll spin a series for this.

---
bod
