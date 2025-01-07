Return-Path: <linux-arm-msm+bounces-44186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE8A046BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBFA81888696
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848711F8AD0;
	Tue,  7 Jan 2025 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOB5Ar0R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2DD1F0E43;
	Tue,  7 Jan 2025 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267962; cv=none; b=nZ+CZ6+HjYjbZDdOXLFMyNDNZM2T4C53SW+zgHA9ZAggSLQHafljkGA7wjO5vf+ZsaTpnuci/vcHMLGrYCcFhXbvzKCOUbpJyJYmszAB7ZaM5kxpnoMCmX7Fh+aXnuJoCfHRpcj3c/FosIspDKUu5Mc+CtXMGy6nkDAM5TW6WUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267962; c=relaxed/simple;
	bh=Og17aQfMs/Pi7/VxGysEsjnZf/Sb0M1c/W91cBS434M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o0JbD/dG+RJf4z7M1KjhkhZkj05RUb96mRkBrmyHpCpYHfAeeikyjL6lz3FEY8Y3/MptqQjazKK8irOEI8R0ebXxqm0PXHWEc7lx+sc+CBsKuybrurj6FsNyeaATIpR4/Ye7TBsJkn25R4L6LmarBkbfJwaSqxp7suzI2aiOfPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOB5Ar0R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1407AC4CEE5;
	Tue,  7 Jan 2025 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267961;
	bh=Og17aQfMs/Pi7/VxGysEsjnZf/Sb0M1c/W91cBS434M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOB5Ar0RlH6U0qnZVHtrmdRhloXCx38fu+CP5mWvHCB7o5vu73q2qkgXGUlXFFDaN
	 1g0pP2+J0u5JXk8pbQ9sySPd/Mot6WgvWOjDgD8iyPVb0zvHWyIK7zXGtR/QRPOmsC
	 i19kq6Jnkpb5zQfvFJfZHsgkPzA8NpjqzQTsMH4VclwJB8tmXGvaiD8ZzLCkqmFU2T
	 Rek9HiF+FmGkfYG570AvxPXmRdEI+qPRwV9RqVEpKAkJm3zxyU3gJDetD6VfdrEPPh
	 l2DWsh34gHdZkSqiFKx5y6Fn1GQrJ7vHcD5UYC53WKF2Erf12dgNLfzIbtdUYpGawd
	 OQOX2v8vcGBpg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_varada@quicinc.com,
	quic_srichara@quicinc.com
Subject: Re: [PATCH v4 0/2] Add SPI support for IPQ5424
Date: Tue,  7 Jan 2025 10:38:50 -0600
Message-ID: <173626793389.69400.14452849584207802554.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103063708.3256467-1-quic_mmanikan@quicinc.com>
References: <20250103063708.3256467-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Jan 2025 12:07:06 +0530, Manikanta Mylavarapu wrote:
> Add SPI nodes to the IPQ5424 device tree and update the
> GPIO pin mappings accordingly.
> 
> Changes in V4:
> 	- Drop patches #1 to #4 of V3 due to the reversion of the
> 	  'renaming of spi0 to spi4' and adhere to the existing
> 	  naming convention such as spi0 and spi1.
> 	- Add spi1 node.
> 	- Detailed change logs are added to the respective patches.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: ipq5424: add spi nodes
      commit: 524ba3abe726fd7207f1d187429f7ce552d6758e
[2/2] arm64: dts: qcom: ipq5424: configure spi0 node for rdp466
      commit: 70c325ef6c979e5308edd7ef04077ceb6659d340

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

