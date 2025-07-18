Return-Path: <linux-arm-msm+bounces-65661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B47B0A4FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6127E3B69F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 13:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C72518DF9D;
	Fri, 18 Jul 2025 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1rIGmLAY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295032E370B
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752844997; cv=none; b=V7gb/CPYYP1eDNtfPOMUCAXEn7Nlx7ys1gTB0rOZNHwQ/9abn5WMWQf6ec8YRNfAwH00SbhSlS8IixvG7WsY5K26Amawe3nQwIWx8mmaVwM+QShbG1jfMzNpGk9KhBfqgysrx1qL8C9bc4aGcBKHgBwU/6bktzjPwGCmAoBfrOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752844997; c=relaxed/simple;
	bh=RJXTsE2KOiSMZokrSowhZ4t+AsNAOTZqnDdpfZ+HcGc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=WKBNv4rzmMddzI/TLeKssTcQZsFUEtT3ALweqhyhUYgEDB8v6VHYRthMnX/EynyjzxTacrH36CNvyj57JqSaQgCtnmJPFxndvYYOp8Tg13gcH+LVk4JER3FF2N7N16BWZ8g7E0ceZCtJEtl+Pjm2HabbBP0FcYBUxIH0o319zbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1rIGmLAY; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so343212566b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752844992; x=1753449792; darn=vger.kernel.org;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RJXTsE2KOiSMZokrSowhZ4t+AsNAOTZqnDdpfZ+HcGc=;
        b=1rIGmLAYcx1Xhi1pbucJyK3BRwnbGSVN35ia//6Vbp3JUxcopAiBgn5H6jA7XX0hO7
         VStiycVuk4xFc/kKugsFiIyUwETG3IalRG6TilJcJFyS9EX3PiVgqxXY0CnZiVF+0h/2
         Kh7F7ZTMB3Tj7E3LuwZsP5WrdKy5/T4Pbfs7YrzwB7uflSPH/hT5UU58sXANpiBkAe0/
         yxHqJrvmZu05fxqgEz4Nej49OVvsByr3rmFWZmSsLt6MZ+tSPJLtksaBpOO+QnvJ+9m2
         dtGbe6PboQ5FT5NMpDhHx2FWl6Cp5eLEK7U95cK8/WX+H9IFifM1yt0Oe23BMVe2DOFd
         uQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752844992; x=1753449792;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJXTsE2KOiSMZokrSowhZ4t+AsNAOTZqnDdpfZ+HcGc=;
        b=DWFUDRsofg1wMlFMGviYDXSS5toSm0SmUBlxTzRVAOrwcHDaT12b2DWlgeo8wnqW2D
         STYe6wDtwei54XDkLdN4i7jJrcVo/Cs7qNApUMieiH1y9lKHV8ypYxz55fSGFdHc58VT
         3+Gb9NOUTvz926jzlIlXYJ7L/rQUVIyNw7oCbwBI0Du3vWZVUr9PpVzohPKBd1Z539Mq
         OJEqMkCYYi52SHcpAf1QvbvFJfyrv48LvB+1t1cG6pBqsrKmL5VOvZv2mkMDXyhIB9hP
         hm6cJRS6f77nF+eQwIckETBqShQTOBOBT34MeXtmIxEPdLcTKqCQYV+O4jpxXhXpGWUl
         5EUg==
X-Forwarded-Encrypted: i=1; AJvYcCUHheb8YTaUbi3UHUl3DDTsLpfww+zhtIL4l4wADo9IOCZQDDFgcPmW1NlgADS2/H2NHJ5lgfvuz3Jl3/NP@vger.kernel.org
X-Gm-Message-State: AOJu0YyRHpfM6i2sUz+c5NEj4m9aSQA1SU09BvXeMmmOECCX2VEDrlXK
	E5+adqiECW1UZpwpXYOx1TXe8m9Pqb8tvGikrkk6tUDPfkvAD54PFttYcTLB5liYegMJE6GromO
	w83kWlVc=
X-Gm-Gg: ASbGncvGtwIHhVxUKrauQnXpFTs9U8JUBGSiYGVPCzpAnVbMXQqv+E/NNubesVY43IR
	SUKz6H7pJYEt2QOjtHXD6dKeN5zaj2d6j4yCjA5779okaSLf34i0T8dqOU3jw5HljXiDO91msio
	HmAk0E+7bo9JQuZ77Pq66kyI6lUfqyTtnJLEtht/o+KnAQ+ttAkbd5izjDSiH2sDKBERVi7XeWX
	fc6fXejoPc3kmFd2FjszzM08LWYIa+jeZsF4EiDht84dufq2heRuiZFXUcdRcKoU9mjfRMYY5Ln
	NWKVaY9not5Au20L16di0sq6UIOGR4WTz27A4kJ3iB9dhdRiZx6AW/2vQ9dnUKhU3waH1hgjThB
	BI6P/LWawPYIqQ9Mqt4z1HElClKOI/U9H8VKk76ErCcn3WXewRSSKVNs=
X-Google-Smtp-Source: AGHT+IHZo2D/DBg8hn+lB03yUXC/ioaRaeyW1DWDx5Kc7syRvpA3/VoW5y+u6rC3pfNmkDBBKHRZFg==
X-Received: by 2002:a17:907:c5cd:b0:ae3:6744:3661 with SMTP id a640c23a62f3a-ae9ce10c4f9mr829756066b.44.1752844992262;
        Fri, 18 Jul 2025 06:23:12 -0700 (PDT)
Received: from localhost (212095005010.public.telering.at. [212.95.5.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79ae67sm121366666b.11.2025.07.18.06.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 06:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Jul 2025 15:23:10 +0200
Message-Id: <DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com>
Subject: ath11k WiFi bringup on Milos SoC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <ath11k@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty

Hi,

I'm trying to bring up WiFi on the Milos SoC (on my device: SM7635)
which is paired with a WCN6755.

There's also the WPSS remoteproc on this SoC, similar to SC7280/Kodiak.

Using the qcom,wcn6750-wifi compatible in dt makes the wpss firmware
crash soon after boot with the following errors:

[ 1263.547381] ath11k 17110040.wifi: wcn6750 hw1.0
[ 1263.577281] remoteproc remoteproc2: powering up wpss
[ 1263.814337] remoteproc remoteproc2: Booting fw image qcom/milos/fairphon=
e/fp6/wpss.mbn, size 8229144
[ 1263.817861] PDM: no support for the platform, userspace daemon might be =
required.
[ 1264.523796] remoteproc remoteproc2: remote processor wpss is now up
[ 1264.773557] ath11k 17110040.wifi: chip_id 0x1 chip_family 0xb board_id 0=
xff soc_id 0x40140120
[ 1264.774484] ath11k 17110040.wifi: fw_version 0x3014ffff fw_build_timesta=
mp 2025-04-09 08:57 fw_build_id WLAN.MSL.3.0.1-00328.3-QCAMSLSWPLZ-1.105949=
.2
[ 1272.362281] ath11k 17110040.wifi: htt event 48 not handled
[ 1273.499832] qcom_q6v5_pas 8a00000.remoteproc: fatal error received: cmno=
s_assert.c:400:Asserted in whal_wmac_recipes.c:whal_wmac_transition_to_fw_c=
ontrol:1734
[ 1273.500231] remoteproc remoteproc2: crash detected in wpss: type fatal e=
rror
[ 1273.501114] remoteproc remoteproc2: handling crash #1 in wpss
[ 1273.501153] remoteproc remoteproc2: recovering wpss

That "htt event 48" should be HTT_T2H_PPDU_ID_FMT_IND, I have briefly
looked in the WiFi driver from the downstream 6.1 kernel and while I
might definitely be wrong here, I'm guessing it's not related to the
crash.

Anyone have an idea how to debug this? Unfortunately my AMSS sources do
not include any sources for WiFi, it's just prebuilts.

Regards
Luca

