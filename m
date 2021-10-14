Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC9142D56F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 10:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhJNIx4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 04:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhJNIxz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 04:53:55 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F85C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 01:51:51 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id np13so4212301pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 01:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FgQE+ym8i4wvHWS0EZRm4kYtX72BhEPEpt+mmgJQWzU=;
        b=Xs81szH6fvLJX08xpQvV2HVvRNkf8u3FuPzmn2p0CBDrrCQroTNy8XhTl9hVDXGQy5
         IAHOUEoId4sejVliRXRIhdhcmZHsQ8teSZflYqrXY/swUAu3xULh7EagfkRZI+hArOJc
         XAB3RQnemN2oZBhgos3tuwpgF5wKItJjBVriyG5V3OvystJ1kR0RbRk9JSzhgN0Aj/2M
         WZMV3WW7Q7PgoS8jL9QLd8kxv9FIAUrE1zVzjCNCzblqujSs02jVGBb8ekfnCpYAS4Ax
         frLMHrv0i5Tb1suOsGY7Qe4F4iX6C1kSLBRPVDA+zwrhzfmfG2oLf8uaC4XbPrzui0hP
         w66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FgQE+ym8i4wvHWS0EZRm4kYtX72BhEPEpt+mmgJQWzU=;
        b=wSdvKKOj04lEp4WSK90rd1I+WJZSgWZHYpLvbLh+tTGnTB2KC8TZqIVtqZ+76Z5/0k
         SGV5J9FdpACArGM95k6vF+QmNhP37UbOIm5CdQ747rsoPfc+FBD+cLqz3eDzksQI9aTk
         G5uiLATrbmN8jf792js40xuyyzWlxBaYoIPtq8RiYcehqyYsqZ2puTdfRgalfEAXFpWs
         JWSp7+hvdyRBg1ZWCqWQANMEyA2k8UmXcT2OgsvSeKEef31c1RpsJC+T05IpEX2SRA05
         FQHtZ1APOcDgidjanrHTr8Wo4AbMvOKIDbUxFiycKA7NMJOhbkkv0S62mdqiQb2X6BXs
         +dxA==
X-Gm-Message-State: AOAM533lr5jBTt4Wej0cBRMrlvBdVEB8TxG6YzlEdvb/G1LoS1dAjsZ+
        K3DhemgSV8dDklawLRoFWO8=
X-Google-Smtp-Source: ABdhPJwxkwYvjtbetBrfk3EiM9oyFNUKrizOjVUXebdeDgAtZiGtoNhstxuwbMKuXEBYpxETOypi9w==
X-Received: by 2002:a17:90b:4c0d:: with SMTP id na13mr4851292pjb.232.1634201510946;
        Thu, 14 Oct 2021 01:51:50 -0700 (PDT)
Received: from localhost.localdomain ([8.47.15.154])
        by smtp.gmail.com with ESMTPSA id i2sm7968082pjt.19.2021.10.14.01.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 01:51:50 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Yanteng Si <siyanteng@loongson.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: fix build error
Date:   Thu, 14 Oct 2021 16:51:32 +0800
Message-Id: <cover.1634200323.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include linux/vmalloc.h to fix below errors:

error: implicit declaration of function 'vmap';
error: implicit declaration of function 'register_vmap_purge_notifier'
error: implicit declaration of function 'unregister_vmap_purge_notifier'

Yanteng Si (2):
  drm/msm: Fix missing include files in msm_gem.c
  drm/msm: Fix missing include files in msm_gem_shrinker.c

 drivers/gpu/drm/msm/msm_gem.c          | 1 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.27.0

