Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8E36BDA07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 21:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjCPUVW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 16:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjCPUVV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 16:21:21 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76207E89F
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 13:21:19 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id rj10so2841214pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 13:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678998079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q3i1too33EMahveRbuxNasAN0FfHWaolQncNRUeKk3s=;
        b=R9oM9aXd2Sn6h4bV0qBQKGi1qHrcdBjSrcHuV+y6QBP/Jn6Z911RI6cVBP4wJ1wcul
         rKxVuPuEEl3ZQBPkJUSgcVFGOOI5sgLW3w8gFyX3MGy9Ic7dOJmAAFMogXNEFs+xSDWW
         4zBkSHGamxKFL+TaLmsN3X1dZON4TpUUMMhtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678998079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3i1too33EMahveRbuxNasAN0FfHWaolQncNRUeKk3s=;
        b=WdQAPiGJh0sgKIT7bILrCemzvE/wRlJiWhNW+ws5mr6uoCxkBpeuy4KNwSze7+lNbl
         tr+tyFga/rfImTb6RzRBoemB9Nd3WJnZhIZqTRNxkCPlKV7YjCn/pi6YueCvWrWIiRYT
         z1OtIYGNRtVA+TbwcKnOTYCve2H9R24ZXl7XRZCXVrEUzifEHRGH9XRgVAverWwUpq58
         auJQaeVy75nicugUskxTEkaADu1Tpli+hDK64PqBZ7AChbYVA8f9oVd8Bp6FVP3Jg/7a
         SsgGRur1AdxXU+O9UtMe7ao/UqKt6t0qHAsrle06YPHjvv5R1LvN3e6ZyrNbrCTPUpAt
         YzKA==
X-Gm-Message-State: AO0yUKX2zrnpUuh4AhaK0kosJzLSl2FBeuRAQbLKvQ/X001wB6l7ef0s
        XLe7Z2Iyav98pnNZyf50uw+Ylw==
X-Google-Smtp-Source: AK7set9yssgAFQezxJ/RfIneXy6O9/6hx6IWvENqFQh8FK49jmaaVVUPU6K/d3qqZDHF4VNoOI1Xyg==
X-Received: by 2002:a17:90b:350f:b0:23f:35c8:895 with SMTP id ls15-20020a17090b350f00b0023f35c80895mr2925707pjb.32.1678998079225;
        Thu, 16 Mar 2023 13:21:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4db6:6f23:6ad2:998d])
        by smtp.gmail.com with ESMTPSA id b4-20020a17090a5a0400b0023acdac248dsm24114pjd.15.2023.03.16.13.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 13:21:18 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        kgdb-bugreport@lists.sourceforge.net,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-serial@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 0/2] tty: serial: Fix kgdb on qcom-geni-serial when no other UART users
Date:   Thu, 16 Mar 2023 13:20:55 -0700
Message-Id: <20230316202057.4070382-1-dianders@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Today to get kgdb to work on qcom-geni-serial devices you need
_something_ to init/power on the UART. This could either the kernel
console output or an "agetty" running on the port. If nothing else
powers the port then you'll end up getting a silent hang when you try
to enter kgdb.

Let's fix this. The first patch here is for the tty layer to make sure
that we power on the port when we init it for polling. This would be
important for any drivers similar to qcom-geni-serial that actually
need to be powered on. The second patch here hooks up the poll_init()
function for qcom-geni-serial, leveraging an existing function in the
driver that does everything we need.

Originally these two patches were bundled together as pathes 2 and 3
of a 3-patch series.  We no longer need the first patch from the
orginal series since we landed a similar patch from Johan [1]
instead. The second two patches are still useful, though, so I've
reposted them alone and added this cover letter.

[1] https://lore.kernel.org/r/20230307164405.14218-1-johan+linaro@kernel.org


Douglas Anderson (2):
  serial: uart_poll_init() should power on the UART
  tty: serial: qcom-geni-serial: Add a poll_init() function

 drivers/tty/serial/qcom_geni_serial.c | 1 +
 drivers/tty/serial/serial_core.c      | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
2.40.0.rc1.284.g88254d51c5-goog

