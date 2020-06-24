Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553822078D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 18:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404981AbgFXQPZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 12:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404700AbgFXQPY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 12:15:24 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6361C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 09:15:23 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id k15so2416875otp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jTzrkIyHM6YlwLu8OnJrJ+du36mCHfFD6JCb/LI6gk4=;
        b=KZAyUQM1NXgdHZUgSeRjcVOapIcd47VS8JjBHRQxmSmhwlZeYbF54NTnypSdwR1pHN
         Yhc9v0tIxyeYVi4C4DInMj8l4+Gd8gqoD42++YiouUN/4Qj5o0cXNvdJSrMgnHP7tGm9
         xGX5Jn4FfLMIDa6YavfT5RpjDyjFBbbj4cSHCJQyqganWUimY0gF0arwiNG5UJxAQH3B
         BBT768EEtIPZqAyUUKC7kFUOndp6hNJg34YQUqIddJlG77838s3hJMbV7oG7caBolQP+
         vz8MlJlDA4JotwjNEHhV53SONnuO9Q/kGJgAhiq/0qCL1dO5O6cPBg3teq2+bFYMcB8y
         KKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jTzrkIyHM6YlwLu8OnJrJ+du36mCHfFD6JCb/LI6gk4=;
        b=WK5W/y+wys5ZKNPQuUasaRbSn8WnjEzNEIS+Dg+umNmSYjNZHsJklcvQpMbc5oufWN
         pnKDehvEK27zyvnaLLrGhjOATYKMgRaWXl/LcxtNMPbDnnq6fcCgpS0CfgDhmCdP/GaX
         z0ed+mGtUvUZeJjBNuf2cNNu6/+E6l4JsOO/MeeGhpHty6Gd7JOc/UAEqrLp+U/S28lI
         q3xeod2ffG3Xz8tZJG5ws4LS7bx63P1P0AQGMlg0S3gCHs8i/+hsVkxnZyumOmxJrsaD
         7TNJoSm8rwSYW2L7WQ2tTMqgAMMk/rgiJI16zJeTG50aLwF+NuAvSDsU1bdvJBCScgI8
         1/3w==
X-Gm-Message-State: AOAM531IEXURD6Qno+CfutiJotgiDk8jFeqA0JteTM7ICx66bpqdQ8DF
        0edWhdNoa/C0YnZT6vrufz1MsQ==
X-Google-Smtp-Source: ABdhPJz58Mv/UXt5ri7/0odUnLorbJuRhuOGQ3NP9QSmUguP0JQTJkEv9LdE/pWvnDwJVvnKUr6wJg==
X-Received: by 2002:a9d:64d7:: with SMTP id n23mr7671375otl.240.1593015323041;
        Wed, 24 Jun 2020 09:15:23 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id a6sm1005413otb.8.2020.06.24.09.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 09:15:21 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
To:     Stanley Chu <stanley.chu@mediatek.com>
Cc:     Kyuho Choi <chlrbgh0@gmail.com>, Avri Altman <Avri.Altman@wdc.com>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
 <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
 <CAF6AEGvgmfYoybv4XMVVH85fGMr-eDfpzxdzkFWCx-2N5PEw2w@mail.gmail.com>
 <SN6PR04MB46402FD7981F9FCA2111AB37FC960@SN6PR04MB4640.namprd04.prod.outlook.com>
 <20200621075539.GK128451@builder.lan>
 <CAF6AEGuG3XAqN_sedxk9GRm_9yK+a4OH56CZPmbHx+SW-FNVPQ@mail.gmail.com>
 <CAP2JTQJ735yQYSeHgDPqnT0mRUTt1uKVAHacOHmSj3WK48PUog@mail.gmail.com>
 <SN6PR04MB4640DCE37D9D7F4CD99F2195FC940@SN6PR04MB4640.namprd04.prod.outlook.com>
 <CAP2JTQKu77risdNFBy5zwHoRU3qZw2dMi5Hxfi5Tyf6b9GB3XQ@mail.gmail.com>
 <9d3afac3-c245-a746-b029-77aa66c93f9d@kali.org>
 <1592963601.3278.1.camel@mtkswgap22>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <cd531342-cf8a-b3c1-0672-1101f7e4cb52@kali.org>
Date:   Wed, 24 Jun 2020 11:15:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592963601.3278.1.camel@mtkswgap22>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/23/20 8:53 PM, Stanley Chu wrote:
> Hi Steev,
>
> Please help try below simple patch to see if above WriteBooster messages
> can be eliminated.
>
>
> ---
>  drivers/scsi/ufs/ufshcd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index f173ad1bd79f..089c0785f0b3 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6985,6 +6985,8 @@ static int ufs_get_device_desc(struct ufs_hba
> *hba)
>  	    dev_info->wspecversion == 0x220 ||
>  	    (hba->dev_quirks & UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES))
>  		ufshcd_wb_probe(hba, desc_buf);
> +	else
> +		hba->caps &= ~UFSHCD_CAP_WB_EN;
>  
>  	/*
>  	 * ufshcd_read_string_desc returns size of the string

Hi Stanley,

That worked.


 1.
    [    0.704775] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg:
    Unable to find vdd-hba-supply regulator, assuming enabled
 2.
    [    0.704781] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg:
    Unable to find vccq-supply regulator, assuming enabled
 3.
    [    0.704783] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg:
    Unable to find vccq2-supply regulator, assuming enabled
 4.
    [    0.705618] ufshcd-qcom 1d84000.ufshc: Found QC Inline Crypto
    Engine (ICE) v3.1.75
 5.
    [    0.707496] scsi host0: ufshcd
 6.
    [    0.720415] ALSA device list:
 7.
    [    0.720422]   No soundcards found.
 8.
    [    0.734245] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX,
    TX]: gear=[1, 1], lane[1, 1], pwr[SLOWAUTO_MODE, SLOWAUTO_MODE],
    rate = 0
 9.
    [    0.845159] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX,
    TX]: gear=[3, 3], lane[2, 2], pwr[FAST MODE, FAST MODE], rate = 2
10.
    [    0.846399] ufshcd-qcom 1d84000.ufshc:
    ufshcd_find_max_sup_active_icc_level: Regulator capability was not
    set, actvIccLevel=0
11.
    [    0.849258] scsi 0:0:0:49488: Well-known LUN    SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
12.
    [    0.853372] scsi 0:0:0:49476: Well-known LUN    SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
13.
    [    0.855135] scsi 0:0:0:49456: Well-known LUN    SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
14.
    [    0.857050] scsi 0:0:0:0: Direct-Access     SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
15.
    [    0.858297] sd 0:0:0:0: Power-on or device reset occurred
16.
    [    0.859985] scsi 0:0:0:1: Direct-Access     SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
17.
    [    0.860702] sd 0:0:0:0: [sda] 29765632 4096-byte logical blocks:
    (122 GB/114 GiB)

(full dmesg output at https://pastebin.com/Pvfqe42P )

I guess you can throw my Tested-by on there.

Thanks

--Steev

