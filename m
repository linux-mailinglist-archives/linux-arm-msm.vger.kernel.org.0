Return-Path: <linux-arm-msm+bounces-51417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D6A613AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7669219C4AF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64FF201032;
	Fri, 14 Mar 2025 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X+CyNF3q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0891A200BAA
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 14:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962805; cv=none; b=dQint0hl26pI+WWJkY/A8mqIuZ4BYAhQlAK+GYC7oHiySpUzSlSU9dAbucHpMbA6XV02lFIkr60Tcz1NnzGo0tRgjr37+cxkx6op0IHD60Cq95kyDlFkX5qJ3bEx/2ufmOPr4/U1K3UO+D2JFTX04D/0TA/UsDcr0d47stSQ/7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962805; c=relaxed/simple;
	bh=fV6t0EBtW1B2j37NCyDxPKTtjpES7eWc33aab4NlE1k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ChIzDKdlR/HJtBhThxyvnTre92wGp7gbcACZqekIVoPxKSEBalLz5/nu/F1Un848HITuGyOUVQLCHCXRi0NQZsM8JKVk3hFoFcMjrontJ+QU0HNCuwbyy9lRY1NtC9ktfHldeNue5fk5rxpXMBu+JAerZWB0kngUxg3AcrWiMkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X+CyNF3q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913fdd0120so1222507f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 07:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741962802; x=1742567602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gqYv2Yv6I6A8Xg36oF3GXiMSJjKsROFpNr6KE/A4Xs=;
        b=X+CyNF3qP27Q158oafvSnmQ0W2xP9ONV6CZtSSzbZafSESo1PKPWa4jS+P7lR8Fbe1
         /3JPTJzjcItdw6sTKO4Et5U/MADrZ0yBJtZWiA7olrX9Zxa0jd79qArHSJFqHS/6YVvT
         KAdFqz/5XwbH9rXCeZIHf/DyIt9YV2cDK/qUgkZ3y4OlF0WIzFWpiACPadmjhub3H8pG
         l3sxq3BQbMc3IUwF28lbzuNvUmZs2BGEwcgH8V4H0HNp7MwbYAlbw4SHQ72Og26dzDU3
         7Se07p7KFE9ltQpqIhijO4VvtKHfSKOGnmjKqnVm2N4wCBd5xRGoePw0sQe/N3ywBl11
         A9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741962802; x=1742567602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gqYv2Yv6I6A8Xg36oF3GXiMSJjKsROFpNr6KE/A4Xs=;
        b=d2omd/7tMnXY/38z4WLPwd/7TtD8i61z3do8BQ/WSfbjLzvG7yZ9lXARiHyCI5tg8I
         at0D2+DMGqEwO+WhJKkzNR0csQEnsMSLfvnLXOjxJwM/e1/asP+4JL6IZWnH8oqlnTwb
         evPVIfJGCuToZmPENb/SDory9FIea694TEaBbndnT3X77TZ4px7bsN85e4CF8KxGkgwz
         wiY4H7FJfmauN4ap3VhXc6VrPYwVl6ccCrfwCUFlFSYOfcuxj+xNfavS+Td1wP6vBJtX
         5RQeOXbyVDlozFi9hx9s1tosI4dp709Di8YH5DpZ47w8hZ1xTG+rfjkn0ximqffUbaLa
         DjhA==
X-Forwarded-Encrypted: i=1; AJvYcCWeZ+/2VTU1BXjC6IjbANY07fPDithLg2Qjt5oGFDtHpD/bzFwxE//sh8YMlLqE28KCbYltfxVBMJxUdjFO@vger.kernel.org
X-Gm-Message-State: AOJu0YzNttQikliRHj8WQsjAEsafDtdNzKw76WKAKiEsNzHtoIPwaxZ7
	HlV6nr6G1rUUE3EIP4RrnRLktfoPjJpiCl11Y+l3MHMHPstNernnFRX1TobrRNs=
X-Gm-Gg: ASbGncsELOGanUG1Frb18l77XECmkj/+pky6ioMw2L0+Exz4OPYGTvcBoI4AKJZiXte
	TmlhMfo2XTDewyoPvUVtubfFx+g6+7kQXhv3DEQpC0KctvS7brnOo1njV8kYHXOWPnMAdwy41+v
	Hx11cL9OIueN+PqG7Of6X0rR371j2dZTptzawZo4ipSDto1xxqZcFEIVsPs/nxdPkwws52rwfVD
	kN7HBiFYH9O56R+dxxWo94ilD35o3v+3gJgl5W9Pr7rwdU4Pprl59ENv2dXBDFMRi2/4jdB81wB
	OMMR8VuQVzpzBkVAfhWAtNyRSDcE6HnceGTADqqi0OweXieF+s3M9NXWvdTT78r3VlLJhQ==
X-Google-Smtp-Source: AGHT+IFo3GTKnNz6sDnWrSOXevuP49Y8TVcCWPh2ADI6rNCwCYfYVfD/saldxqETFwjSljt8qsUnFQ==
X-Received: by 2002:a5d:6da7:0:b0:391:487f:27e4 with SMTP id ffacd0b85a97d-3971ded0dd2mr3465432f8f.27.1741962802213;
        Fri, 14 Mar 2025 07:33:22 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm5699168f8f.25.2025.03.14.07.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:33:21 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 0/5] ASoC: q6apm: fix under runs and fragment sizes
Date: Fri, 14 Mar 2025 14:32:15 +0000
Message-Id: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Qualcomm Audioreach setup, some of the audio artifacts are seen in
both recording and playback. These patches fix issues by
1. Adjusting the fragment size that dsp can service.
2. schedule available playback buffers in time for dsp to not hit under runs 
3. remove some of the manual calculations done to get hardware pointer.

With these patches, am able to see significant Audio quality improvements.
I have few more patches to optimize the dsp drivers, but for now am
keeping this series simple to address the underruns and overruns issues
noticed in pipewire setup.

Any testing would be appreciated.

Please note that on pipewire min-latency has to be set to 512 which
reflects the DSP latency requirements of 10ms. You might see audio
artifacts like glitches if you try to play audio below 256 latency.

thanks,
Srini

Changes since v3:
	- updated period size aligment patch with 10ms period size
	  contstriants.

Changes since v2:
	- dropped patch which is causing regression with pluseaudio.
	- setup period sizes only for capture path
	- fix underruns/overruns in dsp pipelines.
	- add fixes tag
	- add patch to fix buffer alignment

Changes since v1:
	- added new patches to fix the fragment size, pointer
	  calculations
	- updated to schedule only available buffers.


Srinivas Kandagatla (5):
  ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
  ASoC: q6apm: add q6apm_get_hw_pointer helper
  ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
  ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
  ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.

 sound/soc/qcom/qdsp6/q6apm-dai.c | 61 +++++++++++++++++---------------
 sound/soc/qcom/qdsp6/q6apm.c     | 18 +++++++++-
 sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
 3 files changed, 52 insertions(+), 30 deletions(-)

-- 
2.39.2


