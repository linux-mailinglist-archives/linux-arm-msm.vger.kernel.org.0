Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 397C63B633
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 15:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390324AbfFJNoE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 09:44:04 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:45980 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390156AbfFJNoE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 09:44:04 -0400
Received: by mail-wr1-f47.google.com with SMTP id f9so9229562wre.12;
        Mon, 10 Jun 2019 06:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=GDu0QwPCusVspXV4UKYTJxVUs5M4uFp08JVK5Ji1WKs=;
        b=M4mWtFUiuUezKyHLHRGvKjvTcvOwmZ65rlQTjHp0sreALkQBCnEAxb49u5gK5XwsUY
         94aWJfFYiG+ZRQbg7kC67ww323amM9OKXgttJJqsd4NzhQW74zw5bnYV/uhUjvoq8e0/
         jws+oaf+Shs8hMqKvAyNstFeoVxrCkGGII+J0yDCR5om3YgKFSgrT6DYHvYnSKT0IRK8
         vMjV0fLwvXQKoTYnmdWXVOPFmlWndMhZo12X70nCFOAtD+M+AP7C6alapn/oLBu1/9uf
         QpaVFk+vQNm0sOBSGHyjbOtiwYTIAVUd6YQvw0RNjptcehjvQz/Jcsjr63zVrVChyuSd
         EtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=GDu0QwPCusVspXV4UKYTJxVUs5M4uFp08JVK5Ji1WKs=;
        b=obcZMOyqTcmMOIS2W6O3TSBcIHY9Pw9Bp6KOQ4YkE11MtZj94/tpPRGV0s/aBA5gSy
         usgnBpR9HYR49e/cPrvlYeEquDRysWDjFcq+42qTUnZyQTrJDpHS2BbUlYXKKyjJZ1iN
         zgz4+amqDiE8c2yJ4RZigAUDugd7CxdqCLLFNLvW2FSvLmgLUGqSEXkUpLvzs2GeyVYT
         nj0tIudSN1Hp1KAIlB9wM6U2Su7bohxhR48888+ut4QefbshYTBq8IuGFyCIABLGY+iN
         HYm0s1Z8e9HAAmxeckjJI+IVqJKmej2knf9g6msSU/wokkeR49SVxpi10EXHJn2zJ41q
         Xp0w==
X-Gm-Message-State: APjAAAV7uETbZyht2em3Rc1Tuc7QgNUm+C09vWKEYiI0/aEG68fFNyfX
        QCTviL0zlMc9fe8GK96Gg5IF0TBW
X-Google-Smtp-Source: APXvYqxBDuVR7450I2FIYHtLVnW+5dWWGYu5KZPvAViadIdj6/DBBVkyjoJdLn5nT8k2FwSNtCMmYw==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr21313791wrl.134.1560174242212;
        Mon, 10 Jun 2019 06:44:02 -0700 (PDT)
Received: from gmail.com (net-31-27-155-100.cust.vodafonedsl.it. [31.27.155.100])
        by smtp.gmail.com with ESMTPSA id u1sm3954706wml.14.2019.06.10.06.44.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 06:44:01 -0700 (PDT)
Date:   Mon, 10 Jun 2019 15:44:01 +0200
From:   Paolo Pisati <p.pisati@gmail.com>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: msm8996: qcom-qmp: apq8096-db820c fails to boot, reset back to
 fastboot and locks up
Message-ID: <20190610134401.GA12964@harukaze>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From time to time, my apq8096-db820c fails to boot to userspace, reset back to
fastboot and locks up: to easily reproduce the issue, i'm boot looping using a
cron job with a 1 min reboot entry on the board while leaving a "while 1; do
fastboot boot boot.img; done" on the host pc.

The issue is present in mainline up to 5.2-rc4, using defconfig and:

CONFIG_SCSI_UFS_QCOM=y
CONFIG_PHY_QCOM_QMP=y
CONFIG_PHY_QCOM_UFS=y

but was present in previous releases too (e.g. 4.14., 4.19, etc qcom-lt or
mainline), where it's even easier to reproduce (e.g. takes way less reboots to
trigger it).

These are the last lines printed out:
...
[    7.407209] qcom-qmp-phy 34000.phy: Registered Qcom-QMP phy
[    7.448058] qcom-qmp-phy 7410000.phy: Registered Qcom-QMP phy
[    7.461859] ufs_qcom_phy_qmp_14nm 627000.phy: invalid resource
[    7.535434] qcom-qmp-phy 34000.phy: phy common block init timed-out
[    7.538596] phy phy-34000.phy.0: phy init failed --> -110
[    7.550891] qcom-pcie: probe of 600000.pcie failed with error -110
[    7.619008] qcom-pcie 608000.pcie: 608000.pcie supply vddpe-3v3 not found,
using dummy regulator

Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.XF.1.0-00301
S - IMAGE_VARIANT_STRING=M8996LAB
S - OEM_IMAGE_VERSION_STRING=crm-ubuntu68
S - Boot Interface: UFS
S - Secure Boot: Off
...

Full boot here: https://pastebin.ubuntu.com/p/rtjVrD3yzk/

Any idea what is going on? Am i doing something wrong?
-- 
bye,
p.
