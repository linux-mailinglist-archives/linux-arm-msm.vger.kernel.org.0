Return-Path: <linux-arm-msm+bounces-50236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B5DA4EB38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 19:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 837123BAD0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB54297515;
	Tue,  4 Mar 2025 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q68Hd11Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227029750B;
	Tue,  4 Mar 2025 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107625; cv=none; b=ex9fOqqdZmGf6DfOZg6OsOMDZTH2G4FKkeYhvrhXT5JkyudIhbmfzxomGEENm052Jkr5cbZnI5ZsWKiMkl5zujybI4RjokYj/hoKLWmzdsI2ibsYUntKz8lucj4O/YkBiH6+y2E2DGzggIduf1Jf/gRrzK40kJ+MUMWB6U4jxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107625; c=relaxed/simple;
	bh=odl7vD2Fhh0HGGKw+7qv4YRTSw0Yw1QD5gPNMpwtngU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n+bAj0HMFl3l2EO3TT+SjQgCeLy0V1GSIZ2PjNG7lHknxWSiN+s6pxWCdMJb8DED4httFR34Eey2VpXePm0j6Qm+XjsN5fvVTu6FNOacG0m6zycMx7JgDtlCMdj2g+1AUuA+KK/+8YyUHJh3R/DNJB0uEbjZuh5ffJ0mzCGApCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q68Hd11Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B8FC4CEEC;
	Tue,  4 Mar 2025 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107624;
	bh=odl7vD2Fhh0HGGKw+7qv4YRTSw0Yw1QD5gPNMpwtngU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q68Hd11YUKSSpWIJaz5D7xqPrFsjoQqitjoz4Yr6JYO63fKbXubrYZq+1uahG7Tbk
	 7yRAVg6RI2N/B/8fEBKhyBanjKvGi0mf24GOYMGBQfFJxAYq4Ds5fObiaB6ZMqJDfJ
	 8q1yzeBDVAxPRMuAisZ6qnNXWcW95bMyXURSuCIWVLC0BLKrtaVkxxm67caJGLl9DI
	 kBe0NhZr0uEW4h95YA6cDLDS1Q1LRGhKmSVJXRI556MZDg0wFxaHRwcvvBRUG71Gtt
	 ut1g4VjtPxhUr84syHTa0adfX1uMi90KYlMWp2OvSxJES2azJ94I6kixwi8HYPqytR
	 TDU6iT2LSc+wg==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Some cleanups for Fairphone 3, set firmware-name, enable modem
Date: Tue,  4 Mar 2025 11:00:11 -0600
Message-ID: <174110761301.741733.8731154388965384357.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 22 Feb 2025 14:00:46 +0100, Luca Weiss wrote:
> The main objective is setting firmware-name for the remoteprocs and
> enabling the modem.
> 
> The first two patches are just some cleanups to align the dts style with
> contemporary style.
> 
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sdm632-fairphone-fp3: Move status properties last
      commit: 09a3840bcb72bcd9b43cbffbb7dedccf85e6d558
[2/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add newlines between regulator nodes
      commit: a4600b160eca7f889c4b4a370d42e4619fa5162a
[3/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add firmware-name for adsp & wcnss
      commit: 9ab813d5191f61301dbaeaf8e82d21e689b080f4
[4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable modem
      commit: d0c38cbe3556fea446b9350ec597a8e9c2cdaf36

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

