Return-Path: <linux-arm-msm+bounces-20870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD478D2A6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B71BB279BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B41015FCFE;
	Wed, 29 May 2024 02:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UL9XwjE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69815FCE6;
	Wed, 29 May 2024 02:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948143; cv=none; b=bMPlB5xvQC9n2HImDlG6M7dakfDhjWrUWWxsd8gdpL9y2RyfigKYBUubJhd30+WZAJKmigPeWyLa7/JzohpH4jiMv29ZEnB11Lut3EtIUZ78fv2t+EBcbpjxdVTDB1VSrm0U92QoUkxv5knk4b0W/DL144Fg5XF/AQ2Y8DnZc04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948143; c=relaxed/simple;
	bh=V404aHdx2U3Q0Vn5oa8ps011P0X398ZJXi6ZquHMEME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/whJSBHKBtiriAQoiaTpn9zzWVmxJ5OXircNJMPBuZnJhe6k9Fp89+nwkhV/CkVTr1IRcl/jKjhr0RS6dgl1j4EOB40WCLduabdfBobyVw0YXTdZi4bm1f5zjQtE0oHRdVXo6Vtux6oGhftRx1WVQ0uuenkmIZcEW9+rxcq80E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UL9XwjE8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B64C32782;
	Wed, 29 May 2024 02:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948143;
	bh=V404aHdx2U3Q0Vn5oa8ps011P0X398ZJXi6ZquHMEME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UL9XwjE8HKtrJ56LaRA5p24aeEpCi/fsE18udMQgFWPKlo3vnVxICIJU5H6czVauI
	 P7qe15Hbb3JW2KcaQMdFdhjZjap0NLnJL0/3FvhhRX/92tZEKcW3EpFLhAmVuL7DyB
	 CGfZ7fCfsWZmKYBuNlNe36DJSB/Dwp5mvQIfeUSXjCA24WALdxt4kKR+ZXCMDZdywx
	 1k/CZlZEugdWFdJvn54VAw6BF2mR8Q8Act5eQkG19TqvvZG9TjwZKdSLdcRn+NRwj1
	 rsVSZPEYipWQxoez/xwc9Ez4r6J+BKxGTjU5lB+vIoq970N7Anz//zzkoF9vInsghu
	 mP3CNTAH1BpgQ==
From: Bjorn Andersson <andersson@kernel.org>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	Georgi Djakov <quic_c_gdjako@quicinc.com>
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konrad.dybcio@linaro.org,
	robdclark@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	quic_cgoldswo@quicinc.com,
	quic_sukadev@quicinc.com,
	quic_pdaly@quicinc.com,
	quic_sudaraja@quicinc.com,
	djakov@kernel.org
Subject: Re: (subset) [PATCH v8 0/7] Add support for Translation Buffer Units
Date: Tue, 28 May 2024 21:01:58 -0500
Message-ID: <171694812092.574781.5777467334806217391.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417133731.2055383-1-quic_c_gdjako@quicinc.com>
References: <20240417133731.2055383-1-quic_c_gdjako@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Apr 2024 06:37:24 -0700, Georgi Djakov wrote:
> The TCUs (Translation Control Units) and TBUs (Translation Buffer
> Units) are key components of the MMU-500. Multiple TBUs are connected
> to a single TCU over an interconnect. Each TBU contains a TLB that
> caches page tables. The MMU-500 implements a TBU for each connected
> master, and the TBU is designed, so that it is local to the master.
> A common TBU DT schema is added to describe the TBUs.
> 
> [...]

Applied, thanks!

[5/7] arm64: dts: qcom: sdm845: Add DT nodes for the TBUs
      commit: 7bb38c20f2b64a65423e64e6765bd70a5eadee81
[7/7] arm64: dts: qcom: sc7280: Add DT nodes for the TBUs
      commit: d1f2b41e96f5d1c2241ef3740a5829d2f9979273

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

