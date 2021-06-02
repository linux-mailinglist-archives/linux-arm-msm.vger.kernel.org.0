Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD243995A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 23:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFBVz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 17:55:59 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:38789 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhFBVz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 17:55:58 -0400
Received: by mail-pg1-f176.google.com with SMTP id 6so3429843pgk.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 14:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=35KIHc2zbuqTDDmHxLiGEjjkMvfweMiA7dOZFvgi+4Q=;
        b=LjLCPWyUJCv/nwUzKFfEIhyVhVfkxZ26x4S6/dHjpZfmu4UWHdiIykV7QdhTgyDSNk
         EhJsuQdjywMyc0patC9/YhnK4GAEKwXcWBH1k9VcGDPLLnGjo6s3g0NA4yxRRM2jwLtJ
         aOdBLSMDVdqFcVTlHqXB8ayK55NwWyV5sFYOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=35KIHc2zbuqTDDmHxLiGEjjkMvfweMiA7dOZFvgi+4Q=;
        b=dadKN2peTPUJ1d0fl9uKdScPTIWCxR1QqFiNVExutl2JCFGu4LZiQC4htm0g/vz3nP
         bF9ma1ydGU7DRqYAwn9MZJnw5xnm6FvxdFt9iCgnx9IgnxpJj7YPrf81Fpb8xdnhi87q
         ofkQhgNC73Z8dpyMvgtKrur9BNa8WhIf8S+XNo2vt16qo33xkPc4UgrPPT+BZTvSKn6F
         kpDiiXZlra56nYpEVl3qNvPUugaI6WIn6k+BOsIPt8eKnJlIti1aqElVpqQ08i9EEelG
         EG9bJ+DDYx30sey+ViXhamKDrkVcTntm6XcvJTyvI0keNwAwUB/4NgT9ZTKedo5TPaDM
         CeUw==
X-Gm-Message-State: AOAM530KXCYfy/51sgQD7Pqy2snCbK0d9tIFgPXX+0G2qIcp4fPDD9Mp
        TrZ+sZni8AY9zlXgdW/URlheNw==
X-Google-Smtp-Source: ABdhPJyxg3ClKV30rkuhRaEjtEXoFLZP5PUk5uHwm06Hhq5bZhf8yYnj5RfUFCfEaRDEHlS+nL22Aw==
X-Received: by 2002:a62:7fc5:0:b029:2de:5813:8890 with SMTP id a188-20020a627fc50000b02902de58138890mr28955694pfd.60.1622670780709;
        Wed, 02 Jun 2021 14:53:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i2sm364203pjj.25.2021.06.02.14.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 14:52:59 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Dave Airlie <airlied@redhat.com>
Cc:     Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        kernel test robot <lkp@intel.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Emma Anholt <emma@anholt.net>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm: Avoid circular dependencies for CONFIG_FB
Date:   Wed,  2 Jun 2021 14:52:50 -0700
Message-Id: <20210602215252.695994-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602215252.695994-1-keescook@chromium.org>
References: <20210602215252.695994-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=331c9dbab9265663d4598c7d5fe5739206ff6d5a; i=Fc5wke0Q0f+i/yxn94DGR+5HIU9duCLMgabBT2xqE4s=; m=wFfctFfoMi2zK6PlZHUypYp3tGHtf9WefM0kh+Zb8ng=; p=2mlWRMfcN4+QsvDCUI3dA5+oKnCQumRrgTAwchW8Ges=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmC3/bMACgkQiXL039xtwCbhEg/+Imd 0I18ddKDJ9AiCRaG4Zm1BLowuBeI2IKKfqbSeXmJVztPyaBSLkLUiCIzM3MraBgl3w6HXFulytfW2 nep/TIf/0nf4qsDdCuOEnaBb8hWd04D8gGmQfqmrvTcIXv1RFcvb0io3fZbESdDpGrEKC5Cathvfg mKqvE4wkTDCtAiGjlK3mb5httl3x0WSV9StwVD26pfFgqDnVNfpxzbqVYfsEfDslKlpQaqLpqoOhq WtU4Dct+QHtYkk4kTSZ+xZIAL0POqSf/2kIYYII/N4dlF5sc9SIdUjsfUEO+OlYboBiabk1sGEyzN qjh6zeiMPt5Gp8cH57QRixWB/UIOhDwgKq5jVkMC5Qev4r93gj19EjjHKEVThWtrJW1uXmfgfgRmS 4pO5aXWdh6U6EdFrG3/h/hfqHxxBc7zBjUPkli5zHNEvLYVodijf/wWXHAIZ+V1LAk2811KyASnSc fHv6akvRK//nNX4CYCb+suSdUD79IzDdK0UtBj4f9k2+aZZZddlhraBwEbSRNUPjGUnYJ20xGI2Hu HV7uZiw7qFYjJFzyvxzgQEZNLcYb8VMYigUHPc+8XdMiICDvqC3PH/+ZQBT0NvAJrUb8Af1FZJa4d EQE+6ZRFjC0Hq5YzPHOoIpnJEPHz6KwlwcRmXWI/3q6u1VHLg7D5d8J0B8fzkQjM=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When cleaning up other drm config dependencies, it is too easy to create
larger problems. Instead, mark CONFIG_FB as a "depends":

drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Link: https://lore.kernel.org/lkml/CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com/
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3c16bd1afd87..90891284ccec 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -83,7 +83,7 @@ config DRM_KMS_HELPER
 config DRM_KMS_FB_HELPER
 	bool
 	depends on DRM_KMS_HELPER
-	select FB
+	depends on FB
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	select FB_SYS_FOPS
-- 
2.25.1

