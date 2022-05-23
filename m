Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEEA53185B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 22:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243510AbiEWSUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 14:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243874AbiEWSSr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 14:18:47 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D53BC6C4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 10:57:30 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id l13so20228209lfp.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3JUxPxSVnYumG4wMpN+SiUT7prCdQ8x6bZcRTYUwMTw=;
        b=tT4JXu3U2N5URrBf7XXpDgcDRX6QwnwnGsM+FJYMVrugAn/0ck50LC3Ck7f2WUG+b3
         UdAuio8E4dbFsYHRzMIGnxcdwMDc3zPMNIqIFp4vmTKKJcCdS2XelNJiyduKfqKFOtey
         OdifCeoBGIWr1JVXay928xA6/rHPdCXVpIfDdO6bN2eMsw8zUlQ5bikeBjTAemuM47z7
         rINIIjiw2cqBLXkSjwotSBhrVlCQ6fYlbNAQZolbb2xyi34eioyAjEAJ2vHfWeBjToeq
         NGN00Ps+8W6qR/f7S6Fj3yMemCKVr5XWJeDWzBLex7aXwm1zQkMWFnmWHnyEuOHuDMXt
         zf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3JUxPxSVnYumG4wMpN+SiUT7prCdQ8x6bZcRTYUwMTw=;
        b=XCF5R6GfkPjgs40x5yeVJO0i33w152WvmKiMoSlxw6eGjLZ7JhwYt2L1y4XSGrob+2
         TjAikcy4/acHdqkbffS/lnFThHBnz7+XZCckDZJNLVJmtSabkAHZLr9v6cw2UrZpdUf1
         v+LAWqw873ef63KaORuSkMShFfnRjDFQAk1lms+isYqIXzgx0H1ybAEBXAiL80lW+bNe
         nQ2Wugh7Xdq11DxTybsoog/0ZhYtbw/3fSKTrT3NyydwaLF/HfmHFtcCbA1nne0vFq4Q
         FE08LuXFT7S4xOy5GW5i6zCBpNG67qWkjXCo4ihfIl9CxKzRPfVZs453bcwkDpjI57IM
         V+eA==
X-Gm-Message-State: AOAM532YUH0JB6BuJjY23ECQfpEL5QpX9+6kG7vf8ZreU0xANgACZQMi
        zo2Dcob9DZkbsQK1e5zKITyMkw==
X-Google-Smtp-Source: ABdhPJyb1n/Iwdio+i6AZEAt1gAFenNdwifbYFK0I53gke8ob0YjzFXoB+g2ameOvrxDPWTp6quhOA==
X-Received: by 2002:a05:6512:1188:b0:473:a4b3:8479 with SMTP id g8-20020a056512118800b00473a4b38479mr17300845lfr.247.1653328575928;
        Mon, 23 May 2022 10:56:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j14-20020ac2454e000000b00477cab3374asm1982977lfm.303.2022.05.23.10.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 10:56:14 -0700 (PDT)
Message-ID: <2270763e-78f7-9537-c6f3-31c1341f98dc@linaro.org>
Date:   Mon, 23 May 2022 20:56:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 0/8] PCI: qcom: Rework pipe_clk/pipe_clk_src handling
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
References: <20220521005343.1429642-1-dmitry.baryshkov@linaro.org>
 <YotL2rqv8N9+jmpV@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YotL2rqv8N9+jmpV@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/05/2022 11:54, Johan Hovold wrote:
> On Sat, May 21, 2022 at 03:53:35AM +0300, Dmitry Baryshkov wrote:
>> PCIe pipe clk (and some other clocks) must be parked to the "safe"
>> source (bi_tcxo) when corresponding GDSC is turned off and on again.
>> Currently this is handcoded in the PCIe driver by reparenting the
>> gcc_pipe_N_clk_src clock.
>>
>> Instead of doing it manually, follow the approach used by
>> clk_rcg2_shared_ops and implement this parking in the enable() and
>> disable() clock operations for respective pipe clocks.
>>
>> Changes since v7:
>>   - Brought back the struct clk_regmap_phy_mux (Johan)
>>   - Fixed includes (Stephen)
> 
> So this is v8, but Subject still reads v7.
> 
> It looks like you also dropped the CLK_SET_RATE_PARENT flags in this
> version.

Yes. It was not there originally. And I don't think we really set the 
rate for the pipe clock (and support setting it for the phy's pipe output).

> 
> For the series:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan


-- 
With best wishes
Dmitry
