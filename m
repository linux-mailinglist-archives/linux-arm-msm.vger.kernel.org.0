Return-Path: <linux-arm-msm+bounces-24117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9F916B4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB7901F2936B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7CD17084A;
	Tue, 25 Jun 2024 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jurz5huX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E516FF4C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327406; cv=none; b=PW+Fpxr38gUIiyLIh7sd1Jxqc4dijcUvS9sdf7bgygXBJX281IiF3K/EbkcLR0kNGbCINdptf61+uWam2Oeq81a9PYGUtHPNXdo8Ujw/lzqJSdtqRQurjSn3iDdaCd6Qo82KJBYMGGcVBlyJ62/MbSGKqct5XXBIUGlTNt/xmx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327406; c=relaxed/simple;
	bh=02g7vk5T0e5Z8v8ECJYlSOWilAyou2KtRz8Usdht4A4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hBj/K97rTc9GtT2uh4vgNTkj7wHJghqrL50LXlOLSfwVN0z5WCEbST06/YRYqXK08SO4247zw7iDoK8AeYYfjyHhmnfhRw3g7DqZkDFDnatnM5ijne+fqhRyuUKtk0fMuI7osF0Yi7/MbGWS5Wn3RtzN7To/DJFKVWwZJK5MoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jurz5huX; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cd9f9505cso4611116e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 07:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719327403; x=1719932203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoReR8WhxNYuufCEGKkuq94jgMfndxltW+YaaMCsVj4=;
        b=Jurz5huXlVavTgzwnPoRxb1Vdd98CJ+o81snlBedO1GEHXHC4IqIc4FlF1Pqm7t9XK
         nXP/G+69srDmRgHGjZPja5SWx0MYnge4/omm0j1h8YPF41wKhTkUOKZM+AE/022wMhgw
         B+YjwEWFT7BwIEQAN4p5I5GXH3I7/Q/HZxenDXtGG+BogDWaAyeG/rHajDcBl/2EzdAM
         JBPHkOwsq4XWuUks70ZvXa3C//3egqt61yeKNrgWyBnvN+BxvkO7y81D1f8P2UboSroS
         Bv6KYpFjfB5+QZwaod94jiqEdSgTL7tVh/U1TsntUCNo5VR/weCvdvpbvhCkqCqAKrBE
         uPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327403; x=1719932203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoReR8WhxNYuufCEGKkuq94jgMfndxltW+YaaMCsVj4=;
        b=e13+kAEYYjNrBQIYkOdy2sfMXc0y2mXL/i57mcvFULio5hRN7Zzf+qBNGsVLCq8UXb
         ZveBXRMonEM6WQFoCNH2DkKu212kzUWCPQ2F91I+pJkfbCgu9ka32tSJa4C0igQXj3m3
         ZPnsEEYoBPkwb/7LamVakKZZLcxuB+mKA/rarRSOXWdCLBXoxO/LW35qAPbWNwZEM+Ye
         sPI4s47YC2n85E5NFcsVJjr3jPRrXbf52i+hFZLlt1US4kuNiXQB0M7AMwVJsJ3TtVPQ
         L30RYdekksXZH4xZo6Wg6BotibOj7SaJheN/QKuauHRdKmlkjvxT1s7ETQFhJtKagedD
         DsmQ==
X-Gm-Message-State: AOJu0YwnWRkiPjBPfDCmdUmHUUTOUXMrRKdZAuJp7VXSAFCP1KVNw4Zr
	9KF/noXMbkGtfKBYkp8NN1So7Ob2S6mauq9XZy6sff3Lgxs/MROT8VxxV6rZCNs=
X-Google-Smtp-Source: AGHT+IFXgEFFBEekYez/olxWlhZlgktM2joEiS7S4E8YauuUuTtTSsmoGuQvl2CGNP1XEWUsmnVA2Q==
X-Received: by 2002:a05:6512:3c82:b0:52c:dbe6:f5f9 with SMTP id 2adb3069b0e04-52cdf7e6735mr7608853e87.12.1719327401997;
        Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
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
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v2 0/4] MSM8937 MDP/DSI PHY enablement
Date: Tue, 25 Jun 2024 17:56:39 +0300
Message-Id: <171932736812.1437673.1282826360877883479.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 23 Jun 2024 22:30:35 +0200, Barnabás Czémán wrote:
> This patch series adds support for the MDP and DSI PHY as found on the
> MSM8937 platform.
> 
> 

Applied, thanks!

[1/4] dt-bindings: display/msm: qcom, mdp5: Add msm8937 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c94dc5feb494
[2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/13099cb03f98
[3/4] dt-bindings: msm: dsi-phy-28nm: Document msm8937 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/60bdbaaf1220
[4/4] drm/msm/dsi: Add phy configuration for MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2df0161959d1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

