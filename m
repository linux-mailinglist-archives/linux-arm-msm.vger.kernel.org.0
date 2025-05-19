Return-Path: <linux-arm-msm+bounces-58451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C26ABBE0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 14:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03351189C31D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7D220C00E;
	Mon, 19 May 2025 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFP3E5nz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B926279356
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658247; cv=none; b=DH33I88EVFJBgqZxkKg8RQ6CS/GM9qfmoMX9+NYzMK5+NLZ5LGcla83p081Zl0zAi9ZoEqAHhXvqeM4l20DT0HYp0OJKpouBQdmLA/KGwVKAyC4+k2bAz8YwyP9z/aUUgFFiuPP5+td1VKkzMoErcoglMwL3fiQd699b/gnuUiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658247; c=relaxed/simple;
	bh=AbuXatVFzppSvZX8Et0Ft0+ymczP6Jt4xh0ApfvPav0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sO/pQsijwZsrZ62As2+TqiJByp/lcQizs5g8OVG7NTFSmGnWI9hF87Pyqb8wy/FqyuYmo24Yf2csBL1oumrQT9+JBMs0NTvlHTJkqoI7akzpIiMRogrZsldq/kTQpVHMPaLIshu58kaT474jYyu7fQL8+4oBXxRlFeiB7xFJufg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFP3E5nz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-601968db16bso4124037a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747658244; x=1748263044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGruH2OWyN5Kdhy7bKxvrOX/NNRx5g3JGk/NfDWwg9E=;
        b=kFP3E5nzsGV3r6yqnDBKrhPoiOr+9wmzrao1NWjVSR8vx+tPHloHMGa4hDtKqDzCD9
         V8XzlwStzNTNKrFoB6e1blpG2/Z5F8fVhjwBoEZWOqU4Gh5AcBGWW9rLTHH4YIIG8poM
         qqQug9BfjFHA0mVRe3lsCGWylOHBl+Iy4Yu/rMtSE89qW+lKvOrxmbTHYyXjPsmO9CW3
         JhcIhXfnFJ0JaXQWOrKxF3SpB/bfFY38yvMYTutwxmcPqDiaeJIXxm9wuQJxgY1RXrBj
         gjkeHau3HNCHFfmtM7+jj8l2v8czXo0tKqvLllx9J4hw9uzlEE2LbmtEem5JfQS4fsq0
         mZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747658244; x=1748263044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGruH2OWyN5Kdhy7bKxvrOX/NNRx5g3JGk/NfDWwg9E=;
        b=q0ZLpiq7/QyPT/wzbewRNteag1cRaNBnGrWixNcneQnMuxZCVaS9IQoZsuS3sX3xsr
         Ha9w0EThRLlwYPWRm7A+GiGXlXA4ismP55G4D2YAZCWsZ6g80pz5cDtuMRPsEMuxnRlu
         EqlvuXEt5Atzrf5oLQT92Z1BBSfY1tGfcbaF7T0lGEyHviyQDfEbmVkK7VHMxPqbIl/Z
         tNAjY4MPCHJ9GNEGhOQy6R00Ge0HvF0heDYtxYItAGyItmWZW2Geb+PTFivoc5jKhaCe
         wYzvL+QhUjS4gqTznf45QB++5o1qG5m89oQfg77XmAYl63Fd/IUHnIBxpzZZr1kytRtu
         vLnw==
X-Forwarded-Encrypted: i=1; AJvYcCXXVT2+8QDzBAljwS7VbVJO7uVNEO/TfvAwhcvi/QDLp9PdeEWO3YCAuZlf/40NErBrel1jih/xcXCJqaTk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9iMNjYp13OHpzKg4nI+tNbO+rWZZ1Po3R5mSR9ZEqe+/zDCKe
	jk4kofHa1BuwGCHhpyUES/dLmFWc83z/0OszPD3TzwxK05PMPMhJl4/SjPpGgEoMZg==
X-Gm-Gg: ASbGnctEKFPgeNxTV+fXr2Yeff/r9NDBhFPzaifa87hjEMlrA88wjMWcA5KVG/ZzFCO
	O2Sp89DaoWOsxQfx22zGvUw8L/nxPjh07OXMDT/wjN7ufqPG29K4B+dZPgUk49YcIpYmvJk+Zcd
	1aa3UE4fq/lzoDxObwKU8mkfOIxhC49mIaa2MasLEVBrUYFg8aiAtv4nBsYnq2WI9cPhMD4WjGO
	6TLDKbZvxWuYCQh+UtfBjhXWrYQ4qp4h4kYKM4bAn5QyWCfj3HmzGnqXsdghzJsDTWjDFlnV0AH
	cVeaGOlPXNhnvcZ8mm77vG/tGwqjnkZqljY9ge6jZvpeUoP1CR5Z2lxhSvBfip5SKyiTy+5JI1n
	IOz+eGC+x6oWbU8P9hvHdQsZdUeIsBxh0Jqgh3yCikBraWbEvEaYoJ0pnd+fmRT5+YpU=
X-Google-Smtp-Source: AGHT+IEJuSH8cyFiHfFYB8+TPURo7EpATg7AlDroWHzASyTyrwqYV4s/mzXF21Rux5m6FuouAAfVig==
X-Received: by 2002:a17:907:1b0f:b0:ad5:5293:f236 with SMTP id a640c23a62f3a-ad55293f282mr759959666b.3.1747658244437;
        Mon, 19 May 2025 05:37:24 -0700 (PDT)
Received: from thinkpad.homenet.telecomitalia.it (host-87-20-215-169.retail.telecomitalia.it. [87.20.215.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4967e2sm580970466b.128.2025.05.19.05.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:37:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Date: Mon, 19 May 2025 13:37:18 +0100
Message-ID: <174765807809.8857.13152215627311569796.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506073934.433176-6-cassel@kernel.org>
References: <20250506073934.433176-6-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 May 2025 09:39:35 +0200, Niklas Cassel wrote:
> Commit 8d3bf19f1b58 ("PCI: dwc: Don't wait for link up if driver can detect
> Link Up event") added support for DWC to not wait for link up before
> enumerating the bus. However, we cannot simply enumerate the bus after
> receiving a Link Up IRQ, we still need to wait PCIE_T_RRS_READY_MS time
> to allow a device to become ready after deasserting PERST. To avoid
> bringing back an conditional delay during probe, perform the wait in the
> threaded IRQ handler instead.
> 
> [...]

Applied to controller/dw-rockchip, thanks!

[1/4] PCI: dw-rockchip: Do not enumerate bus before endpoint devices are ready
      commit: c1c9c4b6130defb671c45b53ec12fcd92afea971
[3/4] PCI: dw-rockchip: Replace PERST sleep time with proper macro
      commit: 9ad44a6f6f8775786a9543427c82625d96a340b4
[4/4] PCI: qcom: Replace PERST sleep time with proper macro
      commit: be0b42befa87d81780aa0f003644b0ad520b0234

(I do need to change the name of the topic-branch now...)

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

