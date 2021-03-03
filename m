Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD00632C252
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389879AbhCCVsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:48:37 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:51647 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388040AbhCCUeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 15:34:06 -0500
Received: from [192.168.1.101] (abac94.neoplus.adsl.tpnet.pl [83.6.166.94])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BE569201A5;
        Wed,  3 Mar 2021 21:33:18 +0100 (CET)
Subject: Re: [PATCH 08/11] arm64: dts: qcom: pm8994: Add RESIN node
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "angelogioacchino.delregno@somainline.org" 
        <angelogioacchino.delregno@somainline.org>,
        "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <-8dygFkqlPLCYtnwUWBLrCubmjkNhno40CBzzZ2tmlWdpJC1Ihmoe1dpMSvsgoBQ58Idh2v_rBHNEQLIwpTRtpndQm_8nSarmkXlZo975CU=@protonmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <c7e3394a-9cfa-ad9b-8d62-14d7151c54ea@somainline.org>
Date:   Wed, 3 Mar 2021 21:33:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <-8dygFkqlPLCYtnwUWBLrCubmjkNhno40CBzzZ2tmlWdpJC1Ihmoe1dpMSvsgoBQ58Idh2v_rBHNEQLIwpTRtpndQm_8nSarmkXlZo975CU=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 03.03.2021 17:43, Yassine Oudjana wrote:
> In-Reply-To: <20210228130831.203765-8-konrad.dybcio@somainline.org>
>
> I've sent a similar patch[1] a while ago, although I didn't disable resin by default:
> https://lore.kernel.org/lkml/BmEPgqFMiMXOzn9xFz6KSPtOZdWoeJ8zUpGXI_p7U9FBBSgbG2IP6AkuvbWWzy7MVuBkrhOas158Vd9klSLFmrbSRGEpQGouiAFpsf03Ag=@protonmail.com/
>
> Yassine


I'm totally fine with applying Yassine's patch with a `status = "disabled";` line added instead (we don't want RESIN on all devices!).


Konrad

