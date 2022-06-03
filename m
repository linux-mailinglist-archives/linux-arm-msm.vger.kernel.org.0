Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C2453C764
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 11:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbiFCJVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 05:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242995AbiFCJVg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 05:21:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A363A181
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jun 2022 02:21:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j10so11640698lfe.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jun 2022 02:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=znBdlMbfX1GAYndIxEL6L68ey32IXbsATO8ijdQ1BKE=;
        b=QWKb0MgLpF7c9f4d0itaacfFynpTJfZfeuQuQWXxQqzmhuJOuAMJohhYx1adJuNpqP
         tazaCix09UILs6vpCcwRCB+4aEezVw1omzI4U/a81sga1U3DvX0ZmsaBEe31Xt3YLGgB
         7sU9OHqclSw8e1SVMXsSd8C07hzKO1qKlCHZ1peJ41DXE6B8HhKVCurIcIziqSYjGVSC
         RPYlktOWTUgQCDg6qjmMOI9Tq5puknAuu/q1UprW2WrKwtc8IIeNl775zcff2wUMYOXq
         nDSwSB2sMCVnM1s7LTnqLzUKq/vJ03+s3D7VfUAUQWzUOqO4+oWyhHAI0NRPcEvRY//j
         z3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=znBdlMbfX1GAYndIxEL6L68ey32IXbsATO8ijdQ1BKE=;
        b=wafHLmUGByN3pSUqIFWxtweIaq2lyS+Ps+AOj2MxcHHgyDgUhvIx8zyh9WzaYZjDau
         ZZPxR09aIN+2ov0zWzL465QGUmhcXH7ApR56tOgeney7mwMKQzPIotiT0AT5Mbb7NrmA
         1nINF1zve75mw4p39U0NP9ZxZzRUIAXor90zgpLcC4lU7hwkRA+HoaWcSaMWctXsZShT
         336s0uYpmvK9Zou7DwAVttvn+EL68yy0Y9U6+WEb2czLEvOBl2NQQSnkNacWrVQm+hLY
         FiPvUqzunJwYzGNqxql8tLDE3ovkSUZWe5KNZukfygqxz6dkn84Yq0yEZHonsOQSu7V4
         ozKA==
X-Gm-Message-State: AOAM531D0gMhVNqt3dtH3AcqWQ/rvRxwA+8C6oVsYDHii+WOL5U9GGT+
        JkWFMHKWSLsWv8OAxK0J2UDFrw==
X-Google-Smtp-Source: ABdhPJxlJqvV5ZadKNB3+UERyT6y2fMzECASgz6J9AcjzN9d5fOeoogHBTEgC6v3SzhXgiO2OOpUJw==
X-Received: by 2002:a05:6512:3b28:b0:478:8355:2c88 with SMTP id f40-20020a0565123b2800b0047883552c88mr37602534lfv.395.1654248092473;
        Fri, 03 Jun 2022 02:21:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o20-20020ac24c54000000b0047917faa676sm353033lfk.33.2022.06.03.02.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 02:21:31 -0700 (PDT)
Message-ID: <af3212f7-c068-33fe-9c00-707028349ca0@linaro.org>
Date:   Fri, 3 Jun 2022 12:21:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v9 2/5] clk: qcom: gcc-sm8450: use new
 clk_regmap_phy_mux_ops for PCIe pipe clocks
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20220603075908.1853011-1-dmitry.baryshkov@linaro.org>
 <20220603075908.1853011-3-dmitry.baryshkov@linaro.org>
 <YpnDkbuZO3jCbxdF@hovoldconsulting.com>
 <bec5ec2a-b749-21ba-e406-fb5799a3df57@linaro.org>
 <YpnLQS5lvMbxpUVj@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YpnLQS5lvMbxpUVj@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/06/2022 11:50, Johan Hovold wrote:
> On Fri, Jun 03, 2022 at 11:42:47AM +0300, Dmitry Baryshkov wrote:
>> On 03/06/2022 11:17, Johan Hovold wrote:
>>> On Fri, Jun 03, 2022 at 10:59:05AM +0300, Dmitry Baryshkov wrote:
>>>> Use newly defined clk_regmap_phy_mux_ops for PCIe pipe clocks to let
>>>> the clock framework automatically park the clock when the clock is
>>>> switched off and restore the parent when the clock is switched on.
>>>>
>>>> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
>>>> Tested-by: Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
>>>
>>> The Tested-by tags you added are malformed throughout the series, please
>>> review and respin (there should be two separate tags for R and T).
>>
>> Hmm, I wonder how did that happen. Probably they came from your message
>> and I didn't notice that they were broken.
> 
> You're right, I messed up when I replied to the v7 cover letter. Sorry
> about that and thanks for fixing it up.

No problem. Thanks a lot for your continuous review and testing!

-- 
With best wishes
Dmitry
