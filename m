Return-Path: <linux-arm-msm+bounces-17881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF88AA43B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 22:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D40361C22122
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 20:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF14F19068F;
	Thu, 18 Apr 2024 20:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dU7FHAXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908DB16C69F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 20:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713473258; cv=none; b=r5pnB4PskfkFPPZEKMwqzk39ItQgi8SOQHBif68WieBKGs2ZRCFoAhg+9ifnndXHSPpQUSngTmhz1H9oeEAX9ZQQQMq12gzcyYplCYirgljdCW0vz4FsmunggszRs7nZ12OEFN6k0Z38o98ooLwD59qQ/qgRbhzbVdSfyaZA+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713473258; c=relaxed/simple;
	bh=eCAy2VzoQXirIWoHOWI7tU2DYxh8NcxGLr5VGh+V2JE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RdVNiAFmf2hgbCP7qzusPCdha6fz1tJzW20D27/mCjOdX6MRrmsSO1FNKaLoaOfYa8sC2Vmi4IxsKlKkvad2evnpdY6HIItLq9JP6ncd8u2+4lwTLdeLZ9iU89Nkh6soCDTN5Z/S+4NZcAjZG+QARojpg4vKavp0sd4ZGZlgc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dU7FHAXm; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7d6230233f9so36980439f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 13:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713473256; x=1714078056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=52Z7ajLFl+Lp6hpQ+qIhOmgAmJ2GpzNTauSk+OYPNpY=;
        b=dU7FHAXmMvmPKpLAeNjZFTwOeY1q9sOd4XGTO0gaIqOSpBPGC0vmLaabTlTfeSw7jv
         dsyVtVQbuEO4jioGms9RHH7EKX5Y16amH4b4gpAwHj2dfDISSoyt/qIuVywkfRWa7ZUL
         2pLp342l6/louXr68w8uQw7GZsM6lILu81xPXptE7EDgNxnvTVZlYb2bgvLv7DjtNBlE
         6x3ruf5EPwIhbLKuQEMyLQxP1eQu7DZEGP41rDI21BGfwj4A2xW4G1rC44+3B3MePwzf
         3dD35+lGlJtPhJdrKgWaoR5LMWqNYqFq4iGGpG7/Jx20bGmV0dbpom6s3XHOL/7isgH1
         fmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713473256; x=1714078056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52Z7ajLFl+Lp6hpQ+qIhOmgAmJ2GpzNTauSk+OYPNpY=;
        b=kF+PA6uP3NxzfmhyeBEOIF7iX7pVbGkbTrJpeMPIMYb7KHkx0Lmw39QWwW+XBFga8G
         tKIgwPaMGnftoBCdY2w40ThUmi7yCHarCki/QxoKmwcATqnDuVCT+gOvgpQ8N6tjH6fd
         5B0Crgx/2fhKP9hjDKkvObHsIAyPve80fmRjNNniFWIVbmb4o2qXXS2YhNiLVmUClGlA
         SHZxYIN+pRN0YNlTbKC4KY7W7/Db7rj5iAMOs6w5jCIHQ28rS4v/f0UA9HI9TkpgF1uH
         LD7H0oE6w+tbdfu/t5jPGVkM6AT8lOZiGHJED70yq2G6xoYEI7RgO121i9ThLyUUPL0s
         rcKg==
X-Forwarded-Encrypted: i=1; AJvYcCVHnjUgDhEo76jD6z8fxf9grwOlAb6m/88/H44UGQfI6a5z0YcW8q4UwZTymwIQpOmVcrfNU7R7NLA7DAtGMcrnvT16tRNyGoS/4DvrOw==
X-Gm-Message-State: AOJu0YxZ+le8OrhrIcOxj5Gc8FxR/r9p1tDJZ3EqjmP8lySldE//IGYC
	Gm5M9UYAGA89bZ5fAFIl4FfdQ9oOcr94LTBhhQybc9QmMVyp+iCJExf0FoN+QLA=
X-Google-Smtp-Source: AGHT+IG9c7gZDLzp7o26MzKD0Jvqz5A4e/DSQBl0MOwp/717k36BPHRYODJyVnFCA1TiCSnAPJLSCA==
X-Received: by 2002:a6b:4e15:0:b0:7da:18b8:a4fb with SMTP id c21-20020a6b4e15000000b007da18b8a4fbmr411697iob.9.1713473255769;
        Thu, 18 Apr 2024 13:47:35 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id r6-20020a056638300600b00484948cb8f5sm626998jak.91.2024.04.18.13.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:47:35 -0700 (PDT)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/8] net: ipa: eight simple cleanups
Date: Thu, 18 Apr 2024 15:47:21 -0500
Message-Id: <20240418204729.1952353-1-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains a mix of cleanups, some dating back to
December, 2022.

The first two make it so the IPA SUSPEND interrupt only gets enabled
when necessary.  That make it possible in the third patch to call
device_init_wakeup() during an earlier phase of initialization, and
remove two functions.

The next patch removes IPA register definitions that are never used.
The fifth patch makes ipa_table_hash_support() a real function, so
the IPA structure only needs to be declared rather than defined when
that file is parsed.

The sixth patch fixes improper argument names in two function
declarations.  The seventh removes the declaration for a function
that does not exist, and makes ipa_cmd_init() actually get called.
And the last one eliminates ipa_version_supported(), in favor of
just deciding that if a device is probed because its compatible
matches, that device is assumed to be supported.

					-Alex

Alex Elder (8):
  net: ipa: maintain bitmap of suspend-enabled endpoints
  net: ipa: only enable the SUSPEND IPA interrupt when needed
  net: ipa: call device_init_wakeup() earlier
  net: ipa: remove unneeded FILT_ROUT_HASH_EN definitions
  net: ipa: make ipa_table_hash_support() a real function
  net: ipa: fix two bogus argument names
  net: ipa: fix two minor ipa_cmd problems
  net: ipa: kill ipa_version_supported()

 drivers/net/ipa/ipa_cmd.h            |  8 ------
 drivers/net/ipa/ipa_endpoint.h       |  6 ++---
 drivers/net/ipa/ipa_interrupt.c      | 38 +++++++++++++++++++++++++---
 drivers/net/ipa/ipa_main.c           | 16 +++---------
 drivers/net/ipa/ipa_power.c          | 19 --------------
 drivers/net/ipa/ipa_power.h          | 14 ----------
 drivers/net/ipa/ipa_table.c          |  8 +++++-
 drivers/net/ipa/ipa_table.h          |  7 ++---
 drivers/net/ipa/ipa_version.h        | 18 -------------
 drivers/net/ipa/reg/ipa_reg-v3.1.c   | 14 ----------
 drivers/net/ipa/reg/ipa_reg-v3.5.1.c | 14 ----------
 drivers/net/ipa/reg/ipa_reg-v4.11.c  | 14 ----------
 drivers/net/ipa/reg/ipa_reg-v4.5.c   | 14 ----------
 drivers/net/ipa/reg/ipa_reg-v4.7.c   | 14 ----------
 drivers/net/ipa/reg/ipa_reg-v4.9.c   | 14 ----------
 15 files changed, 51 insertions(+), 167 deletions(-)

-- 
2.40.1


