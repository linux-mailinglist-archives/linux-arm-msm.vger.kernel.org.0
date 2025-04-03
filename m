Return-Path: <linux-arm-msm+bounces-53097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3C4A7A308
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 14:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2640A3AF5F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 12:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691D924CEFC;
	Thu,  3 Apr 2025 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZoPO2Ax9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E1E1E3DFD
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684181; cv=none; b=qBCu8nF5/3yFHMJbylXzWit/H72H4Ge2SBAgNAeFbYflfiEbLGChbo+sBuQf1DfRtwwJWp8rEIvLyRQHQPE39X4nn62Y+FlVa5bKc3GW3zbYWridC3k6RVhxmfRcI7CrTFVyENVrfXxrkwQUEeCHGglg6pMyNqh5iusv2bFo19I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684181; c=relaxed/simple;
	bh=urym1JFZ7iAPHT1OJuqUVs8u2iGfG/8qiqb58+toJQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kdmdaddy3nAMYl5tzJIUMFqDld2nlfmQ8bBn1d6Vmb26LuorWD4m2W8h6eZjZZg341HyyEV3wtV1Tw1ySmZbOJ9l3ejRPyvlkx9yz5i7brcZxgl2CdvnhQqu9XxONKnsNnjvQrRQ/m4sxsKT2K71QAuOtEylkjDgvbYafr+2Quw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZoPO2Ax9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394a823036so8005055e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743684178; x=1744288978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YzB7kb5NWj/5ZVCGMWPj1RqYUOc5X04PDDVhW6vi2Rc=;
        b=ZoPO2Ax9a14/0l9+jQdlccZBa3n9SctcVSU6jQLWn6/GLeYASkHVLcLSQwnfkIKxMn
         KV7PWh7T/HEB866pT1lMjEcYbG6t10ts3RisRqeFK7rhocpu4QXHEXC1VmnZYUu9CJlc
         7eVpu9XnmoFAS01YHAdHe3dtVorRDq1TIeFDQr+hB08RktS61fWjghzTKCIC3KL7Fvoz
         /DnvV8ggWlXE4MXJ6Kb0616jJ6jXcyqlcA0vDUq0Vgs4OYMLcOPujOcN9mMRCtMeugAr
         obR/GLp6FEnyxL/EkmP2qxCKctwsjx2DrRDEwu0HT6hIj3gxQ/p5RYdQ4pGllukke/VG
         azHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684178; x=1744288978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzB7kb5NWj/5ZVCGMWPj1RqYUOc5X04PDDVhW6vi2Rc=;
        b=fObOHqkpUgK3OJ6ubkVRk63RHUlMua5RSvjlu6qAGM6WhASlr31Pl1DhaTYm8Mlw2l
         hGAj1F9qWr2PRBzZLh7WsElq4d7GdQD6Dv//rA6dZxCj6l/UqxlAHl9cEYlZ/yz3cLfb
         E27Krt0jIzIUUZ2QTeYlKq0iPrmusP9W2UAZS2AoYbsTgaGnKlC8Nx3q0/y5PWUpYCh2
         Ki9q1JdjCldwStrGekkffpnHOU6a6nZp4m2GB5SeRYq2aXj1s9vz9NPkDj+2puWNWDdn
         +Yd2Uewczoglm5l34UcXAqQQBVSrmUP5tSIOQY0LzLLTb2x4SP6Uvu903SBl+7Kv780s
         sXsg==
X-Forwarded-Encrypted: i=1; AJvYcCVuFd6wU2dwC3WwlToW+yFSk/s7n5SxqI1V8W5VoyeLttllxRFnuS+X9FAaHfSQM5VC2CHWrJvcy66H+rWK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/OCytfPYMlFv5i9Mt3wsrWRg6TpYxv+kyxqByuMFCupL11vI
	5NFoW7/idUTuS5DmYwaKmSl7PyuDa3OUswfDD/GJ2iTXtDr5I0LFd5lcUCApOiU=
X-Gm-Gg: ASbGncsK59cuM8L9NJwBdCnOhrVaXA90urhp6uKJHai3dHIS3yZE6M+SMPYyYkEQkj0
	3tP73PWPgisFBmR1brbIODNe7BUrWTmbZRD2Awm1zbl0qjByVEZNRuqEk9ZkznNtIFe1GYjfACv
	jApw8gMPmX8s3NXx44/R85pZ+NkC+rHW8lIS6Q84iyHJHAdcm1uK4yYsLW6l4YsTr7NGQ4pKLfB
	nK9UuRZ82p7OST4N/dXoXuSJiXnBhHCSpBT8bB7NW3L0yvwbPaaodgGCfw+7CraBLZaTrg1xmwm
	/bqpwWc/6NhYudbCv0tpdwoB5K9SqUpLy+d0MUMIpJA4rBiFrRs2o2IlN9QlRvxFf9oWKA==
X-Google-Smtp-Source: AGHT+IEOhbCyRIy/amHn54GYprGgtCI+ApabyTh3ms9DkRPaodKNkM4sNUXh4kEaUnWGJsU5K4+dKw==
X-Received: by 2002:a05:600c:b8f:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43eb5c2102bmr68490445e9.14.1743684177811;
        Thu, 03 Apr 2025 05:42:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm17312505e9.9.2025.04.03.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:42:57 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/2] ASoC: codecs: lpass-wsa: fix VI capture setup.
Date: Thu,  3 Apr 2025 13:42:45 +0100
Message-Id: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This two patches fixes below two issues with the VI setup.

1. Only one channel gets enabled on VI feedback patch instead of two
channels
2. recording rate is hardcoded to 8K instead dyamically setting it up.

Both of these issues are fixed in these patches.

Changes since v2:
	- updated commit logs to reflect the issue.

iChanges since v1:
	- add missing break statement.

Srinivas Kandagatla (2):
  ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
  ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels

 sound/soc/codecs/lpass-wsa-macro.c | 103 ++++++++++++++++++++++-------
 1 file changed, 80 insertions(+), 23 deletions(-)

-- 
2.39.5


