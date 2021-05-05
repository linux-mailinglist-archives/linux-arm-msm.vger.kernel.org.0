Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0003D374887
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 21:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234254AbhEETPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 15:15:35 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:53221 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbhEETPf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 15:15:35 -0400
Received: from [192.168.1.101] (83.6.168.154.neoplus.adsl.tpnet.pl [83.6.168.154])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C7D691F53F;
        Wed,  5 May 2021 21:14:35 +0200 (CEST)
Subject: Re: [RFC PATCH] soc: qcom: socinfo: import PMIC IDs from pmic-spmi
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20210504203752.95555-1-luca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <08fde8a5-1d9f-4676-41c2-133b7a9a1c75@somainline.org>
Date:   Wed, 5 May 2021 21:14:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504203752.95555-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


> The driver in drivers/mfd/qcom-spmi-pmic.c has a more complete and more
> up-to-date list of PMICs with the respective IDs. Use those names for
> socinfo.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> I'm sending this as RFC because I'm not sure what names are correct for
> the IDs that I've replaced (13, 16, 17, 20, 21, 24).
> For PM8941, PM8841, PM8226 and PMA8084 I'm quite sure that the IDs are
> correct, but I don't have devices with the other PMICs. Please advise
> what to do.
>
As far as I'm aware, qcom did the lazy and ugly thing (as they usually do) and

decided to reuse previously-occupied IDs on newer kernel releases, where the legacy

PMICs weren't supported anymore. That's why some IDs have multiple candidates and unless

a better suggestion than "let's check if this 2013 PMIC+ 2019 SoC combo is sane" pops up, we

will probably just have to deal with ambiguity (for example `[20] PM8015/PM8998`).


Konrad

