Return-Path: <linux-arm-msm+bounces-35240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 167399A67F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4625B1C21A08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E7C1E8847;
	Mon, 21 Oct 2024 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3zZg6LW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2507C1F76DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513075; cv=none; b=EskYcXo4hANk3yiBFrBs2ItNxjbtyoequ/+Uu8LmPhKG+pokqxFGa4Bn1lSBX/7TpNp2jSs8qvuo/T6aRobKqU6dgIVCZDQbpYaIGR62IsUZOzlVrZZL90sD1Yre/UnQtcu6HoNk/5DFggHW1PxuoCeH9txGd5NB7bcy8NL2q5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513075; c=relaxed/simple;
	bh=jFR0GuTQWYiA0tkVkUxdxqWwZ92Gh4oNyd8l8SbpTLE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WgDqcESSnQSjplfaJO3LAqaCCPxrb4u/dbNzHsMOYtABfMUepRxjC0oCZh3EnKytcTNBnehrlwDgAbSJgEnfNY6aiYybpBWklyfwuE+dLd0Yj/ir1Tz37cs6gGASWStER2SVSQCoxKTUYeOk3nhYdCzd3DDY7F3x15WPnAw5oHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3zZg6LW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f6e1f756so5065556e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729513071; x=1730117871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4XbVxeeKZbvEtWB+ooKpQYase0x2chrzmDf2sWa5VY=;
        b=s3zZg6LWiaDwrENcYgM6N84o+KB0pQNIAsfSlfzcZRPaOdJDGmpPAVDxxLo8mBBYJQ
         WFe2qSb2YlV4e61+ZuOLfsPwI4gHvD/zijSfrnvGHBn7R44qiPqNgxqtQBYOIS0oVuR7
         E9eZ3vxXa0UN09NknPQQyemr6TTC1OeyUu1WsZ6dx8HBaisgAgjUtjG7CQPz0y46d/qM
         gL14XV5rP2Tq8pdP9ij1WPckuygP5qs7wkPO6PgFEreOvGIXvC36hmw8bZyJ410cMo5V
         +ypDpizwOu5d7ZrNsdotice1qK6XEYieOsuAOenAJWacOQeadO1aFs7uzyy9Q6dJ8Emo
         bUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513071; x=1730117871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4XbVxeeKZbvEtWB+ooKpQYase0x2chrzmDf2sWa5VY=;
        b=ZUkEz0F0MN1s1SgyL99VE7a9fnl0GAZi6hDmFo9Mv+40Y31X6dKudRh12rxhw/v5FT
         XEDr368QjEkgfU4xwwdMeR5vrZMMVWhiRZKFQRM5JwJ0iHbeT246wv4esQoNGS3O3lFw
         gPPh8cZUEAcmYonh6LnB1Vj40LhbM6awtYiGlXIGNPjuyuCA9tvfolS+cQWoED6uJuCp
         uy3XjItv6zZ1+htGpw1m84CEN/HM8aueSjOjnpRF3zp6zWpUgzt9NFO2r7crFhWlv07A
         7qd8343yRfdurMy3eP3QBiM2TiNtx0WlI47CbhDxgp2sblvioSwUjX/YKCgo35/rfyyi
         OXiQ==
X-Gm-Message-State: AOJu0YyN9E6PhfeidqiZPpgcjibitC4xCGncypo42Rjp11XZD7pKAH5n
	LOOVVaruG+D0FQy6xrSlKv63O9TVLkHbrKVRltEp5n6fIFBAw7NYKwEoHNXSh9Y=
X-Google-Smtp-Source: AGHT+IHqv4mwsIjXZb0v6O893ub1mSBOA8nkk9+gOrcJG9wQN2aV6SmO6D5BhFYeJg15xKOKgafh2Q==
X-Received: by 2002:a05:6512:2356:b0:539:e317:b05f with SMTP id 2adb3069b0e04-53a15229d00mr5612832e87.28.1729513071088;
        Mon, 21 Oct 2024 05:17:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:17:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] dt-bindings: display/msm: dpu: merge bindings
Date: Mon, 21 Oct 2024 15:17:40 +0300
Message-Id: <172950935863.2053501.3423333346021124580.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 03 Oct 2024 10:14:17 +0200, Krzysztof Kozlowski wrote:
> In 2022 the bindings were split each device per file, but this makes
> not much sense.  Devices are the same in many cases, same clocks, same IO
> register space.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: display/msm: merge SC8280XP DPU into SC7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/897ee967257a
[2/5] dt-bindings: display/msm: merge SM8250 DPU into SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5a1f6295a434
[3/5] dt-bindings: display/msm: merge SM8350 DPU into SC7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/30c38fcd50d9
[4/5] dt-bindings: display/msm: merge SM8450 DPU into SC7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/abf0a19c493e
[5/5] dt-bindings: display/msm: merge SM8550 DPU into SC7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/342d48210577

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

