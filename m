Return-Path: <linux-arm-msm+bounces-23739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB68A91388E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 09:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A36EE1F2252D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 07:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4106C47F7F;
	Sun, 23 Jun 2024 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FmYKN5VG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657896F2F2
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719126857; cv=none; b=QusGdMuInQblq/eBNDb87/+yG50Z6ciCdAWDhACxIwwBIP+aBYZtMSzhlVMh4oVaqwvhB3Cz5EQyKXzA9Ilf1Q5+cAzc1F3Jf43uHifEnNd8YXJxnaS8EYp48Sa+vpYFoBOVemDqYSy47AwJ9pkczKXDDpB32kxW56OAErnoGi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719126857; c=relaxed/simple;
	bh=a6gN8/fY+bxRWahP+N8IcnYDmyN0iA9XUQh6t0xeRh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bQoyfDZKHLUt5xVzvxY1stc6e2ChRG4VHV1V+fgNy9llbWmMAUmFX21XfLPwD46xC3NYKno+SGmTsRHLqvUgWAF9+bN4iUOl/18osu4QKviYqX3AYyM3rmVTgv3rGF41CGDnuND2g/hbkZDHYkIq1FhwQSjcQ0KgCpuu6+0kkaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FmYKN5VG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec1620a956so38539141fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719126853; x=1719731653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h25hTtE3iszL243EN3L/BanznYfr4S4AGkpe+1b60ns=;
        b=FmYKN5VGFeW7V5QWSHfAazUQTUDhXn6kidHkCzJzgFKW0lvU4jCXNo1OMxzMGGHmPs
         AD4O1qpZuR8xJ5q3pOlo2aPU7RcnXQqyMt97wqFBXPCRUhSC9F/+StfqYrGlr0GjZOxX
         Y0rNA3ufoaD09DCpErDS3hPJ/n3GnDQN3WaTFaOXEwW1VlQvepEkU70pOiFpoJ1keUcE
         /rbNKw34VgwzoIfUQoyRpcNKmO6NmlUi5l0WGXACQOkNffd+va4D5fwMcyMgXw8klmXB
         lY1IohZfaII1urFaeAR+eR0OJKxjse2KY0YtymELfEgKm7u5PVvKWPEbwdJrtPYQmrVr
         Doiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719126853; x=1719731653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h25hTtE3iszL243EN3L/BanznYfr4S4AGkpe+1b60ns=;
        b=H5REx84pvoL7GuMfxnQ40ZLHSYpEsNCCBED7yPZb3W/BCwtFbjxowgRXHFA9NFKuhE
         Wo2rOr46eoY73vg1cDSD+2BRR3AVQGIzUZcbm0HP0+nkj8c94bhzrzsP4avDa/8cV9DF
         ONZVtbmmnWp2IA7F31/T2gCQjOuljKrNpnzoQWW2qVbKPSdEvQ7L8JY34LCQsXrPugX+
         /Lz+Hd+m/LBGEs6Q0yHR33gqDUUK89gNYZBhMu6sPZyxRYxsVadJODWndgVVh4xrr6n8
         /CeGnCVcxkcggtIyTx8ee0gKV/wbWVQndKH7nC/cZZTLurlbJkAaUgpKwzJ/NgBnQos6
         NQEA==
X-Gm-Message-State: AOJu0Yw61eZNjpekkmkZMed343XBjEuwPhcsxIRvVRqUcPhQ38vwydM2
	+Df+SCh/2kaSsH+E0msjhV3oWR8z8EgUxHYsuSVECmMvXr4EEKXQa75X1gJYi/Q=
X-Google-Smtp-Source: AGHT+IH6nBtadss1DB4DlOcUB0869LeXq6AxqTp72qo71M9rfYT2F1Fin42ZjsvT3zUahu4cHfWiGQ==
X-Received: by 2002:a2e:b179:0:b0:2ec:5685:f068 with SMTP id 38308e7fff4ca-2ec5b337265mr8057591fa.17.1719126853644;
        Sun, 23 Jun 2024 00:14:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 00:14:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/8] drm/msm/dpu: handle non-default TE source pins
Date: Sun, 23 Jun 2024 10:14:05 +0300
Message-Id: <171912674294.840248.13079605621407953516.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Jun 2024 20:05:03 +0300, Dmitry Baryshkov wrote:
> Command-mode DSI panels need to signal the display controlller when
> vsync happens, so that the device can start sending the next frame. Some
> devices (Google Pixel 3) use a non-default pin, so additional
> configuration is required. Add a way to specify this information in DT
> and handle it in the DSI and DPU drivers.
> 
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: display/msm/dsi: allow specifying TE source
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e0bc725bdd0f
[2/8] drm/msm/dpu: convert vsync source defines to the enum
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c09b19b79d27
[3/8] drm/msm/dsi: drop unused GPIOs handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/149d195638c9
[4/8] drm/msm/dpu: pull the is_cmd_mode out of _dpu_encoder_update_vsync_source()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1ed505b60480
[5/8] drm/msm/dpu: rework vsync_source handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cd1592c3e31d
[6/8] drm/msm/dsi: parse vsync source from device tree
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4404dd757c5d
[7/8] drm/msm/dpu: support setting the TE source
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ecfc21292865
[8/8] drm/msm/dpu: rename dpu_hw_setup_vsync_source functions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b8caa9e8668b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

