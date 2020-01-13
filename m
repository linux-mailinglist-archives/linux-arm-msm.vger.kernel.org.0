Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0E9C139AE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 21:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgAMUnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 15:43:17 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32973 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbgAMUnR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 15:43:17 -0500
Received: by mail-pl1-f194.google.com with SMTP id ay11so4291276plb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 12:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=/wcE+sOMyagMCyC4QZgrH+gZMviyyqGaVgp9gejXTLQ=;
        b=UCtxwdfu1MOhvv0Dl3SIlKj4WeOKM4Dhn8MRGiZYewOvcSeF4oLUyTjWl0fEsxJ5Le
         V0EqkGLW8DpL16QvA1DLE9bWuiLJZLfWmQ4c0oL/EBMTEebem4oyZH6jeFP8qa9msM08
         zCm/AZAF10rP7s6Ii1M/udhohwVFfinDuUwavZgLV9e3JOra26aG7S77LKa1Rt/6ZZ/P
         QiQTAG2ZD+Q+vPxH+fCknSr+GX6+Fbz3Kzg7yg2i4XocMgX/ImH4q9W0U+d7N43VxRPa
         bnuln6bVu5rszU8TMXgWH7iXDnYHQeNzxjqwA7PANhz0b1WzwO62znAn6HlMD38qgk9b
         FJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=/wcE+sOMyagMCyC4QZgrH+gZMviyyqGaVgp9gejXTLQ=;
        b=HQkMTvNr0b7qUJi7/i5CDyhoYbz1K31dFaqMqkqbLVGBE0FZjTeE+tsXfwOWJ6ntSC
         jNbHIoS57BHofuTZMrGlJILkGMoCR8kNho/7twfEVY2In3uBto+sXg8KPKRum4hdQSLa
         4MUOcvcDaf7YgkAG+SFvxwLw6qj9SVHQvke04RAxvNiwpnprrKPCyX3jGAENzz8u4UYa
         NEaHP1h1Bsl8wOWXI0COBgyF74L9ezW0tVQ/HFbp8SUWfHPVJGdek4nP+72HTlN4tYcL
         FQWuiKmUblpN5IoyLNp+koH1RPa8p12qaR8XCpm9NYr6HSent8EuVSC1JxdafgZ3AT1q
         ruqA==
X-Gm-Message-State: APjAAAUligdCkpv495vCiAh8HygND+doe5Rsci54CsBndeN9oPa4Vfgt
        QAYTSEbMUFuU1Pj3LRFWUtJo5A==
X-Google-Smtp-Source: APXvYqwUVBNTh02pgToXPNw3Bd2uSFTulE0jmJfktcvwZGZ06jhKFme/S5lzlj1gOTKgRkr7r3GPKQ==
X-Received: by 2002:a17:902:b187:: with SMTP id s7mr22079286plr.104.1578948196983;
        Mon, 13 Jan 2020 12:43:16 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a10sm43484pjq.8.2020.01.13.12.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 12:43:16 -0800 (PST)
Date:   Mon, 13 Jan 2020 12:43:13 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Brian Masney <masneyb@onstation.org>
Subject: [GIT PULL] Qualcomm ARM defconfig updates for v5.6
Message-ID: <20200113204313.GC3325@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.6

for you to fetch changes up to dd973b89ebba7246bb395b89bfec55deee24af2a:

  ARM: qcom_defconfig: add anx78xx HDMI bridge support (2019-12-10 09:42:50 -0800)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for v5.6

* Enable anx78xx HDMI bridge driver
* Enable MSM8974 interconnect provider driver

----------------------------------------------------------------
Brian Masney (2):
      ARM: qcom_defconfig: add msm8974 interconnect support
      ARM: qcom_defconfig: add anx78xx HDMI bridge support

 arch/arm/configs/qcom_defconfig | 4 ++++
 1 file changed, 4 insertions(+)
