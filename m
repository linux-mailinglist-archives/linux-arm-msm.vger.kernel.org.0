Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCCEA2E8B1C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jan 2021 07:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbhACGQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 01:16:04 -0500
Received: from vps5.brixit.nl ([192.81.221.234]:57538 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbhACGQE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 01:16:04 -0500
Received: from [192.168.20.102] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id 5AA2460811;
        Sun,  3 Jan 2021 06:15:21 +0000 (UTC)
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add gpu support
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Brian Masney <masneyb@onstation.org>
References: <20201230155132.3661292-1-iskren.chernev@gmail.com>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <cf8ccf4e-4889-42d4-3b1c-a2a836bff496@postmarketos.org>
Date:   Sun, 3 Jan 2021 09:16:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201230155132.3661292-1-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested these patches on Samsung Galaxy S5 along with other patches that 
add panel driver and enable vram carve-out option on this device.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

On 12/30/20 6:51 PM, Iskren Chernev wrote:
> From: Brian Masney <masneyb@onstation.org>
> 
> Add support for the a3xx GPU
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>   arch/arm/boot/dts/qcom-msm8974.dtsi | 45 +++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
