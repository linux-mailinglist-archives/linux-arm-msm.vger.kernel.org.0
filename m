Return-Path: <linux-arm-msm+bounces-79416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5222AC19DF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E78D567440
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F31C301027;
	Wed, 29 Oct 2025 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R2PZTCn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C092F3C18
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734524; cv=none; b=GDKOKpbjaVc19RDRDBmp/ahv6mL552UfzlfN5gKHQnw0ILC86VnwabMS6UNg6eVI8zyM0UH/TF8IsWRySCJtxcSFXppnJkSHQNyjqIYDe2VMfoI34edR9RY55V/v4l73kUc07AEcoDL1rD1fe9kDKzp2COFOjivVH+nKReQHoXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734524; c=relaxed/simple;
	bh=AUDqFfVw/6OEV65Z6YZ8rdLCW3TA1z/nedV4oyotdPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tImAZ7guGcUdIOxhK0Tpa79fareGH8lXF31E9071KryN41B516zCoIlQFdIztc26Y3Rkn4QMxzLYQrxvT47fRjpQxe9UiB3D/Jk7FG4+YqZMbRoN/bjt/DxNTxT+WrheflZTptMkV40MiQKMvV7t0eGYf9iU4JcunqnahLMbnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R2PZTCn8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso30192155e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761734520; x=1762339320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3X4E3hHQ4vm0fEjCZ5UPCa76r6tX7WxRSfwf39l4Uw=;
        b=R2PZTCn8Vxye1cwzPwcvsrc+w83i+sfM+Ny3gEMZoKT6XhJB9jY48Dkpb/LSg/QUvJ
         D6fpevYhbnAjX431AnxdDnZqyrq7XaDKwQTSRGdzzf7jsa83oGDJd42mQBvDcgHuX0nM
         IQPBqE5nju71NUNhZo+4kseVQTh0qsT58h5WlCUT7YF2OkR5x6F4olpRCQOvA38rw0Dl
         pqISNDaaE1oR7j4ji3PnAICgqdv0cckNx8n96Qa1jvM/FjYGb1f96RWaGPeeecO+0/Qt
         BV17vFTHxIQr0H4VQDeDTMZmaro4UVMmeWkIGG5aaq71LH4i1DBSWX7wMxI0GKqB01il
         Hq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734520; x=1762339320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3X4E3hHQ4vm0fEjCZ5UPCa76r6tX7WxRSfwf39l4Uw=;
        b=m7wcfBrn4gRLxuA4n0GVeo56kVgRCk7bvftEOAYYpfj1TE/A7pwIzv5I5lo4dkibcH
         szvX5mLaDi3ODfwff4ToH42zN0rBXTpZ50NNzwd5c4mTJotmX/A5tVpRsYNih78O9vMH
         7EqTRv2HIG6HbpR9IsIgpJIanoxPPN6NZQDxKFy3zd587AoKKUBP/Lq7gSTUA8tkELuM
         59sRYpe5rs6dnm8ni+7+UZJuIm3Q2LEB95QH7ocFUq/XybWTssX4MPcyzj6SdRA/92nZ
         toDxECqU4cha5aBST5zeAQ+TQOstVPiI4HF1gAzV/eqGQlIktYlovspykEAxIYQuwjWa
         9ypA==
X-Forwarded-Encrypted: i=1; AJvYcCVBXagIFw4ebOzC4T8hIzhwDOe3CwSN6eYdA56zL7qpWoqwQhamEw2ZEeAJHqJaFE9czXvvkLzWyzLcsi/c@vger.kernel.org
X-Gm-Message-State: AOJu0YxpEQnG5f8yIZrvl0CEi5QhcHWkG58d93OmHc5oIn60ZxrIB02E
	d3CcW9nfregxtj4f/TyFPeAK31C+BGx4E1TvZuH3zqzszjVHI62tLItVmRPG5j99nQE=
X-Gm-Gg: ASbGnct/khA1estc9Y3G74digr0xin5o9IaH/qyIOWanr1oPELN3G0CNawnw0tBgOqT
	t0TgvivnnfTGupqZrVtpYCRoBHJddneAreu+2MHGhSPQ1K2zbgSZQcQh0LLuhGLGbwFSr38HTKJ
	BQbM7/WAbMCkk39SBgPti5QZJABm+TP72S0ROa63M1NggDh9IpC2EqPGlZpXb7Vyx93Ggn+KA13
	QJXzY4oj7VR2JktEmTnCC2e24783gBBPXEVbG8ZBVjnEDntchAYEPmdRFA+cYEsc9ghNFKzpK+o
	R9t6b29JvbZJAiuybES9T/IKdQ3IE2y0lhvIjlHZeEM3ZmUz9GYUYEkGM35L55cHVAGVhvFhUjG
	Y1YQXFi/HD05jsCcef42AjefET6VW/9wGlgkbauhK/zxNWXzrq0089wjHFwn+roehd9QwqOCHoZ
	MPJvKepiRd8BTG
X-Google-Smtp-Source: AGHT+IEr0/AZFy2/29X+tk87HEM/p5Fa5fWpVSnd5/YgcWtERKefh8/xi2PyHwwU7M4yWjRk//ZiAA==
X-Received: by 2002:a05:600c:3e07:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4771e3fbdcemr21558395e9.33.1761734520102;
        Wed, 29 Oct 2025 03:42:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7ce1sm25165417f8f.0.2025.10.29.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:41:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/7] Camera I2C (CCI) enablement on MSM8953 and Fairphone 3
Date: Wed, 29 Oct 2025 11:41:58 +0100
Message-ID: <176173451403.17889.9951642355826230455.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 28 Oct 2025 17:40:45 +0100, Luca Weiss wrote:
> Add the compatibles and config for CCI on MSM8953, then enable these I2C
> busses on Fairphone 3 and configure the EEPROM found with one of the
> camera modules.
> 
> 

Applied, thanks!

[3/7] dt-bindings: eeprom: at24: Add compatible for Belling BL24S64
      https://git.kernel.org/brgl/linux/c/aef72ebe9c86b516c6e126d4b453c96496547f0b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

