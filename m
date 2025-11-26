Return-Path: <linux-arm-msm+bounces-83348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1789FC87ADE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 02:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0EBA04E42C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9065A1E5B70;
	Wed, 26 Nov 2025 01:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKH9Y9nR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF7F2459D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764120051; cv=none; b=WsvjOO5n6ZLgFZw7MtbJXGSe3v6+lmo2cPfknYvgrL5+1LlSrEJqXMC9hvrsa1oxZ+/Wn6zIzlUtc62RyJ8tDUGmPXs0VKk3bzLPw/Y0U8me82LWX/ZofouvX5mj4pcKDGENNQHGkVFc1TPyRioCNpl5C9kd3gueSeEbWEeGKoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764120051; c=relaxed/simple;
	bh=BF/WjIzh1KvEf9m5lmdXHNFSfzJMQ5J6eIhT2a1ozFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HNdaIGYXGw5f75gRRVgp54gxDd4f90yeVs6qqzjPqqQDRYh5tNmgjai33pqjX0icfmxsTQOMWGb9ksL0exn+7ymNppKsU+eMV/DV75Ii66bDaUue4BF6yDYDchFr6IqGR6uyC9onVkXgItSjNuwpdWBkW8c7V+9BbEJrko2IaC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKH9Y9nR; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5958d00f41dso663292e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764120048; x=1764724848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gQvCOuzS35Qzhb28ImHU0Wbmj0hJ/9EVpw/WIq3XrsI=;
        b=lKH9Y9nRyeZfL4ARkAmqe7tC8ZWYUrA+lyejlDchWQqooVqU2p+0Mb8d63+rJqXQir
         mh0fWKnt1p8AnJAVN4tXmUO9yrfJxOvBZ8AnHQOxkly5vQRwMtwvtrHmcRTxZPCuBcLO
         3UNbFTTAw+RyVobsu+s57w3/PnP25MNXPG4QgUcwrT/oBuVIEfQGtYNErJ8EhidIeIkO
         KMROK0VJNyIDrYEafVjLOqShudeUrTVr4FqXaib7V6025Il94iVmOKI9dm3yTD+uOhIZ
         YcscNtmiYtvBCSjmREvysfx72q1nwML0rjB8PzWZJy4TYvnkfMJfZTACeVZE/GGGT+j9
         uazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764120048; x=1764724848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQvCOuzS35Qzhb28ImHU0Wbmj0hJ/9EVpw/WIq3XrsI=;
        b=niRbN7S9GhcLWBgbNQFaf/tTzF+YTm4myeLbl6Y6BqGNUOjad8AoLJ6DoTpJ6PosXG
         z1bVTBnE7H5rjelKpOSn+VBp5aasQetAKiqnzgapv9xZnQ/BECEkbPU2ISKCA8i8U3BP
         vVAM4tnyFDp0IGaJVR+VYmpi6V7NSNw3CibJZVaSw4RsZnXOTQUJE5CPNAkX2QZNICde
         TC+IxXk7ItsJdg6htoYhdb245qy1CZlLTe8BOZGgXBtGl1j9dZKnqjlFG1pGfdKJm87M
         P17BM9HKmZydPBWMActiQBArpXESOEjKeWotkC6g/e5i+vS3+RsA55eb6IIbkeHmIN8+
         tcYw==
X-Forwarded-Encrypted: i=1; AJvYcCUZGCuKYUhHVZLZTI3LJIfCwSIVZnZ6usXMOMUhoLeuth+DBHX/ORaFtjQ/RPIoPQloC9yXLZ8zzc2urPs3@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ1B0F+8v5cu5meJRknfJihB0OQMsdKoOkw0kS3MthQAZntJ/I
	YrJKfCN7eqvq5Xf4qglZSZvSGDT/rS6i8T2+vjtPKaPlSubhco7wqeq4Pfb6b38PhTb0ML1rUae
	1VCiB
X-Gm-Gg: ASbGncuTH8T3zmZP473Cr89/F896sdzICCpDrYpcgpcPxNTczgX+uxjQW/iSny+UjGV
	JZfxdMY5H0tAF/0SyaiOlZMvjsg/F4jbHwmW1FGpRIPOqjl2/XFt9rSgjhc61vvMQ+V4ogBVr/d
	Lw4tcEKWlcColAzvM8lDJxbGcAy87HWpgyZQcwLE5mTAZdwSXaBIYXZ1CbJS0VJpWPl2OOHlLzj
	U9gagHE3zz6WwvHq+fJBs4bGpMhsnnMHZ4Iur+8uzzZeQXBL4+2WI71Bnf6XfTl5tbsH2zuwgtv
	vvS1UScwXkcZuaREYBGwpSTytbDo9aMFr44GIqmljaqBcqgguPFmo/KU54ylRcHzx2FRgWJcnuq
	UKO0DnYmKtVD85Y0D74ejxkcPInI1NSoxu9QZLMn94lyaxG/GEmK+N0aiJePdjt4Tncwo+xpDOG
	oB/fRsC9hFbgeYlHKlfJy6GIV6UnDGY8vvGZ66n8KIcuPoKvsagHHezw==
X-Google-Smtp-Source: AGHT+IECA16PB4n9KYECQhf5UjuuXck80R7ks37sRgh6XLd2tIXQTdz8e8IBYhFhqlT0MZ/+o5fCYg==
X-Received: by 2002:a05:6512:3182:b0:594:3a08:162f with SMTP id 2adb3069b0e04-596a528b52cmr3448065e87.1.1764120047918;
        Tue, 25 Nov 2025 17:20:47 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc597bsm5584426e87.69.2025.11.25.17.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 17:20:46 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: sm8x50: Enable UHS-I SDR50 and SDR104 SD card modes
Date: Wed, 26 Nov 2025 03:20:40 +0200
Message-ID: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reported problem of some non-working UHS-I speed modes on SM8450
originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
SDHCI SDR104/SDR50 on all boards").

The tests show that the rootcause of the problem was related to an
overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").

Due to a missed setting of an appropriate SDCC clock operations in
platform GCC driver the workaround of dropping SD card speeds from UHS-I
to high speed was spread to SM8550 and SM8650 platforms, and since
the fixes in the clock controller drivers are ready [1], it should be
safe to remove the speed mode restrictions from SM8450, SM8550 and
SM8650 platforms.

[1] https://lore.kernel.org/linux-arm-msm/20251124212012.3660189-1-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (3):
  arm64: dts: qcom: sm8450: Enable UHS-I SDR50 and SDR104 SD card modes
  arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and SDR104 SD card modes
  arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and SDR104 SD card modes

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ---
 3 files changed, 9 deletions(-)

-- 
2.49.0


