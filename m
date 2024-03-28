Return-Path: <linux-arm-msm+bounces-15533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A71488FBD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 10:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEA711F22F3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 09:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB6E651B3;
	Thu, 28 Mar 2024 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="A517Hecg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ECF2C857
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711618984; cv=none; b=QdF2Usxsei4y2O60kfXOa4y18bpEsJa1wSDXclUmhpqLTnrV43NJKnmoUsTuG4mtX4h9D0kxVpDc1AMiyfmUn/bSFIqP0sWSrRnLP2CCuO5AcVDRzFT6TBy5necl0RxCngbJUaAAYZzshB0lcWLigBnKYFxAGtDbabetQ5b4qTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711618984; c=relaxed/simple;
	bh=LGEkUHOJ/ZabB/vOZCvlgo1ZTv4zJQZ2hEQTHroQ8lw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=US0zSPQ7h6xKgLJxv0ddWJ+4/9+ff36oom1aDwRNEXfliQmSmMgBreZ20qHMcJrlU9XpnFlZZGMG7KY+yRosivdbbPzuYkUUNNlhwQAcabFg0mZvQ0nMz8CqnatYiiVLLTij4KCW1fPP63q27F2nB752hEoG/FPur4QJtvE2aA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=A517Hecg; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56b8e4f38a2so877688a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711618981; x=1712223781; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E8hsC6NRPdxLP7lp60lSArweYtIzuit1meomkaj/K1Q=;
        b=A517Hecg8ITw0yfx99kApqt+m7/6d4suTbkNYg8e5J4q+tW5b1UPuFPxLIBNRXrfdT
         nrSBaNC2eH5arcETlpqVfyqxOmR66VR2jVIcL3nQ70NFYvkSOu7SOjWkRYt6THH/EE41
         TFVOyDwRdZ0qRsIba0gv4vuinG4trJ2o3TnHXkJYRSY6aC21wg25Fho6+q8KqeXgd7UJ
         A4ne8I/YwysPf1SivN6+7AXC8H78U9PQ2rsd5rUtrFz5cdm6ybfLSVlcvxBw9zONkpji
         o33prPxXjkFaCwOkNtA/f/OLve7Qqn6OmkefHR1qpxUdixQVz3/yFDjj6c75UdmYflka
         DDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618981; x=1712223781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8hsC6NRPdxLP7lp60lSArweYtIzuit1meomkaj/K1Q=;
        b=Xst+lFlh9yhxy4S1/1mRB7Bp5/bRk6//px/9J9uuQYYN7QYLnmGOKv/oOJf9qLnzVl
         T9f/uNvjDO7n3nhwfISxeceBaEDFbCl2ywIbS2gpt2LC2ij7bUt5pDg6tnhElhZo6wNp
         SVK6BB7V4DEnUmd7SjD50oaqVLXHlGEPBHiaVpu5FqR9V6Ost0O9hiHjwLN71zrKH3oV
         F3gxvFFKJVUdarNuRC6ojQVa9kD2Sq08yaL51NCFrOKbAO9q/1zU1uhZ60s/wXzNZcTc
         1wO2+NZQp7PfKbIf5I8nhgPY5OtnDirEslUdw8DpOEm0onHLJIXX6UwR1NXPcFmwpOMI
         anlw==
X-Forwarded-Encrypted: i=1; AJvYcCWFdNoYo50C1rhSHLSE+ho0r9WPKUD31Ap7nJMpaA3FeXelPbGN2NgoBDYs48c9VoUSuVR0grHtGrg7dqr3vHy+msPmnLZv7/8lvjtS/g==
X-Gm-Message-State: AOJu0Yyuq5aHuafxU3UJEfJVxddMvJfPhUjayiXtai3YEzttn92zn9iS
	2f4rldtp2XyqPVGsde8Z0qU1AmNxjn7ixVVgq6sAXsIPbYR1u0vMM5Qsl/G2IXI=
X-Google-Smtp-Source: AGHT+IGZx9AnkUFMackC9AU36r/cR4Kcv7nBXW0BJa3Ktjw3YvY08GtNzCtirWitkr3VymvIRKiZQA==
X-Received: by 2002:a05:6402:348d:b0:56c:26aa:f786 with SMTP id v13-20020a056402348d00b0056c26aaf786mr40326edc.10.1711618980811;
        Thu, 28 Mar 2024 02:43:00 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id l2-20020aa7c302000000b005645961ad39sm631362edq.47.2024.03.28.02.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 02:43:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] DisplayPort support for SM6350/SM7225
Date: Thu, 28 Mar 2024 10:42:43 +0100
Message-Id: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJM7BWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyML3eJcM2NTA92UAl0TQyNjC0NT4yQTEwsloPqCotS0zAqwWdGxtbU
 AQBFn8VsAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Add the required changes to support DisplayPort (normally(?) available
via the USB-C connector) on the SM6350/SM7225 SoC.

This has been tested on a Fairphone 4 smartphone with additional changes
not included in this series (mostly just wiring up TCPM and the SBU
mux).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: display: msm: dp-controller: document SM8250 compatible
      dt-bindings: display: msm: sm6350-mdss: document DP controller subnode
      arm64: dts: qcom: sm6350: Add DisplayPort controller

 .../bindings/display/msm/dp-controller.yaml        |  1 +
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 10 +++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 88 ++++++++++++++++++++++
 3 files changed, 99 insertions(+)
---
base-commit: 871760455183dc66b3e185f8d3ed2184cc9fac25
change-id: 20240328-sm6350-dp-41238153b448

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


