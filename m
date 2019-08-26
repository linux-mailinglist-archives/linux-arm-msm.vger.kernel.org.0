Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6432F9D478
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 18:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733135AbfHZQuC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 12:50:02 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40024 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732541AbfHZQuC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 12:50:02 -0400
Received: by mail-wr1-f65.google.com with SMTP id c3so15989424wrd.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 09:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9O3VW3qz3WP/gvDFs/gxnhqdNJMrlfVE1S3aHZOLj9E=;
        b=HWMFq+cz5DqcHZUfi0dmj3bx0hOg0UV25W7l6S656MlMQyKPXIcSUcrnzpLxkluIYh
         OilnzePPW1Z6DjubzBLxs+3jW5nIc9WdTQnLjS5oJbRRdZK4303IVNDj1be+qElbZe0q
         /pNOrM/MTeU3voPjffFv9+Zxh3dQEQX2NObtrbLh+9D13NA7qeiD+R6xCNOBYXKJ6XzY
         ku73gyCf5EyxKwaH9e8nWcfrNquMFyPD9L7dsLYjorOlWRMX6dZE+KPXOIQDq4QP+mO+
         R0UjhUAdcM79vu43aHBTs4bUFjC70Do/BKPxrxiLHzADeTtwg9KEvzGRTSooxslorgVu
         SZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9O3VW3qz3WP/gvDFs/gxnhqdNJMrlfVE1S3aHZOLj9E=;
        b=SA1r0KX75gPvntCOVxker856L3LWlRsEFrCTocLW7T5kb8nImpbreWga8XYiO2r5HR
         nAxJdgAepbrbELxJi06ItWhVaijQ49BRvtE+FdCa9Ei1gv9CVGtrKdKWR4WPJl+AN9XB
         jrGHx4kjezn2ee0PLxyzr6nAcLwEEv3T9jPe60X5gt6kKQbt1f8pNXMScEgp7T+RHx2K
         ssUYqsZQv61Weotj8jd3aqSt77Fz4aM88lSTYf0+RZM0vbjr/x3OvM442pzxuYQRPrxa
         RtnVDgWmsHCqKy8/6iyYUgmCHa7ZV5Xbj577Y0NGj+TKiYgbdtnAs7rFH9eS9G3daPOg
         HiaQ==
X-Gm-Message-State: APjAAAWfCaa4M9OYR/nhEEuQk7Jli0ITU5UdFhlaQyCYXazfTR32sLkf
        Q65IilUr0olmnDmOsP4EUXJlwxiwXpg=
X-Google-Smtp-Source: APXvYqzZyta820DGKYuXk323AK7pGPLNWaOkL+Aei8zaUqk5nIuD17ybsHumS8O17dakMKqBLy73gw==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr22117449wri.224.1566838199090;
        Mon, 26 Aug 2019 09:49:59 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id j20sm32590323wre.65.2019.08.26.09.49.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 09:49:58 -0700 (PDT)
Subject: Re: [PATCH v4 00/13] Support CPU frequency scaling on QCS404
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
To:     bjorn.andersson@linaro.org, sboyd@kernel.org,
        david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
References: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
 <f34a75d0-c479-267d-b4a1-c2418d4efb22@linaro.org>
Message-ID: <0098ab9d-9abc-ac9d-5f36-67ad7cbc4f9c@linaro.org>
Date:   Mon, 26 Aug 2019 18:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <f34a75d0-c479-267d-b4a1-c2418d4efb22@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/26/19 08:54, Jorge Ramirez wrote:
> On 7/31/19 22:29, Jorge Ramirez-Ortiz wrote:
>> The following patchset enables CPU frequency scaling support on the
>> QCS404 (with dynamic voltage scaling).
>>
>> It is important to notice that this functionality will be superseded
>> by Core Power Reduction (CPR), a more accurate form of AVS found on
>> certain Qualcomm SoCs.
>>
>> Some of the changes required to support CPR do conflict with the
>> configuration required for CPUFreq.
>>
>> In particular, the following commit for CPR - already merged - will
>> need to be reverted in order to enable CPUFreq.
>>
>>    Author: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>>    Date:   Thu Jul 25 12:41:36 2019 +0200
>>        cpufreq: Add qcs404 to cpufreq-dt-platdev blacklist
>>     
>> Patch 8 "clk: qcom: hfpll: CLK_IGNORE_UNUSED" is a bit controversial;
>> in this platform, this PLL provides the clock signal to a CPU
>> core. But in others it might not.
>>
>> We opted for the minimal ammount of changes without affecting the
>> default functionality: simply bypassing the COMMON_CLK_DISABLE_UNUSED
>> framework and letting the firwmare chose whether to enable or disable
>> the clock at boot. However maybe a DT property and marking the clock
>> as critical would be more appropriate for this PLL. we'd appreciate the
>> maintainer's input on this topic.
>>
>> v2:
>>    - dts: ms8916: apcs mux/divider: new bindings
>>      (the driver can still support the old bindings)
>>
>>    - qcs404.dtsi
>>      fix apcs-hfpll definition
>>      fix cpu_opp_table definition
>>
>>    - GPLL0_AO_OUT operating frequency
>>      define new alpha_pll_fixed_ops to limit the operating frequency
>>
>> v3:
>>   - qcom-apcs-ipc-mailbox
>>     replace goto to ease readability
>>
>>   - apcs-msm8916.c
>>     rework patch to use of_clk_parent_fill
>>
>>   - hfpll.c
>>     add relevant comments to the code
>>
>>   - qcs404.dtsi
>>     add voltage scaling support
>>
>> v4:
>>  - squash OPP definition and DVFS enablement in dts
>>    (patches 10 and 13 in previous version)
>>    
>>  - qcom-apcs-ipc-mailbox
>>    replace return condition for readability
>>    
>>  - answer one question on CLK_IGNORE_UNUSED in mailing list
>>
>> Jorge Ramirez-Ortiz, Niklas Cassel (13):
>>   clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
>>   mbox: qcom: add APCS child device for QCS404
>>   mbox: qcom: replace integer with valid macro
>>   dt-bindings: mailbox: qcom: Add clock-name optional property
>>   clk: qcom: apcs-msm8916: get parent clock names from DT
>>   clk: qcom: hfpll: get parent clock names from DT
>>   clk: qcom: hfpll: register as clock provider
>>   clk: qcom: hfpll: CLK_IGNORE_UNUSED
>>   arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
>>   arm64: dts: qcom: qcs404: Add HFPLL node
>>   arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
>>   arm64: dts: qcom: qcs404: Add DVFS support
>>   arm64: defconfig: Enable HFPLL
>>
>>  .../mailbox/qcom,apcs-kpss-global.txt         | 24 +++++++++--
>>  arch/arm64/boot/dts/qcom/msm8916.dtsi         |  3 +-
>>  arch/arm64/boot/dts/qcom/qcs404.dtsi          | 43 +++++++++++++++++++
>>  arch/arm64/configs/defconfig                  |  1 +
>>  drivers/clk/qcom/apcs-msm8916.c               | 23 ++++++++--
>>  drivers/clk/qcom/clk-alpha-pll.c              |  8 ++++
>>  drivers/clk/qcom/clk-alpha-pll.h              |  1 +
>>  drivers/clk/qcom/gcc-qcs404.c                 |  2 +-
>>  drivers/clk/qcom/hfpll.c                      | 25 ++++++++++-
>>  drivers/mailbox/qcom-apcs-ipc-mailbox.c       | 11 +++--
>>  10 files changed, 128 insertions(+), 13 deletions(-)
>>
> 
> any feedback on this set?
> 
> TIA
> 

trying to ease the maintainers task, I have resent the series split in
three individual sets:

- device tree
- clk
- mbox

for full functionality obviously all of them are required

please let me know if there is anything else I can do.

