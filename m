Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEA4C14A10A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 10:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgA0Jnm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 04:43:42 -0500
Received: from nbd.name ([46.4.11.11]:47004 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727295AbgA0Jnl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 04:43:41 -0500
Received: from [134.101.211.174] (helo=[10.255.191.27])
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1iw0vk-0000iV-20; Mon, 27 Jan 2020 10:43:40 +0100
Subject: Re: [PATCH v2 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
References: <20200106153711.1282414-1-robert.marko@sartura.hr>
From:   John Crispin <john@phrozen.org>
Message-ID: <85e05bdd-6f33-2f05-6c32-9892203da9e6@phrozen.org>
Date:   Mon, 27 Jan 2020 10:43:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200106153711.1282414-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/01/2020 16:37, Robert Marko wrote:
> +#define PHY_CTRL0_ADDR	0x000
> +#define PHY_CTRL1_ADDR	0x004
> +#define PHY_CTRL2_ADDR	0x008
> +#define PHY_CTRL3_ADDR	0x00C
> +#define PHY_CTRL4_ADDR	0x010
> +#define PHY_MISC_ADDR	0x024
> +#define PHY_IPG_ADDR	0x030
> +
> +#define PHY_CTRL0_VAL	0xA4600015
> +#define PHY_CTRL1_VAL	0x09500000
> +#define PHY_CTRL2_VAL	0x00058180
> +#define PHY_CTRL3_VAL	0x6DB6DCD6
> +#define PHY_CTRL4_VAL	0x836DB6DB
> +#define PHY_MISC_VAL	0x3803FB0C
> +#define PHY_IPG_VAL	0x47323232

looks like this was some cruft from silicon bringup days, current mass 
production silicon has these values as power-on defaults. please resend 
with the register writes and defines simply removed.
	John
