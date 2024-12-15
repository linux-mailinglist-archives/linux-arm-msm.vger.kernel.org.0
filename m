Return-Path: <linux-arm-msm+bounces-42266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 662149F2412
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 14:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 097141885A83
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 13:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9763518C03E;
	Sun, 15 Dec 2024 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1zmE0AF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E163189905
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734268249; cv=none; b=M185sfxliUggrgaXN4mawKjs4RckBIrUGQ6PdoEy2BWGUHwi+oK1xwhCYYBNpTI0+VkJbm5tge2pUcxWzxmn6x86mbrVgfNUK64fogTatji97bogOJ9tyJdiMUdY7bPvUrKWpC1oNQUqGBXTJEE9FPuwBCKHaaBWaSoBSRi3akU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734268249; c=relaxed/simple;
	bh=PAo7FhFxwzMLaxoUpdFn/FjW4BmpWBiuIFDN3uQ1XY0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QeWBqLoFUCa2NnLL1WCGLJcL1Rq2p61hAnVmsBGGNZ1idOd2jfDAtHYaeupeprTi22U2FRFRO4xJA/HTA2EN7HY2RGywH5MPT69/BhStH7F/7ZLiEGpnipCZP717+LTtXVc27MAmZK1I/dAcK5LD+1g2CxZUAUdLsHJTjiKDpGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1zmE0AF; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401ab97206so3388177e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734268246; x=1734873046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ju05ziYlwbIpCgtx0Bb9FPQKa5IBD6RMSsDPSFRI4ws=;
        b=H1zmE0AF6xWaMrftLi1sRWBIyFxzWFB35T6q4f78ham0tjMVAIwEQvsyIEUY1YhBDQ
         pYg/4OWKsTw1n96UVmDtyJsnS9bLfbHzt9CE91wIbjs0AXLofYtSqPsvlrlMUWXsn45c
         QachHyGpbf2hoO/de2VtltTzYCeqxRfYxOSFU0Tx61yX7ZFEOHqYrzF5a/i//XuKTjKZ
         FLNE4/ld4GV4A3Q6CxCzZky3YPecqOIPlhesVUR6fiL021vDNIG9Zoq9SAS/a4ZCjrwE
         giztJnx7yNcqa5/hjtKaxsWuEvCrYDZPhMXgL6/2VJh83/GiyQmnVvcig3pjoAJiD9GZ
         ssnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734268246; x=1734873046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ju05ziYlwbIpCgtx0Bb9FPQKa5IBD6RMSsDPSFRI4ws=;
        b=Jce34TtnK6G99v2zJKVzAbQ8e8h7e577VoxRy7TLGCu0wCCBxygbI282hmsruUkeMe
         jR/kQkoX/sQz5BF7swU0/nPIJcFEn7I9yJlqGchlRWyFK6TAlYaltvRD+zUmVc+lahWC
         8hqwdMLiK2tHMaA9sHFmo5IYHcqk11qCoRw2QFZVtpfxdbG80bec2M2e5fDWiXmeA/SS
         r8+ta6HnelR5JfjO7q1IWWZPIdzlSGgqD4rJsGLmsrxnBBEXXCvezaxzXYePV6a848/r
         a9xmGkJ2ndc2RMixfoSvSYVrV4MkjWEtIIksNjBVlD90AIrCngntYVbtB+7nJJQOdJEn
         9/ZA==
X-Forwarded-Encrypted: i=1; AJvYcCV5GsFjHwf6OfEUGoTJNK64rAJIzYZ8BxuA9Eiq2eLHMwb/ZVEAXTtQGn3Iepc18gGRwaQz6vLCjORYrxzc@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRUN1Sj0X6Evrr/cvnvNVd9cDvVyow2DD7U8QYUYh9YUack2S
	fVnZi773RtyWMlGx5WWTHW4HaYB+zg59FmZo2R5OT9rsNw0ObBxEpxTKd2cq808=
X-Gm-Gg: ASbGnctqhCcxkLlbWLVO9MZOKBK2c9IorB2DVxt0X9/f3F+eJBIlrk5ot15RU6t99Nv
	SD/TK8z9OY0ybWGqjwuFaNvW/WpmBoyscAmozqJyFS3MwDbBDhDNDwFM9TVE2xoKHEVfDqaD1bx
	QCvj+zIknCNRTP3HLwhn9MiIFROTTS4uSEAL3KwK112cdrc8UdFUtNSX9ccST7+N/kUJJvIdKJZ
	uxVcTFp5fTmbVwQTxstRLl2R1GFK0CCdohEmuu+UhimZz/iWoSYiOvwOC7VoUZA8EMB6PQY
X-Google-Smtp-Source: AGHT+IFk9r/owQGni/IpvIbzf9xRA6qONzpZz70R2mTsMxoKxfWh5BJOntsOsl8hiRXd0joBI6OGdQ==
X-Received: by 2002:a05:6512:1287:b0:540:1ca7:4fe9 with SMTP id 2adb3069b0e04-5409054e4b0mr2641383e87.22.1734268245751;
        Sun, 15 Dec 2024 05:10:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 05:10:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Connor Abbott <cwabbott0@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 0/3] drm/msm/mdss: rework UBWC registers programming
Date: Sun, 15 Dec 2024 15:10:39 +0200
Message-Id: <173426667308.2196979.1702626124443847535.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
References: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 27 Nov 2024 16:04:31 +0200, Dmitry Baryshkov wrote:
> Current way of programming of the UBWC-related registers has been
> inherited from vendor's drivers. The ubwc_static was supposed to contain
> raw data to be programmed to the hardware, but was later repurposed to
> define of the bits. As it can be seen by the commit 3e30296b374a
> ("drm/msm: fix the highest_bank_bit for sc7180") sometimes this data
> gets out of sync.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/mdss: define bitfields for the UBWC_STATIC register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/43eb9a8a372b
[2/3] drm/msm/mdss: reuse defined bitfields for UBWC 2.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2cb62d9f9cf1
[3/3] drm/msm/mdss: use boolean values for macrotile_mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dc7b16a4f055

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

