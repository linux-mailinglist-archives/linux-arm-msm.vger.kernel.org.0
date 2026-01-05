Return-Path: <linux-arm-msm+bounces-87542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9A1CF5528
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3595302EAFA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A681318872A;
	Mon,  5 Jan 2026 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRbZu16J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7605E33987A;
	Mon,  5 Jan 2026 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640596; cv=none; b=nZIP1+vSetN1SiTsz/CINvjwUJ27iupi3xtSQwbayPZoavFmQ+9tGhMOvtNhn7rE4aZglj7PiQbMhuQFqQjPOdqFxnt03/4aSIRMFlTTVs5C8o2mPEgW8CCZ4gjhdNl07lzjtQ+SE+0ztbkuKlqBD9se/71ORZ6TTZS3csDuQCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640596; c=relaxed/simple;
	bh=6NTPGQSzR8P8uoDmYviebKFpUL21wqkHF4476elollI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHE02S/gxFAeOQn1SnCUeySXKrvFmLiZoaqsZtmQoqf9Lg6Mfccd/YV1JGe/rn6kTF9HCLJBtVdz699/HrfjGhEaBQAfrTfrhZ7MrMCWHwKcC52BM4X1+BPxNdFYy8TKnojvuAVOCswUWZdce9pgir5mENsZ/dTj6g5cfgQRSZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRbZu16J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21E0C2BCB0;
	Mon,  5 Jan 2026 19:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640596;
	bh=6NTPGQSzR8P8uoDmYviebKFpUL21wqkHF4476elollI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DRbZu16JNwTsfEQaacAM93EIUbAs0/6VI34n4CvF06mwZ/Y/DaUvDg4sIx33HwZBb
	 3gfDfuugQ6n5N4K7VumAN3ElbfCTcZj9+jZHpope+wcC51CN7Nc5f/wRkAiy2SLbEo
	 QammlwtzIjPegFfP2UzM46jB/8x/xiL7d0nokoDFDoUceSDXALNs71ixBWyLiNsVmN
	 HTtIycmwdGBJYmxdyQmMfBl30deShq5NCuGrAkI1+OA/7mJuDAmVgD8tJ0lgJYlt+q
	 RQrlcwlOYKnLq8xpToOv2oCGcko6S/F7t0F0PcVyKWSz18S+68Su951o7UhXlnbVCE
	 kL3Bw17MwxqqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH RESEND v5 3/3] arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP PHYs
Date: Mon,  5 Jan 2026 13:16:16 -0600
Message-ID: <176764058413.2961867.6085786733249123604.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224-phy-qcom-edp-add-missing-refclk-v5-3-3f45d349b5ac@oss.qualcomm.com>
References: <20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com> <20251224-phy-qcom-edp-add-missing-refclk-v5-3-3f45d349b5ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Dec 2025 12:53:29 +0200, Abel Vesa wrote:
> The DP PHYs on X1E80100 need the ref clock which is provided by the
> TCSR CC.
> 
> The current X Elite devices supported upstream work fine without this
> clock, because the boot firmware leaves this clock enabled. But we should
> not rely on that. Also, even though this change breaks the ABI, it is
> needed in order to make the driver disables this clock along with the
> other ones, for a proper bring-down of the entire PHY.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP PHYs
      commit: 0907cab01ff9746ecf08592edd9bd85d2636be58

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

