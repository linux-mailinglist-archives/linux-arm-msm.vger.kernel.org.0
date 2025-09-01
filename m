Return-Path: <linux-arm-msm+bounces-71409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 893ADB3E74B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 16:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E89E3A7B35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 14:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1312B2EFD83;
	Mon,  1 Sep 2025 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjiQCPUH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581AC26D4F8;
	Mon,  1 Sep 2025 14:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756737383; cv=none; b=nDsEPhsEcI92fh3eZgYF5uwhYVnTLDLzcb4lg0V21lYjzu0aZp9FVnrb4NHUo4HQcTfsqLpXSRcFMYlsfFTXSvbgeVf73MUPReZqwKimiBy+s0pmaQ4EpC4rP46VSfRqDAPHdXWZrAyfd81e2wHa5IvXHlzppJ1pG09VGB1RN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756737383; c=relaxed/simple;
	bh=/asUPJ4qddFpFZXxNIxNr8KI9+jGLpqj0ruUkRnuXjw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KdzvBqli/hjsinUSda65gVFyY1PZQJ1aJyaZWdJdoQmXSvFWDbPXfG6dA7TDzYn8jAeqB1YiB+ajivmgKGMPucEZ/z4qQJtX1o5b5aA66AwCm9GNMKJFvss4vw5kIt8YaIf1liA4U3/tAkQ/K3UT8MPSotCOR9WEkOq/4O4Zz5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjiQCPUH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b00a9989633so387142566b.0;
        Mon, 01 Sep 2025 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756737380; x=1757342180; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U/Q4vlxzc15KtYa0RmAFTKXznLq7AQ5jpKT/GnpTxtU=;
        b=GjiQCPUH0+5j8tcwCXdOpug71eC9EfkkZDWbEW/8AnOorPzY1zt2RJ6LmUVUQh87F9
         8PQFxHsxrfSoUMpAk6Z+BKr6WZjTYSO28fWHxjk/R+mSMtLSt+ZrGEE6AbH5BJdeKNdh
         9ldQk7X8RtLjZtv6hYTwlNAvl6VT0dRSjyzBNmlCEexwNqbh32e7cF4KRrGITXrqK3EZ
         zjda+1YUs4Xtf9JsI+wa0XJUQeJatWQ9EXvOI3XF4C3D6d4JoyPfsJN+EbC6GDt2vJFP
         2/LemUn+gSMxNjskiJNZ+xIExy14vAIzk6melkxI/Ud1VoURByCESpN4XfFX0FIOThV8
         ffGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756737380; x=1757342180;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/Q4vlxzc15KtYa0RmAFTKXznLq7AQ5jpKT/GnpTxtU=;
        b=NwAZXbhG9MrCnLuHIsInJRmwReCmUl5B/+BXFcsGbmsXn9viXkstQi0x5UZza5DOQ4
         YNUg2HnS4WrM1zI6yuiL6n7izD0JkPCKSPzAe+TEZ6pz5cIjxeVp/9GsysCoiIB2YJPI
         7aDvGx7OKzEY4XsBD4zucdxARPT4T8IDXB0DIPUM//XF/L1c0QyVPUGAripeb+Kkl+xp
         8Fm7anHFYrqVOFkVAQPaJ4uSeGyHCsHfOyNcSm/vOKesrs6sZYlkI7aJWPRThap/TdlX
         0hM+PyT5AvRkZRamnQ0FvS1JRkGINrNotMIfN5Z0uqLMfivhiCnOm/rfhO6VLDAiZkEF
         jZfg==
X-Forwarded-Encrypted: i=1; AJvYcCUrRfoJ94IXOopSNJ0qbrvR8KLN9lhEUQIrCrf3nhpuuD1zzg+srxms3bC/D6unfCCwa3tJjmQpw5obWW/l@vger.kernel.org, AJvYcCV3tsOBJLhKQ3TX0p6OSoAWgThC7Y/CcD35lqjl39uLk9v60Ccg4v5Ay5P/pGDCp5UfTs6Ld8yAn4e1/lyo@vger.kernel.org
X-Gm-Message-State: AOJu0YzrOJn3FOQDC2HbagKCywsU34MJA36mQuqPXOBJNO28dh87Jmv8
	gA/N/U+7jheneV70WfOi17nqGQaMH32oDwoPUnitJ7+TgYLxtU4HneiOrk27qOGqfzmkxDqj1Rb
	f4KgtFdUn4i34Llsnn5QldYI4Nx9lmSU=
X-Gm-Gg: ASbGncuDctyxxkMWeUF9ESsUuV/PR4Nvxw5EYhvwYaNTKRV8X7btdyUGsBiodUMKHFG
	gAM067nS3WSzBhc3/Q54r7O5+aZsx7vRrxLjXPT6J2/bSiJch/SrUCHSknx8RLxzS4t9Cl6Ef57
	NlfpdA3cnv0NwH7xe/RXDv7Oc4fbcQrCm7U5lbvrQp5bNBO68x9CiPWQyJ8BSNzUCKtLvhcBftH
	3ulgCmaBA==
X-Google-Smtp-Source: AGHT+IHjQOdawi2esWQelRENcKIwimb1JvVhliQn35lo/U7xOxTkOPmmKbXA+gVmbrjawp77zJuwTNWilcm4uvadS60=
X-Received: by 2002:a17:906:4fca:b0:afe:ac57:f0be with SMTP id
 a640c23a62f3a-b010832f5famr891067066b.31.1756737379357; Mon, 01 Sep 2025
 07:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Mon, 1 Sep 2025 16:36:07 +0200
X-Gm-Features: Ac12FXwkPHnzGDnv68BtpYpmvnGmaEaOzUtKfszjAD__GMuZ1vAETdTF8Wb3cKU
Message-ID: <CADomA48h_p6opr_HF=Z43417bp2W-Lv-VaN1FXw=zAc5Td4sjw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Allow empty section headers in mdt_header_valid()
To: dan.carpenter@linaro.org
Cc: andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	val@packett.cool
Content-Type: text/plain; charset="UTF-8"

This fix GMU firmware issues on SM8550.

[   19.858684] [drm] Loaded GMU firmware v4.1.9
[   19.875711] msm_dpu ae01000.display-controller:
[drm:adreno_load_gpu] *ERROR* gpu hw init failed: -22
[   19.885839] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR*
Timeout waiting for GMU OOB set GPU_SET: 0x0
[   19.909450] platform 3d6a000.gmu: [drm:a6xx_rpmh_start] *ERROR*
Unable to power on the GPU RSC
[   19.909570] msm_dpu ae01000.display-controller:
[drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110

Tested-by: Simons Philippe <simons.philippe@gmail.com>

