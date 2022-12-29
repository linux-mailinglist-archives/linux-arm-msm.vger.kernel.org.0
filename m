Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C9F658ED9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 17:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbiL2QT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 11:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233187AbiL2QTz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 11:19:55 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB61912A80
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 08:19:54 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id bk16so4600524wrb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 08:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckwJsNHq8jA8+KkatVoyYsHVYWJiVU+B5bcV7q8fzuE=;
        b=rnCmU3MGagqA8FlzGwm6mCGQsANjiRvoxXs7IliDgwzA1zQRFXdrwwr4o7cUboB26W
         o7MsGfb3vDonVS6n3UL7lNUT6ukXvkj7MbiXzZMuIVeIZ5H52IT/feGqzDUgZxUfSnzU
         0ekXGloi35jcqdc0aZTISlcgwuIQJa1jvWE4vdG++upwWMNQL2W4Mbftj5xuYnvahUQ1
         sDKwUipV6HCCVDwCFLXl81hF3W03VF9jWGuEntJhr8j/Q0X02+n37CSMppO7xYENFxtV
         71LiQEZ3/nd1on/of2pZzZy9SU7uHfX3LnxTOUocvlhKPy3x5H9b6+IXsPcnfE0gi6z3
         qOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckwJsNHq8jA8+KkatVoyYsHVYWJiVU+B5bcV7q8fzuE=;
        b=jeEgKfwLGK2vdIAUQJzAr7WXBb1n2CSvKPaa3guAbma2a75ewetx11pR0hV3TvHswS
         atWFwDxFZQ42TcNNgRm17whvBdiA6EHeEA3PRkpybaOspSEnlX6v5MihSNbMlByjcOjP
         g2Mk8zSjPg9n3SnFhU4Ue2okZvaUY6moa/wTWjNw+JSQGqwKFdT6+bt0gnfnhIq6B3SZ
         AgbPxH5lFzPRnNlw/8aowxVOCd/ZVsklUWazs6SCvn7U9ESZGe2f+41ZZLZl6ev5mUdc
         +1wdyvuhYrNewnYAtnLlljZsGC1BfFOvVXthy3O0HT4GYSKNs9S1zocDzOq+lYqKtv0w
         bSgw==
X-Gm-Message-State: AFqh2kpe1BTaKCF2QtIYMmasO7soqNuKNjqXmsrDOGQVOE/fapykGPuH
        +9Y+wY401LBS4SZhi5u3kPHnxQ7NKpogd1Rp
X-Google-Smtp-Source: AMrXdXvOeWNklXhFqY7ecbCXLrmicRULJuL54wADGZiWhUCeQP/MZc8LYdzBa6AvFLOHDGK72xk6Fw==
X-Received: by 2002:adf:f007:0:b0:28e:66ae:75af with SMTP id j7-20020adff007000000b0028e66ae75afmr201935wro.58.1672330793007;
        Thu, 29 Dec 2022 08:19:53 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8f7a:98d8:9d8d:ced8])
        by smtp.gmail.com with ESMTPSA id t5-20020a5d49c5000000b0028cf987d944sm1333199wrs.33.2022.12.29.08.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:19:52 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH 0/2] tty: serial: add and use a managed variant of uart_add_one_port()
Date:   Thu, 29 Dec 2022 17:19:46 +0100
Message-Id: <20221229161948.594102-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Resending rebased on top of v6.2-rc1

--

This series adds a managed variant of uart_add_one_port() and uses it in the
qcom-geni-serial driver.

I've been asked by Greg to send it separately and he didn't seem to be
impressed by the proposition of adding devres interfaces to the tty layer
in general. I can only assume it has something to do with the ongoing
discussion about the supposed danger of using devres interfaces in conjunction
with exporting character devices to user-space.

The bug in question can be triggered by opening a device file, unbinding the
driver that exported it and then calling any of the system calls on the
associated file descriptor.

After some testing I noticed that many subsystems are indeed either crashing
or deadlocking in the above situation. I've sent patches that attempt to fix
the GPIO and I2C subsystems[1][2]. Neither of these issues have anything to
do with devres and all to do with the fact that certain resources are freed
on driver unbind and others need to live for as long as the character device
exists. More details on that in the cover letters and commit messages in the
links.

I'd like to point out that the serial code is immune to this issue as before
every operation, the serial core takes the port lock and checks the uart
state. If the device no longer exists (when the uart port is removed, the
pointer to uart_port inside uart_state is to NULL), it gracefully returns
-ENODEV to user-space.

Please consider applying the patches in the series as devres is the easiest
way to lessen the burden on driver developers when dealing with complex error
paths and resource leaks. The general rule for devres is: if it can be freed
in .remove() then it can be managed by devres, which is the case for this new
helper.

Bart

[1] https://lkml.org/lkml/2022/12/8/826
[2] https://lkml.org/lkml/2022/12/5/414

Bartosz Golaszewski (2):
  tty: serial: provide devm_uart_add_one_port()
  tty: serial: qcom-geni-serial: use devres for uart port management

 .../driver-api/driver-model/devres.rst        |  3 ++
 drivers/tty/serial/qcom_geni_serial.c         |  8 +---
 drivers/tty/serial/serial_core.c              | 48 +++++++++++++++++++
 include/linux/serial_core.h                   |  6 +++
 4 files changed, 58 insertions(+), 7 deletions(-)

-- 
2.37.2

