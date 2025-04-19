Return-Path: <linux-arm-msm+bounces-54802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87754A9431C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 13:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D1DF3BD5CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D35A1D6188;
	Sat, 19 Apr 2025 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKJfcrWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629321C5D7A
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745062532; cv=none; b=Z/Hm849r7z6uDC1WJ3LNwhB3iQZ2bVe9HFKQgG34bWi9AGY0o8NCR4fMEpbzjZGSwBx2RT6vwZEgM9Or3kNuh5rGlkXzZzpypwGd7grxwjAy2BjQziXY0/z/3RqDUqdcE/ZJg502/wlK9SHP+4VZjgh94NabNLqCGTpHPnFctUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745062532; c=relaxed/simple;
	bh=hSrFgG5GCJ1EOixVEk2PIVd25zGJ4lE+rWDW8ZzPJxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+/CFZcTsBoW/XA2LnlJqsa2BXzZXMnssnoZFMRvThdkp4rsA0XMLiws8wTjPWQE37c0wokBM9Q/vJVVi0EmgBvvfQh2TzxRXNeAlqJrJbQtVHtbLZ+G6FiIbMuj6KlC1hxQkBs4iw7NSsHWSc9PTcOIytvxbeRP4XA7x/7vfZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKJfcrWy; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2297894b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 04:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745062530; x=1745667330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqEfCzVm0s9gbAWdrawTqBLk3GajDKRamX+SOKwoyMA=;
        b=ZKJfcrWy3rkpMfLUIl476Hg5K3R4kgNxgF0tVUEinRjtU4A2ufm548BQCtul2ppPUR
         NfGBpDS32EFgmLKz9JFlPSNQ5IX8odxklTSr+vgrC0eHQqiNFIJpIfvkbZBDsoluH/Fz
         Cjen+ZO+47bmVuMjIz/yM4E+YvW21XR4FYved5gR7jZ/fD4HJqq39Ubq5zhLU7Nm1+AU
         II+qLPV78/hjU2DswHZCXiBW5XabDx6K+PMJ97KOxZm2WIAf2XEGv+m75b39cZnlwBcQ
         cbpB/MJKYaZ487FTQdNj8EDtHV6eh3ErnO3SAhRQJF493g5dYKkzLAMoFkGQy2fGdtWs
         wghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745062530; x=1745667330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqEfCzVm0s9gbAWdrawTqBLk3GajDKRamX+SOKwoyMA=;
        b=JAE5VKe4mOsqR0LuW+jiP8lmlwRPbBrkhqGri7lwAQJKqQZWyZ1nMcKhWvVda9OS+W
         w7LG+eRn0JG/ZXhYgcIiYPvSiP1MQ0pNt6IFOgoh6QxQpClXVSCy9QOmCskm8pl5OI75
         jtS+cshZOulfeT9PhhsPJNn2Hx4LdnGWTvbn3lmJ+WlYhpk+eGKVRlLLaq8un3SRyCBk
         UtDFYbKoY2YG4qiDjY4WHFlWqkuxweYhisbGOadBNNcpSjK5KPvCpgdqSkJR7cdRSw24
         N8GHI/xvYDh17A194YKzrmy9uqtxzX+BX7oHB/iVEujejWNT4GlTxurt2TtPdOxuvfx1
         jVLA==
X-Forwarded-Encrypted: i=1; AJvYcCUTXdm9nvXO5hI9MQnGNB5zgBSfxO20jvW1VOFfHVKKAX3W5qrSFisXkkdZRoia2J8YUJNQKGsnAE6aUXun@vger.kernel.org
X-Gm-Message-State: AOJu0YzxX4eL/YS51pEiHfw9DPDQoGH4WxT8QGU56qd7RxeVZpAJpMYb
	OLwH+yhi8USm/D9jPvYWNRxLQFOpk53lKRoIQJtOQjBkD8pEPS8Yzwfstsep9A==
X-Gm-Gg: ASbGnct3pIZm4/HQZrkJNa505T6GNea82VskjhnYpBiEvM4oe2WJMZXI8XxIHS6jIi7
	dDUpH4uqt2eUZD4kbryZQf5EP+WyLx3uHGumIXSYzg4ObPfkeywhOy4OOn2c6dcAnK/xTKtOVvN
	F8CZE5RgLCb2pBXiiescqM8vh0A1+uUHsLauuqSi4Foi7CH+k0PwnepX08ggz0ZyKEy6DflGCPt
	YZVO+0akU4MJ56r81LEGdhWYLLPrNGHmnQAJs4hGJXKpHRDjwxNrzfhOqO+bI9lqqVheczyDGB5
	tI5lSDl9flxTBS3g8pcnU8YGnkGUBH2iEZs0De9U70ncMQF4IDxDfg==
X-Google-Smtp-Source: AGHT+IFKbXf8oiV98tgt3cEpHu3Ind6E5MOTHI2okQE5l7xhF/QuhKO27dk6PSwPkrsC8Rn2xyTTFw==
X-Received: by 2002:a05:6a20:d485:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-203cbd4513fmr9527773637.36.1745062530611;
        Sat, 19 Apr 2025 04:35:30 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db139eecdsm2705742a12.22.2025.04.19.04.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 04:35:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	George Moussalem <george.moussalem@outlook.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	20250317100029.881286-1-quic_varada@quicinc.com,
	20250317100029.881286-2-quic_varada@quicinc.com,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 3/6] dt-bindings: PCI: qcom: Add IPQ5018 SoC
Date: Sat, 19 Apr 2025 17:05:18 +0530
Message-ID: <174506248856.36993.6558804848056183191.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326-ipq5018-pcie-v7-3-e1828fef06c9@outlook.com>
References: <20250326-ipq5018-pcie-v7-0-e1828fef06c9@outlook.com> <20250326-ipq5018-pcie-v7-3-e1828fef06c9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Mar 2025 12:10:57 +0400, George Moussalem wrote:
> Add support for the PCIe controller on the Qualcomm
> IPQ5108 SoC to the bindings.
> 
> 

Applied, thanks!

[3/6] dt-bindings: PCI: qcom: Add IPQ5018 SoC
      commit: 5ae42cdeb1d23fc604fb6c8a23cff35a4a47b10e

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

