Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBBC12F49A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 07:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgACGfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 01:35:25 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37797 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgACGfZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 01:35:25 -0500
Received: by mail-pf1-f195.google.com with SMTP id p14so23113651pfn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 22:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=2WQrxRJ32Dzv51bUYvtPMXEoso57SX/CjFgL3kz1b10=;
        b=chC+VZttOqYrnS7Lgn8HqFW+FRkh/sluy8v7OWQ3BZONctx0ExWOdQUeLi5hhixO2M
         TJAGWXtYDr9mudm56u0jvgA0t2cJcVwkZA0mSrD6+zSLUXThOpnjKXvlFci0W61JZxEG
         haixzvsgfx4p+RfkPQDNJje0cVSwpDur0LYUPew65x0MTcmPDGBLv0qFpDHxmr258iaZ
         RkxhJgEX6MhlDL//7qh+TLIj6v2gVWezawu8wRyOD/sHT9joyCxUWgeYzCWFeqOb2cKb
         Qwqnw2VfmqkEv/96uX66WARSU0+mEGLxOtU4+b0Ko6gJkbp3xcoVHK8CP8GUB7rkauFo
         mQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=2WQrxRJ32Dzv51bUYvtPMXEoso57SX/CjFgL3kz1b10=;
        b=mbstCBhftc6k7qqhWiT5iLyhGYYdLmtWbSZNlboTuojd98VcH4M6dNgAYth28V5u3I
         xy90okyD4EvUMb0BNG3c62Y6SUl0D/845FKBk05Qod7uuo3b2bp3Ma6RQlzxS/+mwBZn
         cQ7aisq120uz8oquXpWn90jALs7d/3IbULuLNkUXws38syNtRLJOgiGZlnFgrsq0D/Q8
         g8POiwANYtXlRwO9TVAdrBx0QAbgvsFet7RVndaFQJpbNr0ebWyX4bliI9TEwkWA0Iib
         kwKIj8X1k3a01WrCrOw8bpKuqFwe3XJ4LOMZ1hpLJ2xePHXXBge2SSfpJaj1Ozv99xvx
         lBLA==
X-Gm-Message-State: APjAAAU/epCWSh2d8PO6MuJECT7ZIguLBsDeIMroedH12S2orkO9QAvf
        VY3QJK5pRmLXJ3feuZOL7tLFog==
X-Google-Smtp-Source: APXvYqxurno3mJwcd9BhfjeqsLg7MeoKJlSC4LhlhXEj0Kdmr4l9PFjG+jcrqhhKwBp9A5Jf2HvH6w==
X-Received: by 2002:aa7:824d:: with SMTP id e13mr52620570pfn.247.1578033324771;
        Thu, 02 Jan 2020 22:35:24 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id hg11sm13434435pjb.14.2020.01.02.22.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 22:35:24 -0800 (PST)
Date:   Thu, 2 Jan 2020 22:35:22 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-firmware@kernel.org
Cc:     Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        linux-arm-msm@vger.kernel.org, kvalo@codeaurora.org
Subject: [GIT PULL v2] qcom: Switch SDM845 WLAN firmware
Message-ID: <20200103063522.GA4002960@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

The recently committed wlan firmware found under ath10k/WCN3990 shows
better stability under load than the one present for SDM845. So this
replaces the current firmware with a symlink to the newly contributed
one.

Change since v1:
- Properly use Link: in WHENCE

Regards,
Bjorn

The following changes since commit 6871bffa79ed240696986837cfb17b272ff57466:

  Merge branch 'ath10k-20191220' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware (2019-12-20 08:41:19 -0500)

are available in the Git repository at:

  https://github.com/andersson/linux-firmware.git RB3-wlan-firmware-1387-v2

for you to fetch changes up to d6219ab5b49816cbe9de9b2af1e3c8cd26a3d05b:

  qcom: Switch SDM845 WLAN firmware (2020-01-02 22:25:39 -0800)

----------------------------------------------------------------
Bjorn Andersson (1):
      qcom: Switch SDM845 WLAN firmware

 WHENCE                   |   2 +-
 qcom/sdm845/wlanmdsp.mbn | Bin 3311964 -> 0 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
 delete mode 100644 qcom/sdm845/wlanmdsp.mbn
