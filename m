Return-Path: <linux-arm-msm+bounces-17205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC08A0CCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 11:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C4271C2179E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 09:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9003E144D2A;
	Thu, 11 Apr 2024 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="darnnQxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B713DDDD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712829006; cv=none; b=pWORzDW/ME2Kai6dm/QO4i8UByHfYkFWpMvRQINCOem5okZ5cyomyNfVDiksr5gi+d/2ZV/ioK0XKDnbCu5BohHq2tHEG78SFgsXHlrdO1AKc98vL2sQJ6b8iTBMLjf8kdup4Jt/dj1jn7bQwtC+JUkuPAOd/CyS+iTW6B8w9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712829006; c=relaxed/simple;
	bh=6Rtgkt8tWqoIigwBFijC9Y1w00fEx3L8QiXMXAulxv4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FG9BsdwCazXFpQQ765A28hX6FgnPOa47NvJ3EqKnE1vXWnM/0SXRPZibLA8nRh2rCJSKSWowtcmoFBC4NFrIy7yL+5FbD7IDlTjw67GcAkFfB37egA9fvCQJboEFBA/cDx8rEHqzgXeEk3lqvTxJza2EN2X0fjnu6DKdK+Fr6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=darnnQxc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41551639550so52830415e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 02:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712829003; x=1713433803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPQJJp/mQ3ASEgmyqn/FrA7Op/MFUN8aZ0h3ZId51G8=;
        b=darnnQxcS1OSPODrAny+6gbRHAFmctMFG0/DbQ7FDl6y37FsJx3F3U/Jgzo2g8OZu0
         5UxSwDKsTNFahSXYX0MNIJMokg+dxUmip2zQ1i/jFb0xIPdElGhTUQ2fySWCYN9l6gxp
         J+PHym67dfj3+ojO1TgQru3Ju7p5kIVb0ODC/opgsETAB4u7FU4R0mAyhp25aRFd3PVy
         g++GSwBI8m6YjumH7iXilWH31i/JXaBIsYEjS6/2DsJeHBf74HakUKqg3pwkB9OdWH7h
         9HvNzSE+9QhuhgeXKZEJQj8VAMib6/Gcxd7hByCiJwwjTogihushFA06wAa/NWIzLFyE
         M0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712829003; x=1713433803;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPQJJp/mQ3ASEgmyqn/FrA7Op/MFUN8aZ0h3ZId51G8=;
        b=sgQquzWQWcbqdMcg6FQ8kPLD+dqpxdiirI/iOmi7Cid6wq9E/qxbRMoSFp4zGXZPTW
         S0xEgk5lRPm6QK8C4Q1vR5igMsNQFFR6u3qD6PiQ9GNKyB4h7jRKhPODxfWZvh9eMb8W
         E1zWE/uiW8RovgnF1UzP8yVJGhLdxiqFKy2AWYqIbWuCP30oFvwmGjaqzXpuptIz+qPN
         hVCZVQcsQo/JcfWCYoKKdEPxjTxuKFbpiVgZhaZkWnGxKWBZHeN2QvnSUKW7P4jcPcEd
         UZWvoxuB4r4Z+htMg//BUE9FQ2hI5e8WenaVK6QkTdnsrFYclIUyUcYxjbc6jxp9vTae
         pAjg==
X-Forwarded-Encrypted: i=1; AJvYcCVSzBbuSHREInX84A8KJy2lRpdSa6OBthDa+CkIq9Co2/fxJi5/G5U69eurnv49AGk5slyJ1G2gYqzZnn3TgdiiUcSyXXv/0Q1cX3ZuCg==
X-Gm-Message-State: AOJu0YweF/+2xqqUBs5am7X8DRSSkKMeXAD7LiEMOrArPu8G9qtEIjrO
	g71cIEm8JDgStcwBUGKzZgXwDHvpaeQD9l+e4DeXNMR8JFEhV1VnaDY94ohWMMc=
X-Google-Smtp-Source: AGHT+IH0e0UOosGzS21RgtNIpgSEjndqk/+zayFytBbkrbw/3YvQelBToR5Os8Vg8YpzKMjd2b3EiQ==
X-Received: by 2002:a05:600c:2494:b0:416:3478:658c with SMTP id 20-20020a05600c249400b004163478658cmr4416146wms.27.1712829003248;
        Thu, 11 Apr 2024 02:50:03 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c35c400b0041638a085d3sm5047666wmq.15.2024.04.11.02.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 02:50:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20240410170129.248361-1-krzk@kernel.org>
References: <20240410170129.248361-1-krzk@kernel.org>
Subject: Re: [PATCH] slimbus: qcom-ctrl: fix module autoloading
Message-Id: <171282900257.158197.5427243198462918285.b4-ty@linaro.org>
Date: Thu, 11 Apr 2024 10:50:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Wed, 10 Apr 2024 19:01:29 +0200, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> 
> 

Applied, thanks!

[1/1] slimbus: qcom-ctrl: fix module autoloading
      commit: 772be93c1c247d006bac1a7fe967864d90a34415

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


