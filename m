Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF933B0D58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 21:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbhFVTCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 15:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbhFVTCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 15:02:41 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA3DC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 12:00:25 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 02DC33F3F8;
        Tue, 22 Jun 2021 21:00:19 +0200 (CEST)
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: msm8994-angler: Disable
 cont_splash_mem
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20210622185023.14597-1-petr.vorel@gmail.com>
 <e89c7fd4-95a9-1047-64d1-32d0bcd2d6ce@somainline.org>
 <YNIyua0NC6lQLzCd@pevik>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <52e0b5a3-e623-d507-7088-b8224f380780@somainline.org>
Date:   Tue, 22 Jun 2021 21:00:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNIyua0NC6lQLzCd@pevik>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 22.06.2021 20:58, Petr Vorel wrote:
> Hi Konrad,
>
>> I'm terribly sorry for not asking for this before, but could you please add a comment above
>> the /delete-node/ explaining the weird firmware situation? It hasn't happened before to any
>> board to my knowledge..
> I thought explaining in the commit message would be enough, but sure comment
> does not harm => I'll send v4.

Maybe I'm just too young, but I rarely ever read those and I am pretty sure

I'm not alone in this manner, heh


Konrad
