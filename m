Return-Path: <linux-arm-msm+bounces-57832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB3DAB6A39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8A8C8C3995
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C7E27B4F1;
	Wed, 14 May 2025 11:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r82oBJfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6019C27A91A;
	Wed, 14 May 2025 11:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222661; cv=none; b=t4dIqY38mM02D7+xo3fr3yLfWQNOBSX+QS2C/3Rj+FgyrrkzxgiZ6Z8owjtAwhdU0x0NqfR8o8/vvCDt9ZoJj9lzaNabo3O40RlGCCv0DcNvlwQFeYAUK8BB39ONroFQjbmyLi21Qnig7ih5rwPjPkISVFiSA6H1HvRTV8bMbik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222661; c=relaxed/simple;
	bh=nHQOZYmbI/4ct4CBLqfNfvzIFv0fI2toaT4deYFmMOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UIs7AWC+dXT+I5QfxxqvJEUzAXpSed3b/muiuS6rFHJmWnuzlCUMJ4Y3xEtalUgAkJd869BWsvuqO7HZtEyXvsaSymgaEWM0oxZ7sW5UehOdVqKxB/KTf1nboa9cecWjUKOl3Obt2OUu91BR4vywK4aSnJcpinLHDJZY1u4vdkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r82oBJfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60529C4CEF4;
	Wed, 14 May 2025 11:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222660;
	bh=nHQOZYmbI/4ct4CBLqfNfvzIFv0fI2toaT4deYFmMOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r82oBJfpP9WiBmJ3vF6vqtpXCdXxLBgwvnil/LbS08zqtFLMePpT7SelCKQwIpQwn
	 Fqj75fpMrgtXmtDM82/QxW/IgdFXNHRtvuFfmmQD8bQp0fMKOiD4S0OHfemel3N20b
	 AwGgOh3s9f3D87Ls0Ts2XKhplZdk8JOum9Vr+14GxdXhkUMyjLSw3G0xkk6v/YzK+L
	 Q3Dt50kSqN5oxU5DVjecq42bbaFpfxDALfyxf1DnoTnKVF4fJTyXtGGjcNSzbeuEbP
	 M1fztMjtfiWNt5mH2ADbB4y0Atixja/lLfnVKOsaC4nng3xE5XKqfq6IGQEDctJp//
	 eRLaEaSSt2GAw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
References: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Reuse the IPQ6018 QUSB2 PHY settings for
 IPQ5424
Message-Id: <174722265904.85510.2115353055770936721.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 15 Apr 2025 09:52:49 +0530, Kathiravan Thirumoorthy wrote:
> With the current settings, compliance tests are failing, especially eye
> diagram (Host High-speed Signal Quality) tests. Reuse the IPQ6018
> settings, as mentioned in the Hardware Design Document.
> 
> Merge Strategy:
> --------------
> Both the patch in the series should be merged together to avoid breaking
> the USB feature.
> 
> [...]

Applied, thanks!

[1/2] Revert "phy: qcom-qusb2: add QUSB2 support for IPQ5424"
      commit: 8a040e13afd94a1f91acaf8e0505769d4f7f5af4
[2/2] phy: qcom-qusb2: reuse the IPQ6018 settings for IPQ5424
      commit: 25c36b54eafc98b3ef004e2037cea1328d9b8bc5

Best regards,
-- 
~Vinod



