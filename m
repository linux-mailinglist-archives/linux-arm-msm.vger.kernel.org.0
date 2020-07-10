Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC6821C0DA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgGJXkL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgGJXkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:40:11 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C25C08C5DC;
        Fri, 10 Jul 2020 16:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=MwgubfgOnn4tw/Gmznvx9EZNqV15HqAt1D08KvU1Mbo=; b=Oi9BadDaKVCkPEKsvgxa02EBq9
        uWUTkqeBuHzfd5JFKwP/3jAwR513+AqyRq2NQFWJ1qjsDEP7eTsfFYgIZweWrWFBu+MeKaFt4URFO
        KSVbWTfstvDlGnnjaV+R6OIVTVs6DelpfjcVPY2esIHd+gyeNueAMsqmhOF9yE7o6bFtm/qAxmGOt
        KzUYVry2wX0w0JNP8baACCbEjM+HIVTEXHpfbPzUXH4ibRQ8bkVrlpC7/EHhgqCkxFqu4djorbTu4
        jpq8WQ3gDO8JRZoVIrWnWfRsuNbiSGQMK/ZL/A0VgvSEPIyzJUiDOmKOICvxx1ryvchCyW24/S8u5
        8E7CNF6Q==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ju2ch-0003zF-PC; Fri, 10 Jul 2020 23:40:08 +0000
Subject: Re: [PATCH -next] <linux/of.h>: add stub for of_get_next_parent() to
 fix qcom build error
To:     Rob Herring <robh+dt@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
References: <ce0d7561-ff93-d267-b57a-6505014c728c@infradead.org>
 <CAL_Jsq+AWo6xP1vC1NubFcdWzoX4hVvSW4KGry1NhOXUieDrSA@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <215c3c59-e6f7-1721-76ca-993bbaf91356@infradead.org>
Date:   Fri, 10 Jul 2020 16:40:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+AWo6xP1vC1NubFcdWzoX4hVvSW4KGry1NhOXUieDrSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/10/20 8:28 AM, Rob Herring wrote:
> On Mon, Jun 29, 2020 at 10:43 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> Fix a (COMPILE_TEST) build error when CONFIG_OF is not set/enabled
>> by adding a stub for of_get_next_parent().
>>
>> ../drivers/soc/qcom/qcom-geni-se.c:819:11: error: implicit declaration of function 'of_get_next_parent'; did you mean 'of_get_parent'? [-Werror=implicit-function-declaration]
>> ../drivers/soc/qcom/qcom-geni-se.c:819:9: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>>
> 
> Fixes tag?

Are linux-next hashes/tags stable?

Fixes: 048eb908a1f2 ("soc: qcom-geni-se: Add interconnect support to fix earlycon crash")

>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Frank Rowand <frowand.list@gmail.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: Andy Gross <agross@kernel.org>
>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> ---
>>  include/linux/of.h |    5 +++++
>>  1 file changed, 5 insertions(+)
> 
> I'm assuming this will be applied to the tree that introduced the problem.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

Hi Akash,
Can you add this patch to your tree, as Rob indicated above?

thanks.
-- 
~Randy

