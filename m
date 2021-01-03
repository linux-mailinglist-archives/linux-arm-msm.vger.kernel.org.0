Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 748972E8B12
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jan 2021 07:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725294AbhACGJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 01:09:41 -0500
Received: from vps5.brixit.nl ([192.81.221.234]:56502 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbhACGJl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 01:09:41 -0500
X-Greylist: delayed 606 seconds by postgrey-1.27 at vger.kernel.org; Sun, 03 Jan 2021 01:09:40 EST
Received: from [192.168.20.102] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id 070B860815;
        Sun,  3 Jan 2021 05:58:52 +0000 (UTC)
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974-klte: Mark essential
 regulators
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20201230155132.3661292-1-iskren.chernev@gmail.com>
 <20201230155132.3661292-4-iskren.chernev@gmail.com>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <b90f4fde-1892-defc-c809-ef767cc5c4b2@postmarketos.org>
Date:   Sun, 3 Jan 2021 08:59:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201230155132.3661292-4-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This indeed fixes device freeze+reboot issue when display powers off.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

On 12/30/20 6:51 PM, Iskren Chernev wrote:
> s1 and l12 regulators are used for the memory and cache on the Samsung
> S5 (klte). If they are turned off the phone shuts down. So mark them as
> always-on to prevent that from happening.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>   arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
