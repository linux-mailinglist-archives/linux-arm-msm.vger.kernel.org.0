Return-Path: <linux-arm-msm+bounces-58565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DBAABCCE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE8804A423D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1BA2571A7;
	Tue, 20 May 2025 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nkl1pOwG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D12571A1;
	Tue, 20 May 2025 02:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707306; cv=none; b=lOo012ZjaI7atHvkHIKPvAp/bNT521b2QgrjgWh8AUHmrd2+jI36+xbS5/idiWauQ970E5stvDxGWswSR0eqgHNb1g+9GE2aA7MmYRUpSgi+4mIwuZZsCfK2PL5c08/YHR/0GTcFSDQo8dxnC+UDk2XPpz99cpMoztk8c9IxgZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707306; c=relaxed/simple;
	bh=BJO7l1u7ktvdyGsNHZrW9wAWTu4ZHU5uyw3HaIUSbEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZSFnXBo31TxY8tVkxiPSp5xq29+yxsu9LKNq4+ct7hTlWfd+8xb7xQiJBiewiFrhAEseRE629AiP5Jqx4LpesRc9lDfRH1LKyhi18jWpdCe1zSRt3m+7OSYRr3oQbWDv0RhVTWbx0XGK+c+mvbfqKqsjlRUDIOptcSlzxAEk6vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nkl1pOwG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254AAC4CEF1;
	Tue, 20 May 2025 02:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707305;
	bh=BJO7l1u7ktvdyGsNHZrW9wAWTu4ZHU5uyw3HaIUSbEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nkl1pOwG4uH1SNcBOGXkOlhDICcdvlWIMckgT5MUA5qL5PD55EMAiYIo9RgHp+0U2
	 qu+8++5uWHNRjxda8wIj58dTIvFfSYsub+ia6gNcB/57AQaQYJ7kDtraYdKXNM0QCE
	 wpOfwjjZm6VXmk/4NTxqJU8TVgv0khxZmQm7RsJRZ+OhNcWhexc9k7KbW8eavwUyKI
	 9JNM7vhlWY6ui1OM0TtnfEA3NGewO9hCfOHXBviAR6oDpPyXYG1B3z4kGNYtDQsWmo
	 YNeCZboLIjW8Ra5Usy+DxmrUufcWg/KO8WJEAoEFp1Htgz3SSU5W28S+Gwwo11oxcT
	 k9L2TxoobQHDw==
From: Bjorn Andersson <andersson@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/6] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip support
Date: Mon, 19 May 2025 21:14:37 -0500
Message-ID: <174770727700.36693.5134671930834105272.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Feb 2025 22:41:14 +0200, Dmitry Baryshkov wrote:
> Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
> of BT/WiFi chips. Add support for this member of the family and enable
> it to be used on the RB1 board.
> 
> 

Applied, thanks!

[4/6] arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
      commit: e07d2d57a1c7254d25597dcdd34f318a91ec9398
[5/6] arm64: dts: qcom: qcm2290: add UART3 device
      (no commit info)
[6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth support
      commit: 9380e0a1d4498301798c71e7dbb3e61ce76f288d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

