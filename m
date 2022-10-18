Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9C96034A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 23:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiJRVMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 17:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiJRVMw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 17:12:52 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878E4C4C3E
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 14:12:50 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id be13so9192948lfb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 14:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jBNmCEKNIJ8QoqMKRCXQ8dxLqKledSWNKpiUAkjyuYY=;
        b=QPiLaTKyd9Ebm8sv/378EOdEZ4aPnP+VPiwGTkz/amewbX5DDLbBPvmGRdl0M3JpDI
         rqIauBmNgAvNr4Y/cd8o+mo+HNtqZgsTzPdSyE+w5cE05RL1DUV95g+8r2G4F4tq6KiD
         0/AkNgmf+aR0PJ70ATQHZP16x0hoVCKaedXso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBNmCEKNIJ8QoqMKRCXQ8dxLqKledSWNKpiUAkjyuYY=;
        b=U0F5CEE+pKv/ybHGyIhwQiHksXSGYTSvLGHvL30PXCnVVjvHnZ83Mr52OVXrI/X9E7
         vemQKuDd1LVBAqa7LfcyXpLbgRxsgBM4V0hHkDDX94Q5o/FJCvNi8KhiLKP6SY/LSExn
         QvLx/hIq0+fWiHYilBZacbJ2bsPWWdesg9f9MTgX6PzLusag6GFHuqC1Zp41Xju8dXy5
         YX9rsYkwjjSxSX7/2SZXjft8y7+XfaetpwZvvkN437vKkyIxvCgsJAYGiDMerz9eU/Ke
         88cHjcRfG/NMpULSGcSusyHd9LEohys+q8obNJCBJprZisBe2XGUVt+y271wTp2vtAKe
         50nQ==
X-Gm-Message-State: ACrzQf0NB46W6E/n51OqRDZat51l8sNOzNmvILmpg/3Rp8cJLs1Sljln
        OiXguh2W2xyLK8GO1xWNuNVNEz3evi0MaPkuFE1t0g==
X-Google-Smtp-Source: AMsMyM4BK9xE6db7GdQSimKMJ2byNr2ij+bHVZ8z4TJIIAGKS19whmG0FHGEXw3C22NsKH4yE7X6yj3twZpIhUyPB+4=
X-Received: by 2002:ac2:442d:0:b0:4a2:23e2:cf59 with SMTP id
 w13-20020ac2442d000000b004a223e2cf59mr1570305lfl.650.1666127568897; Tue, 18
 Oct 2022 14:12:48 -0700 (PDT)
MIME-Version: 1.0
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Tue, 18 Oct 2022 14:12:37 -0700
Message-ID: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
Subject: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, quic_vgarodia@quicinc.com,
        Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:

  cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)

are available in the Git repository at:

  https://github.com/nathan-google/linux-firmware.git
update_sc7180_and_sc7280_firmwares

for you to fetch changes up to 76e160366a28010fa06ddc965659c38a44d159d9:

  qcom: update venus firmware files for VPU-2.0 (2022-10-18 13:42:58 -0700)

----------------------------------------------------------------
Nathan Hebert (2):
      qcom: update venus firmware files for v5.4
      qcom: update venus firmware files for VPU-2.0

 qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
 qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
 qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
 qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
 qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
 qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
 qcom/vpu-2.0/venus.b00   | Bin 692 -> 692 bytes
 qcom/vpu-2.0/venus.b01   | Bin 7376 -> 7376 bytes
 qcom/vpu-2.0/venus.b02   | Bin 300 -> 300 bytes
 qcom/vpu-2.0/venus.b04   | Bin 20 -> 20 bytes
 qcom/vpu-2.0/venus.b09   | Bin 939184 -> 939472 bytes
 qcom/vpu-2.0/venus.b10   | Bin 42976 -> 43120 bytes
 qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
 qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 8068 bytes
 14 files changed, 0 insertions(+), 0 deletions(-)
