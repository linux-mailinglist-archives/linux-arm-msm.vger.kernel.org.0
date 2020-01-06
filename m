Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0A41314E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 16:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgAFPey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 10:34:54 -0500
Received: from nbd.name ([46.4.11.11]:58558 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbgAFPey (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 10:34:54 -0500
Received: from pd95fd65f.dip0.t-ipconnect.de ([217.95.214.95] helo=[192.168.45.104])
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1ioUP7-0003xU-77; Mon, 06 Jan 2020 16:34:53 +0100
Subject: Re: [PATCH 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
References: <20200106153325.1281420-1-robert.marko@sartura.hr>
From:   John Crispin <john@phrozen.org>
Message-ID: <99688b30-b3d6-e1c7-7a4c-9ff2e7b3cd38@phrozen.org>
Date:   Mon, 6 Jan 2020 16:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200106153325.1281420-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/01/2020 16:33, Robert Marko wrote:
> +
> +#define PHY_CTRL0_VAL	0xA4600015
> +#define PHY_CTRL1_VAL	0x09500000
> +#define PHY_CTRL2_VAL	0x00058180
> +#define PHY_CTRL3_VAL	0x6DB6DCD6
> +#define PHY_CTRL4_VAL	0x836DB6DB
> +#define PHY_MISC_VAL	0x3803FB0C
> +#define PHY_IPG_VAL	0x47323232

This patch was previously nak'ed as the magic values are considered 
black box FW blobs
	John
