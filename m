Return-Path: <linux-arm-msm+bounces-33742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4659977A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 23:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0245C28414F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52751E260E;
	Wed,  9 Oct 2024 21:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qcF8FN2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA3B1E1A14
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728509969; cv=none; b=VIXmoyr7sTil/5FNKr6lSQEXCJ7WSpXHST9Y3k2t+VX8/cpqPVusPYE3vhcm62X6pD9/bkrYh9SQ356Dj92ZoeHKi1WDnuE0PM3TRKnHp0USSad9D34bf4vodUvWW2qinsk8iHTX0iYTjx6d158Kt7Za/LdO7idJIfRKnZCx3JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728509969; c=relaxed/simple;
	bh=0c8BGVnrDotw/l9gQJKQcQ7lWr1R/wso75ZgmKjyqM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aqKKXte7mZpR7wiOfzSxM/nkNCIiIxniF7OR0/Mv9rW0V9c6HnpdnsfC7HA70ZGeYydVNb8qpD2u2YMkzfEihtFeDak7VVlejkh71ATa/r9T5Fy7aLtTeoHEiV6v0WwFD9eT0GkwDbKNhQHhu/5KGgIAXdXdCQYyUniTZfrnDV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qcF8FN2g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4305413aec9so2007655e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 14:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728509964; x=1729114764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0rQaNhfJdgiX0j7tD96ubppthlL5BXRY1P1em0FGpw=;
        b=qcF8FN2gxA8SnKixTG/3ZYVgeO5yE9kQ6InFqq1dyF2xJE2faGgb+HsELquc9cL4zo
         k1FtdvWIf/UZ53/mP+4ktIMqOVJJxXcOcqtcYcJeKkXXL8gVRnX8engnMP9owEEXaxgy
         kgzZIIzHgu4P0XEOLEz/iPT6Y1f3ZFEOUTfE1gtXdss62IA6OORo+bB0cbNsBhHKYn7S
         XpFCdhd3/RNEP5Zn7+fcyVVTF1YeIfdhgZNPkKIBld5vOVNjSHXWcZuAGQt1PrUj03fE
         rDiwcYYh8RGWQLCRlQg4pIWumTf+GkOR6L0VrRdRS3Ym4K1qWem9UKd7IvWJPgqO3lDF
         DL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728509964; x=1729114764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0rQaNhfJdgiX0j7tD96ubppthlL5BXRY1P1em0FGpw=;
        b=pl8NTMR/2c+RRw2xZn5uf31HwiGZyPgm+Xj5FNfnxmIlKwMOaDVrVHinZzCkQt7oq1
         8JkHT9p0YifTV1VfXujMn8ddC57/MYqgYKKyAwSjxZP1JX0rqJ83X/KzH8tfA37gmSZ6
         dxsLjeUyfMi+tlI59dzUcINAht6CHfjNwcnyaJFBYFrfIp0VaMBsdjAbxb75y0pOQpHc
         qJcIdAyrEdWLCrEI1rJOqdG9tvNwZF9p+w86pgUsZ/BXVLdCUlcFlXGH/dk5Ouc/A9fZ
         WIUNOs699Ly5hHqB2lmQ20i95o2KlUQXuD3F0zo9S/pKP7ncivyU10YHB6IGLddiVALG
         wN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9+YZdcBVFPdwsDoaru12J+/7GC5ENEAxHWXpq29uBGsClNDwNrbWaxSwcXWq5RB09HJQC9EIzt90WEB8O@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1EDupqlzUWXuJnz2H1xQ8HfUZ322wx6sntjuioFnj34kLb3Wl
	l3hkNNvAFeG0pNggxcfHTxFxP3vSZ49+KT+7EjMeB7q5WpLsBQtc/lXaDw/FcQw=
X-Google-Smtp-Source: AGHT+IHez/gJ3C7S4ZMoTbKBhBekhmZA9UOUpT5+Euj3ZsVoNpslzJmb3UVF+KWraCIHsaINTqAyCw==
X-Received: by 2002:a05:600c:1381:b0:42c:b23f:7ba5 with SMTP id 5b1f17b1804b1-430ccf1bb2emr31960565e9.10.1728509964030;
        Wed, 09 Oct 2024 14:39:24 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d70b4291sm30519035e9.35.2024.10.09.14.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:39:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org
Cc: stable@vger.kernel.org,
	broonie@kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	vkoul@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: sdm845: add missing soundwire runtime stream alloc
Date: Wed,  9 Oct 2024 22:39:22 +0100
Message-ID: <20241009213922.999355-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the migration of Soundwire runtime stream allocation from
the Qualcomm Soundwire controller to SoC's soundcard drivers the sdm845
soundcard was forgotten.

At this point any playback attempt or audio daemon startup, for instance
on sdm845-db845c (Qualcomm RB3 board), will result in stream pointer
NULL dereference:

 Unable to handle kernel NULL pointer dereference at virtual
 address 0000000000000020
 Mem abort info:
   ESR = 0x0000000096000004
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x04: level 0 translation fault
 Data abort info:
   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
 user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101ecf000
 [0000000000000020] pgd=0000000000000000, p4d=0000000000000000
 Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
 Modules linked in: ...
 CPU: 5 UID: 0 PID: 1198 Comm: aplay
 Not tainted 6.12.0-rc2-qcomlt-arm64-00059-g9d78f315a362-dirty #18
 Hardware name: Thundercomm Dragonboard 845c (DT)
 pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : sdw_stream_add_slave+0x44/0x380 [soundwire_bus]
 lr : sdw_stream_add_slave+0x44/0x380 [soundwire_bus]
 sp : ffff80008a2035c0
 x29: ffff80008a2035c0 x28: ffff80008a203978 x27: 0000000000000000
 x26: 00000000000000c0 x25: 0000000000000000 x24: ffff1676025f4800
 x23: ffff167600ff1cb8 x22: ffff167600ff1c98 x21: 0000000000000003
 x20: ffff167607316000 x19: ffff167604e64e80 x18: 0000000000000000
 x17: 0000000000000000 x16: ffffcec265074160 x15: 0000000000000000
 x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
 x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
 x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffff167600ff1cec
 x5 : ffffcec22cfa2010 x4 : 0000000000000000 x3 : 0000000000000003
 x2 : ffff167613f836c0 x1 : 0000000000000000 x0 : ffff16761feb60b8
 Call trace:
  sdw_stream_add_slave+0x44/0x380 [soundwire_bus]
  wsa881x_hw_params+0x68/0x80 [snd_soc_wsa881x]
  snd_soc_dai_hw_params+0x3c/0xa4
  __soc_pcm_hw_params+0x230/0x660
  dpcm_be_dai_hw_params+0x1d0/0x3f8
  dpcm_fe_dai_hw_params+0x98/0x268
  snd_pcm_hw_params+0x124/0x460
  snd_pcm_common_ioctl+0x998/0x16e8
  snd_pcm_ioctl+0x34/0x58
  __arm64_sys_ioctl+0xac/0xf8
  invoke_syscall+0x48/0x104
  el0_svc_common.constprop.0+0x40/0xe0
  do_el0_svc+0x1c/0x28
  el0_svc+0x34/0xe0
  el0t_64_sync_handler+0x120/0x12c
  el0t_64_sync+0x190/0x194
 Code: aa0403fb f9418400 9100e000 9400102f (f8420f22)
 ---[ end trace 0000000000000000 ]---

0000000000006108 <sdw_stream_add_slave>:
    6108:       d503233f        paciasp
    610c:       a9b97bfd        stp     x29, x30, [sp, #-112]!
    6110:       910003fd        mov     x29, sp
    6114:       a90153f3        stp     x19, x20, [sp, #16]
    6118:       a9025bf5        stp     x21, x22, [sp, #32]
    611c:       aa0103f6        mov     x22, x1
    6120:       2a0303f5        mov     w21, w3
    6124:       a90363f7        stp     x23, x24, [sp, #48]
    6128:       aa0003f8        mov     x24, x0
    612c:       aa0203f7        mov     x23, x2
    6130:       a9046bf9        stp     x25, x26, [sp, #64]
    6134:       aa0403f9        mov     x25, x4        <-- x4 copied to x25
    6138:       a90573fb        stp     x27, x28, [sp, #80]
    613c:       aa0403fb        mov     x27, x4
    6140:       f9418400        ldr     x0, [x0, #776]
    6144:       9100e000        add     x0, x0, #0x38
    6148:       94000000        bl      0 <mutex_lock>
    614c:       f8420f22        ldr     x2, [x25, #32]!  <-- offset 0x44
    ^^^
This is 0x6108 + offset 0x44 from the beginning of sdw_stream_add_slave()
where data abort happens.
wsa881x_hw_params() is called with stream = NULL and passes it further
in register x4 (5th argument) to sdw_stream_add_slave() without any checks.
Value from x4 is copied to x25 and finally it aborts on trying to load
a value from address in x25 plus offset 32 (in dec) which corresponds
to master_list member in struct sdw_stream_runtime:

struct sdw_stream_runtime {
        const char  *              name;	/*     0     8 */
        struct sdw_stream_params   params;	/*     8    12 */
        enum sdw_stream_state      state;	/*    20     4 */
        enum sdw_stream_type       type;	/*    24     4 */
        /* XXX 4 bytes hole, try to pack */
 here-> struct list_head           master_list;	/*    32    16 */
        int                        m_rt_count;	/*    48     4 */
        /* size: 56, cachelines: 1, members: 6 */
        /* sum members: 48, holes: 1, sum holes: 4 */
        /* padding: 4 */
        /* last cacheline: 56 bytes */

Fix this by adding required calls to qcom_snd_sdw_startup() and
sdw_release_stream() to startup and shutdown routines which restores
the previous correct behaviour when ->set_stream() method is called to
set a valid stream runtime pointer on playback startup.

Reproduced and then fix was tested on db845c RB3 board.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: stable@vger.kernel.org
Fixes: 15c7fab0e047 ("ASoC: qcom: Move Soundwire runtime stream alloc to soundcards")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sdm845.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 75701546b6ea..a479d7e5b7fb 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -15,6 +15,7 @@
 #include <uapi/linux/input-event-codes.h>
 #include "common.h"
 #include "qdsp6/q6afe.h"
+#include "sdw.h"
 #include "../codecs/rt5663.h"
 
 #define DRIVER_NAME	"sdm845"
@@ -416,7 +417,7 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
 		break;
 	}
-	return 0;
+	return qcom_snd_sdw_startup(substream);
 }
 
 static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
@@ -425,6 +426,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX:
@@ -463,6 +465,9 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
 		break;
 	}
+
+	data->sruntime[cpu_dai->id] = NULL;
+	sdw_release_stream(sruntime);
 }
 
 static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
-- 
2.45.2


