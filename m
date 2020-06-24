Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894432069E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 04:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387647AbgFXCGi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 22:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730898AbgFXCGi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 22:06:38 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93ECBC061573;
        Tue, 23 Jun 2020 19:06:37 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id h28so326213edz.0;
        Tue, 23 Jun 2020 19:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=xIwy/k4EIgePfJbUB8TkU4ZDBf+LVEQrSNh8LO92njg=;
        b=fDuYCZMCEUyXT4Up9c9ueQstUZFpTtlkZ1gML4tVVjMAjOnyn5/zGi7Pdp5DR0E5co
         Bi4YQ0rqBB/LAm0m/r7Wb3FvhtCHEkYq28vZbH8g8CXjyEr0tacGRRfXQYzbU4nDVIV3
         gARXIfqbM30QBoi1LjVfXzjUcNwokqXOvHQW+C6Wceszyet5JssBMWo4FJWCsdsO6yts
         GMzUFOvH0R7kjWdxXLDItlXUlw67DDSVwNLmUQBLrrceDDlw6rDgJKZGjT6A/Zun7ZSq
         T4eLr/yJgLB1vY3VDmUYQSOw8ii5IW04jfutKhFa8Dz/mgwh5UfKnSJwOowCPTYRwsvK
         /jwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=xIwy/k4EIgePfJbUB8TkU4ZDBf+LVEQrSNh8LO92njg=;
        b=Gc1ioHjb7oA+PnrlNqaTpUTx7kVjdJsWmMqJt74CNXFAs2WWrAA48awUHNDSgcTTO2
         V6/svdBqnpj1Sg0bdzCipza4HKwl1Yq4u5tMUHj4qwJjG8Fcej3BjbdukYavU7gxiPSm
         7VhnbVJVz0L+6YzkklhDOeRTcywjDiKrzETyykU97Kg0nNkBF9HD7GqRsEP1gUpC7Jrp
         cPHf7VGjZ+qBI35j7lVxkXO2MWSWFzIn2UVdht62KW4LASKmCDI+xx9kXZFjv1SFHYje
         aJI80p3y/yQDjZOwFjDA5jneTeKWfnTrUbyAvCK31A+KGxjqzHzr6+I4j/EDpJbCdIsf
         FS3Q==
X-Gm-Message-State: AOAM531dzXPVkmyxTtXlcTbYaaBm1U1wADpq+Xz7YiE9oIhAbiSsI3JV
        o0jbSGInfxQJL4jKTZDcms52Pof2upZD7UubmA==
X-Google-Smtp-Source: ABdhPJzwWEkNgVOp839I7QzHVcei9j6Xcd2vkk8450z+tG1nEjfNNx9ipQ+yYxHa9Ne/v0UQzsplqGnp80fi9d0+9Mc=
X-Received: by 2002:a50:dacf:: with SMTP id s15mr20817852edj.136.1592964396014;
 Tue, 23 Jun 2020 19:06:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa7:ca0e:0:0:0:0:0 with HTTP; Tue, 23 Jun 2020 19:06:34
 -0700 (PDT)
In-Reply-To: <1592963601.3278.1.camel@mtkswgap22>
References: <cover.1586374414.git.asutoshd@codeaurora.org> <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
 <CAF6AEGvgmfYoybv4XMVVH85fGMr-eDfpzxdzkFWCx-2N5PEw2w@mail.gmail.com>
 <SN6PR04MB46402FD7981F9FCA2111AB37FC960@SN6PR04MB4640.namprd04.prod.outlook.com>
 <20200621075539.GK128451@builder.lan> <CAF6AEGuG3XAqN_sedxk9GRm_9yK+a4OH56CZPmbHx+SW-FNVPQ@mail.gmail.com>
 <CAP2JTQJ735yQYSeHgDPqnT0mRUTt1uKVAHacOHmSj3WK48PUog@mail.gmail.com>
 <SN6PR04MB4640DCE37D9D7F4CD99F2195FC940@SN6PR04MB4640.namprd04.prod.outlook.com>
 <CAP2JTQKu77risdNFBy5zwHoRU3qZw2dMi5Hxfi5Tyf6b9GB3XQ@mail.gmail.com>
 <9d3afac3-c245-a746-b029-77aa66c93f9d@kali.org> <1592963601.3278.1.camel@mtkswgap22>
From:   Kyuho Choi <chlrbgh0@gmail.com>
Date:   Wed, 24 Jun 2020 11:06:34 +0900
Message-ID: <CAP2JTQ+kaQKcyaxG8dj_NuB60TwmhhaMkD+gcA+erL7vAOufQA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
To:     Stanley Chu <stanley.chu@mediatek.com>
Cc:     Steev Klimaszewski <steev@kali.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stanley,

On 6/24/20, Stanley Chu <stanley.chu@mediatek.com> wrote:
> Hi Steev,
>
> On Tue, 2020-06-23 at 20:10 -0500, Steev Klimaszewski wrote:
>> On 6/23/20 1:51 AM, Kyuho Choi wrote:
>> > Hi Avri,
>> >
>> > On 6/23/20, Avri Altman <Avri.Altman@wdc.com> wrote:
>> >>> AFAIK, this device are ufs 2.1. It's not support writebooster.
>> >>>
>> >>> I'd check latest linux scsi branch and ufshcd_wb_config function's
>> >>> called without device capability check.
>> >> Please grep ufshcd_wb_probe.
>> >>
>> > I got your point, but as I mentioned, this device not support wb, this
>> > is old products.
>> >
>> > I'm not sure ufshcd_wb_probe are called or not in Rob and Steev's
>> > platform.
>> > If it's called, hba->caps are setted with wb diable and this error not
>> > occured.
>> > But (it looks) not called, same query error will be occured in
>> > ufshcd_wb_config/ctrl.
>> >
>> > BR,
>> > Kyuho Choi
>>
>> I do show ufshcd_wb_probe in my sources - I'm based on 5.8-rc2 with a
>> few extra patches for the c630, and the inline encryption patches.
>>
>> I this is the output that I see -
>>
>>  1.
>>     [    0.702501] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg:
>>     Unable to find vdd-hba-supply regulator, assuming enabled
>>  2.
>>     [    0.702506] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg:
>>     Unable to find vccq-supply regulator, assuming enabled
>>  3.
>>     [    0.702508] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg:
>>     Unable to find vccq2-supply regulator, assuming enabled
>>  4.
>>     [    0.703296] ufshcd-qcom 1d84000.ufshc: Found QC Inline Crypto
>>     Engine (ICE) v3.1.75
>>  5.
>>     [    0.705121] scsi host0: ufshcd
>>  6.
>>     [    0.720163] ALSA device list:
>>  7.
>>     [    0.720171]   No soundcards found.
>>  8.
>>     [    0.731393] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX,
>>     TX]: gear=[1, 1], lane[1, 1], pwr[SLOWAUTO_MODE, SLOWAUTO_MODE],
>>     rate = 0
>>  9.
>>     [    0.893738] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX,
>>     TX]: gear=[3, 3], lane[2, 2], pwr[FAST MODE, FAST MODE], rate = 2
>> 10.
>>     [    0.894703] ufshcd-qcom 1d84000.ufshc:
>>     ufshcd_find_max_sup_active_icc_level: Regulator capability was not
>>     set, actvIccLevel=0
>> 11.
>>     [    0.896032] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
>>     flag query for idn 14 failed, err = 253
>> 12.
>>     [    0.896919] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
>>     flag query for idn 14 failed, err = 253
>> 13.
>>     [    0.897798] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
>>     flag query for idn 14 failed, err = 253
>> 14.
>>     [    0.898227] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag_retry:
>>     query attribute, opcode 6, idn 14, failed with error 253 after 3
>> retires
>> 15.
>>     [    0.898798] ufshcd-qcom 1d84000.ufshc: ufshcd_wb_ctrl write
>>     booster enable failed 253
>> 16.
>>     [    0.899150] ufshcd-qcom 1d84000.ufshc: ufshcd_wb_config: Enable
>>     WB failed: 253
>> 17.
>>     [    0.899918] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
>>     flag query for idn 16 failed, err = 253
>> 18.
>>     [    0.900448] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
>>     flag query for idn 16 failed, err = 253
>> 19.
>>     [    0.901290] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
>>     flag query for idn 16 failed, err = 253
>> 20.
>>     [    0.901749] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag_retry:
>>     query attribute, opcode 6, idn 16, failed with error 253 after 3
>> retires
>> 21.
>>     [    0.902285] ufshcd-qcom 1d84000.ufshc: ufshcd_wb_config: En WB
>>     flush during H8: failed: 253
>> 22.
>>     [    0.903105] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
>>     flag query for idn 15 failed, err = 253
>> 23.
>>     [    0.903988] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
>>     flag query for idn 15 failed, err = 253
>> 24.
>>     [    0.904866] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
>>     flag query for idn 15 failed, err = 253
>> 25.
>>     [    0.905294] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag_retry:
>>     query attribute, opcode 6, idn 15, failed with error 253 after 3
>> retires
>> 26.
>>     [    0.905859] ufshcd-qcom 1d84000.ufshc: ufshcd_wb_buf_flush_enable
>>     WB - buf flush enable failed 253
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

IMO, hba->caps about WB_EN is already set in ufs-vendor.c. So for
writebooster didn't support ufs devices, need to clear this caps.

>
>  	/*
>  	 * ufshcd_read_string_desc returns size of the string
> --
>
>
>
>> 27.
>>     [    0.907659] scsi 0:0:0:49488: Well-known LUN    SAMSUNG
>>      KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
>> 28.
>>     [    0.911082] scsi 0:0:0:49476: Well-known LUN    SAMSUNG
>>      KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
>> 29.
>>     [    0.913268] scsi 0:0:0:49456: Well-known LUN    SAMSUNG
>>      KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
>> 30.
>>     [    0.914580] scsi 0:0:0:0: Direct-Access     SAMSUNG
>>      KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
>> 31.
>>     [    0.915156] sd 0:0:0:0: Power-on or device reset occurred
>> 32.
>>     [    0.915311] scsi 0:0:0:1: Direct-Access     SAMSUNG
>>      KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
>> 33.
>>     [    0.916104] scsi 0:0:0:2: Direct-Access     SAMSUNG
>>      KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
>> 34.
>>     [    0.916318] sd 0:0:0:0: [sda] 29765632 4096-byte logical blocks:
>>     (122 GB/114 GiB)
>> 35.
>>     [    0.916417] sd 0:0:0:0: [sda] Write Protect is off
>> 36.
>>     [    0.916424] sd 0:0:0:0: [sda] Mode Sense: 00 32 00 10
>> 37.
>>     [    0.916589] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
>>     enabled, supports DPO and FUA
>> 38.
>>     [    0.916667] sd 0:0:0:0: [sda] Optimal transfer size 8192 bytes
>> 39.
>>     [    0.916897] sd 0:0:0:1: Power-on or device reset occurred
>> 40.
>>     [    0.917131] scsi 0:0:0:3: Direct-Access     SAMSUNG
>>      KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
>> 41.
>>     [    0.917498] sd 0:0:0:2: Power-on or device reset occurred
>> 42.
>>     [    0.917994] sd 0:0:0:3: Power-on or device reset occurred
>> 43.
>>     [    0.919301] scsi 0:0:0:4: Direct-Access     SAMSUNG
>>      KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
>> 44.
>>     [    0.920207] sd 0:0:0:2: [sdc] 1024 4096-byte logical blocks:
>>     (4.19 MB/4.00 MiB)
>> 45.
>>     [    0.920310] sd 0:0:0:3: [sdd] 32768 4096-byte logical blocks:
>>     (134 MB/128 MiB)
>> 46.
>>     [    0.920312] sd 0:0:0:2: [sdc] Write Protect is off
>> 47.
>>     [    0.920317] sd 0:0:0:2: [sdc] Mode Sense: 00 32 00 10
>> 48.
>>     [    0.920405] sd 0:0:0:3: [sdd] Write Protect is off
>> 49.
>>     [    0.920410] sd 0:0:0:3: [sdd] Mode Sense: 00 32 00 10
>> 50.
>>     [    0.920642] sd 0:0:0:2: [sdc] Write cache: enabled, read cache:
>>     enabled, supports DPO and FUA
>> 51.
>>     [    0.921151] sd 0:0:0:2: [sdc] Optimal transfer size 8192 bytes
>> 52.
>>     [    0.921212] sd 0:0:0:3: [sdd] Write cache: enabled, read cache:
>>     enabled, supports DPO and FUA
>> 53.
>>     [    0.921526] sd 0:0:0:3: [sdd] Optimal transfer size 8192 bytes
>> 54.
>>     [    0.922585] sd 0:0:0:4: Power-on or device reset occurred
>> 55.
>>     [    0.922983] scsi 0:0:0:5: Direct-Access     SAMSUNG
>>      KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
>> 56.
>>     [    0.923490] sd 0:0:0:1: [sdb] 1024 4096-byte logical blocks:
>>     (4.19 MB/4.00 MiB)
>> 57.
>>     [    0.928867] sd 0:0:0:1: [sdb] Write Protect is off
>> 58.
>>     [    0.928870] sd 0:0:0:1: [sdb] Mode Sense: 00 32 00 10
>> 59.
>>     [    0.930887] sd 0:0:0:4: [sde] 1048576 4096-byte logical blocks:
>>     (4.29 GB/4.00 GiB)
>> 60.
>>     [    0.931179] sd 0:0:0:1: [sdb] Write cache: enabled, read cache:
>>     enabled, supports DPO and FUA
>> 61.
>>     [    0.932015] random: fast init done
>> 62.
>>     [    0.932022] sd 0:0:0:5: Power-on or device reset occurred
>> 63.
>>     [    0.935289] sd 0:0:0:4: [sde] Write Protect is off
>> 64.
>>     [    0.935293] sd 0:0:0:4: [sde] Mode Sense: 00 32 00 10
>> 65.
>>     [    0.935396]  sda: sda1 sda2 sda3 sda4 sda5
>> 66.
>>     [    0.936047] sd 0:0:0:1: [sdb] Optimal transfer size 8192 bytes
>> 67.
>>     [    0.936358] sd 0:0:0:4: [sde] Write cache: enabled, read cache:
>>     enabled, supports DPO and FUA
>> 68.
>>     [    0.936865] sd 0:0:0:4: [sde] Optimal transfer size 8192 bytes
>> 69.
>>     [    0.938448]  sdc: sdc1 sdc2
>> 70.
>>     [    0.939470] sd 0:0:0:5: [sdf] 393216 4096-byte logical blocks:
>>     (1.61 GB/1.50 GiB)
>> 71.
>>     [    0.939743] sd 0:0:0:5: [sdf] Write Protect is off
>> 72.
>>     [    0.939747] sd 0:0:0:5: [sdf] Mode Sense: 00 32 00 10
>> 73.
>>     [    0.940609] sd 0:0:0:5: [sdf] Write cache: enabled, read cache:
>>     enabled, supports DPO and FUA
>> 74.
>>     [    0.940837] sd 0:0:0:5: [sdf] Optimal transfer size 8192 bytes
>> 75.
>>     [    0.940984] sd 0:0:0:0: [sda] Attached SCSI disk
>> 76.
>>     [    0.941150] sd 0:0:0:2: [sdc] Attached SCSI disk
>> 77.
>>     [    0.945814]  sdd: sdd2 sdd3
>> 78.
>>     [    0.945983]  sdf: sdf2 sdf3 sdf4 sdf5
>> 79.
>>     [    0.946701]  sde: sde1 sde2 sde3 sde4 sde5 sde6 sde7 sde8 sde9
>>     sde10 sde11 sde12 sde13 sde14 sde15 sde16 sde17 sde18 sde19 sde20
>>     sde21 sde22 sde23 sde24 sde25 sde26 sde27
>> 80.
>>     [    0.953610]  sdb: sdb1 sdb2
>> 81.
>>     [    0.954035] sd 0:0:0:5: [sdf] Attached SCSI disk
>> 82.
>>     [    0.954131] sd 0:0:0:4: [sde] Attached SCSI disk
>> 83.
>>     [    0.954177] sd 0:0:0:3: [sdd] Attached SCSI disk
>> 84.
>>     [    0.955316] sd 0:0:0:1: [sdb] Attached SCSI disk
>>
>> Full dmesg output at https://pastebin.com/azWahunu
>>
>>
>> -- Steev
>>
>
>
