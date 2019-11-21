Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7CC9104776
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2019 01:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfKUAW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 19:22:56 -0500
Received: from mail-pl1-f176.google.com ([209.85.214.176]:34567 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbfKUAW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 19:22:56 -0500
Received: by mail-pl1-f176.google.com with SMTP id h13so662759plr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2019 16:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=XpLumQ6+8kS/7FEnMUVh6tBNEPuW17EqgedQes6/Rgo=;
        b=oqEey50HW2wlEgyLxM8Ent3qNalnUP8TMbnp0D7p0xt1ALpDYexhGxHS8IQ+exiLFQ
         JU/ZWcwAv3J9fy5tK4FpYhm+/xnUh97OiuEagC2/v+7ye90ZLzKr62zcs7Ufw+tl0OmS
         da2hWuGFrrWivVg7fKUQtgDIYbPTwkz5MR0VKnolHbuQD64csoAqe/Ln7SaCZZQ6OfG8
         PAqnvkb+sTdBW+JuukCoWeN8Oj6ixahH6GibDqJUhYf5R/vmnD+0fLG1krTgcdzxjRer
         HOwWfge/CVSdaK02yPnU/0rY3JbwNJeACmRP7xlM6SrBm3V2KsxsQ7XUAJ8cbYlWtWBf
         Gbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=XpLumQ6+8kS/7FEnMUVh6tBNEPuW17EqgedQes6/Rgo=;
        b=NzO+95G9QXvLDdAvDifzIqo3sUTkjASBS6RdKt+S5r/NHyvniRqBmNU/i5/e95ZZbP
         c29wxvF7tnhqozoCg9bEnqWtZTzOWDRkwEZkNzoLr/GANlBcSRVtkj0fU22vacHzbkCV
         scDfuiKXouyFZJnVw9kRDb7fUaUIxB2khSRgmZWmyzTpmWgwzq6kPG0HMSF6qVTgWDn9
         h2D5fBfUPmmXs9zqA8UhOH3E77DZdkdO8KOg1oWo01Yp5VGfiYkorWzTmAbNaQTPUjwH
         N5E11Q1dC39GjgN1/kIwKeai51hVXOO0N/2+9JTQyIbNjPkHBe1oTDr8jVEMAhSrQs40
         I0fw==
X-Gm-Message-State: APjAAAU8cyvviyLlufbNESHEg9KnxfWJMD8uUPtr18+164bVECTg156v
        MrTh8MrVpNme5ps24jdSZmPifw==
X-Google-Smtp-Source: APXvYqzR3ztM/HAb302nlCKU1w6nf3gPCKUlXCamhXKHwqAjqxtPz+F99RAJrHT+Hk4S9E5FQ1k2ig==
X-Received: by 2002:a17:902:fe85:: with SMTP id x5mr5693653plm.292.1574295775675;
        Wed, 20 Nov 2019 16:22:55 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i11sm573028pfq.74.2019.11.20.16.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:22:54 -0800 (PST)
Date:   Wed, 20 Nov 2019 16:22:52 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-firmware@kernel.org
Cc:     Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: qcom: Add SDM845 remoteproc firmware files
Message-ID: <20191121002252.GA844457@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

This adds the necessary firmware to boot the Audio DSP, Compute DSP and
Modem DSP, as well as the dynamically loaded WiFi firmware for the
Qualcomm RB3/Dragonboard845c.

Regards,
Bjorn

The following changes since commit e8a0f4c9314754d8b2cbe9840357d88a861c438a:

  rtl_nic: add firmware rtl8168fp-3 (2019-11-18 16:16:01 -0500)

are available in the Git repository at:

  https://github.com/andersson/linux-firmware.git RB3-adsp-cdsp-mss-v4

for you to fetch changes up to 212e44122e71fe76e1e6a495739413597ea66a6e:

  qcom: Add SDM845 Compute DSP firmware (2019-11-20 16:08:30 -0800)

----------------------------------------------------------------
Bjorn Andersson (3):
      qcom: Add SDM845 modem firmware
      qcom: Add SDM845 Audio DSP firmware
      qcom: Add SDM845 Compute DSP firmware

 WHENCE                   |  38 ++++++++++++++++++++++++++++++++++++++
 qcom/sdm845/adsp.mbn     | Bin 0 -> 10420560 bytes
 qcom/sdm845/adspr.jsn    |  21 +++++++++++++++++++++
 qcom/sdm845/adspua.jsn   |  27 +++++++++++++++++++++++++++
 qcom/sdm845/cdsp.mbn     | Bin 0 -> 2704916 bytes
 qcom/sdm845/cdspr.jsn    |  21 +++++++++++++++++++++
 qcom/sdm845/mba.mbn      | Bin 0 -> 242400 bytes
 qcom/sdm845/modem.mbn    | Bin 0 -> 5652688 bytes
 qcom/sdm845/modemuw.jsn  |  33 +++++++++++++++++++++++++++++++++
 qcom/sdm845/wlanmdsp.mbn | Bin 0 -> 3311964 bytes
 10 files changed, 140 insertions(+)
 create mode 100644 qcom/sdm845/adsp.mbn
 create mode 100644 qcom/sdm845/adspr.jsn
 create mode 100644 qcom/sdm845/adspua.jsn
 create mode 100644 qcom/sdm845/cdsp.mbn
 create mode 100644 qcom/sdm845/cdspr.jsn
 create mode 100644 qcom/sdm845/mba.mbn
 create mode 100644 qcom/sdm845/modem.mbn
 create mode 100644 qcom/sdm845/modemuw.jsn
 create mode 100644 qcom/sdm845/wlanmdsp.mbn
