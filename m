Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4381A4AE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 22:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgDJUKo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 16:10:44 -0400
Received: from mail-pj1-f41.google.com ([209.85.216.41]:40179 "EHLO
        mail-pj1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgDJUKo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 16:10:44 -0400
Received: by mail-pj1-f41.google.com with SMTP id kx8so1121603pjb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 13:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TEzQStdSYdhloLcug4DXaAnsCMxdJyW9nYr3FtVVCZk=;
        b=QWTv+hK72PdZq5cqJ7faaym6w0I7k0RD2/G97HiSTKyWdnBydSLmeL4KPnOjc1zL6h
         gc6MnWlVNfUObGSG4VMXLd0lw+dReCzVaWQmPvdirC7w9gWEq6i2a29r/lcln13S3x4s
         R+Wcur2VGIs9mWG2AKRVLoR93+kDA2PNMsAWs1S1yVXLbeEaQRglq0OI34HjHTEwHiD8
         vL3xwl0TpMIZe1CCHqRHAVF35seNl0fNpwpnBBsNjJ6FK9YQGy0dfEVjOrPArPmWPJ29
         RpjzOczgpSHpnxu0/2/DyhqrzIIh54gwCYUvrJcJzkyANbd0zuIFLnVBcycvr9XTjSng
         2VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TEzQStdSYdhloLcug4DXaAnsCMxdJyW9nYr3FtVVCZk=;
        b=N1m2pSR4jwR7wKSWQTzsRLGby2LfCzdjN4E8XygNcSD/8Xaweun9g8GxXOgm3FEwwm
         BKC3OXLNyUMu18+gMgQc3ZuUM/cYKXjOuYxEz/xMAzPqXxkmHPOeXgIr3rtK9KBAWQl6
         VML2ZU3XIfUbFjYpoXht9iwmkJm81MAJKsRAfhxUrodGkJwvwv4LHz+3Q83sf38jVOpa
         auX/U7TcTq3nc2svr/pfX9bHujMoUJdvO2U6VoJASgFTABoCKpOgmsdgFuDZxZDamaVj
         I9XqkEuH6V3W+ko9vYgy5/FCs3w1bdL2jb6n01W3KlXif+9N7kfLd+9qj/wzW2M/+0+C
         Co8A==
X-Gm-Message-State: AGi0PuYYKXlIfzPNtFSMJevMe7xsXhYG+i6Z3lzy23JdeE1iELkpkJ71
        QuDI/gylWLRhHHe2I8v++9JI0VEt2pU=
X-Google-Smtp-Source: APiQypI7S2whQTGYjYEhhnPjoGTyT8li+FcpyC69dz50ZAB2r1GAlmkjf/Sm1dufiH/flEcyV21yuA==
X-Received: by 2002:a17:902:7886:: with SMTP id q6mr6207612pll.237.1586549443589;
        Fri, 10 Apr 2020 13:10:43 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c126sm2518345pfb.83.2020.04.10.13.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 13:10:42 -0700 (PDT)
Date:   Fri, 10 Apr 2020 13:10:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: qcom: Add SDM845 Adreno ZAP shader firmware
Message-ID: <20200410201053.GA786355@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit edf390c23a4e185ff36daded36575f669f5059f7:

  Merge branch 'v12573.77' of https://github.com/erinlo/linux_fw_scp (2020-03-20 07:39:19 -0400)

are available in the Git repository at:

  https://github.com/andersson/linux-firmware.git a630-zap

for you to fetch changes up to e6ff1e706e8befd0530f7300bc7f89203d4fe90a:

  qcom: Add SDM845 Adreno ZAP shader firmware (2020-04-10 13:05:22 -0700)

----------------------------------------------------------------
Bjorn Andersson (1):
      qcom: Add SDM845 Adreno ZAP shader firmware

 WHENCE                   |   1 +
 qcom/sdm845/a630_zap.mbn | Bin 0 -> 14256 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 qcom/sdm845/a630_zap.mbn
