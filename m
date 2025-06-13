Return-Path: <linux-arm-msm+bounces-61246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0434AD901B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B4143B80EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720619444;
	Fri, 13 Jun 2025 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqnOd9/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB56433A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826262; cv=none; b=atIXdsYiT4+iZ5yxErtLIW1VRybgxVlTUFT532apNRE/4kJMWZ03vZLFaphf6CwXTKylZ/Mds9QJMG1T5wNJyJyJJacAnJYDWySCApJrH4UVrK1XO50nbRIAislPwnMH7uF0xA58eaLhsj/1ezNwufFoPak2hmkRsGzi/61TwgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826262; c=relaxed/simple;
	bh=WXGpMxHygcfzTELJGLmTF9Qa1p/d89Zbk7jdPDFTfug=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=M5Mb+zx9tcbMf0+Z9bZ1dg3T+Lwh0ydUk0IMG4D5fXOHoxQAIDxcDEJN2DTICU+twuf4o7rdCPIt7Da0A6kQRpr0Udhvt6YbJumJN5sNM6t+PsJfqxRpBVhrJapgfNjDbf22qj++etAzwFdH6JdsI6nqj3olcr3YWwBORgycri8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqnOd9/U; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so19045425e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749826259; x=1750431059; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXGpMxHygcfzTELJGLmTF9Qa1p/d89Zbk7jdPDFTfug=;
        b=YqnOd9/UpYAnk/h4wt4ESiDSiT5nVw7RACJYscBjYQDxN0GdH8A9a0ZuWry6z1zjhc
         4mjAGAIue6oT9uCpJLe7DmUUaU53Kf5QzcEdkUYQvA7XB8+Z1NiGhhb8p/mO4tG80NO3
         xIxv0VXeBQYEkwogxSkYmzXMZz9ZmsN41zyvGjGN1S2WQXpaAz3B9wIsNee8z98iVkt7
         zSZZUyPHcTSlr2Rew41CTVIkUygNGoUp2YOAnpEbBnQsQhcj+VBATL2wsBOwa6V9J5YA
         AleyU+8mps2ajjwiFYie/ANBDUVW46mgRgCFqbsCKqFrk6mJWOpnHWFhiD3wDuK/GVkj
         IEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826259; x=1750431059;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WXGpMxHygcfzTELJGLmTF9Qa1p/d89Zbk7jdPDFTfug=;
        b=UUSxOgfqcUiDhO0NDq9rMTosOEbK5waLdR1YZGAaaKGFxqmr/Cmg6o0Rw+fwAAAqH/
         qzqUgX0CjHbayWyWd952RdxFKkhWbi5s78oQtiXOwhN8r8NEjHTk/3dkpgCXn7u0MjvZ
         gQ3AfDSc4oDnPKv+nttDWOd9xE+N60bvaMmYM+3G2g3aw9SnXqiw8jOuakkgUue/HVH8
         u8x5HN47rwsCu8DX2+k9d47zDY5fIkUz1BrIWWsOpp0o6lexyzjPmr2ks8M81UL+hqo5
         zOpSY+fg3DqWgi/2lHbv5LX0x0bBsXTPrs6a3nY2JK7Rw18aP6XYVXvB0E9b5T9MUQlC
         WqZw==
X-Forwarded-Encrypted: i=1; AJvYcCVib6YqDbYB59WNiW5GzmzyU1dOsMHLn8VQ8V79MXX+EBHjCVrZImMTlu5Wr33WWbObCe22+OY8gZmvnrvr@vger.kernel.org
X-Gm-Message-State: AOJu0YxmAJloi9L3vzahqFfgqmCNa/hb5UNP5Yxb+KS7kG2aIJegQ3Eu
	CprHgQK8J7fi7VfREKpG9TT5AE4G8nXhWeOuxEAkEVPjscw4u9LGHCLW1wmBajMdMPQ=
X-Gm-Gg: ASbGnctEU2AQnAZGj6DOrJknXwNpiDtzegZVAhcPAivGeYBfCSZNvaz2TQeoQMNo57e
	M73QYGtrMxsKxnYXNNSJg+9bLyrvzvKQxJsNdY0cGWFLQglGO1tS7Z8QA5r7rjqcxW92wmw8hvM
	/JXQ5JG3ETVy3qMAhkOXPQgK/e7gh+CLNd0CBmQmdtuGXhMPHFB9MXKx/WQ5kpfl4hZrrSMAaQ+
	VID3fRQ2ZOm96tvUMr6GrsDMHhiL3wCzeByprXj3D58ycWmWj6nmMJ4q2Vnq3LFkaUzZFDn9L4x
	giHoqNoV+6iGFMuiBNyDrIpAwBcn1R82HKKLeUgmKZbg6JUQiLm+JS86otxW/yW4l4O6OyGuUHz
	4y5c=
X-Google-Smtp-Source: AGHT+IGJ34DzRWm1T2gZxcoEWSQEcbIW5w0AwTNiA/GS5kJjbzV7TTazO9AA/zJ8635JEJWkBn/LUw==
X-Received: by 2002:a05:6000:2893:b0:3a5:2fe2:c9e1 with SMTP id ffacd0b85a97d-3a56876abe1mr3243520f8f.30.1749826258845;
        Fri, 13 Jun 2025 07:50:58 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm2562363f8f.2.2025.06.13.07.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 15:50:57 +0100
Message-Id: <DALHN1EOXETI.3BLGEY3KMN4HD@linaro.org>
Cc: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Sean Paul"
 <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>

On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> We want to WARN_ON() if info is NULL.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bin=
d")
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

You forgot Reported-by tag.

Reported-by: Alexey Klimov <alexey.klimov@linaro.org>

Was the series where it is applied already merged?

[..]

Thanks,
Alexey

