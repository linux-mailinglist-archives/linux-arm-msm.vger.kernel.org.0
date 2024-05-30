Return-Path: <linux-arm-msm+bounces-21157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAC48D5568
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 523FD1F25266
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49CA13B290;
	Thu, 30 May 2024 22:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="euV1sczQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6217406C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717108259; cv=none; b=EB7x4WM9hsAPe4ehjfPQ+Yz++YWNNEnJjOq1MvDOgbqkywh2m5VvyyEVkthQsDTPU0hBfBp9PiWpPOErfbuNgwj4XkJyn99u+dyAqvNAxuAI5zS6HyspGRZNu+rWNl3tlC6r9V/t2f93aGb/gk1ugg97WABc+ShgoKlba+LBxNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717108259; c=relaxed/simple;
	bh=Vmc9pn0t8SHEFwwZusIt/Z5iY8NxjVNNbXrLDLzxEMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I7oXaQGm9hkbVEt4vZl18Rhe1fq/iHQHD9pIXPeoM4+6N+ele9VNo+xUJHioXYtGWN3lc9FjyvxEm87Xx5q9zlmNJAI0LHAG1SlaegQb5QNJIsSceOaeU7fiSr4IWOdIErYB68UG9K5nAOueKvA/Mxr5ZopmYGMh8jFl9mRaLvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=euV1sczQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52b86cfcbcaso447507e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717108256; x=1717713056; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMW/bINKVwWreJG5Uda77hVx5iRhNpQJXY1J+m7Ti0E=;
        b=euV1sczQpJ/Kw278PvC6hpGwp2qdscSzLXXQRIL/PsvwFAwOFCBhYa8Dx3k+/+U42Z
         pHQRHY4b0ZP+hh6lGHIHcxHYNXjHPpa8JVlPvsNG0Fjt3YX6qkV78UxwrYVAHnBXH1lH
         JjHp97pBtUvAZGVgCofEORD2vvqatgqtXFeI/5dLvNXddFQLyFUsWGz0nx69ipxJUuIp
         DGo8sLOkjpqiEH5VxXbMs5zDJmiLoNLLzfwoy8V8c+ypmZL6QHxVFVD+p/jQwwyOCARj
         f+hZOpmHpO5dDRyGXNdtecpbZbXYjuuq6LsyZsmhx5X25xtexlM9URemMrMXX6li8Tij
         f/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717108256; x=1717713056;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMW/bINKVwWreJG5Uda77hVx5iRhNpQJXY1J+m7Ti0E=;
        b=BoJssdU7uLNDcRdhlB1CE+WPoz6YN9DqjvinRe0cI1S3eJB42t4+bcADEGjz4GZiSN
         Wpv5r+MNxAMWwxoxGVHwWB92novvDb+QEiGsEs/OaS2GXbP0T4kI4qRhXQA0daE6Jcxk
         i1Hw7MMEQLfreTxsfy73/3H+MrCUgp5m1SuN0WecxtO538z2+S57h2hmv9t8UPRsZryq
         v1NTu3fscAynCJeiQjlZrnHgiUfA5onACrjMOurptPQTYZEWOwgM/y+Y4xwoOZec+ces
         loD0vMBeyfd0zqUnsfOqYNkNnpFqs1JrMjozn75j9lPY0Df9dH4c2oC+JKsIwUXIXcoh
         MHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbYGdmhODagh1f+7uPTM7qVORQGfGTw3Xe0cKRE6CprppIe0qRY/i5jYSEUOlgMEoy6BieRwx7XmoAxWDJif6LLqWji0TFqlMJDy3gcQ==
X-Gm-Message-State: AOJu0YyL+en1H5BFTvnBZBuSiazf5EUh00b9OTfVWdAFqbC4Cw1OrvlH
	oksSVyRyJFQ0PP0x1z7J+s9+EdDcLVvhOcBjIIUT2/6JVA08WLTezbFehUCG3r4=
X-Google-Smtp-Source: AGHT+IEoN2o4Y46zxy4lS2UJh/JfIw1oILePCDHn/50LSD5Q9DvV6GbL0jWEDOCKY16zfYeOfeZuQw==
X-Received: by 2002:ac2:5f87:0:b0:51f:4d57:6812 with SMTP id 2adb3069b0e04-52b8954e90amr19914e87.19.1717108255905;
        Thu, 30 May 2024 15:30:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d7ff1csm110917e87.209.2024.05.30.15.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:30:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 01:30:54 +0300
Subject: [PATCH] MAINTAINERS: copy linux-arm-msm for sound/qcom changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-asoc-qcom-cc-lamsm-v1-1-f026ad618496@linaro.org>
X-B4-Tracking: v=1; b=H4sIAB3+WGYC/x3MQQqEMAxA0atI1gZaHaF6FXFR0zgTsFYbEEG8u
 2WWb/H/DcpZWGGobsh8ikraCmxdAf389mWUUAyNaT6may16TYQHpYhEuPqoEWd2hm2/OAoOSrh
 nXuT6T8fpeV5KY2Q1ZAAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Vmc9pn0t8SHEFwwZusIt/Z5iY8NxjVNNbXrLDLzxEMc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWP4ez9KNp14N2H14dXAiyVl9QQoE8Qi0T5OPg
 gRwxOIB0v6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlj+HgAKCRCLPIo+Aiko
 1QR5B/9/j6tbi+R4HIX72dF5SfTYv399dMI0W+bS2+ea8GoJJ3MGdLgS40aoOfInh06qyy+lHU4
 N3y0OoAaSBhkpfDuHzrN3yAEzm83/TyK11il5FjTsNyrQyJtJjmoxqNHEndfOiXTiyNs+TLff5t
 tSg2wGb2wXsB5MakpyTfsSDt8IvoRScapqx/N7HyV3Qgl8gxVr7IZHc4oWY95t8NZAIJob1vw7h
 URGIF1+dqV0gN5z4qqQrgChhI1xPH/WGlPw0ZKS2x3G5QGcpzPFVoI/bmqY29+cmxX/RE1eGISq
 CU/yY0DG9j7gG7T+LRBVPcVFExOk+ZkJlx3LHppZ9JVwliR2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Not having linux-arm-msm@ in cc for audio-related changes for Qualcomm
platforms means that interested parties can easily miss the patches. Add
corresponding L: entry so that linux-arm-msm ML gets CC'ed for audio
patches too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 523d84b2d613..b9bdd1f08005 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18227,6 +18227,7 @@ QCOM AUDIO (ASoC) DRIVERS
 M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linux-arm-msm@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr*
 F:	Documentation/devicetree/bindings/sound/qcom,*

---
base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
change-id: 20240531-asoc-qcom-cc-lamsm-be80e19f8cd8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


