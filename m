Return-Path: <linux-arm-msm+bounces-51453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5805A61880
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 053F5460090
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946592040A6;
	Fri, 14 Mar 2025 17:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xx9xDPw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BACA130AC8
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974515; cv=none; b=uRpmad0/cEoSyJvSqNTxQp5tvASUPOiUcHwcb644IjOLgg5s9MukJ3dY5NsbMpmS2WOwTs2VGaV59g9gw8c8JSZgNwRnjl0YzhsoEcllkpD+8R+U7KzwW0qOWjovckXipE7pWEPanlz/CifnJ8w2i6pzk8wRayzdz5G5l7tPQbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974515; c=relaxed/simple;
	bh=IzDAV+gYsb3R0IxhRne4fUzRoURlhC9ZqkgzyiKPOxM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e1WLvSiqMbS8kBmk7OwZbYzumn3j5R+qh9wKlWabPOCoq750/xBrsixbLzzQ6VcA0wyqiGpoqCXwZSPHGZfIdpbmiZoVreDCdXJJYPfCxFnX6iXqMD4HOIziVyQONBDPbRg0L0So6w5GoYKvTlgn8DtMj1uDC+bXWSi9SAEbpg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xx9xDPw7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39149bccb69so2143851f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 10:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974512; x=1742579312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVmcC1q9onxkQ8qIPslGo0PmndpeWfhIGHdL4vH7f4Q=;
        b=Xx9xDPw7WDyjbUVQC3nLmAlFTw7+sfEfXixX+CnjGl1SuJHfK6zhSHJrbkQRiz2j7j
         kUFL+n9K0RXdVsRNys3ziRPE1r3Kcy5AXlP/Z+PYWZ0TD/za/SWTmoCfsxpEMgQmkgjm
         eFpCWWqRbdX1MkIfz1cqB/iDm6CyLC39LiSBaI3R1CWzptrHqgHymdIF0Fw4bq/w5ZrQ
         vXw4lW8QLZFtasGqeLPrSWrkJafvjIx+VQCjBaSg2Gvl8NqiymlhB/kJP2ZRSWytNSBx
         /CLZMf8cEQ2J03ej8xNsagcFm+DhXH3AEEY5WpEwQHMzrpu1NJrYuovUbRp1bxASiYeF
         lxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974512; x=1742579312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVmcC1q9onxkQ8qIPslGo0PmndpeWfhIGHdL4vH7f4Q=;
        b=GRd2Ytf8bRQC+Usqe2+G9oXSlASK4+Z2d1aH1EL+i967Bc/AeUs907ONxELnOA6afS
         OwC9iKk1xPe0blYFpNXOgAsgHOrMSXczeHrlDzl/YzG4GFsKjYhkdU5KEEIGyqmgRwjM
         iB0RP8rBJy9sCWaXVrBnhadme2yyLJvnFyhAnJg3xBlTaYwylW3KNeN7L20LcvGw7nOH
         u5+6fx4Xc4R0v75yMN1iBqA47R6ppwDQUKb0R8KUgH8Xzg1iF1XOt0O/Aa6KVHbP5Qw2
         eQ4r5GI5Z9vlAjme9NyKBrLyz8EZO3kFuDUSOp2/F/TEqxwt9gNfuN800WzDiMVdFouJ
         iL1g==
X-Forwarded-Encrypted: i=1; AJvYcCXtCIFixWVb2aw9yc4jthvaEjC+ObWlhry5PlQdoBYyYHlnOnYnDmckdrRUY52GTw4JJIqEns23wepw1Wv8@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNrNXQySTgZdrvYEXs09+lFOXaztF8H3lYFTpHGAiRw5iKVL9
	GHuHqZbsrwSnU9hHtdUT1rdXVjcvdngnNFeZMca+VD4IgaU7StreG32zH2TrTAc=
X-Gm-Gg: ASbGncu1vgzRrGmL413SwfSRwLslxmiUbvZKHQhC6+YxXrBXt7z1jo+k4dBnQDavFCz
	0SK7ruH3Y9D07/I3iHcoInytepkNYk9v2C9qVPN+t2GpfhfqsHv4HESaDADE5vU5zJbOlur3FMi
	clL6kAwlr8waj+1Yt9XcUEc1f5x2I2dYHuXVB5s8BVqeGPGp4Ex28w7gFwbPLc4+jCYzlGsfgek
	fh/sf3AsiSBC0Lc98saCI0mA70lrtRRGn3AnsIYKd2epSYidXz+KC7CWoQQowX9UCMrXQZiOGn6
	Gd+Z1YAGX9rx/YfSsi32feW+dVjJVQm+6bNbVDiViyfUqDIbEAqGE4S9wJ7dNF+NpZ47+Q==
X-Google-Smtp-Source: AGHT+IGtBBkrjkuMMQ03zRppDLDBvMmrjEbEft6rrg1dNIsffYzTsNabU1xGBiuZXms8ctgtipDYpg==
X-Received: by 2002:a05:6000:4022:b0:391:30b9:556c with SMTP id ffacd0b85a97d-3971d237e13mr5115917f8f.21.1741974511674;
        Fri, 14 Mar 2025 10:48:31 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm6117243f8f.47.2025.03.14.10.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:48:30 -0700 (PDT)
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
Subject: [PATCH v5 0/5] ASoC: q6apm: fix under runs and fragment sizes
Date: Fri, 14 Mar 2025 17:47:55 +0000
Message-Id: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
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

Change since v4:
	- added tested-by tags, including cc: stable
	- removed a line delete.

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

 sound/soc/qcom/qdsp6/q6apm-dai.c | 60 +++++++++++++++++---------------
 sound/soc/qcom/qdsp6/q6apm.c     | 18 +++++++++-
 sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
 3 files changed, 52 insertions(+), 29 deletions(-)

-- 
2.39.5


