Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C87122B14F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 16:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbgGWO1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 10:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbgGWO1r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 10:27:47 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75DEC0619E2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 07:27:46 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id 72so2636529ple.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=GD12Q74OR6GJeN3xWOb2zFUMALqyHWcaZFsUpKnWDSQ=;
        b=qfSf18Yx1kk7vH3YZAyYDde0KB7jmDp7S5IdTBDNXsAzqvJMFY0US9NwhHYg0wkWRZ
         wbCc3rbrI6wDT7nBcQpZJWTRcFM0WJLQsi+fJjYb4qYjQUA5sqTZGqqjpAufKMItJckW
         Z2fSbkO+G5UFKty3NsfayEMIMMzerq/6msVolUVsU4pk8AaKEvsKy8S2geM6f0yJAtuZ
         wo8oLY7TYkarjMLrGn534Wj993VjmMytB4WZ1taa05hNZhLwltH9kHkdwEktSY4HVELx
         5ERXbNec3O8xft2vttfRHejM5Ry21VVmTUy46PYPRvcqMJUF7cd4VPkrWhyLDsd3oBB2
         Lqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GD12Q74OR6GJeN3xWOb2zFUMALqyHWcaZFsUpKnWDSQ=;
        b=eSV/foH8+eoncGF0kLB307N1zR3/eucAqEH1Z5IE75iyN/qV4KzYEV09QviazS7lA/
         BcX3LinIFFCp5Yf6boCLaZrPPZXKK/So94pUkOHWlnN/vrep5A9RYER4OjMycHtCpMBQ
         V2J6ViNMyv8NmPiJqmuBx5Zc88bbkxgJ+dc/ZdIZktgpwLa12IQi4M3brqGznls3HGES
         KgnxnW37xyDrHJY1pDKA2LppZVdM5sRPbqMhpTS2AtM2qdkJTKlnFQS/o3afwZAwO3by
         CHBSPfHQ4uOkOVD4ZONSsKY3gZicce0VBDh47BzlUpojhqAmfk3xRH0r7ooqNBSm08tz
         NXbg==
X-Gm-Message-State: AOAM530Cuj5lKqPMTX6jYsoMEz6TkbL3euLysJTpdP6uRRPHwAZYk+fI
        SlgFF51egyFl7FmQL6YtO80k
X-Google-Smtp-Source: ABdhPJy6/zrDKK2Gjisdl0VDYpcxJSZ2oH4T0/Y6XUQblucC3h42j5j17W/9lvR6wW2S8vJTeS+jGg==
X-Received: by 2002:a17:902:aa4c:: with SMTP id c12mr4110467plr.237.1595514466093;
        Thu, 23 Jul 2020 07:27:46 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6219:d937:e4bc:bef6:c190:2693])
        by smtp.gmail.com with ESMTPSA id a2sm3131977pgf.53.2020.07.23.07.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 07:27:45 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/1] MHI stuff for v5.9
Date:   Thu, 23 Jul 2020 19:57:37 +0530
Message-Id: <20200723142738.27159-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is a single MHI bus patch for the coming v5.9 release which fixes
the kdoc comments.

Please apply!

Thanks,
Mani

Randy Dunlap (1):
  bus: mhi: fix doubled words and struct image_info kernel-doc

 include/linux/mhi.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.17.1

