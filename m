Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56474E735
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 13:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfFULgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 07:36:01 -0400
Received: from ns.iliad.fr ([212.27.33.1]:60418 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726229AbfFULgB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 07:36:01 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 2EFD0206B9;
        Fri, 21 Jun 2019 13:36:00 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 1364E20687;
        Fri, 21 Jun 2019 13:36:00 +0200 (CEST)
Subject: Re: [PATCH v3] clk: qcom: msm8916: Don't build drivers by default
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <0171956f-b367-9f3b-f690-71657d8c50ec@free.fr>
 <fe935706-b18d-8966-a447-c1fb2be25c85@linaro.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <d6f20e7b-2609-faf3-3dfa-aba644d8a9b6@free.fr>
Date:   Fri, 21 Jun 2019 13:36:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fe935706-b18d-8966-a447-c1fb2be25c85@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Jun 21 13:36:00 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/06/2019 15:47, Georgi Djakov wrote:

> On 19.06.19 14:44, Marc Gonzalez wrote:
> 
>> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
>> built by default. List them in defconfig after dropping the default.
>> 
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> ---
>>  arch/arm64/configs/defconfig | 2 ++
>>  drivers/clk/qcom/Kconfig     | 2 --
>>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Sorry, I wasn't very clear. IMHO the defconfig change should be a
> separate patch and the v2 of this patch is ok as it is. It would just
> make things easier to merge.

Oh, I see. Could you give your Ack on patch 2 then?

Would the defconfig change go through the clk tree?
Or maybe through the qcom tree?

Regards.
