Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C18C4A338
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 16:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbfFROBE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 10:01:04 -0400
Received: from ns.iliad.fr ([212.27.33.1]:43806 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729389AbfFROBE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 10:01:04 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id D14A91FF57;
        Tue, 18 Jun 2019 16:01:01 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id B991A1FF13;
        Tue, 18 Jun 2019 16:01:01 +0200 (CEST)
Subject: Re: [PATCH v2] ARM: dts: qcom: ipq4019: fix high resolution timer
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Kubelun <be.dissent@gmail.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190615162918.29120-1-chunkeey@gmail.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <91de77a5-c823-3e90-989e-8459c91abed9@free.fr>
Date:   Tue, 18 Jun 2019 16:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190615162918.29120-1-chunkeey@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Jun 18 16:01:01 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/06/2019 18:29, Christian Lamparter wrote:

> From: Abhishek Sahu <absahu@codeaurora.org>
> 
> 

Isn't there a spurious newline there?

> Cherry-picked from CAF QSDK repo with Change-Id
> I7c00b3c74d97c2a30ac9f05e18b511a0550fd459.

Do we really care about the downstream change-id?
Is this publicly available somewhere?

> Original commit message:

Not sure this introduction brings any info.

> The kernel is failing in switching the timer for high resolution
> mode and clock source operates in 10ms resolution. The always-on
> property needs to be given for timer device tree node to make
> clock source working in 1ns resolution.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> 
> v2: fixed subject [Abhishek Sahu is bouncing]
> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index bbcb7db810f7..0e3e79442c50 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -169,6 +169,7 @@
>  			     <1 4 0xf08>,
>  			     <1 1 0xf08>;
>  		clock-frequency = <48000000>;
> +		always-on;
>  	};
>  
>  	soc {
> 
