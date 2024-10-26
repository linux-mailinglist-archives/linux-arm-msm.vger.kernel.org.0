Return-Path: <linux-arm-msm+bounces-36035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394E69B1A3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 19:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0FDA28259C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 17:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6BF1D3187;
	Sat, 26 Oct 2024 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Noqw9WEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177011607AB
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 17:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729965592; cv=none; b=WLctfi6wJKmobOzzVnkpY4A62XCgNIcBBBMi3Ozhy3rr2CBFTvayervneqH42uuF9zc+cSRFo92xNeuXBi3l3oTmvE75lnSgDhRj8VMAAqrxUa/SvSH2Ztuie+gYhN2Lat4S74vYEAcIMCUkuwF/2RODS3kciajIo1ThJU3CYA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729965592; c=relaxed/simple;
	bh=FwjYPnwwuuvmREZIJqAfOXUf+GmJj+qv8PyjtmS6sn8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nEvtt863reBk5E74sdbohT7k8exaSV4Ige5dyakXwm0agTYEvHhBdKlyCjwNIpsWZo25CiQ7Axig+mhYWMG3Z1r+17LOQw0BaZKmszDiU3prXO8fkISAVfFBAHbXQvM56hAsQg9/IeXtXfE65TOkw2lBQtBICrTUIs0EPkghIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Noqw9WEK; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so30221561fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729965588; x=1730570388; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A0rpcITzgiWTu4jB+jeHdfUnSvR4lI0mkdI52nstT7Y=;
        b=Noqw9WEKtnvaEOtdYA1PHmTuTSlZP0g2wm1ME+oxEtyHIhKQ+SB9akv4HISuYnC22K
         7O1dYKzmigVBYgAGc4c9CjC5ivSsGEXgo828LQ9RupiW7pG+eeQyL3UheahrF8XH1uxU
         kUG+eQa0ld5yWbjqMZTsh1NhVs3rtQuWDq1gkvCkGGfuOgpiBXzmWUywtt7Sd+VYhcQ9
         UzYENtgF3pfGkTCBWIRVO9zPEkwQhA214r8wrdijQMT03uvC+TStaGnQfHddA8jo+qwp
         J5kf8srPHPdlLby03h6o1z35c+O3DMRiU/wyN6RskASLiVPZbvNXfJtuz6XdHzlpzMqz
         2XBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729965588; x=1730570388;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0rpcITzgiWTu4jB+jeHdfUnSvR4lI0mkdI52nstT7Y=;
        b=tACs4l0fG45R8CoEX1g8Bhc2iHjbZdzIZ2tYzbINnzOhCsYoUXigPptaTjy1X472Vv
         SI6ejfIkWet3Pac3cBw4O2E7kUEFg0zvEpNU8XYHJxctO33TqCJxMuQucKpHo+sFhAnF
         idQMallC3VZBUlH6VAboTUWG5HU8WBess7tZmUyjylo9wtlZcvk0SVA3alqivkkt0wen
         bYann3gGrlO8cGRgg0Q4v4learVeta1md2d/fAbXihTF/4AbMrsdHEuzTW1jMWD2BHS7
         I9r31CH5UVtsqEjasaEwylU1DM4q1gsFhsF7towqj8ti1QpwIqfwuehEebmpNzZbztHe
         /nKg==
X-Forwarded-Encrypted: i=1; AJvYcCUpKe9IzolSW5yBoZVlz2vkGz/eJTkzpcFo0opHi0TdbVye/1+efyhQVjuK0WC+rJbVb+5/5nTTShvqvJQ+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxn6sKimyNSPyY+iHbLnp5Qboh2HvLP5+7XTS0ReIwnFYfR483
	L6nUUlPrPlyfswjYI1hQo9uRt4MeW56rad4QIfHznerixCGPgXuZ694Oi/n8/WY=
X-Google-Smtp-Source: AGHT+IFRMrOOLLIA+sh+NSisfOX2pnRQbMz984wwGsrv1109P913+keDI0gBdVrjlCnKdAQ7KiMRqw==
X-Received: by 2002:a05:651c:b2c:b0:2fb:90bc:1b3b with SMTP id 38308e7fff4ca-2fcbe050933mr12208331fa.28.1729965588159;
        Sat, 26 Oct 2024 10:59:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb453e53esm5970631fa.71.2024.10.26.10.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 10:59:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8[56]50: correct MDSS
 interconnects
Date: Sat, 26 Oct 2024 20:59:39 +0300
Message-Id: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAsuHWcC/22NwQqDMBBEf0X23C2b2Groyf8oHlKz0YVqJCliE
 f+9qdBbj2+YebNB4iic4FZsEHmRJGHKoE8FdIOdekZxmUGTviiiCr2smEazXglHN6N0HarSWO+
 IyZQW8nCOnFuH9N5mHiS9QnwfH4v6pj+d+adbFBLWtfeurNTDOG6eMtkYziH20O77/gHWCSBtt
 QAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 stable@kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FwjYPnwwuuvmREZIJqAfOXUf+GmJj+qv8PyjtmS6sn8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7qsnoBgnV7MvNbdzbnbeS8Xm7AFeBh68jRL/m6NYf8iN
 +PfsdedjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjILAH2/675S2ZY3jV/36lf
 uS2tUS7PV1E3xnt22D3XS/elZRoaoj0+fOaQW+RStudywuNXB50U774viGIW53BYvn6zkoavnFn
 Uo3Xs66ZY6a/q9J5up6/Vt7u0yHeKoLnyhprumneVAXfFbVkWLP1dwP4h5UvDKrbkk3oRAmz6sZ
 wfjVQyq+PDIvcwPJK/LqyV+X7JVuZ05cfhUn/P5+iplDndiCw6clp0qmiBbOsWxm8brINYlnFER
 BS92Ocn9uHtoxt1lfGd3x0232g5nOeWIBt6R9nYsk2h9pTxC71lMsXOV0/HLzV4qCAZWhez69jB
 j0sYE7e/PtP+TLXccxvDhJnb8gsvLzjaw6j4OavTiR0A
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Both SM8550 and SM8650 misuse mdp1-mem interconnect path for the
LLCC->EBI path, while it should only be used for the MDP->EBI paths.

This kind of misuse can result in bandwidth underflows, possibly
degrading picture quality as the required memory bandwidth is divided
between all mdpN-mem paths (and LLCC-EBI should not be a part of such
division).

Drop mdp1-mem paths and use MDP-EBI path directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed type in 'degrading' in the commit messages (Konrad)
- Link to v1: https://lore.kernel.org/r/20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org

---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8550: correct MDSS interconnects
      arm64: dts: qcom: sm8650: correct MDSS interconnects

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 ++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +----
 2 files changed, 3 insertions(+), 7 deletions(-)
---
base-commit: 7f773fd61baa9b136faa5c4e6555aa64c758d07c
change-id: 20241006-fix-sm8x50-mdp-icc-138afd0e083a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


