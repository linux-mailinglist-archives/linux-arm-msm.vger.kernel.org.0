Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6267F52353A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 16:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244493AbiEKORy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 10:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244506AbiEKORx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 10:17:53 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6F466221
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 07:17:52 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q130so2799130ljb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 07:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QLkbrAx06+jvkVbtS5UYxGjlvrJ2cVCpHdFbsnt3f1U=;
        b=u43ByTzx7iKWhV50eafdFjOrBSaRhWuimLKTWBD/yTbAHxN4B27jcMer6s7deUGffz
         9K+1Hg1tcuG2mLmV4jvZL1IEanauvBEzl6ySkPmyJDquyaJeowHznU9D/FK2zhJZXda+
         gGhU9m6lH3f1QycKZUF7IOzCZXNqH7syIWFDAOOyAX2Duv5/26S96j9e56vFoimHIkji
         dS3Q9uORf7k650JXb4vhnRCwrkb9nN+ElNWfCQq6cxsGFv21RmB/JL23r3/r9RfkSL6j
         zdCFFmgoca8cA+SE9sJiHIR+ZEuwM5PpcjC/++pSLfQ6ca3PmtHtd0UbJXhvjfYNPvUz
         boYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QLkbrAx06+jvkVbtS5UYxGjlvrJ2cVCpHdFbsnt3f1U=;
        b=yGfmSdKM04qiKgiapQ2mnSMS07msF+EgXX2nypIde7rQ/6TQr5YWykMn1dLQA7tavl
         6aCvOGLvDXqGTs2Da1OOjQxWWsLdcHLFixusicr8O+8SmrPcLXwbjTSMy8IruwbQRq9E
         YopodVUinvs6z3omqOapRyyo2ORQ//qq8RO2tF3MyX8wKM0+CGBJo9UwnKDKY1NgAFCg
         ptpr1bSqxSZ5de/7Jk7df1wZQAHs4LyPFAT8JH3oUny5wOs+wTwnVSoi5ieui/hhdeTS
         hkuz1xpCfBmBI5AApFFLE85kDt99H8Z3g5q5enTtKj2Ha/Gz2RPIWLSF+os4lVUT8TPV
         Ck4Q==
X-Gm-Message-State: AOAM532JFCTa+kQNiZ6/vD90WNnxvC6BetO93f6xpcE4XsgrtgT0+FCf
        dIwHSZKigjTBxgzvGRbnBL4JaA==
X-Google-Smtp-Source: ABdhPJzoyFVAl1bBz/QL7Beejn3aK/Zh1vaiwiytDr2hDiaBX5iWpm1kqeUcTcTAJdgBwZAdlPKgBw==
X-Received: by 2002:a2e:f12:0:b0:250:bf9c:3d2d with SMTP id 18-20020a2e0f12000000b00250bf9c3d2dmr11400977ljp.452.1652278670472;
        Wed, 11 May 2022 07:17:50 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u25-20020ac25199000000b0047255d210dfsm308742lfi.14.2022.05.11.07.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 07:17:50 -0700 (PDT)
Message-ID: <adb49293-ea59-0a40-27de-4a654a02d456@linaro.org>
Date:   Wed, 11 May 2022 17:17:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 2/5] clk: qcom: regmap: add pipe clk implementation
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <quic_pmaliset@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20220501192149.4128158-1-dmitry.baryshkov@linaro.org>
 <20220501192149.4128158-3-dmitry.baryshkov@linaro.org>
 <20220502101053.GF5053@thinkpad>
 <c47616bf-a0c3-3ad5-c3e2-ba2ae33110d0@linaro.org>
 <20220502111004.GH5053@thinkpad>
 <29819e6d-9aa1-aca9-0ff6-b81098077f28@linaro.org>
 <YnUXOYxk47NRG2VD@hovoldconsulting.com>
 <30846cb5-a22e-0102-9700-a1417de69952@linaro.org>
 <YnjtJuR7ShSsF+mz@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YnjtJuR7ShSsF+mz@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/05/2022 13:29, Johan Hovold wrote:
> On Fri, May 06, 2022 at 04:00:38PM +0300, Dmitry Baryshkov wrote:
>> On 06/05/2022 15:40, Johan Hovold wrote:
>>> On Mon, May 02, 2022 at 02:18:26PM +0300, Dmitry Baryshkov wrote:
>>>> On 02/05/2022 14:10, Manivannan Sadhasivam wrote:
>>>
>>>>> I don't understand this. How can you make this clock disabled? It just has 4
>>>>> parents, right?
>>>>
>>>> It has 4 parents. It uses just two of them (pipe and tcxo).
>>>
>>> Really? I did not know that. Which are the other two parents and what
>>> would they be used for?
>>
>> This is described neither in the downstream tree nor in any sources I
>> have at possession.
> 
> Yeah, I don't see anything downstream either, but how do you know that
> it has four parents then?

4 possible parents (judging from bitfield).

-- 
With best wishes
Dmitry
