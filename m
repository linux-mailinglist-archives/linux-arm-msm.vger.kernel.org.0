Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B071472F6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 15:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239487AbhLMOf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 09:35:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235358AbhLMOf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 09:35:28 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F20C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 06:35:28 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id m25-20020a7bcb99000000b0033aa12cdd33so11002531wmi.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 06:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hGa1tSiahrJ9UO+MvLTG7oTsaKn16PQ8xkumFgtJ4UU=;
        b=oMikDdlidS+K4P/Bb7GbM3BRSVuZg3hQkjJ+c31tZFJUuGOP79hlBLJ65klzuSzVZA
         30nCYnLKucoPUVZDHBVNBrLl4B291Sn0c4sF9Lcpw4I9GbP28NZPre/R1Tn33ffFENuh
         uji9oLfhCiP3fkIF4BxPdHFc0ImI7x1bH+Hq5G4kwfAupkqbW7YJzzPSjasMhjQyJYlU
         5c4uGnOXmxivvPnGCxZYV+YqKne6EeOa82OlAV7/O3Cfabf0qi9FhTGy7gNe269fxwYS
         mPVcbDS+EKSU4EMphRNkAaWNAOti9MaCOk6cGL5PdDD/HXss0S4+9Nm/qmYLcSSporoK
         CUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hGa1tSiahrJ9UO+MvLTG7oTsaKn16PQ8xkumFgtJ4UU=;
        b=wrGYSVSNHxaoOuYVHDmGZjYs2HC5joVUPc7mxsCriQKQaamWoCK/DEI8U8Mc++JAgO
         EmYFfbHHbDhEFCe7dnVWP+sGb4O7PcnggXMozD3UI9BlRblsOk6QMVGdV4WV2JvnAfaH
         FWWm9J0hHIgi2lQeeAdxqC208IcfMy80RXvy/0+0J9qPudKizfq6ENcNRCp9KVPMeFu5
         FruQAeUjskRxDBw9Ia1Hp6KQ8HWeWIZRypJWRTX0oSxFHB3kcXUwt0drRhf9lROTjSv/
         OTTD2kknR64Je++9wTzOy9hokKwjWPw/LEU9Geg3XBneP6zXOhH7BsJ9Gn5nZ3Z4678x
         tKUQ==
X-Gm-Message-State: AOAM531wCI5vZzAMxyT6/Lo2PCw7eDxiMFAy9hUKftYhNg+NkHNDYc0c
        pqUv5sib2xcBWBdrFba+Y2HQwg==
X-Google-Smtp-Source: ABdhPJyqZm+YLpbl5LPiojs3H2Nqcf7sM+3AN0becZa1sqSHRPmhysBisPeYM6roIsyi7zU48YOm8g==
X-Received: by 2002:a1c:7d8e:: with SMTP id y136mr37952474wmc.121.1639406126795;
        Mon, 13 Dec 2021 06:35:26 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t189sm7262040wma.8.2021.12.13.06.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 06:35:26 -0800 (PST)
Message-ID: <66ea3601-cf75-eccf-d5f9-f85ffb392f4c@nexus-software.ie>
Date:   Mon, 13 Dec 2021 14:37:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 3/3] wcn36xx: Implement downstream compliant beacon
 filtering
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com
References: <20211213135127.1656258-1-bryan.odonoghue@linaro.org>
 <20211213135127.1656258-4-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20211213135127.1656258-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/12/2021 13:51, Bryan O'Donoghue wrote:
> Downstream facilitates the direct programming of beacon filter tables via
> SMD commands.
> 
> The purpose of beacon filters is quote:
> 
> /* When beacon filtering is enabled, firmware will
>   * analyze the selected beacons received during BMPS,
>   * and monitor any changes in the IEs as listed below.
>   * The format of the table is:
>   *    - EID
>   *    - Check for IE presence
>   *    - Byte offset
>   *    - Byte value
>   *    - Bit Mask
>   *    - Byte reference
>   */
> 
> The default downstream firmware filter table looks something like this:
> tBeaconFilterIe gaBcnFilterTable[12] =
> {
>    { WLAN_EID_DS_PARAMS, 0u, { 0u, 0u, 0u, 0u } },
>    { WLAN_EID_ERP_INFO, 0u, { 0u, 0u, 248u, 0u } },
>    { WLAN_EID_EDCA_PARAM_SET, 0u, { 0u, 0u, 240u, 0u } },
>    { WLAN_EID_QOS_CAPA, 0u, { 0u, 0u, 240u, 0u } },
>    { WLAN_EID_CHANNEL_SWITCH, 1u, { 0u, 0u, 0u, 0u } },
>    { WLAN_EID_QUIET, 1u, { 0u, 0u, 0u, 0u } },
>    { WLAN_EID_HT_OPERATION, 0u, { 0u, 0u, 0u, 0u } },
>    { WLAN_EID_HT_OPERATION, 0u, { 1u, 0u, 248u, 0u } },
>    { WLAN_EID_HT_OPERATION, 0u, { 2u, 0u, 235u, 0u } },
>    { WLAN_EID_HT_OPERATION, 0u, { 5u, 0u, 253u, 0u } },
>    { WLAN_EID_PWR_CONSTRAINT, 0u, { 0u, 0u, 0u, 0u } },
>    { WLAN_EID_OPMODE_NOTIF, 0u, { 0u, 0u, 0u, 0u } }
> };
> 
> Add in an equivalent filter set as present in the downstream Linux driver.
> For now omit the beacon filter "rem" command as downstream does not have an
> explicit call to that SMD command. The filter mask should only count when
> we are inside BMPS anyway.
> 
> Replicating the downstream ability to program the filter table gives us
> scope to add and remove elements in future. For now though this patch
> makes the rote-copy of the downstream Linux beacon filter table, which we
> can tweak as desired from now on.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/net/wireless/ath/wcn36xx/hal.h  |  16 ++++
>   drivers/net/wireless/ath/wcn36xx/main.c |   1 +
>   drivers/net/wireless/ath/wcn36xx/smd.c  | 104 ++++++++++++++++++++++++
>   drivers/net/wireless/ath/wcn36xx/smd.h  |   3 +
>   4 files changed, 124 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/wcn36xx/hal.h b/drivers/net/wireless/ath/wcn36xx/hal.h
> index e9fec110721b5..3351aaf5140df 100644
> --- a/drivers/net/wireless/ath/wcn36xx/hal.h
> +++ b/drivers/net/wireless/ath/wcn36xx/hal.h
> @@ -3468,6 +3468,22 @@ struct beacon_filter_ie {
>   	u8 ref;
>   } __packed;
>   
> +/* Downstream values for the bitmask field */
> +#define WCN36XX_FILTER_CAPABILITY_MASK		0x73cf
> +#define WCN36XX_FILTER_IE_DS_CHANNEL_MASK	0x00
> +#define WCN36XX_FILTER_IE_ERP_FILTER_MASK	0xF8
> +#define WCN36XX_FILTER_IE_EDCA_FILTER_MASK	0xF0
> +#define WCN36XX_FILTER_IE_QOS_FILTER_MASK	0xF0
> +#define WCN36XX_FILTER_IE_CHANNEL_SWITCH_MASK	0x00
> +#define WCN36XX_FILTER_IE_HT_BYTE0_FILTER_MASK	0x00
> +#define WCN36XX_FILTER_IE_HT_BYTE1_FILTER_MASK	0xF8
> +#define WCN36XX_FILTER_IE_HT_BYTE2_FILTER_MASK	0xEB
> +#define WCN36XX_FILTER_IE_HT_BYTE5_FILTER_MASK	0xFD
> +#define WCN36XX_FILTER_IE_OPMODE_NOTIF_MASK	0x00
> +#define WCN36XX_FILTER_IE_VHTOP_CHWIDTH_MASK	0xFC
> +#define WCN36XX_FILTER_IE_RSN_MASK		0x00
> +#define WCN36XX_FILTER_IE_VENDOR_MASK		0x00
> +

> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
> index b05d10f9f6005..e6ee14adbe0da 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.c

> +/* Downstream values for the bitmask field */
> +#define WCN36XX_FILTER_CAPABILITY_MASK		0x73cf
> +#define WCN36XX_FILTER_IE_DS_CHANNEL_MASK	0x00
> +#define WCN36XX_FILTER_IE_ERP_FILTER_MASK	0xF8
> +#define WCN36XX_FILTER_IE_EDCA_FILTER_MASK	0xF0
> +#define WCN36XX_FILTER_IE_QOS_FILTER_MASK	0xF0
> +#define WCN36XX_FILTER_IE_CHANNEL_SWITCH_MASK	0x00
> +#define WCN36XX_FILTER_IE_HT_BYTE0_FILTER_MASK	0x00
> +#define WCN36XX_FILTER_IE_HT_BYTE1_FILTER_MASK	0xF8
> +#define WCN36XX_FILTER_IE_HT_BYTE2_FILTER_MASK	0xEB
> +#define WCN36XX_FILTER_IE_HT_BYTE5_FILTER_MASK	0xFD
> +#define WCN36XX_FILTER_IE_PWR_CONSTRAINT_MASK	0x00
> +#define WCN36XX_FILTER_IE_OPMODE_NOTIF_MASK	0x00
> +#define WCN36XX_FILTER_IE_VHTOP_CHWIDTH_MASK	0xFC
> +#define WCN36XX_FILTER_IE_RSN_MASK		0x00
> +#define WCN36XX_FILTER_IE_VENDOR_MASK		0x00

Well, I didn't mean to do that..
