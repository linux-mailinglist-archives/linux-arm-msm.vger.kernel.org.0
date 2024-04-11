Return-Path: <linux-arm-msm+bounces-17204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E92718A0CC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 11:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249821C218E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 09:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08477144D2A;
	Thu, 11 Apr 2024 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZV5HurRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C65014430C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712828971; cv=none; b=YSba+Fd9v7NWUQfn/TTnQG2usIfIZj9LJXqRDJXbP0V6jifyIqT4GWuj7hzCNq8cndwit42btYMHcmCKpFmW5nPcLQoqdmQCg6q8KkSAnASXyOh9WuLW5zWYXk+QgwV2j/dsy7SFBZSLHjBmIckU/lpXJsAVYQbEJuKWPbl4/tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712828971; c=relaxed/simple;
	bh=YljiLEM+2502rDhcPH5SPGgvCOflIAg75YCzejRyOxc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gK1D8Rpl83SzJgOtcH6bxg6WjRDiqjOzONKiBi/XK8alDljGYvtfSHb8vvdGrqyH+LsZTm4k6rjhCE1OHfYkyVBMO5tyrvC90ond8uMjr/Rd7W1lBtSjbS8BX+NFxbBgLSmAwdRGrwR/XqsuK2pFpx+Im3iDsezFLF/hDDvomOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZV5HurRE; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d8b4778f5fso22227941fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 02:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712828968; x=1713433768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0Ot7Mdt2VD94EglEUw0Txp6mp1b/ubctfzlEme5QGA=;
        b=ZV5HurREzbT6f9VzLWqUq7WppQLrENK3Y6j8cgkfnosMYbNP/ao68CY2XKrLkp/89V
         /Clc6xFlceim/GyeWBwLgoDU2vDIiwqFZtPEBu73Nb1jFLz63LbxSMGKUi9e0lx13cnS
         uywmxEuM5X4P4V/+yp8Sruqwt2IB8TsLz0py/L2oILZcp+jphMJPSuM8yJvoP6bB2QDO
         9Xo8kdDa6bfISKheQg7rqD537vOlnYcPP9c41WAqrZ/SpHa/03nNxncPbBLFgXQXtBoU
         k4o282RAN6YZSY90QeW2aJXC2RHVDxTFW3zYdWXSi7pFsH2A2Fy1xpZKW8vnE/GrAjA/
         FFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712828968; x=1713433768;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0Ot7Mdt2VD94EglEUw0Txp6mp1b/ubctfzlEme5QGA=;
        b=Nppq15SIKbr0jSpnNDmsedMFdfazsisWQq9oJMcImjFfSijjbSiAuZ2OL3reStXWcJ
         srIb197CYlqJas3lSdcZxTII8Hr9VJ/vixM/rSHHqCg9LDsWJPgbBI6i7k9JNzvPBd+V
         KoQqrbvYT3B4192Y7BrqmNbZLvhf5d+R3EpxT3BWF2dPZ0gWXkQsWyFATydthOMFghGG
         T7HdwrX7+s4CF9DU+87KsiT88WFA8R+Aa+3/UMRYJveHDJ79ISdPqsD2r2II1xbsAuZm
         GWLIxYRjKGPw3NfBqkomZokRdb/nHOzEHAZv1Nw6gFeC78ZoXdjh49QOB97U6CGhIORF
         ByAA==
X-Gm-Message-State: AOJu0YyEYT4x0tQzIdA1IYajd5qhFbX7ogRr6CRT8TdiJfp8YjcAvfsM
	GcTMpNy8mSzs4bDlH8opmps1l90VxJWC+ZttzhvCc6/Nzwom8hFXPF/fYi6n9LojErLnVLwfxs3
	/
X-Google-Smtp-Source: AGHT+IHmv9BSzH8SzRers7OY2UQV4cLJI3NNIheWaBTAk/ZLpUWaujEKBeOt+Mndy28v4BrrcjLXeQ==
X-Received: by 2002:a2e:9b0b:0:b0:2d8:e978:e38d with SMTP id u11-20020a2e9b0b000000b002d8e978e38dmr2048890lji.10.1712828967797;
        Thu, 11 Apr 2024 02:49:27 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id be3-20020a05600c1e8300b0041632fcf272sm1792905wmb.22.2024.04.11.02.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 02:49:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 kernel@pengutronix.de
In-Reply-To: <20240225001911.46196-2-u.kleine-koenig@pengutronix.de>
References: <20240225001911.46196-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] slimbus: Convert to platform remove callback returning
 void
Message-Id: <171282896694.158118.17443154512490212488.b4-ty@linaro.org>
Date: Thu, 11 Apr 2024 10:49:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2


On Sun, 25 Feb 2024 01:19:12 +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied, thanks!

[1/1] slimbus: Convert to platform remove callback returning void
      commit: f6c637ffe528068f5470551a1424f173a139d0c7

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


