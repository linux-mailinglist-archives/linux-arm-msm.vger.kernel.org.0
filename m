Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895C348253F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Dec 2021 18:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhLaRDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Dec 2021 12:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhLaRDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Dec 2021 12:03:04 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA777C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Dec 2021 09:03:03 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id l4so17613072wmq.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Dec 2021 09:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:cc:content-transfer-encoding;
        bh=NnBDCkt/y1MhIeZrLuFmS6OR1C9rQ32vDjAgITu4NnE=;
        b=mq5I2KpDKJEQcYPTR1NKvJAIPsme3RxngDgY0QUenhx3QPdCHkcW7MKheBPUkXOVWK
         gZcYmv2LtTczjESQ8U2Z21t8g3Y8H7xwLbe3Dn7vFvnHz6TzdW71f7soEGIfZL7KBeZ9
         FHXQbs5ojVAQnSz6epS1/RdWAdsiFziLjFFttuoyvNPmOXdR3vtJeZga5J68U5p0Dz9g
         /HphpccaZ8cMI/PCYs3BCQTcloFdRcxuOoZooNcEsO6FlDg8B8W1K9LQ2GAtAvK1/FZ2
         8PCuc2zfhQAwBAMGtV7yiRt9ZNpBsRewJVc5Un5dSWRdc4ppO6BbY/Jk6LKvM+Bh1fqZ
         AB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:cc:content-transfer-encoding;
        bh=NnBDCkt/y1MhIeZrLuFmS6OR1C9rQ32vDjAgITu4NnE=;
        b=bzT1eY4QBpePIErpPyIMr12OvZENDEc/lewX/Hc4oD/0mKBCfJRBH/qunXwHKF8pJb
         6Z43XU3xnc1xuqL0eEeAByG29/bpBA6DiGVw3/xArc2dfCizotY1R7XFC7drctg44ZR5
         dwZm0tEm1MFadKuwkgqHrV4tC4vsNAO2f8Y2tfAUvez/mDUSlMchUaAB+XF2NyMg2GHu
         JhBKBAi0WbSwQapS1uGQ102EOH1Bo2aDma2y/JEOO1fX/9z0C1/K16ulhJr70sJ2GVOu
         nzkwo+atRPS+N6Pa+GeRJXxeKV88vvse5jHNYiVmgdT7qFSZbtao8PnhR9u44rLRr1A/
         0FfA==
X-Gm-Message-State: AOAM532+rv7RSmT4ArUzOGi6fEjxixISxLZ6c4ujQRJKsWrcMi6NP2Af
        QwEk2RNuQiT48OSgYO2Kpqj1rUzXeZsdaA==
X-Google-Smtp-Source: ABdhPJwMNqSZfBSkU+sj2BrZ6cmPsJKDMk1CAUhhQC6MTYkq5daEwkmOL6/qhKq1cIQRXCOKxOTnZQ==
X-Received: by 2002:a05:600c:228d:: with SMTP id 13mr30995091wmf.134.1640970182118;
        Fri, 31 Dec 2021 09:03:02 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p11sm30868244wru.99.2021.12.31.09.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Dec 2021 09:03:01 -0800 (PST)
Message-ID: <cbe181af-402d-c8eb-3104-4ee48f8d525a@nexus-software.ie>
Date:   Fri, 31 Dec 2021 17:05:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
To:     linux-arm-msm@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Sricharan R <sricharan@codeaurora.org>,
        arajkuma@codeaurora.org, speriaka@codeaurora.org,
        sivaprak@codeaurora.org
Content-Language: en-US
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: External data abort on ipq6018 gpio # 20 ~ offset 0x14000 any ideas ?
Cc:     jason <jason@wallystech.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linus.walleij@linaro.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi.

I've been poking a problem on an ipq6018 board I have. Specifically it 
pertains to the address range for GPIO # 20, touching any address in the 
range 0x14000 - 0x14FFC results in data-abort.

I initially encountered this with the upstream kernel here:
https://paste.debian.net/1225390/

and assumed that I was doing something wrong, so went hunting for 
evidence that the downstream kernel touched the registers in that range, 
my assumption that something extra was happening the downstream kernel 
to make the register read kosher, turned out to be wrong, assuming 
something like the transition from arm32 to arm64 or a trustzone setting 
getting in the way.

Downstream doesn't touch that register with the default drivers and 
shipping DTS files.

Modifying the downstream kernel to do a simple read of each ctrl_reg 
makes downstream choke on the address too.

This is the only bootable version of the downstream kernel reading every 
ctrl_reg in the range of gpio0 - gpio79 - skipping gpio20 since even 
downstream the address range 0x14000 - 0x14FFC is broken.

In other words I can prove the problem is only with the physical range 
0x01014000 - 0x01014FFC

gpio19 @ 01013000 - 01013FFC is fine
gpio21 @ 01015000 - 01015FFC is fine

the issue is limited to gpio20 @ 0x01014000 - 0x01014FFC

Downstream kernel:
https://paste.debian.net/1225388/

This is also the case when doing a dumb dump in u-boot
Stock u-boot:

https://paste.debian.net/1225389/
https://paste.debian.net/1225396/

Is there a sku of this SoC which perhaps reserves 0x14000 - 0x14FFC or a 
version of the firmware that does so ?

I've already discussed this offline with Baruch who suggested firmware 
versions based on previous feedback working with this part, however the 
firmware version on the board is newer than what was suggested here

https://lore.kernel.org/all/5ba36dcd7c50b640e0bdaf5b9c2248f3@codeaurora.org/

"Please try with TZ version >= TZ.WNS.5.1-00084."

admin@OpenWrt:~$ cat /proc/device-tree/tz_version
CRM-TZ.WNS.5.1-00113
admin@OpenWrt:~$ cat /proc/device-tree/tz_version
CRM-TZ.WNS.5.1-00113
admin@OpenWrt:~$ cat /proc/device-tree/rpm_version
CRM-RPM.BF.2.4.1-00089
admin@OpenWrt:~$  cat /proc/device-tree/boot_version
crm-ubuntu47-BOOT.XF.0.3-00090-IPQ60xxLZB-2

I'm not far off writing a patch based on a "compatible" string to mark 
gpio # 20 as bad - any other ideas or insights welcome though.

---
bod
