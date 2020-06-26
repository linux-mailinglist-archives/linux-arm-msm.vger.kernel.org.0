Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF94520B98D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 22:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgFZUA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 16:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgFZUA4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 16:00:56 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D703C03E979
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 13:00:56 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k1so4649901pls.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 13:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jMfv6nXK7pXE53b5JeZ3qPQRps5vJ9xWNq/0HbrUb9M=;
        b=CpAQ2H2udiH/DxH5k73Cwyduuat0KyUq+kl5yrWwSS+KOoxPZNPRnHakCrwVR1vhac
         CHhTpCltkDD/MK0BXGP1SYX1RN4UC+TfOxvRPRr8hiwwywM2IES/1oVQOLsoVKwnWOxe
         4ADPvrVMND13a+SvvgHzG5PzLLCMqFhuYEw8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jMfv6nXK7pXE53b5JeZ3qPQRps5vJ9xWNq/0HbrUb9M=;
        b=XsTRvNA1n2Tu46+mRZ/fCdNu+bgelFg14cnnSAu6ZlpRjfacom5e79tULWloZ1fUk9
         Eqsu01Dyn1qTFUtyWqhq+ZK8bOYmeLaApK7TPtxSiCyrqSlN8DkiQB49mfXlz1FVaOq1
         Ej0ojOz33cfKuhE8YPBgQBkELt5NlB3cgtG0BSV7XG+vlYdrsEQPHZ119GOwVAMPZTJy
         d6TkRzM8X76K5JBtgzPZ9/ezroyEGLTirkjnUb4Yduvtq/rV3GlMRGJy3z8+ZHGg9QdT
         dqhpvq7fOVcp67pdDyEKXt5AR9WXTIuHFoHv5iQSO89oi2LhZAEah7ulqN/05bJMEMOg
         w5lA==
X-Gm-Message-State: AOAM532vPDD85SsJRBPtCf8sfuWgYlqDiPuNnROHukxiMpxtYQKJJ2/K
        rmpFQF7dYT5fyjey3DOZuVGMNg==
X-Google-Smtp-Source: ABdhPJy0YFaPET/B2NW9FwEvbgP3S2PwJhLr8+QIYcuGBkXXiDvrFI5Qn5U0UZYtVfnYkKW4HBdMdA==
X-Received: by 2002:a17:902:469:: with SMTP id 96mr3899228ple.93.1593201655931;
        Fri, 26 Jun 2020 13:00:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p8sm23461610pgs.29.2020.06.26.13.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 13:00:55 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     gregkh@linuxfoundation.org
Cc:     evgreen@chromium.org, daniel.thompson@linaro.org,
        akashast@codeaurora.org, swboyd@chromium.org,
        kgdb-bugreport@lists.sourceforge.net,
        linux-arm-msm@vger.kernel.org, sumit.garg@linaro.org,
        vivek.gautam@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 0/2] serial: qcom_geni_serial: Use the FIFOs properly for console
Date:   Fri, 26 Jun 2020 13:00:31 -0700
Message-Id: <20200626200033.1528052-1-dianders@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series of two patches gets rid of some ugly hacks that were in
the qcom_geni_serial driver around dealing with a port that was used
for console output and dealing with a port that was being used for
kgdb.

While the character reading/writing code is now slightly more complex,
it's better to be consistently configuring the serial port the same
way and doing so avoids some corner cases where the old hacks weren't
always catching properly.

This change is slightly larger than it needs to be because I was
trying not to use global variables in the read/write functions.
Unfortunately the functions were sometimes called earlycon which
didn't have any "private_data" pointer set.  I've tried to do the
minimal change here to have some shared "private_data" that's always
present, but longer term it wouldn't hurt to see if we could unify
more.

Greg / Andy / Bjorn:

This series of patches is atop the current Qualcomm tree to avoid
conflicts.  Assuming it looks OK, presumably the best way for it to
land would be to get an Ack from Greg and then Bjorn or Andy could
land it.


Douglas Anderson (2):
  serial: qcom_geni_serial: Make kgdb work even if UART isn't console
  serial: qcom_geni_serial: Always use 4 bytes per TX FIFO word

 drivers/tty/serial/qcom_geni_serial.c | 129 ++++++++++++++++++--------
 1 file changed, 88 insertions(+), 41 deletions(-)

-- 
2.27.0.212.ge8ba1cc988-goog

