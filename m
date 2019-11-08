Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EECEAF5A33
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 22:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388286AbfKHVhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 16:37:40 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:33015 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388098AbfKHVhk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 16:37:40 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N3sye-1hkxG40Ils-00zl9w; Fri, 08 Nov 2019 22:37:20 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     y2038@lists.linaro.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>, Joe Perches <joe@perches.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Kristian H. Kristensen" <hoegsberg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 14/16] drm/msm: avoid using 'timespec'
Date:   Fri,  8 Nov 2019 22:32:52 +0100
Message-Id: <20191108213257.3097633-15-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191108213257.3097633-1-arnd@arndb.de>
References: <20191108213257.3097633-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RjEXZPsu7wpFhVxxI0dg1gh3Sz1Hs1tSIhY/d+ypW54uoydpUSG
 AmGQqqAY8JV5SlTDcXhYy28Cbwi6/UGOCD0adGaB381dFQFh/45M+dKBA0PhUP+o9KaobMD
 qQ4+kG6gGE9DhvaaTxM/81sndh8nhZ8P0Vu53TlGZW7N7R5T5iUpKVXTQlPxMFUkAtL5rs2
 msQ7tFAGZ+6hiDk9RernQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D5yuQNG3OL4=:+hVgFS2myj/sb8ogFE78Gf
 FbKWcflcE8+US9yHfM4XVrV8foC/5BoESWZWiO/u184ma1eEMd/MnwSldHbYazHDHwj+Hk0cc
 w1ZZoSZHw4i2n04uf7GQRD305sbby6a/ARii8mddT6zRtv89NmMt7YKRV2k6pa2McGa46TLXI
 27ESG6TqgROSWOlECco2f8f6/fAopAzdxTLoLuQQSdHwFAHO4VOhbQRmpC6yZ8gP75krH1mxD
 7RpqwXn3BD8r/pG1dTm/d6vf0KUkeMhjmjhvMn35EUGy10yqOyibgRSRNggUOVk+JXvqcbADt
 k+HAhYEhuPLgVd0+QAe1B4po/j2ou2y1fW0/nx9zGNC0/cRdk9b+ndgOFHcmTRdjHOxOEwmTb
 ibhZMHBgI7GoZJzMrt1nQ7+PYx+XcaL8O7kFdja71uOK/2P9ZFdFLRyROE0XQztIxXE+r3eF1
 YfSIi582gUSMzpxM4iIcFe3ieBp8J6DKYq6NX8x8B4ylUAUAs0I9f6B6kp4Pnwz2JAsjHWEwG
 h6f/GW3C8Uczi7An1srzRVP1SZriDAsuGBZvIamli9X7+IKnh09hTiJng40aSYHPBbKor/nDS
 gLMC3fT2lbdLzt5MYBKransgJZ2pbKZ8Np/YdZxRnO69REzQyXI449mSspVn/wbf/VeQoL144
 DUMHUqUPSL4P6uzETmFemX8tGWajJnhrjGeV0NLaelE2Lxhvsxn7IM3NAJW59eNULBS0RcMiD
 IZQ2f7Gv6anhh/MtSw2sEO5tpQ7Ggk+81o17ssiA635dGoVymkpMfpRJxjJmoh6SY9w3HbS+D
 nEhwjGkP08t6b86oomYL9qFNuRI5fmLgCcd45bPGdaCNzD2zaFO0+hUcD5kHmsalbPgc0w11X
 zFmCZZt7G4MqQdjIlmUw==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The timespec structure and associated interfaces are deprecated and will
be removed in the future because of the y2038 overflow.

The use of ktime_to_timespec() in timeout_to_jiffies() does not
suffer from that overflow, but is easy to avoid by just converting
the ktime_t into jiffies directly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/msm_drv.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 71547e756e29..740bf7c70d8f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -454,8 +454,7 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 		remaining_jiffies = 0;
 	} else {
 		ktime_t rem = ktime_sub(*timeout, now);
-		struct timespec ts = ktime_to_timespec(rem);
-		remaining_jiffies = timespec_to_jiffies(&ts);
+		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
 	}
 
 	return remaining_jiffies;
-- 
2.20.0

