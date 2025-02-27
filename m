Return-Path: <linux-arm-msm+bounces-49619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED6BA474C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77A881881F74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691782222C4;
	Thu, 27 Feb 2025 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJk3wNCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB362206B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631068; cv=none; b=ZUsTCY1HlxMf9xi+4DZrQ7teFubj8jBCmGyZrj7c1of5Z7XMOd5X9TU8oM808FlzZSZ1g7YRICJCL2TsuRlNqV1nkw/tklsYcjw8O9CLAtePujzGGHZuTkXl+LXySQIhfBtOj+cx9mFBd28IZ1Hu4JB2fKiiUlf/a4A/wZ0Sz/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631068; c=relaxed/simple;
	bh=UAKk9n2MgbyCZoN+0ucDNxhrBHryl2KbQSyyMlhtXZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SoHQeVc2ta7zc0ZhRO2vAvs1yuItzYgYAFnqmk7s27jZGfEwPf/ZyRSiFRk5V4nzzFhygioLnhoXUfVlcIhBmyQXQesMpC3WXhxfnTux0Jekw94N1jk7VE3G8gIDATP+Tgxz8eSwTCGIC9OUEge2blk8esrmZTtHijrDs8Gk1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJk3wNCD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54605bfcc72so1943360e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631064; x=1741235864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYRdSFJ0y3J8w0/MIT9m/pNCngOvo9+w+cz68lIRPZQ=;
        b=qJk3wNCDcBenA1zw9NZiXPn9QcJU6ef9qZhEJ2OKo1L6PuZwO5qpiNI3RXRs2Di0LV
         7VSdDJzVQbvAk+hHWQanPtaPqj1ZfLoAF/jUNDt6fXHLoZSINSt+bCSC4q4OxeIOFio5
         sBYSKxpCl32ywjmUFNERgyA/zix0nUV6bFkBj64D1UmZvO4SxNUdFsnIuuNvpbgnQrA8
         8NDoF8Ca/jgveY5pEXj76PtAavMvv8kjJFlF7DIB5xjbi0T7n91I3GqB7LeB8aS6cP9o
         XMTUFaa8ZfvD9DQONqWmmbJqXHnbkkTSg9DNOzDt53qKG/wqBZgYxFqHFtT5667fq7kU
         bHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631064; x=1741235864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYRdSFJ0y3J8w0/MIT9m/pNCngOvo9+w+cz68lIRPZQ=;
        b=KICLo1ZzxCJOa1iqG80kTILRNkyMaXjUW8/dkNQ6PxS2jGnZVWKchDeo5nshKDacfS
         AQ4VAAXAgTbM0j58grnJ5xLUDaRD+gA6EwYQlvbr1O/zw8sHa9g1l79clQmqYwA/FQW9
         eaLCq6BO+KSMK0usoZLdsvGug0pFDphGmvleLSFfSJiue0SUzkKTSR/YzHN7mOXQR5Z+
         XFTWtKlMN08TJyCu3VQ+WiaFcEtHOeZLD3KbPdtJoAFa5LyBhnwN8OTkNtIyBMFy/Vy1
         6Rg5ku2v86TAZvZyZolSg5CxHv96U6R/0wejqaTLuUlswisS+md5P5V8BzV+WNX5T+73
         V77g==
X-Gm-Message-State: AOJu0YxwGCXyjmSDqLKWGc+pmYSSt5i83p18Ler1Gnp8GDvvgV7NP3RO
	d2sb6xf/Pd19UK1YbzJXJMmD5RMumk/rmx+Fzh7FvU4TFVfiZy4mCxZeK7QW8dM=
X-Gm-Gg: ASbGnctIGKu5DKBNUO5OE6W8yGQeeVb9DL4XxVWQimYC5PmUdapsMhB0N6gl4BlKPRI
	2Ae9+NBmbIS7QZI3qHl7Iv7eecZGEsjNmkFLK77z/eez4Y1/PK/dh1/8spO+QlSzyiky+kg0VYI
	Q5ky79oo44ggSjHCmXYn8EgfLfvT9KyNNmTjHfZg8G0TQ+Iqf0Mn8RveFUKdeq/zbtjHqujv5Zi
	WJrvYuIBBUmQssiyCa1Q1XTdCgeo/W19RJlfXdjuMXbl6AScymDmtKyMjjF0whay8M8OePqVLmr
	IDlulJoxKNqCHOHQq10GJmGejScjYpRFhZS5iDCHyQ==
X-Google-Smtp-Source: AGHT+IHInNYeeu7RJnY0u41TSawSb/sSqGvIZ8wxvnotJqXxQ14P4JT9/11iwOVMUCOL38JGxUNb9Q==
X-Received: by 2002:a05:6512:3054:b0:545:5d:a5c7 with SMTP id 2adb3069b0e04-5494330bedcmr587647e87.21.1740631063830;
        Wed, 26 Feb 2025 20:37:43 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:37:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	jonathan@marek.ca,
	quic_jesszhan@quicinc.com,
	konradybcio@kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Add check for devm_kstrdup()
Date: Thu, 27 Feb 2025 06:37:24 +0200
Message-Id: <174063096227.3733075.13590017200932514746.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250219040712.2598161-1-haoxiang_li2024@163.com>
References: <20250219040712.2598161-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Feb 2025 12:07:12 +0800, Haoxiang Li wrote:
> Add check for the return value of devm_kstrdup() in
> dsi_host_parse_dt() to catch potential exception.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Add check for devm_kstrdup()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/52b3f0e118b1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

