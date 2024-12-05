Return-Path: <linux-arm-msm+bounces-40426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CB59E4C45
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 03:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A68D016A299
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 02:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00F1126C01;
	Thu,  5 Dec 2024 02:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnEOumgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A31401C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 02:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366030; cv=none; b=IUJ4WhwvW+jNdIYzvdQZ+YdsCHOXWQ6+C8l/fRWELO/KoxaZfM3ZZsvr3Jyb81+T57vyWilkOokzPGdtAi9e5g9aFwcfJkec46ZcBp744w4Mreq1tZOK33bIv3sRNWveIaiqmiNHO16rm5x9FUdOHnwD0LqSKNkdPJtzCrhtsME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366030; c=relaxed/simple;
	bh=jpl9iVOYWeTiM6kCN3P64k/PHIdrq2ziUsX8zdUfXa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sBNtZXEukCtT9J5ApcsQfmZRwS76pWPqMh+1k03/2Jv7EY9/55dJ+jx/zYqVPHOSAb2FMbm2kL9WekQ1LrCNQjxaop7VHNyRKFJNCRBjUxz4JNEv5DmMJ/J+KUeiCo90a+qGaYgojIb9sge9YFeAcFIK0W0KN00h2oEMa4piHOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnEOumgz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e96a285eso223176f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 18:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733366027; x=1733970827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEvSg5n9dPi25fVhvj+TfkDWWQ8DpWSUc0fAXy4y1N8=;
        b=xnEOumgzs87VUtt8xN8gVEOeFcrc5lUREn41aCvYTsk7FU1GHd7feedvLt2NHseiiN
         cik3i880J+9mc38lBEN2RR/KhmB8+hFjsCGCibyXi8JEexZh3H+xuyGvHVcna2cZQBLt
         JmClvzxoAyn9dg1Ja8hbWrtpffdRCUBMos/rOitmhfz84Tn3kQ94Yrf341eXW9dCSueB
         Tm9xiwnceU9zUH7HQq/igN6lqHGGKU/YpED3KR9ezKMUUol9PFq6u4EXbFs43H36857y
         c4pMsdcvjz+oEOeeMpG+DY3FN0ZpUvv9PwtQhF2XMxH3rOFVPnXfExFWW0JF6Hf+LSkb
         VVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733366027; x=1733970827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEvSg5n9dPi25fVhvj+TfkDWWQ8DpWSUc0fAXy4y1N8=;
        b=WTSr+NwVuz6noR1303YPw96vYR0AYHxlyDxnbpW6TbLBX09d360SuR/54UiPyyPuLb
         XVYnSP+DqxZTyU/uKlK2vBt/hz96Ng43iX1r8BMTfDhQjoGU85c24SEaRZDxHzsfZdOa
         ldepG3KJKfGuanoRNhzKu190g3ltgX6jxonT/eHpwgdciTkfB2oh5axrI6EOOj0uU+1e
         9Fa+kWYOwLZyjWCEjlVkDEiQ3fxRnrjrgVZtvOgz98divV+x7KTUyh1I75P2bmTTGW0y
         I7evsZiEizrG5Sg1ipKKcgubdIC89XeNJHA8apNiXuiwYJnm6eH2fp1VR1lFOzHJXV/8
         NQIw==
X-Forwarded-Encrypted: i=1; AJvYcCU1HN2MbpNZoq0Vl3ee3QYBchPsh267WJG7DLyN/wiW/Nyb9I5fUVp8QRqfIizOYBtaqCFPPn8ogwBiy9SY@vger.kernel.org
X-Gm-Message-State: AOJu0YyIarM4KTVNUFOARLZ/0EVxzNEPtTsR9wuX/AN9fEZjxkmhQYtR
	8b5MRuTPltQlSEJijvyc1QSRswWpaQIt0dv6WOEGGsGYxShn1ofP+pIFsblZXjU=
X-Gm-Gg: ASbGncvfho2xcEOa9M2Z6Q7wunJujC8OuZjuqi7pXfIOhIXmk4wnYKYoidI53Br2Qee
	BfvnosIvyt8/58Y7QHKt55jFp+DZ/HJIDQifuNez3An5fV19E8NyUigejIT3JrNZTS07UaDXxQY
	H4RnVDf2Kpg3fb9DiELH3xM9ZtiMJSrt1BFmMa00/kLypuxxt+eDELKCrxmfS8YD8FnQZPs79Jj
	6J60Z1Ezc1R00xuCZXPEjSSADnBh1qkqE4GjPofXfwQFq7OMxba44G3QY8vLtClU4HE
X-Google-Smtp-Source: AGHT+IHh2by/doGLjpPWCzeNRn54791OntfvKje7jWHAMUb5dn6DTgMFuSYzcKySXVmKinBfVAjamw==
X-Received: by 2002:a5d:5f46:0:b0:385:f349:ffe7 with SMTP id ffacd0b85a97d-38607ab5c9bmr5625677f8f.2.1733366026988;
        Wed, 04 Dec 2024 18:33:46 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5273440sm44444325e9.18.2024.12.04.18.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 18:33:46 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] db845c/rb3: add i2s playback support
Date: Thu,  5 Dec 2024 02:33:41 +0000
Message-ID: <20241205023344.2232529-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are i2s signals provided in low-speed connector on such boards
as required by 96boards spec. Looks like it is possible to actually
playback something via these pins after adding missing parts here
and there.

I tested simple widely available cheap DACs like UDA1334 and PCM5102A
and they works just fine without need for mclk. I guess any DAC that
can handle 48 kHz and 16bit will do.

In theory db845 can work without mezzanine board and this provides
one more use-case to playback sound and not all mezzanines have cosy
audio connectors.

After staring at
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210621074152.306362-1-judyhsiao@chromium.org/
I suspect that this might not gonna fly since it requires dummy codec.
Or maybe specific half-dummy qcom codec for such use-case is required to
verify hw parameters. Couldn't say.

Alexey Klimov (3):
  ASoC: qcom: common: set codecless link to be a backend
  ASoC: qcom: sdm845: add handling of secondary MI2S clock
  arm64: dts: qcom: sdm845-db845c: add i2s playback support via LS1
    connector

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 43 +++++++++++++++++++++-
 sound/soc/qcom/common.c                    |  4 ++
 sound/soc/qcom/sdm845.c                    |  5 ++-
 3 files changed, 48 insertions(+), 4 deletions(-)

-- 
2.45.2


