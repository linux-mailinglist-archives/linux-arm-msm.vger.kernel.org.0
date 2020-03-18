Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 231A1189501
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 05:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCREjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 00:39:35 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41608 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgCREjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 00:39:35 -0400
Received: by mail-pg1-f195.google.com with SMTP id b1so12952642pgm.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 21:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=xd+tfczm+GFBbyN7oeAC2lCrluQJs/Df3o6LdEw5aO0=;
        b=iMZs+SH1m6J3eHw3F9PW8UwD3BoJ6r/2umzJOHBddrRm3tIP8zy/m5vsoUdlnHojfQ
         430hIYK6KJGe8ZSILOgfs036zcVOa7Ip0lnuatLosF42xozKpIRMLzBi+tlkXwHs3a0M
         Cks6JE433+RXMMXU/1eIEvzarDD2xtIE6M6DQt/gPClQpT4ouKPrctVLa1lKlFstWJRk
         T4zF2iqzS3VnxgKHkm5vPYbGh8q6G9eEyaGhajS6hoO4LxusYKD1QR7eQdbpMkPULnih
         JZk1cteA1JnYrBL75Hw94t6aT+S7RCE4J31g8DZfUrsbEoic9wTbCodySX/E/hoXR93b
         aimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=xd+tfczm+GFBbyN7oeAC2lCrluQJs/Df3o6LdEw5aO0=;
        b=EPxwUifDfs+STXXkjaXzwDyBRWGkua0kcO8ekD+R+tq8xNdzYixH/cdBKARzcbUHiW
         5Yszg98c0JcifoYGSnm46LX1DhlL+fJJj+m9I7kt4qG7dqducG9844a0exmyCpzxgDk3
         jXQXxJrIXaDOGSTYNM4Xk+UseOTaxV+EJm/TdWYZLt/tgpvWfvwg1BZbrKw210Krhyvt
         /vXfCtoZUHdXHzuN5cKi1LVvidRRg50yV+AG+JbvV6wY5NjGi5cfiNaCNMMOiOk4fbBd
         2cwBU2OocxMR1w8u9v5GBbEBnD6qzAQqH0OdaOoZ24krt2dfdFKsjbgqw+B6j2fS/cHZ
         d+Bg==
X-Gm-Message-State: ANhLgQ3gNOFZX6PSm8mXDDviGdUPNkFaBA3FFIcFhh/17ULY1/mRztoY
        4QJi1N7aasWQk7IVFb2d1qJCiQp2S38=
X-Google-Smtp-Source: ADFU+vuh9F076lboCJ2meIS0Qfwmwi0YxvuZku/xF5f4h8p6tcKXHwRxHNM7e1VLGdtfJS+BdzGpvg==
X-Received: by 2002:a63:701b:: with SMTP id l27mr2708042pgc.57.1584506374238;
        Tue, 17 Mar 2020 21:39:34 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i26sm3383173pfk.176.2020.03.17.21.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 21:39:33 -0700 (PDT)
Date:   Tue, 17 Mar 2020 21:39:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: [GIT PULL] Qualcomm ARM defconfig updates for v5.7
Message-ID: <20200318043931.GC470201@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.7

for you to fetch changes up to 3ae09e2608c3bbd619605e35fd3f7b5f547aea3f:

  ARM: qcom_defconfig: Enable QRTR (2020-03-09 13:13:02 -0700)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for v5.7

Enable QRTR and the Broadcomm bluetooth driver in the qcom_defconfig,
for usage on the 8974 devices.

----------------------------------------------------------------
Brian Masney (1):
      ARM: qcom_defconfig: add Broadcom bluetooth options

Luca Weiss (1):
      ARM: qcom_defconfig: Enable QRTR

 arch/arm/configs/qcom_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)
