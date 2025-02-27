Return-Path: <linux-arm-msm+bounces-49646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7881AA4783A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6448A3B1BC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 08:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E59227E81;
	Thu, 27 Feb 2025 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tsrDmHOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47189227BA2
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646220; cv=none; b=KEg3reHGVpEXmPx3ZztqnHcRC6yCoiAUh2+GYtqRF5K90Rc93tkENlIAkYmf4yd3+shWYtbP4lwKT4q64AWq7u0TQ78ysgJ4ysXuasyAWSK175fNBZw7CK8BQVCp/bvYbuUCFIajOgueHpQF6aQbgFyamto0gOVtHysHNMjulZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646220; c=relaxed/simple;
	bh=uynasPwDdscPLERoEl2jRP9OFCsreNV2gINdXwEpEFk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D/0cCDpCB5uwDxi0ovUzj+M8jD+AM5YvvqoYGNc4wmgo38e8J4PlGMxkjOynP2q4dYJHNp80+evI1B3UfOyK6eZ/pWYAtlKRSCQe/UbPWd+taoKxwCK04hhXzlOUap7GTHp3VuYfPaRO60MS/eQ1Lm7+F+JZvPRvnBLFsTpqWg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tsrDmHOq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f5fc33602so454826f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740646216; x=1741251016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ks/IBwEcAklNTaxJVZ+LwL3mjgTmoZqvlq/i0v1O5/Q=;
        b=tsrDmHOqesXrqelYX9H5/bSxH05AIppaFPG0KGQJ1kiUCYdoEuPs0zyhcvQNHeN0yT
         AYnMEkSnxC9KdodRXRFaTWQyY56DVCH8fw7tq8qH0uCVWFqYJe20Iw/h0jAlnWek2p0j
         VYkDAsBtMHqCQmSbWDQxTBm59Q8KOdsxfEZsP8wSKwIlz0Q4gbrbWjGeAGIAPm4wYjqw
         3ooDnwS/HQ/agq332TySbCiFSzvLUmNHzj9jrT3T6sF7V3bMUB+UXftP57QtzuqAutI7
         Bncx0kumLx4VB7CcXPogBmMyxAwMplB6AHeiTcKJoiHp247ZWMH0cLYVKaSpsC+/nX2D
         gWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740646216; x=1741251016;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ks/IBwEcAklNTaxJVZ+LwL3mjgTmoZqvlq/i0v1O5/Q=;
        b=p5o0VR9Flu/eZIvH/kf523Y9tSc2ZfPjb+cQ6dxq8m+WifIci/AFlfuIlCvPCx4egG
         wVW/URRJWUgOqkEzs853q8BVDHCBgndmIqkaAtQEl35kzzjsp2OTgbJbPbOctJLKrbWY
         zeqwKQiHJtHRV5ipV7996+X3ZHxH6yNoZ6w9V7PeO++9q4ruhleaCfE81Faf/LdYuq15
         nYk3NVaiGtRNuDlvdiUiJMw26iwMweDHSZIR8N3DEbPQ7J/oSp0dAcoCbN9qVaJlhYgR
         FmFNAWCw3rfaUjUfLeE7eG742omCrYs2SNRrlwHz8jDjALYzyRh/0AwU4GMa3cJgJ17O
         ToMg==
X-Forwarded-Encrypted: i=1; AJvYcCVT3pFlNzLx4jBMCbzeUcz4rvJwjle9u0EdIqX+73m/ty7hdQ5HZK1Xi+S/fAPJP/HehbkASBgEszbuQpDe@vger.kernel.org
X-Gm-Message-State: AOJu0YxWnLjHDqXrszGEJEvuNe2uU3loUuBGh601LByZuSerK64bglrC
	hRa9ypi9KJI4cDwvCxHrcFh5f4O9Fybh3AWOYHHe24aj+y+0sNN4VT7Yi646byA=
X-Gm-Gg: ASbGncuTOKCZNfjKoffVUzxTt3ER0i2G0MokuPKfQexlqzxgQwoAD5AEAKCO6+DkxeC
	E3GtpARtQFZvtdqnY8HxuXlH6py5dwY9f0/eDkXQ9p+/6/66zQebbeh6lqO+hSdeX4JHESPXygV
	BtL8+092/XBXSbGWgtff9nJ3sRVzt1WUR4dVo7RocjfKAF7PH7IzyTSxYPuVmiaGF4z7LtVHlQ7
	hC0Ti07dwiuxugJloYFsiIlsXfWqhIoGjTiNcvUg20Yeqeu0u2joD+Eb4inrVlGTxoDj1u2lMal
	HcDesHDVrFKeRZOdxbTcpBR1AVfJOALmHnGyGoyuzpml18o=
X-Google-Smtp-Source: AGHT+IFoYeXJ4I6jLF2jC03Em3Oo6roBaewn/6DI8FuDdaLJ1uKLliib4X2jgX4JOOl4swbvnoBEew==
X-Received: by 2002:a05:6000:1a86:b0:390:dfe9:1881 with SMTP id ffacd0b85a97d-390e18d23bcmr1917682f8f.27.1740646216574;
        Thu, 27 Feb 2025 00:50:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba57145esm46894535e9.30.2025.02.27.00.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:50:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, jonathan@marek.ca, fekz115@gmail.com, 
 Danila Tikhonov <danila@jiaxyga.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux@mainlining.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20250217222431.82522-1-danila@jiaxyga.com>
References: <20250217222431.82522-1-danila@jiaxyga.com>
Subject: Re: (subset) [PATCH v2 0/4] Add and enable the panel
Message-Id: <174064621558.3904283.15224037666170321960.b4-ty@linaro.org>
Date: Thu, 27 Feb 2025 09:50:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Tue, 18 Feb 2025 01:24:27 +0300, Danila Tikhonov wrote:
> This patch series adds support for the Visionox RM692E5 panel, which is
> used on the Nothing Phone (1) and then adds it to the DTS.
> 
> Before integrating the panel into the DTS, we update the DSI code to
> allow bits-per-component (bpc) values of 10 and 12, since the Visionox
> RM692E5 panel operates at 10 bpc.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Add Visionox RM692E5
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/383c772f23869df7a31dea333ec92c9e442431d8
[2/4] drm/panel: Add Visionox RM692E5 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7cb3274341bfa5977f3c90503b632986a82705fa

-- 
Neil


