Return-Path: <linux-arm-msm+bounces-27731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24459944CED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 15:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D03C51F22122
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 13:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3E31A3BD6;
	Thu,  1 Aug 2024 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g46ttw/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294B31A3BC6
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 13:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518024; cv=none; b=rPZwI2UzewL9HrILFTSjwHpnntx40+UKe0p+J1egkAfj0ZhAiVo78nDFUbr8HVWeCFUq5e2S2+hOUeoWEASedKWqLbC7a32U+XFmG/CrRVuanXvPbR3EUUMvM6bUI9jqdYUv48YOD52PVH3EOxen7/3Kn4ykDLWKH4R+YUSVy/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518024; c=relaxed/simple;
	bh=FezWJcZXSPwa0miMtXWDpnY7+lW9+mivzkVuebZLtNo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CvXbSRcttd5+BRAk9sjfGX4zkolpV14h29beU9wj7mU8ZXzTImEKeiAfOCOxHFV6ALkCCghjV+vQPvORIdgfswhzij08d5CiXD1Vh62+cUab6rUrRbi2islBlA6MilK8xyzWEs3L/+bu2bUzr0mhzqpPvIlw2/mfMjVDeMXmPJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g46ttw/R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42809d6e719so46803325e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 06:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722518021; x=1723122821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CjZ1vC0iCfySEQd58xa7MVFn+Ocb6KZ4H4l2GwIiZ0=;
        b=g46ttw/RFxnGq2vL7z26EBfY+m6/kFhjTnF4uWCHK3eZnt86GuZT5rCVlPViWNbN6a
         JyYrtmuw6C0YwkpQvTJ/P/63kp2SduRP05oggRBdLAJ9NJp0A0Gq0iZDtjst8k1rIvVX
         ugpr0jpP9A5Yf03IPBbBR8r/CTtjR1NB4fZzupRDXRvqfF+zsflA868yve6mK3FTRiuH
         Bb0biewwP/SNkcfG2drZjh1+NeYYOsfBGExPs3xPKkyImRo4s2SylKxrgKDmi7ebNfSE
         pGR8B5Zi1mUvWxnZeeQHtTlWWxzr+RBNmYWxqtUzSqXb/X/f2FtYljVlforVC05Bohz0
         LH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722518021; x=1723122821;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CjZ1vC0iCfySEQd58xa7MVFn+Ocb6KZ4H4l2GwIiZ0=;
        b=Ll+fJOi4nPtftbuOpFcDqt29I1Ts2E1Piyf8BHpw+j09+8yXZS085hWPOKWfM9r3N9
         AISVWIvQK71eBAtBfDy7hhxvrbMtinPM0MbrR3zBLJFBdl0jC4OqKGOica28OvoGXP7D
         szx5/JfmBk14RIq2Vw4UP93q388uMGP7AssYBRTap9P9DHhAhvTs6Z2SRZp8szu1V99f
         fYqhFN4O14cGRAHH67Hrojf9CPUmrfLVS7JWxHPaoZIMqx3RCyHY23TnjRcTFgcyF+sU
         ZCaLSzXENQ9O0X75BcflWWwnFmJycCyGnP/tbPZ9huC+kfuY7CmSxmhFb6OgA4oUbnF+
         ZkCA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Kp+BGTAHC9sOZ37jz+paNdHifJGkhmqwLdbSzJT/Cu8seRvGJxXd3ZfBm2OcjFZR1TESPkoy00UzRdXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgRyYA5wm5vrk/PGWRRjObnsNfjP+iShFgUTaCsaNj/GVAzgY
	luD35BUR8VgG+hvFksZqR5oDmN1iNDkwhJGDmMdtwMQyTo3JDttWjohFne+pPXgkZFYYhGi4Qq3
	Q
X-Google-Smtp-Source: AGHT+IGpqlB45WprqN2tuAckVnZRyymO8xvVzzQaIkU2QYCs4LdKa54Xf4WOIU+bYrEKoop3GYUomQ==
X-Received: by 2002:a05:600c:4450:b0:426:5ee3:728b with SMTP id 5b1f17b1804b1-428a9bdba7amr18876685e9.13.1722518021316;
        Thu, 01 Aug 2024 06:13:41 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e08012d7sm27435235e9.22.2024.08.01.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:13:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: alsa-devel@alsa-project.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
References: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 0/3] slimbus: use 'time_left' instead of 'timeout' with
 wait_for_*() functions
Message-Id: <172251802018.319423.11632499569902946244.b4-ty@linaro.org>
Date: Thu, 01 Aug 2024 14:13:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Tue, 30 Apr 2024 14:00:58 +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_*() functions causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> obvious and self explaining.
> 
> [...]

Applied, thanks!

[1/3] slimbus: messaging: use 'time_left' variable with wait_for_completion_timeout()
      commit: 0eb9dda9d1db40acbabe923fe22c002e13890d39
[2/3] slimbus: qcom-ctrl: use 'time_left' variable with wait_for_completion_timeout()
      commit: 7d317b95d0334371481ec00ca31f5bf76bae8a82
[3/3] slimbus: qcom-ngd-ctrl: use 'time_left' variable with wait_for_completion_timeout()
      commit: 9f5fd5e2aebf06c37355cacc7f4b4410bc0ea233

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


