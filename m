Return-Path: <linux-arm-msm+bounces-3804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B812A80989E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2450FB20F5B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5441E1859;
	Fri,  8 Dec 2023 01:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CnltOroD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6F5171F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 17:25:23 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so18383981fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 17:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701998721; x=1702603521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z8ttjuthA9TvzbZIjtwgrrvCWpxqoAfEEPAXm+j5bk=;
        b=CnltOroDgJbdxJrIbtpO8VIY3iNY3BRG4niewFN/JOgGGQD45HnB9xOR/LBIiAGqhB
         kca/A169opJrx4uDR4k4kTuKIbCufI2NnBbGekM8O5bNDvAJz1WI0/b1KTJ9b6ETerqT
         h4RqMNL0SSlXIJxe3D4h+gGJ9Y2HLqgi9i936SLcr+pCwGJgRfaSLQZwRnsckL3I0mT3
         xy0GEopU9vfR13JlUIABMWTXECyndINzP948Gcs8iH2joCh8LiBaSTbj6sM5z18+VQic
         SSLVtNcQiQyZC911vLvnRQWcHvu//kzxptHGvpgR85YEeYtTmPhBm4GNk1eL2s3hnYIj
         y+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701998721; x=1702603521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z8ttjuthA9TvzbZIjtwgrrvCWpxqoAfEEPAXm+j5bk=;
        b=WPeRSZUBQMu0dmLFhD0KLOUBXneDIt1TjhE5jSXuG2jxkhKtqDvtkmqCa4r/nzOT5o
         JXD5YRDWWJsT+8VzCNXzuVrT6z0wrxWp08t18n+4ALCK9OxyhvbTD6nxoi51ZnMflcgR
         3XV8b6jLKgGDDs4oEjxRdeBn/TJWRaVIiFtSrwXicATabEHXcWfPP68tI+eJSM8nR0P5
         bnSyiCPIv+80GIsXAvUp8fcujf71icJ04LBNySKJsc5QA9GO7h7nCdsaF7tQt91pgaqL
         nQDURTbv6QmnPT0L5vfLkAvUbYRSG2C0kXzk7qc0g53NiZ7jHD465sP91Pfmsh5Ujbn+
         Wnug==
X-Gm-Message-State: AOJu0YwZ11V375SeJ38jlPfTbiUDAbadSrnzraNZLmFmI+tuFu/RsaMd
	tF23rxYFdZ5GPvXB+dse4q6bhA==
X-Google-Smtp-Source: AGHT+IED1aYK3F3bcWEyFFjhG4PnuYCSof6Qej8fBdgpS3Q3VImntL1MaQ3H87zPoqDDxO/1vki0ng==
X-Received: by 2002:a2e:a407:0:b0:2c9:feda:3923 with SMTP id p7-20020a2ea407000000b002c9feda3923mr1320753ljn.77.1701998721804;
        Thu, 07 Dec 2023 17:25:21 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g26-20020a2ea4ba000000b002c9f58169a8sm88639ljm.120.2023.12.07.17.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:25:21 -0800 (PST)
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
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: qcom: sm8650: add support for DisplayPort Controller
Date: Fri,  8 Dec 2023 04:25:19 +0300
Message-Id: <170199868358.3399536.1110149612486448094.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 Dec 2023 17:37:16 +0100, Neil Armstrong wrote:
> This adds support for the DisplayPort Controller found in the SM8650
> SoC, but it requires a specific compatible because the registers offsets
> has changed since SM8550.
> 
> This also updates the SM8650 MDSS bindings to allow a displayport subnode,
> and adds the necessary changes in the SM8650 DTSI to declare the DisplayPort
> Controller.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: display: msm: dp-controller: document SM8650 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/157fd368561e
[2/3] drm/msm/dp: Add DisplayPort controller for SM8650
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1b2d98bdd7b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

