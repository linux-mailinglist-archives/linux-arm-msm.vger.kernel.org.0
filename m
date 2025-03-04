Return-Path: <linux-arm-msm+bounces-50102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C9A4D261
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CD601716B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559DB1F0E52;
	Tue,  4 Mar 2025 04:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWM0lDes"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F51F03E5;
	Tue,  4 Mar 2025 04:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741061384; cv=none; b=n8NYzscajr7CaUQ/cdWHXOI0KwLmnU2yWJrHvqoqHWobV/hpRAwcTBWZk6uPzzSpR+ZZ3RpTj5z9K7Jn7gZZPJPXDbvALRtZ1+OAM0prSWD9U+rbRtLgrGvx70gYEibklxVMYPnOroScOEBz6etMzNLvqcjpp4hq4cxZkHBO1rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741061384; c=relaxed/simple;
	bh=KoGK/SjJaX6GjbwfYx3L4okHGnPh1ZByOgGd9NDsAxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lmj6zPhgBULh+NmDi9VZv2iOCooCim6d4InW61A9JD0fezUmoL6fTU7wNVeTbakwTEVZ5vzruD4qIaYNH+GGoQ3BnNeG/fSfQEUel8lHUEHXe4avZkZ9fYStzEw0GLoCn2jAQWIDVlhbcpX3N9WM0zvC4RR8ZfBvHVhFRoZVbk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWM0lDes; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B9CC4CEE7;
	Tue,  4 Mar 2025 04:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741061383;
	bh=KoGK/SjJaX6GjbwfYx3L4okHGnPh1ZByOgGd9NDsAxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZWM0lDesbH2B/UElPhlfb+bhe+SQDXqTDNysRNOXZT/Dfa05I+xeIMHkAwhURMck9
	 z09VkbebeazYisj98yDsAUTFVtsS2whLTyGJxUMJTUP5Rvk3kQCVfavE40/BGfrFM7
	 VJEdu6pFbEoX7fHGpxDrtVvxz1VaYyScHlTDaJFc5aVRBwsNgwj/yEmIrDdsckQR3+
	 dymaIuo62e8fXR30TtyCVDlif9+r00DiiBnv2dIyULDC4OLpVNK19Os+IFNF6H244v
	 FXOzh/ir08qdfDxDIiR/Q369BUJuiH+dV+E6jd/h2qzqSRXYJyNFv3jfVCJzqBrCc9
	 5ovBpA/xJKy1Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] Revert "arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu"
Date: Mon,  3 Mar 2025 22:09:39 -0600
Message-ID: <174106137700.690572.13341685389729259019.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225-topic-845_smmu_not_coherent-v1-1-98ca9d17471c@oss.qualcomm.com>
References: <20250225-topic-845_smmu_not_coherent-v1-1-98ca9d17471c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Feb 2025 14:44:40 +0100, Konrad Dybcio wrote:
> There are reports that the pagetable walker cache coherency is not a
> given across the spectrum of SDM845/850 devices, leading to lock-ups
> and resets. It works fine on some devices (like the Dragonboard 845c,
> but not so much on the Lenovo Yoga C630).
> 
> This unfortunately looks like a fluke in firmware development, where
> likely somewhere in the vast hypervisor stack, a change to accommodate
> for this was only introduced after the initial software release (which
> often serves as a baseline for products).
> 
> [...]

Applied, thanks!

[1/1] Revert "arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu"
      commit: f00db31d235946853fb430de8c6aa1295efc8353

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

