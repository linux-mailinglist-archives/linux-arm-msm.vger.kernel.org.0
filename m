Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADEA6AB3AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 01:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjCFA1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Mar 2023 19:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjCFA1H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Mar 2023 19:27:07 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01DE10ABC
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Mar 2023 16:27:06 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id cy23so31845933edb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Mar 2023 16:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UqGQIswusbX1+IzXDd2bRK/LnduXXQOEOgtMhwl5Wlg=;
        b=UX2CHZiIi6pGHy88xWA/XlAZk/opFkJbEZxlSGe6AaGbW4bwr/EZ7BoyZvyVzKlNJe
         zAydwlciy2P7Nsh5Gkq/RcunYLbynzkSrdtJihMe8uuEGRGLGsXxid6UDF1zsU8Y3roE
         HSWdq4bCLkvsxduJ79auB4G/94SxFgSni7mlxM5ROq+jiEIcYu+5SWUnbDz8K0ize85r
         QUhXZF2OVLIK6fErNnJ1aidqYGlb77vfWVH0zo5y6iXJAfCjXKe6Bzn6cm0TcvARRGGd
         N1TiOd+NTw95/SCR+GFhFi3xlkhl6YWEauTAPyq+KImtQ5cLObwHnCIjEZ8t5gCDOgSd
         qLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqGQIswusbX1+IzXDd2bRK/LnduXXQOEOgtMhwl5Wlg=;
        b=vLVkBmxMxUPhf8Lo707s4tJoD2EEwj1zg7CsgsH1bDjhxkHQekI1FMVSfFk0XnFPRl
         nXUXqOutm53qnSZVeckVMUiYE1QQX4JOiHbn787d8u77NWZ74rY1lTR07JDEb3vx5CuB
         qdFhkEbSlOR9xprt3VYfeDiUPXwIPpYGSOqOHlaWvnhvRXPtb+Y1vuCOICklcdK0gLMV
         eqOVCWDKKXiREweTxhUQhqjR8WbC+qz837T1+eOuRg7K+x1un60f/uez5v1wR1ygyrBF
         ftqu1Yp+MTaZxD8WgxZJJ6we62GWxwGEHXvxsU//SGegtzRtVm0be7sAqj1o2HuC7bNB
         RcxQ==
X-Gm-Message-State: AO0yUKWJWcqAwbf2Cex8aUcN98LSsvXeCmMgfcBC2MFvf153Bu9Ik9Id
        +V2RRHSPcZ5e3JkLAzNzgIM3jg==
X-Google-Smtp-Source: AK7set/Y0bMWzeij9P4IUe9ITLEEryvEsf4976fwFOF2+jK6GXHhgzHlrNkzgPKxoASS1zcx7XLr2w==
X-Received: by 2002:a17:907:3e0e:b0:8b2:a42:5c3a with SMTP id hp14-20020a1709073e0e00b008b20a425c3amr11471846ejc.70.1678062425132;
        Sun, 05 Mar 2023 16:27:05 -0800 (PST)
Received: from [10.203.3.194] ([185.202.34.81])
        by smtp.gmail.com with ESMTPSA id 22-20020a508756000000b004c0ac1df341sm4364649edv.50.2023.03.05.16.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 16:27:04 -0800 (PST)
Message-ID: <ab663641-8bef-b9c6-27fa-0097c564ca36@linaro.org>
Date:   Mon, 6 Mar 2023 02:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT 01/20] clk: qcom: smd-rpm: Add .is_enabled hook
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
 <20230303-topic-rpmcc_sleep-v1-1-d9cfaf9b27a7@linaro.org>
 <CAA8EJpq4tkOKOkaCPwr6nggzJQm3ubRAVgEF1pK38wzmmXizRA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAA8EJpq4tkOKOkaCPwr6nggzJQm3ubRAVgEF1pK38wzmmXizRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/03/2023 02:21, Dmitry Baryshkov wrote:
> On Sat, 4 Mar 2023 at 15:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> From: Shawn Guo <shawn.guo@linaro.org>
>>
>> The RPM clock enabling state can be found with 'enabled' in struct
>> clk_smd_rpm.  Add .is_enabled hook so that clk_summary in debugfs can
>> show a correct enabling state for RPM clocks.
> 
> There is a small problem with this patch: now if the bootloader leaves
> a clock enabled for some reason and there are no Linux users for that
> clock, clk_disable_unused_subtree() will consider this clock disabled
> and will not disable the clock on its own.
> And at this stage of smd-rpm platforms support I think we better off
> finding missing clock consumers rather than depending on the
> bootloader for some of the setup.

Argh. And then I understood that without the patch clk_core_is_enabled 
will shortcut to core->enable_count, which also means that the clock 
will be skipped.

But now I have another question: since r->enabled follows 
core->enabled_count, can we get rid of r->enabled and switch to 
core->enable_count? This might mean adding clk_software_is_enabled() 
function for your patch.

-- 
With best wishes
Dmitry

