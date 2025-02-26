Return-Path: <linux-arm-msm+bounces-49523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9802A4611E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBE1816875E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1397221D8E;
	Wed, 26 Feb 2025 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoAsFnRt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B0122173D;
	Wed, 26 Feb 2025 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740577257; cv=none; b=qtJ0knTPnjCsqYbYtUr47bCi5A/lUDNOfWgCdrVS5lum3o9VR06tPXeapnFBEf38TVrNbQhJedvqXoWo53+hzFtTsmLfivr4Z2sDJ42PzIc5Wy6Vn79yXSOaJIjECPpi3QZccstvVESSL5LrLm5bZBaWUr1YC5DNgZ0KQFNYfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740577257; c=relaxed/simple;
	bh=Xr9EXdbHstBippGRpLmm7WRcFMVe+xReiSjZWi5kiGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cpy/BJra+hPI7k5XL9cYqYMAE1Qav0BmJ9MZaIQnufUVvog61o/BJxscZRTWRF6VNy+4lkT5C7cZoC9YJVzHlU2X/HH8Jbc+l0MsUnRAAqyNAYK3GPhddPXoWWCj9eReCVQP/ewmWDFAFie3OIYnS2hHcgbJWvR+FSvtdYoGgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoAsFnRt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D047C4CEE4;
	Wed, 26 Feb 2025 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740577257;
	bh=Xr9EXdbHstBippGRpLmm7WRcFMVe+xReiSjZWi5kiGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BoAsFnRtwM00tVfHZqETqXOyNcevcfWQfJtocrcE5NosSnM2+QM2WvENHJrzXrnEC
	 hN3posga3DQ9hdxYtrmCgGrLF4h0iOCWzECA2tNsI123oXYbifzZwBMDX6/RUUrJsd
	 ZH++aeWj7pCvVDNCZ3/k9z1dBwRxgXTZjNXuiSueDE3tv9pTJa7erniG3oZCbGcWkB
	 8cys3Y+AmF0p3gqOtFkE9xKskVhgI+89jFncjPG2sDd26BH/xFal3HJQMAHXQHs6x7
	 GKfFcEe5mA0rhg9ifofC0gY78Tz3Fg1UDem4oP6U7iMmhv8EwqtM5HsvdB8jWOyYqM
	 rMy91+IwfBTWg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] arm64: dts: qcom: sm8[56]50: performance related changes
Date: Wed, 26 Feb 2025 07:40:47 -0600
Message-ID: <174057724685.237840.10535494904686544445.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Jan 2025 14:43:52 +0100, Neil Armstrong wrote:
> A bunch of changes related to performance properties
> for the Sm8550 and SM8650 platforms, including:
> - Use proper ICC tags
> - Use QCOM_ICC_TAG_ACTIVE_ONLY for cpu paths
> - PCIe OPP table
> - QUP Serial Engine OPP table
> - UFS OPP table (sm8650)
> - USB OPP table (sm8650)
> 
> [...]

Applied, thanks!

[01/10] arm64: dts: qcom: sm8550: use ICC tag for all interconnect phandles
        commit: 54df5e52777e1126862778a2796c3809df85acd7
[02/10] arm64: dts: qcom: sm8550: set CPU interconnect paths as ACTIVE_ONLY
        commit: 48c84d96dcd022de3b445e20d4cdfc96c2b05538
[03/10] arm64: dts: qcom: sm8550: add OPP table support to PCIe
        commit: 0acd169330b81036aebd27c025b0a5bb8a77ea4b
[04/10] arm64: dts: qcom: sm8550: add QUP serial engines OPP tables
        commit: ac2b7b1e8432fc758f6cd345e9a2472b269cb1c5
[05/10] arm64: dts: qcom: sm8650: use ICC tag for IPA interconnect phandles
        commit: ee6dfc9c75d43a2e2b2ea4c5055e31545b2aee83
[06/10] arm64: dts: qcom: sm8650: set CPU interconnect paths as ACTIVE_ONLY
        commit: a4da40505d72385495ef5d4f1cc8479ab75b95e4
[07/10] arm64: dts: qcom: sm8650: add USB interconnect paths
        commit: e61d8377c7b5e9fa6c4d57a5478118043e94d907
[08/10] arm64: dts: qcom: sm8650: add OPP table support to PCIe
        commit: 5cddecc3d1dce1e20bb64364cb6cd5d8edf376b3
[09/10] arm64: dts: qcom: sm8650: add QUP serial engines OPP tables
        commit: 2c885d85dff832d9be99093bdae73e77795f0aec
[10/10] arm64: dts: qcom: sm8650: add UFS OPP table instead of freq-table-hz property
        commit: 61dcbf45110bb3c3bfd7c92abaca9fffb84110e0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

