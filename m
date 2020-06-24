Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE945206957
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 03:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388204AbgFXBKI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 21:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388117AbgFXBKG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 21:10:06 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D718C061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 18:10:06 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e5so331746ote.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 18:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YHO2KpBlFtGeO3sib6ldvX22eZ/csFiYDOkx1ObXgnk=;
        b=fqdzsET01J+Oh3gF40qsDOJYFDAzDrkVm8BWMLWSpXVAX8bVQ1xM6xupwRPCp4tpoV
         lgxqUJdAL5yy3GL59Lck+25Z+WwaynwcVIfqs5bpx1XSJ4gZogIrUOHTDOR3NEmr5PCt
         4b8Obj+g6UbGcCFwHnfxSVPWXE+4AClPeW6/wXA1+vywLJ1wv/dcqrZsnPI/XfA07vHc
         Q4kuNJhLdyegQLcLjGzAQvOs9fxmh5OAT40SDGI4x+qCsg297+ynvVAgqcLuokW/8hYL
         kSoZbvtJ/HDBqUSyJGE9xTdm1o/DIffqTtQpD8xciilPwMAt1wt0IFDZGJcyIMfD616b
         Va+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YHO2KpBlFtGeO3sib6ldvX22eZ/csFiYDOkx1ObXgnk=;
        b=klk4r+zIBX7Bvv7/oAnWruaxSc8UsTGP50TYmgmCmlkZ8SABBshQXgLf6JCiw1xYlv
         9qJwKtitDJkgGi9qP1SrvKKOfTpGrQtrXPDF85VJWnnHFfpzQwo0Zc/utYDbB67r0LZL
         YevvK31q7/dcVvTvH8ZSlpROyndVEQDZcApmc7LVHRTqb06wby88TFnhAfnA9DaxuvD2
         24YhGJqmW7r5b9LeUMZG26jEnWT10uiWVK0sXRuSPHIocSePor1Xw1wMDvTstCtFcLhA
         bizimKvEGT/zqNOLY7nv5udzq/kPVf/tkWs1CXDZVC6f8LC8HhvVycIWYzD7HnsYKdoE
         TE0Q==
X-Gm-Message-State: AOAM532HqzvKkA8rmUshYU55U1F3hc/7a2ARJLaGegMc7N59DGnq2p0z
        lKcpyX36pGo1dcy7FDmWlOgh/w==
X-Google-Smtp-Source: ABdhPJyzq0n3CHz6YV4IwKYvMp8gU4bq4L812gzSY3qMwgYWMLSdm+99DNC61gAp8GmMpjq9D9AsQA==
X-Received: by 2002:a05:6830:15c4:: with SMTP id j4mr22399077otr.4.1592961005521;
        Tue, 23 Jun 2020 18:10:05 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id o2sm4443010ota.14.2020.06.23.18.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 18:10:04 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
To:     Kyuho Choi <chlrbgh0@gmail.com>, Avri Altman <Avri.Altman@wdc.com>
Cc:     Rob Clark <robdclark@gmail.com>,
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
        Stanley Chu <stanley.chu@mediatek.com>,
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
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <9d3afac3-c245-a746-b029-77aa66c93f9d@kali.org>
Date:   Tue, 23 Jun 2020 20:10:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAP2JTQKu77risdNFBy5zwHoRU3qZw2dMi5Hxfi5Tyf6b9GB3XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/23/20 1:51 AM, Kyuho Choi wrote:
> Hi Avri,
>
> On 6/23/20, Avri Altman <Avri.Altman@wdc.com> wrote:
>>> AFAIK, this device are ufs 2.1. It's not support writebooster.
>>>
>>> I'd check latest linux scsi branch and ufshcd_wb_config function's
>>> called without device capability check.
>> Please grep ufshcd_wb_probe.
>>
> I got your point, but as I mentioned, this device not support wb, this
> is old products.
>
> I'm not sure ufshcd_wb_probe are called or not in Rob and Steev's platform.
> If it's called, hba->caps are setted with wb diable and this error not occured.
> But (it looks) not called, same query error will be occured in
> ufshcd_wb_config/ctrl.
>
> BR,
> Kyuho Choi

I do show ufshcd_wb_probe in my sources - I'm based on 5.8-rc2 with a
few extra patches for the c630, and the inline encryption patches.

I this is the output that I see -

 1.
    [    0.702501] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg:
    Unable to find vdd-hba-supply regulator, assuming enabled
 2.
    [    0.702506] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg:
    Unable to find vccq-supply regulator, assuming enabled
 3.
    [    0.702508] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg:
    Unable to find vccq2-supply regulator, assuming enabled
 4.
    [    0.703296] ufshcd-qcom 1d84000.ufshc: Found QC Inline Crypto
    Engine (ICE) v3.1.75
 5.
    [    0.705121] scsi host0: ufshcd
 6.
    [    0.720163] ALSA device list:
 7.
    [    0.720171]   No soundcards found.
 8.
    [    0.731393] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX,
    TX]: gear=[1, 1], lane[1, 1], pwr[SLOWAUTO_MODE, SLOWAUTO_MODE],
    rate = 0
 9.
    [    0.893738] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX,
    TX]: gear=[3, 3], lane[2, 2], pwr[FAST MODE, FAST MODE], rate = 2
10.
    [    0.894703] ufshcd-qcom 1d84000.ufshc:
    ufshcd_find_max_sup_active_icc_level: Regulator capability was not
    set, actvIccLevel=0
11.
    [    0.896032] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
    flag query for idn 14 failed, err = 253
12.
    [    0.896919] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
    flag query for idn 14 failed, err = 253
13.
    [    0.897798] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
    flag query for idn 14 failed, err = 253
14.
    [    0.898227] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag_retry:
    query attribute, opcode 6, idn 14, failed with error 253 after 3 retires
15.
    [    0.898798] ufshcd-qcom 1d84000.ufshc: ufshcd_wb_ctrl write
    booster enable failed 253
16.
    [    0.899150] ufshcd-qcom 1d84000.ufshc: ufshcd_wb_config: Enable
    WB failed: 253
17.
    [    0.899918] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
    flag query for idn 16 failed, err = 253
18.
    [    0.900448] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
    flag query for idn 16 failed, err = 253
19.
    [    0.901290] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
    flag query for idn 16 failed, err = 253
20.
    [    0.901749] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag_retry:
    query attribute, opcode 6, idn 16, failed with error 253 after 3 retires
21.
    [    0.902285] ufshcd-qcom 1d84000.ufshc: ufshcd_wb_config: En WB
    flush during H8: failed: 253
22.
    [    0.903105] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
    flag query for idn 15 failed, err = 253
23.
    [    0.903988] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
    flag query for idn 15 failed, err = 253
24.
    [    0.904866] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending
    flag query for idn 15 failed, err = 253
25.
    [    0.905294] ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag_retry:
    query attribute, opcode 6, idn 15, failed with error 253 after 3 retires
26.
    [    0.905859] ufshcd-qcom 1d84000.ufshc: ufshcd_wb_buf_flush_enable
    WB - buf flush enable failed 253
27.
    [    0.907659] scsi 0:0:0:49488: Well-known LUN    SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
28.
    [    0.911082] scsi 0:0:0:49476: Well-known LUN    SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
29.
    [    0.913268] scsi 0:0:0:49456: Well-known LUN    SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
30.
    [    0.914580] scsi 0:0:0:0: Direct-Access     SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
31.
    [    0.915156] sd 0:0:0:0: Power-on or device reset occurred
32.
    [    0.915311] scsi 0:0:0:1: Direct-Access     SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
33.
    [    0.916104] scsi 0:0:0:2: Direct-Access     SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
34.
    [    0.916318] sd 0:0:0:0: [sda] 29765632 4096-byte logical blocks:
    (122 GB/114 GiB)
35.
    [    0.916417] sd 0:0:0:0: [sda] Write Protect is off
36.
    [    0.916424] sd 0:0:0:0: [sda] Mode Sense: 00 32 00 10
37.
    [    0.916589] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
    enabled, supports DPO and FUA
38.
    [    0.916667] sd 0:0:0:0: [sda] Optimal transfer size 8192 bytes
39.
    [    0.916897] sd 0:0:0:1: Power-on or device reset occurred
40.
    [    0.917131] scsi 0:0:0:3: Direct-Access     SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
41.
    [    0.917498] sd 0:0:0:2: Power-on or device reset occurred
42.
    [    0.917994] sd 0:0:0:3: Power-on or device reset occurred
43.
    [    0.919301] scsi 0:0:0:4: Direct-Access     SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
44.
    [    0.920207] sd 0:0:0:2: [sdc] 1024 4096-byte logical blocks:
    (4.19 MB/4.00 MiB)
45.
    [    0.920310] sd 0:0:0:3: [sdd] 32768 4096-byte logical blocks:
    (134 MB/128 MiB)
46.
    [    0.920312] sd 0:0:0:2: [sdc] Write Protect is off
47.
    [    0.920317] sd 0:0:0:2: [sdc] Mode Sense: 00 32 00 10
48.
    [    0.920405] sd 0:0:0:3: [sdd] Write Protect is off
49.
    [    0.920410] sd 0:0:0:3: [sdd] Mode Sense: 00 32 00 10
50.
    [    0.920642] sd 0:0:0:2: [sdc] Write cache: enabled, read cache:
    enabled, supports DPO and FUA
51.
    [    0.921151] sd 0:0:0:2: [sdc] Optimal transfer size 8192 bytes
52.
    [    0.921212] sd 0:0:0:3: [sdd] Write cache: enabled, read cache:
    enabled, supports DPO and FUA
53.
    [    0.921526] sd 0:0:0:3: [sdd] Optimal transfer size 8192 bytes
54.
    [    0.922585] sd 0:0:0:4: Power-on or device reset occurred
55.
    [    0.922983] scsi 0:0:0:5: Direct-Access     SAMSUNG
     KLUDG4U1EA-B0C1  0500 PQ: 0 ANSI: 6
56.
    [    0.923490] sd 0:0:0:1: [sdb] 1024 4096-byte logical blocks:
    (4.19 MB/4.00 MiB)
57.
    [    0.928867] sd 0:0:0:1: [sdb] Write Protect is off
58.
    [    0.928870] sd 0:0:0:1: [sdb] Mode Sense: 00 32 00 10
59.
    [    0.930887] sd 0:0:0:4: [sde] 1048576 4096-byte logical blocks:
    (4.29 GB/4.00 GiB)
60.
    [    0.931179] sd 0:0:0:1: [sdb] Write cache: enabled, read cache:
    enabled, supports DPO and FUA
61.
    [    0.932015] random: fast init done
62.
    [    0.932022] sd 0:0:0:5: Power-on or device reset occurred
63.
    [    0.935289] sd 0:0:0:4: [sde] Write Protect is off
64.
    [    0.935293] sd 0:0:0:4: [sde] Mode Sense: 00 32 00 10
65.
    [    0.935396]  sda: sda1 sda2 sda3 sda4 sda5
66.
    [    0.936047] sd 0:0:0:1: [sdb] Optimal transfer size 8192 bytes
67.
    [    0.936358] sd 0:0:0:4: [sde] Write cache: enabled, read cache:
    enabled, supports DPO and FUA
68.
    [    0.936865] sd 0:0:0:4: [sde] Optimal transfer size 8192 bytes
69.
    [    0.938448]  sdc: sdc1 sdc2
70.
    [    0.939470] sd 0:0:0:5: [sdf] 393216 4096-byte logical blocks:
    (1.61 GB/1.50 GiB)
71.
    [    0.939743] sd 0:0:0:5: [sdf] Write Protect is off
72.
    [    0.939747] sd 0:0:0:5: [sdf] Mode Sense: 00 32 00 10
73.
    [    0.940609] sd 0:0:0:5: [sdf] Write cache: enabled, read cache:
    enabled, supports DPO and FUA
74.
    [    0.940837] sd 0:0:0:5: [sdf] Optimal transfer size 8192 bytes
75.
    [    0.940984] sd 0:0:0:0: [sda] Attached SCSI disk
76.
    [    0.941150] sd 0:0:0:2: [sdc] Attached SCSI disk
77.
    [    0.945814]  sdd: sdd2 sdd3
78.
    [    0.945983]  sdf: sdf2 sdf3 sdf4 sdf5
79.
    [    0.946701]  sde: sde1 sde2 sde3 sde4 sde5 sde6 sde7 sde8 sde9
    sde10 sde11 sde12 sde13 sde14 sde15 sde16 sde17 sde18 sde19 sde20
    sde21 sde22 sde23 sde24 sde25 sde26 sde27
80.
    [    0.953610]  sdb: sdb1 sdb2
81.
    [    0.954035] sd 0:0:0:5: [sdf] Attached SCSI disk
82.
    [    0.954131] sd 0:0:0:4: [sde] Attached SCSI disk
83.
    [    0.954177] sd 0:0:0:3: [sdd] Attached SCSI disk
84.
    [    0.955316] sd 0:0:0:1: [sdb] Attached SCSI disk

Full dmesg output at https://pastebin.com/azWahunu


-- Steev

