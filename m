Return-Path: <linux-arm-msm+bounces-11572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEEE859475
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 05:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FD7D1C20986
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 04:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA6F184D;
	Sun, 18 Feb 2024 04:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AkACwj60"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30261848
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 04:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708229529; cv=none; b=RpDdoUqN2zYAZnZAiD3h6U5rTmTPBQ186XyJxKc9Dzpfw7zk3Ph53NzhktZ4NSOHRzDdGFT4achGkihJoLSU5B8in4Q32isMHONkWtFHXX9GcAP6UWDpStZXKegB27oI79DdqZfQtCHCwhdRvgxS9u3wQbUD8GYhXl04vTB8l5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708229529; c=relaxed/simple;
	bh=TFvV4OFijHVFQ3HoPgpN5wWEx2q0u/j0AlfuJVldyAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hTIU3V2EQDAFFS1Y+3y5jj6y6yd4cXdKO2fzAhnr45xTlCiIHtHV9szHjo/6tX9Iy3Qu/cEf8vKKUT16oMGKx4GISWXU8dnq/mMvwsO45N7G2Bzgbi/CEmbC3UiOSJQJvZkH/fDvD3T9UfH8at8kJdwFu+6wNSrcYg/ewhfcrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AkACwj60; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-511976c126dso4051889e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 20:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708229526; x=1708834326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ0AlyUQ24AScSzyP2Jwsr0HXFViYWPhLiEbf8CI7BY=;
        b=AkACwj60iZax7F8hi6VaEmjvcpgxFNc1Nrf3fRBe02GkbNWXC4CBkel6qMfEVzMnZh
         2R4qxHk2MHk0gaVJOcpjEb5/uuUjo1J5ZglnzU/pjtcF1SWJEPj9ru1aItoW2DjR4QFp
         uQgwMbaV92669Xq0x6lC/BkQ5ObiZwCUHfZhensVk9Z0EH5E95tCR0oI036U5sQbEgMR
         cWvpQEJaKrdSgEVEvtilxvR6orMTtPfoRSeu0I9jNe0rCCyHDRXaRQ9Cgkn3XRjf8vu7
         8FLcDHpOWCd7j3H6NvU5CH1kOhiCdYS7fecOgnMjE+MMDF/qu1BZwcJCHaJ8S0PoaVbI
         ZIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708229526; x=1708834326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJ0AlyUQ24AScSzyP2Jwsr0HXFViYWPhLiEbf8CI7BY=;
        b=dJJe3kGlsZb81+NcAaJaMJSh43diRVZLL2vZzYnh9Qhk8ej0WmbzOTcT+bUb2VQ0rV
         h1u86RANHFUnjJlea11DjPASOVyXDkBkwFc70OqDEX1wCw1fQzKraSUNlPkuuGPYGiCH
         L6stJBrFzPyN3PVLl19Kj9l+e5gmHYh+f5XkLEDi/McMO8UzuyktJwBXogVl0TEjq1x/
         QNSlAAqVxssOwI7kxMbTG0IIDyzgKZophrzP0KInkTgvRPEh/8r/0jwScQsKhAZARH2m
         7P7ddlqA/AHzFxgJT5Zn7r/1TgNxMqqDaH2Rlzj+LkBWgodYmFsk7yc5cvbQmF6ZA1cf
         ud2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfa4vijEJwNm2/lmx60ktlpm6fB249XsohRZH8ETRoAG+usjb7zjGJt2+QEN86v7L3b3AmghTISjpE70r1D9u9ORBtoLy2ds0UutNc0Q==
X-Gm-Message-State: AOJu0YyZOimQ9v9+HiuAcHy3ParlVx8kLU7m4Gg7wCM9WIpAFujLovCO
	M5yum8m7x/2nKy/1dRF6lCzZjueWAnE6ozghyIvEDMJNt55R9JTpr8mcE2kdXrk=
X-Google-Smtp-Source: AGHT+IGaObtYAwf2B6E4d5QEZ3t8Or1YYvcKAJYExCLh99x+7IIvKvWQApCIyAmKh7hRwECgDd3y2A==
X-Received: by 2002:a05:6512:52f:b0:512:afcc:3fe8 with SMTP id o15-20020a056512052f00b00512afcc3fe8mr203657lfc.23.1708229526182;
        Sat, 17 Feb 2024 20:12:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e20-20020ac25474000000b00511aad978dfsm436606lfn.121.2024.02.17.20.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 20:12:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Helen Koike <helen.koike@collabora.com>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/ci: update msm-apq8096-fails list
Date: Sun, 18 Feb 2024 06:12:03 +0200
Message-Id: <20240218041204.2522828-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark two tests as passing on the APQ8096 / db820c platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 2cd49e8ee47f..88a1fc0a3b0d 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -1,4 +1,2 @@
 kms_3d,Fail
 kms_addfb_basic@addfb25-bad-modifier,Fail
-kms_force_connector_basic@force-edid,Fail
-kms_hdmi_inject@inject-4k,Fail
-- 
2.39.2


