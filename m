Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC8E2D6CB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 01:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394609AbgLKArU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 19:47:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394599AbgLKAq5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 19:46:57 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4847C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 16:46:16 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id n11so4079042lji.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 16:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TgFRl4hY2jVegpQsEVcSi759bqYrRdxorewfve1OEAM=;
        b=WWqd4F0EGETgFArsXDAFcxPg0XMQ+HOwpv7O40kc3nluV/bF9mIIBiW8+Eu0GMg+lo
         n8PSOfLmU3eZ3MsB4yUyMeT7S58MsYUDqfsVOWIUZGb3FE5EQGp7tZzcG20WDd0UCH2E
         DE8dURg+HXSDD430Z0yyeoNQ5LcKrgq19v+oKN4pjpei7j8MspKtF6iEs+i80Ieqtx2o
         ZJ9jPMhO7BwPvPN8kjSLYIkfKSlN7Pm9sMVGFklzKGdHRaCzUU4/ijBYSVOViyqR4Iu6
         yNFdw/q9aUN2T6X5D0I2I2+Pq9MxP82riNs0/u1CpDQTZfb8E2JbTpJI4KFlDCsw2olI
         MG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TgFRl4hY2jVegpQsEVcSi759bqYrRdxorewfve1OEAM=;
        b=L1CKFnohZiKLM1bEkZVTo1XObS+MJpTyk+cB8tiON26WgJnCKMid0CMe4xjFcmooR0
         K1fxancvHtrbFp4MtgMw7lDhnopCS7SI5EqE/xoXtkEGKC0OH7v+tdtusiluWB2wLH1t
         I0leUfK/RFFtdtSlCJAGuZx8k/81/fxNUqHbSq5tLik/sjhH8JxC6jeg8INoa4btSdbv
         urI9V90pySoFXI7I76z5/vRum6kBUrFHwKTaeXBKZ4noSv3JZWrxFmTyJu6vPKt+067O
         oETs0qnP/WtfAwM8w4ribMZL+5U4dMkDqNnuQBt4jQsQrlarLg4yTYK60RTGDwQrvo3g
         e9ig==
X-Gm-Message-State: AOAM5338DOQ6w8aRlmpsMT8RIbYuTtwtBBIoel/pk25DQ7NH042cRNcb
        S8OBFwFQFiafRg/k2IwYfHQIdg==
X-Google-Smtp-Source: ABdhPJyfGzITQ3mb+eij+usHJPbNHtfUfmXccmO08xQzZQht6KMEH+jL6qM5c5dp4ugrWMhfPQcZ9w==
X-Received: by 2002:a2e:681a:: with SMTP id c26mr4091377lja.412.1607647574097;
        Thu, 10 Dec 2020 16:46:14 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.52])
        by smtp.gmail.com with ESMTPSA id u11sm694953lfq.142.2020.12.10.16.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 16:46:13 -0800 (PST)
Date:   Fri, 11 Dec 2020 03:46:10 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: linux-firmware: add firmware for Lontium lt9611uxc DSI to HDMI bridge
Message-ID: <X9LBUn5KIKVKQGlI@eriador.lumag.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello linux-firmware maintainers,

The following changes since commit 7455a36066741a6e52fba65e04f6451b4cdfd9c4:

  Merge branch 'guc_v49' of git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 09:26:11 -0500)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware lt9611uxc

for you to fetch changes up to 63ab3db8399a504048716eb3feed2867da58876a:

  linux-firmware: add firmware for Lontium LT9611UXC DSI to HDMI bridge (2020-12-11 03:27:38 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      linux-firmware: add firmware for Lontium LT9611UXC DSI to HDMI bridge

 LICENSE.Lontium  |   2 ++
 WHENCE           |   8 ++++++++
 lt9611uxc_fw.bin | Bin 0 -> 17932 bytes
 3 files changed, 10 insertions(+)
 create mode 100644 LICENSE.Lontium
 create mode 100644 lt9611uxc_fw.bin
