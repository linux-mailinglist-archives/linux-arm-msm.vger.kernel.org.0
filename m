Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B9C377761
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 May 2021 17:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbhEIPkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 May 2021 11:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhEIPkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 May 2021 11:40:14 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5DEC061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 May 2021 08:39:10 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id fa21-20020a17090af0d5b0290157eb6b590fso8884038pjb.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 May 2021 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fex-emu.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oj0cxtHt4k2QsOXZJ1mqPuS+LtZjL33yvcuTzOU4i9s=;
        b=iPAkYy0A4N8s4fD0pZoq7FzyT0D+8DjZXwCk6RYtKFLK7vSjHvVnOIk+ObDRKyOj50
         tSp4hbp0MFDRo4U5V5RjC0lJEhqmUhidM34nw1H7TTDHJR3lsbgzdrb86iUWYsekbGoA
         IjlqnNTtyNj3z2m3qndB7GPdKpB6Uirek398l58yxQdH667l3ySPwwKs+ER37NXLZtqC
         f2Xyzakp4dd+55nb7onMffwEfH1/NxuCWefIj3hJ+u6HLcVBWxZKEuHI+/5txKXomSz4
         wo3ORaUiHQ/DnKM8g+YJfNB0mQx3KRG9yKYxbgcP3Z4l2e75E5edYfzZyz6SyM8G5RmA
         Pj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oj0cxtHt4k2QsOXZJ1mqPuS+LtZjL33yvcuTzOU4i9s=;
        b=HtnYCVno3ku9O+7zHvv6o9T5qle4OnCajNfoC5RvIISgcj0m6EgOIvJE7hdbA/+SXA
         +eDV0+y8O7Cu0SVdKzWqdoRxVLLmyV9C43IN9+1wmaPkyqEs/H759+hW18KpBca6Sp2c
         gJSFe2u0ca8fufoAy9t/HkakVv5kHaX92PDBH5rmtci/sX1fMeq2g7rqnTHarxbWZDVj
         8k/Nwkuyj7IVy3sztjm3hcBh+uvH7tDxVUXyL2bJpIkCccx2unumnx7TV6rXHKqKXoxF
         e/ng3hEggscwIePBGK1CFL3EA3H6Rk9uDY1adp24VjfWs8oKJkgGfapMSorL6ikMzs/3
         7F6Q==
X-Gm-Message-State: AOAM5322w9Iqu/IlTpOKuNpMireZwvpGIEdOSJSz9MkM+G3ZM8FF7zta
        477Bv6q5PpMKnNqDRjvsYDu6fg==
X-Google-Smtp-Source: ABdhPJzuLvXgVXIw+/LHFTPK/5u6YP6h1gj2+taNgTrrzE8i9b7+EhMUEJXEeJqGgSCKFtZKjzuPGg==
X-Received: by 2002:a17:902:7c94:b029:e6:e1d7:62b7 with SMTP id y20-20020a1709027c94b02900e6e1d762b7mr20240359pll.29.1620574750226;
        Sun, 09 May 2021 08:39:10 -0700 (PDT)
Received: from localhost.localdomain (76-242-91-105.lightspeed.sntcca.sbcglobal.net. [76.242.91.105])
        by smtp.gmail.com with ESMTPSA id x27sm9505403pfo.216.2021.05.09.08.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 08:39:09 -0700 (PDT)
From:   houdek.ryan@fex-emu.org
X-Google-Original-From: Houdek.Ryan@fex-emu.org
To:     robdclark@gmail.com
Cc:     abhinavk@codeaurora.org, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kalyan_t@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, maxime@cerno.tech,
        miaoqinglang@huawei.com, robdclark@chromium.org, sean@poorly.run,
        swboyd@chromium.org, yaohongbo@huawei.com,
        Ryan Houdek <Houdek.Ryan@fex-emu.org>
Subject: Tested
Date:   Sun,  9 May 2021 08:38:42 -0700
Message-Id: <20210509153842.124974-1-Houdek.Ryan@fex-emu.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210508195641.397198-3-robdclark@gmail.com>
References: <20210508195641.397198-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I have tested this on my end and it resolves the 120hz problem.

Tested-By: Ryan Houdek <Houdek.Ryan@fex-emu.org>
