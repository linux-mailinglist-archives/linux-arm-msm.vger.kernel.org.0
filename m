Return-Path: <linux-arm-msm+bounces-55175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4028FA99677
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 19:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E71C95A4D81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 17:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4BB28C5C5;
	Wed, 23 Apr 2025 17:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIsTen+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4114728BA93
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428932; cv=none; b=EcHUT+gZymvemt6titWHX+v1QsqqsUrlFXkb0m+WIWUuf8FLZCsvoq0Hfo/+K1i8UT/P434AVwXaKkzPDx/r8OvBMTdWRdDOnIU0MLwuR9mxbTudBIYlXrmFnuZlkQr5zbdujOfeXJ4UaSiK/3G40jqxPshPy4ZckjSB63rGEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428932; c=relaxed/simple;
	bh=oJSYqGkH8eJ7nnI4eONslaNCAK4zDKV2Mf6cPlywreQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dcTo0M1cH1sSz2GyzT2QVNaD2FDY6rCA1pFtF47Bam6RSDj4EhTU2Tl0DL43M78es5U3PajVaO1db2QcuIOm6rJcOD7dslcTrAOK8u4uDMSz2716n5muK/EiSqbBZJTtypry3xtsuyHvD8bZ19hAE59Xj9dy4F9gSeUWuCLpHYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIsTen+t; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso937727f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745428928; x=1746033728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/fWatsoyC3ISeEvWnCn+x63EPNqLu0aQi3bXvQHx9s=;
        b=PIsTen+txJ4y14/TzBIiwRaPQhjL1Zx7srnlszJHjVqrqoKe6tLh23V9tXqmqwAVRo
         7wEO3Vmo8s28ddYy9Ypyap4toFXwh/GUYi8/LOXySKfHS38D+4kGvEwhLks/LmtHT5ln
         orS+xQg2/vhfolUbGfDwoSmMuNtf0HNlH42P8h+BtfjE8c9FCHMaNXs0iedaq8VNM0N8
         xMrapZFwNbFHuxIU9PWus5fWm/CQyIY8oFLGwgqb9ckR3+3z1AnDFcztUPi8OU7ESN5D
         jrDw6efb0GulF2VEsgAn9kNv6cIk3etFBwxRzW3u8LwJYToDTrSyxUf9RF7V4SgefNFI
         gOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428928; x=1746033728;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/fWatsoyC3ISeEvWnCn+x63EPNqLu0aQi3bXvQHx9s=;
        b=jsWht9xa5Jd2U57uJGP5wJCroVvaevgagw31tO5i2kW7h8JNmY/at8/3Jf2J4L2qzj
         nat5Sy174QTR9l2eOi0p/wbBX0mC+0kgO3iacFGJUoE6HMWvV30ZvkKaJyt8TsfiZmNy
         Cbg/Kj5OY7N7xo7LsGtN4iZxQTG04DVm+dWEO9OJzrG3maReFviPXWsbKs5tncVRqr5b
         rGIa09DtJAfqv+t68Q5OSZZg/j2RZo81Oog7wHlrQIHZS+S3UV2zbG3qDlwPf2Kzu1Hz
         kUf5fZkU+pFM2FVzv2SkckIbwSVWH7Y9mVyyNj4b3rbw0lWiJd7xudpKOarPjOni5v9z
         cRGw==
X-Forwarded-Encrypted: i=1; AJvYcCXRAg7D+WJERWPIecWpIVhjHQFTH3wGrdFz+HcNnlQVth0GazoA/K+guwm2tsCda6sMLEPBBiFcsd2r4Ne2@vger.kernel.org
X-Gm-Message-State: AOJu0YzOnp2m7HApHHDfXG3xaLKjVJFcTGUXbU1Ld+Vkz9x9gBOpuOtA
	g2ogrDIfuXUEkDEqg47M/o+A9Rgozt3JpR7UR+PvVezQeKWlPwDhD1irSuLeZQk=
X-Gm-Gg: ASbGncuOC9K/A8dqDrJMal+RCJsKeks64l6OPmWdUaVFBJaGJIORSM48giaExrY7Y2b
	30aNi9pV7nwCY7x8tWv64Ueq1LsoHAAfsUfOOPd5ceMkWoxmZSnRjmtyqxdfBiN+Azp5Kt7Kil7
	9qgGdxAeHt3iMLE+AZYZsv+Ju+1wfJ31/asbEi2QIMffNYV/vSEUkIfWs3hWiVrCvaofyN6sIKO
	tYQNRQy7X4FCi1K7IULEfKv0vdt2A8MjS9xnTJnolGwZk+bvMRnncFc8az9bt7l3bMUfdwZV0sW
	pEHVfWu407XKHBn6epHTWt05cqtBM42ef0ZyfXD8eG9kYA==
X-Google-Smtp-Source: AGHT+IHpb3M2AX8ubADr1y8Clnmgy74dWjubTc/OZ082AsTXoWv1+RFKxrQiRpJTvsF1zuzQls4pfQ==
X-Received: by 2002:a05:6000:1acf:b0:39a:c9ae:9eea with SMTP id ffacd0b85a97d-3a06c6bd8cemr18787f8f.10.1745428928559;
        Wed, 23 Apr 2025 10:22:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa493115sm19460396f8f.78.2025.04.23.10.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:22:08 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:22:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
X-Mailer: git-send-email haha only kidding

The "ret" variable isn't initialized if we don't enter the loop.  For
example,  if "channel->state" is not SMD_CHANNEL_OPENED.

Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Naresh, could you test this patch and see if it fixes the boot
problems you saw?

 drivers/rpmsg/qcom_smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 40d386809d6b..bb161def3175 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
 	__le32 hdr[5] = { cpu_to_le32(len), };
 	int tlen = sizeof(hdr) + len;
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	/* Word aligned channels only accept word size aligned data */
 	if (channel->info_word && len % 4)
-- 
2.47.2


