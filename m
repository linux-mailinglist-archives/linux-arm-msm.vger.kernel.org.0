Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D1951D86B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 15:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392219AbiEFNEZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 09:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238175AbiEFNEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 09:04:24 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4BF5DA52
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 06:00:41 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id m23so9177946ljb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4fKGcauChNnNj6Bkjnv6oJnHgMdekbY127SG4EaisoQ=;
        b=NTqQwVEgrvIhmuzjnoLH0ASmdp4yJ1+M+HVNmVj3oMz37oTt+X0uxZOL32wGC/G9NI
         V2wwAV5k39R/nxf3CDV3R5jMG6Ns/1+rvzImak5Zi8ZoOqUEbQ0wxKEQQwL+moBJGksl
         nKdZbvuZM2GfWLUG4bbQxiVuInfLRdpTPTJcTQ2+L3F8rjzx2cy/7a0VTgC+0J7MoSHp
         cdzJJClXQQ+2rmCVwatLXnvndGnnCdF84ngipjb4twKgCf/lp1Lo1hrm4dv8IDh41nKO
         txGquwkEvjgflPUy/KqCgch1ec2PhjO9w8AHSFeiYRcoiaR6rYSjxmcL4pWL03WIdJqR
         IsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4fKGcauChNnNj6Bkjnv6oJnHgMdekbY127SG4EaisoQ=;
        b=6a2yZfbRbCyLyD63N49nT8U+62U1BtgFpHxN592+wk/IIOzJs0nkDjr2PmIU6iACVc
         hdSzK8w5Xjm+P4B7QTQwAEHHRN6hBJPSnIsH/KEYUd+Y2hSxcx3gkeXWFqSbaDIMgq1m
         qZKX6KOT+napKB+Hv1BgbeQaSeWMPvyg16P4Gr8bITrfmQupwHCyLb9CH2YRQKBf85+O
         xBck1BzvdcRPYui8+NrvrObmGW/I1PxDO5yKrdA2n3Kk4TPnin9TFKlk6CfWp8M3JrJr
         L+EdXqfHqOkf2rZcb5GDJpyNs8bZTVzBDHL5HmDNyzTHtZjP+kIqdGVzCidJFGSI6sjD
         iQiQ==
X-Gm-Message-State: AOAM532nXlxAsIXAEN6+nDlukXvdE7WlAhsie2P3z6uFKX4dnSEHckv1
        ozZ0uwtunnLQFFPf5f4EkSKqCA==
X-Google-Smtp-Source: ABdhPJxeo7/PbS6ChmPye/wWFWpOHQMU0i4NLfptmnzYiWHYbFa5rCykN1m+WklPx7sxgwyfkWCvAA==
X-Received: by 2002:a2e:875a:0:b0:24f:11e2:319 with SMTP id q26-20020a2e875a000000b0024f11e20319mr2041875ljj.451.1651842039884;
        Fri, 06 May 2022 06:00:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o14-20020ac24bce000000b0047255d211easm673887lfq.281.2022.05.06.06.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 06:00:39 -0700 (PDT)
Message-ID: <30846cb5-a22e-0102-9700-a1417de69952@linaro.org>
Date:   Fri, 6 May 2022 16:00:38 +0300
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YnUXOYxk47NRG2VD@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/05/2022 15:40, Johan Hovold wrote:
> On Mon, May 02, 2022 at 02:18:26PM +0300, Dmitry Baryshkov wrote:
>> On 02/05/2022 14:10, Manivannan Sadhasivam wrote:
> 
>>> I don't understand this. How can you make this clock disabled? It just has 4
>>> parents, right?
>>
>> It has 4 parents. It uses just two of them (pipe and tcxo).
> 
> Really? I did not know that. Which are the other two parents and what
> would they be used for?

This is described neither in the downstream tree nor in any sources I 
have at possession.


-- 
With best wishes
Dmitry
