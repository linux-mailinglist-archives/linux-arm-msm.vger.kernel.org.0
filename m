Return-Path: <linux-arm-msm+bounces-16542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EA89A032
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 16:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2E641C2238D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 14:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253B516F26C;
	Fri,  5 Apr 2024 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx1AeYys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF5516D331
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 14:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712328704; cv=none; b=Kob+X5qhsVZ/V1Favi3mlU21Y2ZveZPypgw+Ol9uRUwOjzCwUdqOFwFA9GgQ4ZK1CMNqwr4rs+WNS7O7X09hguRklXsNKopL+jHoUjtiuP6LjqMi2DC+ytv/aPBWDTooMhjUmr1DRAmKGDAP7tFIEzs1E6UdMHnCIaUx1QXy0/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712328704; c=relaxed/simple;
	bh=nBh6+Tolyv/RUeFFT10lNxpDMtUkFudcGwwycUPSXEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PMzWv+IRabYtT1B4c7pvnWm+DS0lQz/yu2iXkfJgLz8WwXVk/CjjqqiNxQxdgEOte/MhW60/XMWL2WbMIQsVzkGbSWD89BXHz3lFry3yN9Cy4+eN5fYj4JnwsahIvn47lS930oFyDH7POr2VmrVMH6WM6O9xSFxPzTflxDvCGKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wx1AeYys; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a51a8749478so71283966b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712328701; x=1712933501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8nL/6QrHJLG53n4kuLacs2CXp2d+yRinvOnuDvcMfs=;
        b=Wx1AeYys0c9manFM1pBwmjBoZC30nBDUWqfluh+BTzQB0KS2g47cZqig1ySB4RTeC8
         TW7DJwdlzv1CXL2vyuxDNN6gCBmY9RSDGOeoYf20cRD1E+frqk7GSm/s+du0iatHDmdx
         WaKsbS0fpQQvYv2SYlEdGhS8d0kMfaq8kmIs9LOhajJh/RlbFp6ExeRsn54xkTPbOqmB
         OKptvw6vhoqf2sSbJGudjI8GznpLHSAc8YmSniBvzp7RNYEKqlDtfjkP1kr1K5rJ1ysI
         2s8PTN1jhSWcQcq9N8nPuIKJCcvbJi8c9ORz0CVvwSLh5Yk340vzMyBK9xsSuEZS7Fjs
         Q18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712328701; x=1712933501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8nL/6QrHJLG53n4kuLacs2CXp2d+yRinvOnuDvcMfs=;
        b=QilBMhGTKjqNE0e7T9tcFYZuh5ZFAqi45CGzAgsmyOtDtJElSmGIjNSBhAW2uYt32f
         1GRRy9oRjv97aMGsrIVtf/20T5xEhPkOwojN3//YgoQAz8RSl7lHW8f65u80Myh+zVGz
         kXO6P7e20oeV0BIRWhcXpdo5UxtWcd/xqAvHfQTFoFsFDXN0Xy1IZRlgvHHhg4ocwfPc
         ysvKjH2BEwHt8zDrMdOqN4S8iTH5hAo5GaQNJMSdWymcWscDOlkDAPZR6uiNTW5kx3t+
         Nze6CnnfX0HepUGOmjWApfEi/aNfgn5QiUcAYWebnKtjUD9ibTkVqK3r4CDYlLgJR5It
         yTTg==
X-Forwarded-Encrypted: i=1; AJvYcCX72nSMTJ/xkEIM+tEZPWaMkAHFqu/ifcOBX+99xxbXO2wV2rWzy63mrX/Vn6XcksfupgtpUziJORaPcMjnnH3lo99eu45COLlM9oDprA==
X-Gm-Message-State: AOJu0YyNdBlOCreKHLK7yfdHhtC4EZlzwHdKvC2OSuN4/TaGYQvYcsPW
	H2NcwjJvhffpwbwPwEiMTtgQ5YhkXZKRN1rjwbtURUtdUJelV2V8
X-Google-Smtp-Source: AGHT+IEb8s3//WYLpr16mbi6pjrX7ZbBJiv4fAfeUDFeE1lk7M7HhjIIfizFnQLHAznGVnw3AmC0Gw==
X-Received: by 2002:a17:907:8689:b0:a46:e377:1468 with SMTP id qa9-20020a170907868900b00a46e3771468mr1499149ejc.31.1712328700428;
        Fri, 05 Apr 2024 07:51:40 -0700 (PDT)
Received: from kali.localhost ([193.163.72.181])
        by smtp.gmail.com with ESMTPSA id k14-20020a1709063fce00b00a4e8a47107asm910229ejj.200.2024.04.05.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 07:51:39 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
To: tzimmermann@suse.de
Cc: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	Kiarash Hajian <kiarash8112hajian@gmail.com>
Subject: [PATCH 0/1] drm/msm: request memory region
Date: Fri,  5 Apr 2024 10:50:44 -0400
Message-ID: <20240405145049.9570-1-kiarash8112hajian@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kiarash Hajian (1):
  drm/msm: request memory region

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 +++++
 drivers/gpu/drm/msm/msm_io_utils.c    | 10 ++++++++++
 2 files changed, 15 insertions(+)


base-commit: c85af715cac0a951eea97393378e84bb49384734
-- 
2.43.0


