Return-Path: <linux-arm-msm+bounces-31468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF5E974DF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC07E1F259C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 09:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B4F183CC3;
	Wed, 11 Sep 2024 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c4UMVTIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9311183CA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726045636; cv=none; b=OHiG+DHclCPP+tiJd6bYLG0JCraS9EuxZYcFkUv2Emggzc4AyfE3+VMm6RoJJyhMXjYay/sKjUu5e2pX/PKkoEV8TPf21Fe8SQ3UMVHhynm/xM179OfZ+6E8QgH4VSIp5dz8FcYr4h+9Nys/74TGy46rqtkFcejrHAk8AVhmTO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726045636; c=relaxed/simple;
	bh=R6yW4YG4S3q4OJYcPBRVoJ8e7yojYNz0eg+ErHZJRC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q3TSwl5UezboDcsM9ARx4FyN4Ts2vBLhmL6KRJIaRVWd000B0b/YMCBmh0j7sNU1Tg0RGLnKztoAAEF/wk4Gnon07SIT0Fa28dpJkkx8XOnSQmAsi8rYYL1gBloy2urldXIMCRiXgCG6fT7dabBsGFw0C/y5vKbedccbTXiIdls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c4UMVTIK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374c5bab490so388324f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 02:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726045633; x=1726650433; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fuHe3oR0rUVRewpF2jcmqfhf5y3otrAzlSWC7VenP28=;
        b=c4UMVTIKHGDI7Ob3xP45NbHryFs7oE3ZzazaqVijoWizFVmapL6rY0DG03d2isX7k2
         iNpq7eMgFVpLXyeJ64kOF6kZ0dTfoTpnxt/eItERpLzopRcGTUc5uUYB+zT15zRCBABc
         x3fdrxX3f7HuNYX1mATUkjQpOwbzY42yo4OvgU2EucebV2WISXh04TQKASxGsjtS/72X
         tqHqknJu6wF/BTYYBDXa+tTUngGHYB38YjSvb2aUdEKBBKYgm8QFOTQc+mpqWFCOuwiw
         qn1l7jb2DD55t+JVaAOmmyTS3tZzB20FYC+FZWFiyYrAF/fAnTRgKtt7iUynM9pGqvxL
         UvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726045633; x=1726650433;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuHe3oR0rUVRewpF2jcmqfhf5y3otrAzlSWC7VenP28=;
        b=NSJhKaTTTQSex6/jo2jx4EEp3REfc9ukh8b+/qSMrWjOIEOssvrBTeeXssNoffRQGf
         8sQFvDfzi17jxGiYcpKVFzuWJkyeQr060FDClI7QwKvlscXXaEMYtcQTvNugYHBnyxyz
         y542TWrxBwPCkQ+dLwcYp2JeYQIFAqzlB/c2aajmbAmv9jWzniGVBpX7J2tVVdgk7M7G
         We2sTQUyHeN/ojAoQGAJ8HAgLA6prN75QLeFWQsxCXhNzEyxC2HkPW3cpwywHDbZJlAz
         wlUMRLJ1VrHp2PP6aG+xhs+6u86BcehtZx2l1VIm2kn4E2/oMpArXnlEvJ42ZrKcRQL6
         Sgwg==
X-Gm-Message-State: AOJu0YxTDT2GlG4IHi0H6yP6LpF2wEFsTm/m2+h5P1WlbLZMDd77XxSv
	xKtFPvqZLcqUn61X8Y/JE9U/2gd5tjy5VOc1qJUfFBUDSjUcY6sfoRs1d56AcSw=
X-Google-Smtp-Source: AGHT+IFo3nZoyglrUhHP5B/FuNucZTRJAzUFbDxrsYwdM2YrVLpuTW6C7iC19WoncuRUHg8J8BiCVg==
X-Received: by 2002:adf:e448:0:b0:374:c878:21f7 with SMTP id ffacd0b85a97d-378a8a11f62mr3379279f8f.10.1726045632321;
        Wed, 11 Sep 2024 02:07:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5389:6cf0:60c4:3842])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895649b88sm11029201f8f.6.2024.09.11.02.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 02:07:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] firmware: qcom: scm: fix SMC calls on ARM32
Date: Wed, 11 Sep 2024 11:07:02 +0200
Message-Id: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZd4WYC/3XMQQ6CMBCF4auQWTumNEioK+9BWNS2wiSlJVMkK
 undrexd/i953w7JMbkE12oHdhsliqGEPFVgJh1Gh2RLgxSyEUooXD+zmzE8vcdlZZRaWWtV1ym
 toZwWdg96HWA/lJ4orZHfh7/Vv/UvtdUoULUX2ZpG1ndtbp6C5niOPMKQc/4CwzFUM60AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=R6yW4YG4S3q4OJYcPBRVoJ8e7yojYNz0eg+ErHZJRC0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm4V25OyTpUg4qkhRCNpLn9JC7f1tabUg+CLBYp
 AJ6Jwsp3iKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZuFduQAKCRARpy6gFHHX
 cpUGD/wMK6Ye3KuuWkDSFK6GTJf+SwM1cIRBfYNBSjqfECtIQnhg17Ccc30OWpDR0qyhljpGGxH
 XeWdGQzIkkarl8rcjrW9Hokp5PxBvHTS+dmyqY5a1JuJ8dhmOgkwoaSodovlg7jsl05Ka5HQNjE
 VN0t4Df6J8hRf5gv2Kvpnjf81qpACoAvrtq+I3JZpohZFSrM4n8E2+LRaVp47Wcmmv1cKAwOyt5
 6xH/O0wcWXiaaogHRI/ouqsMD+fxmJyKn/Q91JCFbN8trNi2a+ktU3fcSVOlIA1upAb2zSmGQeU
 QpG95zRLXOtMEyjUozoPbAFCI+8xxmpgAU0OBoZxRs1EyAE4gPGkzg/JMWZMJ5Q0kshoD8HetGu
 777jIxRrvDPRWLoN7I8urtEft+9o38XjhtCXehSqPyRgaPTxYw0yxht0zHunjXOzihZcWppSIe7
 mUVyfCpeCFYBRihOnkdnPWQcu+EezI2WYKlCzVdSvijbABtMSRKyHl5EyfSYUQ+PDn+6hji9S8y
 nM9BerG7h6PoJkeJMr+oxNtVPJk7SOc2ngGZcXkNW0k1vW5RM4v6P1AAIL8YsSwrQxsjFPruFkZ
 0Tb7cCBL4Dw/Lx09fqOBDLDQzt0GjNY24DBOwEqCuMNKDAl+Go9c/Rp9IKKEr21kyObUYnzBQiJ
 vGOdGBS+gx8MRVg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The new TZ Mem allocator assumes the SCM driver is always probed which
apparently isn't the case on older platforms. Add a proper workaround.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- use likely() for the more likely branch in smc_args_free()
- Link to v1: https://lore.kernel.org/r/20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org

---
Bartosz Golaszewski (2):
      firmware: qcom: scm: fix a NULL-pointer dereference
      firmware: qcom: scm: fall back to kcalloc() for no SCM device bound

 drivers/firmware/qcom/qcom_scm-smc.c | 28 ++++++++++++++++++++++++----
 drivers/firmware/qcom/qcom_scm.c     |  2 +-
 2 files changed, 25 insertions(+), 5 deletions(-)
---
base-commit: 6708132e80a2ced620bde9b9c36e426183544a23
change-id: 20240909-tzmem-null-ptr-2a9ddd9889aa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


