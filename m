Return-Path: <linux-arm-msm+bounces-42576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CF9F513D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 17:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D90A9164A3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 16:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4A81F8685;
	Tue, 17 Dec 2024 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orXOPVgT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF131F867E;
	Tue, 17 Dec 2024 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734453543; cv=none; b=nw3T/bgniN8YPK14qnyhs+4rsnG+MjjCobiiOESnqjkQSdjCYG2rq0LP+cTi8mT5suvWAD37d3rRfmjQHmk4BXDSzgqNRFC5y1gsIa5u3T4tsApogMm67EqEAR04lr8hiLk7SWHG/c7kZ7QFyIoDOPg1Lr4HSD5rEalV/N+Ow7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734453543; c=relaxed/simple;
	bh=52iR4GpYbxShxZsTRbIHyyiYcmwDXoAKgVCMv70hf2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RPbpQ5pTO/xYBxePond8WnIYB44r6pEfzu8OfrGT8ziT1MrrSIfmnABxSxjZGA9uKQEFuu6262fgn0BjHmgu/Pk0k+HQgVZH7VzL/GWl8jqWE/RjvhoItD0DYJ5GIUHD61y5kBqGi/Hzoelj7YILmbYjRuRJQ6nl0Y9O8fpTCG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orXOPVgT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62628C4CEDE;
	Tue, 17 Dec 2024 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734453542;
	bh=52iR4GpYbxShxZsTRbIHyyiYcmwDXoAKgVCMv70hf2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=orXOPVgTXSbofvDNBY+KdhmyHfHwBkWLUk7NxCt3KviQIvzgP+9kDLZxBzDQ11EzA
	 uvr3GNGQRPAAhpKDNaLAKXYZ26K0f7dPOUS0K+nNymjfQd8l8/tD1+NZymcxrSfKF8
	 nwgkd2iULMY1iphi6SpbGFkrfNanm9bgVq0mix8H4/Yr501sifAAojiqoU4ddQC8v9
	 hxD8n5gCMH4yn4hmVNtnJM2Z1WjLxr+87TIra4UTCljUYTdASteU3yQGdQcnpHkmi5
	 WIIkqFW2fWyiJAZCxnpjcvw6n34zcV5oCya6UIDgThc48oci3G3XQ6tfPuuHqW+Al2
	 X6jvt/kTPAf7Q==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Qiang Yu <quic_qianyu@quicinc.com>
Cc: johan@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com,
	quic_mrana@quicinc.com,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH 1/1] arm64: dts: qcom: x1e80100: Fix up BAR space size for PCIe6a
Date: Tue, 17 Dec 2024 10:38:54 -0600
Message-ID: <173445353302.470882.8616229131234263005.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241113080508.3458849-1-quic_qianyu@quicinc.com>
References: <20241113080508.3458849-1-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 13 Nov 2024 00:05:08 -0800, Qiang Yu wrote:
> As per memory map table, the region for PCIe6a is 64MByte. Hence, set the
> size of 32 bit non-prefetchable memory region beginning on address
> 0x70300000 as 0x3d00000 so that BAR space assigned to BAR registers can be
> allocated from 0x70300000 to 0x74000000.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Fix up BAR space size for PCIe6a
      commit: fb8e7b33c2174e00dfa411361eeed21eeaf3634b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

