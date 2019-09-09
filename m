Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC90ADFAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 21:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405845AbfIITxJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 15:53:09 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:42433 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfIITxJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 15:53:09 -0400
Received: by mail-lj1-f181.google.com with SMTP id y23so13978096lje.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2019 12:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=h2kn9RQW4wcJl2UUQPu9W8A3jJMeFaC/TKqNmn0tCOQ=;
        b=dcaWWvv1JR7Lvjqw/jhQX42vVy3Y5Kqd9j1kMY6FFPxM0jx0PgjYYqfLf6Y8SXDHvX
         976IpnmBEYMEeg6SKU711UoX/XYGhlEPbRvxwFOn/vgZ2l9nVtNvGmQ/FW+R+SP2QFDH
         VpRfvAEZxpGG5woKAkv/GovKECcn3XMHjzfXrdynUYfThKgMPsrx/qg8vTWC4Wbu7fcp
         FB94Mlnvd6jOIOi5fIi3PmKz2NL2N3km71Tydfge8rg74GigGFcS/RxCXcf59K/XlHLh
         MY/3JWjH/ywtzPQEZNTCO/LNr5aMVI9IDes2c7rPBneEY3ufDFTIi3xv++j5bjefTf+j
         WIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=h2kn9RQW4wcJl2UUQPu9W8A3jJMeFaC/TKqNmn0tCOQ=;
        b=C53WSQM7ULx4R6le5zdnwWGAgrkvnDwpsmK/m1aduqxrr+lK0fl3pwT4GplXxDls3N
         qRCQG0MbLMjqcF8WVnzDmfcs408i5w+OKeARJfDzzKkonM/zws35/gCzyKQE6KRa8Jem
         sHOSsoQWAWIU7XfQB5vUA5oeDq0yT/C3OkNGslZH+LcXq3Y3XZUCeYoLVX3PldMijl3s
         gH+QSNt8RHVea+7G6ZAHCTzM0KTJbwrbIPgT4sdOJuSb7EhzWpb6me8gk3knsUYkp40W
         lD1hiOyPqI+ucegg0GqupZELKn999ZPXMzkEGdplD0dvkMtpr3hT7Gpo660t8+X9RutY
         zZZQ==
X-Gm-Message-State: APjAAAXyYBsbmAqO9l9U7yUPi8awOiTMV9O4Tn+dXd6HmNS4rHacmXUF
        23SQFWt1KkKrxCBKDKBV+cchy5r3ws4SOEzBXLd61A==
X-Google-Smtp-Source: APXvYqwymSrr3w05EIW0pLrAqF7a7oG61QosblN6rP4fIYl0x3RROTX+4EOb+JbBdxR8naG/7n/hzzmUL70CWCMrH/I=
X-Received: by 2002:a2e:1b02:: with SMTP id b2mr17238794ljb.211.1568058787145;
 Mon, 09 Sep 2019 12:53:07 -0700 (PDT)
MIME-Version: 1.0
From:   Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date:   Mon, 9 Sep 2019 21:52:55 +0200
Message-ID: <CAP71WjwcmNn+8t3pSSUf+SLayiH8AWcu8iZYFTrx=FVdPQB+Nw@mail.gmail.com>
Subject: qcom: add firmware files for Adreno a630
To:     Linux Firmware <linux-firmware@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

hi

this pull request adds firmware for Adreno A630 GPU found on devices
based on Qualcomm Snapdragon 845. The original firmware files are
distributed by Thundercomm, the vendor of the SDM845 based Dragonboard
845c, using license terms defined by Qualcomm for previous
generations. The original firmware files can be found here:
https://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/

The following changes since commit 6c6918ad8ae0dfb2cb591484eba525409980c16f:

  linux-firmware: Update firmware file for Intel Bluetooth AX201
(2019-09-09 04:22:42 -0400)

are available in the Git repository at:

  https://github.com/ndechesne/linux-firmware.git gpu-845

for you to fetch changes up to 88ea23e7eed04e78111013df9b81dd851037e4da:

  qcom: add firmware files for Adreno a630 (2019-09-09 18:13:55 +0200)

----------------------------------------------------------------
Nicolas Dechesne (1):
      qcom: add firmware files for Adreno a630

 WHENCE            |   2 ++
 qcom/a630_gmu.bin | Bin 0 -> 32768 bytes
 qcom/a630_sqe.fw  | Bin 0 -> 31316 bytes
 3 files changed, 2 insertions(+)
 create mode 100644 qcom/a630_gmu.bin
 create mode 100644 qcom/a630_sqe.fw
