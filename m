Return-Path: <linux-arm-msm+bounces-48151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FB6A37CC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 09:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961CB188E483
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 08:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1307519D07E;
	Mon, 17 Feb 2025 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcb+1zgw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223DE18DB23
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739779688; cv=none; b=fdoERTl+ywy2Im+lyRsOxwXaHmo5Q5e12+Fl8EuDVyluIWYIlDpFj4uL85vr1YPROevu9f4la1deSmNidqpLt4vyXzS6GLaspL/LY1ytAgY99mVkrGz7MCrqJ9yg14aZuiyeXspkfGnzrJ5BcM7fUiCRIgTNkAlVY+aNMQMPBag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739779688; c=relaxed/simple;
	bh=2ikSgfGf1exOnsFu88z+5kxpMPTxBzklFFNfq0MBXfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nq407V6vLRsfRQfOqDbbW78OpKXlWPpSO1/5MA4eIanQkckcGghPqR3+3UkoiwsIX2z71FNp5neA7PObhG17f6asae9KQ5I+kqXQCGNYONUKgxuA5sziXoQ+NHDSFuKd9Ep5yyNwb10/TfagWnf21v1p+k3+4sOjcgtyzYH+dis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcb+1zgw; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso1293661a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 00:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739779684; x=1740384484; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ziFzV0Y9ZdSXReLGJPFeArO5FCiM55hkxr4sd1Sn0do=;
        b=fcb+1zgwh2mXX1AMSgeEnNFcHK5Mf2w1i1Zi0KaTTmM6YjVrBKmIqVF1Dc2OFwd0w4
         OkysB3CFui06AqR3Sk+//iriDKsbGWA5+75okgn7Pd/y6gB1a9c65uhxsQf9QVEjQj+p
         pYLpvTcmk8+JfzbiK74fRLqJ+doBD4LlaNhbaHaFIia4IlSWlkGDVoiIzp9BcKj2lMnB
         mPxFgDXsCMZyRh8pPEGOt6Nsz+oKrLcQJ6DIWl9twHMwuUVTsb90XG4GE0IRFXiGjFbd
         GcBaWkPvfwK2bOl4XTIzLeDeWBe5ijlYbDz/5ajO58lVXKFXPdg+Vdh9BcuDKk3Og786
         gJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739779684; x=1740384484;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ziFzV0Y9ZdSXReLGJPFeArO5FCiM55hkxr4sd1Sn0do=;
        b=tH3zWuxiquFCLp8RE11+5DN11Mx8QOUWXLSq3TkdXYUKa06l4LMOYHrx3mkDKRRhzw
         ameJxFNYE5A0laCx8Hwb2MQ8j2zGY8+49itpVGRAyCtX1AcZC6b20G92WaPPWfr4cuY0
         6PFU4p/vfDWIv+LmrZjm/mQqSDHcuImluTkvww9i7fnPrCt7ZR3JrzE8ZU/d9YV1WZFR
         wUlLZU2vodHXX78Fcx8GXpWxaNDnAi05Mrgq6uMdMQZsSf1Z0RuMUHf4xaJeWHWjQfPI
         vI+9U4eU13fc3vPHypjCWd32tRSTW3qQHGTMU4p4SQoC10qIFtJgQ/KBgmcGGu4WPRQp
         F1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVPNTaOVifVMSWclu7zsoslBRFWBy92NlZ8h0M+ltBCWzprKob4mtHq+/3vKasdT6Qlu368tvUjL9hv53Kt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw3iUlQKuz5FeJCcbWacywJOoP+YtHuQAPBszBsFoRSQ3V38wA
	ON8QIEHo34/+ny8nGEzb/bXe5I5GOS5VFHNsNd2DfM8TehPtiT8FZXWKf/EiDqo=
X-Gm-Gg: ASbGncsE5suvJFtqr73uDvVgnTYOnBgMytJybM69c++KxmiYWw3v+/xm5Mg0VV+N9US
	4UurWwvWXCvdG4vBNR5Y4dppKagUd/ygwhePAm/qXSR4NJb3qyKUIHadZRDW31Sz9Ooup0Z4EjJ
	klMKcy2bReyHh0MuJ8cHD/cCqbfQJpB5jVbPuCjptUsw+Eh5CkDN0cPuzWS2CbsAYYHUeld/DTi
	4KQ0WUfDTcN5JmsFPGtrKPF0tkXQggZ8ORXgOJvsTwJo1HgFef7SpYHYy0Uh1TvkkH037CJWuu3
	y8jX9jzJW7uEQToLgpeK
X-Google-Smtp-Source: AGHT+IFBXYQnvhbaTs+R1+H9kU9Himyc237EX2vSSmBY82Bm6sjx/eueayJNYvLdiOzneYVu+KD0DQ==
X-Received: by 2002:a05:6402:348d:b0:5dc:882f:74b7 with SMTP id 4fb4d7f45d1cf-5e0361747fbmr10164192a12.30.1739779684400;
        Mon, 17 Feb 2025 00:08:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece287cebsm6843141a12.74.2025.02.17.00.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:08:04 -0800 (PST)
Date: Mon, 17 Feb 2025 11:08:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: iris: fix error code in iris_load_fw_to_memory()
Message-ID: <a1d9e082-a4d5-4440-996f-7ee7e850de60@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if memremap() fails.  Don't return success.

Fixes: d19b163356b8 ("media: iris: implement video firmware load/unload")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_firmware.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 7c493b4a75db..f1b5cd56db32 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -53,8 +53,10 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	}
 
 	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt)
+	if (!mem_virt) {
+		ret = -ENOMEM;
 		goto err_release_fw;
+	}
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
 			    pas_id, mem_virt, mem_phys, res_size, NULL);
-- 
2.47.2


