Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7405202BE6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 19:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730493AbgFURua (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 13:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730474AbgFURu3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 13:50:29 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C502DC061794
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 10:50:29 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id e8so2898453ooi.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 10:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Z6fzJhAJ321ixT62OQUqlN+rS3fNSQjyBcE/UbACpjY=;
        b=DuV+Hv67MaBq/Ob9oSfvtuHDVbHw+hTc1Rh2pjsk3L2pz2XMiMqoE3QJEm3HSaw1r9
         c1YeAShi164lcWNcHfksX1W4SQxanHh7P+HY+cg9U1tkSOyxtZxuSpql8vQVmXMMeqkp
         GGr6GihsauMjg+brMyPGAwjLpg6i+n5JEBe3aP8NTrRh7jYAMldFWzELXU+jw+X2pbID
         /cE7vM75UQ/jkR9QOC2PFwCnWYY4LXfgxq4J5sCHpZ+EA6mokiRQLPUQulEVukoGZs1+
         naCfyaX3MB20rZ5dXp+tJ8NcqIuCvwxEaHqb+7pZtZRwUirJcEi61G7Ca3TeHPPLRiio
         3zAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Z6fzJhAJ321ixT62OQUqlN+rS3fNSQjyBcE/UbACpjY=;
        b=UpdnOqMJh8jGo3lYsX/v7+DcdV69vbdaTtRKmeh4+5Bnph+guCBFhRNo5TMSjNJHV5
         +yBVEbHATQ5D8+WFj3co4WAhY30s8rXhY9g0+42wntrtWRdygmHOlWcwKjiC1bStaHJC
         zfOezEwgqVfiB0Bp3ESwTqpmrsuGdCy7orpXGfs2eg6UvvOfnjnqw6rlVSUvTbt4KY0v
         Jg/KwWGjeZCPhtKAPRwvR6SGt8/4kFzqox1nPGUVJO59KaZprkjkykvW/Z/kTrgFMErL
         0tac+w+t2L/OChocukmATnTarXmAoHI2iRYqSadRjPgsnHaQvENx2PLKnIHbhXSF1o7U
         5N/g==
X-Gm-Message-State: AOAM533cTcMPDwpz7J8/uQgk0H3wvpzHEH6ibr+T1jRJ5duHEQX+AnVh
        se6zdhLNEBEssWQtsYXsTEH70A==
X-Google-Smtp-Source: ABdhPJxCbibHRQuCBo8z043+guNjnBrsjVmhvo/gNbpQNm3dzjFOs/kMOstmC4c83XVlt+0qkUZo8A==
X-Received: by 2002:a4a:ca8b:: with SMTP id x11mr11267088ooq.83.1592761828953;
        Sun, 21 Jun 2020 10:50:28 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id a9sm2733424otr.15.2020.06.21.10.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2020 10:50:28 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
To:     Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Avri Altman <Avri.Altman@wdc.com>,
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
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <ba3873e3-75e0-a55f-6a93-d7d8df4da0e9@kali.org>
Date:   Sun, 21 Jun 2020 12:50:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuG3XAqN_sedxk9GRm_9yK+a4OH56CZPmbHx+SW-FNVPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/21/20 11:50 AM, Rob Clark wrote:
> This looks like a device issue to be taken with the flash vendor:
>> There's no way for a end-user to file a bug report with the flash vendor
>> on a device bought from an OEM and even if they would accept the bug
>> report they wouldn't re-provision the flash in an shipped device.
>>
>> So you will have to work around this in the driver.
> oh, ugg.. well I think these msgs from dmesg identify the part if we
> end up needing to use a denylist:
>
> scsi 0:0:0:49488: Well-known LUN    SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
> scsi 0:0:0:49476: Well-known LUN    SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
> scsi 0:0:0:49456: Well-known LUN    SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
> scsi 0:0:0:0: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
> scsi 0:0:0:1: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
> sd 0:0:0:0: [sda] 29765632 4096-byte logical blocks: (122 GB/114 GiB)
> sd 0:0:0:0: [sda] Write Protect is off
> sd 0:0:0:0: [sda] Mode Sense: 00 32 00 10
> sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports
> DPO and FUA
> sd 0:0:0:0: [sda] Optimal transfer size 786432 bytes
> scsi 0:0:0:2: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
> scsi 0:0:0:3: Direct-Access     SKhynix  H28S8Q302CMR     A102 PQ: 0 ANSI: 6
>
>
> (otoh I guess the driver could just notice that writeboost keeps
> failing and stop trying to use it)
>
> BR,
> -R


FWIW, I see this on my c630 as well, but my LUN shows up as


scsi 0:0:0:49488: Well-known LUN    SAMSUNG  KLUDG4U1EA-B0C1   0500 PQ:
0 ANSI: 6

