Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438D435206E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 22:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235552AbhDAULR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 16:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234287AbhDAULR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 16:11:17 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CED9C0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 13:11:17 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u20so3492363lja.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 13:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=mhUDqpSrPGJrUC3y7pqQdiWyabW803L1a+YQHPLvBho=;
        b=S9jguAXDEbC9AQ4Fh8k0nFBU4XeGYh3uwL/9uoFDllELILiT+Yl0sQ3m8R9TCU8Ve9
         7tUyMZX3ScnYgmyYTtKhSkpHQWRfNTglbiVu4l1Cfn8VWlOCFTtpRTibwAlW80EUWVUr
         zLRQ7X/2H1Dz/LylTy624HG0BPyYp3J5d4jH75ay7aUY+KhCgqbWbXBzViUb5Tt3RmTM
         za5Gg2H1jPHN/jTIXOCQeUenMLvJFAXaE0BtbsIztzX88O2uZJstQm9GThxh9y37dM5a
         C5++qUEmBualHNLppes+DbOAmtYC5hb6P+kEIjj9cx4oS5QJByp/ArIOMcA5391dVe94
         ACSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=mhUDqpSrPGJrUC3y7pqQdiWyabW803L1a+YQHPLvBho=;
        b=Vfffp4dNYJcU5pFDrJxIsfRJyMIDsmGXlysomCeHZwP25Ib1eKLUGmKn2vawJZSiiI
         SmbytKvLV2Zph5Xu/6tGxH1Xko9G2aqAkrxaFOVVHN3JTb1lEjs7/l4ffuA+vUqCvp/I
         agW34N8HkqXlucIUUFC5ySCzKmNEGYRDDkroWV73zg7mcVu/e1xZ3vlvONAp8TBm6wKh
         WdSqm5+m3wmckvOnT2Z6uQ+sbRblAFLgWvrdWpp5AoOIWiAafHJ5H0VOTPOxH4jxPMOM
         VtwKYzBOOoSifVdwQzq2b6uM2Wf8G7EG673KsetQCFvfNiWL0BsNbugcpHN6oO4cVlYK
         lX0g==
X-Gm-Message-State: AOAM5329oIF0Sqa1QKrBBnE4pfyRiYqIrQQH6b0lay26a+eAQ4C6EhDD
        dfpbONJQ/F/3MT1n2ZAYGDavZQ==
X-Google-Smtp-Source: ABdhPJymsHAJUmUiaWVJ2EFdl8kRUFWJKEn+2UlrxStbtaESaHjtQkjEINDn/Wa/DuGHApcP1BxGxg==
X-Received: by 2002:a2e:981a:: with SMTP id a26mr6388275ljj.204.1617307876092;
        Thu, 01 Apr 2021 13:11:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w23sm711421lji.127.2021.04.01.13.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 13:11:15 -0700 (PDT)
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Update firmware for Qualcomm SM8250 platform
Message-ID: <63f0c675-d04b-1961-53cd-e621b48dab94@linaro.org>
Date:   Thu, 1 Apr 2021 23:11:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello linux-firmware maintainers,

Could you please pull updated firmware for Qualcomm SM8250-based 
platforms. Firmware successfully tested on Qualcomm Robotics RB5 platform.


The following changes since commit 3f026a2f13a8f130cde849168a111ec80f12e27b:

   rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x59A_76A3 (2021-03-22 
10:17:18 -0400)

are available in the Git repository at:

   https://github.com/lumag/linux-firmware sm8250-new-fw

for you to fetch changes up to d8fa0cfb4a285d11fd7102efd1763f1be90fac99:

   qcom: sm8250: update remoteproc firmware (2021-04-01 23:05:00 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (2):
       qcom: update a650 firmware files
       qcom: sm8250: update remoteproc firmware

  WHENCE                   |   2 +-
  qcom/a650_sqe.fw         | Bin 31488 -> 31804 bytes
  qcom/sm8250/a650_zap.mbn | Bin 13964 -> 13964 bytes
  qcom/sm8250/adsp.mbn     | Bin 15515796 -> 15515796 bytes
  qcom/sm8250/cdsp.mbn     | Bin 5822228 -> 5822228 bytes
  5 files changed, 1 insertion(+), 1 deletion(-)



-- 
With best wishes
Dmitry
