Return-Path: <linux-arm-msm+bounces-78242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5CBF9E41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 05:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 371BC4E2E79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 03:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097272D6E43;
	Wed, 22 Oct 2025 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ci/T0A5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AD82D594A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105535; cv=none; b=W0S8Gzj1xYYU22/+hVj6Ud/EJEBnONxDEfyL3A3YARkeaG12NbVLhqDUGRY7NM9SiDHU2MyuhQ5QJbP6rUZcDyrqRs4kC8Qp6yFDZUim4eQBt6ppV2hYLTwcLjR+Cnj6P6OgK17klqSK7TCJoEPVcpN7Vf100gp4Ks2cByjAUgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105535; c=relaxed/simple;
	bh=VkwRwoyvKaQ5QVA7JKJ0O3zkd+6+dznsjpyKtm6MHtE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UaUtMpd5tANGooyNu39PuR7yoXZZk1FhEy5blqZfqGYoEikZHWJN1bb7bFjUKxbYwi+6X6FwLx0tiCplqYVHxNVl67QI5LHzWDm7U/cMsAR9p4Kc+44E/tnEq9dV9P91fb4raKxJAuc7LobMC7UdgFsxx4qeBWKiF9HGoxrtCxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ci/T0A5V; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee130237a8so4076129f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 20:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761105532; x=1761710332; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2ZSDEAy1hrlTsCtb6+Des1vPZi3/b+xnBthz/KUkPk=;
        b=ci/T0A5Vje/VYkRvOVaHE/DxhSklRucuUpkXLEgbY+grV8AYie+j/4bh+yiZ/yZ7t8
         G/eHYFEml6NAEW+jnMXb9R13mXKKTnI4a5WfW+ZORpvuWgL/gJJctqAcG3hHOjVEOxdr
         PEWPt66pHhMlLhWVgHEuoBdc1XG1YVYBIj4vxSdlsaYPhpKzWK0WRbUE7O84Lcix/EK7
         fa6+vT1TJNNIM/fbDH6h5sU+Y0ANBQ2E2WfnQXs//HYMe+n3K7SvampE+ht32fgal8Xy
         o5tj3sQ+CxeF847pqzDm83686GLwoLeVCLbQGzAkXXFhPQBWsHk9gnwAdamDQJ6Af/q1
         kpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105532; x=1761710332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2ZSDEAy1hrlTsCtb6+Des1vPZi3/b+xnBthz/KUkPk=;
        b=HwdPlkagMhsT3vBf/A4Oo1c30+pxe7FKenVnSE2wC6QtNVL/Yp3mCv10OEYvJ5S7Hn
         /SJiboL4IP/MqfPUNmbWArokeIGixfjI3ce9YIDw9tWGdgyNHJirdchtBEkRxSW2qbO9
         rtqgV1UMcviIx89fB9RIOyILXgG0cU6PXhN+PLD9CKYCtT8JWBYzQF78ezzzOqkP7D8K
         0uXTVcyyYKhdff//vV/qrqykndGX92Nk/LOeQv656xKHPDl58yHQ4iyN+i3W03FxxVVa
         v66Wi9u058yI7Qnzh3mn1njHpk4MNYNqXqnfSqMPsx8xpZZNtyoWDFPA4PsssBzwZmeP
         NV1w==
X-Forwarded-Encrypted: i=1; AJvYcCUlrqGLV+BEq74ZksFBz/3PWj+4En9vnSkOdgG1WHVUC6feoMf/hf22bWXhuJOSCswR+BOcQ9SlTrxu9umq@vger.kernel.org
X-Gm-Message-State: AOJu0YxocK6y4K2Jg9qF4077QDFrpHGSyitVEDMaFlxXkBcllGDk1JyZ
	fni/WZuOrRtlKem+8rBy46XA/JvyNyLpL63CFof10tzwZclnn6ZzejKt7GavrYHHEQw=
X-Gm-Gg: ASbGnctTk82g+YxQSjcvdnTqZFLX//7cP6goFwDvIvwdUdZMdSFbYa0NGOMznxrcPqj
	Cj4iRTsOGyyYqZVBhJNBGHD8PkWiwgOJs2mwLR2t2OpuIGPWZs3FEuIieOlhp/iucRvWcSGBFv6
	/G9z3gCX2YdfQ9Wfqz/pCEye9H/8oSTLBEzUcy7hkRyqD62TTPvN+RQmI2B4Qe+ODeQ2y5p9hju
	CRtI/cVV5+oLCHiYQOeOXWzyPkmu1gMWloGwI4v3XIXgjBSlx45IYP3WrOS8T9RaWP6aLw0Tg8i
	YqSBU9N/75KgrIFQ+90wUigCEg0iqJXZJUs0VzhN8Wlsd0J6QG6bjP+0+I9g56ylSJMOKBs5fAt
	Qqs6FNmLeACNhoQLSZ5AVRknjMruvaSxwQLNiWuhokKaoNgW05Pd1ymPFiFNJrSjB9QzVElduFb
	9K1bwmHg==
X-Google-Smtp-Source: AGHT+IGUG+W0wf+mP42MvzRZOU9r8TQGApLm+D0SYiWzeMUaEK7m1AadbWpswXMeOq5qzD8NLou4HA==
X-Received: by 2002:a05:6000:612:b0:411:f07a:67fb with SMTP id ffacd0b85a97d-42704e0ed95mr12103418f8f.55.1761105532102;
        Tue, 21 Oct 2025 20:58:52 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm23637639f8f.28.2025.10.21.20.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:58:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Sndcard compatible for qrb2210/qcm2290
Date: Wed, 22 Oct 2025 04:58:48 +0100
Message-Id: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhW+GgC/4WNQQ6CMBBFr0Jm7Zh2LEFceQ/DYmgLNNFWpoZoC
 He3cgGX7//891fIXoLPcKlWEL+EHFIsQIcK7MRx9BhcYSBFtVaqwVl6Iq1wtg+iVmGOzrI4dFw
 bMjWzPw1Q1k/xQ3jv5ltXeAr5leSzHy36l/53LhoVnql0RveWm/Z6D5ElHZOM0G3b9gUW/Strv
 wAAAA==
X-Change-ID: 20251007-qrb2210-qcm2290-sndcard-da54245aae3f
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.14.2

This is a small patch series that serves as a preparation for
adding HDMI audio playback support on QRB2210 RB1 board.
The patches here are for sound subsystem. The other series
will focus on qcom DT files.

The original series where one of the patches here were taken from is
https://lore.kernel.org/linux-sound/20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org/
and sndcard compable patch was added as new one.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- rewrote commit description and subjects/titles where applicable;
- switched to SoC-level compatible for qrb2210 sndcard, therefore adjusted
  DT schema changes;
- Link to v1: https://lore.kernel.org/r/20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org

---
Alexey Klimov (2):
      ASoC: dt-bindings: qcom,sm8250: add QRB2210 soundcard
      ASoC: qcom: sm8250: add qrb2210-sndcard compatible string

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 sound/soc/qcom/sm8250.c                                  | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20251007-qrb2210-qcm2290-sndcard-da54245aae3f

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


