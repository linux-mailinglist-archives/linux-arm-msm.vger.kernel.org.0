Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96AD9B384B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 12:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732319AbfIPKg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 06:36:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55036 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbfIPKg1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 06:36:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 0662A28D1E3
Subject: Re: [PATCH 05/11] drm/bridge: analogix-anx78xx: correct value of
 TX_P0
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Brian Masney <masneyb@onstation.org>,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        narmstrong@baylibre.com, robdclark@gmail.com, sean@poorly.run
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
References: <20190815004854.19860-1-masneyb@onstation.org>
 <CGME20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97@epcas3p1.samsung.com>
 <20190815004854.19860-6-masneyb@onstation.org>
 <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <98199a9b-f7e0-ef95-62d7-401273457692@collabora.com>
Date:   Mon, 16 Sep 2019 12:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Andrzej and Brian

On 16/9/19 12:02, Andrzej Hajda wrote:
> On 15.08.2019 02:48, Brian Masney wrote:
>> When attempting to configure this driver on a Nexus 5 phone (msm8974),
>> setting up the dummy i2c bus for TX_P0 would fail due to an -EBUSY
>> error. The downstream MSM kernel sources [1] shows that the proper value
>> for TX_P0 is 0x78, not 0x70, so correct the value to allow device
>> probing to succeed.
>>
>> [1] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/drivers/video/slimport/slimport_tx_reg.h
>>
>> Signed-off-by: Brian Masney <masneyb@onstation.org>
>> ---
>>  drivers/gpu/drm/bridge/analogix-anx78xx.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.h b/drivers/gpu/drm/bridge/analogix-anx78xx.h
>> index 25e063bcecbc..bc511fc605c9 100644
>> --- a/drivers/gpu/drm/bridge/analogix-anx78xx.h
>> +++ b/drivers/gpu/drm/bridge/analogix-anx78xx.h
>> @@ -6,7 +6,7 @@
>>  #ifndef __ANX78xx_H
>>  #define __ANX78xx_H
>>  
>> -#define TX_P0				0x70
>> +#define TX_P0				0x78
> 
> 
> This bothers me little. There are no upstream users, grepping android
> sources suggests that both values can be used [1][2]  (grep for "#define
> TX_P0"), moreover there is code suggesting both values can be valid [3].
> 
> Could you verify datasheet which i2c slave addresses are valid for this
> chip, if both I guess this patch should be reworked.
> 

On my case the valid i2c slave address is 0x70 (from datasheet, very sorry I
can't share it) and the bridge used is an ANX7814, it could be that ANX7808 or
ANX7812 have different slave addresses?

Regards,
 Enric

> 
> [1]:
> https://android.googlesource.com/kernel/msm/+/android-msm-flo-3.4-jb-mr2/drivers/misc/slimport_anx7808/slimport_tx_reg.h
> 
> [2]:
> https://github.com/AndroidGX/SimpleGX-MM-6.0_H815_20d/blob/master/drivers/video/slimport/anx7812/slimport7812_tx_reg.h
> 
> [3]:
> https://github.com/commaai/android_kernel_leeco_msm8996/blob/master/drivers/video/msm/mdss/dp/slimport_custom_declare.h#L73
> 
> 
> Regards
> 
> Andrzej
> 
> 
>>  #define TX_P1				0x7a
>>  #define TX_P2				0x72
>>  
> 
> 
