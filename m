Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7620C32C255
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389939AbhCCVsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:48:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388053AbhCCUld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 15:41:33 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D596DC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 12:40:38 -0800 (PST)
Received: from [192.168.1.101] (abac94.neoplus.adsl.tpnet.pl [83.6.166.94])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A48B91FAD9;
        Wed,  3 Mar 2021 21:40:33 +0100 (CET)
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Add usb3 interrupts
To:     Yassine Oudjana <y.oudjana@protonmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <dvfyYKA9vnJdunbQ1CL-dgjXtv_1wYpRnezdc3PHoCyrgmfi5KP0Dn4MtaumQEpHIQAHL9tTdqcaCK7YJWyrdWXCrPeGd4uMh-nFeu7xQYw=@protonmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <8401b0c6-3386-9041-6f12-e56a24ec3e6e@somainline.org>
Date:   Wed, 3 Mar 2021 21:40:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <dvfyYKA9vnJdunbQ1CL-dgjXtv_1wYpRnezdc3PHoCyrgmfi5KP0Dn4MtaumQEpHIQAHL9tTdqcaCK7YJWyrdWXCrPeGd4uMh-nFeu7xQYw=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Patchwork didn't pick this up for some reason, but I guess it's only important that it hit the maintainers.


Tested-by: Konrad Dybcio <konrad.dybcio@somainline.org>

