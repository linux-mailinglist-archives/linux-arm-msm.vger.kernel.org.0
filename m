Return-Path: <linux-arm-msm+bounces-3107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE108020F9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2126AB20A78
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9833C3D;
	Sun,  3 Dec 2023 04:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oabxSzuT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6E8F48;
	Sun,  3 Dec 2023 04:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBDAC433CC;
	Sun,  3 Dec 2023 04:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579128;
	bh=/JIJeJzuxeJJ1m3C+LL4Awa3Szm2BbtZgt962q8P8W8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oabxSzuTpg7EPUTh4mYPRrzf8f803JrCuDC6Fd+TM7osPWEXIyPwBgc/lT8nr5cVK
	 tOzgljsD1U8YwqD2xXQCq85ONuca72sefG5P3b9QG4IXtgDUZ1VdKVEkY5x08FqIFv
	 ZyEdi4EW7cudTKzIgwT/LZzVLCAM1gI3z2vPe2mEaWNfNKeINbr8FnLcsg1qPDOT/E
	 nOq0Bwc+aMLP6Mfj+RZju5YDDfrnorFxv6bmn78jmRVa71CW9HRS4n25kw2jzkiEpE
	 yPeUvocZTIhBIwLrdsZzLGrv2yi+3BAPLHkoYAMV3dSGY0GHk9C3kbRggqL1pEmhQ6
	 Ieq7+4QDWa5Mg==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq6018: use CPUFreq NVMEM
Date: Sat,  2 Dec 2023 20:54:54 -0800
Message-ID: <170157925830.1717511.5547305071355382777.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231021120048.231239-1-robimarko@gmail.com>
References: <20231021120048.231239-1-robimarko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Oct 2023 14:00:07 +0200, Robert Marko wrote:
> IPQ6018 comes in multiple SKU-s and some of them dont support all of the
> OPP-s that are current set, so lets utilize CPUFreq NVMEM to allow only
> supported OPP-s based on the SoC dynamically.
> 
> As an example, IPQ6018 is generaly rated at 1.8GHz but some silicon only
> goes up to 1.5GHz and is marked as such via an eFuse.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: ipq6018: use CPUFreq NVMEM
      commit: 83afcf14edb9217e58837eb119da96d734a4b3b1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

